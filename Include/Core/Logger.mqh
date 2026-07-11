//+------------------------------------------------------------------+
//| Phoenix AI PRO MT5                                               |
//| Logger Class                                                     |
//+------------------------------------------------------------------+
#ifndef __LOGGER_MQH__
#define __LOGGER_MQH__

class CLogger
{
private:

   string m_file;
   bool   m_enabled;

public:

   void Init(string filename,bool enable=true)
   {
      m_file=filename;
      m_enabled=enable;
   }

   void Write(string text)
   {
      if(!m_enabled)
         return;

      int handle=FileOpen(
                  m_file,
                  FILE_TXT|
                  FILE_WRITE|
                  FILE_READ|
                  FILE_SHARE_WRITE|
                  FILE_ANSI);

      if(handle==INVALID_HANDLE)
         return;

      FileSeek(handle,0,SEEK_END);

      string line=
         TimeToString(TimeCurrent(),
         TIME_DATE|TIME_SECONDS)
         +" | "+
         text;

      FileWrite(handle,line);

      FileClose(handle);
   }

   void Info(string text)
   {
      Write("[INFO] "+text);
   }

   void Warning(string text)
   {
      Write("[WARNING] "+text);
   }

   void Error(string text)
   {
      Write("[ERROR] "+text);
   }

};

#endif
