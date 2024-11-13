.text

.global clktest

// mte tests
.global irgtest
.global irglatencytest
.global addgtest
.global addglatencytest
.global subgtest
.global subglatencytest
.global subptest
.global subplatencytest
.global subpstest
.global subpslatencytest
.global stgtest
.global st2gtest
.global stzgtest
.global stz2gtest
.global stgptest
.global ldgtest

// pac tests
.global pacdzatest
.global pacdzalatencytest
.global pacdatest
.global pacdalatencytest
.global autdzatest
.global autdzalatencytest
.global autdatest
.global autdalatencytest
.global xpacdtest
.global xpacdlatencytest
.global orrlatencytest

/* x0 = arg = iteration count. all iteration counts must be divisible by 10 */
clktest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
clktest_loop:
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  add x13, x13, x15
  sub x0, x0, x14
  cbnz x0, clktest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret


// x0: iteration count
irgtest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
irgtest_loop:
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  irg x13, x15
  sub x0, x0, x14
  cbnz x0, irgtest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
irglatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
irglatencytest_loop:
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  irg x15, x15
  sub x0, x0, x14
  cbnz x0, irglatencytest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
addgtest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
addgtest_loop:
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  addg x13, x15, #0, #1
  sub x0, x0, x14
  cbnz x0, addgtest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
addglatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
addglatencytest_loop:
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  addg x15, x15, #0, #1
  sub x0, x0, x14
  cbnz x0, addglatencytest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
subgtest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
subgtest_loop:
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  subg x13, x15, #0, #1
  sub x0, x0, x14
  cbnz x0, subgtest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
subglatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
subglatencytest_loop:
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  subg x15, x15, #0, #1
  sub x0, x0, x14
  cbnz x0, subglatencytest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
subptest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  mov x13, 1
subptest_loop:
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  subp x13, x15, x15
  sub x0, x0, x14
  cbnz x0, subptest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
subplatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  mov x13, 1
subplatencytest_loop:
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  subp x15, x15, x13
  sub x0, x0, x14
  cbnz x0, subplatencytest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
subpstest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
subpstest_loop:
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  subps x13, x15, x15
  sub x0, x0, x14
  cbnz x0, subpstest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
subpslatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  mov x13, 1
subpslatencytest_loop:
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  subps x15, x15, x13
  sub x0, x0, x14
  cbnz x0, subpslatencytest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
// x1: test array
stgtest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x14, 20
stgtest_loop:
  stg x10, [x1]
  stg x11, [x1]
  stg x12, [x1]
  stg x13, [x1]
  stg x15, [x1]
  stg x10, [x1]
  stg x11, [x1]
  stg x12, [x1]
  stg x13, [x1]
  stg x15, [x1]
  stg x10, [x1]
  stg x11, [x1]
  stg x12, [x1]
  stg x13, [x1]
  stg x15, [x1]
  stg x10, [x1]
  stg x11, [x1]
  stg x12, [x1]
  stg x13, [x1]
  stg x15, [x1]
  sub x0, x0, x14
  cbnz x0, stgtest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

// x0: iteration count
// x1: test array
st2gtest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x14, 20
st2gtest_loop:
  st2g x10, [x1]
  st2g x11, [x1]
  st2g x12, [x1]
  st2g x13, [x1]
  st2g x15, [x1]
  st2g x10, [x1]
  st2g x11, [x1]
  st2g x12, [x1]
  st2g x13, [x1]
  st2g x15, [x1]
  st2g x10, [x1]
  st2g x11, [x1]
  st2g x12, [x1]
  st2g x13, [x1]
  st2g x15, [x1]
  st2g x10, [x1]
  st2g x11, [x1]
  st2g x12, [x1]
  st2g x13, [x1]
  st2g x15, [x1]
  sub x0, x0, x14
  cbnz x0, st2gtest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

// x0: iteration count
// x1: test array
stzgtest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x14, 20
stzgtest_loop:
  stzg x10, [x1]
  stzg x11, [x1]
  stzg x12, [x1]
  stzg x13, [x1]
  stzg x15, [x1]
  stzg x10, [x1]
  stzg x11, [x1]
  stzg x12, [x1]
  stzg x13, [x1]
  stzg x15, [x1]
  stzg x10, [x1]
  stzg x11, [x1]
  stzg x12, [x1]
  stzg x13, [x1]
  stzg x15, [x1]
  stzg x10, [x1]
  stzg x11, [x1]
  stzg x12, [x1]
  stzg x13, [x1]
  stzg x15, [x1]
  sub x0, x0, x14
  cbnz x0, stzgtest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

