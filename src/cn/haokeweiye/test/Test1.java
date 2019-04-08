package cn.haokeweiye.test;

/**
 * Created by HASEE on 2019/3/29.
 */
public class Test1 {
    public static void main(String[] args) {
        System.out.println(unicodeToString("\\u8723\\u06C3"));
    }

    public static String unicodeToString(String unicode) {
        StringBuffer sb = new StringBuffer();
        String[] hex = unicode.split("\\\\u");
        for (int i = 1; i < hex.length; i++) {
            int index = Integer.parseInt(hex[i], 16);
            sb.append((char) index);
        }
        return sb.toString();

    }
}
