Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99186770FD2
	for <lists+openbmc@lfdr.de>; Sat,  5 Aug 2023 15:09:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=G7nZPrdd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJ2wS3LVwz3cNS
	for <lists+openbmc@lfdr.de>; Sat,  5 Aug 2023 23:09:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=G7nZPrdd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:7e89::806; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=fishbaoz@hotmail.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10acsn20806.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::806])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJ2vk3Zy7z2ydP
	for <openbmc@lists.ozlabs.org>; Sat,  5 Aug 2023 23:08:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIU3FaPwH+1ExwNvb1W8y1WpKHkf6XfYafpyow1T4TyGAWIB34AanC/r3w5Zt5OWWDG9sxJ+M+9lD0GcHv6T/FubDuCETdASNPuEHX+EdWVGy73tcdKzoGzfEeRwg+yddZdtdfixrxCd/96BE4Oy56LO9yGRC0VcI1WpeShmxUfiOuq4okmARtvbBQccmuVY4+MOCW1+NNcD5Qj4htSA7y5jlODSL62EI7Nu47OeHFjdNlb+eqU5J6om7kgHUa+ewzeN5TWTdxilrIWs1Qz/30pkatuYNsHy/JdOujZm0Gpv4sLZ5/Q4hOaMf2BFX5CrJhvlh/cutgDhCwBHTB8pbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEm/H30K/GyXEPZwXCxr0IebhJNnAiI6Ee3dLgOzIMI=;
 b=AGcf292HNdLntA0jMW71kLfqWqAxBtkVw78Rg7LmT7IxE25i4co/LJi0ktkReI68uUzgZsoc4Ox/x9NmeQ6XbehL4vZ0yzy56S+yZU9erVyhyHH+kOdj+Wqa1/hk/OU2Msnuz0qA7UlqDAeMT7Auio9yP6t3FSdsXd244ZvwsAoANRQwqX66yRHdTQnpgGJf549icFBXTOne9oPd4NWoIceyiUEir7vxbuMkjVzFnPkoCKarhpgUoO6a9L+WYGuuhy8r1u9+3t49PYRDBCgm1OAGbP8QjvJifeJ5/KDBEGDr1jcLYXcdaKUDd4kG9zEeRWTl5rOWPek/RYClUq9ZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEm/H30K/GyXEPZwXCxr0IebhJNnAiI6Ee3dLgOzIMI=;
 b=G7nZPrddobXPZEz29eqpb29JYR3arlnjP5zXVMG7FyABRnLqsY9u3cB3LAqUPn5h0+SdVVzAjGPajs89k5jT0UZfQX4/BRSzw07cUJz9Jj47/+9dAr1jEr/BuLLWibLRwdS5b5HH0xlwhdxi6g8CU0IH5aMe5ftHJVzpb5TrC2IZ7wTr5KATEnWmAOvc5NRwubEewikPVmeRzrpyISJuXhHgwNEn/UgSWgc8OTrqBF5fFoUrGvYYTSYdRZg2Af2p8Ne3UndSJ+gFtGjg+GZEWCJ7NESAKxsgR4dKeLoK2Z4Gqzk4ScvG3Egy/2ZDPWox9bm+Yo03F/Qcff/ubXouCw==
Received: from DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) by
 PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Sat, 5 Aug
 2023 13:08:10 +0000
Received: from DM4PR11MB6502.namprd11.prod.outlook.com
 ([fe80::2670:725d:11b7:3ab1]) by DM4PR11MB6502.namprd11.prod.outlook.com
 ([fe80::2670:725d:11b7:3ab1%7]) with mapi id 15.20.6652.021; Sat, 5 Aug 2023
 13:08:10 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, Jiandi An <jan@nvidia.com>
