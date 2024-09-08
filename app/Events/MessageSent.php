<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MessageSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $userName;
    public $message;
    public $roomId;

    /**
     * Create a new event instance.
     */
    public function __construct($roomId, $userName, $message)
    {
        $this->roomId = $roomId;
        $this->userName = $userName;
        $this->message = $message;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel
     */
    public function broadcastOn()
    {
        return new PrivateChannel("room.{$this->roomId}");
    }

    public function broadcastWith()
    {
        return [
            'name' => $this->userName,
            'text' => $this->message,
            'room_id' => $this->roomId, // Burada oda ID'si eklenmeli
        ];
    }
}
