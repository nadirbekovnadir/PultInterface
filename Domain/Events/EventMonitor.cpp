#include "EventMonitor.h"
#include <QFile>
#include <QDir>
#include <QScopedPointer>
#include <QTextStream>
#include <QDateTime>
#include <QLoggingCategory>

Q_LOGGING_CATEGORY(logDebug,    "Debug")
Q_LOGGING_CATEGORY(logInfo,     "Info")
Q_LOGGING_CATEGORY(logWarning,  "Warning")
Q_LOGGING_CATEGORY(logCritical, "Critical")
Q_LOGGING_CATEGORY(logFatal,    "Fatal")

EventMonitor::EventMonitor()
{
    QFile logFile("../pultLog.txt");

    cookMessage();
    writeToFile();
}

void EventMonitor::fetchFile()
{
}

void EventMonitor::cookMessage()
{

}

void EventMonitor::writeToFile()
{

}
