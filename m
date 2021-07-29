Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A63DA085
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 11:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb5Kb0Ml5z3cH0
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 19:47:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=juXrMZ91;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=juXrMZ91; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb5KF4sSSz30F0
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 19:46:56 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id b21so6711842ljo.13
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=INJYNbh3Xhxths8iOCANYsydMe4pHMLqBUwkGP+JNuw=;
 b=juXrMZ915zjpbR28wdv9CBjWgz3Muy5JQs0VY/pxXU2ID/MFhRtYi6fFmlWqvvJLze
 tGVB3mhHgQc1lJuCiqHoAzc6GNmckxzBqfcaF1jZL8Cu+1cqeD3Dj20+ljwFPeBCYR1M
 iaH+hmBoxhSr9932nLOYLH/rBm+UrQH9DXyC6NJWLbvLBalsHPz2XsWq3hxCgxNhsP3/
 QER2/EBudD4CW62kwE0VnpkW2h59YO0xpR358LF0zJQPO6dVEdgKBt1Q4KgH9L1jTbBu
 zyLiLQzQGY9RYsa4GNSFzGIZpOwES0aXu0vEjummjjYErkKTfrA8x1Fjm8o/NG/4Iw/i
 mV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=INJYNbh3Xhxths8iOCANYsydMe4pHMLqBUwkGP+JNuw=;
 b=cIsxBzK+2wMFcKV3XXtNUawEHrAQ8EE8/miscywblgwn8zECEPUcYBc+NtD1yM9cNJ
 ELCnoPrmv1oFCgCC4L3ipQzCAFICQF1xc/tIshY+qucBsafy4QfORMK57INqyB0Z/jFr
 DuR1tPYDMEx6g0rH+/JJiJcKguhoG+dS8ODULtlEMJPS95+O899DRLwlCnDBdrCuwJBV
 Ux2PXOMR6tLU5LxKxjlsOJheqFdl7mx79d/Qnb7eR+QY+OinOFHBU99jdenI5cwsyvMT
 zh4jy0d9WPFOe8BpJWPLjRAWS00kCLtFBVhaEqOTKMFSVUukED1v+lcb4/E60PCsTris
 kJZg==
X-Gm-Message-State: AOAM5334pi8JQJRAPpv3aR/ReOdOjnonIZiZw6dXN6RIIt3r7zG47DTc
 6M30NTFOgqUuacfXDkpk8wz0b3LbHzQ=
X-Google-Smtp-Source: ABdhPJyEiH+xdxECLODfdmHssjEV2NkX+zKeF/OVJOhKCxAt37JdOZWqbMlDLaj+6yOKPrzHWBBxtQ==
X-Received: by 2002:a05:651c:904:: with SMTP id
 e4mr2316290ljq.32.1627552008429; 
 Thu, 29 Jul 2021 02:46:48 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id j26sm255275lfh.57.2021.07.29.02.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 02:46:47 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 16T9kg8X013263; Thu, 29 Jul 2021 12:46:43 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 16T9ke6k013262;
 Thu, 29 Jul 2021 12:46:40 +0300
Date: Thu, 29 Jul 2021 12:46:40 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org, Ed Tanous <ed@tanous.net>,
 Jason Bills <jason.m.bills@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Zhikui Ren <zhikui.ren@intel.com>
Subject: Redfish requests for dbus-sensors data are needlessly slow - analysis
Message-ID: <20210729094640.GT875@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Timofei Nikitin <t.nikitin@gagar-in.com>,
 Andrei Tutolmin <a.tutolmin@gagar-in.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Short version:

Our operations team complains about very high (seconds) latency of
requesting sensor data used to monitor health of the servers via
Redfish. Boards are OCP Tioga Pass with AST2500 BMC. Software
involved: OpenBMC bmcweb, dbus-sensors, ObjectMapper, EntityManager.

In this mail I provide details about the testing methodology, the
complete call chain (including RPC) involved in handling Redfish
requests, and a quick-and-dirty patch that caches some D-Bus replies
in bmcweb that results in cutting down response times by more than 4
times. It also gives significantly less CPU overhead.

