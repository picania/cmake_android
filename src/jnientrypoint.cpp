#include <jni.h>
#include <GL/glew.h>
#include <android/log.h>

#include "nativemain.h"

#define  LOG_TAG    "hellogles_native"
#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)

extern "C"
{

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* /*reserved*/)
{
	LOGI("Call ON_Init...");
	GLenum ok = glewInit();

	if (ok != GLEW_OK)
		return -1;

	return JNI_VERSION_1_6;
}

JNIEXPORT void JNICALL Java_com_example_hellogles_NativeWrapper_init(JNIEnv* env, jobject, jint width, jint height)
{
	LOGI("Call init %d x %d", width, height);
	glViewport(0, 0, width, height);
}

JNIEXPORT void JNICALL Java_com_example_hellogles_NativeWrapper_draw(JNIEnv* env, jobject)
{
	LOGI("Call draw...");
	glClearColor(0.0f, 0.0f, 1.0f, 1.0f);
	glClear(GL_COLOR_BUFFER_BIT);

	// Draw a triangle from the 3 vertices
	//glDrawArrays(GL_TRIANGLES, 0, 3);
}

}
