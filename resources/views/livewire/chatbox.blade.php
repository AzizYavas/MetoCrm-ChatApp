<?php

use App\Events\MessageSent;
use App\Events\RoomEvent;
use App\Models\Message;
use App\Models\Room;
use App\Models\RoomUser;
use Livewire\Attributes\On;
use Livewire\Volt\Component;

new class extends Component
{
    public $messages = [];
    public string $message = '';
    public $rooms;
    public ?int $selectedRoom = null;
    public string $newRoomName = '';
    public $allRomms = [];

    protected $listeners = ['messageSent' => 'handleMessageSent', 'updateRooms' => 'handleUpdateRooms'];

    public function mount()
    {
        // Kullanıcıya bağlı odaları yükle
        if (auth()->user()->is_admin) {
            $this->rooms = Room::all();
        } else {
            $roomIds = RoomUser::where('user_id', auth()->id())->pluck('room_id');

            $this->rooms = Room::where('created_by', auth()->id())
                ->orWhereIn('id', $roomIds)
                ->get();

            // $this->allRooms = Room::where('created_by', auth()->id())
            //     ->orWhereIn('id', $roomIds)
            //     ->get();

            $this->allRooms = $this->rooms; // allRooms'ı doğru şekilde ayarla
        }

        $this->selectedRoom = $this->rooms->first()->id ?? null;
        $this->loadMessages(); // İlk odaya ait mesajları yükle
    }

    public function handleUpdateRooms($data)
    {
        $this->allRooms = $data;
    }

    public function updatedSelectedRoom($value)
    {
        $this->loadMessages(); // Yeni seçilen odaya ait mesajları yükle
    }

    public function addMessage()
    {
        Message::create([
            'user_id' => auth()->id(),
            'room_id' => $this->selectedRoom,
            'message' => $this->message,
        ]);

        MessageSent::dispatch($this->selectedRoom, auth()->user()->name, $this->message);

        $this->reset('message');
        $this->loadMessages();
    }

    public function createRoom()
    {
        Room::create([
            'name' => $this->newRoomName,
            'created_by' => auth()->id(),
        ]);

        $this->rooms = Room::where('created_by', auth()->id())->get();
        $this->newRoomName = '';
        $this->selectedRoom = $this->rooms->last()->id; // Yeni oluşturulan odayı seç
        $this->loadMessages(); // Yeni odaya ait mesajları yükle
    }

    public function loadMessages()
    {
        if ($this->selectedRoom) {
            $this->messages = Message::where('room_id', $this->selectedRoom)
                ->with('user')
                ->get()
                ->map(function ($message) {
                    return [
                        'name' => $message->user->name,
                        'text' => $message->message,
                        'room' => $message->room->name // Oda adını ekleyin (room tablosunda ad sütunu olduğunu varsayıyoruz)
                    ];
                });
        }
    }

    public function handleMessageSent($event)
    {
        if (isset($event['room_id']) && $event['room_id'] === $this->selectedRoom) {
            $exists = $this->messages->contains(function ($message) use ($event) {
                return $message['name'] === $event['name'] && $message['text'] === $event['text'];
            });

            if (!$exists) {
                $this->messages->push([
                    'name' => $event['name'],
                    'text' => $event['text']
                ]);
            }
        } else {
            \Log::info('Gelen Olay Verisi:', $event);
        }
    }
};

