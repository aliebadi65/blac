do

function run(msg, matches)
  return [[SMARTGP
-----------------------------------
رباتی جدید برای مدیریت گروه
-----------------------------------
راهنمای قفل ها 
!lock links 
> قفل لینک
!lock flood 
>قفل فلود
!lock spam 
>قفل اسپم
!lock Arabic 
>قفل تایپ عربی
!lock Member 
> قفل ممبر
!lock RTL
> قفل آر تی ال
!lock Tgservice 
> قفل نمایش ندادن زمان ورود کاربران به گروه
!lock sticker 
> قفل استیکر
!lock tag 
> (#) قفل تک
!lock emoji 
> قفل شکلیک ها
!lock english 
> قفل تایپ انگلیسی
!lock fwd 
> قفل فروارد
!lock reply 
> قفل ریپلی
!lock join
> تعطیلی عضو گیری گروه با این کار هر کی وارد گروه بشه پاک میشه
!lock username 
> @ قفل 
!lock media 
> قفل مدیا شامل فیلم .عکس.موزیک.آهنگ
!lock fosh 
> قفل فحش
!lock leave 
> قفل لفت
!lock bots 
> قفل ربات
!lock operator 
> قفل اپراتور های موبایل
!lock all 
> قفل همه چیز
!lock Strict 
> گذاشتن تنظیمات سخت گیرانه هر کی خطا کرد از گروه ریموو بشه
---------------------------------------------------------------
برای باز کردن قفل ها کافیه به جای 
!lock 
از دستور 
!unlock 
قبل از هر دستور استفاده کنید
]]
end
return {
  description = ".", 
  usage = "use helpfa command",
  patterns = {
"^[#!/]([Hh]elpfa)$",
  },
  run = run
}
end
