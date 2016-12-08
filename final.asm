;Tic Tac Toe Game
;By Team Away From Keyboard

;Eyakub 151-15-4674
;Fateha 151-15-5036
;Shafi  151-15-5248

.model small
.stack 100h
.data              
   ;big strings LMAO :D :D 
   spacing db        "                                                      $"
   halfscreen   db  "                        $"
   
   gamename1 db      " _____ ___ ____   _____  _    ____   _____ ___  _____ $"
   gamename2 db      "|_   _|_ _/ ___| |_   _|/ \  / ___| |_   _/ _ \| ____|$"
   gamename3 db      "  | |  | | |       | | / _ \| |       | || | | |  _|  $" 
   gamename4 db      "  | |  | | |___    | |/ ___ \ |___    | || |_| | |__  $" 
   gamename5 db      "  |_| |___\____|   |_/_/   \_\____|   |_| \___/|_____|$" 
   gamename6 db      "                                                      $" 
   
   gamename  db      " _____ ___ ____   _____  _    ____   _____ ___  _____ " , 13, 10
             db      "|_   _|_ _/ ___| |_   _|/ \  / ___| |_   _/ _ \| ____|" , 13, 10
             db      "  | |  | | |       | | / _ \| |       | || | | |  _|  " , 13, 10
             db      "  | |  | | |___    | |/ ___ \ |___    | || |_| | |__  " , 13, 10
             db      "  |_| |___\____|   |_/_/   \_\____|   |_| \___/|_____|" , 13, 10
             db      "                                                      " 

                                 
                                                            
                                              .             
   teamname db        "               _.._   .'|            ", 13, 10
            db        "             .' .._|.'  |            ", 13, 10
            db        "      __     | '   <    |            ", 13, 10
            db        "   .:--.'. __| |__  |   | ____       ", 13, 10
            db        "  / |   \ |__   __| |   | \ .'       ", 13, 10
            db        " `` __ | |  | |    |   |/  .         ", 13, 10
            db        "  .'.''| |  | |    |    /\  \        ", 13, 10
            db        " / /   | |_ | |    |   |  \  \       ", 13, 10
            db        " \ \._,\ '/ | |    '    \  \  \      ", 13, 10
            db        "  `--'  ``  |_|   '------'  '---'    "
            
   tyt db      "         _____ _   _    _    _   _ _  __ __   _____  _   _    ",13,10
       db      "        |_   _| | | |  / \  | \ | | |/ / \ \ / / _ \| | | |   ",13,10
       db      "          | | | |_| | / _ \ |  \| | ' /   \ V / | | | | | |   ",13,10
       db      "          | | |  _  |/ ___ \| |\  | . \    | || |_| | |_| |   ",13,10
       db      "          |_| |_| |_/_/   \_\_| \_|_|\_\   |_| \___/ \___/    ",13,10
       db      "                                                              "     
   
   
   gover  db        "   ____    _    __  __ _____    _____     _______ ____    ",13,10
          db        "  / ___|  / \  |  \/  | ____|  / _ \ \   / / ____|  _ \   ",13,10
          db        " | |  _  / _ \ | |\/| |  _|   | | | \ \ / /|  _| | |_) |  ",13,10
          db        " | |_| |/ ___ \| |  | | |___  | |_| |\ V / | |___|  _ <   ",13,10
          db        "  \____/_/   \_\_|  |_|_____|  \___/  \_/  |_____|_| \_\  ",13,10
          db        "                                                          "  
   

   byword  db       "                  ______   __                             ",13,10
           db       "                 | __ ) \ / /                             ",13,10
           db       "                 |  _ \\ V /                              ",13,10
           db       "                 | |_) || |                               ",13,10
           db       "                 |____/ |_|                               ",13,10
           db       "                                                          "
   
              
   wintext  db      "            __        _____ _   _                         ",13,10
            db      "            \ \      / /_ _| \ | |                        ",13,10
            db      "             \ \ /\ / / | ||  \| |                        ",13,10
            db      "              \ V  V /  | || |\  |                        ",13,10
            db      "               \_/\_/  |___|_| \_|                        ",13,10
            db      "                                                          " 
   
   
   drawtext  db     "         ____  ____      ___        __                    ",13,10
             db     "        |  _ \|  _ \    / \ \      / /                    ",13,10
             db     "        | | | | |_) |  / _ \ \ /\ / /                     ",13,10
             db     "        | |_| |  _ <  / ___ \ V  V /                      ",13,10
             db     "        |____/|_| \_\/_/   \_\_/\_/                       ",13,10
             db     "                                                          "
            
   welcometxt  db    "          _    _ _____ _     _____ ________  ___ _____      ",13,10
               db    "         | |  | |  ___| |   /  __ \  _  |  \/  ||  ___|     ",13,10
               db    "         | |  | | |__ | |   | /  \/ | | | .  . || |__       ",13,10
               db    "         | |/\| |  __|| |   | |   | | | | |\/| ||  __|      ",13,10
               db    "         \  /\  / |___| |___| \__/\ \_/ / |  | || |___      ",13,10
               db    "          \/  \/\____/\_____/\____/\___/\_|  |_/\____/      ",13,10
               db    "                                                            "    
   
    p1txt1 db "           ______ _                                                $"
    p1txt2 db "            | ___ \ |                                              $"
    p1txt3 db "            | |_/ / | __ _ _   _  ___ _ __    ___  _ __   ___      $"
    p1txt4 db "            |  __/| |/ _` | | | |/ _ \ '__|  / _ \| '_ \ / _ \     $"
    p1txt5 db "            | |   | | (_| | |_| |  __/ |    | (_) | | | |  __/     $"
    p1txt6 db "            \_|   |_|\__,_|\__, |\___|_|     \___/|_| |_|\___|     $"
    p1txt7 db "                            __/ |                                  $"
    p1txt8 db "                           |___/                                   $" 
    
    p2txt1 db "    ______ _                         _                           $"
    p2txt2 db "    | ___ \ |                       | |                          $"
    p2txt3 db "    | |_/ / | __ _ _   _  ___ _ __  | |___      _____            $"
    p2txt4 db "    |  __/| |/ _` | | | |/ _ \ '__| | __\ \ /\ / / _ \           $"
    p2txt5 db "    | |   | | (_| | |_| |  __/ |    | |_ \ V  V / (_) |          $"
    p2txt6 db "    \_|   |_|\__,_|\__, |\___|_|     \__| \_/\_/ \___/           $"
    p2txt7 db "                    __/ |                                        $"
    p2txt8 db "                   |___/                                         $"
    
    ;menu strings nothing to make fuss about xD
   playstring   db "1. PLAY$"
   quitstring   db "2. QUIT$"
   choosestring db ">choose<$"
   instruction1 db "                            very easy          $"
   instruction2 db "              choose the grid number to make move$"
   instruction3 db "                    player number is shown on top$"
   
   ;color codes to use in graphics mode
   black        db 0
   blue         db 1
   cyan         db 3
   lightgray    db 7
   cyanongray   db 115
   white        db 15
                      
   ;grid data
   array db   '0','1','1','1','1','0','0','0','1'
   wall         db "------||-----||------$"
   border       db "---------------------$"
   barl         db "|  $"
   barr         db "  |$" 
   midbrd       db "|     ||     ||     |$"
   
   ;player data variable basically only about the current player
   player db 0
   
   ;game related data variables
   won  db 0
   temp db ? 
   val db ? 
   movecount db 0
   continuet db "               Press any key to continue           $"
   p1turn db "Player 1's turn$"
   p2turn db "Player 2's turn$"
   takenerror db "Invalid move$"
   cursor db 0
   movex db "X$"
   moveo db "O$"
   index db ?
   zero dw '0'
   one dw '1'  

