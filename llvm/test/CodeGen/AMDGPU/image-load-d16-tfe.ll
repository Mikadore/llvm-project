; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=amdgcn-mesa-mesa3d -mcpu=gfx900 -verify-machineinstrs < %s | FileCheck -check-prefix=GFX9 %s
; RUN: llc -mtriple=amdgcn-mesa-mesa3d -mcpu=gfx1010 -verify-machineinstrs < %s | FileCheck -check-prefix=GFX10 %s
; RUN: llc -mtriple=amdgcn-mesa-mesa3d -mcpu=tonga -verify-machineinstrs < %s | FileCheck -check-prefix=GFX8-UNPACKED %s

define amdgpu_ps void @load_1d_f16_tfe_dmask0(<8 x i32> inreg %rsrc, i32 %s) {
; GFX9-LABEL: load_1d_f16_tfe_dmask0:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    v_mov_b32_e32 v1, 0
; GFX9-NEXT:    s_mov_b32 s11, s9
; GFX9-NEXT:    s_mov_b32 s10, s8
; GFX9-NEXT:    s_mov_b32 s9, s7
; GFX9-NEXT:    s_mov_b32 s8, s6
; GFX9-NEXT:    s_mov_b32 s7, s5
; GFX9-NEXT:    s_mov_b32 s6, s4
; GFX9-NEXT:    s_mov_b32 s5, s3
; GFX9-NEXT:    s_mov_b32 s4, s2
; GFX9-NEXT:    v_mov_b32_e32 v2, v1
; GFX9-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 unorm tfe d16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    global_store_short v[0:1], v1, off
; GFX9-NEXT:    global_store_dword v[0:1], v2, off
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: load_1d_f16_tfe_dmask0:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    s_mov_b32 s11, s9
; GFX10-NEXT:    s_mov_b32 s10, s8
; GFX10-NEXT:    s_mov_b32 s9, s7
; GFX10-NEXT:    s_mov_b32 s8, s6
; GFX10-NEXT:    s_mov_b32 s7, s5
; GFX10-NEXT:    s_mov_b32 s6, s4
; GFX10-NEXT:    s_mov_b32 s5, s3
; GFX10-NEXT:    s_mov_b32 s4, s2
; GFX10-NEXT:    v_mov_b32_e32 v2, v1
; GFX10-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 dim:SQ_RSRC_IMG_1D unorm tfe d16
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    global_store_short v[0:1], v1, off
; GFX10-NEXT:    global_store_dword v[0:1], v2, off
; GFX10-NEXT:    s_endpgm
;
; GFX8-UNPACKED-LABEL: load_1d_f16_tfe_dmask0:
; GFX8-UNPACKED:       ; %bb.0:
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v1, 0
; GFX8-UNPACKED-NEXT:    s_mov_b32 s11, s9
; GFX8-UNPACKED-NEXT:    s_mov_b32 s10, s8
; GFX8-UNPACKED-NEXT:    s_mov_b32 s9, s7
; GFX8-UNPACKED-NEXT:    s_mov_b32 s8, s6
; GFX8-UNPACKED-NEXT:    s_mov_b32 s7, s5
; GFX8-UNPACKED-NEXT:    s_mov_b32 s6, s4
; GFX8-UNPACKED-NEXT:    s_mov_b32 s5, s3
; GFX8-UNPACKED-NEXT:    s_mov_b32 s4, s2
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v2, v1
; GFX8-UNPACKED-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 unorm tfe d16
; GFX8-UNPACKED-NEXT:    s_waitcnt vmcnt(0)
; GFX8-UNPACKED-NEXT:    flat_store_short v[0:1], v1
; GFX8-UNPACKED-NEXT:    flat_store_dword v[0:1], v2
; GFX8-UNPACKED-NEXT:    s_endpgm
  %v = call { half, i32 } @llvm.amdgcn.image.load.1d.sl_f16i32s.i32(i32 0, i32 %s, <8 x i32> %rsrc, i32 1, i32 0)
  %v.data = extractvalue { half, i32 } %v, 0
  %v.err = extractvalue { half, i32 } %v, 1
  store volatile half %v.data, half addrspace(1)* undef
  store volatile i32 %v.err, i32 addrspace(1)* undef
  ret void
}

