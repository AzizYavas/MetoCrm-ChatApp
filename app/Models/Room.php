<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;

    protected $table = 'rooms';

    protected $fillable = ['name', 'created_by'];

    public function users()
    {
        return $this->belongsToMany(User::class, 'room_user');
    }

    public function messages()
    {
        return $this->hasMany(Message::class);
    }

}
