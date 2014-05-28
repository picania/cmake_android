#include "nativemain.h"

using std::string;

string helloWorld(const string& abi)
{
    return string("Hello world from ") + abi + (" jni.");
}
