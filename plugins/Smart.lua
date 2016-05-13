do

function run(msg, matches)
  return [[SMARTGP
-----------------------------------
رباتی جدید برای مدیریت گروه
-----------------------------------
راههای ارتباطی
-----------------------------------
@aliebadi5
-----------------------------------
@AliE1_bot
-----------------------------------
Bot number : +18432530615
-----------------------------------
Bot version : 4.7 ]]
end
return {
  description = ".", 
  usage = "use smart command",
  patterns = {
    "^/smart$",
    "^!smart$",
    "^%smart$",
    "^$smart$",
   "^#Smart$",
   "^#Smart",
   "^/smart$",
   "^#smart$",

  },
  run = run
}
end
