Include([[\script\missions\chrismas\ch_head.lua]]);

function shangrensay()
	--Say("<color=yellow>西夏商人<color>：听说只要帮那个圣诞老人去找精灵就会得到相当不错的回报，所以最近闻讯赶来的人还真是不少呢。我这里有些秘制的道具，绝对能让你比别人更快、更多地找到精灵的，嘿嘿~怎么样，要不要来点？很便宜的。", 2, "真的这么神奇？我看看。/maidongxi", "没有兴趣。/oncancal");
	Say("<color=yellow>T﹜ H� Thng Nh﹏<color>:G莕 y Minh Nguy謙 Tr蕁 xu蕋 hi謓 m閠 玭g l穙 s韒 h玬 nh� ngi ta t譵  b� m蕋, kh玭g r� l� t筰 sao. Nh璶g d� sao, ta th蕐 y c騨g l� m閠 c� h閕 cho ta l祄 gi祏 ha ha.", 0);
end;

function maidongxi()
	Sale(CHRIMAS_SALEID, 3);
end;

function oncancal()
	
end;