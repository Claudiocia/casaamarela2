<?php

namespace App\Models;

use Bootstrapper\Interfaces\TableInterface;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Sanctum\HasApiTokens;

/**
 * App\Models\User
 *
 * @property-read string $profile_photo_url
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection|\Illuminate\Notifications\DatabaseNotification[] $notifications
 * @property-read int|null $notifications_count
 * @property-read \Illuminate\Database\Eloquent\Collection|\Laravel\Sanctum\PersonalAccessToken[] $tokens
 * @property-read int|null $tokens_count
 * @method static \Database\Factories\UserFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|User newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|User newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|User query()
 * @mixin \Eloquent
 */
class User extends Authenticatable implements TableInterface, MustVerifyEmail
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use Notifiable;
    use SoftDeletes;

    const ROLE_ADMIN = 1;
    const ROLE_STAFF = 2;
    const ROLE_REDAT = 3;
    const ROLE_CLIENTE = 4;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'matricula',
        'tipo',  'role', 'genero', 'nome_social', 'raca', 'celular',
        'municipio_id', 'departamento_id', 'curso_id', 'campus_id',
        'mod_curso', 'tipo_curso', 'autoriz',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'profile_photo_url',
    ];

    public function getTableHeaders()
    {
        return ['Nome', 'Segmento', 'Lotação', 'Telefone', 'Status'];
    }

    public function getValueForHeader($header)
    {
        switch ($header){
            case 'Nome':
                return $this->name;
            case 'Segmento':
                if($this->tipo == 'a'){
                    return 'Discente';
                }elseif ($this->tipo == 't'){
                    return 'Tecnico';
                }else{
                    return 'Docente';
                }
            case 'Lotação':
                return $this->campus->nome.' - '.$this->departamento->sigla;
            case 'Telefone':
                return $this->celular;
            case 'Status':
                if ($this->role == 1 || $this->role == 2){
                    return 'Staff';
                }elseif ($this->role == 3){
                    return 'Redator';
                }else{
                    return 'Cadastrado';
                }
        }
    }

    public function departamento()
    {
        return $this->belongsTo(Departamento::class);
    }

    public function municipio()
    {
        return $this->belongsTo(Municipio::class);
    }

    public function campus()
    {
        return $this->belongsTo(Campus::class);
    }

    public function curso()
    {
        return $this->belongsTo(Curso::class);
    }

}
