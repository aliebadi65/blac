do

function run(msg, matches)
  return " The Support Invition Link : \n https://telegram.me/joinchat/C2AZVz9e1oI_Dcw34YYSsQ\n-------------------------------------\nID: @smartgp"
  end
return {
  description = "shows support link", 
  usage = "tosupport : Return supports link",
  patterns = {
    "^[#!/]support$",
    "^/tosupport$",
    "^#tosupport$",
    "^>tosupport$",
     "^پشتیبانی$",
  },
  run = run
}
end
