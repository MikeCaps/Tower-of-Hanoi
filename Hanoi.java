public class hanoi{
	public static void main(String [] args){
		tower(3, 'A', 'C', 'B');
	}
	
	
	public static void tower(int n, char a, char b, char c){
		if(n == 1){
			System.out.println("Move disk 1 from " + a + " to " + b);
		}else{
			tower(n-1, a, c, b);
			System.out.println("Move disk " + n + " from " + a + " to " + b);
			tower(n-1, c, b, a);
		}
	}
}