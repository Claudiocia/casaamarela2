<?php

namespace App\Models;

use Bootstrapper\Interfaces\TableInterface;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

/**
 * Class Post.
 *
 * @package namespace App\Models;
 */
class Post extends Model implements Transformable, TableInterface
{
    use TransformableTrait;
    use SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'titulo', 'data', 'resumo', 'texto', 'foto_nome',
        'foto_legenda', 'foto_path', 'publica', 'categoria_id',
        'user_id', 'positivo', 'negativo',
    ];

    public function getTableHeaders()
    {
        return [];
    }

    public function getValueForHeader($header)
    {
        switch ($header){
            case 'Data':
               return Carbon::parse($this->data)->format('d/m/Y');
            case 'Titulo':
               // return $this->titulo;
            case 'Autor':
               // return $this->user->name;
            case 'Pub':
               // return $this->publica;
        }
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
}
