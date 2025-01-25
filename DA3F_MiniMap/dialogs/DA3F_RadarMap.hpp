class DA3F_RadarMap
{
	idd 	= 230125;
	name	= "DA3F_RadarMap";
	author	= "@roun";
    movingEnable = 0;
    onload = "uinameSpace setvariable [""DA3F_RadarMap"", param[0, displayNull, [displayNull]]]";
    duration = 10e10;
    fadein = 0;
    fadeout = 0;
	class controlsBackground
	{
		class txt_pos : DA3F_StructuredText
		{
			idc = 1100;
			x = 0.797 * safezoneW + safezoneX;
			y = 0.695 * safezoneH + safezoneY;
			w = 0.1955 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class Map : DA3F_CtrlMap
		{
			idc = 1000;
			x = 0.797 * safezoneW + safezoneX;
			y = 0.728 * safezoneH + safezoneY;
			w = 0.1955 * safezoneW;
			h = 0.18 * safezoneH;
		};
		class bg_prog : DA3F_BackG
		{
			idc = 1003;
			x = 0.793229 * safezoneW + safezoneX;
			y = 0.9055 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.02 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class Progress_water : DA3F_Progress
		{
			idc = 1001;
			x = 0.89375 * safezoneW + safezoneX;
			y = 0.9055 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.02 * safezoneH;
			// colorBackground[] = {-1,1,-1,1};
		};
		class Progress_eat : DA3F_Progress
		{
			idc = 1002;
			x = 0.793229 * safezoneW + safezoneX;
			y = 0.9055 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.02 * safezoneH;
			// colorBackground[] = {1,-1,-1,1};
			shadow = 0;
			colorBar[] = {0.8,0,0,0.95};
			colorFrame[] = {-1, -1, -1, 1};
		};
		class BgRadarMap : DA3F_Pix
		{
			idc = 1200;
			text = "imgs\radarMap\hudradar_gta_type.paa";
			x = 0.7875 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.2125 * safezoneW;
			h = 0.38 * safezoneH;
		};
	};
};
