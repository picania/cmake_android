package com.example.render;

import android.content.Context;
import android.graphics.PixelFormat;
import android.opengl.GLSurfaceView;
import android.util.AttributeSet;

import com.example.render.GLRender;

public class GLView extends GLSurfaceView {

	public GLView(Context context) {
		super(context);
		init(false, 16, 8);
	}

	public GLView(Context context, AttributeSet attrs) {
		super(context, attrs);
		init(false, 16, 8);
	}
	
	private void init(boolean translucent, int depth, int stencil) {
		if (translucent) {
			this.getHolder().setFormat(PixelFormat.TRANSLUCENT);
		}

		/* Setup the context factory for 2.0 rendering.
		 * See ContextFactory class definition below
		 */
		//setEGLContextFactory(new ContextFactory());

		/* We need to choose an EGLConfig that matches the format of
		 * our surface exactly. This is going to be done in our
		 * custom config chooser. See ConfigChooser class definition
		 * below.
		 */
		//setEGLConfigChooser(translucent ?
		//		new ConfigChooser(8, 8, 8, 8, depth, stencil) :
		//		new ConfigChooser(5, 6, 5, 0, depth, stencil));

		setEGLContextClientVersion(2); // Pick an OpenGL ES 2.0 context.
		/* Set the renderer responsible for frame rendering */
		setRenderer(new GLRender());
	}
}
