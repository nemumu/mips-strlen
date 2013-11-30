.text
main:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	lui	$a0,0x1001
	jal	strlen
	nop
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
	nop
	
# $t0に$a0の作業用コピー
strlen:
	addiu	$sp,$sp,-4
	add	$t0, $a0,$zero
	add	$t1, $a0,$zero # 処理中に$a1が変わった場合の対策
	
L1:
	lbu	$t2,0($t0)	# xVal = *x
	beq	$t2,$zero,L2	# if(xVal == 0) goto L2
	addi	$t0,$t0,1	# x++ (先頭アドレスのインクリメント)
	j	L1
L2:
	# 元のアドレスと移動したアドレスとの差を取る
	sub	$t2,$t0, $t1
	add	$v0,$zero,$t2	# return i
	lw	$s0,0($sp)
	addi	$sp,$sp,4
	jr	$ra
	nop

.data
word:
	.byte	0x41	# A
	.byte	0x42	# B
	.byte	0x43	# C
	.byte	0x44	# D
	.byte	0x45	# E
	.byte	0x46	# F
	.byte	0x47	# G
	.byte	0x48	# H
	.byte	0x00	# Null文字
