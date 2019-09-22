Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C10BA297
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 14:20:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bmkq0nCmzDqJg
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 22:20:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.209; helo=mail1.bemta23.messagelabs.com;
 envelope-from=liuyh21@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bmjg6bLszDqP3
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:19:47 +1000 (AEST)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-d.us-east-1.aws.symcld.net id 63/F5-29237-ED6678D5;
 Sun, 22 Sep 2019 12:19:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRWlGSWpSXmKPExsWSLveKXfdeWnu
 swd8l4hanWl6wODB6nJ+xkDGAMYo1My8pvyKBNaNh7yy2gu0SFQev3mFvYPwr2sXIxSEkMI9J
 4u3rRmYI5yWjxLxnWxkhnD2MEg8WLmPrYuTgYBPQlpi+P7WLkZNDREBfYtek3WwgtrCAlERD7
 29miLi8xM/dx1khbD2JW9fvMoLYLAKqEss3vmMBGcMrYCnxajIvSJhRQFZi2qP7TCA2s4C4xN
 xps8BaJQQEJJbsOc8MYYtKvHz8DyquIDHj7Rao+gSJ9+uWsYPYvAKCEidnPmGZwCg4C8moWUj
 KZiEpg4jrSCzY/YkNwtaWWLbwNTOMfebAYyZk8QWM7KsYzZKKMtMzSnITM3N0DQ0MdA0NjXQt
 dA3NzfUSq3RT9EqLdVMTi0t0DfUSy4v1iitzk3NS9PJSSzYxAmMmpYBj4w7GjbPe6B1ilORgU
 hLlNXnUFivEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtcnpT1WSLAoNT21Ii0zBxi/MGkJDh4lEd
 5XIGne4oLE3OLMdIjUKUZ7jgkv5y5i5jh4dB6Q/LhqCZD8DiKFWPLy81KlxHltQNoEQNoySvP
 ghsLSzSVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz/koGm8GTmlcDtfgV0FhPQWfN9W0HO
 KklESEk1MC1uPqS7dRNbftKnSL/sKUZy3T4zN870Wznx6M153Q/n/2V/w+/LJSHwfXfro31nI
 q+UKdi+v1b0dgnvkXn8q777PpxpxKD+1DL89QU70daJE9c9nSiSFW3oHhy74OaZvkXZj14ctm
 dftkbrjr3x7f4T6jw3crS5fh7OCrOLOSFzMmfldOWQi7cccyc3P2kL6IkrSix2Uq/YfeFyRrd
 q+u75nZ6R2VsbI94yWd5c4nos/Wz7mpdbIldxsR7e0F6fqhGRdURDJOrBs9b/R259fP5BPTju
 xL4LZ6/H/Oq4zB6ZOVHn9IHyaSJntsq9e6NeaXN2lYgnU5+W8fMLrKU29dHfU1/L5Uef47iUO
 P8j/zUlluKMREMt5qLiRABuWwWlsgMAAA==
X-Env-Sender: liuyh21@lenovo.com
X-Msg-Ref: server-15.tower-426.messagelabs.com!1569154780!274111!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25294 invoked from network); 22 Sep 2019 12:19:42 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-15.tower-426.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Sep 2019 12:19:42 -0000
Received: from pekwpmail02.lenovo.com (unknown [10.96.93.80])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 93FA5AFB4A7FBB49FF22
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 20:19:39 +0800 (CST)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail02.lenovo.com
 (10.96.93.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Sun, 22 Sep
 2019 20:19:39 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Sun, 22 Sep 2019 20:19:39 +0800
From: Yonghui YH21 Liu <liuyh21@lenovo.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: IPMI SEL Event ID
Thread-Topic: IPMI SEL Event ID
Thread-Index: AdVxP4aNP7Fu+Ov3SsCvstO4fphlWg==
Date: Sun, 22 Sep 2019 12:19:38 +0000
Message-ID: <1082e383cba94367945d14175a0d787b@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.251]
Content-Type: multipart/alternative;
 boundary="_000_1082e383cba94367945d14175a0d787blenovocom_"
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

--_000_1082e383cba94367945d14175a0d787blenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

HI All,
         I find the new SEL event ID is not from base number(1) after I run=
 "ipmitool sel clear" command.
         Is it the OpenBMC default design rule ? If not, any plan to fix th=
e issue?

Thanks


--_000_1082e383cba94367945d14175a0d787blenovocom_
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
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\5B8B\4F53";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
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
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">HI All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; I find the new SEL event ID is not from base number(1) af=
ter I run &#8220;ipmitool sel clear&#8221; command.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; Is it the OpenBMC default design rule ? If not, any plan =
to fix the issue?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_1082e383cba94367945d14175a0d787blenovocom_--
