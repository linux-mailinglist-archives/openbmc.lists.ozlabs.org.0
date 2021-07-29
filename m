Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D86943DA6E8
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 16:54:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbD7q5QPDz3cJ0
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 00:54:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=fd++kNUt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fd++kNUt; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbD7W6B9Sz2xfF
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jul 2021 00:53:57 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id e5so7916111ljp.6
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Me2zFG1r85NwZtttFPQI9lf9LrQFQOMIZUPvoHOjzdI=;
 b=fd++kNUt+8Po9BWIrV8bZ6k6RNUolAi4Gkel1kJqqpI0AikmqOKin67pL+kLd5HULm
 JDf9eua1F4NekNr1lwzIrwpfiS3ZRMDo2ScEhyuIlB2fPMmab7LQrTuEHIAXOT2kdEHF
 bYJ9reyQqmo5an8OHr3WqUgtkw56VgJwNu4WlTWZ/FQ6jBD5FAGAJap12EBLqgUcNN44
 HgET7jhh2d6emEzM2gnJOBdwR6EQYiqIxoMX28vsq0vzAUYJZ3NgyBia75kgLMlwJ9Z5
 Sv4cS3GIoQORm/eOUKdvL2WBMRuUhTxCMIcTMdrBbcdDg4ocd79RWZq0NaGLkYcXWzin
 JyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Me2zFG1r85NwZtttFPQI9lf9LrQFQOMIZUPvoHOjzdI=;
 b=KPZqjfj90WsMX5h/GbdjSsuB0CLQTpp6Dh9lXfY0gFyiY3YRhk4F+jK+LNFCiMwL/d
 Ba2x7s3TUPdRZkdKl8PArQFLFhhabJMh4p1S5rZV/FE7CaGzQLbljWNf6dGlr2rkDtTA
 tZNn9ybkLIDNmSl5aM9ZmrpU/vUUFeMsxuPEdhXYJRHvAv8TEsEE4kjZkPmbeDJ+BsjB
 rgQNz1hcnZGIcSeQYdMtYApFzLjGH7Z4TZHiKfs5KwjmaPYePoLAiBFw6CcmUvOa30yo
 XqR0VxOGfCPlXOb87LmtiK9nobKZH3yCa7RciKk/rgzXBzkHG5VYonpNVyk9xpKlYMdq
 NC4Q==
X-Gm-Message-State: AOAM532A9/KOq+v5lRxOmB0M8TbRJ2jIKYnO24VS3c7p9kVHHAUMfjTV
 kwsEL2hBf4XtIkQvMSaHMfvFE+3nL4oBr0gaFink7Q==
X-Google-Smtp-Source: ABdhPJyKumEbkgQP6J6mUS/EBp8keZW8qRmjnVqkZY4uPCWEu8aFoJs3b8dqyVD8AVorNTkEA8yUaEqQCMm2oq5rRUU=
X-Received: by 2002:a2e:155c:: with SMTP id 28mr3126162ljv.337.1627570429391; 
 Thu, 29 Jul 2021 07:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210729094640.GT875@home.paul.comp>
In-Reply-To: <20210729094640.GT875@home.paul.comp>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 29 Jul 2021 07:53:38 -0700
Message-ID: <CACWQX81MBkR3JVRDGbJJMzgGgb3E03HfZTtKu_c0m51g4hXtoA@mail.gmail.com>
Subject: Re: Redfish requests for dbus-sensors data are needlessly slow -
 analysis
To: Paul Fertser <fercerpav@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrei Tutolmin <a.tutolmin@gagar-in.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Timofei Nikitin <t.nikitin@gagar-in.com>,
 Jason Bills <jason.m.bills@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 29, 2021 at 2:46 AM Paul Fertser <fercerpav@gmail.com> wrote:
