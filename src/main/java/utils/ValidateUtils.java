package utils;

import java.awt.*;
import java.util.regex.Pattern;

public class ValidateUtils {
    public static final String USERNAME_REGEX = "^[^@]{2,64}@[^.]{2,253}\\.[0-9a-z-.]{2,63}$";
    public static final String PASSWORD_REGEX = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";

    public static boolean isUsernameValid(String name){
        return Pattern.matches(USERNAME_REGEX,name);
    }
    public  static boolean isPasswordValid(String password){
        return Pattern.matches(PASSWORD_REGEX,password);
    }
    public static final String SONG_REGEX = "^.{1,50}$";
    public static boolean isSongValid(String song) {
        return Pattern.matches(SONG_REGEX, song);
    }
}
