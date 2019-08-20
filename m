Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD0295D59
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 13:31:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CTCQ0QBDzDqJP
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 21:31:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.214; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CTBm3BFlzDqkL
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 21:31:10 +1000 (AEST)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-c.us-east-1.aws.symcld.net id 50/0F-15579-BF9DB5D5;
 Tue, 20 Aug 2019 11:31:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRWlGSWpSXmKPExsWSLveKXff3zeh
 YgwsThS1OtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8brE29ZC66pVXy9tpi5gfGJUhcjF4eQwDIm
 icVHNzFBOGsZJV7MaWODcF4xShzv7maFcPYwSuw9/wDI4eRgE9CSWPh/DxOILSJgKbHkQTtQB
 weHsICqxJ9FgRBhLYk974+wQNh6ElM+PAFrZQEquf3wB5jNC9TafPY7mM0oICsx7dF9sJHMAu
 ISc6fNAotLCAhILNlznhnCFpV4+fgfVFxBYsbbLVD1CRIXfncyQ8wUlDg58wnLBEahWUhGzUJ
 SNgtJGURcR2LB7k9sELa2xLKFr5lh7DMHHjMhiy9gZF/FaJpUlJmeUZKbmJmja2hgoGtoaKRr
 pmtqrpdYpZusV1qsm5pYXKJrqJdYXqxXXJmbnJOil5dasokRGE0pBWyWOxi7Z73RO8QoycGkJ
 Mp7sDI6VogvKT+lMiOxOCO+qDQntfgQowYHh8DptS0zGaVY8vLzUpUkePdeB6oTLEpNT61Iy8
 wBRjxMqQQHj5IIb9Y1oDRvcUFibnFmOkTqFKMrx4SXcxcxcxw8Og9Ifly1BEh+B5Pz7gNJIbD
 ZUuK800BmC4A0Z5TmwY2GJatLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR52W4ATeHJzCuB
 uwCYfoB+FOHdfTgS5LiSRISUVAOTe4TbjZczjv1fW67f73njxBmJ+ZVapkz7rc3PbSuQXKDK+
 J91YoBNxtWSJ60/D8pHetw5UCG7cNKESWmZ236v3m9pInxBa46KVobLcdZOnhMa7t9m1bwqOO
 HncmdZ2b/Tt3RbnT4cdwjP3m7JwXWu9ajMh4uNE3Y+4TLllnsW9kDL6oy/ZknpgqbI/5m9S2d
 +VHi9aEZTw8z7P9zirAyiZ6aLTntdsuCECEel+lfnYtE/Ew8v2qOmtPjytPUvbVMV7C7seKu9
 VZZ9epTWoe/NpWwxLj8mHN41/4mJ3YESGTeu6+1nD8TdYnR6/SyLZfGLomaObbqTbsWsK6xpv
 zM34qG2Rj7/W6eg4H3iNQJflFiKMxINtZiLihMBHW2fDtEDAAA=
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-39.tower-406.messagelabs.com!1566300664!1176127!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20047 invoked from network); 20 Aug 2019 11:31:06 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-39.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Aug 2019 11:31:06 -0000
Received: from CNMAILCH03.lenovo.com (unknown [10.96.97.131])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 3461ED5CF0E3BEBBEC18
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 19:31:04 +0800 (CST)
Received: from pekwpmail09.lenovo.com (10.96.81.78) by CNMAILCH03.lenovo.com
 (10.96.97.131) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 20 Aug
 2019 19:31:02 +0800
Received: from pekwpmail05.lenovo.com (10.96.81.230) by pekwpmail09.lenovo.com
 (10.96.81.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 20 Aug
 2019 19:31:02 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Tue, 20 Aug 2019 19:31:02 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Top shows rngd using 79% CPU
Thread-Topic: Top shows rngd using 79% CPU
Thread-Index: AdVXSdNwCtyqy/0SSmuw8W8Gq/Bjow==
Date: Tue, 20 Aug 2019 11:31:02 +0000
Message-ID: <6c4e4469c1134121b840176f92121013@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.251]
Content-Type: multipart/alternative;
 boundary="_000_6c4e4469c1134121b840176f92121013lenovocom_"
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

--_000_6c4e4469c1134121b840176f92121013lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Top is showing that rngd(random number generator daemon) is using high CPU =
usage in our machine as below. I download the romulus image from Jenkins an=
d ran it in QEMU environment and it had the same situation, how should I do=
 to avoid or fix it?

Load average: 1.99 2.16 1.05 2/101 1297
  PID  PPID USER     STAT   VSZ %VSZ %CPU COMMAND
  109     1 root     RN   12716   3%  79% /usr/sbin/rngd -f -r /dev/hwrng

Thanks,
Andrew

--_000_6c4e4469c1134121b840176f92121013lenovocom_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:DengXian;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:DengXian;
	color:windowtext;}
span.EmailStyle22
	{mso-style-type:personal;
	font-family:DengXian;
	color:#1F497D;}
span.EmailStyle23
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:Z=
H-TW">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:Z=
H-TW"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:Z=
H-TW">Top is showing that rngd(random number generator daemon) is using hig=
h CPU usage in our machine as below. I download the romulus image from Jenk=
ins and ran it in QEMU environment and
 it had the same situation, how should I do to avoid or fix it? <o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:Z=
H-TW"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:Z=
H-TW">Load average: 1.99 2.16 1.05 2/101 1297<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:Z=
H-TW">&nbsp; PID&nbsp; PPID USER&nbsp;&nbsp;&nbsp;&nbsp; STAT&nbsp;&nbsp; V=
SZ %VSZ %CPU COMMAND<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:Z=
H-TW">&nbsp; 109&nbsp;&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp; RN&=
nbsp;&nbsp; 12716&nbsp;&nbsp; 3%&nbsp; 79% /usr/sbin/rngd -f -r /dev/hwrng<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:DengXian;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;mso-fareas=
t-language:ZH-TW">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;mso-fareas=
t-language:ZH-TW">Andrew<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_6c4e4469c1134121b840176f92121013lenovocom_--
