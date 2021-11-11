<?php

namespace App\Http\Controllers;

use App\Forms\PostForm;
use App\Models\Comment;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use File;

class PostsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::orderBy('created_at', 'DESC')->paginate();
        return view('admin.posts.index' , compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $form = \FormBuilder::create(PostForm::class, [
            'url' => route('admin.posts.store'),
            'method' => 'POST',
        ]);

        return view('admin.posts.create', compact('form'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $form = \FormBuilder::create(PostForm::class);
        if (!$form->isValid()){
            return redirect()
                ->back()
                ->withErrors($form->getErrors())
                ->withInput();
        }
        $data = $form->getFieldValues();
        $tags = explode(', ', $data['tags']);
        $tagsN = array();
        unset($data['tags']);
        $post = Post::create($data);
        foreach ($tags as $tag){
            $tagn = str_replace(' ', '', $tag);
            $tagsN = ['nome' => $tagn];
            $tagConsult = Tag::where('nome', '=', $tagsN)->first();
            if($tagConsult == null){
                DB::table('tags')->insert($tagsN);
                $t = Tag::orderBy('id', 'DESC')->first();
                $post->tags()->attach($t->id);
            }
            else{
                $result = DB::table('post_tag')->where([
                    ['post_id', '=', $post->id],
                    ['tag_id', '=', $tagConsult->id]
                ])->first();
                if($result == null){
                    $post->tags()->attach($tagConsult->id);
                }
            }
        }

        $request->session()->flash('msg', 'Novo artigo cadastrado com sucesso!');
        return redirect()->route('admin.posts.index');

    }

    public function fotoUpload(Post $post)
    {
        return view('admin.posts.foto-upload', compact('post'));
    }

    public function resizeImage(Request $request)
    {
        $this->validate($request, [
            'file' => 'required|image|mimes:jpg,jpeg,png,gif,svg|max:2048',
        ]);

        $data = $request->all();
        $image = $request->file('file');

        $input['file'] = time().'.'.$image->getClientOriginalExtension();

        $destinationPath = public_path('/site/img/thumbnail');

        $imgFile = \Intervention\Image\Facades\Image::make($image->getRealPath());

        $imgFile->resize(150, 150, function ($constraint){
            $constraint->aspectRatio();
        })->save($destinationPath.'/'.$input['file']);

        $destinationPath = public_path('site/img/uploads');
        $image->move($destinationPath, $input['file']);


        $data['foto_nome'] = $input['file'];
        $data['foto_path'] = 'site/img/uploads/'.$input['file'];

        $post = Post::where('id', '=', $data['post'])
            ->update([
                'foto_nome' => $data['foto_nome'],
                'foto_legenda' => $data['foto_legenda'],
                'foto_path' => $data['foto_path'],
            ]);

        return back()->with('msg', 'Upload da Imagem feita com sucesso!')
            ->with('fileName', $input['file']);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        $comments = Comment::where([
            ['post_id', '=', $post->id],
        ])->orderBy('created_at', 'DESC')->paginate();
        $commentsCount = Comment::where([
            ['post_id', '=', $post->id],
        ])->count();
        return view('admin.posts.show', compact('post', 'comments', 'commentsCount'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        $form = \FormBuilder::create(PostForm::class,[
            'url' => route('admin.posts.update', ['post' => $post->id]),
            'method' => 'PUT',
            'model' => $post,
        ]);

        return view('admin.posts.edit', compact('form'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        $data = $request->all();
        $tags = explode(', ', $data['tags']);
        $tagsN = array();
        unset($data['tags']);
        $post->tags()->detach();
        $post->fill($data);
        $post->save();
        foreach ($tags as $tag){
            $tagn = str_replace(' ', '', $tag);
            $tagsN = ['nome' => $tagn];
            $tagConsult = Tag::where('nome', '=', $tagsN)->first();
            if($tagConsult == null){
                DB::table('tags')->insert($tagsN);
                $t = Tag::orderBy('id', 'DESC')->first();
                $post->tags()->attach($t->id);
            }
            else{
                $result = DB::table('post_tag')->where([
                    ['post_id', '=', $post->id],
                    ['tag_id', '=', $tagConsult->id]
                ])->first();
                if($result == null){
                    $post->tags()->attach($tagConsult->id);
                }
            }
        }
        $request->session()->flash('msg', 'Artigo atualizado com sucesso');
        return redirect()->route('admin.posts.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Post $post)
    {
        $foto = $post->foto_path;
        $file_thumb = 'site/img/thumbnail/'.$post->foto_nome;
        //Como estou trabalhando com softdeletes não vou apagar as imagens
        //unlink($foto);
        //unlink($file_thumb);

        $post->delete();
        $request->session()->flash('msg', 'Artigo deletado com sucesso!');
        return redirect()->route('admin.posts.index');
    }
}
