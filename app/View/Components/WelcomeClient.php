<?php

namespace App\View\Components;

use App\Models\Post;
use Illuminate\View\Component;

class WelcomeClient extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        $posts = Post::where('publica', '=', 's')->orderBy('created_at', 'DESC')->take(3)->get();
        return view('components.welcome-client', compact('posts'));
    }
}
