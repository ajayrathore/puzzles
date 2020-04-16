
pancakeSort:{[LIST]
    last
    count[LIST]
    {i:1+first idesc l:(#/)x; l:reverse[i#x 1],i _ x 1; (-1+x 0; reverse[x[0]#l],(_/)x)}/
    (count LIST;LIST)
    };