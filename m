Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B563C272E64
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 18:49:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw9Py0RkdzDqTV
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 02:49:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.19.99;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=ptFNeti6; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn2099.outbound.protection.outlook.com [40.92.19.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw8Xf2P4rzDqrC
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 02:09:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Izv/tIavwrLQNdzuiUDyqtTQfVSTf1NX1RY3ZkmHCfRq0Kc0sB4xannnO3UwfK13OidlG6SCAR1Daivk2B1agyL/PCmz5YNGEYkeFBBgW5bC76XcV+WDS1z+0Hrpgx+UEBmFZ27EmY6EE2y7ylLOzdttwfM43X4Cv6YwTCTAPYRxfD8hIXCx0f5xhCrnKoc1v3x6wtH44sVEWBtoOyi6LoROHvFLYdP0rhk6/1iYCqh849AgnUP5YDPFYVOJ/TM/PjN1h5Iab8T9nylyoCJV4BkO5krhQtsqnACFORymThgZrlbAckOeRSF0mlNmNvCOxQLi0dYBSJA1nSZSvW5hpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9+CKd3kD2WI7Ge6X1oVAV45Sj+kihSl9xYv2Cm41Tw=;
 b=n7PwtulJV1a+741zAk761dR2ubnnRrZKneOO4GaT142yvTai/TvIAq6waQHlrqukchVaJVrlCCdeCbpNKfJxuewJ+Cl0aemM7sWHL2CxeBlDof0V21EjJPc4h5bUhKeJM6bCNdGMcELAwPOHYT5lcEx2M6Rv8td//txGIUJsJJRNvCg0YgWwrWIT7jE0B+JWjM7mY1g5Tv0FKQvSsvWEtHNqow0mUjYzuPZQzdmEFSnNNKgvPmWrkQs2mxTLRDcic3AhuJbPNVSRUwB6FhxJrYwZi+ZmcdlFzMWPrFSZ//0MXfv4a8AehkC1pVXXjb8bEx77VKW1cDQrj3ITD7p0Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9+CKd3kD2WI7Ge6X1oVAV45Sj+kihSl9xYv2Cm41Tw=;
 b=ptFNeti6yTwK5QDHWj3MG2QGTRHNVmOXMPpNKLsPDLKS5ktpSIYEf8I/MOrxkUol8KzCgzbKoiwAeGutUBdA76X/5Ksbx6jLsRm9iOoy9Xu43+KVk+PXB4FzcnAwvDRLtWCl/EBkK7ztM1IAFW9IzKqNeIAXAyFzlYSKdSYSub1iihNH/rOpI9CKSmQvWKBSq8OTsAREzHD5DPKRE6hFPITaIT4cCFsDCzfq6WOBKhxhdA7Uy733aaUkXPbk2HDGPYAJcUV2R3qTxwhzcjgyn3qXA2gukY8yAkz91x8IX6ZVuV6fZiLGNUgxKLHKdd0kZYA5ihY6Vwy/cOyMaN4U/w==
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::4a) by
 CO1NAM11HT230.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::207)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Mon, 21 Sep
 2020 16:09:48 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:3861::4f) by CO1NAM11FT033.mail.protection.outlook.com
 (2a01:111:e400:3861::247) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend
 Transport; Mon, 21 Sep 2020 16:09:48 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 16:09:48 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC Security Advisory - CVE-2019-6260
Thread-Topic: OpenBMC Security Advisory - CVE-2019-6260
Thread-Index: AQHWj6ZTNl2tx3WOCkCa1TJvpl8NWKlyRn0AgAD9EBI=
Date: Mon, 21 Sep 2020 16:09:48 +0000
Message-ID: <BYAPR14MB2342ACDCCED409D23AC7A689CF3A0@BYAPR14MB2342.namprd14.prod.outlook.com>
References: <BYAPR14MB234222A907DAA5A640E1DABACF3D0@BYAPR14MB2342.namprd14.prod.outlook.com>,
 <a06ec8b9-0b1b-8817-d33c-6256289df9e1@linux.vnet.ibm.com>
In-Reply-To: <a06ec8b9-0b1b-8817-d33c-6256289df9e1@linux.vnet.ibm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D758C23ACFBC588F229A960E5C28F174C6E772D97B921E8558628776BE7BE88C;
 UpperCasedChecksum:4306EC0AEA3DD5964CBD64AA884FDCC53958E341009FDACC890DA5645F82091F;
 SizeAsReceived:6962; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [MjXpbx5gkLpLyeuFLY5ClWp0eVn43SXY]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 2444ca3c-9055-415d-313f-08d85e48c37c
