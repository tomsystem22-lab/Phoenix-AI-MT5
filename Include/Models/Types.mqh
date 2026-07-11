//+------------------------------------------------------------------+
//| Phoenix AI PRO MT5                                               |
//| File : Types.mqh                                                 |
//| Version : 1.00                                                   |
//+------------------------------------------------------------------+
#ifndef __PHOENIX_TYPES_MQH__
#define __PHOENIX_TYPES_MQH__

//------------------------------------------------------------
// Trade Direction
//------------------------------------------------------------
enum ENUM_TRADE_DIRECTION
{
   TRADE_NONE = 0,
   TRADE_BUY,
   TRADE_SELL
};

//------------------------------------------------------------
// Market Structure
//------------------------------------------------------------
enum ENUM_MARKET_STRUCTURE
{
   MS_UNKNOWN = 0,
   MS_BULLISH,
   MS_BEARISH,
   MS_RANGE
};

//------------------------------------------------------------
// Signal Type
//------------------------------------------------------------
enum ENUM_SIGNAL_TYPE
{
   SIGNAL_NONE = 0,
   SIGNAL_BOS,
   SIGNAL_CHOCH,
   SIGNAL_FVG,
   SIGNAL_ORDERBLOCK,
   SIGNAL_SWEEP
};

//------------------------------------------------------------
// Trading Session
//------------------------------------------------------------
enum ENUM_SESSION_TYPE
{
   SESSION_NONE = 0,
   SESSION_ASIA,
   SESSION_LONDON,
   SESSION_NEWYORK
};

//------------------------------------------------------------
// Score Result
//------------------------------------------------------------
struct TradeScore
{
   double TrendScore;
   double StructureScore;
   double SweepScore;
   double FVGScore;
   double OrderBlockScore;
   double SessionScore;
   double SpreadScore;

   double TotalScore;
};

//------------------------------------------------------------
// Symbol Information
//------------------------------------------------------------
struct SymbolData
{
   string Name;

   int Digits;

   double Point;

   double TickSize;

   double TickValue;

   double Spread;

   double MinLot;

   double MaxLot;

   double LotStep;

   bool Tradable;
};

//------------------------------------------------------------
// Trade Signal
//------------------------------------------------------------
struct TradeSignal
{
   bool Valid;

   ENUM_TRADE_DIRECTION Direction;

   ENUM_SIGNAL_TYPE Signal;

   ENUM_MARKET_STRUCTURE Structure;

   TradeScore Score;

   double Entry;

   double StopLoss;

   double TakeProfit;
};

//------------------------------------------------------------
// Broker Information
//------------------------------------------------------------
struct BrokerInfo
{
   string BrokerName;

   int Leverage;

   bool HedgeMode;

   bool TradeAllowed;
};

#endif
