local tbl = {
	[501] = {
		unidentifiedDisplayName = "Red Potion",
		unidentifiedResourceName = "빨간포션",
		unidentifiedDescriptionName = {
			"A potion made from",
			"grinded Red Herbs that",
			"restores ^000088about 45 HP^000000.",
			"^ffffff_^000000",
			"Weight: ^7777777^000000"
		},
		identifiedDisplayName = "Red Potion",
		identifiedResourceName = "빨간포션",
		identifiedDescriptionName = {
			"A potion made from grinded Red Herbs that restores ^000088about 45 HP^000000 when used.",
			"^ffffff_^000000",
			"Weight: ^7777777^000000"
		},
		slotCount = 0,
		ClassNum = 0,
		costume = false
	}} --table para exemplo

local function wait(seconds)
  local start = os.time()
  repeat until os.time() > start + seconds
end

local modo_turbo = true --para tables muito grande recomendo que desliguem o modo turbo

local function table_to_json(table) -- table in, string out
  local str = "{"
  local c = 0
  for k, v in pairs(table) do
    c = c+1
    if c%100 == 0 and not modo_turbo then wait(0.1) end
    str = str..'"'..tostring(k)..'": '
    if type(v) == "table" then
      str = str..table_to_json(v)
    elseif type(v) == "string" then
      str = str..'"'..tostring(v)..'"'
    elseif type(v) == "number" then
      str = str..tostring(v)
    elseif type(v) == "boolean" then
      if v then str = str.."true" else str = str.."false" end
    elseif type(v) == "nil" then
      str = str.."null"
    end
    str = str..",\n"
  end
  str = string.sub(str,1,-3).."\n"
  str = str.."}"
  return(str)
end

print(table_to_json(tbl))
