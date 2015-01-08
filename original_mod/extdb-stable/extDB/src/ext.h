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

#include <boost/asio.hpp>
#include <boost/thread/thread.hpp>

#include <Poco/Data/SessionPool.h>

#include <unordered_map>

#include "uniqueid.h"

#include "protocols/abstract_ext.h"
#include "protocols/abstract_protocol.h"


class DBPool : public Poco::Data::SessionPool
{
	public:

		DBPool(const std::string& sessionKey, const std::string& connectionString, int minSessions, int maxSessions, int idleTime): Poco::Data::SessionPool(sessionKey, connectionString, minSessions, maxSessions, idleTime)
		{
		}
		virtual ~DBPool()
		{
		}
	
	protected:
		void customizeSession (Poco::Data::Session& session);
};

class Ext: public AbstractExt
{
	public:

		Ext(std::string path);
		~Ext();

		void callExtenion(char *output, const int &output_size, const char *function);
		std::string getVersion() const;
		std::string getExtensionPath();
		std::string getLogPath();

		Poco::AutoPtr<Poco::Util::IniFileConfiguration> pConf;

		Poco::Data::Session getDBSession_mutexlock();
		Poco::Data::Session getDBSession_mutexlock(Poco::Data::SessionPool::SessionDataPtr &session_data_ptr);

		void saveResult_mutexlock(const std::string &result, const int &unique_id);
		void stop();

		std::string getAPIKey();
		std::string getDBType();

		int getUniqueID_mutexlock();
		void freeUniqueID_mutexlock(const int &unique_id);

		boost::mutex mutex_poco_cached_preparedStatements;  // Using Same Lock for Wait / Results / Plugins

	private:
		bool extDB_lock;

		int max_threads;

		std::string extDB_path;
		std::string extDB_log_path;
		std::string steam_web_api_key;

		struct DBConnectionInfo {
			std::string db_type;
			std::string connection_str;
			int min_sessions;
			int max_sessions;
			int idle_time;
		};

		DBConnectionInfo db_conn_info;

		// ASIO Thread Queue
		std::shared_ptr<boost::asio::io_service::work> io_work_ptr;
		boost::asio::io_service io_service;
		boost::mutex mutex_io_service;

		boost::thread_group threads;

		// Database Session Pool
		std::shared_ptr<DBPool> db_pool;
		boost::mutex mutex_db_pool;

		void connectDatabase(char *output, const int &output_size, const std::string &conf_option);

		void getSinglePartResult_mutexlock(const int &unique_id, char *output, const int &output_size);
		void getMultiPartResult_mutexlock(const int &unique_id, char *output, const int &output_size);
		void sendResult_mutexlock(const std::string &result, char *output, const int &output_size);

		// std::unordered_map + mutex -- for Plugin Loaded
		std::unordered_map< std::string, std::shared_ptr<AbstractProtocol> > unordered_map_protocol;
		boost::mutex mutex_unordered_map_protocol;

		// std::unordered_map + mutex -- for Stored Results to long for outputsize
		std::unordered_map<int, bool> unordered_map_wait;
		std::unordered_map<int, std::string> unordered_map_results;
		boost::mutex mutex_unordered_map_results;  // Using Same Lock for Wait / Results / Plugins


		// Unique ID for key for ^^
		std::shared_ptr<IdManager> mgr;
		boost::mutex mutex_unique_id;

		// RCon
		std::shared_ptr<Rcon> serverRcon;

		// Protocols
		void addProtocol(char *output, const int &output_size, const std::string &protocol, const std::string &protocol_name, const std::string &init_data);

		void syncCallProtocol(char *output, const int &output_size, const std::string &protocol, const std::string &data);
		void onewayCallProtocol(const std::string protocol, const std::string data);
		void asyncCallProtocol(const std::string protocol, const std::string data, const int unique_id);
};