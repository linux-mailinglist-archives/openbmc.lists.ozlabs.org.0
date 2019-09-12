Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A929B0AF9
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 11:09:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TXyV58gZzF498
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 19:09:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.9.55; helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="jRZGpPFk"; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092009055.outbound.protection.outlook.com [40.92.9.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TXxp1Fh0zDrCX
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 19:08:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGyRtreJJ1nyTvglR7jvOfY3PQR/dG0FjPrdf9CYSc4Dk1UO4GIM1ZQGaLHMO9+tQi64KaXYfu7iZKrUhvU3MDTMiEK1drb0LChIw0dMbECF3Ix8N6JM6EXlNW6G8lc/hSnuGjMIy/1tSbtQvQzPh5oKxiwRhf7hwnqlktqOUCSafu1L6jxTJzZ6BANhmp28pkTPaiKVYYtalsu/0CjMenNUL3PTM4Irw8daj4kTRtSMDm803Onqxt2XaSSrv2cJ6j08nfqvoA75AsMjnpputK0QLHHpJ3/dzMCdwIdZa+2nW0SOenBP230T0/Ucf+L/pgmMACfdy0pMnINpMGLKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+RiQGY8phrEF4D5hpJ+TzjSfN0/CPLCDDiUOaCmQ/A=;
 b=DfiwpHBZ1Yr0rHAATF/SoyPcErmo+Fadh9vqCkfLJVDDdfdM0F0bGpY7lFk6X6YdchyOTktYgGXkvkxeZ5E1lE+OQ5dB6WCPT78FYIofqS4X2kvYwT5/hi9kjby227BD2PQoQlkxxH601W6P97NlEyC7a3aNqi4gcicgOgQjx4oY7FbDZgFuRXeIVm6ZP1LSrp1H2psOpQbxmwu8eUm8HOfKkAQ3oPC8Fr4NQ1QC1O/XrlOyFVPqu5EC557CnAn2B94M4LR8ate0/mF8akOKq2QDWDJz9R8MvYA3/x5HnHCHyFg9LJ7SaA3zWbtLxhAp/x4faym5wAI3KQF4cdcr9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+RiQGY8phrEF4D5hpJ+TzjSfN0/CPLCDDiUOaCmQ/A=;
 b=jRZGpPFktBXbY2IfhwP20QjljiQtoMXP2p8SjIqJ6G6r1N1mi5BstYPsZJ4cpIblNMYFUEOIP9Jd95/iHhTXR7VOiwszABWk8Qrlgh3QJkB4AJFgyMH/0NjBR0pN/ZdoGMrkccQu8tebm4iSnUVsnH4TgHA37bedExFc5G+YmC05y0mOQ05zLo9uGkYNPkC3U8/NadfW+oZGx9j4JSzcZRp0LoSboNljNzi12Bnt+nHSHSNFoCTQR3D5vkzsI9hDw0FIpErEk8NOUOa9CQnkAsIp3GasuHihrjGbVrSYvzudgZ4gohx/DWKZ4xu90Ev4QzF3OrvWXE56r1JPvIVTkA==
Received: from CO1NAM04FT039.eop-NAM04.prod.protection.outlook.com
 (10.152.90.54) by CO1NAM04HT184.eop-NAM04.prod.protection.outlook.com
 (10.152.91.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.14; Thu, 12 Sep
 2019 09:08:39 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.90.58) by
 CO1NAM04FT039.mail.protection.outlook.com (10.152.91.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.14 via Frontend Transport; Thu, 12 Sep 2019 09:08:39 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676%2]) with mapi id 15.20.2263.015; Thu, 12 Sep 2019
 09:08:39 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: Yong Li <yong.b.li@linux.intel.com>, 'Andrew Jeffery' <andrew@aj.id.au>,
 'AKASH G J' <akashgj91@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Enable KCS interface in zaius
Thread-Topic: Enable KCS interface in zaius
Thread-Index: AQHVXie2AsYNJ+CVFkiAFCdw53bpLacTHlaAgAAdxQCADEc8qIAErgeAgAOaM9k=
Date: Thu, 12 Sep 2019 09:08:39 +0000
Message-ID: <MN2PR04MB66693029C6009D3A03416A3FCDB00@MN2PR04MB6669.namprd04.prod.outlook.com>
References: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
 <57995e3f-ef82-49b3-909a-054b5b9bef8e@www.fastmail.com>,
 <000001d55efc$36c53100$a44f9300$@linux.intel.com>
 <MN2PR04MB666979DC3506E051D6F44A54CDB50@MN2PR04MB6669.namprd04.prod.outlook.com>,
 <000e01d56776$d87696b0$8963c410$@linux.intel.com>
