<?php

namespace App\Console\Commands;

use App\Events\MessageSent;
use Illuminate\Console\Command;

use function Laravel\Prompts\text;

class SendMessageCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'send:message';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Mesaj Kanka';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $name = text(
            label: 'Adınız',
            required: true
        );

        $text = text(
            label: 'Mesajın lan',
            required: true
        );

        MessageSent::dispatch($name, $text);

    }
}
