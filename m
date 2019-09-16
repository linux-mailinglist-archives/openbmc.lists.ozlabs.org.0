Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC41CB3435
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 06:45:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WtwM2FKhzF3WQ
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 14:45:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Wtvc3bvBzDrQ2
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 14:44:58 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Sep 2019 20:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
 d="scan'208,217";a="386070651"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.197.147])
 by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2019 20:07:43 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Zheng Bao'" <fishbaoz@hotmail.com>, "'Andrew Jeffery'" <andrew@aj.id.au>,
 "'AKASH G J'" <akashgj91@gmail.com>, <openbmc@lists.ozlabs.org>
References: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
 <57995e3f-ef82-49b3-909a-054b5b9bef8e@www.fastmail.com>,
 <000001d55efc$36c53100$a44f9300$@linux.intel.com>
 <MN2PR04MB666979DC3506E051D6F44A54CDB50@MN2PR04MB6669.namprd04.prod.outlook.com>,
 <000e01d56776$d87696b0$8963c410$@linux.intel.com>
 <MN2PR04MB66693029C6009D3A03416A3FCDB00@MN2PR04MB6669.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB66693029C6009D3A03416A3FCDB00@MN2PR04MB6669.namprd04.prod.outlook.com>
Subject: RE: Enable KCS interface in zaius
Date: Mon, 16 Sep 2019 11:07:43 +0800
Message-ID: <001601d56c3b$e9151180$bb3f3480$@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0017_01D56C7E.F739D820"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQJcB1X7Z8c6uIR1m/dKdfL+hCFWWQFjbNgiAoQUDF0Cosk6GAFjZc+QAmtrwqalzZsSkA==
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWI2ZjJkY2QtOWFlMy00NWJjLWEwZDctNTk0ZTQ2MjIyMWFmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWGhqWlFNN3JLYkZiczUzN05iME9Pam5RU1Y2QnhrMno1YlU1Z2tWZWloNmFLMWdGUFlNZVl6ZU1oZ3RQSHpabCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: request-justification,no-action
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

This is a multipart message in MIME format.

------=_NextPart_000_0017_01D56C7E.F739D820
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just want to know did you test the image using a real hardware?

 

You can check your kernel .config file in
build/tmp/work/intel_ast2500-openbmc-linux-gnueabi/linux-aspeed/5.2+gitAUTOI
NC+c01e98d151-r0/linux-intel_ast2500-standard-build

 

CONFIG_IPMI_KCS_BMC=y

CONFIG_ASPEED_KCS_IPMI_BMC=y

 

Thanks,

Yong

From: openbmc <openbmc-bounces+yong.b.li=linux.intel.com@lists.ozlabs.org>
On Behalf Of Zheng Bao
Sent: Thursday, September 12, 2019 5:09 PM
To: Yong Li <yong.b.li@linux.intel.com>; 'Andrew Jeffery' <andrew@aj.id.au>;
'AKASH G J' <akashgj91@gmail.com>; openbmc@lists.ozlabs.org
Subject: Re: Enable KCS interface in zaius

 

I use qemu to test the image. Got the result.

 

$ qemu-system-arm -m 512 -M ast2500-evb -nographic  -drive
file=phosphor-intel-platform-1.bin,format=raw,if=mtd

 

 

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

  _____  

From: Yong Li <yong.b.li@linux.intel.com <mailto:yong.b.li@linux.intel.com>
>
Sent: Tuesday, September 10, 2019 1:26 AM
To: 'Zheng Bao' <fishbaoz@hotmail.com <mailto:fishbaoz@hotmail.com> >;
'Andrew Jeffery' <andrew@aj.id.au <mailto:andrew@aj.id.au> >; 'AKASH G J'
<akashgj91@gmail.com <mailto:akashgj91@gmail.com> >;
openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
<openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org> >
Subject: RE: Enable KCS interface in zaius 

 

I would like to know how did you perform the build? Please perform the below
commands:

 

export TEMPLATECONF=meta-openbmc-mods/meta-wht/conf

source oe-init-build-env

bitbake intel-platforms

 

Thanks,

Yong

 

From: Zheng Bao <fishbaoz@hotmail.com <mailto:fishbaoz@hotmail.com> > 
Sent: Saturday, September 7, 2019 7:34 PM
To: Yong Li <yong.b.li@linux.intel.com <mailto:yong.b.li@linux.intel.com> >;
'Andrew Jeffery' <andrew@aj.id.au <mailto:andrew@aj.id.au> >; 'AKASH G J'
<akashgj91@gmail.com <mailto:akashgj91@gmail.com> >;
openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org> 
Subject: Re: Enable KCS interface in zaius

 

