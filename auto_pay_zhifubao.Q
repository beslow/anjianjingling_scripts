Dim names, phones
phones = Array("saga_chen@hotmail.com",  "1525213860",  "1064387003@qq.com",  "13634836576",  "13870366926", "1450898412",  "15900906990",  "xizhen021@qq.com",  "13581576998","15541906502",  "13463406973",  "13901987379",   "13056628902",  "13816945887",  "13701975242",  "13691747157",   "18602110430",  "13761194658",  "15818838246","18601795577")
Dim color1, color2, color3, color4
Dim head_color1, head_color2, head_color3, head_color4
Dim zhanghao
Dim number
Dim jine
Dim memo
Dim password
Dim 文件路径="/storage/sdcard0/log.txt"
zhanghao = "xxxxxxx"
jine = "0.5"
password = "xxxxxx"
memo = "星战大转盘奖品"

TracePrint "脚本执行于", Now()
Call file.Append(文件路径, "脚本执行于" & CStr(Now()) & "\n")


RunApp "com.eg.android.AlipayGphone"

Delay 5000
Function UBound(arr)
    Dim a,i:i=0
    For Each a In arr 
        i=i+1
    Next
    UBound=i-1
End Function 
Dim index
index = 0

Rem start_one
While index <=  UBound(phones)

zhanghao = phones(index)
Rem main_gui
color1 = GetPixelColor(91,433)
Delay 50
color2 = GetPixelColor(90,447)
Delay 50
color3 = GetPixelColor(77,454)
Delay 50
color4 = GetPixelColor(104,447)
Delay 50

//判断是否是在钱包页面,否则矫正
If color1 = "6862F9" And color2 = "FFFFFF" And color3 = "6862F9" And color4 = "6862F9" Then
	
Else 
	color1 = GetPixelColor(124,1138)
	Delay 50
	color2 = GetPixelColor(303,1120)
	Delay 50
	color3 = GetPixelColor(459,1115)
	Delay 50
	color4 = GetPixelColor(637,1115)
	Delay 50
	If color1 = "09A35A" And color2 = "DF8B2E" And color3 = "D16180" And color4 = "0F5BDD" Then
		RunApp "com.eg.android.AlipayGphone"
		Delay 500
		Tap 93,1220
		Delay 500
		Goto main_gui
	Else
		KeyPress "Back"
		Delay 500
		Goto main_gui
	End If
	
	
End If

//点击转账
Tap 271, 481
Delay 50
Dim t_number
t_number = 0
While true
	//确认到达有 转到支付宝账户 按钮的页面
	head_color1 = GetPixelColor(157,434)
	Delay 50
	head_color2 = GetPixelColor(44,411)
	Delay 50
	head_color3 = GetPixelColor(82,452)
	Delay 50
	head_color4 = GetPixelColor(364,444)
	Delay 50
	If head_color1 = "000000" AND head_color2 = "F0A129" AND head_color3 = "FFFFFF" AND head_color4 = "000000" Then 
		//点击 转到支付宝账户
		Tap 225, 435
		Delay 50
		Exit While
	Else 
		If t_number > 10 Then
			
			TracePrint index, "^ ", zhanghao, " ", "支付失败", " |"
			Call file.Append(文件路径, zhanghao & "支付失败" & "\n")
			index = index + 1
			goto start_one
		Else 
			Delay 50
			t_number = t_number + 1
		End If
	End If
	
Wend

t_number = 0
While True
	//确认到达输入对方账户页面，否则等待
	head_color1 = GetPixelColor(664,192)
	Delay 50
	head_color2 = GetPixelColor(664,230)
	Delay 50
	If head_color1 = "EEAA00" AND head_color2 = "FFFFFF" Then 
		Exit While
	Else 
		If t_number > 10 Then 
			
			TracePrint index, "^ ", zhanghao, " ", "支付失败", " |"
			Call file.Append(文件路径, zhanghao & "支付失败" & "\n")
			index = index + 1
			goto start_one
		Else 
			Delay 50
			t_number = t_number + 1
		End If
	End If
Wend

Rem 填写支付宝账号

//激活 支付宝账号填写框
Tap 439, 208
Delay 50
Tap 439, 208
Delay 50

//清除账号信息
For 20
	KeyPress "Del"
	Delay 10
Next

//输入 支付宝账号
InputText zhanghao
Delay 100

