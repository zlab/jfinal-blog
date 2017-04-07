package net.zhanqi.app.blog.util;

import net.zhanqi.app.blog.extend.CustomException;

import java.util.Collection;

/**
 * CheckUtils
 *
 * @author zhanqi
 * @since 2013-03-25
 */
public final class CheckUtils {

    public static final void throwException(String format, Object... args) {
        throw new CustomException(String.format(format, args));
    }

    public static final void checkNull(Object obj, String format, Object... args) {
        if (obj == null) {
            throwException(format, args);
        }
    }

    public static final void checkBlank(String str, String format, Object... args) {
        if (str == null || str.trim().length() == 0) {
            throwException(format, args);
        }
    }

    public static final void checkEmpty(Collection<?> collection, String format,
                                        Object... args) {
        if (collection == null || collection.isEmpty()) {
            throwException(format, args);
        }
    }

    public static final void checkEmpty(Object[] array, String format, Object... args) {
        if (array == null || array.length == 0) {
            throwException(format, args);
        }
    }

    public static final void checkTrue(boolean val, String format, Object... args) {
        if (val) {
            throwException(format, args);
        }
    }

}
