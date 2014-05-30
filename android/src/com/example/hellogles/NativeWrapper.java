package com.example.hellogles;

public class NativeWrapper {

	static {
		System.loadLibrary("hellogles");
	}
	
	public static native void init(int width, int height);
	public static native void draw();
}
