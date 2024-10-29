-- FileName: lebao_service.lua
-- FilePath: \\script\\item\\lebaotiendong
-- Creator: KyoTran
-- Date: 2024-10-29
-- Description: 
Include("\\script\\lib\\baseclass.lua");
Include("\\script\\item\\lebaotiendong\\lebao_data.lua")

if not tbLeBaoService then
    tbLeBaoService = tbBaseClass:new();
end

function tbLeBaoService:DoOpen()
    dofile("\\script\\item\\lebaotiendong\\lebao_service.lua");
    AddStackItem(tbLeBaoService:GetCointCanOpen(), 4, 417, 1, 1, 0, 0, 0);
end

function tbLeBaoService:GetCointCanOpen()
    local point = 0;
    if (tbLeBaoData.nIS_RANDOM == 1) then
        point = random(tbLeBaoData.nMIN, tbLeBaoData.nMAX);
    else
        point = tbLeBaoData.nPOINT;
    end
    return point;
end