Subject: Re: OpenBMC - FRU inventory with Entity Manager
Thread-Topic: OpenBMC - FRU inventory with Entity Manager
Thread-Index:  AdZ8BXDmk1ugNPOnSNWhMxi+CJGThv//5pQAgAB4k4CAAAddAIAHAxCAgAN8EACAAC7MgP/36xQwgBH87ICGghtfnQ==
Date: Sat, 5 Aug 2023 13:08:09 +0000
Message-ID:  <DM4PR11MB650281D042CE685F4BDB022DCD0EA@DM4PR11MB6502.namprd11.prod.outlook.com>
References:  <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
 <22E14C00-D87D-489F-AB22-6401DE8CDDF5@fb.com>
 <5e71fa32-4547-fb5e-ed50-dffe19cefc09@linux.vnet.ibm.com>
 <b9f035732b62a4bd58ea67e2ea936bdce2cec790.camel@yadro.com>
 <CACWQX83AXKZiTdhrXhuXg8r-2ZfJstqGANumOBzVtNHzFGonDA@mail.gmail.com>
 <ceef9c9e30992d6d9fe85ec19b1c87da1191fc39.camel@yadro.com>
 <CACWQX83+BO7WuZBW6ubJwvYOhKee=F0Hf5WBWm2uX2bhBV3ZMA@mail.gmail.com>
 <DM6PR12MB302048450BC68C4E79711B2CCD290@DM6PR12MB3020.namprd12.prod.outlook.com>
 <04f295ab0f95c491442054958c103f651409cd40.camel@yadro.com>
In-Reply-To: <04f295ab0f95c491442054958c103f651409cd40.camel@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [CaFmxTCzFRP6A1g7NUNndEQWuy3KHK1S]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6502:EE_|PH7PR11MB8249:EE_
x-ms-office365-filtering-correlation-id: 22ffe5e4-f62d-422a-090e-08db95b5047d
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ysoFFVe0FQhYm8wKO9tzCQ3BnGOKD/XxLbWfiyPzC2uTrL6s3of3GmzoS/Idh5OQQBmo9POEd6fb/NlNMT9UIeDTAQLU/N5LYia+XE0e4aMAI0uy7YSDWg/TZaQfoKIGhIsQDR5FKPa13sHqj8iJCTotUEZjtgswkC4k8Hv1YIyN1QtJCeY9tjz+bu0q0tsPcai9l0aoLYXFCBXi5Zc6Cm6JNW/it60vjK6C8BfWZZpIWKR619tZ/d55t5k/1nlgp2MGNCWrFET9GjRTAlBXBy6QGZ5FvymBE5oqo1Tb+T5t932f2JDazuswX88XL6RdNCp3dHawcmpXnR1L37fCzImppDFUJmw69+NpuRZVdbTpmTJkKiUIQZqnFHm/pNFH4exuUwPz2VRsHTM+Ua8FaxviJL6cDkix2W02kcPDTC4OHFI0MSkE3tqwrN8Rcb8HR+4tGqYb/7EAWwTiXcLyFrcj9N4Zdk3BbUIWr8RkOHooTE3FpEwt/8Kingync0p34xDP9pLTjc9kEVBix7DJ+ku1jj6aHJHVqMkHYJvWGTDd1QfCPiCafmsK2kAfECv8FEp8aghhRs6JkbRaaXPWG28CraHDVQE/qXAtH7zWMa4i8IQ7WyhfHfOjWzAf3GkoEw+ewqdjdTI68eGt1jjUGg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?aqO5oyUAyec0iGAKqiGVrV5AOH3Z2Iyz+oJ9Jt94nTNqcokiqFkCrO5IWy?=
 =?iso-8859-1?Q?N5vIKSnlglF46s0D151NVJ1kGgryQieJyyIWi6PxFTJDIhOxZAKYyDQd0o?=
 =?iso-8859-1?Q?foHXvgd+CtwJ5AKvdyTtIapOLnpSCYv9gLvYGmH+yoQO2FLot2QcXGh32M?=
 =?iso-8859-1?Q?c+H1OG2frpCNHnpglKMkqdNsqezxZeX8zg4pVf5Ls3ZWkm3kBmiNRaoxL3?=
 =?iso-8859-1?Q?cAq+WzygilczbohvybNu3fRrsgfEVEc7FST55+T4P1rJmpyMUQ5QFyu4fQ?=
 =?iso-8859-1?Q?10aoaWLjMQIkl9o+xWaRzZAez36WdlWRLiSZ97fv8GjxS202auFXqMvQ5V?=
 =?iso-8859-1?Q?UVHBlx67P7VUZL9D0L428xabEWP1I9iSh8o/S70okKUVEh7zIh30WbWzom?=
 =?iso-8859-1?Q?RDxItdtMnf8vHju+FsWjyRYkaNaYrtuFNrKyLBJ0KVzpsOlorM+IsthmpF?=
 =?iso-8859-1?Q?VYshOkXWJt49ik1VJ/RXr/jtBjTIWQ2GWtYremdxTSXh/XuwZwiJPRP/xm?=
 =?iso-8859-1?Q?vsThn3X5fu0K/mgF/5nNX0OvHTzgLwySptWCbGE2DcTO1GKd4jEu22witq?=
 =?iso-8859-1?Q?bFZwUbaGZ5aALGodhwhiquTima1kqR1nXcsTGdToeVgt+sptZTtTuiEZLd?=
 =?iso-8859-1?Q?Hge1tZKhml5qEjMNlk2rbZzEwGCoI6KA7ZzZfRbcS6zGzy41GfzWJ7aRST?=
 =?iso-8859-1?Q?IoNSxLTvtBmKV/oco5D8eQamJp8XMJKq0ffZxyyPftuQd21SR0+H/l4rLn?=
 =?iso-8859-1?Q?HX9aB7uNa2YuC7uY8eLgjnPa1TtcpvivCk29Yhunlayx3H70+Q/vLBojry?=
 =?iso-8859-1?Q?QKPCUqKGCvw6q4eT8LcILgbGlAPXwLliDEW57JKo5Xt9HoR61UimJiWhTD?=
 =?iso-8859-1?Q?REoBSf9dC+OlFZi3toemLd27dF6kXDOvCTBCWdQ8e3gnXyUEO5r748M64d?=
 =?iso-8859-1?Q?Fp4WhCpH1kZ7Xwjw8ctNAl2EtC2J8R3m8tqZSdXCs/8b+OxrrkeZk+q5py?=
 =?iso-8859-1?Q?xJqAeH1dM9T5F5nZ0/dkLJqRnBoRAhNmeI5Rn5lHd0GavnnSPLFU6B7GWR?=
 =?iso-8859-1?Q?RvSpIzFWWNgmj2maXEneaSh6hBpNcSboqk0q13NgdFQyvvnyKA8fT4ZGGN?=
 =?iso-8859-1?Q?9gEV3HB6/dwljhEaSwfRO/71QcljVdMjZVdQgs9RLU+hntiBanr+l1ia/B?=
 =?iso-8859-1?Q?Lf8Loc43eqd5xmsU+yg8nsuBhw4Mr1ETJuia9ZARGOENKeKNIRQwOj3mm7?=
 =?iso-8859-1?Q?Oiqfm61r4O+NsWZ5wd2g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB650281D042CE685F4BDB022DCD0EADM4PR11MB6502namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e8f36.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6502.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ffe5e4-f62d-422a-090e-08db95b5047d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2023 13:08:09.9548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
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