My impression so far is that the current way is rather wasteful and
can be considerably improved.

Our question is basically whether what we see is normal, if we should
change the way servers are monitored, if bmcweb should really be
better optimised and if yes, how exactly?


Longer version:

Our operations team is normally using Zabbix for monitoring, and they
developed a set of scripts and templates to handle OpenBMC machines:
https://github.com/Gagar-in/redfish-bmc-lld .

For easier reproduction and analysis I instead use plain curl command
to request data for a single specific sensor. The following text
assumes we're interested to get output current of the first DRAM VR
(handled by pxe1610 kernel driver and PSUSensor OpenBMC daemon which
caches the values periodically read from hwmon nodes).

To make sure I'm measuring just the time it takes to answer the GET
request itself (and not counting any TLS session establishment
overhead as curl is reusing an open connection) I'm running this
command:

$ curl -w '\n\nTime spent: %{time_total}\n\n\n' -k $(for i in $(seq 5); do echo https://root:0penBmc@$BMCIP/redfish/v1/Chassis/TiogaPass_Baseboard/Sensors/CPU0_VDDQ_A_IOUT; done)

I typically get over 2 seconds for each request made. With the patch
at the end of the mail the same test consistently shows times below
half a second.

The major part of the delay comes from numerous (and probably
suboptimal) D-Bus calls, plus the overhead to process the responses.

Here follows D-Bus profiling data typical for each Redfish sensors
request made. "mc" is the method call performed by "bmcweb", "mr" is
the response. I've added the second column (by processing dbus-monitor
--profile output through awk -vOFS='\t' '{ d=$2-prev; prev=$2;
$2=d"\t"$2; print $0 }' ) to show the difference between the current
timestamp and the previous one so it's visible how much time it takes
for the daemons to answer each request and how much time bmcweb needs
to process the result.

mc	---------	1625473150.291539	1665	:1.79	xyz.openbmc_project.User.Manager	/xyz/openbmc_project/user	xyz.openbmc_project.User.Manager	GetUserInfo
mr	0.0463991	1625473150.337938	469	:1.36	:1.79	1665
mc	0.00556493	1625473150.343503	1666	:1.79	xyz.openbmc_project.ObjectMapper	/xyz/openbmc_project/object_mapper	xyz.openbmc_project.ObjectMapper	GetSubTree
err	0.0143089	1625473150.357812	470	:1.36	:1.79	1665
mr	0.0478861	1625473150.405698	5891	:1.49	:1.79	1666
mc	0.0611379	1625473150.466836	1667	:1.79	xyz.openbmc_project.ObjectMapper	/xyz/openbmc_project/object_mapper	xyz.openbmc_project.ObjectMapper	GetSubTree
mr	0.0716419	1625473150.538478	5893	:1.49	:1.79	1667
mc	0.0977321	1625473150.636210	1668	:1.79	xyz.openbmc_project.ObjectMapper	/xyz/openbmc_project/object_mapper	xyz.openbmc_project.ObjectMapper	GetSubTree
mr	0.0268672	1625473150.663077	5895	:1.49	:1.79	1668
mc	0.0232749	1625473150.686352	1669	:1.79	xyz.openbmc_project.ObjectMapper	/	org.freedesktop.DBus.ObjectManager	GetManagedObjects
mr	0.156963	1625473150.843315	5896	:1.49	:1.79	1669
mc	0.428404	1625473151.271719	1670	:1.79	xyz.openbmc_project.ObjectMapper	/xyz/openbmc_project/object_mapper	xyz.openbmc_project.ObjectMapper	GetSubTree
mr	0.030153	1625473151.301872	5898	:1.49	:1.79	1670
mc	0.123439	1625473151.425311	1671	:1.79	xyz.openbmc_project.EntityManager	/	org.freedesktop.DBus.ObjectManager	GetManagedObjects
mr	0.284928	1625473151.710239	1408	:1.63	:1.79	1671
mc	0.108877	1625473151.819116	1672	:1.79	xyz.openbmc_project.ObjectMapper	/xyz/openbmc_project/object_mapper	xyz.openbmc_project.ObjectMapper	GetSubTree
mr	0.0525708	1625473151.871687	5900	:1.49	:1.79	1672
mc	0.0175102	1625473151.889197	1673	:1.79	xyz.openbmc_project.PSUSensor	/	org.freedesktop.DBus.ObjectManager	GetManagedObjects
mr	0.119283	1625473152.008480	124202	:1.104	:1.79	1673


