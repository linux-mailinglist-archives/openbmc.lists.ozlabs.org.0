Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C329C76F941
	for <lists+openbmc@lfdr.de>; Fri,  4 Aug 2023 07:06:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=O6VxIQe5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHDFY50bdz30PJ
	for <lists+openbmc@lfdr.de>; Fri,  4 Aug 2023 15:06:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=O6VxIQe5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:7e83::81d; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=fishbaoz@hotmail.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2081d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::81d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHDDx2WqMz302R
	for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2023 15:05:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HERLImgidFQ8KxHRy0XnlWMM3Hw21YUNmtGdhR0mbq5cBzLtMgDMf4ZAHmYhTJMeVqe4/mS/JWAttzwUcjJHCKd7YIcnGAifLp8Swllz/mqwK4Vx/fPXb4zAzhxtNTmaG4tDDpmTsy9QuMvQn+9fNxKLnA3tuieyB6Y2y6AA5xurfwuUNVYLkge8U0YGf5lZhmeYdmMwShB40bnDaxYX9riRrDUlKsg3uVeGXcNLUqbwtnkDzN4mJpZktblHvblDuls0lBcvzwdGPnk2Dw8Z3odOSGpjExMxLh77m9vwGEF39Km9ju5kufl1aLWvK4/wBmsDq6XUw+v0wVh4lw+9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ca5WWFewuh41HxlbAklqzH6Bud5ssSsljg47HaHIjc=;
 b=QC61xLitrppxqSiauRPGGhzZnHdzZXVa0mG1hRAUvklQQhjaMnF+P/vKoMimplJnkXJQ38D11oQVsUN/Y4jZRS+fwx/zjWhVZv2o2fGbVg8DcfAEJsIEvDj+IQ/9V92CZ3kARaD6glRJkODlJKU+R6vAitOAzE636WTc0nzDCDt37CWMEy7h0LNj3DLJgDjQ4eUV4P7Kq74ezqW2N47hmPGt0yJzHPpssGlxpEFDMcgFo3AT5WQHrbV44JTHou8jonyVajNADFlbJUILDRJ5VGFWKXSKudBSUSu9AmlvjmyglH73bECRX4nDJtcsfKSWRykGY6PKO+d1p09JPql6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ca5WWFewuh41HxlbAklqzH6Bud5ssSsljg47HaHIjc=;
 b=O6VxIQe5mjtUnFEYq38BGPxOziCMIgeicKHbVBgJM6OFARKUf1DqZsPy0ulOxc1+n6TDR45jqWtY+Z1+7TXpW8lJRHA2sPAZmsIfEnAYOi+SE1x91aEwv310AXw3B1HZ7CFL+bFW+w94IpNlqnU3qxznxYfJ2QMQAU5+XxR7zmQdXJkqe/xouQjuGsNTxFoAkhYVH89zB+r4Om2XMZgFT9cTqPSR/wZ+QS98jzJae8WH5SoEmcHiFoiqaehobPIAfjdCmZRIpW8OLPJvleuercUrOwm61iPxpLXu1QMZ6HVHdFWvcPmTzGVHcjltxOKgglQOwYxeiQBTwmyWjFovVQ==
Received: from DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) by
 SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 05:05:25 +0000
