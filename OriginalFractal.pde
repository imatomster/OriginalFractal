int radCounter = 0;
int tempRX = 0;
int tempRY = 0;

int controlN = 0;

public void setup(){
	size(500, 500);
	background(0);
}

public void draw(){
	background(0);
	radCounter = 0;
	fibfrac(250, 250, controlN, 50);
	radCounter = 1;
	fibfrac(250, 250, controlN, 50);
	radCounter = 2;
	fibfrac(250, 250, controlN, 50);
	radCounter = 3;
	fibfrac(250, 250, controlN, 50);
}

public void fibfrac(int x, int y, int n, int siz){
	strokeWeight(5);
	stroke(random(255),random(255),random(255));
	noFill();
	if(n == 0){
		arc(x, y, fib(n) * siz, fib(n) * siz, PI/2, PI);
	}else if(n == 1){
		fibfrac(x,y,n-1,siz);
		arc(x, y, fib(n) * siz, fib(n) * siz, 0, PI/2);
	}else {
		fibfrac(x,y,n-1,siz);

		if(radCounter == 0){
			tempRX = radCounter;
			tempRY = radCounter;
			radCounter++;
			arc(fibX(x, n, siz), fibY(y, n, siz), fib(n) * siz, fib(n) * siz, 3*PI/2 , 2*PI);
		}else if(radCounter == 1){
			tempRX = radCounter;
			tempRY = radCounter;
			radCounter++;
			arc(fibX(x, n, siz), fibY(y, n, siz), fib(n) * siz, fib(n) * siz, PI, 3*PI/2);
		}else if(radCounter == 2){
			tempRX = radCounter;
			tempRY = radCounter;
			radCounter++;
			arc(fibX(x, n, siz), fibY(y, n, siz), fib(n) * siz, fib(n) * siz, PI/2, PI);
		}else if(radCounter == 3){
			tempRX = radCounter;
			tempRY = radCounter;
			radCounter = 0;
			arc(fibX(x, n, siz), fibY(y, n, siz), fib(n) * siz, fib(n) * siz, 0, PI/2);
		}
	}
}

public int fib(int n){
	if(n == 0){
		return 1;
	}else if(n== 1){
		return 1;
	}else {
		return fib(n-1) + fib(n-2);
	}
}

public int fibX(int x, int n, int siz){
	if(n <= 1){
		return x;
	}else if(tempRX == 0){
		tempRX = 3;
		return fibX(x,n-1,siz) - fib(n-2) * siz/2;
	}else if(tempRX == 1){
		tempRX--;
		return fibX(x,n-1,siz);
	}else if(tempRX == 2){
		tempRX--;
		return fibX(x,n-1,siz) + fib(n-2) * siz/2;
	}else{
		tempRX--;
		return fibX(x,n-1,siz);
	}
}

public int fibY(int y, int n, int siz){
	if(n <= 1){
		return y;
	}else if(tempRY == 0){
		tempRY = 3;
		return fibY(y,n-1,siz);
	}else if(tempRY == 1){
		tempRY--;
		return fibY(y,n-1,siz) + fib(n-2) * siz/2;
	}else if(tempRY == 2){
		tempRY--;
		return fibY(y,n-1,siz);
	}else{
		tempRY--;
		return fibY(y,n-1,siz) - fib(n-2) * siz/2;
	}
}

public void keyPressed(){
	if(keyCode == UP){
		if(controlN < 7)
		controlN ++;
	}
	if(keyCode == DOWN){
		if(controlN > 0){
			controlN --;
		}
	}
}