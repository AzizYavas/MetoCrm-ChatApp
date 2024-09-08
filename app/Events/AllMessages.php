<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class AllMessages implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $roomId;
    public $userName;
    public $message;

    public function __construct($roomId, $userName, $message)
    {
        $this->roomId = $roomId;
        $this->userName = $userName;
        $this->message = $message;
    }

    public function broadcastOn()
    {
        return new Channel('allmessages');
    }

    public function broadcastWith()
    {
        return [
            'room_id' => $this->roomId,
            'user_name' => $this->userName,
            'message' => $this->message,
        ];
    }
}
