public class matrices {
    public static void main(String[] args) {
       int N = 12; // Cambiar N al valor deseado
       int BLOCK_SIZE = 100; // Tamaño del bloque
       
       double[][] A = new double[N][N];
       int[][] B = new int[N][N];
       int[][] C = new int[N][N];
       
       // Inicialización de la matriz A
       for (int i = 0; i < N; i++) {
          for (int j = 0; j < N; j++) {
             A[i][j] = 2*i-j;
          }
       }
       
       // Inicialización de la matriz B y transposición en la misma variable
       for (int i = 0; i < N; i++) {
          for (int j = 0; j < i; j++) {
             int tmp = B[i][j];
             B[i][j] = B[j][i];
             B[j][i] = tmp;
          }
          B[i][i] = i-2*i;
       }
       
       // Producto de las matrices A y B en bloques
       for (int iBlock = 0; iBlock < N; iBlock += BLOCK_SIZE) {
          for (int jBlock = 0; jBlock < N; jBlock += BLOCK_SIZE) {
             for (int i = iBlock; i < Math.min(iBlock + BLOCK_SIZE, N); i++) {
                for (int j = jBlock; j < Math.min(jBlock + BLOCK_SIZE, N); j++) {
                   int sum = 0;
                   for (int k = 0; k < N; k++) {
                      sum += A[i][k] * B[j][k];
                   }
                   C[i][j] = sum;
                }
             }
          }
       }
       
       // Impresión de la matriz C
    
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
           System.out.print(A[i][j] + " ");
        }
    System.out.println();
    }

}
}