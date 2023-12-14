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
	private static String Top_Netflix_URL = "https://www.netflix.com/tudum/top10/south-korea";
	private static String Top_WhaCha_URL ="https://pedia.watcha.com/";
    @PostConstruct
    public List<Top> getTopDatas() throws IOException {
        List<Top> TopList = new ArrayList<>();
        Document document = Jsoup.connect(Top_Netflix_URL).get();

        Elements contents = document.select("section ul div");
        for(Element content : contents) {
        	Top top = Top.builder()
        			.image(content.select("picture source").attr("abs:srcset"))
        			.subject(content.select("b").text())
        			.url(content.select("a").attr("abs:href"))
        			.build();
        	if(top.getImage() != "" && top.getSubject() != "" && top.getUrl() != "") {
        		TopList.add(top);
        	}
        }
        return TopList;
    }
    
    @PostConstruct
    public List<Top> getTopWhacha() throws IOException {
        List<Top> TopList = new ArrayList<>();
        Document document = Jsoup.connect(Top_WhaCha_URL).get();
        Elements contents = document.select("section div ul li");
        System.out.println(contents);
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
}
