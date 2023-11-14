// walk sound made by wav2c

const unsigned int walk_sampleRate = 11025;
const unsigned int walk_length = 1424;

const signed char walk_data[] = {
-1, 0, -1, 0, -2, -1, -1, -1, 0, 0, -1, 0, -1, 0, -2, -1, 0, 0, 0, -1, -1, 
-1, -1, 0, 0, -1, -2, -1, -1, 0, 0, -2, -1, -1, 0, -2, -1, -1, -1, -1, 0, 
-2, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -2, -1, 0, -2, 
-1, -1, -2, 0, 0, -1, 0, -1, -1, 0, -2, 0, 0, -1, 0, -1, -1, -1, 0, 0, 
-1, -1, -2, 0, -1, -1, -1, -1, -2, -1, 0, -2, -1, -1, 0, -1, 0, -1, -1, -1, 
-1, -1, 0, -1, -2, -1, 0, -1, 0, -1, 0, -2, 0, -1, -1, 0, -1, 0, -2, 0, 
-2, 0, -2, 0, 0, 0, 0, 0, 0, 0, -1, -1, -2, 0, -2, -1, 0, 0, -1, 0, 
0, -2, -1, -2, -1, -1, 0, -1, -1, -1, -2, 0, 0, -1, -1, -1, 0, -2, 0, 0, 
-1, 0, -1, -2, -1, -2, 0, -1, 0, -1, -1, -1, 0, -1, -1, -1, 0, -1, 0, 0, 
-1, 0, -1, -1, 0, -1, 0, -1, -1, -1, 0, -1, -1, 0, 0, -1, 0, -1, -1, 0, 
-1, -1, -1, -1, -2, 0, -1, -1, -1, 0, -1, -2, 0, -1, -1, -1, -1, -2, 0, -1, 
-1, -1, 0, -2, 0, -2, -1, -1, -2, -1, -2, -1, -1, 0, -1, 0, 0, 2, -1, -4, 
-4, 0, 1, 1, -1, 1, 0, 0, 1, 0, -2, -1, -1, 0, -2, -1, -2, -3, -4, -3, 
-3, 0, -1, 0, -1, -1, 0, -2, -1, -1, -2, -2, -2, -1, -1, 1, 1, 2, 4, 4, 
2, 2, 4, 1, 1, 2, 1, 1, 2, 1, 1, -2, -1, -2, -4, -3, -7, -4, -7, -8, 
-7, -7, -8, -6, -6, -7, -6, -7, -7, -7, -8, -8, -7, -4, -5, -1, -1, 3, 4, 3, 
4, 4, 6, 6, 9, 7, 9, 7, 10, 9, 12, 12, 9, 9, 8, 8, 6, 7, 4, 3, 
2, 1, 0, 0, -4, -3, -6, -7, -8, -9, -10, -10, -9, -12, -10, -12, -13, -9, -10, -12, 
-10, -7, -10, -10, -9, -8, -5, -3, -5, -2, -1, -2, 2, 4, 2, 4, 5, 6, 6, 5, 
7, 6, 8, 5, 7, 5, 5, 7, 4, 5, 1, 5, 3, 1, 3, 1, 0, 1, -1, 1, 
1, -7, -1, -1, 0, -6, -5, 3, -7, -4, -3, -8, -8, -3, -5, -8, -4, -7, -7, -4, 
-8, -4, -7, -6, -8, -9, -4, -14, -4, -9, -8, -4, -9, -9, -9, -8, -4, -3, -3, 1, 
1, 5, 13, 9, 10, 8, 12, 18, 14, 18, 17, 15, 19, 15, 16, 16, 18, 13, 15, 16, 
10, 10, 10, 9, 4, 4, 3, 0, 1, -4, -9, -10, -9, -14, -14, -18, -13, -20, -17, -16, 
-25, -20, -19, -15, -17, -20, -16, -17, -16, -13, -12, -13, -8, -9, -9, -5, -4, -1, -1, 0, 
5, 1, 6, 5, 6, 6, 10, 6, 6, 7, 6, 8, 6, 9, 5, 4, 7, 3, 4, 5, 
3, 2, -1, 3, 1, 3, -2, -2, -1, 0, 3, -2, -1, 0, -1, -2, 1, -5, 0, 0, 
-4, -1, -1, 1, -3, 2, 0, 0, 2, 1, 4, 4, 4, 0, 3, 8, 5, 4, 5, 0, 
1, 4, 5, 3, 0, 0, 3, -4, -2, -2, -4, -4, -4, -2, -3, -2, -6, -5, -4, -3, 
-7, -2, -5, -4, -5, -5, -5, -5, -3, -8, -6, -3, -4, -5, -4, -7, -5, -6, -6, -2, 
-3, -2, -3, -2, -2, -1, -1, -3, -1, -1, -2, -2, -1, -3, -1, 1, -1, 0, -2, 0, 
0, 1, 0, 1, 1, 2, 2, 1, 2, 3, 1, 3, 2, 3, 2, 3, 3, 4, 5, 4, 
5, 4, 5, 4, 5, 4, 6, 5, 3, 4, 3, 3, 2, 2, 0, 1, -1, -1, -2, -3, 
-2, -3, -4, -4, -5, -5, -5, -7, -6, -7, -6, -8, -6, -8, -7, -6, -6, -5, -5, -4, 
-4, -4, -4, -3, -2, -2, -3, -1, -2, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
1, 1, 2, 2, 2, 2, 1, 2, 1, 2, 2, 2, 2, 1, 2, 1, 2, 1, 1, 1, 
0, 1, -1, 1, 0, 0, 0, 0, 0, 0, -1, 0, -2, -1, -2, -2, -2, -2, -4, -3, 
-3, -3, -4, -2, -3, -5, -3, -5, -3, -4, -3, -3, -2, -3, -2, -3, -1, -1, -3, -1, 
-1, 0, 0, -1, 1, 2, 1, 2, 2, 1, 3, 3, 3, 2, 2, 2, 3, 0, 1, 2, 
1, 2, 1, 1, 1, -1, 1, -1, 0, 0, -2, -1, -2, -1, -3, -2, -3, -3, -3, -4, 
-3, -4, -3, -3, -4, -3, -5, -4, -4, -3, -3, -2, -2, -2, -1, -2, 0, 0, -1, 1, 
-1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, -1, 0, -1, 0, -1, 0, -1, 
0, -1, 0, -1, -1, -2, -2, -2, -1, -1, -1, -1, -1, -2, 0, -1, -1, -2, 0, -2, 
0, 0, 0, -1, 0, -1, -1, -2, -1, -2, 0, -2, -1, -1, -2, -1, -1, -1, -1, -2, 
0, -2, -1, -1, 0, -1, -2, -1, -2, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 
-1, -1, -2, 0, -1, 0, -1, 0, -1, -1, -2, -1, -2, -1, 0, 0, -1, -1, -1, -1, 
0, 0, 0, 0, -2, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 
0, -1, 1, 0, 0, -1, -1, 0, -2, -1, 0, -2, -1, -1, -3, -2, -1, -2, -2, -3, 
-1, -1, -2, -2, -3, -2, -2, -1, -3, -2, -4, -3, -3, -2, -3, -2, -2, -1, -1, -1, 
0, -2, 0, -1, -1, 1, -1, 1, 0, 0, 1, 0, 2, 0, 2, 1, 1, 1, 2, 1, 
2, 0, 1, 1, 0, 1, 0, 1, -1, 0, -1, 0, -1, 0, -2, -1, -2, -1, -2, -1, 
-2, -2, -2, -3, -2, -2, -3, -2, -3, -2, -3, -2, -3, -2, -3, -2, -3, -2, -3, -2, 
-2, -2, -1, -1, -2, -1, -2, -1, -2, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 
-1, 1, 0, 1, 0, 1, -1, 1, -1, 1, 0, 1, 0, 0, -1, 0, -1, 0, -1, 0, 
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -2, -1, -2, -1, -2, -1, -2, -1, 
-2, -1, -1, -2, -1, -2, -2, -1, -2, -1, -1, -2, -1, -2, -1, -2, -1, -2, -1, -1, 
-2, -1, -2, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 
0, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 
0, -1, -1, -2, -1, -1, -1, -1, -1, -2, -1, -1, -2, -1, -2, -2, -2, -1, -1, -2, 
-1, -2, -1, -1, -2, -1, -2, -1, -2, 0, -1, 0, -1, 0, -2, 0, 0, 0, 0, 0, 
0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, -2, 
-1, -1, -1, 0, -2, 0, -1, -2, -1, -2, -1, -2, -1, -2, 0, -1, 0, -1, -1, -2, 
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1, -1, 0, -1, 0, 0, -1, 0, 0, -1, 
0, 0, -1, 0, -1, 0, -1, -1, -2, 0, -1, -2, -1, -1, -2, -1, -2, -1, -2, -1, 
-1, -2, -2, -2, -1, -2, -1, -1, -2, -2, -2, -1, -1, -2, -1, -1, -1, -1, 0, -1, 
0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, -1, -1, 
1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1, -1, -1, 0, -2, -1, 0, -2, 0, 
-2, -1, -2, -1, -2, -1, -2, 0, -2, -1, -1, -1, -1, -1, -1, -2, 0, -1, -2, -1, 
-1, -2, -1, -1, -1, -1, -2, -1, -2, -1, -2, -1, -2, 0, -1, -1, -1, -1, -1, -2, 
0, -2, 0, -1, -1, -1, -2, 0, -2, 0, -1, 0, -1, 0, -2, 0, -1, -1, -1, 0, 
-1, 0, 0, -1, 0, -1, 0, 0, -1, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 
-1, -1, 0, };