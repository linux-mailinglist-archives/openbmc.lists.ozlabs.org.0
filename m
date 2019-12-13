Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1C211DE74
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 08:12:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z21N4kHQzDqKD
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 18:12:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.213;
 helo=mail1.bemta23.messagelabs.com; envelope-from=dlin23@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z20Q6K7DzDr7J
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 18:11:50 +1100 (AEDT)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-c.us-east-1.aws.symcld.net id 82/54-10575-3B933FD5;
 Fri, 13 Dec 2019 07:11:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRWlGSWpSXmKPExsWS8eIhj+4my8+
 xBp/nWFucannB4sDocX7GQsYAxijWzLyk/IoE1oyDryezFdyVq1jwYj97A+Mj6S5GLg4hgflM
 EjcW/2SHcF4zSjT9/swI4exnlDi7/TlrFyMHB5uAqsT9adxdjJwcIgKWEksetLOB2MICKhKHn
 81jgohrSkya84gZwtaT6Jp4ihHEZgFq/fPwAlicF6j33tM5YPWMArISTxY8A7OZBcQlzl1sZQ
 exJQQEJJbsOc8MYYtKvHz8jxXCVpBo3vOaBaI+QWLl119QMwUlTs58wjKBUXAWklGzkJTNQlI
 GEdeRWLD7ExuErS2xbOFrZhj7zIHHTMjiCxjZVzGaJRVlpmeU5CZm5ugaGhjoGhoa6ZroGpqZ
 6iVW6SbrlRbrpiYWl+ga6iWWF+sVV+Ym56To5aWWbGIERk1KAcvSHYybv77VO8QoycGkJMr7s
 e5TrBBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3v8Wn2OFBItS01Mr0jJzgBEMk5bg4FES4WUHRr
 EQb3FBYm5xZjpE6hSjPceEl3MXMXMcPDoPSH5ctQRIfgeRQix5+XmpUuK8CSBTBUDaMkrz4Ib
 CEs4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8j0Cm8GTmlcDtfgV0FhPQWYaRn0DOKklE
 SEk1MLkzaQYZTD04rYxVw7bOk9OsdcXqxZdddhwSXeC+RmzmTAt566XlT7drKFl9fOBlxxE7a
 U9ofFTOz29S/9/V/MhUmd8tNeNK8wtVUfUa72M/DzL8a5n/WTjl5zWd6D2nd997+GdzVvG8Gw
 +Xajbezv92bdPftcmahrNyZkisOHD4TNaV55uqjc5p6JmffuS078797yeS8rJ1HgmKi60Wn72
 4L6CUXX++V5Ll8jvxRy8Y5s1a6ct/VSjD+OTNO1uMhGSiD5+0OmTDe4bLmNFN8WntxSRWrQm7
 dL68lP0QHspUb3+b8XKqZ63Yrm5nkeVJswqPJ8z9ys2/+FybR+KmbbeVHr7699Jy8bwjFRE7p
 95XYinOSDTUYi4qTgQAy3m6XrMDAAA=
X-Env-Sender: dlin23@lenovo.com
X-Msg-Ref: server-28.tower-406.messagelabs.com!1576221106!186748!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15228 invoked from network); 13 Dec 2019 07:11:46 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-28.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2019 07:11:46 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 5437BB65A0CB49F959FD
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 02:11:46 -0500 (EST)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Fri, 13 Dec 2019 15:11:32 +0800
Received: from HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba]) by
 HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba%12]) with mapi id
 15.01.1591.008; Fri, 13 Dec 2019 15:11:32 +0800
From: Derek Lin23 <dlin23@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: PECI-dimm timeout settings.
Thread-Topic: PECI-dimm timeout settings.
Thread-Index: AdWxg3wh9Z3OvG2LTG2zI+5lDFhgVQ==
Date: Fri, 13 Dec 2019 07:11:32 +0000
Message-ID: <99e8b3e925fa4e48a89f02e9b48a803d@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_99e8b3e925fa4e48a89f02e9b48a803dlenovocom_"
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

--_000_99e8b3e925fa4e48a89f02e9b48a803dlenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi team:

          I have a question regarding PECI-dimm timeout period.
          From the top of peci-dimmtemp.c, the timeout period is set to 5 m=
inutes.
          So, what would happen if timeout is reached but DIMM temperature =
cannot be fetched from PECI channel?

       Please provide some inputs.

Thank you,

Derek



--_000_99e8b3e925fa4e48a89f02e9b48a803dlenovocom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi team:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; I have a question regarding PECI-dimm timeout perio=
d.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; From the top of peci-dimmtemp.c, the timeout period=
 is set to 5 minutes.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; So, what would happen if timeout is reached but DIM=
M temperature cannot be fetched from PECI channel?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; Please provide some inputs.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Derek<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_99e8b3e925fa4e48a89f02e9b48a803dlenovocom_--
