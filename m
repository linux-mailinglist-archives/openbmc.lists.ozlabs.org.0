Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B290EB9B2
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 23:28:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4740MQ4ysCzF50j
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 09:28:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.210;
 helo=mail1.bemta23.messagelabs.com; envelope-from=dlin23@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4733py6w8WzF3w3
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 21:00:07 +1100 (AEDT)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-d.us-east-1.aws.symcld.net id 68/98-14133-42F59BD5;
 Wed, 30 Oct 2019 10:00:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRWlGSWpSXmKPExsWS8eIhr65y/M5
 Yg1s/tSxOtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8abI74F79UqZt7qZ25gfKDUxcjFISQwn0ni
 49S7rBDOa0aJ4xfmsEA4+xklHh9sY+xi5OBgE1CVuD+Nu4uRk0NEQF9i16TdbCC2sICkxNyj/
 9gh4nISx/b9Z4Sw9SSO/10NFmcBar3YeosJxOYVsJR4OaeTFcRmFJCVeLLgGVicWUBc4tzFVr
 B6CQEBiSV7zjND2KISLx//Y4WwFSSa97xmgahPkLh6eS0bxExBiZMzn7BMYBSchWTULCRls5C
 UQcR1JBbs/sQGYWtLLFv4mhnGPnPgMROy+AJG9lWMZklFmekZJbmJmTm6hgYGuoaGRroWQJah
 XmKVbopeabFuamJxiS6QW16sV1yZm5yTopeXWrKJERgzKQUcqTsYez+81TvEKMnBpCTKu919R
 6wQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV6dmJ2xQoJFqempFWmZOcD4hUlLcPAoifBuBUnzFh
 ck5hZnpkOkTjHac0x4OXcRM8fBo/OA5MdVS4DkdxApxJKXn5cqJc47ORqoTQCkLaM0D24oLN1
 cYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuxlkOU9mXgnc7ldAZzEBnaXzcxvIWSWJCCmp
 BqbJ5g0hyeF++08ErmDkm3zws9Qa1d70jdz/eyKE1C8LPVNJDtmU9dFVxq9DSYtHIefp9Id2r
 PxW6fseiYtrbr9Zyr3oYGbVxUns8xo8ZZLOuZTvlmDdFrAv3FHsyWoxpjNKKqsOPdXJvpy8Mi
 F5uhDPni1OW89c21dX+v1zjeN+wYdNAYsrF719/DDq+vmwlbvcg87e8z2hejtIfkX9xRtLdlV
 1XrBp3BXgzXLhUmNOhOWDD5dcKn8Icxa7FpS+LCjfskPctESEVSbBlnF9VsBKTbdmCeXfnCe3
 RkfcTKhTb5tzoURQfnbUPpE11yoeLWsxn2X8tJ3jVMyDZkPVk9eDo9bK6W3ae+zctuBdh5VYi
 jMSDbWYi4oTAROBHzeyAwAA
X-Env-Sender: dlin23@lenovo.com
X-Msg-Ref: server-34.tower-426.messagelabs.com!1572429603!114128!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3390 invoked from network); 30 Oct 2019 10:00:03 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-34.tower-426.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Oct 2019 10:00:03 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 933206A3C97551EF5BFC
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 06:00:02 -0400 (EDT)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Wed, 30 Oct 2019 17:59:59 +0800
Received: from HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba]) by
 HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba%12]) with mapi id
 15.01.1591.008; Wed, 30 Oct 2019 17:59:59 +0800
From: Derek Lin23 <dlin23@lenovo.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: FanPwm interface
Thread-Topic: FanPwm interface
Thread-Index: AdWPBzXsXQVBY5D1TJ+9eIoikR+YRA==
Date: Wed, 30 Oct 2019 09:59:59 +0000
Message-ID: <fed4bf71fdbf452f955f527b20c36c08@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_fed4bf71fdbf452f955f527b20c36c08lenovocom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 Nov 2019 09:21:55 +1100
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

--_000_fed4bf71fdbf452f955f527b20c36c08lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi team:

          I have a question regarding of FanPwm interface on hwmon.
          Does this interface get updated while PWM is changing in sysfs?
          For example, if I setup a fan points to a PWM like below configur=
ation, now, FanPwm interface does not get updated when I update PWM in sysf=
s, only my fan inputs (rpms) do.

          Example:
          LABEL_fan1 =3D "FAN0_Speed"
          ...
          PWM_TARGET_fan1 =3D "1"

          Is there a configuration or label which I can use so FanPwm inter=
face would get updated when I change PWM in sysfs?

Thanks,

Derek



--_000_fed4bf71fdbf452f955f527b20c36c08lenovocom_
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
nbsp;&nbsp;&nbsp;&nbsp; I have a question regarding of FanPwm interface on =
hwmon.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Does this interface get updated while PWM is changi=
ng in sysfs?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; For example, if I setup a fan points to a PWM like =
below configuration, now, FanPwm interface does not get updated when I upda=
te PWM in sysfs, only my fan inputs (rpms) do.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Example:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; LABEL_fan1 =3D &quot;FAN0_Speed&quot;<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; PWM_TARGET_fan1 =3D &quot;1&quot;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Is there a configuration or label which I can use s=
o FanPwm interface would get updated when I change PWM in sysfs?<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Derek<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_fed4bf71fdbf452f955f527b20c36c08lenovocom_--