define amdgpu_ps void @load_1d_f16_tfe_dmask1(<8 x i32> inreg %rsrc, i32 %s) {
; GFX9-LABEL: load_1d_f16_tfe_dmask1:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    v_mov_b32_e32 v1, 0
; GFX9-NEXT:    s_mov_b32 s11, s9
; GFX9-NEXT:    s_mov_b32 s10, s8
; GFX9-NEXT:    s_mov_b32 s9, s7
; GFX9-NEXT:    s_mov_b32 s8, s6
; GFX9-NEXT:    s_mov_b32 s7, s5
; GFX9-NEXT:    s_mov_b32 s6, s4
; GFX9-NEXT:    s_mov_b32 s5, s3
; GFX9-NEXT:    s_mov_b32 s4, s2
; GFX9-NEXT:    v_mov_b32_e32 v2, v1
; GFX9-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 unorm tfe d16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    global_store_short v[0:1], v1, off
; GFX9-NEXT:    global_store_dword v[0:1], v2, off
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: load_1d_f16_tfe_dmask1:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    s_mov_b32 s11, s9
; GFX10-NEXT:    s_mov_b32 s10, s8
; GFX10-NEXT:    s_mov_b32 s9, s7
; GFX10-NEXT:    s_mov_b32 s8, s6
; GFX10-NEXT:    s_mov_b32 s7, s5
; GFX10-NEXT:    s_mov_b32 s6, s4
; GFX10-NEXT:    s_mov_b32 s5, s3
; GFX10-NEXT:    s_mov_b32 s4, s2
; GFX10-NEXT:    v_mov_b32_e32 v2, v1
; GFX10-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 dim:SQ_RSRC_IMG_1D unorm tfe d16
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    global_store_short v[0:1], v1, off
; GFX10-NEXT:    global_store_dword v[0:1], v2, off
; GFX10-NEXT:    s_endpgm
;
; GFX8-UNPACKED-LABEL: load_1d_f16_tfe_dmask1:
; GFX8-UNPACKED:       ; %bb.0:
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v1, 0
; GFX8-UNPACKED-NEXT:    s_mov_b32 s11, s9
; GFX8-UNPACKED-NEXT:    s_mov_b32 s10, s8
; GFX8-UNPACKED-NEXT:    s_mov_b32 s9, s7
; GFX8-UNPACKED-NEXT:    s_mov_b32 s8, s6
; GFX8-UNPACKED-NEXT:    s_mov_b32 s7, s5
; GFX8-UNPACKED-NEXT:    s_mov_b32 s6, s4
; GFX8-UNPACKED-NEXT:    s_mov_b32 s5, s3
; GFX8-UNPACKED-NEXT:    s_mov_b32 s4, s2
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v2, v1
; GFX8-UNPACKED-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 unorm tfe d16
; GFX8-UNPACKED-NEXT:    s_waitcnt vmcnt(0)
; GFX8-UNPACKED-NEXT:    flat_store_short v[0:1], v1
; GFX8-UNPACKED-NEXT:    flat_store_dword v[0:1], v2
; GFX8-UNPACKED-NEXT:    s_endpgm
  %v = call { half, i32 } @llvm.amdgcn.image.load.1d.sl_f16i32s.i32(i32 1, i32 %s, <8 x i32> %rsrc, i32 1, i32 0)
  %v.data = extractvalue { half, i32 } %v, 0
  %v.err = extractvalue { half, i32 } %v, 1
  store volatile half %v.data, half addrspace(1)* undef
  store volatile i32 %v.err, i32 addrspace(1)* undef
  ret void
}

