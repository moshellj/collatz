program collatz
    !declarations
    implicit none
    integer, parameter :: mk = 8 !fixes literals
    integer(kind=8), parameter :: nmax = 5000000000_mk
    integer(kind=8) :: i, n, length, tenth, temp
    integer(kind=8), dimension(20) :: biggest
    !main
    biggest = 0
    tenth = 0
    do n = 2_mk, nmax
        i = n
        length = 0
        do while (i > 1) !compute
            if (mod(i, 2) .ne. 0) then
                i = 3*i+1
            else
                i = i/2
            endif
            length = length + 1
        enddo
        if (length >= tenth) then !largest element tracking
            !print *, n, " -> ", length
            biggest(19) = length
            biggest(20) = n
            call sort(biggest)
            tenth = biggest(19)
        endif
    enddo
    !printout
    print *, "Largest elements:"
    print *, " "
    print *, "By length:"
    do i = 1, 19, 2
        print "(AI0AI0)", "Number = ", biggest(i+1), ", Length = ", biggest(i)
        !swap
        temp = biggest(i)
        biggest(i) = biggest(i+1)
        biggest(i+1) = temp
    enddo
    call sort(biggest)
    print *, " "
    print *, "By size:"
    do i = 1, 19, 2
        print "(AI0AI0)", "Number = ", biggest(i), ", Length = ", biggest(i+1)
    enddo
    
contains
    !Fortran is not an object oriented language, and thus, does not have
    !a pair class or a standard sorting function. so here's a sorting routine.
    !It's bubble sort because it's simple and the list is only 10 pairs long
    subroutine sort(list)
        !largest-to-smallest
        integer(kind=8), dimension(20) :: list
        integer :: a, b
        integer(kind=8) :: temp1, temp2
        do a = 17, 1, -2
            do b = 1, a, 2
                if (list(b) < list(b+2)) then !swap
                    temp1 = list(b)
                    temp2 = list(b+1)
                    list(b) = list(b+2)
                    list(b+1) = list(b+3)
                    list(b+2) = temp1
                    list(b+3) = temp2
                endif
            enddo
        enddo
    end subroutine sort
end program collatz