--_000_DM4PR11MB650281D042CE685F4BDB022DCD0EADM4PR11MB6502namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

"you will get there only devices that actually have I2C EEPROMs with FRU
data written."

Hi, Andrei,
I tried to port ethanolx to my board. It uses YAML to set the FRU informati=
on. But I can not see the list, either in dbus entity manager, or ipmitool =
fru list. I traced back the mail list and get an old thread.

My question:

  1.  Do I need to add information to the EEPROM to make dbus contain Fru? =
If yes, how is the fru.bin generated?
  2.  Do I need to porting ipmi-intel-oem to make "ipmitool fru list" conta=
in fru?

Thanks.

Zheng



________________________________
From: openbmc <openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org> on =
behalf of Andrei Kartashev <a.kartashev@yadro.com>
Sent: Wednesday, September 9, 2020 8:31 AM
To: Jiandi An <jan@nvidia.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC - FRU inventory with Entity Manager


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
> https://github.com/openbmc/entity-manager/blob/master/docs/my_first_senso=
rs.md
> https://github.com/openbmc/entity-manager/blob/master/README.md
>
> For example for sensors with entity manager do we still need the IPMI
> YAML
> configuration file described here?
> https://github.com/openbmc/docs/blob/master/architecture/sensor-architect=
ure.md#defining-sensors-in-an-ipmi-yaml-configuration-file
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/sensor=
-example.yaml
>
> For FRUs, for example do we still need
> https://github.com/ibm-openbmc/openbmc/blob/OP940/meta-ibm/meta-romulus/r=
ecipes-phosphor/configuration/romulus-yaml-config/romulus-ipmi-fru.yaml
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
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/fru_ge=
n.py
> always
> taking
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/fru-re=
ad-example.yaml
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
> https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands=
.cpp#L1311
> https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands=
.cpp#L361
>
> So switched to fb-ipmi-oem's implementation which doesn't do the
> replaceCacheFru with
> the async handler.
> https://github.com/openbmc/fb-ipmi-oem/blob/master/src/storagecommands.cp=
p#L185
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