define amdgpu_ps void @load_1d_v2f16_tfe_dmask0(<8 x i32> inreg %rsrc, i32 %s) {
; GFX9-LABEL: load_1d_v2f16_tfe_dmask0:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    v_mov_b32_e32 v1, 0
; GFX9-NEXT:    s_mov_b32 s11, s9
; GFX9-NEXT:    s_mov_b32 s10, s8
; GFX9-NEXT:    s_mov_b32 s9, s7
; GFX9-NEXT:    s_mov_b32 s8, s6
; GFX9-NEXT:    s_mov_b32 s7, s5
; GFX9-NEXT:    s_mov_b32 s6, s4
; GFX9-NEXT:    s_mov_b32 s5, s3
; GFX9-NEXT:    s_mov_b32 s4, s2
; GFX9-NEXT:    v_mov_b32_e32 v2, v1
; GFX9-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 unorm tfe d16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    global_store_dword v[0:1], v1, off
; GFX9-NEXT:    global_store_dword v[0:1], v2, off
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: load_1d_v2f16_tfe_dmask0:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    s_mov_b32 s11, s9
; GFX10-NEXT:    s_mov_b32 s10, s8
; GFX10-NEXT:    s_mov_b32 s9, s7
; GFX10-NEXT:    s_mov_b32 s8, s6
; GFX10-NEXT:    s_mov_b32 s7, s5
; GFX10-NEXT:    s_mov_b32 s6, s4
; GFX10-NEXT:    s_mov_b32 s5, s3
; GFX10-NEXT:    s_mov_b32 s4, s2
; GFX10-NEXT:    v_mov_b32_e32 v2, v1
; GFX10-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 dim:SQ_RSRC_IMG_1D unorm tfe d16
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    global_store_dword v[0:1], v1, off
; GFX10-NEXT:    global_store_dword v[0:1], v2, off
; GFX10-NEXT:    s_endpgm
;
; GFX8-UNPACKED-LABEL: load_1d_v2f16_tfe_dmask0:
; GFX8-UNPACKED:       ; %bb.0:
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v1, 0
; GFX8-UNPACKED-NEXT:    s_mov_b32 s11, s9
; GFX8-UNPACKED-NEXT:    s_mov_b32 s10, s8
; GFX8-UNPACKED-NEXT:    s_mov_b32 s9, s7
; GFX8-UNPACKED-NEXT:    s_mov_b32 s8, s6
; GFX8-UNPACKED-NEXT:    s_mov_b32 s7, s5
; GFX8-UNPACKED-NEXT:    s_mov_b32 s6, s4
; GFX8-UNPACKED-NEXT:    s_mov_b32 s5, s3
; GFX8-UNPACKED-NEXT:    s_mov_b32 s4, s2
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v2, v1
; GFX8-UNPACKED-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 unorm tfe d16
; GFX8-UNPACKED-NEXT:    s_waitcnt vmcnt(0)
; GFX8-UNPACKED-NEXT:    flat_store_dword v[0:1], v1
; GFX8-UNPACKED-NEXT:    flat_store_dword v[0:1], v2
; GFX8-UNPACKED-NEXT:    s_endpgm
  %v = call { <2 x half>, i32 } @llvm.amdgcn.image.load.1d.sl_v2f16i32s.i32(i32 0, i32 %s, <8 x i32> %rsrc, i32 1, i32 0)
  %v.data = extractvalue { <2 x half>, i32 } %v, 0
  %v.err = extractvalue { <2 x half>, i32 } %v, 1
  store volatile <2 x half> %v.data, <2 x half> addrspace(1)* undef
  store volatile i32 %v.err, i32 addrspace(1)* undef
  ret void
}

