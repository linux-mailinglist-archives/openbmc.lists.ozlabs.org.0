Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90B9C4F9
	for <lists+openbmc@lfdr.de>; Sun, 25 Aug 2019 19:01:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GhHN2q1bzDqgq
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 03:01:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.215; helo=mail1.bemta23.messagelabs.com;
 envelope-from=rli11@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GhGc0ff2zDqZH
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 03:00:39 +1000 (AEST)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-c.us-east-1.aws.symcld.net id 11/7E-13824-3BEB26D5;
 Sun, 25 Aug 2019 17:00:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRWlGSWpSXmKPExsWS8eIhr+7mfUm
 xBp/PslicannB4sDocX7GQsYAxijWzLyk/IoE1owFB+awF8xUqPjx/xdLA+Mh2S5GLg4hgflM
 Ei+7uxkhnNeMEvOfPYRy9jFK7H7wH8jh5GATUJJoebWCHcQWEbCUWPKgnQ3EFhbQl+g985oFI
 m4i8fPiNlYIW0/i8MM+sBoWAVWJfRufgcV5gXq/N5wDm8MoICvxZMEzJhCbWUBc4tzFVrC4hI
 CAxJI955khbFGJl4//sULYChLNeyB2MQskSBxv3sMIMVNQ4uTMJywTGAVnIRk1C0nZLCRlEHE
 diQW7P7FB2NoSyxa+Zoaxzxx4zIQsvoCRfRWjaVJRZnpGSW5iZo6uoYGBrqGhka65romhXmKV
 brJeabFuamJxiS6QW16sV1yZm5yTopeXWrKJERg1KQXsmjsY9856o3eIUZKDSUmUt+paYqwQX
 1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5Xe5JihQSLUtNTK9Iyc4ARDJOW4OBREuGNBknzFhck5h
 ZnpkOkTjHac0x4OXcRM8fBo/OA5MdVS4DkdxApxJKXn5cqJc5rD9ImANKWUZoHNxSWcC4xyko
 J8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY9BjKFJzOvBG73K6CzmIDO2ro2EeSskkSElFQDU3fe
 9f1Hp0/X21M5m6HN+vpfhd3Z3JudTVe9WhNktCz65GMxNx0HvwOHGZ9M+7y3LXCBdKVw6SUB8
 U8m7P/vfrrwvPfg24MCRxymb9+5wpeNfUHqtOba+uMtHSrb9/cwnjc+ePVE4volLz7oPvbWyX
 832bo7Z3ty4pUnH9YtURaJ35FsUid1LItx9h03mRtP9CcW/m0JPyJ3TGhrS7S1/dKaU3w7s5r
 06rRN3eedVptvveVD4u6IVZmLGo/J/dk/70vylz0Jb4U6Ml+s4zyYP/N9WZqaXet9g006dtMz
 juuYT3nWuYfFZ/qGpzcCvu/IPszxTL/+87EPCQWvii7V3yksufMxlmHtn0UaEa8/XpiixFKck
 WioxVxUnAgAj9pk8LMDAAA=
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-7.tower-406.messagelabs.com!1566752434!636874!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4912 invoked from network); 25 Aug 2019 17:00:35 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-7.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Aug 2019 17:00:35 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 72825E0539CD6164B021
 for <openbmc@lists.ozlabs.org>; Sun, 25 Aug 2019 13:00:34 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Mon, 26 Aug 2019 01:00:20 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Mon, 26 Aug 2019 01:00:33 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question about FRU read/write function
Thread-Topic: Question about FRU read/write function
Thread-Index: AdVbZFAl3imRPqf7Quaq5a4/oRyv8g==
Date: Sun, 25 Aug 2019 17:00:33 +0000
Message-ID: <24239ac0c21341d9af32893d5c6beb76@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_24239ac0c21341d9af32893d5c6beb76lenovocom_"
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

--_000_24239ac0c21341d9af32893d5c6beb76lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I found the output FRU raw data via FRU read command doesn't totally match =
with input FRU raw data via FRU write command.
FRU write command:
https://github.com/openbmc/ipmi-fru-parser/blob/master/strgfnhandler.cpp#L2=
0
FRU read command:
https://github.com/openbmc/phosphor-host-ipmid/blob/master/storagehandler.c=
pp#L659

Have you encountered this situation ?
If yes, please help to share your comment about it.

Thanks,
Ivan

--_000_24239ac0c21341d9af32893d5c6beb76lenovocom_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I found the output FRU raw data=
 via FRU read command doesn&#8217;t totally match with input FRU raw data v=
ia FRU write command.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">FRU write command:<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/ipmi-fru-parser/blob/master/strgfnhandler.cpp#L20">https://github.co=
m/openbmc/ipmi-fru-parser/blob/master/strgfnhandler.cpp#L20</a><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">FRU read command:<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/phosphor-host-ipmid/blob/master/storagehandler.cpp#L659">https://git=
hub.com/openbmc/phosphor-host-ipmid/blob/master/storagehandler.cpp#L659</a>=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Have you encountered this situa=
tion ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If yes, please help to share yo=
ur comment about it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ivan<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_24239ac0c21341d9af32893d5c6beb76lenovocom_--