In-Reply-To: <000e01d56776$d87696b0$8963c410$@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:3FA7680A088498B5C2B505DFCAB4BBCAA2703ED4D92AA0E1B2B399643418145A;
 UpperCasedChecksum:A412C362037AB83CF61FD92361C66F2BD4C9515C89B843193D5A934FB6B51C55;
 SizeAsReceived:7070; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [4Qu9amT8RLeYmcLkeoMQUdjk1WwRu/F5]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:CO1NAM04HT184; 
x-ms-traffictypediagnostic: CO1NAM04HT184:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: kkayJWov7/imSqLzk4P36neLWOfEYmCy/6C5ZIRqnj2VDmwmA8Pli/XBcnb+PIyerPIuUKwgZZ+KxfCCl3D+OcFATnNuAp/aaiy7AtndzJtDl0HJ7qijJgRgbH7n+nZRGH71PgYAO5OL6mYxUHBqNzOleUFiqXc67N+jvc9PG8/6sc+GK2zU7GuArVcnbSTB
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB66693029C6009D3A03416A3FCDB00MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eef4067-f264-4a0a-9711-08d73760cd30
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 09:08:39.4035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM04HT184
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

--_000_MN2PR04MB66693029C6009D3A03416A3FCDB00MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I use qemu to test the image. Got the result.

$ qemu-system-arm -m 512 -M ast2500-evb -nographic  -drive file=3Dphosphor-=
intel-platform-1.bin,format=3Draw,if=3Dmtd


U-Boot 2016.07 (Sep 11 2019 - 21:38:56 +0000)

SOC : AST2500-A1
RST : 0x01
PLL :     24 MHz
CPU :    792 MHz
MEM :   2.240 MHz, EEC: Disable, Cache: Disable
VGA :    16 MiB
DRAM :   init by SOC
       Watchdog enabled
DRAM:  496 MiB
Flash: 32 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Error: start and/or end address not on sector boundary
Error: start and/or end address not on sector boundary
Error: start and/or end address not on sector boundary


Zheng
________________________________
From: Yong Li <yong.b.li@linux.intel.com>
Sent: Tuesday, September 10, 2019 1:26 AM
To: 'Zheng Bao' <fishbaoz@hotmail.com>; 'Andrew Jeffery' <andrew@aj.id.au>;=
 'AKASH G J' <akashgj91@gmail.com>; openbmc@lists.ozlabs.org <openbmc@lists=
.ozlabs.org>
Subject: RE: Enable KCS interface in zaius


I would like to know how did you perform the build? Please perform the belo=
w commands:



export TEMPLATECONF=3Dmeta-openbmc-mods/meta-wht/conf

source oe-init-build-env

bitbake intel-platforms



Thanks,

Yong



From: Zheng Bao <fishbaoz@hotmail.com>
Sent: Saturday, September 7, 2019 7:34 PM
To: Yong Li <yong.b.li@linux.intel.com>; 'Andrew Jeffery' <andrew@aj.id.au>=
; 'AKASH G J' <akashgj91@gmail.com>; openbmc@lists.ozlabs.org
Subject: Re: Enable KCS interface in zaius



I check out the https://github.com/Intel-BMC/openbmc

and build the board: meta-openbmc-mods/meta-wolfpass/conf



But got the error,

dd: failed to open '/home/baozheng/bmc/openbmc-github/build/tmp/deploy/imag=
es/intel-ast2500/fitImage-rootfs-intel-ast2500.bin': No such file or direct=
ory



Did I miss something?



Zheng





________________________________

From: openbmc <openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org<mail=
to:openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org>> on behalf of Y=
ong Li <yong.b.li@linux.intel.com<mailto:yong.b.li@linux.intel.com>>
Sent: Friday, August 30, 2019 6:29 AM
To: 'Andrew Jeffery' <andrew@aj.id.au<mailto:andrew@aj.id.au>>; 'AKASH G J'=
 <akashgj91@gmail.com<mailto:akashgj91@gmail.com>>; openbmc@lists.ozlabs.or=