I check out the https://github.com/Intel-BMC/openbmc

and build the board: meta-openbmc-mods/meta-wolfpass/conf

 

But got the error,

dd: failed to open
'/home/baozheng/bmc/openbmc-github/build/tmp/deploy/images/intel-ast2500/fit
Image-rootfs-intel-ast2500.bin': No such file or directory

 

Did I miss something?

 

Zheng

 

 

  _____  

From: openbmc <openbmc-bounces+fishbaoz=hotmail.com@lists.ozlabs.org
<mailto:openbmc-bounces+fishbaoz=hotmail.com@lists.ozlabs.org> > on behalf
of Yong Li <yong.b.li@linux.intel.com <mailto:yong.b.li@linux.intel.com> >
Sent: Friday, August 30, 2019 6:29 AM
To: 'Andrew Jeffery' <andrew@aj.id.au <mailto:andrew@aj.id.au> >; 'AKASH G
J' <akashgj91@gmail.com <mailto:akashgj91@gmail.com> >;
openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
<openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org> >
Subject: RE: Enable KCS interface in zaius 

 

It seems that the kernel needs to enable KCS, and disable BT. 
CONFIG_ASPEED_KCS_IPMI_BMC=y

Suggest to check on this: https://github.com/Intel-BMC/openbmc

Thanks,
Yong
-----Original Message-----
From: openbmc <openbmc-bounces+yong.b.li=linux.intel.com@lists.ozlabs.org
<mailto:openbmc-bounces+yong.b.li=linux.intel.com@lists.ozlabs.org> >
On Behalf Of Andrew Jeffery
Sent: Friday, August 30, 2019 12:42 PM
To: AKASH G J <akashgj91@gmail.com <mailto:akashgj91@gmail.com> >;
openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org> 
Subject: Re: Enable KCS interface in zaius



On Thu, 29 Aug 2019, at 09:05, AKASH G J wrote:
> Hi all,
> 
> I am using server platform with Intel processor and Aspeed AST-2500 
> BMC. OpenBMC firmware with zaius configuration is used for BMC.
> 

Zaius is an OpenPOWER platform (and our OpenPOWER platforms use the BT
interface rather than KCS). You're using an Intel-based processor for the
host, so perhaps it's better to start with an x86-based platform such as the
s2600wf. This should already have KCS IPMI enabled for you.

Andrew


