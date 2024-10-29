tbAccountGM = 
{ 
	["admin1"] = 
	{
		"GameMaster1",
		"GameMaster101",
		"GameMaster102",
		"GameMaster103",
		"GameMaster104",
	},
	["admin2"] = 
	{
		"GameMaster2",
		"GameMaster201",
		"GameMaster202",
		"GameMaster203",
		"GameMaster204",
	},
	["admin3"] = 
	{
		"GameMaster3",
		"GameMaster301",
		"GameMaster302",
		"GameMaster303",
		"GameMaster304",
	},
	["admin4"] = 
	{
		"GameMaster4",
		"GameMaster401",
		"GameMaster402",
		"GameMaster403",
		"GameMaster404",
	},
	["123456"] = 
	{
		"GameMaster",
		"GameMaster001",
		"GameMaster002",
		"GameMaster003",
		"GameMaster004",
	}
}
function CheckAccountGM()
	local szAccount = GetAccount() 
	local szName = GetName() 
	local tbRoleList = tbAccountGM[szAccount] 
	if tbRoleList then 
		for i=1, getn(tbRoleList) do 
			if tbRoleList[i] == szName then 
				return 1
			end 
		end 
	end 
end