// x0: iteration count
// x1: test array
stz2gtest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x14, 20
stz2gtest_loop:
  stz2g x10, [x1]
  stz2g x11, [x1]
  stz2g x12, [x1]
  stz2g x13, [x1]
  stz2g x15, [x1]
  stz2g x10, [x1]
  stz2g x11, [x1]
  stz2g x12, [x1]
  stz2g x13, [x1]
  stz2g x15, [x1]
  stz2g x10, [x1]
  stz2g x11, [x1]
  stz2g x12, [x1]
  stz2g x13, [x1]
  stz2g x15, [x1]
  stz2g x10, [x1]
  stz2g x11, [x1]
  stz2g x12, [x1]
  stz2g x13, [x1]
  stz2g x15, [x1]
  sub x0, x0, x14
  cbnz x0, stz2gtest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

// x0: iteration count
// x1: test array
stgptest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x14, 20
stgptest_loop:
  stgp x10, x11, [x1]
  stgp x11, x12, [x1]
  stgp x12, x13, [x1]
  stgp x13, x15, [x1]
  stgp x15, x10, [x1]
  stgp x10, x11, [x1]
  stgp x11, x12, [x1]
  stgp x12, x13, [x1]
  stgp x13, x15, [x1]
  stgp x15, x10, [x1]
  stgp x10, x11, [x1]
  stgp x11, x12, [x1]
  stgp x12, x13, [x1]
  stgp x13, x15, [x1]
  stgp x15, x10, [x1]
  stgp x10, x11, [x1]
  stgp x11, x12, [x1]
  stgp x12, x13, [x1]
  stgp x13, x15, [x1]
  stgp x15, x10, [x1]
  sub x0, x0, x14
  cbnz x0, stgptest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

// x0: iteration count
// x1: test array
ldgtest:
  sub sp, sp, #0x50
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  stp x10, x11, [sp, #0x30]
  stp x8, x9, [sp, #0x40]
  mov x14, 20
ldgtest_loop:
  ldg x10, [x1]
  ldg x11, [x1]
  ldg x12, [x1]
  ldg x13, [x1]
  ldg x15, [x1]
  ldg x10, [x1]
  ldg x11, [x1]
  ldg x12, [x1]
  ldg x13, [x1]
  ldg x15, [x1]
  ldg x10, [x1]
  ldg x11, [x1]
  ldg x12, [x1]
  ldg x13, [x1]
  ldg x15, [x1]
  ldg x10, [x1]
  ldg x11, [x1]
  ldg x12, [x1]
  ldg x13, [x1]
  ldg x15, [x1]
  sub x0, x0, x14
  cbnz x0, ldgtest_loop
  ldp x8, x9, [sp, #0x40]
  ldp x10, x11, [sp, #0x30]
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x50
  ret

// x0: iteration count
pacdzatest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
pacdzatest_loop:
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  mov x13, x15
  pacdza x13
  sub x0, x0, x14
  cbnz x0, pacdzatest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
pacdzalatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
pacdzalatency_loop:
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  pacdza x13
  sub x0, x0, x14
  cbnz x0, pacdzalatency_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
pacdatest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
pacdatest_loop:
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  mov x13, x15
  pacda x13, x14
  sub x0, x0, x14
  cbnz x0, pacdatest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
pacdalatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
pacdalatency_loop:
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  pacda x13, x14
  sub x0, x0, x14
  cbnz x0, pacdalatency_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
autdzatest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  pacdza x15
  mov x14, 20
  eor x13, x13, x13
autdzatest_loop:
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  mov x13, x15
  autdza x13
  sub x0, x0, x14
  cbnz x0, autdzatest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
autdzalatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  pacdza x15
  mov x14, 20
  eor x13, x13, x13
autdzalatencytest_loop:
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  orr x13, x13, x15
  autdza x13
  sub x0, x0, x14
  cbnz x0, autdzalatencytest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
autdatest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  pacda x15, x14
  eor x13, x13, x13
autdatest_loop:
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  mov x13, x15
  autda x13, x14
  sub x0, x0, x14
  cbnz x0, autdatest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret


// x0: iteration count
autdalatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  pacda x15, x14
  eor x13, x13, x13
autdalatencytest_loop:
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  orr x13, x13, x15
  autda x13, x14
  sub x0, x0, x14
  cbnz x0, autdalatencytest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
xpacdtest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
xpacdtest_loop:
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  mov x13, x15
  xpacd x13
  sub x0, x0, x14
  cbnz x0, xpacdtest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret


// x0: iteration count
xpacdlatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
xpacdlatencytest_loop:
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  xpacd x13
  sub x0, x0, x14
  cbnz x0, xpacdlatencytest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

// x0: iteration count
orrlatencytest:
  sub sp, sp, #0x30
  stp x14, x15, [sp, #0x10]
  stp x12, x13, [sp, #0x20]
  mov x15, 1
  mov x14, 20
  eor x13, x13, x13
orrlatencytest_loop:
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  orr x13, x13, x15
  sub x0, x0, x14
  cbnz x0, orrlatencytest_loop
  ldp x12, x13, [sp, #0x20]
  ldp x14, x15, [sp, #0x10]
  add sp, sp, #0x30
  ret

