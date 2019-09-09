Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4811EAD503
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 10:41:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RhV52WqTzDqQY
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 18:41:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.212; helo=mail1.bemta23.messagelabs.com;
 envelope-from=hsung1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RhTS13wNzDqM5
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 18:41:15 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-east-1.aws.symcld.net id 0A/E4-31668-820167D5;
 Mon, 09 Sep 2019 08:41:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRWlGSWpSXmKPExsWS8eIhj666QFm
 swbF3ZhanWl6wWOw9sJHFgcljwaZSj/MzFjIGMEWxZuYl5VcksGZ86D/FXDBRrWLm7F2MDYy7
 lLoYuTiEBP4zSrSevssM4bxklFi6uokRwtnLKHFndxtrFyMnB5uAqsSWZ09Yuhg5OEQENCT+v
 8sECTMLJEg8+3mQCcQWFrCQuPnuOBuILSJgK7F56UMmCFtPYt/ERywgNouAisS85RcYQWxeAU
 uJSxsngNmMArISTxY8Y4KYKS5x7mIrO4gtISAgsWTPeWYIW1Ti5eN/rBC2gkTzntcsMDf0vzr
 MAjFTUOLkzCcsExiFZiEZNQtJ2SwkZRBxHYkFuz+xQdjaEssWvmaGsc8ceMyELL6AkX0Vo1lS
 UWZ6RkluYmaOrqGBga6hoZGuoa6hmaVeYpVukl5psW5qYnGJrqFeYnmxXnFlbnJOil5easkmR
 mB8pRQwrtzB+HfmG71DjJIcTEqivOl8ZbFCfEn5KZUZicUZ8UWlOanFhxhlODiUJHif8QLlBI
 tS01Mr0jJzgLEOk5bg4FES4a0ASfMWFyTmFmemQ6ROMdpzTHg5dxEzx8Gj84Dkx1VLgOR3ECn
 EkpeflyolzisNslEApC2jNA9uKCw1XWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsKZDlP
 Zl4J3O5XQGcxAZ3lW1EKclZJIkJKqoHJYMXfhHsrHj0sZ+a4Oe08r6DxK5M3Jj/uzt+04sSKL
 5nbbxuHFU+3/2texOTQpPu47Oy5G27JBo+WV6zTeSci5jHL+she/vjZF5i/Or3grN58StNb6M
 PHGDeP2QGdqm/4fh3apmNsrvov6W3N/8+rzmVrdJjxLK1/fOpeUOVvj02yBoGtnjkXgw9LbpK
 d/3URO4OoJdPReS0Cs9Snz1yT82nD3VVGrBIcpVtYTC888f3+Ystso/bsqL8vZgiZfzlqHJJj
 UXvvi+HLIPllrOesZ5n6KU47FOJ21Taq/OVx7RSHuTzJXRG+6kv3qvNM3HyLU03fc6PvUZdtY
 k/6L14sM6zi9jCuXShj6pHetHeVEktxRqKhFnNRcSIAH7UHMsgDAAA=
X-Env-Sender: hsung1@lenovo.com
X-Msg-Ref: server-20.tower-386.messagelabs.com!1568018471!227449!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12006 invoked from network); 9 Sep 2019 08:41:11 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-20.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Sep 2019 08:41:11 -0000
Received: from pekwpmail05.lenovo.com (unknown [10.96.93.83])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 02FFCB6E50920BCCD7F0;
 Mon,  9 Sep 2019 04:41:10 -0400 (EDT)
Received: from HKGWPEMAIL03.lenovo.com (10.128.3.71) by pekwpmail05.lenovo.com
 (10.96.93.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 9 Sep
 2019 16:41:09 +0800
Received: from HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903]) by
 HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903%6]) with mapi id
 15.01.1591.008; Mon, 9 Sep 2019 16:40:51 +0800
From: Harry Sung1 <hsung1@lenovo.com>
To: Patrick Venture <venture@google.com>
Subject: phosphor-ipmi-flash: Update over eSPI interface
Thread-Topic: phosphor-ipmi-flash: Update over eSPI interface
Thread-Index: AdVm6YFbgJssEwrIR6WSrSjUjGiEdQ==
Date: Mon, 9 Sep 2019 08:40:51 +0000
Message-ID: <befd14ce992e47dba06d993e04cec647@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_befd14ce992e47dba06d993e04cec647lenovocom_"
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
Cc: Andrew MS1 Peng <pengms1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_befd14ce992e47dba06d993e04cec647lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

I found "phosphor-ipmi-flash" have not support flash over eSPI yet.
May I ask if you have any plans to support flash over eSPI?

I have done a simple test about shared memory between host and BMC :
The shared memory is work after I set ESPI084 (source address) and ESPI088 =
(target address) registers.
But it has an limitation that only 256 bytes are available on each page (4K=
B).

For example, if host address starts to write from 0xFE0B0000 (BMC reserved =
enough memory already)
Writable area are:
0xFE0B0000 ~ 0xFE0B00FF
0xFE0B1000 ~ 0xFE0B10FF
0xFE0B2000 ~ 0xFE0B20FF
0xFE0B3000 ~ 0xFE0B30FF
...
...
...


Thanks,
Harry

--_000_befd14ce992e47dba06d993e04cec647lenovocom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Patrick,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I found &#8220;phosphor-ipmi-fl=
ash&#8221; have not support flash over eSPI yet.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">May I ask if you have any plans=
 to support flash over eSPI?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have done a simple test about=
 shared memory between host and BMC :<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The shared memory is work after=
 I set ESPI084 (source address) and ESPI088 (target address) registers.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">But it has an limitation that o=
nly 256 bytes are available on each page (4KB).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
For example, if host address starts to write from 0xFE0B0000 (BMC reserved =
enough memory already)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Writable area are:<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">0xFE0B000=
0 ~ 0xFE0B00FF
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">0xFE0B100=
0 ~ 0xFE0B10FF<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">0xFE0B200=
0 ~ 0xFE0B20FF<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">0xFE0B300=
0 ~ 0xFE0B30FF<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<br>
Harry<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_befd14ce992e47dba06d993e04cec647lenovocom_--
