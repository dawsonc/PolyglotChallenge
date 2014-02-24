! Finds the roots of a quadratic using Newton's method
!   Inputs: Coefficients of the quadratic
!		Outputs: Roots of the quadratic

PROGRAM newton
	IMPLICIT NONE

	REAL :: a, b, c
	REAL :: guess, next

	WRITE(*,*) 'y = ax^2 + bx + c'
	WRITE(*,*) 'a: '
	READ(*,*) a
	WRITE(*,*) 'b: '
	READ(*,*) b
	WRITE(*,*) 'c: '
	READ(*,*) c

	WRITE(*,*) 'Enter guess: '
	READ(*,*) guess

	DO
		next = guess - (y(a, b, c, guess) / yPrime(a, b, c, guess))

		IF (abs(next - guess) < 0.00001) THEN
			EXIT
		END IF

		guess = next
	END DO

	WRITE(*,*) 'Found root: ', next

CONTAINS

	REAL FUNCTION y(a, b, c, x)
		IMPLICIT NONE

		REAL, INTENT(IN) :: a, b, c, x

		y = a*(x*x) + b*x + c
	END FUNCTION y

	REAL FUNCTION yPrime(a, b, c, x)
		IMPLICIT NONE

		REAL, INTENT(IN) :: a, b, c, x

		yPrime = 2*a*x + b
	END FUNCTION yPrime

END PROGRAM newton