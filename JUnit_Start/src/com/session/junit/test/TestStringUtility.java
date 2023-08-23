package com.session.junit.test;

import org.junit.Test;

import com.session.junit.StringUtility;

/**
 * @author hyphen
 *
 */
public class TestStringUtility {

	/**
	 * Test Positive Scenario - INPUT - hyphen OUTPUT - hyphen||nehpyh
	 */
	@Test
	public void getMirrorImage() {
		StringUtility utility = new StringUtility();
		String inputImage = "hyphen";
		String outputImage = utility.getMirrorImage(inputImage);

	}

	/**
	 * Test Negative Scenario - INPUT - NULL OUTPUT - NullPointerException
	 */
	@Test
	public void getMirrorImage1() {
		StringUtility utility = new StringUtility();
		String inputImage = null;
		try {
			utility.getMirrorImage(inputImage);
		} catch (NullPointerException e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * Test Negative Scenario - INPUT - empty for unhandled exceptions
	 */
	@Test(expected = NullPointerException.class)
	public void getMirrorImage2() {
		StringUtility utility = new StringUtility();
		String inputImage = "";
		utility.getMirrorImage(inputImage);
	}
}
