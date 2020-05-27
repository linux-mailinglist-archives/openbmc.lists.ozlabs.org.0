Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD95D1E3C44
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 10:41:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X47Z4z9czDqRq
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 18:41:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X46s0nqBzDqQw
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 18:41:07 +1000 (AEST)
IronPort-SDR: /AB5aPLYN05GvA9VZ/wLdpdK9PeTDlAYCDoJ4S1OlL4jKzrt0gZfJz7QF9XArQ8WVQQCSmI5wI
 QGMNiv9FE/qg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 01:41:04 -0700
IronPort-SDR: RUxTdtqCJ3JLtqHcOoolfj+Ge7ppYpBIgiOYgC97OvQDJH2ObZFCFEqLViOozXRBDBpY76zdYI
 +xzx8YciJxQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; 
 d="scan'208,217";a="302389882"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga008.jf.intel.com with ESMTP; 27 May 2020 01:41:04 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 01:41:03 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 16:41:01 +0800
Received: from shsmsx602.ccr.corp.intel.com ([10.109.6.142]) by
 SHSMSX602.ccr.corp.intel.com ([10.109.6.142]) with mapi id 15.01.1713.004;
 Wed, 27 May 2020 16:41:01 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: '??' <yulei.sh@bytedance.com>
Subject: RE: Adding usb-ctrl from intel-bmc into phosphor-misc
Thread-Topic: RE: Adding usb-ctrl from intel-bmc into phosphor-misc
Thread-Index: AdY0AiK+WA8N7ixgSz2EVdAfHSxXfQ==
Date: Wed, 27 May 2020 08:41:01 +0000
Message-ID: <2ea02fe94323438fbc4cec4e62c242c4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.36]
Content-Type: multipart/alternative;
 boundary="_000_2ea02fe94323438fbc4cec4e62c242c4intelcom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_2ea02fe94323438fbc4cec4e62c242c4intelcom_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Lei,
What=1B$B!G=1B(Bs your final purpose for this?

Now we already have KCS between host and bmc.


Thanks,
Kwin.


=1B$B0jMk=1B(B yulei.sh at bytedance.com<mailto:openbmc%40lists.ozlabs.org?=
Subject=3DRe%3A%20Adding%20usb-ctrl%20from%20intel-bmc%20into%20phosphor-mi=
sc&In-Reply-To=3D%3CCAGm54UEDRmEQVQ-WaRiUa%2BfpxL0UUe-OZ4rwRZHVLTUJBZZb%3DA=
%40mail.gmail.com%3E>
Wed May 27 13:07:45 AEST 2020

There is a script [usb-ctrl][1] hosted in intel-bmc.

It supports the VirtualMedia feature by insert/eject files to the host

as a USB mass-storage device.

Comparing to the existing [state_hook][2] in jsnbd, it supports

multiple UDCs, so it supports mount multiple files.



In addition, I have some updates on the usb-ctrl script to make it

support the USB ECM device, which creates a USB ethernet device

between BMC and the host.



So my proposal is to add the `usb-ctrl` script into the phosphor-misc

repo so that it gets reviewed and could be used by upstream.



Any ideas?



[1]: https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta=
-common/recipes-core/fw-update/files/usb-ctrl

[2]: https://github.com/openbmc/openbmc/blob/master/meta-phosphor/aspeed-la=
yer/recipes-connectivity/jsnbd/jsnbd/state_hook



--

BRs,

Lei YU


--_000_2ea02fe94323438fbc4cec4e62c242c4intelcom_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Lei,<o:p></o:p></p>
<p class=3D"MsoNormal">What=1B$B!G=1B(Bs your final purpose for this?<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Now we already have KCS between host and bmc.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kwin.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span lang=3D"ZH-CN" style=3D"font-size:13.5pt;fo=
nt-family:SimSun;color:black">=1B$B0jMk=1B(B</span></b><span style=3D"font-=
size:13.5pt;color:black;background:white">&nbsp;</span><a href=3D"mailto:op=
enbmc%40lists.ozlabs.org?Subject=3DRe%3A%20Adding%20usb-ctrl%20from%20intel=
-bmc%20into%20phosphor-misc&amp;In-Reply-To=3D%3CCAGm54UEDRmEQVQ-WaRiUa%2Bf=
pxL0UUe-OZ4rwRZHVLTUJBZZb%3DA%40mail.gmail.com%3E" title=3D"Adding usb-ctrl=
 from intel-bmc into phosphor-misc"><span style=3D"font-size:13.5pt">yulei.=
sh
 at bytedance.com</span></a><span style=3D"font-size:13.5pt;color:black"><b=
r>
<i>Wed May 27 13:07:45 AEST 2020</i></span><o:p></o:p></p>
<pre><span style=3D"color:black">There is a script [usb-ctrl][1] hosted in =
intel-bmc.<o:p></o:p></span></pre>
<pre><span style=3D"color:black">It supports the VirtualMedia feature by in=
sert/eject files to the host<o:p></o:p></span></pre>
<pre><span style=3D"color:black">as a USB mass-storage device.<o:p></o:p></=
span></pre>
<pre><span style=3D"color:black">Comparing to the existing [state_hook][2] =
in jsnbd, it supports<o:p></o:p></span></pre>
<pre><span style=3D"color:black">multiple UDCs, so it supports mount multip=
le files.<o:p></o:p></span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">In addition, I have some updates on the us=
b-ctrl script to make it<o:p></o:p></span></pre>
<pre><span style=3D"color:black">support the USB ECM device, which creates =
a USB ethernet device<o:p></o:p></span></pre>
<pre><span style=3D"color:black">between BMC and the host.<o:p></o:p></span=
></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">So my proposal is to add the `usb-ctrl` sc=
ript into the phosphor-misc<o:p></o:p></span></pre>
<pre><span style=3D"color:black">repo so that it gets reviewed and could be=
 used by upstream.<o:p></o:p></span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">Any ideas?<o:p></o:p></span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">[1]: <a href=3D"https://github.com/Intel-B=
MC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-core/fw-update/=
files/usb-ctrl">https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbm=
c-mods/meta-common/recipes-core/fw-update/files/usb-ctrl</a><o:p></o:p></sp=
an></pre>
<pre><span style=3D"color:black">[2]: <a href=3D"https://github.com/openbmc=
/openbmc/blob/master/meta-phosphor/aspeed-layer/recipes-connectivity/jsnbd/=
jsnbd/state_hook">https://github.com/openbmc/openbmc/blob/master/meta-phosp=
hor/aspeed-layer/recipes-connectivity/jsnbd/jsnbd/state_hook</a><o:p></o:p>=
</span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">-- <o:p></o:p></span></pre>
<pre><span style=3D"color:black">BRs,<o:p></o:p></span></pre>
<pre><span style=3D"color:black">Lei YU<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_2ea02fe94323438fbc4cec4e62c242c4intelcom_--
