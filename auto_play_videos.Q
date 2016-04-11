// 配置文件C:\PlayVideo\Config.ini
// [video]
// video_1=E:\videos\1\ikidstv-video-a1.mp4
// video_2=E:\videos\2\ikidstv-video-a1.mp4
// video_3=E:\videos\3\ikidstv-video-a1.mp4
// video_4=E:\videos\4\ikidstv-video-a1.mp4
// key=ikidstv-video
// [program]
// path=C:\KMPlayer\KMPlayer.exe

video1 = Plugin.File.ReadINI("video", "video_1", "C:\PlayVideo\Config.ini")
video2 = Plugin.File.ReadINI("video", "video_2", "C:\PlayVideo\Config.ini")
video3 = Plugin.File.ReadINI("video", "video_3", "C:\PlayVideo\Config.ini")
video4 = Plugin.File.ReadINI("video", "video_4", "C:\PlayVideo\Config.ini")  
program_path = Plugin.File.ReadINI("program", "path", "C:\PlayVideo\Config.ini")
video_name_key = Plugin.File.ReadINI("video", "key", "C:\PlayVideo\Config.ini")  

Call RunApp(program_path + "  " + video1)
Delay 1000
Call RunApp(program_path + "  " + video2)
Delay 2000
Call RunApp(program_path + "  " + video3)
Delay 4000
Call RunApp(program_path + "  " + video4)
Delay 8000

//
ScreenW = Plugin.Sys.GetScRX()
w = ScreenW / 2
center_x = w
ScreenH = Plugin.Sys.GetScRY()
h = ScreenH / 2
center_y = h
HwndEx = Plugin.Window.Search(video_name_key)
//TracePrint HwndEx
dim MyArray
MyArray = Split(HwndEx, "|")
index = 0
If UBound(MyArray)>=0 Then
    i=0
    For UBound(MyArray)
    	//TracePrint MyArray(i)
        hwd = Clng(MyArray(i))
        sClass = Plugin.Window.GetClass(hwd)
        //TracePrint sClass
		If sClass = "KMPlayer v3.x" Then 
			//TracePrint index
			//TracePrint hwd
			Plugin.Window.Size hwd,w,h
        	If index=0 Then
        		Plugin.Window.Move hwd,0,0
			ElseIf index= 1 Then
			
				Plugin.Window.Move hwd,center_x, 0
			
			ElseIf index= 2 Then
				Plugin.Window.Move hwd,0, center_y
			ElseIf index= 3 Then
				Plugin.Window.Move hwd,center_x, center_y
			End If
			index  = index + 1
		End If
        i=i+1
    Next
End If 
Delay 1000
Call Lib.系统.结束进程("play_video.exe")