//点击 下一步
Tap 357, 338
Delay 50


t_number = 0
While True
	//判断 是否到付款界面
	head_color1 = GetPixelColor(39,578)
	Delay 50
	head_color2 = GetPixelColor(47,677)
	Delay 50
	head_color3 = GetPixelColor(455,884)
	Delay 50
	If head_color1 = "000000" AND head_color2 = "000000" AND head_color3 = "FFAA00" Then 
		Exit While
	Else 
		If t_number > 10 Then 
			TracePrint index, "^ ", zhanghao, " ", "支付失败", " |"
			Call file.Append(文件路径, zhanghao & "支付失败" & "\n")
			index = index + 1
			goto start_one
		Else 
			//如果查到多个账号，选择第一个
			Tap 318, 659
			Delay 50
			t_number = t_number + 1
			Delay 50
		End If
	End If
Wend

Dim rColor
rColor = GetPixelColor(582, 886)


//开始填写付款信息
	//选择金额框
	Tap 302,576
	Delay 50
	Tap 302,576
	Delay 50
	//清空金额
	For 20
		KeyPress "Del"
		Delay 10
	Next
	//输入金额
	InputText jine
	Delay 50
	//输入备注
	Tap 204,682
	Delay 50
	Tap 204,682
	Delay 50
	InputText memo
	//点击确认转账
	Tap 352, 800
	Delay 50
	
	Tap 515, 799
	Delay 50
	
	//某種特殊情況要處理，下次寫清楚
	head_color1 = GetPixelColor(353,565)
	head_color2 = GetPixelColor(370,555)
	If head_color1 = "FFFFFF" And head_color2 = "05A1FA" Then 
		Tap 515, 799
		Delay 50
	End If
	
	While True
		//确认是否弹出输入密码界面
		head_color1 = GetPixelColor(592,665)
		Delay 50
		head_color2 = GetPixelColor(640,659)
		Delay 50
		If head_color1 = "CECECE" AND head_color2 = "CECECE" Then 
			Exit While	
		Else 
			If t_number > 20 Then 
				TracePrint index, "^ ", zhanghao, " ", "支付失败", " |"
				Call file.Append(文件路径, zhanghao & "支付失败" & "\n")
				index = index + 1
				goto start_one
			Else 
				Tap 515, 799
				Delay 50
				t_number = t_number + 1
			End If
		End If
	Wend
	
	Rem 填写密码
	//选择支付密码框
	Tap 420, 669
	Delay 50
	Tap 420, 669
	Delay 50
	//清空密码
	For 20
		KeyPress "Del"
		Delay 10
	Next
	//输入密码
	InputText password
	Delay 50
	
	t_number = 0
	While True
		//付款按钮是否变蓝
		head_color1 = GetPixelColor(606, 661)
		If head_color1 = "EECE7A" Then 
			Exit While
		Else 
			If t_number > 50 Then 
				TracePrint index, "^ ", zhanghao, " ", "支付失败", " |"
				Call file.Append(文件路径, zhanghao & "支付失败" & "\n")
				index = index + 1
				goto start_one
			Else 
				Delay 50
				t_number = t_number + 1
			End If
		End If
	Wend
	
	//点击 付款 按钮
	Tap 609, 659
	Delay 50
	
	
	
	number = 0
	While true
		//是否到达聊天页面
		head_color1 = GetPixelColor(695,97)
		Delay 50
		head_color2 = GetPixelColor(649,114)
		Delay 50
		head_color3 = GetPixelColor(666,80)
		Delay 50
		//聊天页面
		If head_color1 = "FFFFFF" AND head_color2 = "FFFFFF" AND head_color3 = "FFFFFF" Then 
			TracePrint index, "^ ", zhanghao, " ", "支付成功", " |"
			
			Call file.Append(文件路径, zhanghao & "支付成功" & "\n")
			Delay 50
			Exit While
		Else 
			If number < 10 Then 
				number = number + 1
				Delay 500
			Else 
				TracePrint index, "^ ", zhanghao, " ", "支付失败", " |"
				Call file.Append(文件路径, zhanghao & "支付失败" & "\n")
				EndScript
			End If
		End If
		
	Wend

	index = index + 1
Wend

TracePrint "脚本结束于", Now()
Call file.Append(文件路径, "脚本结束于" & CStr(Now()) & "\n")
