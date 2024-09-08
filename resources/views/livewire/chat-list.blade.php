<div>
    <div class="container mx-auto p-4">
        <h1 class="text-2xl font-bold mb-4">Sohbet Odaları</h1>

        <!-- Accordion başlangıcı -->
        <div x-data="{ openRooms: {} }" class="space-y-4">
            @foreach($roomsChatList as $room)
            <div>
                <!-- Oda adı -->
                <button
                    @click="openRooms[{{ $room->id }}] = !openRooms[{{ $room->id }}]"
                    class="w-full bg-blue-500 text-white p-4 rounded-md text-left">
                    {{ $room->name }}
                </button>

                <!-- Mesajları göster -->
                <div x-show="openRooms[{{ $room->id }}]" class="mt-2 p-4 bg-gray-100 rounded-md" x-transition>
                    <h2 class="font-semibold text-lg">Mesajlar</h2>
                    <ul class="space-y-2" x-ref="chatBox-{{ $room->id }}">
                        @forelse($room->messages as $message)
                        <li class="text-dark">
                            <strong class="text-black">{{ $message->user->name }}:</strong> <!-- Mesajı gönderen kullanıcının adı -->
                            <p class="text-black">{{ $message->message }}</p> <!-- Mesaj içeriği -->
                        </li>
                        @empty
                        <li>Bu odada henüz mesaj yok.</li>
                        @endforelse
                    </ul>
                </div>
            </div>
            @endforeach
        </div>
        <!-- Accordion sonu -->
    </div>
</div>
