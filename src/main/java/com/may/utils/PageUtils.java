package com.may.utils;

import java.util.ArrayList;
import java.util.List;

public class PageUtils {

    public static List<Integer> getPages(Integer totalPages) {
        List<Integer> pages = new ArrayList<>();

        if (totalPages <= 1) {
            return pages;
        }

        for (int i = 1; i <= totalPages; i++) {
            pages.add(i);
        }

        return pages;
    }
}
