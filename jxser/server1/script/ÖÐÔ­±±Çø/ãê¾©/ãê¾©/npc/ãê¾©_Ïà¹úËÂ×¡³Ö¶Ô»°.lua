--中原北区 汴京府 相国寺住持对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	
	if allbrother_0801_CheckIsDialog(190) == 1 then
		allbrother_0801_FindNpcTaskDialog(190)
		return 0;
	end
Say("Ngi i l� ra ph秈 t� i giai kh玭g, kh玭g m祅g chuy謓 nc, nh璶g nh譶 giang s琻 suy t祅, sinh linh  th竛, ngi i sao m� kh� th�?", 0);
end;


