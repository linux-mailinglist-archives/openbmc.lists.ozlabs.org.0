Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C025921422
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 09:23:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4550CF24k2zDqSQ
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 17:23:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=2a01:111:f400:fe48::712;
 helo=nam03-co1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="SghPsUR8"; dkim-atps=neutral
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0712.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::712])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4550Bk6KJZzDqRJ
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 17:23:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=Boi/1Bw1xv3FpQDG5SujB4dzFqg8XU3lcd+VO18m9UV4JA4kPJLT5TG2w/PJl1Qa8QVfwrVVHIWjSosFrszP3z7reyhVJDkNenwmKNqKuPrzga+V49SWT0S++PA+Iv9gGZL/dIXpyZRmW00c+yKQFhXRoibjH9XWyMswqsiXCg4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEEC6trDQ1SOnSvW8NivrJOkzP0XQ/9ggsfNdYz/fJw=;
 b=AY24T9EYaRcFiQdCyNIZ+f82fXzOG83tA/AJgBeof6SVJzwHjLH3hROLQ2Y/TiuWByIIMUWxZi/1oSB14vu60G1sHy07wzuk1xzDor00F4YsuTAS0KTpQt1QiY2ofry1j7y8DyUfyjMrU9m/YpmoiotLdkUV/0hcwhr4uwQLAkg=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEEC6trDQ1SOnSvW8NivrJOkzP0XQ/9ggsfNdYz/fJw=;
 b=SghPsUR85es2W3W7H0Rzsak1rZuFyGOwZrvqkrOiLvU7/rObAX4c9emZttF82Vutmdr6eZK49cj2t7ME9APNlTwv/Zou9MaYxVPT37Fojf2tCdcj8RJhPLigqoPo4mvDapSk5Vj7y+wynMDaqi8mb+j1vl/FaAd9K0SsVvQwIpo=
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 (2603:10b6:207:30::20) by BL0PR2101MB1105.namprd21.prod.outlook.com
 (2603:10b6:207:37::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.1; Fri, 17 May
 2019 07:23:16 +0000
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::f18c:b668:2945:fa52]) by BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::f18c:b668:2945:fa52%8]) with mapi id 15.20.1922.002; Fri, 17 May 2019
 07:23:16 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: vishwa <vishwa@linux.vnet.ibm.com>, Kun Yi <kunyi@google.com>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
Subject: Re: BMC health metrics (again!)
Thread-Topic: BMC health metrics (again!)
Thread-Index: AQHU7vEKYehUNhkVjEqfOEm/VkCDfaZhDVMAgA39HXCAABj0gIAAAKtD
Date: Fri, 17 May 2019 07:23:16 +0000
Message-ID: <BL0PR2101MB0932823408EE75DB889F3C3DC80B0@BL0PR2101MB0932.namprd21.prod.outlook.com>
References: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
 <a28747c1-a6c5-65c9-87da-d8df0ce0b14e@linux.vnet.ibm.com>
 <BL0PR2101MB093237A6F0A48C7212BD1FE0C80B0@BL0PR2101MB0932.namprd21.prod.outlook.com>,
 <83b3990a-19c0-a0af-a28a-cedf8401bffb@linux.vnet.ibm.com>