define amdgpu_ps void @load_1d_v2f16_tfe_dmask1(<8 x i32> inreg %rsrc, i32 %s) {
; GFX9-LABEL: load_1d_v2f16_tfe_dmask1:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    v_mov_b32_e32 v1, 0
; GFX9-NEXT:    s_mov_b32 s11, s9
; GFX9-NEXT:    s_mov_b32 s10, s8
; GFX9-NEXT:    s_mov_b32 s9, s7
; GFX9-NEXT:    s_mov_b32 s8, s6
; GFX9-NEXT:    s_mov_b32 s7, s5
; GFX9-NEXT:    s_mov_b32 s6, s4
; GFX9-NEXT:    s_mov_b32 s5, s3
; GFX9-NEXT:    s_mov_b32 s4, s2
; GFX9-NEXT:    v_mov_b32_e32 v2, v1
; GFX9-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 unorm tfe d16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    global_store_dword v[0:1], v1, off
; GFX9-NEXT:    global_store_dword v[0:1], v2, off
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: load_1d_v2f16_tfe_dmask1:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    s_mov_b32 s11, s9
; GFX10-NEXT:    s_mov_b32 s10, s8
; GFX10-NEXT:    s_mov_b32 s9, s7
; GFX10-NEXT:    s_mov_b32 s8, s6
; GFX10-NEXT:    s_mov_b32 s7, s5
; GFX10-NEXT:    s_mov_b32 s6, s4
; GFX10-NEXT:    s_mov_b32 s5, s3
; GFX10-NEXT:    s_mov_b32 s4, s2
; GFX10-NEXT:    v_mov_b32_e32 v2, v1
; GFX10-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 dim:SQ_RSRC_IMG_1D unorm tfe d16
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    global_store_dword v[0:1], v1, off
; GFX10-NEXT:    global_store_dword v[0:1], v2, off
; GFX10-NEXT:    s_endpgm
;
; GFX8-UNPACKED-LABEL: load_1d_v2f16_tfe_dmask1:
; GFX8-UNPACKED:       ; %bb.0:
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v1, 0
; GFX8-UNPACKED-NEXT:    s_mov_b32 s11, s9
; GFX8-UNPACKED-NEXT:    s_mov_b32 s10, s8
; GFX8-UNPACKED-NEXT:    s_mov_b32 s9, s7
; GFX8-UNPACKED-NEXT:    s_mov_b32 s8, s6
; GFX8-UNPACKED-NEXT:    s_mov_b32 s7, s5
; GFX8-UNPACKED-NEXT:    s_mov_b32 s6, s4
; GFX8-UNPACKED-NEXT:    s_mov_b32 s5, s3
; GFX8-UNPACKED-NEXT:    s_mov_b32 s4, s2
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v2, v1
; GFX8-UNPACKED-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x1 unorm tfe d16
; GFX8-UNPACKED-NEXT:    s_waitcnt vmcnt(0)
; GFX8-UNPACKED-NEXT:    flat_store_dword v[0:1], v1
; GFX8-UNPACKED-NEXT:    flat_store_dword v[0:1], v2
; GFX8-UNPACKED-NEXT:    s_endpgm
  %v = call { <2 x half>, i32 } @llvm.amdgcn.image.load.1d.sl_v2f16i32s.i32(i32 1, i32 %s, <8 x i32> %rsrc, i32 1, i32 0)
  %v.data = extractvalue { <2 x half>, i32 } %v, 0
  %v.err = extractvalue { <2 x half>, i32 } %v, 1
  store volatile <2 x half> %v.data, <2 x half> addrspace(1)* undef
  store volatile i32 %v.err, i32 addrspace(1)* undef
  ret void
}

