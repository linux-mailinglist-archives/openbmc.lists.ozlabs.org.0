Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D8474A93C
	for <lists+openbmc@lfdr.de>; Fri,  7 Jul 2023 05:08:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=kKQIu5DG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxyz35LRlz3bwZ
	for <lists+openbmc@lfdr.de>; Fri,  7 Jul 2023 13:08:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=kKQIu5DG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:7eab::82e; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=fishbaoz@hotmail.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2082e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::82e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxyyS1Nd5z3bcL
	for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2023 13:08:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJJtr6heHXQuK3ALyWo7fsIXC6/akq2XDruYGhSAx34wL15gQAfzHrFE73ktuCFIJCSD+CJyopvQSUNz6w6rB1Nk4//bHKj9+WF1XH5vo0/Ak4cVLKLIw1F7RqVF9PP8caE8jPiOoXLgAQo19+bl8Z6loO6Ex28lP2kbMXdndu1xwJDNpIh4P91NvszH/i2ZlyLkyRN4+b4zzgutctZp8YU+SOB3bwoW70/6M5anm/E9j/izye8xpubEiUHcUxLDnqnk6Y52YZgPoIhhhkkhTbEBHijKK6VAX8f0WmWySPbZaqgOiDLiiLyotKhYKGzvKo1+mF8r4BM40I/YpLCcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rRZuTTHEbXJMsJusVxAZL9WFrldqevdwyF5XH/VCPU=;
 b=lyqpT4ePvoI5tkXVDeVFHF+5FABYM0d70dRTaMkVn2TDqrEQOGjbVALtmPnOWWdrSYn/E7MJ5F8mt52j1iatJt1IFRsJXkQRYG2ewJp3qKZ+t2bI4D7p9JeEwcNiUcj2AccGHaaVDWyZHALojLDPigWiKQFQnNHc4Rzfxw3tq/lEG3DRgeImF4etVHqS7fIN/kDd9VME6qVZzr30KHcYEcdJNuwUXGXjQfa5V9vyJg8Mk3O9GjGVaCFC/+4l1om7vie7k9RFigKRI4wa3FQGODax0WTDo2mFGbA7Ezwa6w+FrEoVkuBOppVfJvkUbqzUY0Y+QsOxgTpKZIFQjmKlHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rRZuTTHEbXJMsJusVxAZL9WFrldqevdwyF5XH/VCPU=;
 b=kKQIu5DGUFc5UBtHlS8iiwdYso8s2mAqkRTnlGOntzJYbHGb8wYBbpP/9gyOO3U1Mookp3bUWkvsS5+aIRfC7MUh/9PrFyFbiBQNnWgrJEs0v0sjYuF/zQgzceUzbWvWpUaurdS2SDI7PWz6YU/PXzLBrgflpNIwtmoIF1kgoKdydZzt2GRT+aiEb4gL0DHtftYoKS5ARLnbOK74NboWV9DnykC8dKnX6459Y/khDAhIWd9FYVv70gQhz2TD7mjnqYtgdeVM8KLU8NfvoJ1I4l41x0FsWY3Bi7s52GtrzOgU+rjM2/sTwO7Mb9uDFcV8RZAeZwDhzxr7hxGSOQwPvA==
Received: from DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) by
 SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 03:07:52 +0000
