; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --scrub-attributes
; RUN: opt -attributor -attributor-manifest-internal  -attributor-max-iterations-verify -attributor-annotate-decl-cs -attributor-max-iterations=2 -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_CGSCC_NPM,NOT_CGSCC_OPM,NOT_TUNIT_NPM,IS__TUNIT____,IS________OPM,IS__TUNIT_OPM
; RUN: opt -aa-pipeline=basic-aa -passes=attributor -attributor-manifest-internal  -attributor-max-iterations-verify -attributor-annotate-decl-cs -attributor-max-iterations=2 -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_CGSCC_OPM,NOT_CGSCC_NPM,NOT_TUNIT_OPM,IS__TUNIT____,IS________NPM,IS__TUNIT_NPM
; RUN: opt -attributor-cgscc -attributor-manifest-internal  -attributor-annotate-decl-cs -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_TUNIT_NPM,NOT_TUNIT_OPM,NOT_CGSCC_NPM,IS__CGSCC____,IS________OPM,IS__CGSCC_OPM
; RUN: opt -aa-pipeline=basic-aa -passes=attributor-cgscc -attributor-manifest-internal  -attributor-annotate-decl-cs -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_TUNIT_NPM,NOT_TUNIT_OPM,NOT_CGSCC_OPM,IS__CGSCC____,IS________NPM,IS__CGSCC_NPM
; PR2498

; This test tries to convince CHECK about promoting the load from %A + 2,
; because there is a load of %A in the entry block
define internal i32 @callee(i1 %C, i32* %A) {
;
; CHECK-LABEL: define {{[^@]+}}@callee
; CHECK-SAME: (i32* nocapture nofree nonnull readonly align 4 dereferenceable(4) [[A:%.*]])
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A_0:%.*]] = load i32, i32* [[A]], align 4
; CHECK-NEXT:    br label [[F:%.*]]
; CHECK:       T:
; CHECK-NEXT:    unreachable
; CHECK:       F:
; CHECK-NEXT:    [[A_2:%.*]] = getelementptr i32, i32* [[A]], i32 2
; CHECK-NEXT:    [[R:%.*]] = load i32, i32* [[A_2]], align 4
; CHECK-NEXT:    ret i32 [[R]]
;
entry:
  ; Unconditonally load the element at %A
  %A.0 = load i32, i32* %A
  br i1 %C, label %T, label %F

T:
  ret i32 %A.0

F:
  ; Load the element at offset two from %A. This should not be promoted!
  %A.2 = getelementptr i32, i32* %A, i32 2
  %R = load i32, i32* %A.2
  ret i32 %R
}

define i32 @foo(i32* %A) {
; IS__TUNIT____-LABEL: define {{[^@]+}}@foo
; IS__TUNIT____-SAME: (i32* nocapture nofree readonly [[A:%.*]])
; IS__TUNIT____-NEXT:    [[X:%.*]] = call i32 @callee(i32* nocapture nofree readonly align 4 [[A]])
; IS__TUNIT____-NEXT:    ret i32 [[X]]
;
; IS__CGSCC____-LABEL: define {{[^@]+}}@foo
; IS__CGSCC____-SAME: (i32* nocapture nofree nonnull readonly align 4 dereferenceable(4) [[A:%.*]])
; IS__CGSCC____-NEXT:    [[X:%.*]] = call i32 @callee(i32* nocapture nofree nonnull readonly align 4 dereferenceable(4) [[A]])
; IS__CGSCC____-NEXT:    ret i32 [[X]]
;
  %X = call i32 @callee(i1 false, i32* %A)             ; <i32> [#uses=1]
  ret i32 %X
}

