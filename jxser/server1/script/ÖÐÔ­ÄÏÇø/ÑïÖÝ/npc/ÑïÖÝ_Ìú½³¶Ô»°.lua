--中原南区 扬州府 铁匠对话

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Ngi c� ph秈 l� hi謕 kh竎h? � y c� c竎 lo筰 binh kh�, ngi th輈h lo筰 n祇?"

function main(sel)
	tiejiang_city()
end;

function yes()
Sale(4);  			--弹出交易框
end;

