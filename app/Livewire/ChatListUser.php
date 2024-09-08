<?php

namespace App\Livewire;

use App\Models\Room;
use App\Models\RoomUser;
use App\Models\User;
use Livewire\Component;

class ChatListUser extends Component
{
    public $users = [];
    public $rooms = [];
    public $selectedRoomId = [];

    public function mount()
    {
        $this->loadUsers();
        $this->loadRooms();
        
        // Kullanıcıların mevcut odalarını yükle
        foreach ($this->users as $user) {
            // Kullanıcının ilk kaydolduğu oda varsa, bu odayı seçili hale getir
            $this->selectedRoomId[$user->id] = $user->rooms->first()->id ?? null;
        }
    }

    public function loadUsers()
    {
        $this->users = User::where('is_admin', 0)->whereNot('id', auth()->id())->get();
    }

    public function loadRooms()
    {
        $this->rooms = Room::where('created_by', auth()->user()->id)->get();

        // Room::where('created_by', '!=', auth()->user()->id)
        // ->orderBy('created_at', 'ASC')
        // ->get();
    }

    public function addUserToRoom($userId)
    {
        $roomId = $this->selectedRoomId[$userId] ?? null;

        if ($roomId) {
            RoomUser::updateOrCreate(
                ['room_id' => $roomId, 'user_id' => $userId],
                ['created_at' => now()] // Zaman bilgisini ekleyin
            );
            $this->loadUsers(); // Kullanıcıların güncellenmiş listesini yükleyin
        }
    }

    public function removeUserFromRoom($userId)
    {
        $roomId = $this->selectedRoomId[$userId] ?? null;

        if ($roomId) {
            RoomUser::where('room_id', $roomId)
                ->where('user_id', $userId)
                ->delete();
            
            // Kullanıcının odadan çıkarıldığı durumda seçili oda sıfırlanır
            $this->selectedRoomId[$userId] = null;

            $this->loadUsers(); // Kullanıcıların güncellenmiş listesini yükleyin
        }
    }

    public function isUserInRoom($userId, $roomId)
    {
        return RoomUser::where('room_id', $roomId)
                       ->where('user_id', $userId)
                       ->exists();
    }

    public function render()
    {
        return view('livewire.chat-list-user');
    }
}
