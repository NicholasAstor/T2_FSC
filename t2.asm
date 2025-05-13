.data
hello_world: "Hello, World!\n"

.text
main:
    # Print "Hello, World!"
    li a7, 4          # syscall for print string
    la a0, hello_world # load address of string
    ecall             # make syscall

    # Exit program
    li a7, 10         # syscall for exit
    ecall             # make syscall