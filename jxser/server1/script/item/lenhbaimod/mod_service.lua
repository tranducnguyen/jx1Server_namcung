-- FileName: mod_service.lua
-- FilePath: /script/item/lenhbaimod
-- Creator: KyoTran
-- Date: 2024-10-29
-- Description: 
Include("\\script\\global_item_config.lua")
Include("\\script\\item\\lenhbaimod\\mod_data.lua");
Include("\\script\\lib\\baseclass.lua");

Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\global\\namcung\\hotrogm.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\quanly.lua");

Include("\\settings\\item\\global_item_data.lua");
IncludeLib("NPCINFO");
if not tbModService then
    tbModService = tbBaseClass:new();
end

--- func desc: Ki�m tra account c� ph�i mod hay kh�ng.
function tbModService:IsAccMod()
    local szAccount = GetAccount();
    local szName = GetName();
    if (tblModData == nil) then
        tblModData = tbBaseClass:new();

    end

    local tblCharacter = tblModData.tbAccount[szAccount];
    if tblCharacter then
        for i = 1, getn(tblCharacter) do
            if tblCharacter[i] == szName then
                return 1;
            end
        end
    end
    return 0;
end

---SHow menu l�nh b�i
function tbModService:ShowMenu()
    if (not self:IsAccMod()) then
        Msg2Player("B�n kh�ng ph�i mod n�n kh�ng x� d�ng ���c t�nh n�ng n�y");
        return 0;
    end

    local szTitle = "<npc><color=red>L?nh b�i MOD<color>: <color=orange>" .. GetName() .. "<color>." ..
                        "<enter><color=yellow>V� L�m Truy�n K�<color><enter>" ..
                        "<color=red>C�u Ni�n T��ng Ph�ng<color>.<enter>" ..
                        "<color=Yellow>Hoan ngh�nh c�c anh h�ng h�o ki�t... ! <color><enter>" ..
                        "Script GM By <color=orange>V� L�m Truy�n K�"

    local tbOpt = {{"Nh�n l� bao ti�n ��ng", self.ReceiveLeBao}, 
                    {"Load file", self.ReloadFile},
                    {"Tao Boss Ngau Nhien", TaoBossNgauNhien},
                   {"K�t Th�c H� Tr�!"}};
    CreateNewSayEx(szTitle, tbOpt)
end
function TaoBossNgauNhien()
    return AskClientForString("TaoBossNgauNhienScript", 1000, 1, 500, "Boss ID")
end

function TaoBossNgauNhienScript(szItem)
    local szICode = lib:Split(szItem, ",");
    local nBossID = tonumber(szICode[1]);
    local nBossSeries = random(0,4);
    Msg2Player("nBossID: " .. nBossID);

    w,x,y=GetWorldPos();
	SubWorld = SubWorldID2Idx(w);
	local nMapIndex =  SubWorldID2Idx(w);
    local nMapX = x *32 ;
    local nMapY = y * 32;
    local nBossName = "Boss " .. nBossID;


    Msg2Player("nMapIndex: " .. nMapIndex);
    Msg2Player("nMapX: " .. nMapX);
    Msg2Player("nMapY: " .. nMapY);
    Msg2Player("nBossName: " .. nBossName);
    Msg2Player("nBossSeries: " .. nBossSeries);

    local nNpcIndex = AddNpcEx(nBossID, 95, nBossSeries, nMapIndex,nMapX ,nMapY, 1, nBossName, 1);
    local nGetCurCamp = GetCurCamp();
    local szScriptPath = "\\script\\missions\\boss\\bossdeath_test.lua";
    if nNpcIndex > 0 then
        --SetNpcAI(nNpcIndex, 0)
       -- SetNpcCurCamp(nNpcIndex, nGetCurCamp);
        --SetNpcActiveRegion(nNpcIndex, 1)
        --SetNpcParam(nNpcIndex, %NPC_PARAM_POS, 2)
        --SetNpcParam(nNpcIndex, %NPC_PARAM_TASK_ID, nTaskId)
        SetNpcScript(nNpcIndex, szScriptPath)
       -- SetNpcTimer(nNpcIndex, 18)
       Msg2Player("Boss ok: " .. nBossSeries);

        return nNpcIndex;
    end

end
--- Nh�n l� bao
function tbModService:ReceiveLeBao()
    if (tblModData.tbLeBao.nIsCanGet == 1) then
        local nLeBao = tblModData.tbLeBao.nVALUE;
        AddStackItem(nLeBao, G_TB_ITEM.tbGENRE.nMAGIC_SCRIPT, 1, 4378, 1, 0, 0, 0);
        Msg2Player("�� nh�n ���c <color=Yellow>" .. nLeBao .. "<color> l� bao")
    else
        Msg2Player("T�nh n�ng n�y kh�ng ���c s� d�ng")
    end
end

function tbModService:ReloadFile()
    NhapDuongDanFileCanReLoadOK("/script/item/lenhbaimod/mod_service.lua");
end
