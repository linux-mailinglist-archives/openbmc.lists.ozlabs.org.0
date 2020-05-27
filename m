Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 552171E3B1C
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 09:59:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X3Bd35pSzDqQK
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 17:59:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X39y6XhYzDqBL
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 17:58:38 +1000 (AEST)
IronPort-SDR: HK7xZYtnv8wEfA5/QWh7yA3HIfPpkuTn0TxBWHaQ1ZX4STetPjr4yU9a/17kirSviWoMszkEt1
 JqK2nvO7AM0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 00:58:35 -0700
IronPort-SDR: KryQI66+GjWRWnmdAHbyNggTzsx6wHBcmStf+YNDF7X5OIG9F0zYfwUulUSxpY5Ef2sKr6N9SZ
 /XA7xIUagkfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; 
 d="scan'208,217";a="375954000"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga001.fm.intel.com with ESMTP; 27 May 2020 00:58:35 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 00:58:35 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 15:58:33 +0800
Received: from shsmsx602.ccr.corp.intel.com ([10.109.6.142]) by
 SHSMSX602.ccr.corp.intel.com ([10.109.6.142]) with mapi id 15.01.1713.004;
 Wed, 27 May 2020 15:58:33 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
Subject: RE: About FRU
Thread-Topic: About FRU
Thread-Index: AdYz/Jgsd22LDGcdRYWJMXa/QfCfZw==
Date: Wed, 27 May 2020 07:58:32 +0000
Message-ID: <29eb06b1954a4aac802d69ee7e667ae2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.36]
Content-Type: multipart/alternative;
 boundary="_000_29eb06b1954a4aac802d69ee7e667ae2intelcom_"
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

--_000_29eb06b1954a4aac802d69ee7e667ae2intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Harley,
You could add json configuration file for your device into entity-manager a=
s below:
https://github.com/openbmc/entity-manager/tree/master/configurations


Thanks,
Kwin.


Hello everyone,

       My motherboard has an EEPROM device to store FRU related information=
. How can I configure it in the openbmc configuration file to see this FRU =
information through the ipmitool fru print command?

Are there some examples to provide reference, I did not find a place to con=
figure the eeprom device in the openbmc project?

Is there any documentation about FRU indicating that the module reads and p=
arses information from eeprom, and then it can be read by the ipmitool fru =
print command? What is the process like?

Thanks
Harley



--_000_29eb06b1954a4aac802d69ee7e667ae2intelcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal">Hi Harley,<o:p></o:p></p>
<p class=3D"MsoNormal">You could add json configuration file for your devic=
e into entity-manager as below:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/entity-manager=
/tree/master/configurations">https://github.com/openbmc/entity-manager/tree=
/master/configurations</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kwin.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Hello everyone,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;My mother=
board has an EEPROM device to store FRU related information. How can I conf=
igure it in the openbmc configuration file to see this FRU information thro=
ugh
 the ipmitool fru print command?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Are there some examples to provide reference, =
I did not find a place to configure the eeprom device in the openbmc projec=
t?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Is there any documentation about FRU indicatin=
g that the module reads and parses information from eeprom, and then it can=
 be read by the ipmitool fru print command? What
 is the process like?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Harley<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_29eb06b1954a4aac802d69ee7e667ae2intelcom_--