In-Reply-To: <83b3990a-19c0-a0af-a28a-cedf8401bffb@linux.vnet.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14638f9f-250e-44ae-07bf-08d6da9887c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR2101MB1105; 
x-ms-traffictypediagnostic: BL0PR2101MB1105:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR2101MB11052EB9C9A58EE8937445B1C80B0@BL0PR2101MB1105.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(376002)(136003)(366004)(189003)(199004)(51914003)(81156014)(86362001)(86612001)(81166006)(52536014)(8936002)(7736002)(33656002)(110136005)(52396003)(8990500004)(316002)(10090500001)(22452003)(256004)(14444005)(76176011)(71190400001)(53546011)(71200400001)(6506007)(7696005)(790700001)(6116002)(3846002)(99286004)(74316002)(102836004)(5660300002)(606006)(64756008)(2906002)(8676002)(229853002)(66066001)(10290500003)(66446008)(66556008)(25786009)(478600001)(6436002)(476003)(9686003)(76116006)(66476007)(186003)(446003)(53936002)(68736007)(55016002)(236005)(73956011)(6306002)(6246003)(54896002)(486006)(91956017)(26005)(11346002)(14454004)(66946007)(53946003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB1105;
 H:BL0PR2101MB0932.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LDN9BTRLt0ua+w9u51f6VRdjwzXxeuFXbWJDV3lQ8LDSfPfXA3kioV2x7nzV6tWQnwwAn1gOYvJsIUxECabekxA1taYu6M8fwP0gTDOQhFdzqTEIG9PXaM5YmF5yw1EUm8o5mLJpVeRSyP78c0joY4P2GFSIC1Q7RqBxcGz7s6MQNOtP9s1ewWXhGBHmMWAr3yQdAeFfRjF1tX92XegO37BGwHGCg62yXN7Wh4skIvgWXtHy3xq1oP/OS8kqE1ogu1vMA+zUqjk7nK0yomcddqYLljGwvfAgIOfrtuLLlCiQU2ZbdtGdncRSsUJsaO0hrfx40ej1GmzYYQ6uBX32IRR4/77wP1eolyt9YbDVDNWmMnwf+NpntQM40/7wc12kFr4ev6Axzx3mgsuwD5WlePcGLY8+xFO5P4T7lS6+x1k=
Content-Type: multipart/alternative;
 boundary="_000_BL0PR2101MB0932823408EE75DB889F3C3DC80B0BL0PR2101MB0932_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14638f9f-250e-44ae-07bf-08d6da9887c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 07:23:16.5233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB1105
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

--_000_BL0PR2101MB0932823408EE75DB889F3C3DC80B0BL0PR2101MB0932_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sure thing. Is there an design document that exist for this feature ?

I can volunteer to drive this work group if we have quorum.

Neeraj

Get Outlook for Android<https://aka.ms/ghei36>

________________________________
From: vishwa <vishwa@linux.vnet.ibm.com>
Sent: Friday, May 17, 2019 12:17:51 AM
To: Neeraj Ladkani; Kun Yi; OpenBMC Maillist
Subject: Re: BMC health metrics (again!)


Neeraj,

Thanks for the inputs. It's nice to see us having a similar thought.

AFAIK, we don't have any work-group that is driving =93Platform telemetry a=
nd health monitoring=94. Also, do we want to see this as 2 different entiti=
es ?. In the past, there were thoughts about using websockets to channel so=
me of the thermal parameters as telemetry data. But then it was not impleme=
nted.

We can discuss here I think.

!! Vishwa !!

On 5/17/19 12:00 PM, Neeraj Ladkani wrote:
At cloud scale, telemetry and health monitoring is very critical. We should=
 define a framework that allows platform owners to add their own telemetry =
hooks. Telemetry service should be designed to make this data accessible an=
d store in resilient way (like blackbox during plane crash).

Is there any workgroup that drives this feature =93Platform telemetry and h=
ealth monitoring=94 ?

Wishlist

BMC telemetry :

  1.  Linux subsystem
     *   Uptime
     *   CPU Load average
     *   Memory info
     *   Storage usage ( RW )
     *   Dmesg
     *   Syslog
     *   FDs of critical processes
     *   Alignment traps
     *   WDT excursions
  2.  IPMI subsystem
     *   Request and Response logging par interface with timestamps ( KCS, =
LAN, USB)
     *   Request and Response of IPMB

                                                               i.      Requ=
est , Response, No of Retries

  1.  Misc

  1.  Critical Temperature Excursions

                                                               i.      Mini=
mum Reading of Sensor

                                                             ii.      Max R=
eading of a sensor

                                                           iii.      Count =
of state transition

                                                           iv.      Retry C=
ount

  1.  Count of assertions/deassertions of GPIO and ability to capture the s=
tate
  2.  timestamp of last assertion/deassertion of GPIO

Thanks
~Neeraj

From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org><mai=
lto:openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org> On Behalf Of v=
ishwa
Sent: Wednesday, May 8, 2019 1:11 AM
To: Kun Yi <kunyi@google.com><mailto:kunyi@google.com>; OpenBMC Maillist <o=
penbmc@lists.ozlabs.org><mailto:openbmc@lists.ozlabs.org>
Subject: Re: BMC health metrics (again!)


Hello Kun,

Thanks for initiating it. I liked the /proc parsing. On the IPMI thing, is =
it only targeted to IPMI -or- a generic BMC-Host communication kink ?

Some of the things in my wish-list are:

1/. Flash wear and tear detection and the threshold to be a config option
2/. Any SoC specific health checks ( If that is exposed )
3/. Mechanism to detect spurious interrupts on any HW link
4/. Some kind of check to see if there will be any I2C lock to a given end =
device
5/. Ability to detect errors on HW links

On the watchdog(8) area, I was just thinking these:

How about having some kind of BMC_health D-Bus properties -or- a compile ti=
me feed, whose values can be fed into a configuration file than watchdog us=
ing the default /etc/watchdog.conf always. If the properties are coming fro=
m a D-Bus, then we could either append to /etc/watchdog.conf -or- treat tho=
se values only as the config file that can be given to watchdog.
The systemd service files to be setup accordingly.

We have seen instances where we get an error that is indicating no resource=
s available. Those could be file descriptors / socket descriptors etc. A wa=
y to plug this into watchdog as part of test binary that checks for this ? =
We could hook a repair-binary to take the action.

Another thing that I was looking at hooking into watchdog is the test to se=
e the file system usage as defined by the policy.
Policy could mention the file system mounts and also the threshold.

For example, /tmp , /root etc.. We could again hook a repair binary to do s=
ome cleanup if needed

If we see the list is growing with these custom requirements, then probably=
 does not make sense to pollute the watchdog(2) but
have these consumed into the app instead ?

!! Vishwa !!
On 4/9/19 9:55 PM, Kun Yi wrote:
Hello there,

This topic has been brought up several times on the mailing list and offlin=
e, but in general seems we as a community didn't reach a consensus on what =
things would be the most valuable to monitor, and how to monitor them. Whil=
e it seems a general purposed monitoring infrastructure for OpenBMC is a ha=
rd problem, I have some simple ideas that I hope can provide immediate and =
direct benefits.

1. Monitoring host IPMI link reliability (host side)

The essentials I want are "IPMI commands sent" and "IPMI commands succeeded=
" counts over time. More metrics like response time would be helpful as wel=
l. The issue to address here: when some IPMI sensor readings are flaky, it =
would be really helpful to tell from IPMI command stats to determine whethe=
r it is a hardware issue, or IPMI issue. Moreover, it would be a very usefu=
l regression test metric for rolling out new BMC software.

Looking at the host IPMI side, there is some metrics exposed through /proc/=
ipmi/0/si_stats if ipmi_si driver is used, but I haven't dug into whether i=
t contains information mapping to the interrupts. Time to read the source c=
ode I guess.

Another idea would be to instrument caller libraries like the interfaces in=
 ipmitool, though I feel that approach is harder due to fragmentation of IP=
MI libraries.

2. Read and expose core BMC performance metrics from procfs

This is straightforward: have a smallish daemon (or bmc-state-manager) read=
,parse, and process procfs and put values on D-Bus. Core metrics I'm intere=
sted in getting through this way: load average, memory, disk used/available=
, net stats... The values can then simply be exported as IPMI sensors or Re=
dfish resource properties.

A nice byproduct of this effort would be a procfs parsing library. Since di=
fferent platforms would probably have different monitoring requirements and=
 procfs output format has no standard, I'm thinking the user would just pro=
vide a configuration file containing list of (procfs path, property regex, =
D-Bus property name), and the compile-time generated code to provide an obj=
ect for each property.

All of this is merely thoughts and nothing concrete. With that said, it wou=
ld be really great if you could provide some feedback such as "I want this,=
 but I really need that feature", or let me know it's all implemented alrea=
dy :)