g<mailto:openbmc@lists.ozlabs.org> <openbmc@lists.ozlabs.org<mailto:openbmc=
@lists.ozlabs.org>>
Subject: RE: Enable KCS interface in zaius



It seems that the kernel needs to enable KCS, and disable BT.
CONFIG_ASPEED_KCS_IPMI_BMC=3Dy

Suggest to check on this: https://github.com/Intel-BMC/openbmc

Thanks,
Yong
-----Original Message-----
From: openbmc <openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org=
<mailto:openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org>>
On Behalf Of Andrew Jeffery
Sent: Friday, August 30, 2019 12:42 PM
To: AKASH G J <akashgj91@gmail.com<mailto:akashgj91@gmail.com>>; openbmc@li=
sts.ozlabs.org<mailto:openbmc@lists.ozlabs.org>
Subject: Re: Enable KCS interface in zaius



On Thu, 29 Aug 2019, at 09:05, AKASH G J wrote:
> Hi all,
>
> I am using server platform with Intel processor and Aspeed AST-2500
> BMC. OpenBMC firmware with zaius configuration is used for BMC.
>

Zaius is an OpenPOWER platform (and our OpenPOWER platforms use the BT
interface rather than KCS). You're using an Intel-based processor for the
host, so perhaps it's better to start with an x86-based platform such as th=
e
s2600wf. This should already have KCS IPMI enabled for you.

Andrew

