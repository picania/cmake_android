package com.example.render;

import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

import android.opengl.GLES20;
import android.opengl.GLSurfaceView.Renderer;

import com.example.hellogles.NativeWrapper;

public class GLRender implements Renderer {

	@Override
	public void onSurfaceCreated(GL10 gl, EGLConfig config) {
		gl.glEnable(GL10.GL_DEPTH_TEST);
//		GLES20.glClearColor(0.0f, 0.0f, 1.0f, 1.0f);
	}

	@Override
	public void onSurfaceChanged(GL10 gl, int width, int height) {
//		GLES20.glViewport(0, 0, width, height);
		NativeWrapper.init(width, height);
	}

	@Override
	public void onDrawFrame(GL10 gl) {
//		GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT);
		NativeWrapper.draw();
	}

}