>
> Hello,
>
> Short version:
>
> Our operations team complains about very high (seconds) latency of
> requesting sensor data used to monitor health of the servers via
> Redfish. Boards are OCP Tioga Pass with AST2500 BMC. Software
> involved: OpenBMC bmcweb, dbus-sensors, ObjectMapper, EntityManager.
>
> In this mail I provide details about the testing methodology, the
> complete call chain (including RPC) involved in handling Redfish
> requests, and a quick-and-dirty patch that caches some D-Bus replies
> in bmcweb that results in cutting down response times by more than 4
> times. It also gives significantly less CPU overhead.
>
> My impression so far is that the current way is rather wasteful and
> can be considerably improved.
>
> Our question is basically whether what we see is normal, if we should
> change the way servers are monitored, if bmcweb should really be
> better optimised and if yes, how exactly?
>
>
> Longer version:
>
> Our operations team is normally using Zabbix for monitoring, and they
> developed a set of scripts and templates to handle OpenBMC machines:
> https://github.com/Gagar-in/redfish-bmc-lld .
>
> For easier reproduction and analysis I instead use plain curl command
> to request data for a single specific sensor. The following text
> assumes we're interested to get output current of the first DRAM VR
> (handled by pxe1610 kernel driver and PSUSensor OpenBMC daemon which
> caches the values periodically read from hwmon nodes).
>
> To make sure I'm measuring just the time it takes to answer the GET
> request itself (and not counting any TLS session establishment
> overhead as curl is reusing an open connection) I'm running this
> command:
>
> $ curl -w '\n\nTime spent: %{time_total}\n\n\n' -k $(for i in $(seq 5); d=
o echo https://root:0penBmc@$BMCIP/redfish/v1/Chassis/TiogaPass_Baseboard/S=
ensors/CPU0_VDDQ_A_IOUT; done)
>
> I typically get over 2 seconds for each request made. With the patch
> at the end of the mail the same test consistently shows times below
> half a second.
>
> The major part of the delay comes from numerous (and probably
> suboptimal) D-Bus calls, plus the overhead to process the responses.
>
> Here follows D-Bus profiling data typical for each Redfish sensors
> request made. "mc" is the method call performed by "bmcweb", "mr" is
> the response. I've added the second column (by processing dbus-monitor
> --profile output through awk -vOFS=3D'\t' '{ d=3D$2-prev; prev=3D$2;
> $2=3Dd"\t"$2; print $0 }' ) to show the difference between the current
> timestamp and the previous one so it's visible how much time it takes
> for the daemons to answer each request and how much time bmcweb needs
> to process the result.
>
> mc      ---------       1625473150.291539       1665    :1.79   xyz.openb=
mc_project.User.Manager        /xyz/openbmc_project/user       xyz.openbmc_=
project.User.Manager        GetUserInfo
> mr      0.0463991       1625473150.337938       469     :1.36   :1.79   1=
665
> mc      0.00556493      1625473150.343503       1666    :1.79   xyz.openb=
mc_project.ObjectMapper        /xyz/openbmc_project/object_mapper      xyz.=
openbmc_project.ObjectMapper        GetSubTree
> err     0.0143089       1625473150.357812       470     :1.36   :1.79   1=
665
> mr      0.0478861       1625473150.405698       5891    :1.49   :1.79   1=
666
> mc      0.0611379       1625473150.466836       1667    :1.79   xyz.openb=
mc_project.ObjectMapper        /xyz/openbmc_project/object_mapper      xyz.=
openbmc_project.ObjectMapper        GetSubTree
> mr      0.0716419       1625473150.538478       5893    :1.49   :1.79   1=
667
> mc      0.0977321       1625473150.636210       1668    :1.79   xyz.openb=
mc_project.ObjectMapper        /xyz/openbmc_project/object_mapper      xyz.=
openbmc_project.ObjectMapper        GetSubTree
> mr      0.0268672       1625473150.663077       5895    :1.49   :1.79   1=
668
> mc      0.0232749       1625473150.686352       1669    :1.79   xyz.openb=
mc_project.ObjectMapper        /       org.freedesktop.DBus.ObjectManager  =
    GetManagedObjects