define amdgpu_ps void @load_1d_v2f16_tfe_dmask3(<8 x i32> inreg %rsrc, i32 %s) {
; GFX9-LABEL: load_1d_v2f16_tfe_dmask3:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    v_mov_b32_e32 v1, 0
; GFX9-NEXT:    s_mov_b32 s11, s9
; GFX9-NEXT:    s_mov_b32 s10, s8
; GFX9-NEXT:    s_mov_b32 s9, s7
; GFX9-NEXT:    s_mov_b32 s8, s6
; GFX9-NEXT:    s_mov_b32 s7, s5
; GFX9-NEXT:    s_mov_b32 s6, s4
; GFX9-NEXT:    s_mov_b32 s5, s3
; GFX9-NEXT:    s_mov_b32 s4, s2
; GFX9-NEXT:    v_mov_b32_e32 v2, v1
; GFX9-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x3 unorm tfe d16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    global_store_dword v[0:1], v1, off
; GFX9-NEXT:    global_store_dword v[0:1], v2, off
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: load_1d_v2f16_tfe_dmask3:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    s_mov_b32 s11, s9
; GFX10-NEXT:    s_mov_b32 s10, s8
; GFX10-NEXT:    s_mov_b32 s9, s7
; GFX10-NEXT:    s_mov_b32 s8, s6
; GFX10-NEXT:    s_mov_b32 s7, s5
; GFX10-NEXT:    s_mov_b32 s6, s4
; GFX10-NEXT:    s_mov_b32 s5, s3
; GFX10-NEXT:    s_mov_b32 s4, s2
; GFX10-NEXT:    v_mov_b32_e32 v2, v1
; GFX10-NEXT:    image_load v[1:2], v0, s[4:11] dmask:0x3 dim:SQ_RSRC_IMG_1D unorm tfe d16
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    global_store_dword v[0:1], v1, off
; GFX10-NEXT:    global_store_dword v[0:1], v2, off
; GFX10-NEXT:    s_endpgm
;
; GFX8-UNPACKED-LABEL: load_1d_v2f16_tfe_dmask3:
; GFX8-UNPACKED:       ; %bb.0:
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v1, 0
; GFX8-UNPACKED-NEXT:    s_mov_b32 s11, s9
; GFX8-UNPACKED-NEXT:    s_mov_b32 s10, s8
; GFX8-UNPACKED-NEXT:    s_mov_b32 s9, s7
; GFX8-UNPACKED-NEXT:    s_mov_b32 s8, s6
; GFX8-UNPACKED-NEXT:    s_mov_b32 s7, s5
; GFX8-UNPACKED-NEXT:    s_mov_b32 s6, s4
; GFX8-UNPACKED-NEXT:    s_mov_b32 s5, s3
; GFX8-UNPACKED-NEXT:    s_mov_b32 s4, s2
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v2, v1
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v3, v1
; GFX8-UNPACKED-NEXT:    image_load v[1:3], v0, s[4:11] dmask:0x3 unorm tfe d16
; GFX8-UNPACKED-NEXT:    s_waitcnt vmcnt(0)
; GFX8-UNPACKED-NEXT:    v_lshlrev_b32_e32 v0, 16, v2
; GFX8-UNPACKED-NEXT:    v_or_b32_sdwa v0, v1, v0 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
; GFX8-UNPACKED-NEXT:    flat_store_dword v[0:1], v0
; GFX8-UNPACKED-NEXT:    flat_store_dword v[0:1], v3
; GFX8-UNPACKED-NEXT:    s_endpgm
  %v = call { <2 x half>, i32 } @llvm.amdgcn.image.load.1d.sl_v2f16i32s.i32(i32 3, i32 %s, <8 x i32> %rsrc, i32 1, i32 0)
  %v.data = extractvalue { <2 x half>, i32 } %v, 0
  %v.err = extractvalue { <2 x half>, i32 } %v, 1
  store volatile <2 x half> %v.data, <2 x half> addrspace(1)* undef
  store volatile i32 %v.err, i32 addrspace(1)* undef
  ret void
}

; define amdgpu_ps void @load_1d_v3f16_tfe_dmask7(<8 x i32> inreg %rsrc, i32 %s) {
;   %v = call { <3 x half>, i32 } @llvm.amdgcn.image.load.1d.sl_v3f16i32s.i32(i32 7, i32 %s, <8 x i32> %rsrc, i32 1, i32 0)
;   %v.data = extractvalue { <3 x half>, i32 } %v, 0
;   %v.err = extractvalue { <3 x half>, i32 } %v, 1
;   store volatile <3 x half> %v.data, <3 x half> addrspace(1)* undef
;   store volatile i32 %v.err, i32 addrspace(1)* undef
;   ret void
; }

