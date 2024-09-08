<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoomUser extends Model
{
    use HasFactory;

    protected $table = 'room_user';
    protected $fillable = ['room_id', 'user_id'];
    public $timestamps = true;

    // public function room()
    // {
    //     return $this->belongsTo(Room::class);
    // }

    // public function user()
    // {
    //     return $this->belongsTo(User::class);
    // }
}
