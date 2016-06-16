local api_key = '188489357:AAGZ2S3q3TlM6c3qGIlIdv1mUDh5nIN-Hfg' --توکن ربات خود را اینجا قرار دهید
local function run(msg,matches)
  if matches[1] == 'linksp' then
    local text = matches[2] --مطلب
    local channel_id = matches[3] -- در اینجا ایدی کانال خود را قرار دهید
    local link_text = matches[4]  --لینک دگمه
    local data = load_data(_config.moderation.data)
    local link = data[tostring(1063179906)]['settings']['set_link'] --ایدی ساپورت خود را با این ایدی عوض کنید
local keyboard = '{"inline_keyboard":[[{"text":"'..link_text..'","url":"'..link..'"}],[{"text":"ورود به کانال اسمارت","url":"https://telegram.me/Smartgp"}],[{"text":"تماس با ما","url":"http://telegram.me/AliE1_BOT"},{"text":"ورود به سایت","url":"http://test.ir"}]]}' --به دلخواه متن ها را تغییر دهید
local url = 'https://api.telegram.org/bot'..api_key..'/sendMessage?chat_id='..channel_id..'&parse_mode=Markdown&text='..text..'&disable_web_page_preview=true&reply_markup='..keyboard
    local dat, res = https.request(url)
      if res == 400 then
         reply_msg(msg.id, 'Error !', ok_cb, true)    
         else
         reply_msg(msg.id, ok_cb, true)    
      end
      end
  return {
      patterns = {
          "^[!/#]([Ll]inksp) (.*) (.*) (.*) (.*)$"
          },
      run = run
  }
