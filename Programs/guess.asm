BITS 16
ORG 32768

start:
    ; Menampilkan pesan sambutan
    mov si, welcome_msg
    call print_string

    ; Menghasilkan angka acak antara 0-9
    call generate_random_number

game_loop:
    ; Menampilkan prompt untuk input
    mov si, prompt_msg
    call print_string

    ; Membaca input pengguna
    call get_input

    ; Membandingkan input pengguna dengan angka acak
    mov al, [user_input]
    cmp al, [random_number]
    je correct_guess
    jl too_low
    jg too_high

too_low:
    mov si, low_msg
    call print_string
    jmp game_loop

too_high:
    mov si, high_msg
    call print_string
    jmp game_loop

correct_guess:
    mov si, correct_msg
    call print_string
    
    ; Menanyakan apakah ingin bermain lagi
    mov si, play_again_msg
    call print_string
    
    ; Membaca input dari pengguna
    mov ah, 00h
    int 16h
    
    cmp al, 'y'
    je start
    cmp al, 'Y'
    je start

    ; Keluar dari program
    ret

; Fungsi untuk mencetak string
print_string:
    lodsb
    or al, al
    jz .done
    mov ah, 0Eh
    int 10h
    jmp print_string
.done:
    ret

; Fungsi untuk membaca input pengguna
get_input:
    mov ah, 00h
    int 16h
    sub al, '0' ; Mengubah karakter ke angka
    mov [user_input], al
    ret

; Fungsi untuk menghasilkan angka acak
generate_random_number:
    ; Menggunakan timer untuk menghasilkan angka acak
    mov ah, 00h
    int 1Ah
    mov ax, dx        ; Mengambil nilai dari DX
    xor dx, dx       ; Mengatur DX menjadi 0
    mov cx, 10       ; Membagi dengan 10
    div cx            ; AX / CX, hasil di AX, sisa di DX
    ; Sisa (DX) adalah angka acak antara 0-9
    mov [random_number], dl
    ret

; Data
welcome_msg db 'Permainan Tebak Angka YuandaOS', 13, 10, 'Tebak angka 0-9.', 13, 10, 0
prompt_msg db 13, 10, 'Masukkan angka (0-9): ', 0
low_msg db 'Terlalu rendah! Coba lagi.', 13, 10, 0
high_msg db 'Terlalu rendah! Coba lagi.', 13, 10, 0
correct_msg db 'Selamat! Tebakanmu benar!', 13, 10, 0
play_again_msg db 'Main lagi? (Y/N): ', 0
random_number db 0
user_input db 0