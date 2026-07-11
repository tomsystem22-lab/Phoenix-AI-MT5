//+------------------------------------------------------------------+
//| Phoenix AI PRO MT5                                               |
//| RiskManager.mqh                                                  |
//+------------------------------------------------------------------+
#ifndef __PHOENIX_RISKMANAGER_MQH__
#define __PHOENIX_RISKMANAGER_MQH__

class CRiskManager
{
private:

   double m_riskPercent;
   double m_maxDailyLoss;
   double m_maxDrawdown;
   int    m_maxTrades;
   int    m_todayTrades;

public:

   //----------------------------------------------------
   // Constructor
   //----------------------------------------------------

   CRiskManager()
   {
      m_riskPercent = 1.0;
      m_maxDailyLoss = 5.0;
      m_maxDrawdown = 15.0;
      m_maxTrades = 6;
      m_todayTrades = 0;
   }

   //----------------------------------------------------

   void SetRisk(double risk)
   {
      m_riskPercent = risk;
   }

   //----------------------------------------------------

   double GetRisk()
   {
      return m_riskPercent;
   }

   //----------------------------------------------------

   void SetMaxTrades(int value)
   {
      m_maxTrades=value;
   }

   //----------------------------------------------------

   int GetMaxTrades()
   {
      return m_maxTrades;
   }

   //----------------------------------------------------

   void IncreaseTradeCount()
   {
      m_todayTrades++;
   }

   //----------------------------------------------------

   void ResetTradeCount()
   {
      m_todayTrades=0;
   }

   //----------------------------------------------------

   int TodayTrades()
   {
      return m_todayTrades;
   }

   //----------------------------------------------------

   bool CanOpenTrade()
   {
      if(m_todayTrades>=m_maxTrades)
         return false;

      return true;
   }

   //----------------------------------------------------
   // Calculate Lot Size
   //----------------------------------------------------

   double CalculateLot(
      string symbol,
      double stoploss_points)
   {

      if(stoploss_points<=0)
         return 0.0;

      double balance=
         AccountInfoDouble(ACCOUNT_BALANCE);

      double riskMoney=
         balance*
         m_riskPercent/
         100.0;

      double tickValue=
         SymbolInfoDouble(
            symbol,
            SYMBOL_TRADE_TICK_VALUE);

      double tickSize=
         SymbolInfoDouble(
            symbol,
            SYMBOL_TRADE_TICK_SIZE);

      if(tickValue<=0 || tickSize<=0)
         return 0.0;

      double valuePerPoint=
         tickValue/tickSize;

      double lot=
         riskMoney/
         (stoploss_points*valuePerPoint);

      double step=
         SymbolInfoDouble(
            symbol,
            SYMBOL_VOLUME_STEP);

      double minLot=
         SymbolInfoDouble(
            symbol,
            SYMBOL_VOLUME_MIN);

      double maxLot=
         SymbolInfoDouble(
            symbol,
            SYMBOL_VOLUME_MAX);

      lot=
         MathFloor(lot/step)*step;

      if(lot<minLot)
         lot=minLot;

      if(lot>maxLot)
         lot=maxLot;

      return NormalizeDouble(lot,2);
   }

};

#endif
