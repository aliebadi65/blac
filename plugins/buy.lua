local function run(msg, matches)
if matches[1] then
    if tonumber(matches[1]) < 10000 or tonumber(matches[1]) > 1000000 then
        return "خطا :\nمبلغ وارد شده باید بین 10000ریال تا 1000000باشد"
      end
end
if matches[1] then
return 'مبلغ قابل پرداخت : '..matches[1]..'\nلینک پرداخت شما :\n\nhttp://hextor.ir/buy/reserve.php?buy='..matches[1]..'&id='..msg.from.id
end

end

return {
  description = "درگاه پرداخت", 
  usage = "درگاه پرداخت",
  patterns = {
    "^[/#!][Bb]uy (%d+)$"

}, 
  run = run,
}


--[[
به جای ادرس cruel-plus.ir
ادرس سایت خود را وارد کنید

]]
