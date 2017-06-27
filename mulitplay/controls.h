#ifndef CONTROL_H
#define CONTROL_H

#include <QObject>

class Controls : public QObject
{
    Q_OBJECT
public:
    explicit Controls(QObject *parent = nullptr);
    Q_PROPERTY(double minX READ minX WRITE setMinX NOTIFY minXChanged)
    double minX(){return m_minX;}
    void setMinX(double x){
        if(m_minX!=x){
            m_minX=x;
            emit minXChanged();
        }
    }

signals:
    void minXChanged();

private:
    double m_minX;
};

#endif // CONTROL_H
