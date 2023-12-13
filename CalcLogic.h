#ifndef CALCLOGIC_H
#define CALCLOGIC_H

#include <QString>
#include <QObject>

class CalcLogic : public QObject
{
    Q_OBJECT

private:

    static const unsigned char NONE_OPERATION_TYPE = 0;
    static const unsigned char SUM_OPERATION_TYPE = 1;
    static const unsigned char SUB_OPERATION_TYPE = 2;
    static const unsigned char DIV_OPERATION_TYPE = 3;
    static const unsigned char MUL_OPERATION_TYPE = 4;

    QString mStoredValue;
    QString mLeftArg;
    QString mRightArg;
    QString mOutput;

    unsigned char mOperationType;

    void onUpdateOutput( ) noexcept;
    void onCalculationDone( ) noexcept;

public:

    explicit CalcLogic( QObject *const qParent = nullptr ) noexcept;

    virtual ~CalcLogic( ) noexcept;

    Q_INVOKABLE QString setOperationType( const QString pType ) noexcept;
    Q_INVOKABLE QString onDot( ) noexcept;
    Q_INVOKABLE QString onNumberInput( const QString pNumber ) noexcept;
    Q_INVOKABLE QString onRemoveLastNumber( ) noexcept;
    Q_INVOKABLE QString doMath( ) noexcept;
    Q_INVOKABLE void resetLogic( ) noexcept;
};

#endif
