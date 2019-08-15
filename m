Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2518ED5A
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 15:51:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468SXc3jx8zDr7l
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 23:51:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.115; helo=mail1.bemta24.messagelabs.com;
 envelope-from=hsung1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468SW95TMbzDr1V
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 23:49:49 +1000 (AEST)
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.us-west-2.aws.symcld.net id 8F/0A-11436-AF2655D5;
 Thu, 15 Aug 2019 13:49:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRWlGSWpSXmKPExsWS8eIhr+7PpNB
 Yg95ruhanWl6wODB6nJ+xkDGAMYo1My8pvyKBNePj/bksBW0yFa9/zmVtYFwm2cXIxSEkMJ9J
 4v6010xdjJxAzmtGiauT7SAS+xglfn76wA6SYBNQldjy7AkLiC0iYCmx5EE7G4gtLKAicfjyP
 DaIuKbEv9/97BC2nsSpd82MIDYLUO/ZT4tZQWxeoN7Zy16D1TMKyEo8WfAMbDGzgLjEuYutYL
 0SAgISS/acZ4awRSVePv7HCmErSDTvec0CUZ8g0X10FhvETEGJkzOfsExgFJyFZNQsJGWzkJR
 BxHUkFuz+xAZha0ssW/iaGcY+c+AxE7L4Akb2VYxmSUWZ6RkluYmZObqGBga6hoZGuobGprrG
 eolVukl6pcW65anFJbpGeonlxXrFlbnJOSl6eaklmxiBUZNS0M68g3HfrDd6hxglOZiURHnLp
 wbHCvEl5adUZiQWZ8QXleakFh9ilOHgUJLg/RcXGiskWJSanlqRlpkDjGCYtAQHj5II7/JEoD
 RvcUFibnFmOkTqFKM9x4SXcxcxcxw8Og9Ifly1BEh+B5FCLHn5ealS4ryTE4DaBEDaMkrz4Ib
 CEs4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8QSDLeTLzSuB2vwI6iwnorDc3AkHOKklE
 SEk1MLWde7O9rV+NZ5bQ57T8BSqz5VIDN/36P++f/uubhsc2Lfierfrt6pvncks5DfKkhe8rP
 dTmSfjDfiwxQm2yAm/i7l/h50LqtYyWavcpLtLVehClzvfNeOXy0zwZ017Jm/1VW33k2YkZOp
 fdbLiFW5vDzE84lm/9+GFtHE/71wsV7cyruI5nVu5Q3V3EO70j4E3Ik+CF4n9bt6f22W1ja9v
 V+ylYVtHlg/6qws1Zq6W+6ixsmXR/Ld82OVXnExJ2/exlZzSVH07Y+bPRf2ueeMFvP2+mhPeG
 vyZKWDofeDWVy3v7jxRD1h/ze6o3e4SFLvR/127IrBaZyre9ruMPu/v30CfVJ5fftD79wHrPM
 SWW4oxEQy3mouJEAJvICkqzAwAA
X-Env-Sender: hsung1@lenovo.com
X-Msg-Ref: server-29.tower-346.messagelabs.com!1565876984!2052!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25797 invoked from network); 15 Aug 2019 13:49:45 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-29.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2019 13:49:45 -0000
Received: from HKGWPEMAIL02.lenovo.com (unknown [10.128.3.70])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 5483A6F9A15B14D5A9A7
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 09:49:44 -0400 (EDT)
Received: from HKGWPEMAIL03.lenovo.com (10.128.3.71) by
 HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Thu, 15 Aug 2019 21:49:42 +0800
Received: from HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903]) by
 HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903%6]) with mapi id
 15.01.1591.008; Thu, 15 Aug 2019 21:49:32 +0800
From: Harry Sung1 <hsung1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: ipmitool FRU write question
Thread-Topic: ipmitool FRU write question
Thread-Index: AdVTbopZKRwneAIkR/qkHv41VIuS6w==
Date: Thu, 15 Aug 2019 13:49:32 +0000
Message-ID: <4a91e18f7195458193f673c26986421a@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_4a91e18f7195458193f673c26986421alenovocom_"
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

--_000_4a91e18f7195458193f673c26986421alenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Current phosphor-host-ipmid does not support fru write command, but ipmi-fr=
u-parser supports it.
We found this fru write command only update the data to dbus inventory, but=
 doesn't sync the data back to the EEPROM.
Does ipmi-fru-parser has any plans to implement it? I think it is more make=
 sense to sync the data to EEPROM when we do fru write.

Thanks,
Harry

--_000_4a91e18f7195458193f673c26986421alenovocom_
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
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Current phosphor-host-ipmid doe=
s not support fru write command, but ipmi-fru-parser supports it.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We found this fru write command=
 only update the data to dbus inventory, but doesn&#8217;t sync the data ba=
ck to the EEPROM.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#333333;background:white">Does ipmi-fru-parser has=
 any plans to implement it? I think it is more make sense to sync the data =
to EEPROM when we do fru write.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#333333;background:white"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Harry<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_4a91e18f7195458193f673c26986421alenovocom_--
