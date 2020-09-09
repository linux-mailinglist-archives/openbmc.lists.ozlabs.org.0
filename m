Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 949B1262A60
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 10:33:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmZz03J6TzDqSF
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 18:33:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=GooLdv1b; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmZxp1dlVzDqR2
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 18:31:57 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 151205714B;
 Wed,  9 Sep 2020 08:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1599640310; x=1601454711; bh=yT8EZl6wOEe7PA9y2HgerQiUc
 LeSflCjJ+1ZsyWpIbM=; b=GooLdv1blcFuYfWrm7qYLykxPrY9kzrG5TrKkrt98
 itwJEkWms7I0Z+p7sY/j2kH3O1TmXcuhmVjdfkEf44Qg8vto/UL66U5BPmPxnh/p
 P2vsR92mDLUppRXxU0VxQwN0IXSw6gf+MrktQU9URUHKUx2JW5H1ROqME0HkTGgd
 WQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47bsCkVCbJ-P; Wed,  9 Sep 2020 11:31:50 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4A9C3521BA;
 Wed,  9 Sep 2020 11:31:50 +0300 (MSK)
Received: from [10.199.1.2] (10.199.1.2) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 9 Sep
 2020 11:31:50 +0300
Message-ID: <04f295ab0f95c491442054958c103f651409cd40.camel@yadro.com>
Subject: Re: OpenBMC - FRU inventory with Entity Manager
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Jiandi An <jan@nvidia.com>
Date: Wed, 9 Sep 2020 11:31:49 +0300
In-Reply-To: <DM6PR12MB302048450BC68C4E79711B2CCD290@DM6PR12MB3020.namprd12.prod.outlook.com>
References: <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
 <22E14C00-D87D-489F-AB22-6401DE8CDDF5@fb.com>
 <5e71fa32-4547-fb5e-ed50-dffe19cefc09@linux.vnet.ibm.com>
 <b9f035732b62a4bd58ea67e2ea936bdce2cec790.camel@yadro.com>
 <CACWQX83AXKZiTdhrXhuXg8r-2ZfJstqGANumOBzVtNHzFGonDA@mail.gmail.com>
 <ceef9c9e30992d6d9fe85ec19b1c87da1191fc39.camel@yadro.com>
 <CACWQX83+BO7WuZBW6ubJwvYOhKee=F0Hf5WBWm2uX2bhBV3ZMA@mail.gmail.com>
 <DM6PR12MB302048450BC68C4E79711B2CCD290@DM6PR12MB3020.namprd12.prod.outlook.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.1.2]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> > 
> > At least it'll be there for the next person.
> 
> Line 72 of the doc says the 3rd component to entity-manager is the
> reactor.
> It mentions one example is dbus-sensors, which contains a suite of
> application that
> input the Exposes records for sensor devices, then connect to the
> filesystem to create
> the sensors and scan loops to scan sensors for those devices.
> 
> Could someone point a sample code that a platform is doing the flow
> described above?
> 
> For example after enable entity-manager and put in the device tree
> for temp sensors
> and FRU EEPROM devices, and the Exposes, probe config blocks in the
> json file, still
> struggling to get ipmitool sensor list and ipmitool fru to
> work.  "ipmitool fru" issue is
> clear based on the feedback in this thread.  But really want to have
> a tutorial or code
> example to walk through to understand the reactor side of things.
> 

This reactors are just a services that are expected to read their
configuration from dbus. EM expose something to dbus and then these
services are read what they need.

> > > Another thing I would like to have is even more high- level
> > > document 
> > > describing the common architecture of EM-based inventory.
> > > I can start with some drafts of what I dig, to make it more
> > > clear.
> 
> Really appreciate for this type of document if they are
> available.  We are adopting
> entity-manager in our proof-of-concept project but really struggling
> to find detailed
> documentation and end up just copying and pasting existing entity
> manager json
> config files and tweaking them.
> The two links we follow kind of as bibles for entity manager doesn't
> provide a detail guide
> for example in the json config file, what each field means and how
> that field is being
> consumed, causes what to be created on the d-bus side, and being
> consumed by what reactor.
> 
> https://github.com/openbmc/entity-manager/blob/master/docs/my_first_sensors.md
> https://github.com/openbmc/entity-manager/blob/master/README.md
> 
> For example for sensors with entity manager do we still need the IPMI
> YAML
> configuration file described here?
> https://github.com/openbmc/docs/blob/master/architecture/sensor-architecture.md#defining-sensors-in-an-ipmi-yaml-configuration-file
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/sensor-example.yaml
> 
> For FRUs, for example do we still need 
> https://github.com/ibm-openbmc/openbmc/blob/OP940/meta-ibm/meta-romulus/recipes-phosphor/configuration/romulus-yaml-config/romulus-ipmi-fru.yaml
>  
> Because I found out when doing "ipmitool fru" it always goes off of
> the default Builtin FRU Device ID 0, dimm0 ID1, dimm1 ID2, cpu0 ID 3,
> and cpu1 ID 4.  
> $ ipmitool -I lanplus -H $BMC_IP -U root -P 0penBmc -C 17 fru
> FRU Device Description : Builtin FRU Device (ID 0)
>  Device not present (Unspecified error)
> 
> FRU Device Description : dimm0 (ID 1)
>  Device not present (Unspecified error)
> 
> FRU Device Description : dimm1 (ID 2)
>  Device not present (Unspecified error)
> 
> FRU Device Description : cpu0 (ID 3)
>  Device not present (Unspecified error)
> 
> FRU Device Description : cpu1 (ID 4)
>  Device not present (Unspecified error)
> 
> And that's because 
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/fru_gen.py
> always
> taking 
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/fru-read-example.yaml
> from the as the default fru inventory yaml config.
> unless custom fru yaml like the above is specified.
> 
> Even after porting over intel-ipmi-oem or fb-ipmi-oem's oem command
> fru handler for entity manager,
> still has the above behavior when doing "ipmitool fru".  Just really
> trying to look for a high level flow
> of the reactor side under entity manager, sensor and fru to begin
> with.
> 
> In porting intel-ipmi-oem's fru command handler for entity-manager,
> first phosphor-ipmid-host.service
> would coredump.  Debugged it to be the startMatch() in
> registerStorageFunctions() where it's calling
> boost::asio::spawn with replaceCacheFru()
> https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L1311
> https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L361
> 
> So switched to fb-ipmi-oem's implementation which doesn't do the
> replaceCacheFru with
> the async handler.
> https://github.com/openbmc/fb-ipmi-oem/blob/master/src/storagecommands.cpp#L185
> But still "ipmi fru" would still display the default Builtin FRU
> Device ID 0, dimm0 ID1, dimm1 ID2, cpu0 ID 3, and cpu1 ID 4. 
> 
> So I guess need to go back and really understand the reactor side
> under entity-manager
> and how the d-bus objects are created by the entity-manager and how
> they are consumed
> by the reactors for each components (sensors, fru, etc.)  Any
> documentation on that will be so
> helpful as a new adopter of entity-manager trying to dig in on what
> different pieces need to line
> up when switching to entity-manager.


You don't need any YAML files when you use EM. However to get ipmitool
fru list to work you need to replace ipmi command handlers by that from
intel-ipmi-oem. If you have output like you show, then you probably
make something wrong and you still have default handlers from phosphor-
ipmid-host.
Reactors are not related to what you see in fru list. They will
construct sensors list, setup some parts of the system and so on, but
fru list in the new model is only defined by FruDevice service: you
will get there only devices that actually have I2C EEPROMs with FRU
data written.


