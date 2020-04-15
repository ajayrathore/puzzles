
//sudoku solver - backtracking

sudoku:{[BOARD]
    if[isComplete BOARD; :BOARD];
    row_col: firstNull[BOARD];
    board:  {$[2=count x; x[1]<=count x 0; 0b]}
            {[rc;l]
                if[validSoFar b: .[;rc;:;]/[l];
                    result: sudoku b;
                    if[isComplete result;
                        :result
                    ];
                ];
                @[l;1;+;1]
            }[row_col]/(BOARD;1);
    $[2=count board; first board; board]
    };


isComplete:{[BOARD] all raze not null BOARD };


firstNull:{[BOARD]
    index:  first where null raze BOARD;
    cnt:    count BOARD;
    (index div cnt; index mod cnt)  // (row;col)
    };


validSoFar:{[BOARD]
    rowsValid[BOARD] and colsValid[BOARD] and blocksValid[BOARD]
    };


rowsValid:{[BOARD] all {x~distinct x:x except 0N}each BOARD    };


colsValid:{[BOARD] rowsValid flip BOARD};


blocksValid:{[BOARD]
    e: count BOARD;
    bs: `long$sqrt e;
    indexes: raze (bs cut til e) cross\:/: bs cut til e;
    blocks: .[BOARD]''[indexes];
    all {x:x except 0N; x~distinct x}each blocks
    };



\
q)BOARD:(9 0N 3 0N 0N 0N 6 0N 4; 0N 7 0N 0N 0N 0N 0N 0N 3; 0N 0N 0N 3 6 0N 0N 7 2; 0N 4 0N 0N 0N 3 0N 0N 0N; 0N 0N 0N 0N 9 8 1 0N 0N; 0N 0N 5 2 0N 0N 0N 0N 0N; 4 0N 7 0N 0N 0N 2 0N 8; 0N 1 0N 0N 0N 4 0N 0N 0N; 2 5 0N 0N 3 0N 9 0N 1)
q)BOARD
9   3       6   4
  7             3
      3 6     7 2
  4       3
        9 8 1
    5 2
4   7       2   8
  1       4
2 5     3   9   1
q)
q)sudoku BOARD
9 2 3 5 8 7 6 1 4
5 7 6 1 4 2 8 9 3
1 8 4 3 6 9 5 7 2
8 4 1 6 5 3 7 2 9
7 6 2 4 9 8 1 3 5
3 9 5 2 7 1 4 8 6
4 3 7 9 1 5 2 6 8
6 1 9 8 2 4 3 5 7
2 5 8 7 3 6 9 4 1
