package com.gaji.SingleBungle.cafe.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CafeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
