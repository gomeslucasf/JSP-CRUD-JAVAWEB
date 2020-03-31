<%@page import="br.unoeste.fipp.lp3.entidade.Usuario"%>
<%@page import="br.unoeste.fipp.lp3.dal.usuarioDal"%>
<%@page import="br.unoeste.fipp.lp3.persistencia.DAOException"%>
<%@page import="br.unoeste.fipp.lp3.util.Erros"%>
<%@page import="br.unoeste.fipp.lp3.util.Util"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String btn = request.getParameter("btn");
String nomeUsuario = request.getParameter("nome");
String loginUsuario = request.getParameter("login");
String senhaUsuario = request.getParameter("senha");
String codigoUsuario = request.getParameter("codigo");
usuarioDal usuarioDAL= new usuarioDal();
Usuario usuarioSession = (Usuario)session.getAttribute("usuario");
boolean alteracao = false;

if(usuarioSession != null){
    codigoUsuario = Integer.toString(usuarioSession.getCodigo());
    nomeUsuario = usuarioSession.getNome();
    loginUsuario = usuarioSession.getLogin();
    senhaUsuario = usuarioSession.getSenha();
    alteracao = true;
    session.setAttribute("usuario",null);
    session.setAttribute("codigo", codigoUsuario);
}

Erros erros = new Erros(); 


    if(btn != null){
        if(btn.equals("Cadastrar")){
            int codigo = 0;
            if (nomeUsuario == null || nomeUsuario.length() > 20) {
                erros.addMensagem("Nome não informado corretamente.");
            }
            
            if (loginUsuario == null || loginUsuario.length() > 8) {
                erros.addMensagem("Login não informada corretamente.");
            }
            if (senhaUsuario == null || senhaUsuario.length() > 8) {
                erros.addMensagem("Senha não informada corretamente.");
            }
            if (erros.isEmpty()) {
                try {
                   Usuario usu = new Usuario(codigo, nomeUsuario, loginUsuario, senhaUsuario);
                   usuarioDAL.insert(usu);
                   response.sendRedirect("listagem.jsp");
                } catch (DAOException ex) {
                    erros.addMensagem(ex.getLocalizedMessage());
                }
            }
            
        }
        if(btn.equals("Confirmar")){
            String codigotxt = (String) session.getAttribute("codigo");
            int codigo=0;
            try{
                codigo = Integer.parseInt(codigotxt);
            } catch (NumberFormatException ex) {
                erros.addMensagem("Uso inválido.");
            }
            
            if( codigo < 0){
                erros.addMensagem("Código não informado corretamente");
            }
            
            if (nomeUsuario == null || nomeUsuario.length() > 20) {
                erros.addMensagem("Nome não informado corretamente.");
            }
            
            if (loginUsuario == null || loginUsuario.length() > 8) {
                erros.addMensagem("Login não informada corretamente.");
            }
            if (senhaUsuario == null || senhaUsuario.length() > 8) {
                erros.addMensagem("Senha não informada corretamente.");
            }
            if (erros.isEmpty()) {
                try {
                   Usuario usu = new Usuario(codigo, nomeUsuario, loginUsuario, senhaUsuario);
                   usuarioDAL.update(usu);
                   response.sendRedirect("listagem.jsp");
                } catch (DAOException ex) {
                    erros.addMensagem(ex.getLocalizedMessage());
                }
            }
            
        }
        if(btn.equals("Limpar")){
            codigoUsuario=null;
            nomeUsuario=null;
            loginUsuario=null;
            senhaUsuario=null;
        }
        if(btn.equals("Novo")){
        }
    }else{
        //fechar as portas
    }
    
