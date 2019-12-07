program collatz
    !declarations
    implicit none
    integer, parameter :: mk = 8
    integer(kind=8), parameter :: nmax = 5000000000_mk
    integer(kind=8) :: j, n, length, tenth, temp
    integer(kind=8), dimension(20) :: biggest
    !main
    biggest = 0
    tenth = 0
    do n = 2_mk, nmax
        length = getLength(n)
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
    do j = 1, 19, 2
        print "(AI0AI0)", "Number = ", biggest(j+1), ", Length = ", biggest(j)
        !swap
        temp = biggest(j)
        biggest(j) = biggest(j+1)
        biggest(j+1) = temp
    enddo
    call sort(biggest)
    print *, " "
    print *, "By size:"
    do j = 1, 19, 2
        print "(AI0AI0)", "Number = ", biggest(j), ", Length = ", biggest(j+1)
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
    
    recursive function getLength(i) result(leng)
        integer(kind=8) :: i, leng
        if(i .eq. 1) then
            leng = 0
        elseif(mod(i, 2) .ne. 0) then
            leng = getLength(3*i+1)+1
        else
            leng = getLength(i/2)+1
        endif
    end function getLength
end program collatz
