target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

define void @_DllMainCRTStartup() {
  ret void
}

define void @exportfn1() {
  ret void
}

define void @exportfn2() {
  ret void
}

define dllexport void @exportfn3() {
  ret void
}
