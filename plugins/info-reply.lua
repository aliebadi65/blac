local function action_by_reply(extra, success, result)-- (reply) /info  function
		if result.from.username then
		   Username = '@'..result.from.username
		   else
		   Username = '----'
		 end
   
    userrank = "Member"
	if tonumber(result.from.id) == 136141698 then
		userrank = "Master ⭐⭐⭐⭐"
		send_document(org_chat_id,"./icons/7.webp", ok_cb, false)
	elseif is_sudo(result) then
		userrank = "Sudo ⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"./icons/8.webp", ok_cb, false)
	elseif is_admin(result) then
		userrank = "Admin ⭐⭐⭐"
		send_document(org_chat_id,"./icons/3.webp", ok_cb, false)
	elseif tonumber(result.from.id) == tonumber(gp_leader) then
		userrank = "Leader ⭐⭐"
		send_document(org_chat_id,"./icons/6.webp", ok_cb, false)
	elseif is_momod(result) then
		userrank = "Moderator ⭐"
		send_document(org_chat_id,"./icons/4.webp", ok_cb, false)
	elseif tonumber(result.from.id) == tonumber(our_id) then
		userrank = "Umbrella ⭐⭐⭐⭐⭐⭐"
		send_document(org_chat_id,"./icons/9.webp", ok_cb, false)
	elseif result.from.username then
		if string.sub(result.from.username:lower(), -3) == "bot" then
			userrank = "API Bot"
			send_document(org_chat_id,"./icons/5.webp", ok_cb, false)
		end
	end
	--custom rank ------------------------------------------------------------------------------------------------
	local file = io.open("./info/"..result.from.id..".txt", "r")
	if file ~= nil then
		usertype = file:read("*all")
	else
		usertype = "-----"
	end
	--cont ------------------------------------------------------------------------------------------------
	local user_info = {}
	local uhash = 'user:'..result.from.id
	local user = redis:hgetall(uhash)
	local um_hash = 'msgs:'..result.from.id..':'..result.to.id
	user_info.msgs = tonumber(redis:get(um_hash) or 0)
	--msg type ------------------------------------------------------------------------------------------------
	if result.media then
		if result.media.type == "document" then
			if result.media.text then
				msg_type = "استیکر"
			else
				msg_type = "ساير فايلها"
			end
		elseif result.media.type == "photo" then
			msg_type = "فايل عکس"
		elseif result.media.type == "video" then
			msg_type = "فايل ويدئويي"
		elseif result.media.type == "audio" then
			msg_type = "فايل صوتي"
		elseif result.media.type == "geo" then
			msg_type = "موقعيت مکاني"
		elseif result.media.type == "contact" then
			msg_type = "شماره تلفن"
		elseif result.media.type == "file" then
			msg_type = "فايل"
		elseif result.media.type == "webpage" then
			msg_type = "پیش نمایش سایت"
		elseif result.media.type == "unsupported" then
			msg_type = "فايل متحرک"
		else
			msg_type = "ناشناخته"
		end
	elseif result.text then
		if string.match(result.text, '^%d+$') then
			msg_type = "عدد"
		elseif string.match(result.text, '%d+') then
			msg_type = "شامل عدد و حروف"
		elseif string.match(result.text, '^@') then
			msg_type = "یوزرنیم"
		elseif string.match(result.text, '@') then
			msg_type = "شامل یوزرنیم"
		elseif string.match(result.text, '[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]') then
			msg_type = "لينک تلگرام"
		elseif string.match(result.text, '[Hh][Tt][Tt][Pp]') then
			msg_type = "لينک سايت"
		elseif string.match(result.text, '[Ww][Ww][Ww]') then
			msg_type = "لينک سايت"
		elseif string.match(result.text, '?') then
			msg_type = "پرسش"
		else
			msg_type = "متن"
		end
	end
	--hardware ------------------------------------------------------------------------------------------------
	if result.text then
		inputtext = string.sub(result.text, 0,1)
		if result.text then
			if string.match(inputtext, "[a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z]") then
				hardware = "کامپیوتر"
			elseif string.match(inputtext, "[A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z]") then
				hardware = "موبایل"
			else
				hardware = "-----"
			end
		else
			hardware = "-----"
		end
	else
		hardware = "-----"
	end
	--phone ------------------------------------------------------------------------------------------------
	if access == 1 then
		if result.from.phone then
			number = "0"..string.sub(result.from.phone, 3)
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\nکشور: جمهوری اسلامی ایران"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nنوع سیمکارت: همراه اول"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\nنوع سیمکارت: تالیا"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nنوع سیمکارت: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nنوع سیمکارت: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nنوع سیمکارت: رایتل"
				else
					number = number.."\nنوع سیمکارت: سایر"
				end
			else
				number = number.."\nکشور: خارج\nنوع سیمکارت: متفرقه"
			end
		else
			number = "-----"
		end
	elseif access == 0 then
		if result.from.phone then
			number = "شما مجاز نیستید"
			if string.sub(result.from.phone, 0,2) == '98' then
				number = number.."\nکشور: جمهوری اسلامی ایران"
				if string.sub(result.from.phone, 0,4) == '9891' then
					number = number.."\nنوع سیمکارت: همراه اول"
				elseif string.sub(result.from.phone, 0,5) == '98932' then
					number = number.."\nنوع سیمکارت: تالیا"
				elseif string.sub(result.from.phone, 0,4) == '9893' then
					number = number.."\nنوع سیمکارت: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9890' then
					number = number.."\nنوع سیمکارت: ایرانسل"
				elseif string.sub(result.from.phone, 0,4) == '9892' then
					number = number.."\nنوع سیمکارت: رایتل"
				else
					number = number.."\nنوع سیمکارت: سایر"
				end
			else
				number = number.."\nکشور: خارج\nنوع سیمکارت: متفرقه"
			end
		else
			number = "-----"
		end
	end
	--info ------------------------------------------------------------------------------------------------
	info = "نام کامل: "..string.gsub(result.from.print_name, "_", " ").."\n"
	.."نام کوچک: "..(result.from.first_name or "-----").."\n"
	.."نام خانوادگی: "..(result.from.last_name or "-----").."\n\n"
	.."شماره موبایل: "..number.."\n"
	.."یوزرنیم: @"..(result.from.username or "-----").."\n"
	.."آی دی: "..result.from.id.."\n\n"
	.."مقام: "..usertype.."\n"
	.."جایگاه: "..userrank.."\n\n"
	.."رابط کاربری: "..hardware.."\n"
	.."تعداد پیامها: "..user_info.msgs.."\n"
	.."نوع پیام: "..msg_type.."\n\n"
	.."نام گروه: "..string.gsub(result.to.print_name, "_", " ").."\n"
	.."آی دی گروه: "..result.to.id
	send_large_msg(org_chat_id, info)
end


  local function run(msg)
    if msg.text == '/info' and msg.reply_id then
      get_message(msg.reply_id, action_by_reply, get_receiver(msg))
    end
  end

  return {
    decription = 'Print user_id by_reply',
    usage = 'Reply to a message then type: !id',
    patterns = {
      "^/(info)$"
    },
    run = run
  }

end 