> mr      0.156963        1625473150.843315       5896    :1.49   :1.79   1=
669
> mc      0.428404        1625473151.271719       1670    :1.79   xyz.openb=
mc_project.ObjectMapper        /xyz/openbmc_project/object_mapper      xyz.=
openbmc_project.ObjectMapper        GetSubTree
> mr      0.030153        1625473151.301872       5898    :1.49   :1.79   1=
670
> mc      0.123439        1625473151.425311       1671    :1.79   xyz.openb=
mc_project.EntityManager       /       org.freedesktop.DBus.ObjectManager  =
    GetManagedObjects
> mr      0.284928        1625473151.710239       1408    :1.63   :1.79   1=
671
> mc      0.108877        1625473151.819116       1672    :1.79   xyz.openb=
mc_project.ObjectMapper        /xyz/openbmc_project/object_mapper      xyz.=
openbmc_project.ObjectMapper        GetSubTree
> mr      0.0525708       1625473151.871687       5900    :1.49   :1.79   1=
672
> mc      0.0175102       1625473151.889197       1673    :1.79   xyz.openb=
mc_project.PSUSensor   /       org.freedesktop.DBus.ObjectManager      GetM=
anagedObjects
> mr      0.119283        1625473152.008480       124202  :1.104  :1.79   1=
673
>
>
> To provide more insight into what and why bmcweb is doing I made the
> following call chain description by carefully reading
> redfish-core/lib/sensors.hpp source code:
>
> 0. requestRoutesSensor() is called to process the GET request.
>
> For further processing a D-Bus call is made. For experimenting on a
> running system I'm providing copy-pasteable "busctl" invocations for
> all the calls involved.
>
> # busctl --json=3Dpretty call xyz.openbmc_project.ObjectMapper /xyz/openb=
mc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias /=
xyz/openbmc_project/sensors 2 1 xyz.openbmc_project.Sensor.Value
>
> The returned array is searched for the requested sensor name, a
> flat_set is created with a single string containing D-Bus sensor path
> (in this example
> "/xyz/openbmc_project/sensors/current/CPU0_VDDQ_A_IOUT"). The flat_set
> is passed to processSensorList().
>
>
> 1. processSensorList() calls getConnections() which calls
> getObjectsWithConnection() (the latter can also be called from
> setSensorsOverride()).
>
> It does this call (exactly the same as previous!):
>
> # busctl --json=3Dpretty call xyz.openbmc_project.ObjectMapper /xyz/openb=
mc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias /=
xyz/openbmc_project/sensors 2 1 xyz.openbmc_project.Sensor.Value
>
> For each returned subtree it determines if it's one of the sensors we
> requested. In this case the bus names are added to a "connections"
> flat_set (in this example it's just "xyz.openbmc_project.PSUSensor")
> and a set of tuples "objectsWithConnection" is created (in this
> example it's
> ("/xyz/openbmc_project/sensors/current/CPU0_VDDQ_A_IOUT","xyz.openbmc_pro=
ject.PSUSensor")
> . "connections" is passed to the callback provided by
> processSensorList(), "objectsWithConnection" is ignored.
>
>
> 2. getConnectionCb() defined in processSensorList() calls getObjectManage=
rPaths().
>
> The following call is made:
>
> # busctl --json=3Dpretty call xyz.openbmc_project.ObjectMapper /xyz/openb=
mc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias /=
 0 1 org.freedesktop.DBus.ObjectManager
>
> The result is converted to a "objectMgrPaths" associative array, with
> connection used as a key and path as a value (in this example the
> essential element would be
> objectMgrPaths["xyz.openbmc_project.PSUSensor"]=3D"/" and
> objectMgrPaths["xyz.openbmc_project.ObjectMapper"]=3D"/"). This map is
> passed to getObjectManagerPathsCb() defined inside processSensorList()
>
>
> 3. getInventoryItems() calls getInventoryItemAssociations() which uses
> the objectMgrPaths map to look for the path for
> "xyz.openbmc_project.ObjectMapper". If it's not found, "/" is assumed.
>
> The D-Bus call is made:
>
> # busctl --json=3Dpretty call xyz.openbmc_project.ObjectMapper / org.free=
desktop.DBus.ObjectManager GetManagedObjects
>
> For each sensor path we're interested in we're trying to find a
> corresponding inventory object (in this case
> "/xyz/openbmc_project/sensors/current/CPU0_VDDQ_A_IOUT/inventory") to
> get the list of endpoints for its associations. The first endopoint
> path is used in a call to addInventoryItem() (in this example it's
> "/xyz/openbmc_project/inventory/system/board/TiogaPass_Baseboard" for
> "/xyz/openbmc_project/sensors/current/CPU0_VDDQ_A_IOUT").
>
> Then we again walk the list returned from D-Bus for each entry
> checking if it represents a LED of any item stored in the current
> inventory list, and if found the first associated endpoint path is
> stored for this inventory item. In this example no associated LEDs
> exist.
>
> The resulting inventory items set is passed to the callback
> getInventoryItemAssociationsCb() defined in getInventoryItems().
>
>
> 4. getInventoryItemsConnections() is called which makes the following
> D-Bus call:
>
> # busctl --json=3Dpretty call xyz.openbmc_project.ObjectMapper /xyz/openb=
mc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias /=
xyz/openbmc_project/inventory 0 4 xyz.openbmc_project.Inventory.Item xyz.op=
enbmc_project.Inventory.Item.PowerSupply xyz.openbmc_project.Inventory.Deco=
rator.Asset xyz.openbmc_project.State.Decorator.OperationalStatus
>
> For each item returned we see if it's present in our inventory and if
> yes, add all connections for it (in this example we only add
> "xyz.openbmc_project.EntityManager" for
> "/xyz/openbmc_project/inventory/system/board/TiogaPass_Baseboard"). Then
> it provides all the gathered inventory connections to the
> "getInventoryItemsConnectionsCb" callback provided by
> getInventoryItems().
>
>
> 5. getInventoryItemsData() gets called which for every stored
> inventory connection tries to find a corresponding path from the
> object manager data returned earlier (uses "/" if not found) and then
> performs a D-Bus call (in this example just one):
>
> # busctl --json=3Dpretty call xyz.openbmc_project.EntityManager / org.fre=
edesktop.DBus.ObjectManager GetManagedObjects
>
> For each inventory path it saves the result with
> storeInventoryItemData() and then calls getInventoryItemsData()
> recursively for all the other connections (in this example there was
> just one, "xyz.openbmc_project.EntityManager"). After processing them
> all, calls getInventoryItemsDataCb() defined in getInventoryItems().
>
>
> 6. getInventoryLeds() is called which does this D-Bus call:
>
> # busctl --json=3Dpretty call xyz.openbmc_project.ObjectMapper /xyz/openb=
mc_project/object_mapper xyz.openbmc_project.ObjectMapper GetSubTree sias /=
xyz/openbmc_project 0 1 xyz.openbmc_project.Led.Physical
>
> The result is parsed to see if there's any LED path corresponding to
> an inventory item, and stores everything found. The collected data is
> passed to getInventoryLedData() which performs similarly to
> getInventoryItemsData(). In the example no suitable LEDs are found so
> it proceeds to calling getInventoryLedsCb() defined in
> getInventoryItems().
>
>
> 7. getPowerSupplyAttributes() is called but in this example (since
> it's requesting a sensor, not power node) it does nothing but proceeds
> to calling getInventoryItemsCb() defined in processSensorList().
>
>
> 8. getSensorData() is called which for every sensor connection finds
> objectMgrPath (if any, else "/" is used) and calls D-Bus (in this
> example just once since we have a single sensor connection):
>
> # busctl --json=3Dpretty call xyz.openbmc_project.PSUSensor / org.freedes=
ktop.DBus.ObjectManager GetManagedObjects
>
> This provides all the current data (including all the associations,
> OperationalStatus and Availability!) for all the sensors handled by
> this bus (so much more than we actually need in this example).
>
> It finally proceeds to building the JSON response (based on the data
> returned by the call and in some cases the inventory data obtained
> earlier) and exits; the response (values for the single sensor
> requested) is sent back to the client.
>
>
> Here follows my naive exploratory patch. It works for the sensors
> we're interested in (unless they appear after the first Redfish
> request made to bmcweb as the cache for the expensive D-Bus calls is
> never invalidated). It doesn't handle complex inventory associations.

The "unless" is kind of important here.  Sensors can show up or be
removed at any time, especially on an entity-manager enabled system.

As a general rule, bmcweb has avoided having a cache at all.  There
have been several attempts at adding one, but most failed because of
the same thing you found: cache invalidation is hard.  If we're going
to implement a cache, I'd really like to see it done at a higher level
(somewhere in the connection class) and done more generically than
this is here, which would ensure that all endpoints are sped up, not
just sensors.  With that said, if this really solves the problem and
solves it well, I can't very well ignore it.

>
> I would be willing to work on doing the right thing but for that I'm
> lacking the understanding of the complete picture involved in handling
> all types of sensors and interfaces, so I'm kindly asking for your
> help with it.
>
> diff --git a/redfish-core/lib/sensors.hpp b/redfish-core/lib/sensors.hpp

Can you please submit the below to gerrit as a WIP instead.  There's
much better tooling there for reviewing and testing patches.  I can
review it more there.

FWIW, it's on my list to look into the mapper shared-memory caching
layer that @arj wrote a while back.  It might also be able to solve
this problem;  I don't have the link offhand, but I think it was
trying to solve a similar problem, but handled the cache invalidation
issue as well.

> index ac987359ce5b..266dd25b27e0 100644
> --- a/redfish-core/lib/sensors.hpp
> +++ b/redfish-core/lib/sensors.hpp
> @@ -51,6 +51,9 @@ static constexpr std::string_view sensors =3D "Sensors"=
;
>  static constexpr std::string_view thermal =3D "Thermal";
>  } // namespace node
>
> +static boost::container::flat_map<std::string, std::string> objectMgrPat=
hsCache;
> +static GetSubTreeType subTreeCache;
> +
>  namespace dbus
>  {
>  static const boost::container::flat_map<std::string_view,
> @@ -244,6 +247,7 @@ void getObjectsWithConnection(
>              return;
>          }
>
> +        sensors::subTreeCache =3D subtree;
>          BMCWEB_LOG_DEBUG << "Found " << subtree.size() << " subtrees";
>
>          // Make unique list of connections only for requested sensor typ=
es and
> @@ -281,11 +285,19 @@ void getObjectsWithConnection(
>          callback(std::move(connections), std::move(objectsWithConnection=
));
>          BMCWEB_LOG_DEBUG << "getObjectsWithConnection resp_handler exit"=
;
>      };
> -    // Make call to ObjectMapper to find all sensors objects
> -    crow::connections::systemBus->async_method_call(
> -        std::move(respHandler), "xyz.openbmc_project.ObjectMapper",
> -        "/xyz/openbmc_project/object_mapper",
> -        "xyz.openbmc_project.ObjectMapper", "GetSubTree", path, 2, inter=
faces);
> +    if (sensors::subTreeCache.empty())
> +    {
> +        // Make call to ObjectMapper to find all sensors objects
> +        crow::connections::systemBus->async_method_call(
> +            std::move(respHandler), "xyz.openbmc_project.ObjectMapper",
> +            "/xyz/openbmc_project/object_mapper",
> +            "xyz.openbmc_project.ObjectMapper", "GetSubTree", path, 2,
> +            interfaces);
> +    }
> +    else
> +    {
> +        respHandler(boost::system::error_code{}, sensors::subTreeCache);
> +    }
>      BMCWEB_LOG_DEBUG << "getObjectsWithConnection exit";
>  }
>
> @@ -606,15 +618,26 @@ void getObjectManagerPaths(std::shared_ptr<SensorsA=
syncResp> SensorsAsyncResp,
>                                   << objectPath;
>              }
>          }
> +        sensors::objectMgrPathsCache =3D *objectMgrPaths;
>          callback(objectMgrPaths);
>          BMCWEB_LOG_DEBUG << "getObjectManagerPaths respHandler exit";
>      };
>
> -    // Query mapper for all DBus object paths that implement ObjectManag=
er
> -    crow::connections::systemBus->async_method_call(
> -        std::move(respHandler), "xyz.openbmc_project.ObjectMapper",
> -        "/xyz/openbmc_project/object_mapper",
> -        "xyz.openbmc_project.ObjectMapper", "GetSubTree", "/", 0, interf=
aces);
> +    if (sensors::objectMgrPathsCache.empty())
> +    {
> +        // Query mapper for all DBus object paths that implement ObjectM=
anager
> +        crow::connections::systemBus->async_method_call(
> +            std::move(respHandler), "xyz.openbmc_project.ObjectMapper",
> +            "/xyz/openbmc_project/object_mapper",
> +            "xyz.openbmc_project.ObjectMapper", "GetSubTree", "/", 0,
> +            interfaces);
> +    }
> +    else
> +    {
> +        callback(std::make_shared<
> +                 boost::container::flat_map<std::string, std::string>>(
> +            sensors::objectMgrPathsCache));
> +    }
>      BMCWEB_LOG_DEBUG << "getObjectManagerPaths exit";
>  }
>
> @@ -2628,9 +2669,11 @@ inline void processSensorList(
>                          };
>
>                      // Get inventory items associated with sensors
> -                    getInventoryItems(SensorsAsyncResp, sensorNames,
> -                                      objectMgrPaths,
> -                                      std::move(getInventoryItemsCb));
> +                    // getInventoryItems(SensorsAsyncResp, sensorNames,
> +                    //                  objectMgrPaths,
> +                    //                  std::move(getInventoryItemsCb));
> +                    getInventoryItemsCb(
> +                        std::make_shared<std::vector<InventoryItem>>());
>
>                      BMCWEB_LOG_DEBUG << "getObjectManagerPathsCb exit";
>                  };
> @@ -3105,66 +3148,75 @@ class Sensor : public Node
>          const std::array<const char*, 1> interfaces =3D {
>              "xyz.openbmc_project.Sensor.Value"};
>
> -        // Get a list of all of the sensors that implement Sensor.Value
> -        // and get the path and service name associated with the sensor
> -        crow::connections::systemBus->async_method_call(
> -            [asyncResp, sensorName](const boost::system::error_code ec,
> -                                    const GetSubTreeType& subtree) {
> -                BMCWEB_LOG_DEBUG << "respHandler1 enter";
> -                if (ec)
> -                {
> -                    messages::internalError(asyncResp->res);
> -                    BMCWEB_LOG_ERROR << "Sensor getSensorPaths resp_hand=
ler: "
> -                                     << "Dbus error " << ec;
> -                    return;
> -                }
> +        auto respHandler =3D [asyncResp,
> +                            sensorName](const boost::system::error_code =
ec,
> +                                        const GetSubTreeType& subtree) {
> +            BMCWEB_LOG_DEBUG << "respHandler1 enter";
> +            if (ec)
> +            {
> +                messages::internalError(asyncResp->res);
> +                BMCWEB_LOG_ERROR << "Sensor getSensorPaths resp_handler:=
 "
> +                                 << "Dbus error " << ec;
> +                return;
> +            }
>
> -                GetSubTreeType::const_iterator it =3D std::find_if(
> -                    subtree.begin(), subtree.end(),
> -                    [sensorName](
> -                        const std::pair<
> -                            std::string,
> -                            std::vector<std::pair<std::string,
> -                                                  std::vector<std::strin=
g>>>>&
> -                            object) {
> -                        std::string_view sensor =3D object.first;
> -                        std::size_t lastPos =3D sensor.rfind("/");
> -                        if (lastPos =3D=3D std::string::npos ||
> -                            lastPos + 1 >=3D sensor.size())
> -                        {
> -                            BMCWEB_LOG_ERROR << "Invalid sensor path: "
> -                                             << sensor;
> -                            return false;
> -                        }
> -                        std::string_view name =3D sensor.substr(lastPos =
+ 1);
> +            sensors::subTreeCache =3D subtree;
>
> -                        return name =3D=3D sensorName;
> -                    });
> +            GetSubTreeType::const_iterator it =3D std::find_if(
> +                subtree.begin(), subtree.end(),
> +                [sensorName](
> +                    const std::pair<
> +                        std::string,
> +                        std::vector<std::pair<
> +                            std::string, std::vector<std::string>>>>& ob=
ject) {
> +                    std::string_view sensor =3D object.first;
> +                    std::size_t lastPos =3D sensor.rfind("/");
> +                    if (lastPos =3D=3D std::string::npos ||
> +                        lastPos + 1 >=3D sensor.size())
> +                    {
> +                        BMCWEB_LOG_ERROR << "Invalid sensor path: " << s=
ensor;
> +                        return false;
> +                    }
> +                    std::string_view name =3D sensor.substr(lastPos + 1)=
;
>
> -                if (it =3D=3D subtree.end())
> -                {
> -                    BMCWEB_LOG_ERROR << "Could not find path for sensor:=
 "
> -                                     << sensorName;
> -                    messages::resourceNotFound(asyncResp->res, "Sensor",
> -                                               sensorName);
> -                    return;
> -                }
> -                std::string_view sensorPath =3D (*it).first;
> -                BMCWEB_LOG_DEBUG << "Found sensor path for sensor '"
> -                                 << sensorName << "': " << sensorPath;
> +                    return name =3D=3D sensorName;
> +                });
>
> -                const std::shared_ptr<boost::container::flat_set<std::st=
ring>>
> -                    sensorList =3D std::make_shared<
> -                        boost::container::flat_set<std::string>>();
> +            if (it =3D=3D subtree.end())
> +            {
> +                BMCWEB_LOG_ERROR << "Could not find path for sensor: "
> +                                 << sensorName;
> +                messages::resourceNotFound(asyncResp->res, "Sensor",
> +                                           sensorName);
> +                return;
> +            }
> +            std::string_view sensorPath =3D (*it).first;
> +            BMCWEB_LOG_DEBUG << "Found sensor path for sensor '" << sens=
orName
> +                             << "': " << sensorPath;
>
> -                sensorList->emplace(sensorPath);
> -                processSensorList(asyncResp, sensorList);
> -                BMCWEB_LOG_DEBUG << "respHandler1 exit";
> -            },
> -            "xyz.openbmc_project.ObjectMapper",
> -            "/xyz/openbmc_project/object_mapper",
> -            "xyz.openbmc_project.ObjectMapper", "GetSubTree",
> -            "/xyz/openbmc_project/sensors", 2, interfaces);
> +            const std::shared_ptr<boost::container::flat_set<std::string=
>>
> +                sensorList =3D
> +                    std::make_shared<boost::container::flat_set<std::str=
ing>>();
> +
> +            sensorList->emplace(sensorPath);
> +            processSensorList(asyncResp, sensorList);
> +            BMCWEB_LOG_DEBUG << "respHandler1 exit";
> +        };
> +
> +        if (sensors::subTreeCache.empty())
> +        {
> +            // Get a list of all of the sensors that implement Sensor.Va=
lue
> +            // and get the path and service name associated with the sen=
sor
> +            crow::connections::systemBus->async_method_call(
> +                std::move(respHandler), "xyz.openbmc_project.ObjectMappe=
r",
> +                "/xyz/openbmc_project/object_mapper",
> +                "xyz.openbmc_project.ObjectMapper", "GetSubTree",
> +                "/xyz/openbmc_project/sensors", 2, interfaces);
> +        }
> +        else
> +        {
> +            respHandler(boost::system::error_code{}, sensors::subTreeCac=
he);
> +        }
>      }
>  };
>
>
> Thank you for your attention.
>
> --
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
> mailto:fercerpav@gmail.com
