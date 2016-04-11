Dim reply
Dim h
reply = Array("绝对真实", "来吧，各位，顶起来！", "我来冒个泡！",  "顶你个肺", "绝帖","请叫楼主雷锋", "精华中的精华", "楼主是好人", "楼主是雷锋","赞一个", "感谢楼主分享", "顶",  "我来灌个水！", "借贵宝地冒个泡！", "人人为我，我为人人，帮楼主顶一个！", "万花丛中一点红，楼主是人见人爱的小甜甜！", "这么好的东东，怎么可以不顶？", "大神呀！终于找到你了！", "鞋之物语，很好的微信号", "我潜水我光荣！", "我分享我光荣！", "我顶帖我光荣！", "劳动模范来顶帖！", "楼主是劳动模范！", "楼主人见人爱，花见花开，车见车爆胎！", "好帖已收藏！")
max_index = UBound(reply)
index = 0

Dim tiezi
tiezi = Array( "http://tieba.baidu.com/p/4346876634", "http://tieba.baidu.com/p/4341388832", "http://tieba.baidu.com/p/4435397209", "http://tieba.baidu.com/p/3942095023", "http://tieba.baidu.com/p/4173109051", "http://tieba.baidu.com/p/4184867574")

ProcessID=Plugin.Web.Bind("wqm.exe")
Delay 2000
If ProcessID=0 then
  MessageBox "网页按键精灵没有运行"
  EndScript
End If

Call Plugin.Web.Tips("脚本开始运行")
Call Plugin.Web.SetSize(1436, 908)

While True
ix = 0
For 6

Call Plugin.Web.Go(tiezi(ix))
TracePrint tiezi(ix)
ix = ix + 1
Call Plugin.Web.ScrollTo(0,0)
Delay 1279
Call Plugin.Web.LeftClick(124,190)
Delay 1045
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,652)
Delay 500
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,1304)
Delay 109
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,1956)
Delay 93
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,2607)
Delay 78
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,3259)
Delay 110
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,3911)
Delay 109
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,4563)
Delay 125
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,5215)
Delay 93
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,5867)
Delay 78
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,6519)
Delay 125
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,7171)
Delay 109
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,7822)
Delay 125
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,8474)
Delay 109
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,9126)
Delay 109
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,9778)
Delay 110
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,10046)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Delay 187
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.ScrollTo(0,10094)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyDown(34)
Call Plugin.Web.KeyPress(34)
Delay 2637
Call Plugin.Web.LeftClick(413,469)
Delay 2074

//如果當前時間是凌晨1點到8點，不發帖
h=Hour(NOW)
If h>8 Then

Plugin.Web.SendString reply(index)
index = index + 1
If index > max_index Then 
	index = 0
End If

Delay 1404
KeyDown 17,1
Delay 281
Call Plugin.Web.KeyPress(13)
Delay 359
KeyUp 17,1
Call Plugin.Web.ScrollTo(0,0)

End If

Delay 60000

Call Plugin.Web.TabClose 

Delay 60000
Next
//Call Lib.系统.结束进程("wqm.exe")
//Delay 7200000
For xx=0 To 60
	Delay 60000
	TracePrint xx
	TracePrint "1分鐘過去了"
Next
Wend
Sub OnScriptExit()
  Call Plugin.Web.Tips("脚本停止运行")
End Sub