------=_NextPart_000_0017_01D56C7E.F739D820
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><!--[if !mso]><style>v\:* =
{behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle22
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal>Just want =
to know did you test the image using a real hardware?<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>You can =
check your kernel .config file in =
build/tmp/work/intel_ast2500-openbmc-linux-gnueabi/linux-aspeed/5.2+gitAU=
TOINC+c01e98d151-r0/linux-intel_ast2500-standard-build<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>CONFIG_IPMI_KCS_BMC=3Dy<o:p></o:p></p><p =
class=3DMsoNormal>CONFIG_ASPEED_KCS_IPMI_BMC=3Dy<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>Yong<o:p></o:p></p><div><div =
style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in'><p class=3DMsoNormal><a =
name=3D"_____replyseparator"></a><b>From:</b> openbmc =
&lt;openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org&gt; =
<b>On Behalf Of </b>Zheng Bao<br><b>Sent:</b> Thursday, September 12, =
2019 5:09 PM<br><b>To:</b> Yong Li &lt;yong.b.li@linux.intel.com&gt;; =
'Andrew Jeffery' &lt;andrew@aj.id.au&gt;; 'AKASH G J' =
&lt;akashgj91@gmail.com&gt;; openbmc@lists.ozlabs.org<br><b>Subject:</b> =
Re: Enable KCS interface in zaius<o:p></o:p></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>I use =
qemu to test the image. Got the result.<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p class=3DMsoNormal>$ =
qemu-system-arm -m 512 -M ast2500-evb -nographic &nbsp;-drive =
file=3Dphosphor-intel-platform-1.bin,format=3Draw,if=3Dmtd<o:p></o:p></p>=
</div><div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>U-Boot 2016.07 (Sep 11 2019 - 21:38:56 =
+0000)<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>SOC : AST2500-A1<o:p></o:p></p></div><div><p =
class=3DMsoNormal>RST : 0x01<o:p></o:p></p></div><div><p =
class=3DMsoNormal>PLL : &nbsp; &nbsp; 24 MHz<o:p></o:p></p></div><div><p =
class=3DMsoNormal>CPU : &nbsp; &nbsp;792 MHz<o:p></o:p></p></div><div><p =
class=3DMsoNormal>MEM : &nbsp; 2.240 MHz, EEC: Disable, Cache: =
Disable<o:p></o:p></p></div><div><p class=3DMsoNormal>VGA : &nbsp; =
&nbsp;16 MiB<o:p></o:p></p></div><div><p class=3DMsoNormal>DRAM : &nbsp; =
init by SOC<o:p></o:p></p></div><div><p class=3DMsoNormal>&nbsp; &nbsp; =
&nbsp; &nbsp;Watchdog enabled<o:p></o:p></p></div><div><p =
class=3DMsoNormal>DRAM: &nbsp;496 MiB<o:p></o:p></p></div><div><p =
class=3DMsoNormal>Flash: 32 MiB<o:p></o:p></p></div><div><p =
class=3DMsoNormal>*** Warning - bad CRC, using default =
environment<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>In: &nbsp; &nbsp;serial<o:p></o:p></p></div><div><p =
class=3DMsoNormal>Out: &nbsp; serial<o:p></o:p></p></div><div><p =
class=3DMsoNormal>Err: &nbsp; serial<o:p></o:p></p></div><div><p =
class=3DMsoNormal>Error: start and/or end address not on sector =
boundary<o:p></o:p></p></div><div><p class=3DMsoNormal>Error: start =
and/or end address not on sector boundary<o:p></o:p></p></div><div><p =
class=3DMsoNormal>Error: start and/or end address not on sector =
boundary<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:12.0pt;color:black'><o:p>&nbsp;</o:p></span></p></div>=
<div><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;color:black'>Zheng<o:p></o:p></span></p></div><=
div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><hr =
size=3D3 width=3D"98%" align=3Dcenter></div><div id=3DdivRplyFwdMsg><p =
class=3DMsoNormal><b><span style=3D'color:black'>From:</span></b><span =
style=3D'color:black'> Yong Li &lt;<a =
href=3D"mailto:yong.b.li@linux.intel.com">yong.b.li@linux.intel.com</a>&g=
t;<br><b>Sent:</b> Tuesday, September 10, 2019 1:26 AM<br><b>To:</b> =
'Zheng Bao' &lt;<a =
href=3D"mailto:fishbaoz@hotmail.com">fishbaoz@hotmail.com</a>&gt;; =
'Andrew Jeffery' &lt;<a =
href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt;; 'AKASH G J' =
&lt;<a href=3D"mailto:akashgj91@gmail.com">akashgj91@gmail.com</a>&gt;; =
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a> =
&lt;<a =
href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;=
<br><b>Subject:</b> RE: Enable KCS interface in zaius</span> =
<o:p></o:p></p><div><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p></div></div><div><div><p =
class=3Dxmsonormal>I would like to know how did you perform the build? =
Please perform the below commands:<o:p></o:p></p><p =
class=3Dxmsonormal>&nbsp;<o:p></o:p></p><p class=3Dxmsonormal>export =
TEMPLATECONF=3Dmeta-openbmc-mods/meta-wht/conf<o:p></o:p></p><p =
class=3Dxmsonormal>source oe-init-build-env<o:p></o:p></p><p =
class=3Dxmsonormal>bitbake intel-platforms<o:p></o:p></p><p =
class=3Dxmsonormal>&nbsp;<o:p></o:p></p><p =
class=3Dxmsonormal>Thanks,<o:p></o:p></p><p =
class=3Dxmsonormal>Yong<o:p></o:p></p><p =
class=3Dxmsonormal>&nbsp;<o:p></o:p></p><div><div =
style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in'><p class=3Dxmsonormal><a =
name=3D"x______replyseparator"></a><b>From:</b> Zheng Bao &lt;<a =
href=3D"mailto:fishbaoz@hotmail.com">fishbaoz@hotmail.com</a>&gt; =
<br><b>Sent:</b> Saturday, September 7, 2019 7:34 PM<br><b>To:</b> Yong =
Li &lt;<a =
href=3D"mailto:yong.b.li@linux.intel.com">yong.b.li@linux.intel.com</a>&g=
t;; 'Andrew Jeffery' &lt;<a =
href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt;; 'AKASH G J' =
&lt;<a href=3D"mailto:akashgj91@gmail.com">akashgj91@gmail.com</a>&gt;; =
<a =
href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>=
<b>Subject:</b> Re: Enable KCS interface in =
zaius<o:p></o:p></p></div></div><p =
class=3Dxmsonormal>&nbsp;<o:p></o:p></p><div><p class=3Dxmsonormal>I =
check out the <a =
href=3D"https://github.com/Intel-BMC/openbmc">https://github.com/Intel-BM=
C/openbmc</a><o:p></o:p></p></div><div><p class=3Dxmsonormal>and build =
the board: =
meta-openbmc-mods/meta-wolfpass/conf<o:p></o:p></p></div><div><p =
class=3Dxmsonormal>&nbsp;<o:p></o:p></p></div><div><p =
class=3Dxmsonormal>But got the error,<o:p></o:p></p></div><div><p =
class=3Dxmsonormal>dd: failed to open =
'/home/baozheng/bmc/openbmc-github/build/tmp/deploy/images/intel-ast2500/=
fitImage-rootfs-intel-ast2500.bin': No such file or =
directory<o:p></o:p></p></div><div><p =
class=3Dxmsonormal>&nbsp;<o:p></o:p></p></div><div><p =
class=3Dxmsonormal>Did I miss something?<o:p></o:p></p></div><div><p =
class=3Dxmsonormal>&nbsp;<o:p></o:p></p></div><div><p =
class=3Dxmsonormal>Zheng<o:p></o:p></p></div><div><p =
class=3Dxmsonormal>&nbsp;<o:p></o:p></p></div><div><div><p =
class=3Dxmsonormal><span =
style=3D'font-size:12.0pt;color:black'>&nbsp;</span><o:p></o:p></p></div>=
<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><hr =
size=3D3 width=3D"98%" align=3Dcenter></div><div =
id=3D"x_divRplyFwdMsg"><p class=3Dxmsonormal><b><span =
style=3D'color:black'>From:</span></b><span style=3D'color:black'> =
openbmc &lt;<a =
href=3D"mailto:openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org">o=
penbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org</a>&gt; on behalf =
of Yong Li &lt;<a =
href=3D"mailto:yong.b.li@linux.intel.com">yong.b.li@linux.intel.com</a>&g=
t;<br><b>Sent:</b> Friday, August 30, 2019 6:29 AM<br><b>To:</b> 'Andrew =
Jeffery' &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt;; =
'AKASH G J' &lt;<a =
href=3D"mailto:akashgj91@gmail.com">akashgj91@gmail.com</a>&gt;; <a =
href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a> =
&lt;<a =
href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;=
<br><b>Subject:</b> RE: Enable KCS interface in zaius</span> =
<o:p></o:p></p><div><p =
class=3Dxmsonormal>&nbsp;<o:p></o:p></p></div></div><div><div><p =
class=3Dxmsonormal style=3D'margin-bottom:12.0pt'>It seems that the =
kernel needs to enable KCS, and disable BT. =
<br>CONFIG_ASPEED_KCS_IPMI_BMC=3Dy<br><br>Suggest to check on this: <a =
href=3D"https://github.com/Intel-BMC/openbmc">https://github.com/Intel-BM=
C/openbmc</a><br><br>Thanks,<br>Yong<br>-----Original =
Message-----<br>From: openbmc &lt;<a =
href=3D"mailto:openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.o=
rg">openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org</a>&gt;<=
br>On Behalf Of Andrew Jeffery<br>Sent: Friday, August 30, 2019 12:42 =
PM<br>To: AKASH G J &lt;<a =
href=3D"mailto:akashgj91@gmail.com">akashgj91@gmail.com</a>&gt;; <a =
href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>=
Subject: Re: Enable KCS interface in zaius<br><br><br><br>On Thu, 29 Aug =
2019, at 09:05, AKASH G J wrote:<br>&gt; Hi all,<br>&gt; <br>&gt; I am =
using server platform with Intel processor and Aspeed AST-2500 <br>&gt; =
BMC. OpenBMC firmware with zaius configuration is used for BMC.<br>&gt; =
<br><br>Zaius is an OpenPOWER platform (and our OpenPOWER platforms use =
the BT<br>interface rather than KCS). You're using an Intel-based =
processor for the<br>host, so perhaps it's better to start with an =
x86-based platform such as the<br>s2600wf. This should already have KCS =
IPMI enabled for =
you.<br><br>Andrew<o:p></o:p></p></div></div></div></div></div></div></di=
v></body></html>
------=_NextPart_000_0017_01D56C7E.F739D820--

