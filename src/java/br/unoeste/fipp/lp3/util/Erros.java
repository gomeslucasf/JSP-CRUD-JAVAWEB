package br.unoeste.fipp.lp3.util;

import java.util.ArrayList;
import java.util.List;

public class Erros {

    private final List<String> mensagens;

    public Erros() {
        mensagens = new ArrayList<>();
    }

    public List<String> getMensagens() {
        return mensagens;
    }

    public void addMensagem(String msg) {
        mensagens.add(msg);
    }

    public boolean isPossuiMensagem() {
        return !isEmpty();
    }

    public boolean isEmpty() {
        return mensagens.isEmpty();
    }
}
