<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendMailUser extends Mailable
{
    use Queueable, SerializesModels;
    public $mailData;
    public $assunto;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($mailData, $assunto)
    {
        $this->mailData = $mailData;
        $this->assunto = $assunto;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('email.sendEmail')
            ->subject($this->assunto)
            ->with('mailData', $this->mailData);
    }
}
