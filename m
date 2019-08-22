Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AE19901C
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 12:01:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dg6j4pGVzDrHG
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 20:01:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.213; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dg5g1dw8zDrHy
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 20:00:53 +1000 (AEST)
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.us-west-2.aws.symcld.net id 6D/7B-16178-3D76E5D5;
 Thu, 22 Aug 2019 10:00:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRWlGSWpSXmKPExsWS8eIhr+6l9Lh
 Yg59LtC1OtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8aVZ5PYCqbJVyyeu5KlgXGbTBcjF4eQwDwm
 ifYVp1i7GDmBnJeMEs+nq0Mk9jBKTDvwnQkkwSagJbHw/x4wW0TAUmLJg3Y2EFtYIFxi+vp9U
 PEYiTfb97FB2HoS3+beBBvKIqAqsePHEbA4L1DvjL3zwGxGAVmJaY/ug/UyC4hLzJ02C6xeQk
 BAYsme88wQtqjEy8f/oOIKEu2Xmlkh6hMkvt6dzQwxU1Di5MwnLBMYBWchGTULSdksJGUQcR2
 JBbs/sUHY2hLLFr5mhrHPHHjMhCy+gJF9FaNFUlFmekZJbmJmjq6hgYGuoaGRrqGxMZBtopdY
 pZukV1qsW55aXKJrpJdYXqxXXJmbnJOil5dasokRGDkpBa0ZOxgnzXqjd4hRkoNJSZR3Smpsr
 BBfUn5KZUZicUZ8UWlOavEhRhkODiUJXtu0uFghwaLU9NSKtMwcYBTDpCU4eJREeI1A0rzFBY
 m5xZnpEKlTjN4cE17OXcTMsfPoPCB5EEx+XLUESH4Hk5vnLl3ELMSSl5+XKiXO2wYyQgBkREZ
 pHtwCWDK6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY1xBkCk9mXgncHa+ATmQCOrFyRyzI
 iSWJCCmpBiY+rZJ+b6ljf+cvmJ1TXsCYUcPX1nqo9fXyS/VdKawZP2vkXvszhj1TlPTYcKufy
 e/brALPY5mM6wUFLI/+Vp9jnfQ13Jj3c0tKwssX/h6bcz4/3lZjas4b+rrpivI6bueChxZP2b
 xLPc7oLr6qH7mxdH6O7k/zHserc1gFo6R3J4TLV6Q63L7bU1+Z80Ne9lM5W/GNo3zeLJrLRHn
 WHRF0fG4Z3xz/TyjRV1vWeOmSYyqT/Djv9hkZbPk+R2Vn3LaV5xSP3erLerpHjHPlouXbwlym
 aWScWu2i/irYjl1ZumtTSD9nXqXPn/um8sZlk3ccDmRnXDHvIZNgG/+9+JLvvM4ib+dpHzD88
 NJBiaU4I9FQi7moOBEAQm/sisEDAAA=
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-12.tower-346.messagelabs.com!1566468049!214832!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30967 invoked from network); 22 Aug 2019 10:00:50 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-12.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Aug 2019 10:00:50 -0000
Received: from pekwpmail05.lenovo.com (unknown [10.96.93.83])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 30F8B32C2E5610D5887B
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 06:00:48 -0400 (EDT)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail05.lenovo.com
 (10.96.93.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 22 Aug
 2019 18:00:46 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Thu, 22 Aug 2019 18:00:46 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: chassis power status seems to not be changed when type command to
 shutdown OS
Thread-Topic: chassis power status seems to not be changed when type command
 to shutdown OS
Thread-Index: AdVY0BhwaA4FVtd3SwOO92uQAtcHFA==
Date: Thu, 22 Aug 2019 10:00:46 +0000
Message-ID: <d0c56bc73b384a0f941e5f4b96ddc73a@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.253]
Content-Type: multipart/alternative;
 boundary="_000_d0c56bc73b384a0f941e5f4b96ddc73alenovocom_"
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

--_000_d0c56bc73b384a0f941e5f4b96ddc73alenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

When I executed command "poweroff" or "shutdown -h" in Host OS, the chassis=
 power status seems to not be changed. Is there any package could support u=
pdate power status for this situation?

Thanks,
Andrew


--_000_d0c56bc73b384a0f941e5f4b96ddc73alenovocom_
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
span.EmailStyle21
	{mso-style-type:personal;
	font-family:DengXian;
	color:#1F497D;}
span.EmailStyle22
	{mso-style-type:personal;
	font-family:DengXian;
	color:windowtext;}
span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:DengXian;
	color:#1F497D;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;mso-fareas=
t-language:ZH-TW">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">When I ex=
ecuted command &quot;poweroff&quot; or &quot;shutdown -h&quot; in Host OS, =
the chassis power status seems to not be changed. Is there any package coul=
d support update power status for this situation?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;mso-fareas=
t-language:ZH-TW">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;mso-fareas=
t-language:ZH-TW">Andrew<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:DengXian;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_d0c56bc73b384a0f941e5f4b96ddc73alenovocom_--
