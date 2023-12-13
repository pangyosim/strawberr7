package com.web.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.web.vo.Top;

@Service
public class TopService {
	private static String News_URL = "https://flixpatrol.com/top10/netflix/";

    @PostConstruct
    public List<Top> getTopDatas() throws IOException {
        List<Top> newsList = new ArrayList<>();
        Document document = Jsoup.connect(News_URL).get();

        Elements contents = document.select("div ul.type2 li");

        for (Element content : contents) {
            Top news = Top.builder()
                    .image(content.select("a img").attr("abs:src")) // 이미지
                    .subject(content.select("h4 a").text())		    // 제목
                    .url(content.select("a").attr("abs:href"))		// 링크
                    .build();
            newsList.add(news);
        }

        return newsList;
    }
}
