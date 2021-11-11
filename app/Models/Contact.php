<?php

namespace App\Models;

use Bootstrapper\Interfaces\TableInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

/**
 * Class Contact.
 *
 * @package namespace App\Models;
 */
class Contact extends Model implements Transformable, TableInterface
{
    use TransformableTrait;
    use SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name' , 'email', 'phone' , 'subject' , 'message', 'status', 'role'];

    public function getTableHeaders()
    {
        return ['Nome', 'Email', 'Fone', 'Assunto', 'Status'];
    }

    public function getValueForHeader($header)
    {
        switch ($header){
            case 'Nome':
                return $this->name;
            case 'Email':
                return $this->email;
            case 'Fone':
                return $this->phone;
            case 'Assunto':
                return $this->subject;
            case 'Status':
                return $this->status == 'n' ? 'Não lida' : 'Lida';
        }
    }
}
