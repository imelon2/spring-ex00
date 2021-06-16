package sample.junit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

public class MyTest1 {

	@Test
	public void test() {
//		fail("Not yet implemented");
		int i = 3;
		if (i != 3) {
			fail("i는 3이 아닙니다.");
		}
	}

	@Test
	public void equals() {
		int i = 3;
		boolean b = true;
		Object c = null;
		assertEquals(i, 3);  // 첫번째와 두번째가 같으면 true 아니면 false
		assertEquals(b, true);
		assertTrue(b); // b 가 true면 true
		assertNull(c); //c가 null이면 true
	}
	@Test
	public void notequals() {
		int i = 5;
		boolean b = false;
		Object c = new Object();
		assertEquals(i, 3);  // 첫번째와 두번째가 같으면 true 아니면 false
		assertFalse(b); // b가 false면 true
		assertNotNull(c); //c가 null이 아니면 true
	}
}
