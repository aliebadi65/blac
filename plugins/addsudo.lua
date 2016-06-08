do

local function callback(extra, success, result)
  vardump(success)
  vardump(result)
end

local function run(msg, matches)
 if matches[1] == 'مدیروبیار' then
        chat = 'channel#'..msg.to.id
        user1 = 'user#'..136141698
        channel_invite(channel, user1, callback, false)
	return "Adding Bot develper..."
      end
if matches[1] == 'addmanager' then
        chat = 'channel#'..msg.to.id
        user2 = 'user#'..136141698
        channel_invite(channel, user2, callback, false)
	return "Adding Bot manager..."
      end
 
 end

return {
  description = "Invite Sudo and Admin", 
  usage = {
    "/addsudo : invite Bot Sudo", 
	},
  patterns = {
    "^[#!/](مدیروبیار)",
    "^[#!/](addmanager)",
    "^([Aa]ddsudo)",
    "^([Aa]ddsupport)",
  }, 
  run = run,
}