If this seems valuable, after gathering more feedback of feature requiremen=
ts, I'm going to turn them into design docs and upload for review.

--
Regards,
Kun

--_000_BL0PR2101MB0932823408EE75DB889F3C3DC80B0BL0PR2101MB0932_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Sure thing. Is there an design document that exist for this feature ? <br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
I can volunteer to drive this work group if we have quorum.<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Neeraj <br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
<span id=3D"OutlookSignature">
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Get <a href=3D"https://aka.ms/ghei36">Outlook for Android</a></div>
</span><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> vishwa &lt;vishwa@lin=
ux.vnet.ibm.com&gt;<br>
<b>Sent:</b> Friday, May 17, 2019 12:17:51 AM<br>
<b>To:</b> Neeraj Ladkani; Kun Yi; OpenBMC Maillist<br>
<b>Subject:</b> Re: BMC health metrics (again!)</font>
<div>&nbsp;</div>
</div>
<div>
<p>Neeraj,</p>
<p>Thanks for the inputs. It's nice to see us having a similar thought.</p>
<p>AFAIK, we don't have any work-group that is driving <span style=3D"color=
:windowtext">
=93Platform telemetry and health monitoring=94. Also, do we want to see thi=
s as 2 different entities ?. In the past, there were thoughts about using w=
ebsockets to channel some of the thermal parameters as telemetry data. But =
then it was not implemented.</span></p>
<p><span style=3D"color:windowtext">We can discuss here I think.</span></p>
<p><span style=3D"color:windowtext">!! Vishwa !!<br>
</span></p>
<div class=3D"moz-cite-prefix">On 5/17/19 12:00 PM, Neeraj Ladkani wrote:<b=
r>
</div>
<blockquote type=3D"cite" cite=3D"mid:BL0PR2101MB093237A6F0A48C7212BD1FE0C8=
0B0@BL0PR2101MB0932.namprd21.prod.outlook.com">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:209733967;
	mso-list-type:hybrid;
	mso-list-template-ids:370437354 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:629939391;
	mso-list-type:hybrid;
	mso-list-template-ids:1528842280 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:680204859;
	mso-list-type:hybrid;
	mso-list-template-ids:-205626744 67698713 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l2:level1
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.0in;
	text-indent:-.25in;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.5in;
	text-indent:-.25in;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:2.0in;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.5in;
	text-indent:-.25in;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.0in;
	text-indent:-.25in;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.5in;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.0in;
	text-indent:-.25in;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.5in;
	text-indent:-.25in;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:5.0in;
	text-indent:-9.0pt;}