x-ms-traffictypediagnostic: CO1NAM11HT230:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xL8QPqvXRwkDwIUAqAUgpgiiXXCA8TdhiyVsyNz1LbydNloSs0JsbKSlCARbmEdkAonoz/zBq+DlZZwQf2h4wT9mNN/M+6O1Y3i+FN1CZN1O5Tabwz9I17wiBx9qcbjqeBSsMwv7EHmkHrZy+GggL2LE+PVPXY2cl5coWdgHqLwrE8MRzfAzgSuZ5w/R6SDTwcMYapMsk78RRs6v6uKXNy5xjKnhFZ6LDo2mDLqQu+mnSNYHhIspY/NUvSXcMqDx
x-ms-exchange-antispam-messagedata: FqcoaS67gRgKVM29GmXrs0lcKNQjRgkMtzfHz81oUrHwUcwlzsVQt/0jyi4LtZ8jfFwliHb9egldjeOrRXrgVry3XNmJaZWGNDWftQQdpYhwIAEXbDAZlpEiAR2FTruCsR+JuVzZAhG3W9S/Z61fzg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR14MB2342ACDCCED409D23AC7A689CF3A0BYAPR14MB2342namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2444ca3c-9055-415d-313f-08d85e48c37c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 16:09:48.2697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT230
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

--_000_BYAPR14MB2342ACDCCED409D23AC7A689CF3A0BYAPR14MB2342namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thank you so much, Tom.



Thanks.

Kun

From: TOM JOSEPH<mailto:tomjose@linux.vnet.ibm.com>
Sent: Sunday, September 20, 2020 6:02 PM
To: Kun Zhao<mailto:zkxz@hotmail.com>; openbmc@lists.ozlabs.org<mailto:open=
bmc@lists.ozlabs.org>
Subject: Re: OpenBMC Security Advisory - CVE-2019-6260


Hello Kun,

The OpenBMC side of the fixes are captured in this link.

https://www.flamingspork.com/blog/2019/01/23/cve-2019-6260-gaining-control-=
of-bmc-from-the-host-processor/

Regards,
Tom
On 21-09-2020 05:17, Kun Zhao wrote:
Hi Team, This link here described the =91pantsdown=92 vulnerability found i=
n OpenBMC,...
This Message Is From an External Sender
This message came from outside your organization.
Hi Team,

This link here described the =91pantsdown=92 vulnerability found in OpenBMC=
,
https://github.com/openbmc/openbmc/issues/3475

So what are the commits for fixing it?


Thanks.

Kun



--_000_BYAPR14MB2342ACDCCED409D23AC7A689CF3A0BYAPR14MB2342namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Roboto;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.pfptpreheader1
	{mso-style-name:pfptpreheader1;
	display:none;}
span.pfpttitle
	{mso-style-name:pfpttitle;}
span.pfptsubtitle
	{mso-style-name:pfptsubtitle;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Thank you so much, Tom.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kun<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:tomjose@linux.vnet.ibm.com">TOM JOSEPH</a><br>
<b>Sent: </b>Sunday, September 20, 2020 6:02 PM<br>
<b>To: </b><a href=3D"mailto:zkxz@hotmail.com">Kun Zhao</a>; <a href=3D"mai=
lto:openbmc@lists.ozlabs.org">
openbmc@lists.ozlabs.org</a><br>
<b>Subject: </b>Re: OpenBMC Security Advisory - CVE-2019-6260</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p>Hello Kun,<br>
<br>
The OpenBMC side of the fixes are captured in this link.<br>
<br>
<a href=3D"https://www.flamingspork.com/blog/2019/01/23/cve-2019-6260-gaini=
ng-control-of-bmc-from-the-host-processor/">https://www.flamingspork.com/bl=
og/2019/01/23/cve-2019-6260-gaining-control-of-bmc-from-the-host-processor/=
<br>
<br>
</a></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Regards,<br>
Tom<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">On 21-09-2020 05:17, Kun Zhao wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal"><span class=3D"pfptpreheader1"><span style=3D"font-s=
ize:1.0pt;color:white">Hi Team, This link here described the =91pantsdown=
=92 vulnerability found in OpenBMC,...&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><o:p></o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%;background:#9CA3A7">
<tbody>
<tr>
<td style=3D"padding:12.0pt 12.0pt 12.0pt 12.0pt">
<div align=3D"center">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<div align=3D"center">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%;background:#9CA3A7">
<tbody>
<tr>
<td width=3D"100%" valign=3D"top" style=3D"width:100.0%;padding:0in 0in 0in=
 0in">
<div align=3D"center">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<p class=3D"MsoNormal"><span class=3D"pfpttitle"><b><span style=3D"font-siz=
e:13.5pt;font-family:Roboto">This Message Is From an External Sender</span>=
</b></span>
<o:p></o:p></p>
</td>
</tr>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<p class=3D"MsoNormal"><span class=3D"pfptsubtitle"><span style=3D"font-siz=
e:10.0pt;font-family:Roboto">This message came from outside your organizati=
on.</span></span>
<o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">This link here described the =91pantsdown=92 vulnera=
bility found in OpenBMC,<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/issues=
/3475">https://github.com/openbmc/openbmc/issues/3475</a><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">So what are the commits for fixing it?<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Kun<o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.5in;ma=
rgin-bottom:5.0pt;margin-left:.5in">
&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR14MB2342ACDCCED409D23AC7A689CF3A0BYAPR14MB2342namp_--
