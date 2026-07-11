//+------------------------------------------------------------------+
//| Phoenix AI PRO MT5                                               |
//| File : Config.mqh                                                |
//| Version : 1.00                                                   |
//+------------------------------------------------------------------+
#ifndef __PHOENIX_CONFIG_MQH__
#define __PHOENIX_CONFIG_MQH__

#define PHOENIX_NAME            "Phoenix AI PRO"
#define PHOENIX_VERSION         "1.00"
#define PHOENIX_MAGIC           777777

//-------------------------
// Trading
//-------------------------
input double InpRiskPercent      = 1.0;
input bool   InpAutoLot          = true;
input int    InpMaxTrades        = 3;
input int    InpMaxTradesPerDay  = 6;

//-------------------------
// Timeframes
//-------------------------
input ENUM_TIMEFRAMES TrendTF    = PERIOD_H1;
input ENUM_TIMEFRAMES EntryTF    = PERIOD_M15;

//-------------------------
// Sessions
// Broker Time
//-------------------------
input bool EnableAsianSession    = false;
input bool EnableLondonSession   = true;
input bool EnableNewYorkSession  = true;

//-------------------------
// Spread Filter
// points
//-------------------------
input int MaxSpreadGold          = 350;
input int MaxSpreadForex         = 25;

//-------------------------
// Symbols
//-------------------------
string Symbols[]
=
{
   "XAUUSD",
   "EURUSD",
   "GBPUSD",
   "USDJPY",
   "USDCHF",
   "USDCAD",
   "AUDUSD"
};

//-------------------------
// Risk Limits
//-------------------------
input double MaxDailyLossPercent = 5.0;
input double MaxDrawdownPercent  = 15.0;

//-------------------------
// Dashboard
//-------------------------
input bool ShowDashboard = true;

//-------------------------
// Logger
//-------------------------
input bool SaveLog = true;

#endif
