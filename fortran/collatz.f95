program collatz
    !declarations
    implicit none
    integer(kind=8), parameter :: nmax = 1000000
    integer(kind=8) :: i, n, length, maxlength
    !main
    maxlength = 0
    do n = 2, nmax
        i = n
        length = 0
        do while (i > 1)
            if (mod(i, 2) .ne. 0) then
                i = 3*i+1
            else
                i = i/2
            endif
            length = length + 1
        end do
        if (length > maxlength) then
            maxlength = length
            print *, n, " -> ", length
        endif
    end do
    
end program collatz