--_000_DM4PR11MB650281D042CE685F4BDB022DCD0EADM4PR11MB6502namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 14.6667px; display: inline !important; =
background-color: rgb(255, 255, 255);" class=3D"ContentPasted0">&quot;you&n=
bsp;</span><span style=3D"font-family: &quot;Segoe UI Web (West European)&q=
uot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quo=
t;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; display: inline !=
important; background-color: rgb(255, 255, 255);" class=3D"ContentPasted0">=
will
 get there only devices that actually have I2C EEPROMs with FRU</span><br s=
tyle=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot;Segoe =
UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&q=
uot;, sans-serif; font-size: 14.6667px; background-color: rgb(255, 255, 255=
);" class=3D"ContentPasted0">
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 14.6667px; display: inline !important; =
background-color: rgb(255, 255, 255);" class=3D"ContentPasted0">data
 written.&quot;</span><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 14.6667px; display: inline !important; =
background-color: rgb(255, 255, 255);" class=3D"ContentPasted0"><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 14.6667px; display: inline !important; =
background-color: rgb(255, 255, 255);" class=3D"ContentPasted0"><span style=
=3D"display: inline !important; background-color: rgb(255, 255, 255);" clas=
s=3D"ContentPasted1">Hi,
 Andrei,</span><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 14.6667px; display: inline !important; =
background-color: rgb(255, 255, 255);" class=3D"ContentPasted0">I
 tried to port ethanolx to my board. It uses YAML to set the FRU informatio=
n. But I can not see the list, either in dbus entity manager, or ipmitool f=
ru list. I traced back the mail list and get an old thread.</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
My question:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<ol data-editing-info=3D"{&quot;orderedStyleType&quot;:1,&quot;unorderedSty=
leType&quot;:1}" data-listchain=3D"__List_Chain_69">
<li style=3D"list-style-type: &quot;1. &quot;;"><span>Do I need to add info=
rmation to the EEPROM to make dbus contain Fru? If yes, how is the fru.bin =
generated?&nbsp;</span></li><li style=3D"list-style-type: &quot;2. &quot;;"=
>Do I need to porting ipmi-intel-oem to make &quot;ipmitool fru list&quot; =
contain fru?</li></ol>
<div>Thanks.</div>
<div><br>
</div>
<div>Zheng</div>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 14.6667px; display: inline !important; =
background-color: rgb(255, 255, 255);" class=3D"ContentPasted0"><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 14.6667px; display: inline !important; =
background-color: rgb(255, 255, 255);" class=3D"ContentPasted0"></span></di=
v>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 14.6667px; display: inline !important; =
background-color: rgb(255, 255, 255);" class=3D"ContentPasted0"><br>
</span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> openbmc &lt;open=
bmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org&gt; on behalf of Andrei=
 Kartashev &lt;a.kartashev@yadro.com&gt;<br>