To provide more insight into what and why bmcweb is doing I made the
following call chain description by carefully reading
redfish-core/lib/sensors.hpp source code:

0. requestRoutesSensor() is called to process the GET request.

For further processing a D-Bus call is made. For experimenting on a
running system I'm providing copy-pasteable "busctl" invocations for
all the calls involved.

# busctl --json=pretty call xyz.openbmc_project.ObjectMapper /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias /xyz/openbmc_project/sensors 2 1 xyz.openbmc_project.Sensor.Value

The returned array is searched for the requested sensor name, a
flat_set is created with a single string containing D-Bus sensor path
(in this example
"/xyz/openbmc_project/sensors/current/CPU0_VDDQ_A_IOUT"). The flat_set
is passed to processSensorList().


1. processSensorList() calls getConnections() which calls
getObjectsWithConnection() (the latter can also be called from
setSensorsOverride()).

It does this call (exactly the same as previous!):

# busctl --json=pretty call xyz.openbmc_project.ObjectMapper /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias /xyz/openbmc_project/sensors 2 1 xyz.openbmc_project.Sensor.Value

For each returned subtree it determines if it's one of the sensors we
requested. In this case the bus names are added to a "connections"
flat_set (in this example it's just "xyz.openbmc_project.PSUSensor")
and a set of tuples "objectsWithConnection" is created (in this
example it's
("/xyz/openbmc_project/sensors/current/CPU0_VDDQ_A_IOUT","xyz.openbmc_project.PSUSensor")
. "connections" is passed to the callback provided by
processSensorList(), "objectsWithConnection" is ignored.


2. getConnectionCb() defined in processSensorList() calls getObjectManagerPaths().

The following call is made:

# busctl --json=pretty call xyz.openbmc_project.ObjectMapper /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias / 0 1 org.freedesktop.DBus.ObjectManager

The result is converted to a "objectMgrPaths" associative array, with
connection used as a key and path as a value (in this example the
essential element would be
objectMgrPaths["xyz.openbmc_project.PSUSensor"]="/" and
objectMgrPaths["xyz.openbmc_project.ObjectMapper"]="/"). This map is
passed to getObjectManagerPathsCb() defined inside processSensorList()


3. getInventoryItems() calls getInventoryItemAssociations() which uses
the objectMgrPaths map to look for the path for
"xyz.openbmc_project.ObjectMapper". If it's not found, "/" is assumed.

The D-Bus call is made:

# busctl --json=pretty call xyz.openbmc_project.ObjectMapper / org.freedesktop.DBus.ObjectManager GetManagedObjects

For each sensor path we're interested in we're trying to find a
corresponding inventory object (in this case
"/xyz/openbmc_project/sensors/current/CPU0_VDDQ_A_IOUT/inventory") to
get the list of endpoints for its associations. The first endopoint
path is used in a call to addInventoryItem() (in this example it's
"/xyz/openbmc_project/inventory/system/board/TiogaPass_Baseboard" for
"/xyz/openbmc_project/sensors/current/CPU0_VDDQ_A_IOUT").

Then we again walk the list returned from D-Bus for each entry
checking if it represents a LED of any item stored in the current
inventory list, and if found the first associated endpoint path is
stored for this inventory item. In this example no associated LEDs
exist.

The resulting inventory items set is passed to the callback
getInventoryItemAssociationsCb() defined in getInventoryItems().


4. getInventoryItemsConnections() is called which makes the following
D-Bus call:

# busctl --json=pretty call xyz.openbmc_project.ObjectMapper /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias /xyz/openbmc_project/inventory 0 4 xyz.openbmc_project.Inventory.Item xyz.openbmc_project.Inventory.Item.PowerSupply xyz.openbmc_project.Inventory.Decorator.Asset xyz.openbmc_project.State.Decorator.OperationalStatus

For each item returned we see if it's present in our inventory and if
yes, add all connections for it (in this example we only add
"xyz.openbmc_project.EntityManager" for
"/xyz/openbmc_project/inventory/system/board/TiogaPass_Baseboard"). Then
it provides all the gathered inventory connections to the
"getInventoryItemsConnectionsCb" callback provided by
getInventoryItems().


5. getInventoryItemsData() gets called which for every stored
inventory connection tries to find a corresponding path from the
object manager data returned earlier (uses "/" if not found) and then
performs a D-Bus call (in this example just one):

# busctl --json=pretty call xyz.openbmc_project.EntityManager / org.freedesktop.DBus.ObjectManager GetManagedObjects

For each inventory path it saves the result with
storeInventoryItemData() and then calls getInventoryItemsData()
recursively for all the other connections (in this example there was
just one, "xyz.openbmc_project.EntityManager"). After processing them
all, calls getInventoryItemsDataCb() defined in getInventoryItems().


6. getInventoryLeds() is called which does this D-Bus call:

# busctl --json=pretty call xyz.openbmc_project.ObjectMapper /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias /xyz/openbmc_project 0 1 xyz.openbmc_project.Led.Physical

The result is parsed to see if there's any LED path corresponding to
an inventory item, and stores everything found. The collected data is
passed to getInventoryLedData() which performs similarly to
getInventoryItemsData(). In the example no suitable LEDs are found so
it proceeds to calling getInventoryLedsCb() defined in
getInventoryItems().


7. getPowerSupplyAttributes() is called but in this example (since
it's requesting a sensor, not power node) it does nothing but proceeds
to calling getInventoryItemsCb() defined in processSensorList().


8. getSensorData() is called which for every sensor connection finds
objectMgrPath (if any, else "/" is used) and calls D-Bus (in this
example just once since we have a single sensor connection):

# busctl --json=pretty call xyz.openbmc_project.PSUSensor / org.freedesktop.DBus.ObjectManager GetManagedObjects

This provides all the current data (including all the associations,
OperationalStatus and Availability!) for all the sensors handled by
this bus (so much more than we actually need in this example).

It finally proceeds to building the JSON response (based on the data
returned by the call and in some cases the inventory data obtained
earlier) and exits; the response (values for the single sensor
requested) is sent back to the client.


Here follows my naive exploratory patch. It works for the sensors
we're interested in (unless they appear after the first Redfish
request made to bmcweb as the cache for the expensive D-Bus calls is
never invalidated). It doesn't handle complex inventory associations.

I would be willing to work on doing the right thing but for that I'm
lacking the understanding of the complete picture involved in handling
all types of sensors and interfaces, so I'm kindly asking for your
help with it.

diff --git a/redfish-core/lib/sensors.hpp b/redfish-core/lib/sensors.hpp
index ac987359ce5b..266dd25b27e0 100644
--- a/redfish-core/lib/sensors.hpp
+++ b/redfish-core/lib/sensors.hpp
@@ -51,6 +51,9 @@ static constexpr std::string_view sensors = "Sensors";
 static constexpr std::string_view thermal = "Thermal";
 } // namespace node
 
+static boost::container::flat_map<std::string, std::string> objectMgrPathsCache;
+static GetSubTreeType subTreeCache;
+
 namespace dbus
 {
 static const boost::container::flat_map<std::string_view,
@@ -244,6 +247,7 @@ void getObjectsWithConnection(
             return;
         }
 
+        sensors::subTreeCache = subtree;
         BMCWEB_LOG_DEBUG << "Found " << subtree.size() << " subtrees";
 
         // Make unique list of connections only for requested sensor types and
@@ -281,11 +285,19 @@ void getObjectsWithConnection(
         callback(std::move(connections), std::move(objectsWithConnection));
         BMCWEB_LOG_DEBUG << "getObjectsWithConnection resp_handler exit";
     };
-    // Make call to ObjectMapper to find all sensors objects
-    crow::connections::systemBus->async_method_call(
-        std::move(respHandler), "xyz.openbmc_project.ObjectMapper",
-        "/xyz/openbmc_project/object_mapper",
-        "xyz.openbmc_project.ObjectMapper", "GetSubTree", path, 2, interfaces);
+    if (sensors::subTreeCache.empty())
+    {
+        // Make call to ObjectMapper to find all sensors objects
+        crow::connections::systemBus->async_method_call(
+            std::move(respHandler), "xyz.openbmc_project.ObjectMapper",
+            "/xyz/openbmc_project/object_mapper",
+            "xyz.openbmc_project.ObjectMapper", "GetSubTree", path, 2,
+            interfaces);
+    }
+    else
+    {
+        respHandler(boost::system::error_code{}, sensors::subTreeCache);
+    }
     BMCWEB_LOG_DEBUG << "getObjectsWithConnection exit";
 }
 
@@ -606,15 +618,26 @@ void getObjectManagerPaths(std::shared_ptr<SensorsAsyncResp> SensorsAsyncResp,
                                  << objectPath;
             }
         }
