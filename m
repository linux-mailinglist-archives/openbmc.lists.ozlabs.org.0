Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B212C90730
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 19:47:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699kW1cwHzDr6q
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 03:47:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.208; helo=mail1.bemta23.messagelabs.com;
 envelope-from=hsung1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698WH4GnkzDqtv
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 02:52:25 +1000 (AEST)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-d.us-east-1.aws.symcld.net id 29/21-14628-74FD65D5;
 Fri, 16 Aug 2019 16:52:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRWlGSWpSXmKPExsWS8eIhj677/bB
 Yg1kvWCwO7/C0ONXygsWByWPxnpdMHudnLGQMYIpizcxLyq9IYM3Y1nGKseCYSMWGV53MDYxf
 +LsYuTiEBBqYJFrPT2KDcF4zSmy4NI8dwtnHKNG0dztTFyMnB5uAqsSWZ09YQGwRgWiJOVtXg
 tnCAhYS1zetYoWIW0qsXLKTHcK2kni26i6QzcHBAtR7aGcuSJgXqGTX+7tsILaQQLbEgQVNYO
 M5BWwlfm18ChZnFJCVeLLgGVicWUBc4tzFVrCREgICEkv2nGeGsEUlXj7+xwphK0g073nNAlG
 vI7Fg9yc2CFtbYtnC18wQewUlTs58wjKBUWQWkrGzkLTMQtIyC0nLAkaWVYxmSUWZ6RkluYmZ
 ObqGBga6hoZGupa6RsameolVuil6pcW6qYnFJbqGeonlxXrFlbnJOSl6eaklmxiBcZRSwPl6B
 +P/mW/0DjFKcjApifKWTw2OFeJLyk+pzEgszogvKs1JLT7EKMPBoSTB++ZuWKyQYFFqempFWm
 YOMKZh0hIcPEoivOvvAaV5iwsSc4sz0yFSpxgtOSa8nLuImePg0XlA8vJ1ICnEkpeflyolznv
 vDlCDAEhDRmke3DhY2rnEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3Fshansy8Eritr4AO
 YgI6yPJcKMhBJYkIKakGJnZ/RdtA9SNtP6+62AQk1e7ePKnLbHr3vqhUn+2M/x1LAx3nbN2ZZ
 hIUuv/03HTrjmnHkvYxtf9eX3j8BvO9z/fevsz7mPd01+eZHUuXbJ+RrXv1uOnTh7Hzo7ys94
 n/OfFZJPJ885fMq+XRiyqv/3lgoD9BbzlPVEXdX+/Gqur7koJthnrZls6mq2U/Ox0SP/PhzRH
 mDaK7tYNvdaebOJxy/MJcFPuu4krXt/lLz25byXzL3lqN61vaa2k/m8NCclc41Fbzis5TuijS
 K3PvzKwYad2VRVvcWBamfC5QPrux06gjed9yu8PMp4/rPhdbvXS1irXYm8uc1W6L2Jm3hL0K7
 q4SnnaAX7loUtLrT0osxRmJhlrMRcWJAAs3+e62AwAA
X-Env-Sender: hsung1@lenovo.com
X-Msg-Ref: server-22.tower-426.messagelabs.com!1565974342!1318271!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17401 invoked from network); 16 Aug 2019 16:52:23 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-22.tower-426.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Aug 2019 16:52:23 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 41C5119029DCCC61195C;
 Fri, 16 Aug 2019 12:52:22 -0400 (EDT)
Received: from HKGWPEMAIL03.lenovo.com (10.128.3.71) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Sat, 17 Aug 2019 00:52:20 +0800
Received: from HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903]) by
 HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903%6]) with mapi id
 15.01.1591.008; Sat, 17 Aug 2019 00:52:09 +0800
From: Harry Sung1 <hsung1@lenovo.com>
To: Ed Tanous <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [External]  Re: ipmitool FRU write question
Thread-Topic: [External]  Re: ipmitool FRU write question
Thread-Index: AdVTbopZKRwneAIkR/qkHv41VIuS6///l9oA//3TzXA=
Date: Fri, 16 Aug 2019 16:52:09 +0000
Message-ID: <6ca6d992e4a248828063ff9f6a8e6c87@lenovo.com>
References: <4a91e18f7195458193f673c26986421a@lenovo.com>
 <e9ba404c-a35e-1c46-2a0c-a4fd971312a6@intel.com>
In-Reply-To: <e9ba404c-a35e-1c46-2a0c-a4fd971312a6@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On 8/15/19 6:49 AM, Harry Sung1 wrote:
> > Hi Team,
> >
> >
> >
> > Current phosphor-host-ipmid does not support fru write command, but
> > ipmi-fru-parser supports it.
> >
> > We found this fru write command only update the data to dbus
> > inventory, but doesn't sync the data back to the EEPROM.
> >
> > Does ipmi-fru-parser has any plans to implement it? I think it is more
> > make sense to sync the data to EEPROM when we do fru write.
>=20
> The alternative FRU daemon from entity manager, FruDevice, supports writi=
ng
> the FRU directly.
> https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp
>=20
> Happy to see this capability added to ipmi-fru-parser, but you might be a=
ble to
> model it off FruDevice.  If you want to use FruDevice as-is, you will nee=
d the
> alternative FruWrite command sets from here.
>=20
> https://github.com/openbmc/intel-ipmi-oem/blob/159547cdfbf1992737dcecb
> cb3888af7795f930b/src/storagecommands.cpp#L316
>=20
> As written, those commands change the behavior a bit, and double buffers =
the
> FRU write commands.  When the last Fru write is sent, the data is flushed
> through the FRU parser to ensure that it's valid, and the user isn't doin=
g
> anything nefarious (like changing a product name or serial
> number) before it writes the EEPROM in one chunk, as quickly as it can to
> reduce the possibility of a half written EEPROM.

Hi Ed,

Thanks for your kindly reply! I have surveyed the entity-manager before.
But I encountered an issue when I using phosphor-inventory-manager and enti=
ty-manager at the same time.
Both of them have same method "Notify" under same interface " xyz.openbmc_p=
roject.Inventory.Manager ", but different signature.

phosphor-inventory-manager:
NAME                                  TYPE    SIGNATURE   RESULT/VALUE   FL=
AGS
xyz.openbmc_project.Inventory.Manager interface -             -            =
 -
.Notify                               method    a{oa{sa{sv}}} -            =
 -

entity-manager
NAME                                  TYPE    SIGNATURE   RESULT/VALUE   FL=
AGS
xyz.openbmc_project.Inventory.Manager interface -         -            -
.Notify                               method    a{sa{sv}} -            -

So when some services call the 'Notify' method failed because of getting wr=
ong service.=20
Ex: https://github.com/openbmc/ipmi-fru-parser/blob/master/writefrudata.cpp=
#L206
Have you ever seen this issue before?

Should I use intel-dbus-interfaces if I want to use Frudevice (entity-manag=
er) and write FRU command(intel-ipmi-oem)?
Or it is compatible with original dbus-interface?

Thanks,
Harry