@list l3
	{mso-list-id:1127358141;
	mso-list-type:hybrid;
	mso-list-template-ids:293792440 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l3:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l3:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l3:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l4
	{mso-list-id:1620336591;
	mso-list-type:hybrid;
	mso-list-template-ids:-1154200314 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l4:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l4:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l4:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l5
	{mso-list-id:1909806149;
	mso-list-type:hybrid;
	mso-list-template-ids:375685314 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l5:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l5:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l5:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l6
	{mso-list-id:2005165080;
	mso-list-type:hybrid;
	mso-list-template-ids:99010748 177007434 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l6:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;}
@list l6:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;}
@list l6:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:1.75in;
	text-indent:-9.0pt;}
@list l6:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;}
@list l6:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;}
@list l6:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.25in;
	text-indent:-9.0pt;}
@list l6:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;}
@list l6:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;}
@list l6:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:4.75in;
	text-indent:-9.0pt;}
@list l7
	{mso-list-id:2022971887;
	mso-list-type:hybrid;
	mso-list-template-ids:1438651526 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l7:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l7:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l7:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:windowtext">At cloud scale, tel=
emetry and health monitoring is very critical. We should define a framework=
 that allows platform owners to add their own telemetry hooks. Telemetry se=
rvice should be designed to make this
 data accessible and store in resilient way (like blackbox during plane cra=
sh). &nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Is there any workgr=
oup that drives this feature =93Platform telemetry and health monitoring=94=
 ?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Wishlist<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">BMC telemetry : <o:=
p></o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"color:windowtext;margin-left:0in;ms=
o-list:l7 level1
            lfo5">
Linux subsystem<o:p></o:p></li><ol style=3D"margin-top:0in" start=3D"1" typ=
e=3D"a">
<li class=3D"MsoListParagraph" style=3D"color:windowtext;margin-left:0in;ms=
o-list:l7 level2
              lfo5">
Uptime<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"color:windowt=
ext;margin-left:0in;mso-list:l7 level2
              lfo5">
CPU Load average<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"col=
or:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
Memory info<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"color:wi=
ndowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
Storage usage ( RW ) &nbsp;<o:p></o:p></li><li class=3D"MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
Dmesg<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"color:windowte=
xt;margin-left:0in;mso-list:l7 level2
              lfo5">
Syslog <o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"color:window=
text;margin-left:0in;mso-list:l7 level2
              lfo5">
FDs of critical processes <o:p></o:p></li><li class=3D"MsoListParagraph" st=
yle=3D"color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
Alignment traps <o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"col=
or:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
WDT excursions <o:p></o:p></li></ol>
<li class=3D"MsoListParagraph" style=3D"color:windowtext;margin-left:0in;ms=
o-list:l7 level1
            lfo5">
IPMI subsystem<o:p></o:p></li><ol style=3D"margin-top:0in" start=3D"1" type=
=3D"a">
<li class=3D"MsoListParagraph" style=3D"color:windowtext;margin-left:0in;ms=
o-list:l7 level2
              lfo5">
Request and Response logging par interface with timestamps ( KCS, LAN, USB)=
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"color:windowtext;ma=
rgin-left:0in;mso-list:l7 level2
              lfo5">
Request and Response of IPMB<o:p></o:p></li></ol>
</ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.5in;text-indent:-1.5in=
;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
<!--[if !supportLists]--><span style=3D"color:windowtext"><span style=3D"ms=
o-list:Ignore"><span style=3D"font:7.0pt
                &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>i.<span style=3D"font:7.0pt &quot;Times New
                Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
</span></span><!--[endif]--><span style=3D"color:windowtext">Request , Resp=
onse, No of Retries<o:p></o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"3" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"color:windowtext;margin-left:0in;ms=
o-list:l7 level1
            lfo5">
Misc<o:p></o:p></li></ol>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"color:windowtext;mso-list:l2 level1=
 lfo8">Critical Temperature Excursions
<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.5in;text-indent:-1.5in=
;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
<!--[if !supportLists]--><span style=3D"color:windowtext"><span style=3D"ms=
o-list:Ignore"><span style=3D"font:7.0pt
                &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>i.<span style=3D"font:7.0pt &quot;Times New
                Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
</span></span><!--[endif]--><span style=3D"color:windowtext">Minimum Readin=
g of Sensor<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.5in;text-indent:-1.5in=
;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
<!--[if !supportLists]--><span style=3D"color:windowtext"><span style=3D"ms=
o-list:Ignore"><span style=3D"font:7.0pt
                &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>ii.<span style=3D"font:7.0pt &quot;Times New
                Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
</span></span><!--[endif]--><span style=3D"color:windowtext">Max Reading of=
 a sensor<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.5in;text-indent:-1.5in=
;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
<!--[if !supportLists]--><span style=3D"color:windowtext"><span style=3D"ms=
o-list:Ignore"><span style=3D"font:7.0pt
                &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;
</span>iii.<span style=3D"font:7.0pt &quot;Times New
                Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
</span></span><!--[endif]--><span style=3D"color:windowtext">Count of state=
 transition<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.5in;text-indent:-1.5in=
;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
<!--[if !supportLists]--><span style=3D"color:windowtext"><span style=3D"ms=
o-list:Ignore"><span style=3D"font:7.0pt
                &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;
</span>iv.<span style=3D"font:7.0pt &quot;Times New
                Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
</span></span><!--[endif]--><span style=3D"color:windowtext">Retry Count<o:=
p></o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"mso-list:l2 level1 lfo8">Count of a=
ssertions/deassertions of GPIO and ability to capture the state<o:p></o:p><=
/li><li class=3D"MsoListParagraph" style=3D"mso-list:l2 level1 lfo8">timest=
amp of last assertion/deassertion of GPIO<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Thanks<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">~Neeraj<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> openbmc
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openbmc-bounces&#43;nelad=
k=3Dmicrosoft.com@lists.ozlabs.org">
&lt;openbmc-bounces&#43;neladk=3Dmicrosoft.com@lists.ozlabs.org&gt;</a> <b>=
On Behalf Of </b>vishwa<br>
<b>Sent:</b> Wednesday, May 8, 2019 1:11 AM<br>
<b>To:</b> Kun Yi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kunyi@g=
oogle.com">
&lt;kunyi@google.com&gt;</a>; OpenBMC Maillist <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:openbmc@lists.ozlabs.org">
&lt;openbmc@lists.ozlabs.org&gt;</a><br>
<b>Subject:</b> Re: BMC health metrics (again!)<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p>Hello Kun,<o:p></o:p></p>
<p>Thanks for initiating it. I liked the /proc parsing. On the IPMI thing, =
is it only targeted to IPMI -or- a generic BMC-Host communication kink ?<o:=
p></o:p></p>
<p>Some of the things in my wish-list are:<o:p></o:p></p>
<p>1/. Flash wear and tear detection and the threshold to be a config optio=
n<br>
2/. Any SoC specific health checks ( If that is exposed )<br>
3/. Mechanism to detect spurious interrupts on any HW link<br>
4/. Some kind of check to see if there will be any I2C lock to a given end =
device<br>
5/. Ability to detect errors on HW links<o:p></o:p></p>
<p>On the watchdog(8) area, I was just thinking these:<o:p></o:p></p>
<p>How about having some kind of BMC_health D-Bus properties -or- a compile=
 time feed, whose values can be fed into a configuration file than watchdog=
 using the default /etc/watchdog.conf always. If the properties are coming =
from a D-Bus, then we could either
 append to /etc/watchdog.conf -or- treat those values only as the config fi=
le that can be given to watchdog.<br>
The systemd service files to be setup accordingly.<o:p></o:p></p>
<p><br>
We have seen instances where we get an error that is indicating no resource=
s available. Those could be file descriptors / socket descriptors etc. A wa=
y to plug this into watchdog as part of test binary that checks for this ? =
We could hook a repair-binary to
 take the action.<o:p></o:p></p>
<p><br>
Another thing that I was looking at hooking into watchdog is the test to se=
e the file system usage as defined by the policy.<br>
Policy could mention the file system mounts and also the threshold.<br>
<br>
For example, /tmp , /root etc.. We could again hook a repair binary to do s=
ome cleanup if needed<br>
<br>
If we see the list is growing with these custom requirements, then probably=
 does not make sense to pollute the watchdog(2) but<br>
have these consumed into the app instead ?<o:p></o:p></p>
<p>!! Vishwa !!<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">On 4/9/19 9:55 PM, Kun Yi wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hello there,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">This topic has been brought up several times on the =
mailing list and offline, but in general seems we as a community didn't rea=
ch a consensus on what things would be the most valuable to monitor, and ho=
w to monitor them. While it seems
 a general purposed monitoring infrastructure for OpenBMC is a hard problem=
, I have some simple ideas that I hope can provide immediate and direct ben=
efits.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">1. Monitoring host IPMI link reliability (host side)=
<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">The essentials I want are &quot;IPMI commands sent&q=
uot; and &quot;IPMI commands succeeded&quot; counts over time. More metrics=
 like response time would be&nbsp;helpful as well. The issue to address her=
e: when some IPMI sensor readings are flaky, it would be really
 helpful to tell from IPMI command stats to determine whether it is a hardw=
are issue, or IPMI issue. Moreover, it would be a very useful regression te=
st metric for rolling out new BMC software.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Looking at the host IPMI side, there is some metrics=
 exposed through&nbsp;/proc/ipmi/0/si_stats if ipmi_si driver is used, but =
I haven't dug into whether it contains information mapping to the interrupt=
s. Time to read the source code I guess.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Another idea would be to instrument caller libraries=
 like the interfaces in ipmitool, though I feel that approach is harder due=
 to fragmentation of IPMI libraries.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">2. Read and expose core BMC performance metrics from=
 procfs<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">This is straightforward: have a smallish daemon (or =
bmc-state-manager) read,parse, and process procfs and put values on D-Bus. =
Core metrics I'm interested in getting through this way: load average, memo=
ry, disk used/available, net stats...
 The values can then simply be exported as IPMI sensors or Redfish resource=
 properties.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">A nice byproduct of this effort would be a procfs pa=
rsing library. Since different platforms would probably have different moni=
toring requirements and procfs output format has no standard, I'm thinking =
the user would just provide a configuration
 file containing list of (procfs path, property regex, D-Bus property name)=
, and the compile-time&nbsp;generated code to provide an object for each pr=
operty.&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">All of this is merely thoughts and nothing concrete.=
 With that said, it would be really great if you could provide some feedbac=
k such as &quot;I want this, but I really need that feature&quot;, or let m=
e know it's all implemented already :)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">If this seems valuable, after gathering more feedbac=
k of feature requirements, I'm going to turn them into design docs and uplo=
ad for review.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Regards, <o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Kun<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</blockquote>
</div>
</body>
</html>

--_000_BL0PR2101MB0932823408EE75DB889F3C3DC80B0BL0PR2101MB0932_--