<b>Sent:</b> Wednesday, September 9, 2020 8:31 AM<br>
<b>To:</b> Jiandi An &lt;jan@nvidia.com&gt;<br>
<b>Cc:</b> OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Re: OpenBMC - FRU inventory with Entity Manager</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText"><br>
&gt; &gt; <br>
&gt; &gt; At least it'll be there for the next person.<br>
&gt; <br>
&gt; Line 72 of the doc says the 3rd component to entity-manager is the<br>
&gt; reactor.<br>
&gt; It mentions one example is dbus-sensors, which contains a suite of<br>
&gt; application that<br>
&gt; input the Exposes records for sensor devices, then connect to the<br>
&gt; filesystem to create<br>
&gt; the sensors and scan loops to scan sensors for those devices.<br>
&gt; <br>
&gt; Could someone point a sample code that a platform is doing the flow<br=
>
&gt; described above?<br>
&gt; <br>
&gt; For example after enable entity-manager and put in the device tree<br>
&gt; for temp sensors<br>
&gt; and FRU EEPROM devices, and the Exposes, probe config blocks in the<br=
>
&gt; json file, still<br>
&gt; struggling to get ipmitool sensor list and ipmitool fru to<br>
&gt; work.&nbsp; &quot;ipmitool fru&quot; issue is<br>
&gt; clear based on the feedback in this thread.&nbsp; But really want to h=
ave<br>
&gt; a tutorial or code<br>
&gt; example to walk through to understand the reactor side of things.<br>
&gt; <br>
<br>
This reactors are just a services that are expected to read their<br>
configuration from dbus. EM expose something to dbus and then these<br>
services are read what they need.<br>
<br>
&gt; &gt; &gt; Another thing I would like to have is even more high- level<=
br>
&gt; &gt; &gt; document <br>
&gt; &gt; &gt; describing the common architecture of EM-based inventory.<br=
>
&gt; &gt; &gt; I can start with some drafts of what I dig, to make it more<=
br>
&gt; &gt; &gt; clear.<br>
&gt; <br>
&gt; Really appreciate for this type of document if they are<br>
&gt; available.&nbsp; We are adopting<br>
&gt; entity-manager in our proof-of-concept project but really struggling<b=
r>
&gt; to find detailed<br>
&gt; documentation and end up just copying and pasting existing entity<br>
&gt; manager json<br>
&gt; config files and tweaking them.<br>
&gt; The two links we follow kind of as bibles for entity manager doesn't<b=
r>
&gt; provide a detail guide<br>
&gt; for example in the json config file, what each field means and how<br>
&gt; that field is being<br>
&gt; consumed, causes what to be created on the d-bus side, and being<br>
&gt; consumed by what reactor.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/openbmc/entity-manager/blob/master/docs/=
my_first_sensors.md" data-auth=3D"NotApplicable">
https://github.com/openbmc/entity-manager/blob/master/docs/my_first_sensors=
.md</a><br>
&gt; <a href=3D"https://github.com/openbmc/entity-manager/blob/master/READM=
E.md" data-auth=3D"NotApplicable">
https://github.com/openbmc/entity-manager/blob/master/README.md</a><br>
&gt; <br>
&gt; For example for sensors with entity manager do we still need the IPMI<=
br>
&gt; YAML<br>
&gt; configuration file described here?<br>
&gt; <a href=3D"https://github.com/openbmc/docs/blob/master/architecture/se=
nsor-architecture.md#defining-sensors-in-an-ipmi-yaml-configuration-file" d=
ata-auth=3D"NotApplicable">
https://github.com/openbmc/docs/blob/master/architecture/sensor-architectur=
e.md#defining-sensors-in-an-ipmi-yaml-configuration-file</a><br>
&gt; <a href=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/master/=
scripts/sensor-example.yaml" data-auth=3D"NotApplicable">
https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/sensor-e=
xample.yaml</a><br>
&gt; <br>
&gt; For FRUs, for example do we still need <br>
&gt; <a href=3D"https://github.com/ibm-openbmc/openbmc/blob/OP940/meta-ibm/=
meta-romulus/recipes-phosphor/configuration/romulus-yaml-config/romulus-ipm=
i-fru.yaml" data-auth=3D"NotApplicable">
https://github.com/ibm-openbmc/openbmc/blob/OP940/meta-ibm/meta-romulus/rec=
ipes-phosphor/configuration/romulus-yaml-config/romulus-ipmi-fru.yaml</a><b=
r>
&gt;&nbsp; <br>
&gt; Because I found out when doing &quot;ipmitool fru&quot; it always goes=
 off of<br>
