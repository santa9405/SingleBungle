package com.gaji.SingleBungle.main.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
