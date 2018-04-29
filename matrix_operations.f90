module matrix_operations

implicit none
integer (kind = 4), parameter :: Kind = 4
contains

  subroutine gaussian_elimination (A, X, mSize)

    implicit none
    integer (kind = 4) :: I, J
    integer (kind = 4), intent(in) :: mSize
    real (kind = Kind), intent(inout) :: A(mSize,mSize), X(mSize)
    real (kind = Kind) :: C
    do I = 1, mSize
      do J = 1, mSize
        if (I .NE. J) then
          C = A(I,J) / A(I,I)
          A(:,J) = A(:,J) - C*A(:,I)
          X(J) = X(J) - C*X(I)
          X(I) = X(I) / A(I,I)
          A(:,I) = A(:,I) / A(I,I)
        end if
      end do
    end do

  end subroutine gaussian_elimination

  subroutine fill (A, P1, P2, P3, N)
    implicit none
    integer (kind = 4), intent(in) :: N
    integer (kind = 4) :: i
    real (kind = Kind), intent(inout) :: P1, P2, P3
    real (kind = Kind), intent(inout) :: A(N, N)
    A = 0
    P1 = 1.0 / N**2
    P2 = -2.0 / N**2
    P3 = 1.0 / N**2
    do i=1, N
        A(i,i) = P2
        if (i .GT. 1) then
          A(i-1, i) = P1
          A(i, i-1) = P3
        endif
    end do

  end subroutine

  subroutine fill_points(P, N)
    implicit none
    integer (kind = 4), intent(in) :: N
    integer (kind = 4) :: i
    real (kind = Kind), intent(inout) :: P(N+1)
    P(1) = 0
    do i=2, N
      P(i) = (i-1.0)/N
    end do
    P(N+1) = 1
  end subroutine

end module
