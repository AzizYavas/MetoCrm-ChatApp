<?php

namespace App\Http\Livewire;

use App\Events\MessageSent;
use App\Models\Message;
use App\Models\Room;
use Livewire\Component;

class Chatbox extends Component
{
    public array $messages = [];
    public string $message = '';
    public int $room_id = 0;
    public array $rooms = []; // Odaların listesi

    public function mount()
    {
        // Odaları yükle
        $this->rooms = Room::all();
    }

    public function addMessage()
    {
        // Mesajı veritabanına kaydet
        $savedMessage = Message::create([
            'room_id' => $this->room_id, // Dinamik oda ID'si kullanılıyor
            'user_id' => auth()->id(),
            'message' => $this->message,
        ]);

        // Olayı yayınla
        MessageSent::dispatch(auth()->user()->name, $this->message, $this->room_id);

        // Mesaj kutusunu temizle
        $this->reset('message');
    }

    public function selectRoom()
    {
        // Oda seçildiğinde yapılacak işlemler
        // (Örneğin, seçilen oda ID'sine göre mesajları güncelleme)
    }

    protected function getListeners()
    {
        return [
            "echo-private:messages.rooms.{$this->room_id},MessageSent" => 'onMessageSent',
        ];
    }

    public function onMessageSent($event)
    {
        // Mesajları güncelle
        $this->messages[] = $event;
    }

    public function render()
    {
        return view('livewire.chat'); // Bu dosya chat bileşeni için Blade dosyasının yolunu belirtir
    }
}

?>