+        sensors::objectMgrPathsCache = *objectMgrPaths;
         callback(objectMgrPaths);
         BMCWEB_LOG_DEBUG << "getObjectManagerPaths respHandler exit";
     };
 
-    // Query mapper for all DBus object paths that implement ObjectManager
-    crow::connections::systemBus->async_method_call(
-        std::move(respHandler), "xyz.openbmc_project.ObjectMapper",
-        "/xyz/openbmc_project/object_mapper",
-        "xyz.openbmc_project.ObjectMapper", "GetSubTree", "/", 0, interfaces);
+    if (sensors::objectMgrPathsCache.empty())
+    {
+        // Query mapper for all DBus object paths that implement ObjectManager
+        crow::connections::systemBus->async_method_call(
+            std::move(respHandler), "xyz.openbmc_project.ObjectMapper",
+            "/xyz/openbmc_project/object_mapper",
+            "xyz.openbmc_project.ObjectMapper", "GetSubTree", "/", 0,
+            interfaces);
+    }
+    else
+    {
+        callback(std::make_shared<
+                 boost::container::flat_map<std::string, std::string>>(
+            sensors::objectMgrPathsCache));
+    }
     BMCWEB_LOG_DEBUG << "getObjectManagerPaths exit";
 }
 
@@ -2628,9 +2669,11 @@ inline void processSensorList(
                         };
 
                     // Get inventory items associated with sensors
