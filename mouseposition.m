function B = mouseposition(Parameters, x, y, buttonpressed, NK)

    B = 0;
    if (Parameters.XA-70<x && x<Parameters.XA+130 && Parameters.Y-85<y && y<Parameters.Y+70)
        B = 1;
    end
    if (Parameters.XB-70<x && x<Parameters.XB+130 && Parameters.Y-85<y && y<Parameters.Y+70)
        B = 2;
    end
    if (Parameters.centerX-215<x && x<Parameters.centerX+175 && Parameters.Y+55<y && y<Parameters.Y+170 && NK)
        B = 3;
    end
    if (Parameters.centerX-195<x && x<Parameters.centerX+155 && Parameters.height-155<y && y<Parameters.height-35 && buttonpressed) %confirm
       B = 4;
    end

end