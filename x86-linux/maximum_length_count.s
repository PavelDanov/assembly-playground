#PURPOSE:    This program finds the maximum number of a
#            set of data items.
#

#VARIABLES:  The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - Largest data item found
# %eax - Current data item
# %ecx - Hold our length count
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
#              to terminate the data
#

.section .data

data_items:
.long 3,67,34,235,45,75,14,34,39,28,98,11,66,255

.section .text

.globl _start
_start:

movl $0, %ecx                  # move 0 into the count
movl $0, %edi                  # use edi as current index
start_count_loop:
cmpl $255, %ecx                # check to see if we've hit the end
je start_count_loop_exit
incl %edi                      # increment index by one
movl %edi, %ecx                # put current index into ecx
jmp start_count_loop           # jump back at the beginning

start_count_loop_exit:


movl $0, %edi                   # move 0 into the index register
movl data_items(,%edi,4), %eax  # load the first byte of data
movl %eax, %ebx                 # since this is the first item
                                # %eax is the biggest

start_loop:
cmpl %ecx, %eax                 # check to see if we've hit the end
je loop_exit
incl %edi                       # load next value
movl data_items(,%edi,4), %eax
cmpl %ebx, %eax                 # compare values
jle start_loop                  # jump to loop beginning if the new
                                # one isn't bigger
movl %eax, %ebx                 # move the value as the largest
jmp start_loop                  # jump to loop beginning

loop_exit:
# %ebx is the status code for the exit system call
# and it already has the maximum number
movl $1, %eax                   # 1 is the exit() syscall
int $0x80
