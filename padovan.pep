; Padovan sequence by Pep/8 Assembly Language
; Developed by Diluk Chamika
; This Pep/8 Assembly code will show you how to display the Padovan Sequence upto user input number of terms

         BR      main              ; Branch to main label to start execution

; Data defining section
p0:      .WORD 1           ; First term = 1
p1:      .WORD 1           ; Second term = 1
p2:      .WORD 1           ; Third term = 1
nextTerm:.WORD 0           ; Placeholder for the next term in the sequence
limit:   .WORD 0           ; User-defined number of terms
counter: .WORD 0           ; Counter for looping through terms
comma:   .ASCII ", \x00"   
newline: .ASCII "\n\x00"   

; Main program starts here
main:    STRO    prompt, d         ; Display the prompt to the user
         STRO    newline, d
         STRO    newline, d
         DECI    limit, d          ; Read the user input for the number of terms
         LDA     limit, d          ; Load the terms into the accumulator
         STRO    outmsg1, d
         DECO    limit, d
         STRO    outmsg2, d
         CPA     3, i              ; Compare the limit with 3
         BRLT    invalIn           ; If limit < 3, branch to invalidInput 

         ;Else, output the first three terms: 1, 1, 1
         LDA     p0, d             ; Load the first term
         STRO    newline, d
         DECO    p0, d             ; Output the first term
         STRO    comma, d          

         LDA     p1, d             ; Load the second term
         DECO    p1, d             ; Output the second term
         STRO    comma, d          

         LDA     p2, d             ; Load the third term
         DECO    p2, d             ; Output the third term

         ; Initialize counter to 3, as we start from the 4th term
         LDA     3, i
         STA     counter, d

         CPA     limit, d          ; Compare counter with the limit
         BRGE    done              ; If limit <= 3, we are done

         STRO    comma, d          ; Print comma and space after the third term

; Loop for generating the Padovan sequence terms
; Developed by Diluk Chamika
loop:    LDA     p1, d             ; Load P(n-2)
         ADDA    p0, d             ; Add P(n-3) to P(n-2)
         STA     nextTerm, d       ; Store the result in nextTerm
         DECO    nextTerm, d       ; Output the next term

         ; Update the terms for the next iteration
         LDA     p1, d             ; Move P(n-2) to P(n-3)
         STA     p0, d
         LDA     p2, d             ; Move P(n-1) to P(n-2)
         STA     p1, d
         LDA     nextTerm, d       ; Move nextTerm to P(n-1)
         STA     p2, d

         ; Increment the counter and check if we are done
         LDA     counter, d
         ADDA    1, i
         STA     counter, d
         CPA     limit, d          ; Compare counter with the limit
         BRGE    done              ; If we reached the limit, we are done

         STRO    comma, d          ; Print comma and space between terms
         BR      loop              ; Continue the loop

; If the input was invalid
invalIn: STRO    errorMsg, d       ; Output error message
         BR      done              ; Jump to done to stop the program

; Program end
done:    STRO    newline, d        ; Print newline at the end
         STOP                      ; Stop the execution

; Data section for strings
prompt:  .ASCII  "Enter the number of terms: \x00"
outmsg1: .ASCII  "Padovan Sequence up to \x00"
outmsg2: .ASCII  " terms: \x00"
errorMsg:.ASCII  "The number of terms should be at least 3.\n\x00"

         .END



; Developed by Diluk Chamika