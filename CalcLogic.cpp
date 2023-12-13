#ifndef CALCLOGIC_H
#include "CalcLogic.h"
#endif

#include <QtMath>

#ifdef QT_DEBUG // DEBUG
#include <exception>
#endif // DEBUG

CalcLogic::CalcLogic( QObject *const qParent ) noexcept
    : QObject ( qParent ),
    mStoredValue( "" ),
    mLeftArg( "" ),
    mRightArg( "" ),
    mOutput( "" ),
    mOperationType( NONE_OPERATION_TYPE )
{
}

CalcLogic::~CalcLogic( ) noexcept = default;

QString CalcLogic::setOperationType( const QString pType ) noexcept
{
#ifdef QT_DEBUG // DEBUG
    qDebug( "setOperationType" );
#endif // DEBUG
    if ( mLeftArg.size( ) < 1 && mRightArg.size( ) < 1 )
        return( mOutput );
    if ( pType == "-" )
        mOperationType = SUB_OPERATION_TYPE;
    else if ( pType == "+" )
        mOperationType = SUM_OPERATION_TYPE;
    else if ( pType == "/" )
        mOperationType = DIV_OPERATION_TYPE;
    else if ( pType == "*" )
        mOperationType = MUL_OPERATION_TYPE;
    mLeftArg = mRightArg;
    mRightArg = "";
    onUpdateOutput( );
    return( mOutput );
}

void CalcLogic::onUpdateOutput( ) noexcept
{
    mOutput = "";
    if ( mLeftArg.size( ) > 0 )
        mOutput += mLeftArg;
    if ( mOperationType != NONE_OPERATION_TYPE )
    {
        switch( mOperationType )
        {
            case DIV_OPERATION_TYPE:
            {
                mOutput += " / ";
                break;
            }
            case MUL_OPERATION_TYPE:
            {
                mOutput += " * ";
                break;
            }
            case SUB_OPERATION_TYPE:
            {
                mOutput += " - ";
                break;
            }
            default:
            case SUM_OPERATION_TYPE:
            {
                mOutput += " + ";
                break;
            }
        }
    }
    if ( mRightArg.size( ) > 0 )
        mOutput += mRightArg;
    if ( mOutput.size( ) < 1 )
        mOutput = "0";
}

QString CalcLogic::onDot( ) noexcept
{
    if ( mRightArg.size( ) < 1 )
    {
        mRightArg = "0.";
        onUpdateOutput( );
        return( mOutput );
    }
    if ( mRightArg.contains( '.' ) )
        return( mOutput );
    mRightArg += ".";
    onUpdateOutput( );
    return( mOutput );
}

void CalcLogic::onCalculationDone( ) noexcept
{
    mLeftArg.clear( );
    mRightArg.clear( );
    mOperationType = NONE_OPERATION_TYPE;
}

QString CalcLogic::onNumberInput( const QString pVal ) noexcept
{
#ifdef QT_DEBUG // DEBUG
    qDebug( "onNumberInput" );
#endif // DEBUG
    mRightArg += pVal;
    onUpdateOutput( );
    return( mOutput );
}

QString CalcLogic::onRemoveLastNumber( ) noexcept
{
    if ( mRightArg.size( ) == 0 )
        return( mOutput );

#ifdef QT_DEBUG // DEBUG
    qDebug( "onRemoveLastNumber" );
#endif // DEBUG
    mRightArg.chop( 1 );
    mOutput.chop( 1 );
    return( mOutput );
}

QString CalcLogic::doMath( ) noexcept
{
    if ( mOperationType == NONE_OPERATION_TYPE || mLeftArg.size( ) < 1 )
        return( mOutput );
    const double arg1_d( mLeftArg.toDouble(  ) );
    const double arg2_d( mRightArg.toDouble( ) );
    switch( mOperationType )
    {
        case SUB_OPERATION_TYPE:
        {
            const auto result_( arg1_d - arg2_d );
            mOutput = QString::number( result_ );
            onCalculationDone( );
            break;
        }
        case MUL_OPERATION_TYPE:
        {
            const auto result_( arg1_d * arg2_d );
            mOutput = QString::number( result_ );
            onCalculationDone( );
            break;
        }
        case DIV_OPERATION_TYPE:
        {
            const auto result_( arg1_d / arg2_d );
            mOutput = QString::number( result_ );
            onCalculationDone( );
            break;
        }
        case SUM_OPERATION_TYPE:
        default:
        {
            const auto result_( arg1_d + arg2_d );
            mOutput = QString::number( result_ );
            onCalculationDone( );
            break;
        }
    }
    return( mOutput );
}

void CalcLogic::resetLogic( ) noexcept
{
#ifdef QT_DEBUG // DEBUG
    qDebug( "resetLogic" );
#endif // DEBUG
    mLeftArg = "";
    mRightArg = "";
    mOutput = "0";
    mOperationType = NONE_OPERATION_TYPE;
}
