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
	private static String Top_URL = "https://flixpatrol.com/top10/netflix/";

    @PostConstruct
    public List<Top> getTopDatas() throws IOException {
        List<Top> TopList = new ArrayList<>();
        Document document = Jsoup.connect(Top_URL).get();

        Elements contents = document.select("tr");
        for(Element content : contents) {
        	Top top = Top.builder()
        			.image(content.select("img").attr("abs:src"))
        			.subject(content.select("a").text())
        			.url(content.select("a").attr("abs:href"))
        			.build();
        	TopList.add(top);
        }
        return TopList.subList(0, 10);
    }
    
//    @PostConstruct
//    public List<Top> getTopWhacha() throws IOException {
//        List<Top> TopList = new ArrayList<>();
//        Document document = Jsoup.connect(Top_URL).get();
//
//        Elements contents = document.select("section ul.type2 li");
//        System.out.println(contents);
//        for(Element content : contents) {
//        	Top top = Top.builder()
//        			.image(content.select("img").attr("abs:src"))
//        			.subject(content.select("a").text())
//        			.url(content.select("a").attr("abs:href"))
//        			.build();
//        	TopList.add(top);
//        }
//        return TopList.subList(0, 3);
    //}
}