--_000_MN2PR04MB66693029C6009D3A03416A3FCDB00MN2PR04MB6669namp_
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
<div><span>I use qemu to test the image. Got the result.<br>
</span></div>
<div><span><br>
</span></div>
<div><span>$ qemu-system-arm -m 512 -M ast2500-evb -nographic &nbsp;-drive =
file=3Dphosphor-intel-platform-1.bin,format=3Draw,if=3Dmtd</span></div>
<div><span></span></div>
<div><br>
</div>
<div><br>
</div>
<div>U-Boot 2016.07 (Sep 11 2019 - 21:38:56 &#43;0000)<br>
</div>
<div><br>
</div>
<div>SOC : AST2500-A1<br>
</div>
<div>RST : 0x01<br>
</div>
<div>PLL : &nbsp; &nbsp; 24 MHz<br>
</div>
<div>CPU : &nbsp; &nbsp;792 MHz<br>
</div>
<div>MEM : &nbsp; 2.240 MHz, EEC: Disable, Cache: Disable<br>
</div>
<div>VGA : &nbsp; &nbsp;16 MiB<br>
</div>
<div>DRAM : &nbsp; init by SOC<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;Watchdog enabled<br>
</div>
<div>DRAM: &nbsp;496 MiB<br>
</div>
<div>Flash: 32 MiB<br>
</div>
<div>*** Warning - bad CRC, using default environment<br>
</div>
<div><br>
</div>
<div>In: &nbsp; &nbsp;serial<br>
</div>
<div>Out: &nbsp; serial<br>
</div>
<div>Err: &nbsp; serial<br>
</div>
<div>Error: start and/or end address not on sector boundary<br>
</div>
<div>Error: start and/or end address not on sector boundary<br>
</div>
<div>Error: start and/or end address not on sector boundary<br>
</div>
<div><br>
</div>
<span></span>
<div>
<div id=3D"appendonsend" style=3D"font-family: Calibri, Helvetica, sans-ser=
if; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
Zheng<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Yong Li &lt;yong.b.=
li@linux.intel.com&gt;<br>
<b>Sent:</b> Tuesday, September 10, 2019 1:26 AM<br>
<b>To:</b> 'Zheng Bao' &lt;fishbaoz@hotmail.com&gt;; 'Andrew Jeffery' &lt;a=
ndrew@aj.id.au&gt;; 'AKASH G J' &lt;akashgj91@gmail.com&gt;; openbmc@lists.=
ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> RE: Enable KCS interface in zaius</font>
<div>&nbsp;</div>
</div>
<div lang=3D"EN-US">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
I would like to know how did you perform the build? Please perform the belo=
w commands:</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
export TEMPLATECONF=3Dmeta-openbmc-mods/meta-wht/conf</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
source oe-init-build-env</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
bitbake intel-platforms</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
Thanks,</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
Yong</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
<a name=3D"x______replyseparator"></a><b>From:</b> Zheng Bao &lt;fishbaoz@h=
otmail.com&gt;
<br>
<b>Sent:</b> Saturday, September 7, 2019 7:34 PM<br>
<b>To:</b> Yong Li &lt;yong.b.li@linux.intel.com&gt;; 'Andrew Jeffery' &lt;=
andrew@aj.id.au&gt;; 'AKASH G J' &lt;akashgj91@gmail.com&gt;; openbmc@lists=
.ozlabs.org<br>
<b>Subject:</b> Re: Enable KCS interface in zaius</p>
</div>
</div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
I check out the <a href=3D"https://github.com/Intel-BMC/openbmc">https://gi=
thub.com/Intel-BMC/openbmc</a></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
and build the board: meta-openbmc-mods/meta-wolfpass/conf</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
But got the error,</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
dd: failed to open '/home/baozheng/bmc/openbmc-github/build/tmp/deploy/imag=
es/intel-ast2500/fitImage-rootfs-intel-ast2500.bin': No such file or direct=
ory</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
Did I miss something?</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
Zheng</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11=
pt; font-family: &quot;Calibri&quot;, sans-serif;text-align:center" align=
=3D"center">
<hr width=3D"98%" size=3D"3" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
<b><span style=3D"color:black">From:</span></b><span style=3D"color:black">=
 openbmc &lt;<a href=3D"mailto:openbmc-bounces&#43;fishbaoz=3Dhotmail.com@l=
ists.ozlabs.org">openbmc-bounces&#43;fishbaoz=3Dhotmail.com@lists.ozlabs.or=
g</a>&gt; on behalf of Yong Li &lt;<a href=3D"mailto:yong.b.li@linux.intel.=
com">yong.b.li@linux.intel.com</a>&gt;<br>
<b>Sent:</b> Friday, August 30, 2019 6:29 AM<br>
<b>To:</b> 'Andrew Jeffery' &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@a=
j.id.au</a>&gt;; 'AKASH G J' &lt;<a href=3D"mailto:akashgj91@gmail.com">aka=
shgj91@gmail.com</a>&gt;;
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a> &l=
t;<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&=
gt;<br>
<b>Subject:</b> RE: Enable KCS interface in zaius</span> </p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;margin-bottom:12.0pt">
It seems that the kernel needs to enable KCS, and disable BT. <br>
CONFIG_ASPEED_KCS_IPMI_BMC=3Dy<br>
<br>
Suggest to check on this: <a href=3D"https://github.com/Intel-BMC/openbmc">=
https://github.com/Intel-BMC/openbmc</a><br>
<br>
Thanks,<br>
Yong<br>
-----Original Message-----<br>
From: openbmc &lt;<a href=3D"mailto:openbmc-bounces&#43;yong.b.li=3Dlinux.i=
ntel.com@lists.ozlabs.org">openbmc-bounces&#43;yong.b.li=3Dlinux.intel.com@=
lists.ozlabs.org</a>&gt;<br>
On Behalf Of Andrew Jeffery<br>
Sent: Friday, August 30, 2019 12:42 PM<br>
To: AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com">akashgj91@gmail.co=
m</a>&gt;; <a href=3D"mailto:openbmc@lists.ozlabs.org">
openbmc@lists.ozlabs.org</a><br>
Subject: Re: Enable KCS interface in zaius<br>
<br>
<br>
<br>
On Thu, 29 Aug 2019, at 09:05, AKASH G J wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I am using server platform with Intel processor and Aspeed AST-2500 <b=
r>
&gt; BMC. OpenBMC firmware with zaius configuration is used for BMC.<br>
&gt; <br>
<br>
Zaius is an OpenPOWER platform (and our OpenPOWER platforms use the BT<br>
interface rather than KCS). You're using an Intel-based processor for the<b=
r>
host, so perhaps it's better to start with an x86-based platform such as th=
e<br>
s2600wf. This should already have KCS IPMI enabled for you.<br>
<br>
Andrew</p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR04MB66693029C6009D3A03416A3FCDB00MN2PR04MB6669namp_--
