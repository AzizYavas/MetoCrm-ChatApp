<?php

namespace App\Livewire;

use App\Models\Room;
use Livewire\Component;

class ChatList extends Component
{
    public $roomsChatList; // Odalar listesini burada tutacağız
    public array $messagesCheckList = [];

    // Bileşen yüklenirken odaları veritabanından çekeceğiz
    public function mount()
    {
        $this->roomsChatList = Room::with('messages.user')->get();
    }

    // Event dinleme
    protected $listeners = [
        'allMessages' => 'allMessages',
    ];

    public function allMessages()
    {
        // Event'in içeriğini kontrol edin ve mesajları ekleyin
        $this->messagesCheckList[] = $this->roomsChatList;
    }

    public function render()
    {
        return view('livewire.chat-list');
    }
}
