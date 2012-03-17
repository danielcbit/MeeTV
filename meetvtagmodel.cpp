#include "meetvtagmodel.h"

MeeTvTagModel::MeeTvTagModel(QHtspTagList *tags) :
    QHtspTagModel(tags)
{
}

MeeTvTag *MeeTvTagModel::getTagById(qint64 id)
{
    return new MeeTvTag(*QHtspTagModel::getTagById(id));
}