define amdgpu_ps void @load_1d_v4f16_tfe_dmask15(<8 x i32> inreg %rsrc, i32 %s) {
; GFX9-LABEL: load_1d_v4f16_tfe_dmask15:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    v_mov_b32_e32 v1, 0
; GFX9-NEXT:    s_mov_b32 s11, s9
; GFX9-NEXT:    s_mov_b32 s10, s8
; GFX9-NEXT:    s_mov_b32 s9, s7
; GFX9-NEXT:    s_mov_b32 s8, s6
; GFX9-NEXT:    s_mov_b32 s7, s5
; GFX9-NEXT:    s_mov_b32 s6, s4
; GFX9-NEXT:    s_mov_b32 s5, s3
; GFX9-NEXT:    s_mov_b32 s4, s2
; GFX9-NEXT:    v_mov_b32_e32 v2, v1
; GFX9-NEXT:    v_mov_b32_e32 v3, v1
; GFX9-NEXT:    image_load v[1:3], v0, s[4:11] dmask:0xf unorm tfe d16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    global_store_dwordx2 v[0:1], v[1:2], off
; GFX9-NEXT:    global_store_dword v[0:1], v3, off
; GFX9-NEXT:    s_endpgm
;
; GFX10-LABEL: load_1d_v4f16_tfe_dmask15:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    v_mov_b32_e32 v1, 0
; GFX10-NEXT:    s_mov_b32 s11, s9
; GFX10-NEXT:    s_mov_b32 s10, s8
; GFX10-NEXT:    s_mov_b32 s9, s7
; GFX10-NEXT:    s_mov_b32 s8, s6
; GFX10-NEXT:    s_mov_b32 s7, s5
; GFX10-NEXT:    s_mov_b32 s6, s4
; GFX10-NEXT:    s_mov_b32 s5, s3
; GFX10-NEXT:    s_mov_b32 s4, s2
; GFX10-NEXT:    v_mov_b32_e32 v2, v1
; GFX10-NEXT:    v_mov_b32_e32 v3, v1
; GFX10-NEXT:    image_load v[1:3], v0, s[4:11] dmask:0xf dim:SQ_RSRC_IMG_1D unorm tfe d16
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    global_store_dwordx2 v[0:1], v[1:2], off
; GFX10-NEXT:    global_store_dword v[0:1], v3, off
; GFX10-NEXT:    s_endpgm
;
; GFX8-UNPACKED-LABEL: load_1d_v4f16_tfe_dmask15:
; GFX8-UNPACKED:       ; %bb.0:
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v1, 0
; GFX8-UNPACKED-NEXT:    s_mov_b32 s11, s9
; GFX8-UNPACKED-NEXT:    s_mov_b32 s10, s8
; GFX8-UNPACKED-NEXT:    s_mov_b32 s9, s7
; GFX8-UNPACKED-NEXT:    s_mov_b32 s8, s6
; GFX8-UNPACKED-NEXT:    s_mov_b32 s7, s5
; GFX8-UNPACKED-NEXT:    s_mov_b32 s6, s4
; GFX8-UNPACKED-NEXT:    s_mov_b32 s5, s3
; GFX8-UNPACKED-NEXT:    s_mov_b32 s4, s2
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v2, v1
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v3, v1
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v4, v1
; GFX8-UNPACKED-NEXT:    v_mov_b32_e32 v5, v1
; GFX8-UNPACKED-NEXT:    image_load v[1:5], v0, s[4:11] dmask:0xf unorm tfe d16
; GFX8-UNPACKED-NEXT:    s_waitcnt vmcnt(0)
; GFX8-UNPACKED-NEXT:    v_lshlrev_b32_e32 v0, 16, v4
; GFX8-UNPACKED-NEXT:    v_lshlrev_b32_e32 v4, 16, v2
; GFX8-UNPACKED-NEXT:    v_or_b32_sdwa v2, v3, v0 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
; GFX8-UNPACKED-NEXT:    v_or_b32_sdwa v1, v1, v4 dst_sel:DWORD dst_unused:UNUSED_PAD src0_sel:WORD_0 src1_sel:DWORD
; GFX8-UNPACKED-NEXT:    flat_store_dwordx2 v[0:1], v[1:2]
; GFX8-UNPACKED-NEXT:    flat_store_dword v[0:1], v5
; GFX8-UNPACKED-NEXT:    s_endpgm
  %v = call { <4 x half>, i32 } @llvm.amdgcn.image.load.1d.sl_v4f16i32s.i32(i32 15, i32 %s, <8 x i32> %rsrc, i32 1, i32 0)
  %v.data = extractvalue { <4 x half>, i32 } %v, 0
  %v.err = extractvalue { <4 x half>, i32 } %v, 1
  store volatile <4 x half> %v.data, <4 x half> addrspace(1)* undef
  store volatile i32 %v.err, i32 addrspace(1)* undef
  ret void
}

declare { half, i32 } @llvm.amdgcn.image.load.1d.sl_f16i32s.i32(i32 immarg, i32, <8 x i32>, i32 immarg, i32 immarg) #0
declare { <2 x half>, i32 } @llvm.amdgcn.image.load.1d.sl_v2f16i32s.i32(i32 immarg, i32, <8 x i32>, i32 immarg, i32 immarg) #0
declare { <3 x half>, i32 } @llvm.amdgcn.image.load.1d.sl_v3f16i32s.i32(i32 immarg, i32, <8 x i32>, i32 immarg, i32 immarg) #0
declare { <4 x half>, i32 } @llvm.amdgcn.image.load.1d.sl_v4f16i32s.i32(i32 immarg, i32, <8 x i32>, i32 immarg, i32 immarg) #0

attributes #0 = { nounwind readonly }
