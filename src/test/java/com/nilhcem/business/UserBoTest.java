package com.nilhcem.business;

import static org.junit.Assert.*;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import com.nilhcem.business.UserBo;
import com.nilhcem.core.hibernate.TransactionalReadWrite;
import com.nilhcem.core.spring.UserDetailsAdapter;
import com.nilhcem.dao.RightDao;
import com.nilhcem.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/applicationContext-test.xml"})
@Transactional
public class UserBoTest {
	private final String EMAIL = "###Test###@example.com";
	private final String PASSWORD = "myPassword";
	private final String LOCALE = "fr_FR";

	@Autowired
	@Qualifier(value = "userBo")
	private UserBo usersHandler;

	@Autowired
	private RightDao rightDao;

	@Autowired
	private ShaPasswordEncoder passwordEncoder;

	@Autowired
	private SaltSource saltSource;

	@Test
	@TransactionalReadWrite
	@Rollback(true)
	public void aUserCanSignUp() {
		User user = new User();
		user.setEmail(EMAIL);
		user.setPassword(PASSWORD);
		Date before = Calendar.getInstance().getTime();
		usersHandler.signUpUser(user, new Locale(LOCALE.split("_")[0], LOCALE.split("_")[1]));
		Date after = Calendar.getInstance().getTime();
		checkIfUserIsSavedInDB(before, after);
	}

	private void checkIfUserIsSavedInDB(Date before, Date after) {
		User userNull = usersHandler.findByEmail("");
		assertNull(userNull);
		User user = usersHandler.findByEmail(EMAIL);
		assertNotNull(user);
		assertEquals(EMAIL, user.getEmail());
		assertEquals(LOCALE, user.getLanguage().getCode());

		//Check password
		assertEquals(passwordEncoder.encodePassword(PASSWORD, saltSource.getSalt(new UserDetailsAdapter(user))), user.getPassword());
		aUserWhoSignsUpShouldHaveUserRight(user);
		testRegistrationDate(before, user.getRegistrationDate(), after);
	}

	private void aUserWhoSignsUpShouldHaveUserRight(User user) {
		assertNotNull(user.getRights());
		assertEquals(1, user.getRights().size());
		assertEquals(rightDao.findByName(RightDao.RIGHT_USER), user.getRights().get(0));
	}

	private void testRegistrationDate(Date before, Date registrationDate, Date after) {
		assertFalse(before.after(registrationDate));
		assertFalse(after.before(registrationDate));
	}
}
