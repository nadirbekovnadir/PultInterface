#ifndef EVENTMONITOR_H
#define EVENTMONITOR_H

#include <QLoggingCategory>
#include <QFile>
#include <QDir>
#include <QScopedPointer>
#include <QTextStream>
#include <QDateTime>
#include <QLoggingCategory>

using namespace std;

Q_DECLARE_LOGGING_CATEGORY(logDebug)
Q_DECLARE_LOGGING_CATEGORY(logInfo)
Q_DECLARE_LOGGING_CATEGORY(logWarning)
Q_DECLARE_LOGGING_CATEGORY(logCritical)
Q_DECLARE_LOGGING_CATEGORY(logFatal)

class EventMonitor
{
public:
    EventMonitor();

public:
    QFile logFile;
    const char *function;
    const char *category;
    const string description;

private:
    void fetchFile();
    void cookMessage();
    void writeToFile();

    //remove when integrating
    void trashYeeter();
};

#endif // EVENTMONITOR_H
