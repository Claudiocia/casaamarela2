<?php

namespace App\Http\Controllers;

use App\Mail\SendMailUser;
use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class ContactsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $contacts = Contact::orderBy('status', 'DESC')->paginate(5);
        return view('admin.contacts.index', compact('contacts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('contact');
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

        Validator::make($data, [
            'name' => ['required', 'string', 'max:255', 'min:4'],
            'phone' => ['required', 'min:11'],
            'email' => ['required', 'email'],
            'subject' => ['required', 'string', 'max:255'],
            'message' => ['required', 'string'],
        ],
        [
            'name.required' => 'Favor informar seu nome',
            'name.min' => 'Informe seu nome completo',
            'name.max' => 'Seu nome está muito grande, por favor abrevie',
            'phone.required' => 'O telefone é obrigatório',
            'phone.min' => 'Informe um telefone válido no formato (dd)xxxxxxxxx',
            'email.required' => 'O campo Email é obrigatório',
            'email.email' => 'Por favor, informe um email válido',
        ])->validate();
        Contact::create($data);

        $emailTo    = $data['email'];
        $nome       = $data['name'];
        $subject    = $data['subject'];
        $assunto    = 'Recebemos seu contato';
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
            'title' => 'Recebemos sua mensagem',
            'sub-title' => $subject,
            'mensagem' => $mensagem,
            'url' => null,
            'title-button' => null,
            'date' => $date,
        ];

        Mail::to($emailTo)->send(new SendMailUser($mailData, $assunto));

        $request->session()->flash('msg', 'Mensagem enviada com sucesso!');
        return redirect()->route('/');
    }

    /**
     * Display the specified resource.
     *
     * @param  Contact $contact
     * @return \Illuminate\Http\Response
     */
    public function show(Contact $contact)
    {
        $contact->status = 's';
        $contact->save();
        return view('admin.contacts.show', compact('contact'));
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Contact $contact
     * @return \Illuminate\Http\Response
     */
    public function destroy(Contact $contact, Request $request)
    {
        $contact->delete();
        $request->session()->flash('msg', 'Mensagem deletada com sucesso!');
        return redirect()->route('admin.contacts.index');
    }
}
