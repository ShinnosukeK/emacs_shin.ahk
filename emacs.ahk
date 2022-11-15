;;
;; An autohotkey script that provides gtk-emacs-key-theme like keybinding on Windows
;; forked from https://github.com/usi3/emacs.ahk
;;
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1 
  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1 
  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1
  IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
    Return 1
  ; Avoid VMwareUnity with AutoHotkey
  IfWinActive,ahk_class VMwareUnityHostWndClass
    Return 1
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
;  IfWinActive,ahk_class SWT_Window0 ; Eclipse
;    Return 1
;   IfWinActive,ahk_class Xming X
;     Return 1
;   IfWinActive,ahk_class SunAwtFrame
;     Return 1
;   IfWinActive,ahk_class Emacs ; NTEmacs
;     Return 1  
;   IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
;     Return 1
  Return 0

}

;bool checking if space is pressed or not
isSpace = 0

;
; <ctrl>space
; start or stop activation mode
;
^Space::
	If is_target()
		Send %A_ThisHotkey%	
	Else{
		If 	isSpace
			isSpace = 0
		Else 
			isSpace = 1
	}
	Return

;
; <ctrl>b
; move cursor backward
;
^b::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
	If	isSpace
		Send +{Left}
	Else
		Send {Left}
  }
  Return

;
; <ctrl>f
; move cursor forward
;
^f::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
	If isSpace
		Send	+{Right}
	Else
		Send	{Right}
  }
  Return  


;
; <ctrl>p
; move cursor up
;
^p::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
	If isSpace
		Send +{Up}
	Else
		Send {Up}
  }
  Return


;
; <ctrl>n
; move cursor down
;
^n::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
	If isSpace
		Send	+{Down}
	Else
		Send	{Down}
  }  
  Return
  

;
; <ctrl>d
; delete following char
;
^d::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Del}
  Return

;
; <ctrl>h
; delete previous char(Backspace)
;
^h::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {BS}
  Return

;
; <ctrl>a
; move cursor beginning of current line
;
^a::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
	If isSpace
		Send	+{Home}
	Else
		Send	{Home}
  }
  Return

;
; <ctrl>e
; move cursor end of current line
;
^e::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
	If isSpace
		Send +{End}
	Else
		Send {End}
  }
  Return

;
; <alt>b
; move cursor one word backward
;
!b::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^{Left}
  Return

;
; <alt>f
; move cursor one word forward
;
!f::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^{Right}
  Return

;
; <ctrl><shift>p
; scroll up
;
^+p::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
	If isSpace
		Send +{PgUp}
	Else
		Send {PgUp}
  }
  Return

;
; <ctrl><shift>n
; scroll down
;
^+n::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
	If isSpace
		Send +{PgDn}
	Else
		Send {PgDn}
  }
  Return

;
; <ctrl>w
; cut
;
^w::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^x
  Return

;
; <ctrl>y
; paste
;
^y::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^v
  Return

;
; <ctrl>k
; delete chars from cursor to end of line
;
^k::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {ShiftDown}{END}{ShiftUp}
    Sleep 50
	Send {Del}
  Return

;
; <ctrl>u
; delete chars from cursor to beginning of line
;
^u::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    Send {ShiftDown}{HOME}{ShiftUp}
    Sleep 50
    Send {Del}
    ;Send ^x
  }
  Return

;
; <ctrl>r
; find
;
^r::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^f
  Return

;
; <ctrl><shift>a
; select all
;
^+a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^a
  Return
