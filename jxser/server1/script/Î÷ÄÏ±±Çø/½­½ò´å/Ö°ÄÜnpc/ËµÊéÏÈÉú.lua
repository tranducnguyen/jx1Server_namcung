--西南北区 江津村 说书先生罗晓音

function main(sel)

Say("L璾 l筩 giang h� c� n鯽 i, cu鑙 c飊g ch� l� m閠 k� b莕 h祅 m� th玦!", 2, "Nghe m閠 畂筺 s竎h /yes", "Kh玭g nghe /no");

end;


function yes()
	i=random(0,2);
	if(i == 0)then
		PlayMusic("\\Music\\Music901.mp3")
	elseif(i == 1)then
		PlayMusic("\\Music\\Music902.mp3")
	else
		PlayMusic("\\Music\\Music903.mp3")
	end;
end;


function no()
end;