&gt; the default Builtin FRU Device ID 0, dimm0 ID1, dimm1 ID2, cpu0 ID 3,<=
br>
&gt; and cpu1 ID 4.&nbsp; <br>
&gt; $ ipmitool -I lanplus -H $BMC_IP -U root -P 0penBmc -C 17 fru<br>
&gt; FRU Device Description : Builtin FRU Device (ID 0)<br>
&gt;&nbsp; Device not present (Unspecified error)<br>
&gt; <br>
&gt; FRU Device Description : dimm0 (ID 1)<br>
&gt;&nbsp; Device not present (Unspecified error)<br>
&gt; <br>
&gt; FRU Device Description : dimm1 (ID 2)<br>
&gt;&nbsp; Device not present (Unspecified error)<br>
&gt; <br>
&gt; FRU Device Description : cpu0 (ID 3)<br>
&gt;&nbsp; Device not present (Unspecified error)<br>
&gt; <br>
&gt; FRU Device Description : cpu1 (ID 4)<br>
&gt;&nbsp; Device not present (Unspecified error)<br>
&gt; <br>
&gt; And that's because <br>
&gt; <a href=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/master/=
scripts/fru_gen.py" data-auth=3D"NotApplicable">
https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/fru_gen.=
py</a><br>
&gt; always<br>
&gt; taking <br>
&gt; <a href=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/master/=
scripts/fru-read-example.yaml" data-auth=3D"NotApplicable">
https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/fru-read=
-example.yaml</a><br>
&gt; from the as the default fru inventory yaml config.<br>
&gt; unless custom fru yaml like the above is specified.<br>
&gt; <br>
&gt; Even after porting over intel-ipmi-oem or fb-ipmi-oem's oem command<br=
>
&gt; fru handler for entity manager,<br>
&gt; still has the above behavior when doing &quot;ipmitool fru&quot;.&nbsp=
; Just really<br>
&gt; trying to look for a high level flow<br>
&gt; of the reactor side under entity manager, sensor and fru to begin<br>
&gt; with.<br>
&gt; <br>
&gt; In porting intel-ipmi-oem's fru command handler for entity-manager,<br=
>
&gt; first phosphor-ipmid-host.service<br>
&gt; would coredump.&nbsp; Debugged it to be the startMatch() in<br>
&gt; registerStorageFunctions() where it's calling<br>
&gt; boost::asio::spawn with replaceCacheFru()<br>
&gt; <a href=3D"https://github.com/openbmc/intel-ipmi-oem/blob/master/src/s=
toragecommands.cpp#L1311" data-auth=3D"NotApplicable">
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.c=
pp#L1311</a><br>
&gt; <a href=3D"https://github.com/openbmc/intel-ipmi-oem/blob/master/src/s=
toragecommands.cpp#L361" data-auth=3D"NotApplicable">
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.c=
pp#L361</a><br>
&gt; <br>
&gt; So switched to fb-ipmi-oem's implementation which doesn't do the<br>
&gt; replaceCacheFru with<br>
&gt; the async handler.<br>
&gt; <a href=3D"https://github.com/openbmc/fb-ipmi-oem/blob/master/src/stor=
agecommands.cpp#L185" data-auth=3D"NotApplicable">
https://github.com/openbmc/fb-ipmi-oem/blob/master/src/storagecommands.cpp#=
L185</a><br>
&gt; But still &quot;ipmi fru&quot; would still display the default Builtin=
 FRU<br>
&gt; Device ID 0, dimm0 ID1, dimm1 ID2, cpu0 ID 3, and cpu1 ID 4. <br>
&gt; <br>
&gt; So I guess need to go back and really understand the reactor side<br>
&gt; under entity-manager<br>
&gt; and how the d-bus objects are created by the entity-manager and how<br=
>
&gt; they are consumed<br>
&gt; by the reactors for each components (sensors, fru, etc.)&nbsp; Any<br>
&gt; documentation on that will be so<br>
&gt; helpful as a new adopter of entity-manager trying to dig in on what<br=
>
&gt; different pieces need to line<br>
&gt; up when switching to entity-manager.<br>
<br>
<br>
You don't need any YAML files when you use EM. However to get ipmitool<br>
fru list to work you need to replace ipmi command handlers by that from<br>
intel-ipmi-oem. If you have output like you show, then you probably<br>
make something wrong and you still have default handlers from phosphor-<br>
ipmid-host.<br>
Reactors are not related to what you see in fru list. They will<br>
construct sensors list, setup some parts of the system and so on, but<br>
fru list in the new model is only defined by FruDevice service: you<br>
will get there only devices that actually have I2C EEPROMs with FRU<br>
data written.<br>
<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB650281D042CE685F4BDB022DCD0EADM4PR11MB6502namp_--
