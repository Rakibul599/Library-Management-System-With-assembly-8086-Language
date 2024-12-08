org 100h

.data
    wmsg1 DB "*********************************** $"
    wmsg2 DB "*********************************** $"
    wmsg3 DB "*********************************** $"
    wmsg4 DB "**********Welcome TO*************** $"
    wmsg5 DB "*****Library Management System***** $"
    wmsg6 DB "*********************************** $"
    wmsg7 DB "*********************************** $"
    wmsg8 DB "*********************************** $"
     


    addbookmsg DB "1.Add Book $"
    displymsg DB "2.Show All Books $"
    searchmsg DB "3.Search Book By Id $"
    exitmsg DB "0.Exit $"
    chosemsg DB "Chose Option: $" 
    returnmenumsg DB "Press 0 to Return Main Menu: $"
    invmsg DB "You enter Invalid Key.. $"
    searchbook DB "Enter Book Id: $"
    Allbookmsg DB ".....List of All books.... $"
    addbookprompt DB "Enter Book Details (Max 50 chars): $"
    addedmsg DB "Book Added Successfully! $"
    Book1 DB "1.The Art of Code by Jane Programmer $"
    Book2 DB "2.Mastering Algorithms by Alan Turington $"
    Book3 DB "3.Digital Fortress by Dan Cryption $"
    Book4 DB "4.Clean Code: A Handbook of Agile Software by Robert C. Martine $"
    Book5 DB "5.The Great Algorithm by Charles Computerson $"
    Book6 DB "6.The Infinite Loop by Calvin Developer $"
    Book7 DB "7.Database Management for Beginners by Maria Schema $"
    Book8 DB "8.The Secret of Binary by Bit Wise $"
    Book9 DB "9.Introduction to Assembly Language by Dr. Hex Code $"
    Book10 DB "10.Artificial Intelligence: The Future by Sophia Neural $"
    NewBook DB 50 DUP('$') 
    NewBookFlag DB 0       

.code           
mov ax, @data
mov ds, ax


call menulist 

mov ah, 4Ch 
int 21h

menulist proc
call ClearScreen
call Welcomemessag
call menu_print
mov ah,01h
int 21h

cmp al,'1'
je call addbookproc
cmp al,'2'
je call book_load
cmp al,'3'
je call searchbookpr
cmp al,'0'
je call exitpr

    ret
menulist endp
Welcomemessag proc
    call newline
    lea dx,wmsg1
    call print_string
    lea dx,wmsg2
    call print_string
    lea dx,wmsg3
    call print_string
    lea dx,wmsg4
    call print_string
    lea dx,wmsg5
    call print_string
    lea dx,wmsg6
    call print_string
    lea dx,wmsg7
    call print_string
    lea dx,wmsg8
    call print_string    
    
ret
Welcomemessag endp

addbookproc proc
call newline
lea dx,addbookprompt
call print_string


mov ah, 0Ah
lea dx, NewBook
int 21h


mov NewBookFlag, 1

call newline
lea dx,addedmsg
call print_string

lea dx,returnmenumsg
call print_string

mov ah,01h
int 21h
cmp al,'0'
je call menulist
jne call invalidmsg

ret
addbookproc endp

searchbookpr proc
call newline
lea dx,searchbook
call print_string
mov ah,01h
int 21h

cmp al,'1'
je boook1
cmp al,'2'
je boook2
cmp al,'3'
je boook3
cmp al,'4'
je boook4
cmp al,'5'
je boook5
cmp al,'6'
je boook6
cmp al,'7'
je boook7
cmp al,'8'
je boook8
cmp al,'9'
je boook9 

 boook1:
 call newline
 lea dx,Book1
 je call searchbookprint
 ret 
 boook2:
 call newline
 lea dx,Book2
 je call searchbookprint
 ret
 boook3:
 call newline
 lea dx,Book3
 je call searchbookprint
 ret
 boook4:
 call newline
 lea dx,Book4
 je call searchbookprint
 ret
 boook5:
 call newline
 lea dx,Book5
 je call searchbookprint
 ret
 boook6:
 call newline
 lea dx,Book6
 je call searchbookprint
 ret
 boook7:
 call newline
 lea dx,Book7
 je call searchbookprint
 ret
 boook8:
 call newline
 lea dx,Book8
 je call searchbookprint
 ret
 boook9:
 call newline
 lea dx,Book9
 je call searchbookprint
 ret
  
ret
searchbookpr endp

searchbookprint proc
    mov ah, 09h
    int 21h
    
    mov dx,13
    mov ah,02h
    int 21h
    
    mov dx,10
    mov ah,02h
    int 21h
    
    lea dx,returnmenumsg
    call print_string 
    
    mov ah,01h
    int 21h
    cmp al,'0'
    je call menulist
    jne call invalidmsg    
    
searchbookprint endp

newline proc
    mov dx,13
    mov ah,02h
    int 21h
    
    mov dx,10
    mov ah,02h
    int 21h    
ret    
newline endp

invalidmsg proc
lea dx,invmsg
call print_string
ret    
    
invalidmsg endp    

print_string proc
    mov ah, 09h
    int 21h
    mov dx,13
    mov ah,02h
    int 21h
    
    mov dx,10
    mov ah,02h
    int 21h  
   ret
print_string endp
 
menu_print proc
    call newline
    lea dx,addbookmsg
    call print_string
    lea dx,displymsg
    call print_string
    lea dx,searchmsg
    call print_string 
    lea dx,exitmsg
    call print_string
    lea dx,chosemsg
    call print_string
 
 
 ret   
menu_print endp 

book_load proc
   call newline
   lea dx,Allbookmsg
    call print_string
   lea dx,Book1
   call print_string
   lea dx,Book2
   call print_string
   lea dx,Book3
   call print_string
   lea dx,Book4
   call print_string 
   lea dx,Book5
   call print_string
   lea dx,Book6
   call print_string
   lea dx,Book7
   call print_string
   lea dx,Book8
   call print_string
   lea dx,Book9
   call print_string
   lea dx,Book10
   call print_string

  
   cmp NewBookFlag, 1
   jne skip_newbook
   lea dx, NewBook + 1 
   call print_string
skip_newbook:

    lea dx,returnmenumsg
    call print_string 
    
    mov ah,01h
    int 21h
    cmp al,'0'
    je call menulist
    jne call invalidmsg
   
    ret
book_load endp

ClearScreen proc
  
    mov ah, 06h          
    xor al, al           
    xor cx, cx           
    mov dx, 184Fh       
    mov bh, 07h          
    int 10h              

   
    mov ah, 02h         
    xor bh, bh           
    xor dh, dh           
    xor dl, dl           
    int 10h              

    ret
ClearScreen endp

exitpr proc
mov ah, 4Ch
int 21h 
    
ret
exitpr endp

