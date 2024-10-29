-- FileName: global_item_data.lua
-- FilePath: /settings/item
-- Creator: KyoTran
-- Date: 2024-10-29
-- Description: c¸c h»ng sè th­êng dïng trong hµm AddItem
Include("\\script\\lib\\baseclass.lua");

G_TB_ITEM = tbBaseClass:new()

function G_TB_ITEM:_init()
    self.tbTYPE = {
        nNORMAL = 0, -- Xanh Tr¾ng
        nVIOLET = 1, -- TÝm
        nGOLD = 2, -- Hoµng kim
        nGREEN = 3 -- Lôc, ng©n
    };

    self.tbGENRE = {
        nON_BODY = 0, -- vËt dïng mang trªn ng­êi (vò khÝ, ¸o, mò...)
        nBUFF = 1, -- vËt dïng håi søc (m¸u, mana..)
        nTOOLS = 2, -- vËt dông tools.txt
        nMATERIALS = 3, -- nguyªn liÖu materials.txt
        nQUEST_KEY = 4, -- vËt phÈm nhiÖm vô questkey.txt
        nEVENTS = 5, -- vËt phÈm sù kiÖn eventitem.txt
        nMAGIC_SCRIPT = 6
    };

    self.tbDETAIL_TYPE = {
        tbON_BODY = {
            nMELEE_WEAPON = 0, -- cËn chiÕn
            nRANGE_WEAPON = 1, -- tÇm xa
            nARMOR = 2, -- ¸o
            nRING = 3, -- nhÉn
            nAMULET = 4, -- d©y chuyÒn
            nBOOT = 5, -- giµy
            nBELT = 6, -- yªu ®¸i
            nHELM = 7, -- mò
            nCUFF = 8, -- hé uyÓn
            nPENDANT = 9, -- ngäc béi
            nHORSE = 10, -- ngùa
            nMASK = 11 -- mÆt n¹
        }
    };

    self.tbPARTICULAR_TYPE = {};

    self.tbLEVEL = {
        nLV_1 = 1,
        nLV_2 = 2,
        nLV_3 = 3,
        nLV_4 = 4,
        nLV_5 = 5,
        nLV_6 = 6,
        nLV_7 = 7,
        nLV_8 = 8,
        nLV_9 = 9,
        nLV_10 = 10
    };

    self.tbSERIES = {
        nKIM = 0,
        nMOC = 1,
        nTHUY = 2,
        nHOA = 3,
        nTHO = 4
    };

    self.tbLUCK = {};
    self.tbMAGIC = {};
end

G_TB_ITEM:_init();
