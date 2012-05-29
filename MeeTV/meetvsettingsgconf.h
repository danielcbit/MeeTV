/*
 *  Copyright (C) 2012 Robert Meijers
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef MEETVSETTINGSGCONF_H
#define MEETVSETTINGSGCONF_H

#include <gconfitem.h>
#include <QObject>
#include <QString>

#include "meetvsettings.h"

class MeeTvSettingsGConf : public MeeTvSettings
{
    Q_OBJECT
public:
    explicit MeeTvSettingsGConf(QObject *parent = 0);

    QString hostname();
    QString password();
    quint16 port();
    QString username();

    bool hasHostname();
    bool hasPassword();
    bool hasPort();
    bool hasUsername();

    void open();

private:
    GConfItem m_hostName;
    GConfItem m_password;
    GConfItem m_port;
    GConfItem m_username;
};

#endif // MEETVSETTINGSGCONF_H
