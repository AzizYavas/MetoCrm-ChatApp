<?php

use Illuminate\Support\Facades\Broadcast;

// Broadcast::channel('room.{roomId}', function ($user, $roomId) {
//     // Kullanıcının odaya erişim izni olup olmadığını kontrol edin
//     return true; // Burada daha karmaşık bir kontrol yapılabilir
// });


// Broadcast::channel('messages', function ($user) {
//     return true;
// });

Broadcast::channel('room.{roomId}', function ($user, $roomId) {
    // Oda ID'si ile birlikte yetkilendirme yapabilirsiniz
    // Kullanıcıya oda erişimi kontrolü yapılabilir
    return true; // Bu örnekte herkes erişebilir
});

Broadcast::channel('allmessages', function ($userData) {
    return true; // Erişim izni, gerektiğinde kontrol ekleyebilirsiniz
});

Broadcast::channel('allrooms', function ($user) {
    return true;
});