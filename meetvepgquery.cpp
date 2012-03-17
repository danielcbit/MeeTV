#include "meetvepgquery.h"

#include "meetvhtsp.h"

MeeTvEpgQuery::MeeTvEpgQuery(QObject *parent) :
    QHtspEpgQuery(MeeTvHtsp::instance(), parent), m_channel(0), m_eventModel(0), m_tag(0)
{
}

MeeTvEpgQuery::MeeTvEpgQuery(const QHtspEpgQuery& epgQuery, QObject *parent) :
    QHtspEpgQuery(epgQuery, parent), m_channel(0), m_eventModel(0), m_tag(0)
{
}

MeeTvChannel *MeeTvEpgQuery::channel()
{
    QHtspChannel *channel = QHtspEpgQuery::channel();
    if(!m_channel || m_channel->id() != channel->id())
    {
        if(!channel)
            setChannel(0);
        else
            setChannel(new MeeTvChannel(*channel, this));
    }

    return m_channel;
}

MeeTvEventModel *MeeTvEpgQuery::eventsModel()
{
    if(!m_eventModel)
        m_eventModel = new MeeTvEventModel(events());

    return m_eventModel;
}

MeeTvTag *MeeTvEpgQuery::tag()
{
    QHtspTag *tag = QHtspEpgQuery::tag();
    if(!m_tag || m_tag->id() != tag->id())
    {
        if(!tag)
            setTag(0);
        else
            setTag(new MeeTvTag(*tag, this));
    }

    return m_tag;
}

void MeeTvEpgQuery::setChannel(MeeTvChannel *channel)
{
    if(m_channel)
        delete m_channel;

    m_channel = channel;
    QHtspEpgQuery::setChannel(channel);
}

void MeeTvEpgQuery::setTag(MeeTvTag *tag)
{
    if(m_tag)
        delete m_tag;

    m_tag = tag;
    QHtspEpgQuery::setTag(tag);
}
