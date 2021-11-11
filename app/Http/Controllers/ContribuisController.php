<?php

namespace App\Http\Controllers;

use App\Mail\SendMailUser;
use App\Models\Contribui;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class ContribuisController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $search = $request->get('search');
        $filtro = $request->get('filtro');

        if($search == null && $filtro == null){
            $contribuis = Contribui::orderBy('lida', 'DESC')->paginate(7);
            return view('redat.contribuis.index', compact('contribuis'));
        }elseif($search == null && $filtro != null){
            $contribuis = Contribui::where('tema', '=', $filtro)->paginate(7);
            return view('redat.contribuis.index', compact('contribuis'));
        }elseif ($search != null && $filtro == null){
            $contribuis = Contribui::where('contribui', 'LIKE', '%'.$search.'%')->paginate(7);
            return view('redat.contribuis.index', compact('contribuis'));
        }elseif ($search != null && $filtro != null){
            $contribuis = Contribui::where([['tema', '=', $filtro], ['contribui', 'LIKE', '%'.$search.'%']])->paginate(7);
            return view('redat.contribuis.index', compact('contribuis'));
        }

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('contribui');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();
        //dd($data);

        if($data['user'] == null){
            Validator::make($data, [
                'name' => ['required', 'string', 'max:255'],
                'email' => ['required', 'email', 'max:255'],
                'tema' =>  ['required'],
                'contribui' => ['required'],
                ],
                [
                    'name.required' => 'Favor informar seu nome',
                    'email.required' => 'Favor informar o seu email',
                    'tema.required' => 'Favor selecionar um tema',
                    'contribui.required' => 'Faltou a sua ideia!',
                ])->validate();
        }else{
            Validator::make($data, [
                'tema' =>  ['required'],
                'contribui' => ['required'],
            ],
                [
                    'tema.required' => 'Favor selecionar um tema',
                    'contribui.required' => 'Faltou a sua ideia!',
                ])->validate();
            $data['name'] = \Auth::user()->name;
            $data['email'] = \Auth::user()->email;
            $data['phone'] = \Auth::user()->celular;
            $data['user_id'] = \Auth::user()->id;
        }
        //dd($data);
        Contribui::create($data);

        $emailTo    = $data['email'];
        $nome       = $data['name'];
        $subject    = 'Com sua ajuda construiremos uma Uneb mais plural';
        $assunto    = 'Recebemos sua contribuição';
        $date       = now();

        $mensagem  = "Olá $nome,";
        $mensagem .= "<br/><br/>";
        $mensagem .= "Muito obrigada por contribuir com sua opinião e/ou sugestões! Sua mensagem será encaminhada e, caso seja necessário, responderemos o mais breve possível.";
        $mensagem .= "<br/><br/>";
        $mensagem .= "Caso tenha mais alguma dúvida, nos contacte novamente através do nosso formulário no site";
        $mensagem .= "<br/><br/>";
        $mensagem .= "Esta é uma mensagem automática, por favor não responda este email!";
        $mensagem .= "<br/>";

        $mailData = [
            'title' => 'Recebemos sua contribuição',
            'sub-title' => $subject,
            'mensagem' => $mensagem,
            'url' => null,
            'title-button' => null,
            'date' => $date,
        ];

        Mail::to($emailTo)->send(new SendMailUser($mailData, $assunto));

        $request->session()->flash('msg', 'Mensagem cadastrada com sucesso!');
        return redirect()->back();

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Contribui  $contribui
     * @return \Illuminate\Http\Response
     */
    public function show(Contribui $contribui)
    {
        $contribui->lida = 's';
        $contribui->save();
        return view('redat.contribuis.show', compact('contribui'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Contribui  $contribui
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, Contribui $contribui)
    {
        if($contribui->aprov == 'n'){
            $contribui->aprov = 's';
        }else{
            $contribui->aprov = 'n';
        }
        $contribui->save();
        $request->session()->flash('msg', 'Mensagem Atualizada com sucesso!');
        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Contribui  $contribui
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Contribui $contribui)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Contribui  $contribui
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request ,Contribui $contribui)
    {
        $contribui->delete();
        $request->session()->flash('msg', 'Contribuição deletada com sucesso!');
        return redirect()->route('redat.dimensions.index');
    }
}
