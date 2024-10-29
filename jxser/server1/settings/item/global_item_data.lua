-- FileName: global_item_data.lua
-- FilePath: /settings/item
-- Creator: KyoTran
-- Date: 2024-10-29
-- Description: c�c h�ng s� th��ng d�ng trong h�m AddItem
Include("\\script\\lib\\baseclass.lua");

G_TB_ITEM = tbBaseClass:new()

function G_TB_ITEM:_init()
    self.tbTYPE = {
        nNORMAL = 0, -- Xanh Tr�ng
        nVIOLET = 1, -- T�m
        nGOLD = 2, -- Ho�ng kim
        nGREEN = 3 -- L�c, ng�n
    };

    self.tbGENRE = {
        nON_BODY = 0, -- v�t d�ng mang tr�n ng��i (v� kh�, �o, m�...)
        nBUFF = 1, -- v�t d�ng h�i s�c (m�u, mana..)
        nTOOLS = 2, -- v�t d�ng tools.txt
        nMATERIALS = 3, -- nguy�n li�u materials.txt
        nQUEST_KEY = 4, -- v�t ph�m nhi�m v� questkey.txt
        nEVENTS = 5, -- v�t ph�m s� ki�n eventitem.txt
        nMAGIC_SCRIPT = 6
    };

    self.tbDETAIL_TYPE = {
        tbON_BODY = {
            nMELEE_WEAPON = 0, -- c�n chi�n
            nRANGE_WEAPON = 1, -- t�m xa
            nARMOR = 2, -- �o
            nRING = 3, -- nh�n
            nAMULET = 4, -- d�y chuy�n
            nBOOT = 5, -- gi�y
            nBELT = 6, -- y�u ��i
            nHELM = 7, -- m�
            nCUFF = 8, -- h� uy�n
            nPENDANT = 9, -- ng�c b�i
            nHORSE = 10, -- ng�a
            nMASK = 11 -- m�t n�
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