?>
<div x-data="{ open: false, selectedRoom: @entangle('selectedRoom'), showModal: false }">
    <!-- Chatbox Section -->
    <div :class="{'-translate-y-0': open, 'translate-y-full': !open}" class="fixed transition-all duration-300 transform bottom-12 right-12 h-80 w-80">
        <div class="mb-2">
            <button @click="open = !open"
                type="button"
                :class="{ 'text-indigo-600 dark:text-white hover:bg-transparent': open }"
                class="w-full text-start flex items-center gap-x-3.5 py-2 px-2.5 text-sm text-white rounded-lg bg-black hover:bg-indigo-900 dark:bg-black dark:hover:bg-indigo-400">
                Mesajlar
                <svg x-show="!open" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                </svg>
                <svg x-show="open" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
                </svg>
            </button>
        </div>
        <div class="w-full h-full bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-700 rounded overflow-auto flex flex-col px-2 py-4">
            <!-- Room Selector -->
            <div class="mb-2">
                <label for="roomSelect" class="block text-sm font-medium text-white">Oda Listesi</label>
                <select id="roomSelect" class="block w-full mt-1 border-gray-300 rounded-md shadow-sm" wire:model="selectedRoom" @change="$wire.set('selectedRoom', $event.target.value)">
                    @foreach($rooms as $room)
                    <option value="{{ $room->id }}">{{ $room->name }}</option>
                    @endforeach
                </select>
            </div>

            <!-- Dinamik room-id için meta etiketi -->
            <meta name="room-id" content="{{ $selectedRoom }}" />

            <div x-ref="chatBox" class="flex-1 p-4 text-sm flex flex-col gap-y-1">
                @foreach($messages as $message)
                <div><span class="text-indigo-600">{{ $message['name'] }}:</span> <span class="dark:text-white">{{ $message['text'] }}</span></div>
                @endforeach
            </div>
            <div>
                <form wire:submit.prevent="addMessage" class="flex gap-2">
                    <x-text-input wire:model="message" x-ref="messageInput" name="message" id="message" class="block w-full" />
                    <x-primary-button>
                        Gönder
                    </x-primary-button>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal for Creating New Room -->
    <div x-show="showModal" @click.away="showModal = false" class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50" x-transition>
        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-lg relative">
            <h2 class="text-lg font-semibold mb-4 text-black">Yeni Sohbet Odası Ekle</h2>
            <button @click="showModal = false" class="absolute top-2 right-2 text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
            <form wire:submit.prevent="createRoom">
                <x-text-input wire:model="newRoomName" placeholder="Oda Adı" class="block w-full mb-4" />
                <x-primary-button type="submit">Ekle</x-primary-button>
            </form>
        </div>
    </div>

    <!-- Button to Show Modal -->
    <button @click="showModal = true" class="fixed bottom-2 left-10 bg-indigo-600 text-white p-3 rounded-full">
        Yeni Oda Ekle
    </button>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        function setupRoomListener(roomId) {
            console.log('Dinleyici başlatılıyor, Room ID:', roomId);

            if (window.currentEchoChannel) {
                window.currentEchoChannel.stopListening('MessageSent');
            }

            window.currentEchoChannel = window.Echo.private(`room.${roomId}`)
                .listen('MessageSent', (e) => {
                    console.log('Yeni Mesaj:', e);
                    if (e.room_id === parseInt(roomId)) {
                        const chatBox = document.querySelector('[x-ref="chatBox"]');
                        if (chatBox) {
                            chatBox.innerHTML += `<div><span class="text-indigo-600">${e.name}:</span> <span class="dark:text-white">${e.text}</span></div>`;
                        }
                        const chatBoxList = document.querySelector(`[x-ref="chatBox-${roomId}"]`);
                        if (chatBoxList) {
                            chatBoxList.innerHTML += `<li><strong class="text-black">${e.name}:</strong> <p class="text-black">${e.text}</p></li>`;
                        }
                    }
                });
        }

        function updateRoomId(newRoomId) {
            const roomIdElement = document.querySelector('meta[name="room-id"]');
            if (roomIdElement) {
                roomIdElement.setAttribute('content', newRoomId);
            } else {
                console.error('Room ID meta etiketi bulunamadı.');
            }
            setupRoomListener(newRoomId);
        }

        const roomSelectElement = document.getElementById('roomSelect');
        if (roomSelectElement) {
            roomSelectElement.addEventListener('change', function(event) {
                const newRoomId = event.target.value;
                console.log('Oda değiştirildi, yeni Room ID:', newRoomId);
                updateRoomId(newRoomId);
            });
        }

        const initialRoomId = document.querySelector('meta[name="room-id"]').getAttribute('content');
        if (initialRoomId) {
            setupRoomListener(initialRoomId);
        } else {
            console.error('Başlangıç Room ID meta etiketi bulunamadı.');
        }
    });
</script>