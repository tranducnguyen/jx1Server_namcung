function main(nItemIdx) 
if (GetPK() == 0) then 
Say("Ng�i tr��c m�t PK tr� gi� �� v� 0 li�u , kh�ng c�n s� d�ng n�a tri�u ��nh x� s�ch . ", 0); 
Msg2Player("Ng�i tr��c m�t PK tr� gi� �� v� 0 li�u , kh�ng c�n s� d�ng n�a tri�u ��nh x� s�ch . "); 
return 1; 
end; 
SetPK(0); 
Say("Ng�i s� d�ng <color=yellow> tri�u ��nh x� s�ch <color> , ng��i PK tr� gi� b�y gi� l�m 0 li�u . ", 0); 
Msg2Player("Ng�i s� d�ng <color=yellow> tri�u ��nh x� s�ch <color> , ng��i PK tr� gi� b�y gi� l�m 0 li�u . "); 
if (GetWorldPos() == 208) then 
SetTask(96,100) 
end; 
end; 