<?php

namespace App\Models;

use Bootstrapper\Interfaces\TableInterface;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

/**
 * Class Comment.
 *
 * @package namespace App\Models;
 */
class Comment extends Model implements Transformable, TableInterface
{
    use TransformableTrait;
    use SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nome', 'email', 'comentario', 'publica', 'data',
        'positivo', 'negativo', 'post_id',
    ];

    public function post()
    {
        return $this->belongsTo(Post::class);
    }

    public function getTableHeaders()
    {
        return ['Data', 'Autor', 'Artigo', 'Status', '++', '--'];
    }

    public function getValueForHeader($header)
    {
        switch ($header){
            case 'Data':
                return Carbon::parse($this->data)->format('d/m/Y');
            case 'Autor':
                return $this->nome;
            case 'Artigo':
                return substr($this->post->titulo, 0, 50);
        }
    }
}
