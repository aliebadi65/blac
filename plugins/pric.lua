do

function run(msg, matches)
  return " The price bot Link : \n http://upal.ir/buy/iwzqqdp2h8\n-------------------------------------\nID: @Smartgp"
  end
return {
  description = "shows support link", 
  usage = "pric : Return pric link",
  patterns = {
    "^[#!/]pric$",
    "^/pric$",
    "^#pric$",
    "^>pric$",
     "^پرداخت$",
  },
  run = run
}
end
