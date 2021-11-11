<?php

namespace App\View\Components;

use App\Models\Dimension;
use App\Models\Eixo;
use App\Models\Post;
use Illuminate\View\Component;

class WelcomeLogado extends Component
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
        $dimensions = Dimension::all();
        $posts = Post::orderBy('created_at', 'DESC')->take(3)->get();
        return view('components.welcome-logado', compact('dimensions', 'posts'));
    }
}
