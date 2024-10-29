-- FileName: lebao_data.lua
-- FilePath: /script/item/lebaotiendong
-- Creator: KyoTran
-- Date: 2024-10-29
-- Description: 

Include("\\script\\lib\\baseclass.lua")

if (tbLeBaoData == nil) then
    tbLeBaoData = tbBaseClass:new();
end

function tbLeBaoData:_init()
    self.nIS_RANDOM = 0;
    self.nMIN = 1;
    self.nMAX = 100;
    self.nPOINT = 50;
end


tbLeBaoData:_init();
