import Echo from 'laravel-echo';

import Pusher from 'pusher-js';
window.Pusher = Pusher;

window.Echo = new Echo({
    broadcaster: 'reverb',
    key: import.meta.env.VITE_REVERB_APP_KEY,
    wsHost: import.meta.env.VITE_REVERB_HOST,
    wsPort: import.meta.env.VITE_REVERB_PORT ?? 80,
    wssPort: import.meta.env.VITE_REVERB_PORT ?? 443,
    forceTLS: (import.meta.env.VITE_REVERB_SCHEME ?? 'https') === 'https',
    enabledTransports: ['ws', 'wss'],
});

// Room ID'yi backend'den almanız gerekecek, örneğin bir veri değişkeni veya meta tag aracılığıyla
// const roomId = document.querySelector('meta[name="room-id"]').getAttribute('content');

// window.Echo.private(`room.${roomId}`)
//     .listen('MessageSent', (e) => {
//         console.log('Yeni Mesaj:', e);
//         console.log('Kankaaaaaaa',roomId);
//         if (e.room_id === parseInt(roomId)) {
//             console.log('Kankaaaaaaa');
//         }
//     });

window.Echo.channel('allrooms')
    .listen('RoomEvent', (event) => {
        console.log('RoomEvent received:', event);
        // Gelen veriyi işleyin
        // Örneğin, Livewire bileşenine veri iletmek
        Livewire.emit('updateRooms', event.data);
    });