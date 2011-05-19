package com.nilhcem.dao;

import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import com.nilhcem.model.Right;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/applicationContext-test.xml"})
@Transactional
public class RightDaoTest {
	@Autowired
	private RightDao dao;

	@Test
	public void shouldGetUserRight() {
		Right userRight = dao.findByName(RightDao.RIGHT_USER);
		assertNotNull(userRight);
		assertEquals(RightDao.RIGHT_USER, userRight.getName());
	}

	@Test
	public void shouldGetAdminRight() {
		Right adminRight = dao.findByName(RightDao.RIGHT_ADMIN);
		assertNotNull(adminRight);
		assertEquals(RightDao.RIGHT_ADMIN, adminRight.getName());
	}

	@Test
	public void makeSureThatAdminAndUserAreNotEqual() {
		Right user = dao.findByName(RightDao.RIGHT_USER);
		Right admin = dao.findByName(RightDao.RIGHT_ADMIN);
		assertNotSame(admin.getId(), user.getId());
	}
}
