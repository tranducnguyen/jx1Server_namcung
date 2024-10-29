-- FileName:mod_data.lua
-- Creator:KyoTran
-- Date:2024-10-29
-- Comment: Qu¶n lý data cña modifier
Include("\\script\\lib\\baseclass.lua")

if (tblModData == nil) then
    tblModData = tbBaseClass:new();
end

function tblModData:_init()
    print("tblModData Init");
    self.tbAccount = {
        nguyen = {"nguyen01", "nguyen02", "nguyen03", "nguyen04", "nguyen05"}
    };

    self.tbSkill = {732, 733};
    self.tbLeBao = {
        nIsCanGet = 0,
        nVALUE = 5
    }
end

tblModData:_init();
