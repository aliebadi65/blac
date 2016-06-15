do

local function run(msg, matches)
if matches[1]:lower() == 'pm' then
local txt = URL.escape(matches[2])
local ur = matches[3]
local M = matches[4]
local T = URL.escape(matches[5])
local url = 'https://api.telegram.org/bot148187853:AAGBhINX4iwDCZFDLTue8iRrlrx00Rud8GQ/sendMessage?chat_id=@Smartgp&text=Hosein&parse_mode=Markdown&reply_markup={"inline_keyboard":[[{"text":"'..txt..'","url":"'..ur..'"}]]}'
local b = http.request(url)
     jstr, res = https.request(url)
     jdat = JSON.decode(jstr)
	 if jdat.ok == "true" then
return "ok"
end
end
end
return {
  patterns = {
 "^[!/#](pm) (.*)~(.*) (.*)/(.*)$",
   },
  run = run,
  }
  end
