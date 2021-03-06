	.file	"linux.s"
	.globl	f
f:
	pushl	%ebp
	movl	%esp,%ebp
        movl    8(%ebp),  %esi
        movl    12(%ebp), %edi
        pushl   %ebx

### This is where your code begins ...


## START SIZE TEST
# Are the images the same size? If not, skip to the end.

# figure out the size of image1.
# image 1, value 1
        movl	(%esi), %eax
# image 1, value 2
        movl	4(%esi), %ebx
	imull	%ebx, %eax
# eax now contains the size of image1.

# figure out the size of image2
# image 2, value 1
        movl	(%edi), %ecx
# image 2, value 2
        movl	4(%edi), %ebx
	imull	%ebx, %ecx
# ecx now contains the size of image2.

# compare, make sure they are the same size
	cmp	%eax, %ecx
	jne	wrongsize

# save off the size of image2, we'll use it later.
	pushl	%ecx

## END SIZE TEST

## IMAGE1 asterisks
# make eax point to (one past) the end of the image1 array
	imull	$4, %eax
	addl	$8, %eax
        addl	%esi, %eax

# make ebx point to the beginning of the image1 array
	movl	$8, %ebx
        addl	%esi, %ebx

# replace current pixel
pixel1:
	movl	$42, (%ebx)
# advance forward
	addl	$4, %ebx
# keep going?
	cmp	%eax, %ebx
	jl	pixel1

i1done: # debug only
## end IMAGE1 asterisks


## IMAGE2 asterisks

# size of image2
	popl	%eax
# make eax point to (one past) the end of the image2 array
	imull	$4, %eax
	addl	$8, %eax
        addl	%edi, %eax

# make ebx point to the beginning of the image2 array
	movl	$8, %ebx
        addl	%edi, %ebx

# replace current pixel
pixel2:
	movl	$42, (%ebx)
# advance forward
	addl	$4, %ebx
# keep going?
	cmp	%eax, %ebx
	jl	pixel2

i2done: # debug only
## end IMAGE2 asterisks


# successful, but we need to skip the 'wrongsize' return value.
	movl	$42, %eax
	jmp	done

# wrongsize retval
wrongsize:
	movl	$0, %eax

# we're out of here.
done:

### This is where your code ends ...

        popl    %ebx
	movl	%ebp,%esp
	popl	%ebp
	ret
