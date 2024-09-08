<div>
    <div class="p-6 bg-gray-100 rounded-lg shadow-md">
        <h2 class="text-xl font-semibold mb-4 text-black">Kullanıcı Listesi</h2>
        <ul class="space-y-4">
            @foreach($users as $user)
            <li class="flex items-center space-x-4 p-4 bg-white rounded-lg shadow-sm">
                <div class="flex-1 flex items-center space-x-4">
                    <strong class="text-lg text-black">{{ $user->name }}</strong>
                    <p class="text-sm text-gray-500">
                        Son aktif:
                        @if($user->last_activity)
                            Aktif
                        @else
                            Aktif Değil
                        @endif
                    </p>
                </div>

                <select wire:model="selectedRoomId.{{ $user->id }}" class="form-select block w-48 border-gray-300 rounded-md shadow-sm">
                    <option value="">Oda Seçin</option>
                    @foreach($rooms as $room)
                    <option value="{{ $room->id }}">
                        {{ $room->name }}
                    </option>
                    @endforeach
                </select>

                @if(isset($selectedRoomId[$user->id]) && $user->rooms->contains($selectedRoomId[$user->id]))
                <button
                    wire:click="removeUserFromRoom({{ $user->id }})"
                    class="ml-2 px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-red-400">
                    Odadan Çıkar
                </button>
                @else
                <button
                    wire:click="addUserToRoom({{ $user->id }})"
                    class="ml-2 px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400">
                    Odaya Ekle
                </button>
                @endif
            </li>
            @endforeach
        </ul>
    </div>
</div>