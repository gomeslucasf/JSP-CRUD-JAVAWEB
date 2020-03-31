package br.unoeste.fipp.lp3.util;

import java.util.List;

/**
 *
 * @author Usuario
 */
public class Util {

    public static boolean isEmpty(String in) {
        return in == null || in.isEmpty();
    }

    public static boolean isNotEmpty(String in) {
        return !Util.isEmpty(in);
    }

    public static boolean isEmpty(List in) {
        return in == null || in.isEmpty();
    }

    public static boolean isNotEmpty(List in) {
        return !Util.isEmpty(in);
    }

}