-                    getInventoryItems(SensorsAsyncResp, sensorNames,
-                                      objectMgrPaths,
-                                      std::move(getInventoryItemsCb));
+                    // getInventoryItems(SensorsAsyncResp, sensorNames,
+                    //                  objectMgrPaths,
+                    //                  std::move(getInventoryItemsCb));
+                    getInventoryItemsCb(
+                        std::make_shared<std::vector<InventoryItem>>());
 
                     BMCWEB_LOG_DEBUG << "getObjectManagerPathsCb exit";
                 };
@@ -3105,66 +3148,75 @@ class Sensor : public Node
         const std::array<const char*, 1> interfaces = {
             "xyz.openbmc_project.Sensor.Value"};
 
-        // Get a list of all of the sensors that implement Sensor.Value
-        // and get the path and service name associated with the sensor
-        crow::connections::systemBus->async_method_call(
-            [asyncResp, sensorName](const boost::system::error_code ec,
-                                    const GetSubTreeType& subtree) {
-                BMCWEB_LOG_DEBUG << "respHandler1 enter";
-                if (ec)
-                {
-                    messages::internalError(asyncResp->res);
-                    BMCWEB_LOG_ERROR << "Sensor getSensorPaths resp_handler: "
-                                     << "Dbus error " << ec;
-                    return;
-                }
+        auto respHandler = [asyncResp,
+                            sensorName](const boost::system::error_code ec,
+                                        const GetSubTreeType& subtree) {
+            BMCWEB_LOG_DEBUG << "respHandler1 enter";
+            if (ec)
+            {
+                messages::internalError(asyncResp->res);
+                BMCWEB_LOG_ERROR << "Sensor getSensorPaths resp_handler: "
+                                 << "Dbus error " << ec;
+                return;
+            }
 
-                GetSubTreeType::const_iterator it = std::find_if(
-                    subtree.begin(), subtree.end(),
-                    [sensorName](
-                        const std::pair<
-                            std::string,
-                            std::vector<std::pair<std::string,
-                                                  std::vector<std::string>>>>&
-                            object) {
-                        std::string_view sensor = object.first;
-                        std::size_t lastPos = sensor.rfind("/");
-                        if (lastPos == std::string::npos ||
-                            lastPos + 1 >= sensor.size())
-                        {
-                            BMCWEB_LOG_ERROR << "Invalid sensor path: "
-                                             << sensor;
-                            return false;
-                        }
-                        std::string_view name = sensor.substr(lastPos + 1);
+            sensors::subTreeCache = subtree;
 
-                        return name == sensorName;
-                    });
+            GetSubTreeType::const_iterator it = std::find_if(
+                subtree.begin(), subtree.end(),
+                [sensorName](
+                    const std::pair<
+                        std::string,
+                        std::vector<std::pair<
+                            std::string, std::vector<std::string>>>>& object) {
+                    std::string_view sensor = object.first;
+                    std::size_t lastPos = sensor.rfind("/");
+                    if (lastPos == std::string::npos ||
+                        lastPos + 1 >= sensor.size())
+                    {
+                        BMCWEB_LOG_ERROR << "Invalid sensor path: " << sensor;
+                        return false;
+                    }
+                    std::string_view name = sensor.substr(lastPos + 1);
 
-                if (it == subtree.end())
-                {
-                    BMCWEB_LOG_ERROR << "Could not find path for sensor: "
-                                     << sensorName;
-                    messages::resourceNotFound(asyncResp->res, "Sensor",
-                                               sensorName);
-                    return;
-                }
-                std::string_view sensorPath = (*it).first;
-                BMCWEB_LOG_DEBUG << "Found sensor path for sensor '"
-                                 << sensorName << "': " << sensorPath;
+                    return name == sensorName;
+                });
 
-                const std::shared_ptr<boost::container::flat_set<std::string>>
-                    sensorList = std::make_shared<
-                        boost::container::flat_set<std::string>>();
+            if (it == subtree.end())
+            {
+                BMCWEB_LOG_ERROR << "Could not find path for sensor: "
+                                 << sensorName;
+                messages::resourceNotFound(asyncResp->res, "Sensor",
+                                           sensorName);
+                return;
+            }
+            std::string_view sensorPath = (*it).first;
+            BMCWEB_LOG_DEBUG << "Found sensor path for sensor '" << sensorName
+                             << "': " << sensorPath;
 
-                sensorList->emplace(sensorPath);
-                processSensorList(asyncResp, sensorList);
-                BMCWEB_LOG_DEBUG << "respHandler1 exit";
-            },
-            "xyz.openbmc_project.ObjectMapper",
-            "/xyz/openbmc_project/object_mapper",
-            "xyz.openbmc_project.ObjectMapper", "GetSubTree",
-            "/xyz/openbmc_project/sensors", 2, interfaces);
+            const std::shared_ptr<boost::container::flat_set<std::string>>
+                sensorList =
+                    std::make_shared<boost::container::flat_set<std::string>>();
+
+            sensorList->emplace(sensorPath);
+            processSensorList(asyncResp, sensorList);
+            BMCWEB_LOG_DEBUG << "respHandler1 exit";
+        };
+
+        if (sensors::subTreeCache.empty())
+        {
+            // Get a list of all of the sensors that implement Sensor.Value
+            // and get the path and service name associated with the sensor
+            crow::connections::systemBus->async_method_call(
+                std::move(respHandler), "xyz.openbmc_project.ObjectMapper",
+                "/xyz/openbmc_project/object_mapper",
+                "xyz.openbmc_project.ObjectMapper", "GetSubTree",
+                "/xyz/openbmc_project/sensors", 2, interfaces);
+        }
+        else
+        {
+            respHandler(boost::system::error_code{}, sensors::subTreeCache);
+        }
     }
 };
 

Thank you for your attention.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
