Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B362646F53
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 11:41:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Qsv66L5CzDrdJ
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 19:41:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.213; helo=mail1.bemta23.messagelabs.com;
 envelope-from=dlin23@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QFYT552szDr3f
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 19:24:22 +1000 (AEST)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-c.us-east-1.aws.symcld.net id EB/F8-09874-2C7630D5;
 Fri, 14 Jun 2019 09:24:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRWlGSWpSXmKPExsWSLveKXfdQOnO
 swc+ZwhanWl6wODB6nJ+xkDGAMYo1My8pvyKBNePgmdmMBW8UKzau/M/UwNgo18XIxSEkMJ9J
 YuHkD+wQzmtGiW2Lb7BAOPsZJZ4enM/UxcjBwSagKnF/GncXIyeHiIClxJIH7WwgNrPAA0aJV
 WsyQWxhASOJ7vm7WSFqzCVu/FrDDGHrSbycdIcRxGYBGvOsYyGYzQs05838I+wgNqOArMSTBc
 +YIGaKS5y72AoWlxAQkFiy5zwzhC0q8fLxP1YIW0Giec9rFoj6BImzzTdZIGYKSpyc+YRlAqP
 QLCSjZiEpm4WkDCKuI7Fg9yc2CFtbYtnC18ww9pkDj5mQxRcwsq9iNE0qykzPKMlNzMzRNTQw
 0DU0NNI1BbL0Eqt0k/VKi3VTE4tLdA31EsuL9Yorc5NzUvTyUks2MQJjKaWAlWsH46Yjr/UOM
 UpyMCmJ8p77xBQrxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3IJU5VkiwKDU9tSItMwcY1zBpCQ
 4eJRHeHSBp3uKCxNzizHSI1ClGe44JL+cuYuY4eHQekPy4agmQ/A4ihVjy8vNSpcR574O0CYC
 0ZZTmwQ2FpaFLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5PdKApvBk5pXA7X4FdBYT0Fmz
 NjCBnFWSiJCSamDa+48lLNfjgKpqUriZwALT0ld3Jh9Skb7jO7+maLdU3VutrptnNvEcmab99
 qbHbDHPaY3LrURPbVvy+Z7s7ZPbZ3DqXFuRGrH/nrbFPJ3qstbSnivXPsdnHrzlqsB9dHOwga
 XvhV7ly4e3By507pm4Leuh8B0WP/V3oVXvRT6e82zSfPHxsBqL0fT4sG9fIrJK7ZumvMlJ3rd
 IckMN0/6MC8/LXNq+V87cMj/vWaNN7Jpa3uk/OUrVt+96Jh62+djzDR4/DGp97PYZ2zHlpPAL
 /nhouI13pZ1XlvHpH/m7+Dqfb15wuWeCRFDlXNP0NSvqLT/87Fyw/fDHi88/lv7hFLt8bu/5H
 QvrzXd2f2+KUmIpzkg01GIuKk4EAPYmIzi+AwAA
X-Env-Sender: dlin23@lenovo.com
X-Msg-Ref: server-3.tower-406.messagelabs.com!1560504256!6669266!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5436 invoked from network); 14 Jun 2019 09:24:18 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-3.tower-406.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 14 Jun 2019 09:24:18 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id D125D5953D8E7DCF0E4A
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 17:24:15 +0800 (CST)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Fri, 14 Jun 2019 17:24:24 +0800
Received: from HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba]) by
 HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba%19]) with mapi id
 15.01.1591.008; Fri, 14 Jun 2019 17:24:24 +0800
From: Derek Lin23 <dlin23@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: One question is regarding of PECI driver.
Thread-Topic: One question is regarding of PECI driver.
Thread-Index: AdUikNOQn2vGAchfRMW+LmaVIw0aXw==
Date: Fri, 14 Jun 2019 09:24:24 +0000
Message-ID: <1616aac7ca904100be2e0a7dddcc6127@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_1616aac7ca904100be2e0a7dddcc6127lenovocom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 15 Jun 2019 19:40:40 +1000
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
Cc: Duke KH Du <dukh@lenovo.com>, Andrew MS1 Peng <pengms1@lenovo.com>, Harry
 Sung1 <hsung1@lenovo.com>, Haitao HT11 Wang <wanght11@lenovo.com>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_1616aac7ca904100be2e0a7dddcc6127lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi team:

          We have a question for PECI driver, hope we can have some inputs =
and feedbacks.
          When PECI driver starts, it checks the availabilities for CPUs by=
 the addresses defining in the device tree.
          But, when none of the CPUs are available, in our cases, CPUs are =
powered off, PECI driver responses with error messages of PECI clients and =
devices are not registered.
          Is it possible that PECI driver would listen the events for power=
-on? So, PECI driver would be reloaded and PECI clients and devices become =
available.
          Or, other thoughts and ideas?

Thank you,

Derek Lin

--_000_1616aac7ca904100be2e0a7dddcc6127lenovocom_
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
nbsp;&nbsp;&nbsp;&nbsp; We have a question for PECI driver, hope we can hav=
e some inputs and feedbacks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; When PECI driver starts, it checks the availabiliti=
es for CPUs by the addresses defining in the device tree.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; But, when none of the CPUs are available, in our ca=
ses, CPUs are powered off, PECI driver responses with error messages of PEC=
I clients and devices are not registered.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Is it possible that PECI driver would listen the ev=
ents for power-on? So, PECI driver would be reloaded and PECI clients and d=
evices become available.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Or, other thoughts and ideas?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
Derek Lin <o:p></o:p></span></p>
</div>
</body>
</html>

--_000_1616aac7ca904100be2e0a7dddcc6127lenovocom_--
