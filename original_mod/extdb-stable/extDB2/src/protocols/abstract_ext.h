/*
Copyright (C) 2014 Declan Ireland <http://github.com/torndeco/extDB>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/


#pragma once

#include <Poco/AutoPtr.h>
#include <Poco/Data/Session.h>
#include <Poco/Data/SessionPool.h>
#include <Poco/Util/IniFileConfiguration.h>

#include <boost/thread/thread.hpp>

#include "../rcon.h"
#include "../spdlog/spdlog.h"


class AbstractExt
{
	public:
		virtual Poco::Data::Session getDBSession_mutexlock()=0;
		virtual Poco::Data::Session getDBSession_mutexlock(Poco::Data::SessionPool::SessionDataPtr &session_data_ptr)=0;

		virtual std::string getAPIKey()=0;
		
		Poco::AutoPtr<Poco::Util::IniFileConfiguration> pConf;

		std::shared_ptr<spdlog::logger> console;
		std::shared_ptr<spdlog::logger> logger;
		
		virtual void freeUniqueID_mutexlock(const int &unique_id)=0;
		virtual int getUniqueID_mutexlock()=0;
		
		virtual std::string getDBType()=0;
		virtual std::string getExtensionPath()=0;
		virtual std::string getLogPath()=0;
		
		boost::mutex mutex_poco_cached_preparedStatements;  // Using Same Lock for Wait / Results / Plugins
};