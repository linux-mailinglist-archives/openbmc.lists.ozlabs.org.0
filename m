Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096A1E39D7
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 09:05:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X20f2vM7zDqSB
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 17:05:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X1yg6YbqzDqTW
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 17:03:47 +1000 (AEST)
IronPort-SDR: a9cGEIaAvhGbHl5Ek3NmBx+lLDYYGls4I5PxxfSDgOPe3e0vnPK4d7cPwhD3arU93StFIA/+ci
 0bssn6eiugRw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 00:03:42 -0700
IronPort-SDR: Uu9d/qhwLbUoq/0lg1TZw+4B0vQ/JKNYhc6yHTrrX4A5pdrMTGF6g9WMOJ/QJSEDF9EnuhpBh9
 JfkQmf/KivOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; 
 d="scan'208,217";a="468608056"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga005.fm.intel.com with ESMTP; 27 May 2020 00:03:41 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 00:03:41 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 15:03:39 +0800
Received: from shsmsx602.ccr.corp.intel.com ([10.109.6.142]) by
 SHSMSX602.ccr.corp.intel.com ([10.109.6.142]) with mapi id 15.01.1713.004;
 Wed, 27 May 2020 15:03:39 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: "zhang_cy1989@163.com" <zhang_cy1989@163.com>
Subject: How to use eSPI between Host and slave BMC in openbmc project
Thread-Topic: How to use eSPI between Host and slave BMC in openbmc project
Thread-Index: AdYz87kOykgYLUoZQSGe8+d9qR289Q==
Date: Wed, 27 May 2020 07:03:39 +0000
Message-ID: <3039e8f807114ae1a0269f9723214014@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.36]
Content-Type: multipart/alternative;
 boundary="_000_3039e8f807114ae1a0269f9723214014intelcom_"
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

--_000_3039e8f807114ae1a0269f9723214014intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi  Felix,

Both KCS and eSPI driver are ready x86 platforms.
Please refer https://github.com/Intel-BMC/

Example:
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-ast2=
500/recipes-bsp/u-boot/files/0022-KCS-driver-support-in-uBoot.patch
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-ast2=
600/recipes-bsp/u-boot/files/0005-Ast2600-Enable-interrupt-in-u-boot.patch
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-comm=
on/recipes-kernel/linux/linux-aspeed/0022-Add-AST2500-eSPI-driver.patch


BTW: you could set Acute travel logic to analyze eSPI bus. There is eSPI co=
nnector on Intel CRB platform.

Thanks,
Kwin.




Dear James/andrew/Oskar

    Thanks a lot.

    I am studying eSPI spec. But it's hard to find any products with eSPI.

    Your reply gives more understanding about eSPI.



    Looking forward to more applications with eSPI in openbmc project.

    Thanks again.

BR

Felix







| |

zhang_cy1989

|

|

zhang_cy1989 at 163.com<https://lists.ozlabs.org/listinfo/openbmc>


--_000_3039e8f807114ae1a0269f9723214014intelcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
<p class=3D"MsoNormal">Hi &nbsp;Felix,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Both KCS and eSPI driver are ready x86 platforms.<o:=
p></o:p></p>
<p class=3D"MsoNormal">Please refer <a href=3D"https://github.com/Intel-BMC=
/">https://github.com/Intel-BMC/</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Example:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/Intel-BMC/openbmc/blob=
/intel/meta-openbmc-mods/meta-ast2500/recipes-bsp/u-boot/files/0022-KCS-dri=
ver-support-in-uBoot.patch">https://github.com/Intel-BMC/openbmc/blob/intel=
/meta-openbmc-mods/meta-ast2500/recipes-bsp/u-boot/files/0022-KCS-driver-su=
pport-in-uBoot.patch</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/Intel-BMC/openbmc/blob=
/intel/meta-openbmc-mods/meta-ast2600/recipes-bsp/u-boot/files/0005-Ast2600=
-Enable-interrupt-in-u-boot.patch">https://github.com/Intel-BMC/openbmc/blo=
b/intel/meta-openbmc-mods/meta-ast2600/recipes-bsp/u-boot/files/0005-Ast260=
0-Enable-interrupt-in-u-boot.patch</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/Intel-BMC/openbmc/blob=
/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0022=
-Add-AST2500-eSPI-driver.patch">https://github.com/Intel-BMC/openbmc/blob/i=
ntel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0022-A=
dd-AST2500-eSPI-driver.patch</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BTW: you could set Acute travel logic to analyze eSP=
I bus. There is eSPI connector on Intel CRB platform.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kwin.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre><span style=3D"color:black">Dear James/andrew/Oskar<o:p></o:p></span><=
/pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp; Thanks a lot.<o:p></o:p=
></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp; I am studying eSPI spec=
. But it's hard to find any products with eSPI.<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp; Your reply gives more u=
nderstanding about eSPI.<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp; <o:p></o:p></span></pre=
>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;Looking forward to=
 more applications with eSPI in openbmc project.<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp; Thanks again.<o:p></o:p=
></span></pre>
<pre><span style=3D"color:black">BR<o:p></o:p></span></pre>
<pre><span style=3D"color:black">Felix<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp; <o:p></o:p></span></pre=
>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">|<i> |<o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">zhang_cy1989<o:p></o:p></span></pre>
<pre><span style=3D"color:black">|<i><o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">|<i><o:p></o:p></i></span></pre>
<pre><span style=3D"color:black"><a href=3D"https://lists.ozlabs.org/listin=
fo/openbmc">zhang_cy1989 at 163.com</a><o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3039e8f807114ae1a0269f9723214014intelcom_--
