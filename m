Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706E424E3D
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 09:45:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ3K00bvCz2ypR
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 18:45:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=fE1/VCBj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.90;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=naveen.moses@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=fE1/VCBj; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255090.outbound.protection.outlook.com [40.92.255.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ3JR5qzPz2yKB
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 18:45:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lN5dZYh7we8SV4QKL/o/PD4PNGZJgJpFhfVjJvYIHaTOvVEcoJgCSsg1cbqUbvkroleSVc7ZZF5EXhB17SuUUOa2cOjN4xmSFIDUl6NpVmHJ4q8/BKsDYmU6nHErWSI4GZAlobXCHFUtmrPsBob1Hy06uUrtMQNxHWDV44BYXbBnnFPr9DBFB3zzGjjyZH/9XpGISL+35ZtR7gYBiAkp/dwcM8InULTp3lF9mUn3REZ11cNEnRLiTx04LxDsKFMnVR/Q/qeA1P/UwG9tWKz9p3qYdAnQcPgcCbqQQXQuxAF5FpaianAg6PVmwHe5uTPmcqUXYfDQM48DnH4j3OSe3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPjGJOqGM33IJhFuGKrHqz0zHfjzPqX8FhywLz9AGJM=;
 b=AyRJ+VZyXnMU9i0qdRk7pkMtioUlXUhKg6u2F1B5UtKQTFS8wCbba0sS6C9Z2xHwECaKCz8QhtvTMQID5VxBEPsnslswiz9d3+Y/rFj6lXIVUERM2BpczdRbZ9w4wBIZd6MZizVKM1PcS5BnQuPhoNKTTtUq0xMpDTnvHfc7jwVMcWMLOJVQUnZ7Io+NA5wB3k/Vqfnx/Cwl5KxY6pXutfHZnNvMexKhFzfYvARpI3pyDAg971Ri0LlER5DQONk0zFXNgqzwErK+RTC1TV2Rnk56XeApGQOKaVv0MewD95A6GM/4XZH6WyEZktspLMHBTwOq86ySkdYo6wYBnQMopQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPjGJOqGM33IJhFuGKrHqz0zHfjzPqX8FhywLz9AGJM=;
 b=fE1/VCBj6hnhynAQtzZ0uFpU2JC6IPJZN62WpqVnHcR/TlWvXDd0MwG1QJgW2OekjsPGdw1UoIuRkalCV3yP4m16ZCWbvt/zixsYqrY48xg8JKJBbby19anj+HZ7j7cxV7v53Kel75IcjWeaxCes9vDfxBhbtKuRmWEmgS7jqhFp+8gn+NjnB+7i1f0MV6G14/n4NkPnfZMhM51ho19vp8x32NnqkXNnLRJKJruBDrjPIlmK4MI9nOWLGYEajMv3fTLIrtNu8ssPKpv9ySoo9avij6vNLvM1irOEbwbIMOkR34S7PW7xNcseRF01fyHpCAsdB25Uqq373tzkmOQ3tA==
Received: from PS2PR02MB2695.apcprd02.prod.outlook.com (2603:1096:300:49::20)
 by PSAPR02MB4551.apcprd02.prod.outlook.com (2603:1096:301:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 07:45:00 +0000
Received: from PS2PR02MB2695.apcprd02.prod.outlook.com
 ([fe80::df6:eb23:2b3f:8548]) by PS2PR02MB2695.apcprd02.prod.outlook.com
 ([fe80::df6:eb23:2b3f:8548%3]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 07:45:00 +0000
From: naveen moses <naveen.moses@outlook.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: support for gpio  as ipmb sensor 
Thread-Topic: support for gpio  as ipmb sensor 
Thread-Index: AQHXubK5qcPh3V4zuk+6NBNR0ABXM6vFG3gAgAHx462AAB1eNQ==
Date: Thu, 7 Oct 2021 07:45:00 +0000
Message-ID: <PS2PR02MB26955C60FF82D23E95A8281291B19@PS2PR02MB2695.apcprd02.prod.outlook.com>
References: <PS2PR02MB26959672C7002D26EB5F4A4691AF9@PS2PR02MB2695.apcprd02.prod.outlook.com>
 <ef4d5ac6-49e8-40d6-9e6b-1fe030f3909a@www.fastmail.com>
 <PS2PR02MB2695DA8CBF0598991A64D7B691B19@PS2PR02MB2695.apcprd02.prod.outlook.com>
In-Reply-To: <PS2PR02MB2695DA8CBF0598991A64D7B691B19@PS2PR02MB2695.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: f596c5fd-6afe-c1af-08ec-78280d8603c1
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [RFvD7oT3GSqjpUptA5oZY7qs1dxcJyL6wBq4VKWgNpmHnGeAEUswEA==]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17bc646d-567d-421f-332d-08d989665e10
x-ms-traffictypediagnostic: PSAPR02MB4551:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: egAeeWlcSdEkRCcBME794wzxt6XYqJI4KzShL5i/r0FLSHFpe/1yhmCon+L7M4qC4N0fND7EccjfUx3pDzEcPxRzLOuveqNilSPr/9LAT99QobFFYNCdZzqEEVe1QkcLamRkeNdrkhjsjLkVt+ZCpWJH2TUecfyoEM3/g3/fwmtJEKlrKGPdz/IAj64OD9AWFunTHwy//gF6r5tEJ0vK778NoHHA0ysLe0LcS4rZyKUa6376FNydtTxDVVVYSh6kqb/Cz1joTlyKIjZJK25O0C/zKXW8XIKlx85mi4Bptaj1CiJN0GmHF1EuYEVAox7SbX+bhdHN2b8EQMyfeD/WLgCpqWa8fTgldnAzGb2etXrQoaApwj+uogGeHodsa0h74POY+RAL+r3jZNmJRDz7rnK4RE1HV+nqpBzlyMkc9uEkDNwdklEiMDHbTtGbKo2a
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: qkbkWXqzPnt5UD+M0ltMQiuWjeeTshnT2pvpRbIhsHkP8KLzQ2/n3DKOfNBlHRqQgdgCw0zuXc1asVu5wCL/MOaaPF8Szz0HJQuis3gCpOrKPPySLfbvK2tJ9GOFIeVBdplxzEixEHxNHqNIWMNa0E2lwHU8qANzbxSUf/hfSjHxga16YvojrJzbmznduJuB
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PS2PR02MB26955C60FF82D23E95A8281291B19PS2PR02MB2695apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB2695.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bc646d-567d-421f-332d-08d989665e10
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2021 07:45:00.5816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR02MB4551
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
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PS2PR02MB26955C60FF82D23E95A8281291B19PS2PR02MB2695apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


________________________________
From: naveen moses <naveen.moses@hotmail.com>
Sent: Thursday, October 7, 2021 11:42 AM
To: Andrew Jeffery <andrew@aj.id.au>; openbmc@lists.ozlabs.org <openbmc@lis=
ts.ozlabs.org>
Cc: Zhikui Ren <zhikui.ren@intel.com>; Jae Hyun Yoo <jae.hyun.yoo@linux.int=
el.com>; Vernon Mauery <vernon.mauery@linux.intel.com>; Ed Tanous <ed@tanou=
s.net>; naveen moses <naveen.moses@outlook.com>
Subject: Re: support for gpio as ipmb sensor

Hi Andrew,

Thanks for the suggestions. please find my comments below:

What do you mean when you say "cannot be directly monitored using gpio
monitor"?

Naveen : The gpio is connected via ipmb bridge interface so to read its sta=
te it should be done via ipmb call.
so, it cannot be specified as direct gpio config to be read by gpio-monitor=
 process.

What about modelling the behaviour the GPIO state represents rather
than just providing a DBus interface to the GPIO values?

Naveen : The gpio behavior is done in separate process and there is a separ=
ate process which is depends on the gpio state.
Here the implementation is not for a specific gpio. there are 10 to 30 simi=
liar gpios
which can be only accessed via ipmb bridge interface.  The ipmb gpio sensor=
 we are proposing
could be for multiple number ipmb based gpios. The states of the individual=
 ipmb gpios are monitored if they are configured in entity manager as gpio =
sensors.
their state is updated as sensor state property which can be read by other =
dependent properties.

Thanks,
Naveen
________________________________
From: Andrew Jeffery <andrew@aj.id.au>
Sent: Wednesday, October 6, 2021 5:46 AM
To: naveen moses <naveen.moses@hotmail.com>; openbmc@lists.ozlabs.org <open=
bmc@lists.ozlabs.org>
Cc: Zhikui Ren <zhikui.ren@intel.com>; Jae Hyun Yoo <jae.hyun.yoo@linux.int=
el.com>; Vernon Mauery <vernon.mauery@linux.intel.com>; Ed Tanous <ed@tanou=
s.net>; naveen moses <naveen.moses@outlook.com>
Subject: Re: support for gpio as ipmb sensor

Hi Naveen,

On Tue, 5 Oct 2021, at 23:46, naveen moses wrote:
> Hi All,
>
> we have a couple of gpios ( input ) accessed via ipmb commands in our pla=
tform.
> which cannot be directly monitored using gpio monitor.

What do you mean when you say "cannot be directly monitored using gpio
monitor"?

>
> our idea is to expose them as ipmb sensors which has gpio state as
> property which is updated based
> on the current state of the gpio.
>
> at present there is no compatible interface under
> xyz/openbmc_project/sensors for gpio as sensor.
>
> So is this acceptable to create a new interface for gpio state under
> xyz/openbmc_project/sensors :
> interface name : gpioState
> which has a property named value whose possible values are boolean
> (true or false).

What about modelling the behaviour the GPIO state represents rather
than just providing a DBus interface to the GPIO values?

Andrew

--_000_PS2PR02MB26955C60FF82D23E95A8281291B19PS2PR02MB2695apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> naveen moses &lt;nave=
en.moses@hotmail.com&gt;<br>
<b>Sent:</b> Thursday, October 7, 2021 11:42 AM<br>
<b>To:</b> Andrew Jeffery &lt;andrew@aj.id.au&gt;; openbmc@lists.ozlabs.org=
 &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Cc:</b> Zhikui Ren &lt;zhikui.ren@intel.com&gt;; Jae Hyun Yoo &lt;jae.hy=
un.yoo@linux.intel.com&gt;; Vernon Mauery &lt;vernon.mauery@linux.intel.com=
&gt;; Ed Tanous &lt;ed@tanous.net&gt;; naveen moses &lt;naveen.moses@outloo=
k.com&gt;<br>
<b>Subject:</b> Re: support for gpio as ipmb sensor </font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
Hi Andrew,</div>
<div id=3D"x_appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
Thanks for the suggestions. please find my comments below:</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">What do you mean when you say &quot;cannot be directl=
y monitored using gpio</span><br>
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">monitor&quot;?</span><br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">&nbsp;</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">Naveen : The gpio is connected via ipmb bridge interf=
ace so to read its state it should be done via ipmb call.</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">so, it cannot be specified as direct gpio config to b=
e read by gpio-monitor process.</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important"><span style=3D"background-color:rgb(255,255,255); dis=
play:inline!important">What about modelling the behaviour the GPIO state re=
presents rather</span><br>
<span style=3D"background-color:rgb(255,255,255); display:inline!important"=
>than just providing a DBus interface to the GPIO values?</span><br>
</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important"><br>
</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">Naveen : The gpio behavior is done in separate proces=
s and there is a separate process which is depends on the gpio state.</span=
></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">Here the implementation is not for a specific gpio. t=
here are 10 to 30 similiar gpios</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">which can be only accessed via ipmb bridge interface.=
&nbsp; The ipmb gpio sensor we are proposing</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">could be for multiple number ipmb based gpios. The st=
ates of the individual ipmb gpios are monitored if they are configured in e=
ntity manager as gpio sensors.</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">their state is updated as sensor state property which=
 can be read&nbsp;</span><span style=3D"font-size:14.6667px">by other depen=
dent properties.</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">&nbsp;&nbsp;</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">Thanks,
<div>Naveen</div>
</span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Andrew Jeffery &lt;=
andrew@aj.id.au&gt;<br>
<b>Sent:</b> Wednesday, October 6, 2021 5:46 AM<br>
<b>To:</b> naveen moses &lt;naveen.moses@hotmail.com&gt;; openbmc@lists.ozl=
abs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Cc:</b> Zhikui Ren &lt;zhikui.ren@intel.com&gt;; Jae Hyun Yoo &lt;jae.hy=
un.yoo@linux.intel.com&gt;; Vernon Mauery &lt;vernon.mauery@linux.intel.com=
&gt;; Ed Tanous &lt;ed@tanous.net&gt;; naveen moses &lt;naveen.moses@outloo=
k.com&gt;<br>
<b>Subject:</b> Re: support for gpio as ipmb sensor </font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hi Naveen,<br>
<br>
On Tue, 5 Oct 2021, at 23:46, naveen moses wrote:<br>
&gt; Hi All,<br>
&gt;<br>
&gt; we have a couple of gpios ( input ) accessed via ipmb commands in our =
platform.<br>
&gt; which cannot be directly monitored using gpio monitor.<br>
<br>
What do you mean when you say &quot;cannot be directly monitored using gpio=
 <br>
monitor&quot;?<br>
<br>
&gt;<br>
&gt; our idea is to expose them as ipmb sensors which has gpio state as <br=
>
&gt; property which is updated based<br>
&gt; on the current state of the gpio.<br>
&gt;<br>
&gt; at present there is no compatible interface under <br>
&gt; xyz/openbmc_project/sensors for gpio as sensor.<br>
&gt;<br>
&gt; So is this acceptable to create a new interface for gpio state under <=
br>
&gt; xyz/openbmc_project/sensors :<br>
&gt; interface name : gpioState<br>
&gt; which has a property named value whose possible values are boolean <br=
>
&gt; (true or false).<br>
<br>
What about modelling the behaviour the GPIO state represents rather <br>
than just providing a DBus interface to the GPIO values?<br>
<br>
Andrew<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PS2PR02MB26955C60FF82D23E95A8281291B19PS2PR02MB2695apcp_--
