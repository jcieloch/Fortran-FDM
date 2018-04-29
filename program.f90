program fdm
  use matrix_operations

  implicit none
  ! Kind is defined as parameter in module matrix_operations
  integer (kind = 4) :: N, mSize, i
  real (kind = Kind), allocatable, dimension(:,:) :: A
  real (kind = Kind), allocatable, dimension(:) :: X, B, points, errors
  real (kind = Kind) :: P1, P2, P3, average_error
  ! A*B = X
  read *, N
  mSize = N - 1
  allocate(A(mSize, mSize))
  allocate(X(mSize))
  allocate(B(N+1))
  allocate(points(N+1))
  allocate(errors(N+1))
  B = 0
  X = 0
  call fill (A, P1, P2, P3, mSize)
  X(mSize) = -P3    !boundary condition u(1)=1
  call fill_points (points, N)
  call gaussian_elimination(A, X, mSize)
  B(N+1) = 1
  B(2:N) = X

  open(unit=1, file='data.dat')
  do i=1, N+1
    write(1, *) points(i), B(i)
  end do
  close(unit=1)

  do i=2, N+1
    errors(i) = abs(points(i) - B(i)) / points(i)
  end do
  average_error = sum(errors) / (N-1)

  open(unit=1, file='errors.dat')
  do i=1, N+1
    write(1, *) points(i), errors(i)
  end do
  close(unit=1)

  write(*,*) 'average error for kind', Kind, ' : ', average_error

  deallocate(A, X, B, points, errors)

end program fdm