Received: from DM4PR11MB6502.namprd11.prod.outlook.com
 ([fe80::2670:725d:11b7:3ab1]) by DM4PR11MB6502.namprd11.prod.outlook.com
 ([fe80::2670:725d:11b7:3ab1%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 05:05:25 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: How can the fru.yaml is converted to a binary which goes into EEPROM?
Thread-Topic: How can the fru.yaml is converted to a binary which goes into
 EEPROM?
Thread-Index: AQHZxpBPg++/hG7mE0C7B3Td+NRlVA==
Date: Fri, 4 Aug 2023 05:05:25 +0000
Message-ID:  <DM4PR11MB6502BB76DEA9A44FEA5EBC3DCD09A@DM4PR11MB6502.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [tRDlFb57dBcyqHs3d3sKS8xMU2LAN7LTYsoEMrE/+lc=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6502:EE_|SJ2PR11MB7547:EE_
x-ms-office365-filtering-correlation-id: 19595397-d0a1-474d-79e1-08db94a86a08
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  K0scw/7KHZY9TR8F+//EL6oQO6NSGuCCIOXm2ybIdXfRo6VpmZwjU5QHlnMIN3+jPCNuOOLMRnUtxgaHKjuu0mi6uH0jG2zQh+xS8d8Ihk3BGX441KWEpNrfMqcv1e+wwC7hf1D1IA/R54vWfxr2YFcNRofnVo1duxN0jOuF1AL8mMM/uli9h/Qhqhe/Ouf0BMFBq2QAQDpTo08fEv57tS5UIpERt3vVyqgo90Ez2N/B+QA3OCH17X6qrkuTEdde2GMM3HSLbuGkyavQu+D2P+lHx0BmDWGenAJzUmHhGA76MNsW4VDPJWXD2PUSWvq1ZsjWEFU3hXcuZ9rsVad+RDibIkbAcsw0Cz4j03xdtkEVjNzUgq/cPAqdATb2N3qEhSRwrWR/ZnmfJWjtHWNhDFAMJVjy8aZbAXShJSx3S4QwmJ8nVPgspJRUIZsC4HV3ebFYRJl0hM7u42yft46OLwhdGd83dUcbY6/ur4y5JxUTq/YMy+cTDFf//8LbARcGHErBPkRzfMg4gI1RpwwcLNjg138Rx1CSS+cN/GlV1kKgsWnnmk0kKJ9A0CpeQ37PHu2KXspADjToJPHI25VP8+HP9yD8s9Eee3Bh/sGVPWk=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?XaSFA8fhumIEn7k70OGktwRgo9rqAR6Q/Vdm8EdaBRAU58UVMYiFJfo9ZA?=
 =?iso-8859-1?Q?fffgVChNMIl/muAgseUv6byUtarxXwQ+y+dB3EW4trEiykFEdqch7HQhF6?=
 =?iso-8859-1?Q?G28UQRKtbFq84TfdIZtT6qk20/CLBtq1OzivT3Fm28oTx3xZ1mCmq5TrUr?=
 =?iso-8859-1?Q?24nO5rmM0uZ6jDBhuB9rngJ7nn+qlUgQiTbl5TzVFHGPRP5ammwNatZwmr?=
 =?iso-8859-1?Q?Koo9FfJtYdEdVxyvY6D+t1390yF5jA/EpkGTr0aMVGZBsyIvMxrNluBnyp?=
 =?iso-8859-1?Q?YK4V0EWNbKOdcmIzZKFVQHB0cRrkiCQiMSyH2uNUDkr57267N3DzTuzuRf?=
 =?iso-8859-1?Q?PwKNuOIiiW78rg8YLuRkaVGomqHlfQlubFjwNAr/D135iWVSkHpsstlQ63?=
 =?iso-8859-1?Q?UoWmQGvlYuWRKG5/yKlyoQroC/wke0HkKuxh7Pq3kx5fCVBXRLVB3lPz0C?=
 =?iso-8859-1?Q?r3yMjhS4Z8Ggbq0P9xuHVqUmwkS7BsAbrn9+0Y9HnjH9uMV/kETilOVoEd?=
 =?iso-8859-1?Q?pDWJ9luxsTq5ZDhaP5wc7Gsr2nqmVmXZP9vPYPxGX9aJ5YfVVVNin5R5Er?=
 =?iso-8859-1?Q?sLmsG2Jq96JxXHNLOjRTilRyVrM5Sd8B3gt/EJwW9UlZVWc/rU6siZGhGo?=
 =?iso-8859-1?Q?cRCBVwEfoz80wsbbmKsc1sLfaaT4uwa42m91KoLIT2qilXVxQPvTJtn0br?=
 =?iso-8859-1?Q?uxwdbda6FUUYWdv4jONCipp2hrX0WAq7kOvxynh0oveceDM8hYT5i3Ekg7?=
 =?iso-8859-1?Q?sHhnCKtoWhy8pZ5k2rwrt+CzRlmxOk+KCXsoeX/OimCauo+EB8tIn/0O+z?=
 =?iso-8859-1?Q?xEN62PKgCS1OO6wOLlKTG7b0+KKOLXZauWJUjw5oPJjFsDjA0s5FvHsuSR?=
 =?iso-8859-1?Q?KaPC51QdAOlCiSGb9exN1QH+/DbYsnBZt/OyyfcqKOADK35KwVz3ShG4BC?=
 =?iso-8859-1?Q?smTh6UwaPZrB3PxSL8MJty6I6GB3SxoaLWZPz0Hzj5zfSoXxvDBINado9n?=
 =?iso-8859-1?Q?6hC+QQEtoakzWG2I2DFOlfVcZSJL2zTMX5VrQ2EFCC1MWrMR4zZ0H8FXif?=
 =?iso-8859-1?Q?dhEOG1uKKzPvSt+iA5OrkLqY9BELnGzqZ3r2gTTcbwEVSVe7R2wsegPADw?=
 =?iso-8859-1?Q?YDiRNgiRPIMPkF2nnxaHPy6MohtWYQLOUb0J4Czpp90QmsIn99t5GBTbUH?=
 =?iso-8859-1?Q?DtndB58JA8aevGuA+V28qI/S4VPZ40oQn8tRiG8LSXh2U4syiGqe2+JB36?=
 =?iso-8859-1?Q?5qBns7PrxdqqduTRrkzQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6502BB76DEA9A44FEA5EBC3DCD09ADM4PR11MB6502namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e8f36.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6502.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 19595397-d0a1-474d-79e1-08db94a86a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 05:05:25.6912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
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

--_000_DM4PR11MB6502BB76DEA9A44FEA5EBC3DCD09ADM4PR11MB6502namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

openbmc/meta-amd/meta-ethanolx/recipes-phosphor/configuration/ethanolx-yaml=
-config/ethanolx-ipmi-fru.yaml at master =B7 openbmc/openbmc (github.com)<h=
ttps://github.com/openbmc/openbmc/blob/master/meta-amd/meta-ethanolx/recipe=
s-phosphor/configuration/ethanolx-yaml-config/ethanolx-ipmi-fru.yaml>

To make the inventory defined in the yaml go to Dbus, we need to burn a fru=
.bin into the eeprom, right?

If yes, how the binary fru.bin is generated?

Thanks.

Zheng

--_000_DM4PR11MB6502BB76DEA9A44FEA5EBC3DCD09ADM4PR11MB6502namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-amd/meta-eth=
anolx/recipes-phosphor/configuration/ethanolx-yaml-config/ethanolx-ipmi-fru=
.yaml" class=3D"ContentPasted0">openbmc/meta-amd/meta-ethanolx/recipes-phos=
phor/configuration/ethanolx-yaml-config/ethanolx-ipmi-fru.yaml
 at master =B7 openbmc/openbmc (github.com)</a><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
To make the inventory defined in the yaml go to Dbus, we need to burn a fru=
.bin into the eeprom, right?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
If yes, how the binary fru.bin is generated?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Zheng</div>
</body>
</html>

--_000_DM4PR11MB6502BB76DEA9A44FEA5EBC3DCD09ADM4PR11MB6502namp_--
