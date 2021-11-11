<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use App\Models\Comment;
use App\Models\Dimension;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

class CasaAmarelaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::where('publica', '=', 's')->orderBy('data', 'DESC')->take(3)->get();
        return view('welcome', compact('posts'));
    }

    public function portDetails()
    {
        return view('portfolio-details');
    }

    public function blog(Request $request)
    {
        $search = $request->get('search');
        if ($search == null){
            if(!$_GET['cat'] && !$_GET['tag']){
                $categories = Categoria::all();
                $tags = Tag::all();
                $recentPosts = Post::where('publica', '=', 's')->orderBy('created_at', 'DESC')->take(5)->get();
                $posts = Post::where('publica', '=', 's')->orderBy('created_at', 'DESC')->paginate(5);
                return view('blog', compact('posts', 'categories', 'tags', 'recentPosts'));
            }
            elseif($_GET['cat'] != null ){

                $id = $_GET['cat'];
                $categories = Categoria::all();
                $tags = Tag::all();
                $recentPosts = Post::where('publica', '=', 's')->orderBy('created_at', 'DESC')->take(5)->get();
                $posts = Post::where([
                    ['publica', '=', 's'],
                    ['categoria_id', '=', $id]])->orderBy('created_at', 'DESC')->paginate(5);
                return view('blog', compact('posts', 'categories', 'tags', 'recentPosts'));

            }elseif($_GET['tag'] != null ){
                $tag = intval($_GET['tag']);
                //$tug = Tag::with('posts')->where('id', '=', $tag)->find(1);
                $categories = Categoria::all();
                $tags = Tag::all();
                $recentPosts = Post::where('publica', '=', 's')->orderBy('created_at', 'DESC')->take(5)->get();
                $posts = Post::with('user', 'categoria', 'tags')
                    ->join('post_tag AS pt', 'posts.id', '=', 'pt.post_id')
                    ->join('tags AS t', 't.id', '=', 'pt.tag_id')
                    ->where([
                        ['t.id', '=', $tag],
                        ['posts.publica', '=', 's']
                    ])
                    ->orderBy('posts.created_at', 'DESC')
                    ->paginate(5);
                return view('blog', compact('posts', 'categories', 'tags', 'recentPosts'));
            }
        }else{
            $categories = Categoria::all();
            $tags = Tag::all();
            $recentPosts = Post::where('publica', '=', 's')->orderBy('created_at', 'DESC')->take(5)->get();
            $posts = Post::where([
                ['publica', '=', 's'],
                ['texto', 'like', '%'.$search.'%']])->orderBy('created_at', 'DESC')->paginate(5);

            return view('blog', compact('posts', 'categories', 'tags', 'recentPosts'));
        }
    }

    public function blogSingle(Post $post)
    {
        $categories = Categoria::all();
        $posts = Post::where('publica', '=', 's')->orderBy('data', 'DESC')->take(5)->get();
        $tagis = Tag::all();
        $comments = Comment::where([
            ['post_id', '=', $post->id],
            ['publica', '=', 's'],
        ])->orderBy('created_at', 'DESC')->paginate();
        $commentsCount = Comment::where([
            ['post_id', '=', $post->id],
            ['publica', '=', 's'],
        ])->count();
        return view('blog-single', compact('post', 'categories', 'posts', 'tagis', 'comments', 'commentsCount'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Post $post
     * @return \Illuminate\Http\Response
     */
    public function updatePost(Request $request, Post $post)
    {
        $data = $request->all();
        if ($data['action'] == 'positivo'){
            $post->positivo++;
            $post->save();
        }elseif ($data['action'] == 'negativo'){
            $post->negativo++;
            $post->save();
        }
        $request->session()->flash('msg', 'Obrigado por sua interação');
        return redirect()->back();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
