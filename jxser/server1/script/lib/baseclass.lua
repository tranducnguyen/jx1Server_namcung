
-- FileName: baseclass.lua
-- FilePath: /script/lib
-- Creator: KyoTran
-- Date: 2024-10-29
-- Description: table sö dông nh­ class trong OOP
Include("\\script\\lib\\common.lua")
tbBaseClass = {}

function tbBaseClass:new(...)
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb._tbBase = self
	local isOk
	if (tb._init) then
		isOk = tb:_init(unpack(arg));
	end;
	return tb,isOk;

end

function tbBaseClass:NewClass(tbClass, ...)
	local tb = {}
	for k, v in tbClass do
		tb[k] = v
	end
	tb._tbBase = tbClass
	
	local isOk
	if (tb._init) then
		isOk = tb:_init(unpack(arg));
	end;
	return tb,isOk;

end


