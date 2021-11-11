import java.util.Arrays;

/**
 * @author Renassiance
 * @date 2021/11/5 12:54
 */
public class Solution {
    public static void main(String[] args) {
        int[] pi = {0, 6, 8, 12, 2, 1, 4, 5, 3, 11, 7, 10, 9, 13};
//        int[] pi ={0, 8, 7, 4, 2, 5, 1, 9, 3, 10, 6 };
        int n = pi.length - 1;
        int[][] size = new int[n + 1][n + 1];
        mnset(pi, size, n);
        int[] net = new int[n];
        int m = traceback(pi, size, net, n);
        System.out.println("电路布线最大不相交连线数目为： " + m);
    }

    public static void mnset(int[] pi, int[][] size, int n) {
        for (int j = 1; j <= n; j++) {//上端点为1的情况
            if (j < pi[1]) {
                size[1][j] = 0;
            } else {
                size[1][j] = 1;
            }
        }
        for (int i = 2; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                if (j < pi[i]) {
                    size[i][j] = size[i - 1][j];
                } else {
                    if (size[i - 1][j] > size[i - 1][pi[i] - 1] + 1) {
                        size[i][j] = size[i - 1][j];
                    } else
                        size[i][j] = size[i - 1][pi[i] - 1] + 1;
                }
            }
        }
        // 输出电路布线问题的矩阵
        for (int i = 1; i <= n; i++) {
            for (int j = 0; j <= n; j++) {
                System.out.print(size[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static int traceback(int[] pi, int[][] size, int[] net, int n) {
        int j = n;
        int m = 0;
        for (int i = n; i > 1; i--) {
            if (size[i][j] != size[i - 1][j]) {
                net[m++] = i;
                j = pi[i] - 1;
            }
        }
        if (j >= pi[1]) {
            net[m++] = 1;
        }
        System.out.println("最大不相交连线为：");
        int num = 0;
        for (int t = m - 1; t >= 0; t--) {
            System.out.print("【" + net[t] + "，" + pi[net[t]] + "】");
            num++;
            if (num <= m - 1) {
                System.out.print("，");
            }
        }
        System.out.println();
        return m;
    }

}