Received: from DM4PR11MB6502.namprd11.prod.outlook.com
 ([fe80::3a63:ce12:27cd:911e]) by DM4PR11MB6502.namprd11.prod.outlook.com
 ([fe80::3a63:ce12:27cd:911e%4]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 03:07:52 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Does the OpenBMC support self test? 
Thread-Topic: Does the OpenBMC support self test? 
Thread-Index: AQHZpFD6i4ZLe93dpUel4KHrbBZF26+tt2NO
Date: Fri, 7 Jul 2023 03:07:52 +0000
Message-ID:  <DM4PR11MB65027064DE35FF5410674B3FCD2DA@DM4PR11MB6502.namprd11.prod.outlook.com>
References:  <DM4PR11MB65020C1A5474E4259D2FECD8CD5DA@DM4PR11MB6502.namprd11.prod.outlook.com>
In-Reply-To:  <DM4PR11MB65020C1A5474E4259D2FECD8CD5DA@DM4PR11MB6502.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Hashtags: #NewslettersPlus
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [jFKwd1YnEklPlqIWlyIogLNkYfH28avTVuAmY6CfJ+E=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6502:EE_|SJ0PR11MB5021:EE_
x-ms-office365-filtering-correlation-id: a53dea4f-dc46-41a5-2241-08db7e975a8d
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Nl3s6x6k9rimNi9KHLd8oxMo8ldU+D6rhu6rIRXbKkBFpedN5efVjcB710NSEqGqXU0rVixnx+6X0Zeoaeb+4cGbV4bulWKK3oH+YabZ0V+I6HYDoRP7mjKyIUJt7LpWM2PCxBczTB1pfPWC9LKdlx91U0U02GquxOo/x6mXMfGb2MBLqVy6URwQWzZ5zPauoDQL1b940Iy4Xgaga2MJOQYvhm6Drv7ujccq1KG3cZ0R/ZKu/jcRFNYAL1X77qZ8NEB86ukAzs6IjFxgV+p9V0sYtLvOhZXHBg47T05S6EKDHX5eM9/ndpR4K8aY+wCz8dor4K0+Ab0+zzDmVLraAjMMh4Nx4hz3403irQB4BuE6VFGVT1byQqRIK5Ba2YRkiZwlsO/dGz1d5KRjBIQMkRRymD8AhD65p47Pwksov60GUhHuECAQuDzSI0K0p9MK8zeZn2AI+7lERwX/n05A5dAgIYeMZwP7sDQLB3vB+2p2DLUE4l70ucgguJohe/a4zeg9ZlkNDlldaz9ks9YgY6p+tFM6SDcmNSyu+6OHPLd5ttl/0mf6OWsMiKliyEOB
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?8ZCpY2ZDGBNywnzGh2PbIUohE/uT/+D4OWDBV6vNGMDPcJqBheppyeVqjY?=
 =?iso-8859-1?Q?YsDlv2OclqaxO/7DfcL7nIQCCjwvajBE3G5AvRfm86zEViD5d2WwywIIVC?=
 =?iso-8859-1?Q?LazCkbU2YDcCdYXPPN3P6ZBu1XdKRKzNfbM3IzXY5eF2e9gUZTZiVizUvl?=
 =?iso-8859-1?Q?ljnS2APgZDPnlrc8l3l93XyjXGImynTdG7bSlChjVQfsbFitOeyg54c6fi?=
 =?iso-8859-1?Q?O7EOfB0LRiJm0heFticbuaFh06fWu+hdxHt4FjpNrgc9fctch/Uqi+Re0I?=
 =?iso-8859-1?Q?Wul1tWlf+26gDG1TLR8+NvmVzslpQuyQRaCrAicpEmWzcheD3Ms/R/+2qy?=
 =?iso-8859-1?Q?H1BLJKZN+QGdcon0o84CYzNDPnGKgXDKCHgi39MQdsCzuuNKiOxG1aqHk3?=
 =?iso-8859-1?Q?ZGFA8YPRRtWuzpNmBI9ugXJ52LADJZyXSwDOQkOWEr92fdPvfXp72EtUyf?=
 =?iso-8859-1?Q?Mn3UHBUpNFk5msZxfR4ViAF7htda7dO2A/0rNgDp9SwVmA+Zk6hUqSAu8x?=
 =?iso-8859-1?Q?6W0P/6RORf3uJTdafLP4ubh2cWXwqwC//ksP9PwhvD03uf9TUauulwU/Ba?=
 =?iso-8859-1?Q?ZrAG0gzgThvigzbBpzHoQ10QPApguRUDIWYiu9KhwqC3OX7FMG/FnFBoiu?=
 =?iso-8859-1?Q?ibDG3dlI3jnRI8iNbgR7/EF7AakP/d15Z13hgIdqY/BO6+/nTJRxcKDyg5?=
 =?iso-8859-1?Q?eEUFDXfip47IlfJGiU2aCGjogvpZy3OIFDf2CV7bkAASh3SJinFI35wxod?=
 =?iso-8859-1?Q?5GTof2xUtSFoLGVgNchvSsOCbPsWth3MdPjxjKCRxKSW4DVhc3C6WC8T5V?=
 =?iso-8859-1?Q?H6LgPKkclgVnkUJJAucO3V+xgRQOJSHJgFkoU9em8ZUqeLJoWZGGnqa2zS?=
 =?iso-8859-1?Q?UT9LCqlmVHzCV3IObge0sEfO5jan6WUJs6H4MpyCye3KupdJ7RVTefuSiS?=
 =?iso-8859-1?Q?eu+8dlfZ05msHVBp4M/YbbbP4ek0i9nzUEgJ2pN4QXwh9sLjs3gSNgKc4L?=
 =?iso-8859-1?Q?rPue0PJ+7o6xWwhPdr5WY9wxEqo9zfLl/+4oWjHA10ZZ3ZxUmYffF1+noI?=
 =?iso-8859-1?Q?XGvows0yf3nNC+iywIZrBTFX9Q8Bc46HCZn7jk4Eu7g726GDrDmjBmp47C?=
 =?iso-8859-1?Q?jPssxvErej8r8Jx3q/6uUzwyuyJf1rQ/WKz+TAbq42rdGqc67cL6rtvnJS?=
 =?iso-8859-1?Q?rX39YRW/5Kxh/GjYU6/eSpvPnaux276HA30/6FBcA5keyqIkQQmMugZytd?=
 =?iso-8859-1?Q?M2lkgFI0yNSUG2OBWG3A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB65027064DE35FF5410674B3FCD2DADM4PR11MB6502namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e8f36.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6502.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a53dea4f-dc46-41a5-2241-08db7e975a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 03:07:52.7154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
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

--_000_DM4PR11MB65027064DE35FF5410674B3FCD2DADM4PR11MB6502namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ipmitool -v raw 6 4
ipmitool hpm selftestresult


Ping. Is this IPMI command not supported any more?

Zheng
________________________________
From: openbmc <openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org> on =
behalf of Zheng Bao <fishbaoz@hotmail.com>
Sent: Wednesday, June 21, 2023 3:00 PM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Does the OpenBMC support self test?

Hi, Guys,
Does the OpenBMC support self test?



ipmitool -v raw 6 4
ipmitool hpm selftestresult


Thanks.


Zheng

--_000_DM4PR11MB65027064DE35FF5410674B3FCD2DADM4PR11MB6502namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>ipmitool -v raw 6 4</div>
<div>ipmitool hpm selftestresult</div>
<div class=3D"elementToProof"><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Ping. Is this IPMI command not supported any more?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Zheng</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> openbmc &lt;open=
bmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org&gt; on behalf of Zheng =
Bao &lt;fishbaoz@hotmail.com&gt;<br>
<b>Sent:</b> Wednesday, June 21, 2023 3:00 PM<br>
<b>To:</b> OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Does the OpenBMC support self test? </font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi, Guys,</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Does the OpenBMC support self test?&nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
<table style=3D"border-collapse: collapse; table-layout: fixed; width: 1113=
.91px; font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 12px;=
 color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);">
<tbody style=3D"">
<tr style=3D"">
<td class=3D"x_t_f x_ContentPasted0" style=3D"font-size:14px"><br class=3D"=
x_ContentPasted0">
<br class=3D"x_ContentPasted0" style=3D"">
ipmitool -v raw 6 4<br class=3D"x_ContentPasted0" style=3D"">
ipmitool hpm selftestresult</td>
</tr>
</tbody>
</table>
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks.</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family: Calibri, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Zheng</div>
</div>
</body>
</html>

--_000_DM4PR11MB65027064DE35FF5410674B3FCD2DADM4PR11MB6502namp_--
