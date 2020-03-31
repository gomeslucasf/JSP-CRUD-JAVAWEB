<%@page import="java.util.ArrayList"%>
<%@page import="br.unoeste.fipp.lp3.dal.usuarioDal"%>
<%@page import="br.unoeste.fipp.lp3.persistencia.Conexao"%>
<%@page import="br.unoeste.fipp.lp3.entidade.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
String btn= request.getParameter("btn");



List<Usuario> listaUsuario = new ArrayList<>();

usuarioDal usuarioDal = new usuarioDal();
listaUsuario = usuarioDal.getAll();


    if( btn != null )
    {
        if(btn.equals("Novo")){
            session.invalidate();
            response.sendRedirect("cadastro.jsp");
        }
        if(btn.equals("Inicio")){
            response.sendRedirect("index.html");
        }
        if(btn.equals("Alterar")){
            
           session.setAttribute("usuario", usuarioDal.getById(Integer.parseInt(request.getParameter("codigo"))));
           response.sendRedirect("cadastro.jsp");
        }
        if(btn.equals("Excluir")){
           int codigo = Integer.parseInt(request.getParameter("codigo"));
           usuarioDal.removeById(codigo);
           listaUsuario = usuarioDal.getAll();
        }
    }else{
        //fechar a porta
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Listagem JSP PG BS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="imagem/png" href="img/Vampire_icon-icons.com_75033.ico" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <body style="background: url('img/pexels-photo-3815759.jpeg') no-repeat center center fixed;  -webkit-background-size: cover;
                -moz-background-size: cover;
                background-size: cover;
                -o-background-size: cover;">
        <div class="container text-white p-5">
            <div class="row">
                <div class="col">
                    <div class="panel">
                        <div class="panel-heading text-center">
                            <h1>Listagem de Usuarios</h1>
                        </div>
                        <div class="panel-body p-4">
                            <div class="row">
                                <div class="col">
                                    <div class ="row">
                                        <div class="col-8">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                  <button class="btn btn-outline-dark text-white dropdown-toggle border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Buscar por </button>
                                                  <div class="dropdown-menu bg-dark ">
                                                    <a class="dropdown-item text-white bg-dark" href="#">Codigo</a>
                                                    <a class="dropdown-item text-white bg-dark" href="#">Nome</a>
                                                    <a class="dropdown-item text-white bg-dark" href="#">Login</a>
                                                    <div role="separator" class="dropdown-divider"></div>
                                                    <a class="dropdown-item text-white bg-dark" href="#">Todos</a>
                                                  </div>
                                                </div>
                                                <input type="text" class="form-control bg-dark border-0 text-white" aria-label="Text input with dropdown button">
                                            </div>
                                        </div>
                                        <div>
                                            <input type="submit"
                                                           id="btn"
                                                           name="btn"
                                                           value="Procurar"
                                                           class="btn btn-outline-dark text-white border-0"/>
                                        </div>
                                    </div>

                                    <form action="listagem.jsp">
                              
                                        <table class="table table-dark">
                                            <thead>
                                              <tr>
                                                <th scope="col">CODIGO</th>
                                                <th scope="col">NOME</th>
                                                <th scope="col">LOGIN</th>
                                                <th scope="col">SENHA</th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <% for(Usuario usu : listaUsuario )
                                                {%>
                                              <tr>
                                                <th scope="row"><%= usu.getCodigo()%></th>
                                                <td><%= usu.getNome()%></td>
                                                <td><%= usu.getLogin()%></td>
                                                <td><%= usu.getSenha()%></td>
                                            <form action="listagem.jsp">
                                                <input type="hidden" id="codigo" name="codigo" value="<%= usu.getCodigo()%>"/>
                                                <td>
                                                    <input type="submit"
                                                           id="btn"
                                                           name="btn"
                                                           value="Alterar"
                                                           class="btn btn-outline-warning"/>
                                                </td>
                                                <td>
                                                    <input type="submit"
                                                           id="btn"
                                                           name="btn"
                                                           value="Excluir"
                                                           class="btn btn-outline-danger"/>
                                                </td>
                                            </form>
                                              </tr>
                                                <%}%>
                                            </tbody>
                                        </form>
                                    </table>
                                </div>
                            </div>
                                <form action="listagem.jsp">
                                    
                                    <div class="row">
                                        <div class="col-11">
                                            <input type="submit" id="btn" name="btn" value="Novo" class="btn btn-outline-success"/>
                                        </div>
                                        <div class="col-1">
                                            <input type="submit" id="btn" name="btn" value="Inicio" class="btn btn-outline-primary"/>
                                        </div>
                                    </div>
                                </form>
                            
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </body>
</html>
