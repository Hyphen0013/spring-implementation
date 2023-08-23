package com.session.junit;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

/**
 * @author hyphen
 *
 */
public class StringUtility {
	/**
	 * @param inputImage
	 * @return String
	 * @throws NullPointerException
	 */
	public String getMirrorImage(final String inputImage) throws NullPointerException {
		String outputImage = null;
		final String METHOD_NAME = "getMirrorImage";
		System.out.println("Method Invoked: " + this.getClass().getName() + " : " + METHOD_NAME + " : " + inputImage);

		if (inputImage == null || inputImage.isEmpty()) {
			throw new NullPointerException("Empty of Null value passed");
		}
		outputImage = inputImage.concat("||").concat(new StringBuilder(inputImage).reverse().toString());

		System.out.println("Response From The Method: " + this.getClass().getName() + " : " + outputImage);
		return outputImage;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		StringUtility classCall = new StringUtility();
//		classCall.getMirrorImage("hyphen");

		Result result = JUnitCore.runClasses(StringUtility.class);

		for (Failure failure : result.getFailures()) {
			System.out.println(failure.toString());
		}

		System.out.println(result.wasSuccessful());

	}
}
