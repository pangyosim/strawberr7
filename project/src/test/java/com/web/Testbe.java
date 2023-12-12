package com.web;


import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import com.web.dao.ReviewMapper;
import com.web.vo.Criteria;
import com.web.vo.PageDTO;
import com.web.vo.ReviewVO;




@SpringBootTest
@Commit
public class Testbe {
	
	@Autowired
	  private ReviewMapper reviewMapper;

	  @Test
	  public void testPaging() {
//		  1 10
		  Criteria cri = new Criteria();
		  List<ReviewVO> list = reviewMapper.getListWithpaging(cri);
		  
		  System.out.println(list);
	  }
	  @Test 
	  public void testPateDTO() {
		  Criteria cri = new Criteria();
		  cri.setPageNum(25);
		  PageDTO pageDTO = new PageDTO(cri , 251);
		  System.out.println(pageDTO);
	  }
}