;code segment starts hold on tight. cause this is the longest and most boring part.   
.code
    main proc
        mov ax, @data
        mov ds, ax 
        mov es, ax 
        
        mov cx, 15
        call newlines
        lea dx, continuet
        call printstring
        call newline
        lea dx, halfscreen
        call printstring
        call takein
        call clscrn
        call videoclear
                        
        mov bl, cyanongray
        mov dh, 5
        call gamenameprint
        MOV DI, 54             ;18 = 1 sec
        call delayfunction
        call videoclear                 
        call byprint
        mov di, 36
        call delayfunction
        call videoclear
        call entireclear        
        call teamnameprint
        mov di, 72
        call delayfunction 
        call videoclear        
        jmp menuscreen

        ;screens.. Game screens
        
        ;menu screen get called at the begining to choose to play or quit
         menuscreen:
            ;resetting everything--|
             call entireclear
             call clscrn
             call gamenameprinttxt
             mov player, 1
             call initiategrid
             mov movecount, 0   
             ;---------------------|
             ;the screen-----------|
             mov cx, 6
             call newlines
             lea dx, halfscreen
             call printstring
             lea dx, playstring
             call printstring
             call newline    
             lea dx, halfscreen
             call printstring             
             lea dx, quitstring
             call printstring
             call newline
             call newline
             lea dx, halfscreen
             call printstring
             lea dx, choosestring
             call printstring
             call newline
             chooseloop:
                call takein
                cmp al, '1'
                je instructionscreen
                cmp al, '2'
                call exit
                jmp chooseloopex
             chooseloopex:
                mov dl, 8
                call outchar
                mov dl, 219
                call outchar
                mov dl, 8
                call outchar
                jmp chooseloop
             ;------------------------|
                
        ;winning Screen for player one
        player1won:
            call p1txtprint
            call winprint            
            call takein
            jmp menuscreen
        
        ;winning screen for player two
        player2won:
            call p2txtprint
            call winprint
            mov cx, 11
            call newlines
            call takein
            jmp menuscreen
        
        ;draw gets called when the game ends in draw
        drawscreen:
            call clscrn
            call videoclear
            call drawprint
            mov cx, 15
            call newlines
            lea dx, continuet
            call printstring
            call takein
            jmp menuscreen
            
         instructionscreen:
            call clscrn
            call gamenameprinttxt
            mov cx, 3
            call newlines
            lea dx, instruction1
            call printstring
            call newline
            lea dx, instruction2
            call printstring
            call newline
            lea dx, instruction3
            call printstring
            call takein
            jmp gamethread
            
         ;=================================================================== 
     
        ;Game thread or the game loop    
         gamethread:
            call entireclear
            call clscrn   
            cmp  movecount, 9
            je drawscreen         
            call printgame                     
            jmp exit  
        
        ;functions two types:----------------------------------------------------------|
        ;few are for running the game screens few are for making a few short functions |
        ;------------------------------------------------------------------------------|
     
        ;printing the grid.. prints the 3 X 3 grid on which the current game is shown
        printgame proc
            call entireclear
            call clscrn 
            mov bl, player
            cmp bl, 1
            je p1tp            
            lea dx, halfscreen
            call printstring
            lea dx, p2turn
            call printstring
            jmp printingsec
            p1tp:
            lea dx, halfscreen
            call printstring
            lea dx, p1turn
            call printstring
            printingsec:
            mov cx, 5
            call newlines 
            
            lea bx, array
            lea dx, border
            call printstring
            call newline
            call printrow
            lea dx, wall
            call printstring
            call newline
            call printrow
            lea dx, wall
            call printstring
            call newline
            call printrow
            lea dx, border
            call printstring
            call newline            
            jmp getmove
            jmp exit
        
        ;printing row of data. :D for each row.
        printrow proc
        
            ;additional border top
            lea dx, midbrd
            call printstring
            call newline 
            
            ;cell one
            mov dl, '|'
            call outchar
            call space
            call space
            mov dl, [bx]
            call outchar                                   
            call space
            call space
            mov dl, '|'
            call outchar
            inc bx
            
            ;cell two
            mov dl, '|'
            call outchar
            call space
            call space   
            mov dl, [bx]
            call outchar
            call space
            call space
            mov dl, '|'
            call outchar
            inc bx
            
            ;cell three
            mov dl, '|'
            call outchar
            call space
            call space               
            mov dl, [bx]
            call outchar
            call space
            call space
            mov dl, '|'
            call outchar
            inc bx
            call newline
            
            ;additional border down 
            lea dx, midbrd
            call printstring
            call newline
            
            ret 
          
            
        ;getting input
        getmove:
             call takein
             cmp al, '1'
             jl inputerror
             cmp al, '9'
             jg inputerror
             
             
             mov temp, al
             sub temp, '0'
             lea bx, array
             mov al, temp
             dec al
             mov ah, 0
             add bx, ax
             mov al, [bx]
             cmp al, '9'
             jg inputerror             
             inc movecount
             jmp update
             
             inputerror:
             lea dx, takenerror
             call printstring
             mov dl, 13
             call outchar
             lea dx, halfscreen
             call printstring
             mov dl, 13
             call outchar
             mov di, 18
             call delayfunction
             jmp getmove
        
        ;winning thread to check if the game has ended after current move
        winthread:            
            call entireclear 
            call clscrn            
            mov al, player
            cmp al, 1
            je player1wonj
            jmp player2wonj
            player1wonj:
            call player1won
            player2wonj:
            call player2won
            

             
        ;updating the array after getting each move
        update:
            mov bx, 0h;
            mov cl, temp
            incbx:
            inc bx
            loop incbx
            dec bx
            mov al, player
            cmp al, 1
            je xupdate
            mov array[bx], 'O'            
            jmp wincheck             
            xupdate:
            mov array[bx], 'X'            
            jmp wincheck
            
        ;checking if anyone won yet
        wincheck:
            lea si, array
            call diagonal
            call columns
            call rows
            call toggle
            jmp gamethread
        
        ;checking if any diagonal has won the match    
        diagonal proc
            mov bx, si
            mov al, [bx]
            add bx, 4
            cmp al, [bx]
            jne diagonalRtL
            add bx, 4
            cmp al, [bx]
            jne diagonalRtL
            jmp winthread
            ret
            
            diagonalRtL:
            mov bx, si
            add bx, 2
            mov al, [bx]
            add bx, 2
            cmp al, [bx]
            jne endCheckDiagonal
            add bx, 2
            cmp al, [bx]
            jne endCheckDiagonal
            jmp winthread
            endCheckDiagonal:
            ret
        
        ;checking if player won by columns  
        columns proc
            ;firstColumn
            mov bx, si
            mov al, [bx]
            add bx, 3
            cmp al, [bx]
            jne secondColumn
            add bx, 3
            cmp al, [bx]
            jne secondColumn
            jmp winthread
            ret
            
            secondColumn:
            mov bx, si
            inc bx  
            mov al, [bx]
            add bx, 3   
            cmp al, [bx]
            jne thirdColumn
            add bx, 3   
            cmp al, [bx]
            jne thirdColumn
            jmp winthread
            ret
            
            thirdColumn:
            mov bx, si
            add bx, 2   
            mov al, [bx]
            add bx, 3   
            cmp al, [bx]
            jne endCheckColumns
            add bx, 3   
            cmp al, [bx]
            jne endCheckColumns
            jmp winthread
            endCheckColumns:
            
            ret
        
        ;checking if player won by rows 
        rows proc
            ;firstRow
            mov bx, si
            mov al, [bx]
            inc bx  
            cmp al, [bx]
            jne secondRow
            inc bx      
            cmp al, [bx]
            jne secondRow
            jmp winthread
            ret
            
            secondRow:
            mov bx, si
            add bx, 3   
            mov al, [bx]
            inc bx  
            cmp al, [bx]
            jne thirdRow
            inc bx  
            cmp al, [bx]
            jne thirdRow
            jmp winthread
            ret
            
            thirdRow:
            mov bx, si
            add bx, 6
            mov al, [bx]
            inc bx  
            cmp al, [bx]
            jne endCheckRows
            inc bx
            cmp al, [bx]
            jne endCheckRows
            jmp winthread
            endCheckRows:           
            ret
        
        ;initiate array
        initiateGrid proc
            lea bx, array
            mov al, '1'
            mov cx, 9
            initNextTa:
            mov [bx], al
            inc al
            inc bx
            loop initNextTa
            ret

        ;toggle player
        toggle proc
            mov bl, player
            cmp bl, 1
            je p1toggle
            mov player, 1
            ret
            p1toggle:
            mov player, 2
            ret   
        
        ;clean row function to print line full of blank spaces
        cleanrow proc
            crlp:
            lea dx, spacing
            call printstring
            call newline
            loop crlp
            ret      
        
        ;multinewlines
        newlines proc
            nlp:
               call newline
               loop nlp 
       
        ;delay function to make the current stat wait a certain amount of time.
        delayfunction proc
          MOV AH, 0
          INT 1Ah
          MOV BX, DX
          Delay:
          MOV AH, 0
          INT 1Ah
          SUB DX, BX
          CMP DI, DX
          JA Delay
          ret
       
        ;input function
        takein proc
            mov ah, 1
            int 21h
            ;sub al, 48
            ret          
            
        ;output function
        outchar proc
            mov ah, 2
            int 21h
            ret
        
        ;string output function
        printstring proc
            mov ah, 9
            int 21h
            ret
            
        ;space
        space proc
            mov ah, 2
            mov dl, ' '
            int 21h
            ret
            
        ;Clearing the screen    
        clscrn proc
            mov ah, 0fh
            int 10h
            mov ah, 0
            int 10h
            ret 
            
        ;newline
         newline proc
            mov ah, 2
            mov dl, 10
            int 21h
            mov dl, 13
            int 21h
            ret
         
         ;color string printing
         colorprintg proc       
          mov  ah,13h
          mov  bh,0 
          int  10h
          ret
          
         ;--------------------------------------------------------------|
         ;To convert the console screen into graphical mode and to print|
         ;strings in colored mode.                                      |
         ;--------------------------------------------------------------|
         colorprint proc       
          mov  ah,13h
          ;mov  bp,offset Jan ;STRING TO DISPLAY.
          mov  bh,0
          ;mov  bl,color
          ;mov  cx,201 ;STRING LENGTH.
          mov  dl,0 
          ;mov  dh,0 ;Y (SCREEN COORDINATE). 
          int  10h
          ret                   
         
         ;cleaning screen after graphical output
         videoclear proc
            mov ax, 0600h
            mov bh, 0h
            mov cx, 0000h
            mov dx, 184Fh
            int 10h
            ret 
            
         ;entire clean and setting screen to text mode again
         entireclear proc
            MOV AH,6    ;THIS WILL CLEAR SCREEN
            MOV AL,0
            MOV BH,7
            MOV CX,0
            MOV DL,79
            MOV DH,24
            INT  10H
            ret
          
            
         ;graphical prints   
         gamenameprint proc
            mov bp, offset gamename
            mov cx, 334
            call colorprint
            ret     
            
         byprint proc
            mov bp, offset byword
            mov bl, cyan
            mov cx, 354
            mov dh, 5
            call colorprint  
            ret
            
         teamnameprint proc
            mov bp, offset teamname
            mov bl, cyanongray
            mov cx, 388
            mov dh, 5
            call colorprint
            ret
            
         winprint proc
            mov bp, offset wintext
            mov bl, cyanongray
            mov cx, 358
            mov dh, 10
            call colorprint
            ret
            
         drawprint proc
            mov bp, offset drawtext
            mov bl, cyanongray
            mov cx, 358
            mov dh, 5
            call colorprint
            ret
          
          
         gameoverprint proc
            mov bp, offset gover
            mov bl, cyanongray
            mov cx, 486
            mov dh, 5
            call colorprint
            ret
            
            
        welcomeprint proc
            mov bp, offset welcometxt
            mov bl, 15h
            mov cx, 354
            mov dh, 5
            call colorprint  
            ret   
            
        ;analog pritns printing big ascii strings line by line
        gamenameprinttxt proc
            lea dx, gamename1
            call printstring
            call newline
            lea dx, gamename2
            call printstring
            call newline
            lea dx, gamename3
            call printstring
            call newline
            lea dx, gamename4
            call printstring
            call newline
            lea dx, gamename5
            call printstring
            call newline
            lea dx, gamename6
            call printstring
            call newline
            ret
            
        p1txtprint proc
            call newline
            call newline
            lea dx, p1txt1
            call printstring
            call newline
            lea dx, p1txt2
            call printstring
            call newline
            lea dx, p1txt3
            call printstring
            call newline
            lea dx, p1txt4
            call printstring
            call newline
            lea dx, p1txt5
            call printstring
            call newline
            lea dx, p1txt6
            call printstring
            call newline
            lea dx, p1txt7
            call printstring
            call newline
            lea dx, p1txt8
            call printstring
            call newline
            ret
            
        p2txtprint proc
            call newline
            call newline
            lea dx, p2txt1
            call printstring
            call newline
            lea dx, p2txt2
            call printstring
            call newline
            lea dx, p2txt3
            call printstring
            call newline
            lea dx, p2txt4
            call printstring
            call newline
            lea dx, p2txt5
            call printstring
            call newline
            lea dx, p2txt6
            call printstring
            call newline
            lea dx, p2txt7
            call printstring
            call newline
            lea dx, p2txt8
            call printstring
            call newline
            ret      

exit proc
    ;call endsequence
    mov ah, 4ch
    int 21h
    ;main endp
end main



;-----------------------------------------------------------------------------------------------------------------|
;    _                        _____                      _  __          _                         _               |
;   / \__      ____ _ _   _  |  ___| __ ___  _ __ ___   | |/ /___ _   _| |__   ___   __ _ _ __ __| |              |
;  / _ \ \ /\ / / _` | | | | | |_ | '__/ _ \| '_ ` _ \  | ' // _ \ | | | '_ \ / _ \ / _` | '__/ _` |              |
; / ___ \ V  V / (_| | |_| | |  _|| | | (_) | | | | | | | . \  __/ |_| | |_) | (_) | (_| | | | (_| |              |
;/_/   \_\_/\_/ \__,_|\__, | |_|  |_|  \___/|_| |_| |_| |_|\_\___|\__, |_.__/ \___/ \__,_|_|  \__,_|              |
;                      |___/                                       |___/                                          |
;-----------------------------------------------------------------------------------------------------------------|