%>
<!DOCTYPE html>
<html>
 <head>
        <title>Iniciando Cadastro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="imagem/png" href="img/Vampire_icon-icons.com_75033.ico" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <style>
            .fundo{
                background-color: black;
                width: 100%;
                height: 100%;
            }
        </style>
    </head>    
    <body style="background: url('img/pexels-photo-3815759.jpeg') no-repeat center center fixed;  -webkit-background-size: cover;
                -moz-background-size: cover;
                background-size: cover;
                -o-background-size: cover;">
        <div class="container p-5 text-white">
            <div class="row">
                <div class="col align-items-center p-5">
                    <div class="bg-black p-5">
                        <div class="panel p-5">
                            <div class="panel-heading text-center ">
                                 <% if(alteracao){%>
                                    <h1>Alterando Cadastro</h1>
                                <%}else{%>
                                    <h1>Cadastro de Usuarios</h1>
                                <%}%>
                            </div>
                            <div class="panel-body p-5">
                                <form action="cadastro.jsp">
                                    <div class="row">
                                         <div class="col-4 p-2">
                                            <% if(codigoUsuario != null) {%>
                                                <input min="1"
                                                       id="codigo" 
                                                       name="codigo"
                                                       type="number"
                                                       class="form-control-plaintext text-white"
                                                       placeholder="CODIGO"
                                                       value="<%= codigoUsuario%>"
                                                       disabled
                                                       />
                                            <%}%>
                                        </div>
                                        <div class="col-8 p-2">
                                            <% if(nomeUsuario != null) {%>
                                                <input maxlength="100"
                                                       id="nome"
                                                       name="nome"
                                                       type="text"
                                                       class="form-control-plaintext text-white"
                                                       placeholder="NOME"
                                                       value="<%= nomeUsuario%> "
                                                       required/>
                                            <%}else{%>
                                                <input maxlength="100"
                                                       id="nome"
                                                       name="nome"
                                                       type="text"
                                                       class="form-control-plaintext text-white"
                                                       placeholder="NOME"
                                                       required/>
                                            <%}%>
                                            
                                        </div>
                                        <div class="col-6 p-2">
                                             <% if(loginUsuario != null) {%>
                                                <input maxlength="8"
                                                       id="login"
                                                       name="login"
                                                       type="text"
                                                       class="form-control-plaintext text-white"
                                                       placeholder="LOGIN"
                                                       value="<%= loginUsuario%>"
                                                       required/>
                                            <%}else{%>
                                                <input maxlength="8"
                                                       id="login"
                                                       name="login"
                                                       type="text"
                                                       class="form-control-plaintext text-white"
                                                       placeholder="LOGIN"
                                                       required/>
                                            <%}%>
                                           
                                        </div>
                                        <div class="col-6 p-2">
                                            <div class="input-group mb-3">
                                                <% if(senhaUsuario != null) {%>
                                                    <input  maxlength="8"
                                                            id="senha"
                                                            name="senha"
                                                            type="password"
                                                            class="form-control-plaintext text-white"
                                                            aria-describedby="basic-addon1"
                                                            placeholder="SENHA"
                                                            value="<%= senhaUsuario%>"
                                                            required/>
                                                <%}else{%>
                                                    <input  maxlength="8"
                                                            id="senha"
                                                            name="senha"
                                                            type="password"
                                                            class="form-control-plaintext text-white" 
                                                            aria-describedby="basic-addon1"
                                                            placeholder="SENHA"
                                                            required/>
                                                <%}%>
                                                
                                                <div class="input-group-prepend">
                                                    <div class="btn" type="button" id="mostrar">
                                                        <i><img src="img/view_watch_eye_icon_131255.ico" height="35" width="35"/></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 p-2">
                                            <div class="row">
                                                <div class="col-9">
                                                    <input id="btn" name="btn" value="Limpar" type="submit" class="btn btn-outline-danger"/>
                                                </div>
                                                <% if(alteracao){%>
                                                <div class="col-3">
                                                    <input id="btn" name="btn" value="Confirmar" type="submit" class="btn btn-outline-success"/>
                                                </div>
                                                <%}else{%>
                                                <div class="col-3">
                                                    <input id="btn" name="btn" value="Cadastrar" type="submit" class="btn btn-outline-success"/>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                        <ul>
                                        <%for(String err : erros.getMensagens()){
                                            out.println("<li>" + err + "</li>");
                                        }%>
                                        </ul>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function(){
                $('#mostrar').on('click', function(){
                  var passwordField = $('#senha');
                  var passwordFieldType = passwordField.attr('type');
                  if(passwordFieldType == 'password')
                  {
                      passwordField.attr('type', 'text');
                      $(this).val('Hide');
                  } else {
                      passwordField.attr('type', 'password');
                      $(this).val('Show');
                  }
                });
            });
        </script>
    </body>
</html>
