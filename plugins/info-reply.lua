 do

  local function action_by_reply(extra, success, result)
    if result.from.username then
      user_name = '@'..result.from.username
    else
      user_name = ''
    end
    if result.from.username then
      User_name = 'telegram.me/'..result.from.username
    else
      User_name = ''
    end
    local function getusernumo(phonen)
local pt
if string.match(phonen, "^98910") or string.match(phonen, "^98911") or string.match(phonen, "^98912") or string.match(phonen, "^98913") or string.match(phonen, "^98914") or string.match(phonen, "^98915") or string.match(phonen, "^98916") or string.match(phonen, "^98917") or string.match(phonen, "^98918") then
pt = 'Hamrah-e-aval'
elseif string.match(phonen, "^98919") or string.match(phonen, "^98990") then
pt = 'Hamrah-e-aval'
elseif string.match(phonen, "^98930") or string.match(phonen, "^98933") or string.match(phonen, "^98935") or string.match(phonen, "^98936") or string.match(phonen, "^98937") or string.match(phonen, "^98903") or string.match(phonen, "^98938") or string.match(phonen, "^98939") then
pt = 'IranCell'
elseif string.match(phonen, "^98901") or string.match(phonen, "^98902") then
pt = 'IranCell'
elseif string.match(phonen, "^98920") then
pt = 'Rightel'
elseif string.match(phonen, "^98921") then
pt = 'Rightel'
elseif string.match(phonen, "^98931") or string.match(phonen, "^989324") then
pt = 'Spadan'
elseif string.match(phonen, "^989329") then
pt = 'Taliya'
elseif string.match(phonen, "^98934") then
pt = 'KiSh'
elseif string.match(phonen, "^63908") then
pt = 'Philipin'
elseif string.match(phonen, "^1") then
pt = 'U.S.A'
elseif string.match(phonen, "^62") then
pt = 'Indonesia'
else
pt = 'Unknown'
end
return pt
end

local function getusernum(phonen)
local pt
if string.match(phonen, "^98") then
tt = 'Iran'
elseif string.match(phonen, "^63") then
tt = 'Philipin'
elseif string.match(phonen, "^1") then
tt = 'U.S.A'
elseif string.match(phonen, "^62") then
tt = 'Indonesia'
else
tt = 'Unknown'
end
return tt
end

if result.from.phone then
    sim = '+'..string.gsub(tostring(result.from.phone),string.sub(tostring(result.from.phone),-4),'****')
	op = getusernumo(result.from.phone)
	tt = getusernum(result.from.phone)
	else
	sim = '----'
	op = '----'
	tt = '----'
	end
    local user_info = {}
	local uhash = 'user:'..result.from.id
	local user = redis:hgetall(uhash)
	local um_hash = 'msgs:'..result.from.peer_id..':'..result.to.id
	user_info.msgs = tonumber(redis:get(um_hash) or 0)
local url , res = http.request('http://api.gpmod.ir/time/')
          if res ~= 200 then return "No connection" end
      local jdat = json:decode(url)
    local text = '<>User Id  : '..result.from.peer_id..'\n\n'
              ..'<>Group Id  : '..result.to.peer_id..'\n\n'
              ..'<>User Name  : '..user_name..'\n\n'
              ..'<>Time  : '..jdat.ENtime..'\n\n'
              ..'<>Date  : '..jdat.ENdate..'\n\n'
              ..'<>Phone Number  : +'..(result.from.phone or "-----")..'\n\n'
              ..'<>SimCard : '..op..'\n\n'
              ..'<>LocaTion : '..tt..'\n\n'
              ..'<>Messages : '..user_info.msgs..'\n\n'
              ..'<>Group Name : '..(result.to.print_name or "-----")..'\n\n'
              ..'<>Full Name : '..(result.from.print_name or "-----")..'\n\n'
              ..'<>First Name : '..(result.from.first_name or "-----")..'\n\n'
              ..'<>Last Name : '..(result.from.last_name or "-----")..'\n\n'
              ..'<>Link  : '..User_name..'\n\n'
              ..'<>Id MsG  : '..result.id..'\n\n'
              ..'<>MsG  : '..result.text..'\n'
    send_large_msg(extra, text)
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

