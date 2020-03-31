package br.unoeste.fipp.lp3.persistencia;

/**
 * Exception para indicar quando houver algum erro nas classes de manipulação de
 * Dados
 */
public class DAOException extends RuntimeException {

    public DAOException() {
        super();
    }

    public DAOException(String message) {
        super(message);
    }

    public DAOException(String message, Throwable cause) {
        super(message, cause);
    }

    public DAOException(Throwable cause) {
        super(cause);
    }

}
