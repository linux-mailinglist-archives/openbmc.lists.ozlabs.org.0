Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C5858D19D
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 02:59:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1vqc4dzPz30Mr
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 10:59:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=KcxJKKN1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.93; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=KcxJKKN1;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2093.outbound.protection.outlook.com [40.107.117.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1vpz4M8pz3bnM;
	Tue,  9 Aug 2022 10:59:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmmHZKfdvcUOpeWKNQ6zSs9Zv/ZwZq2VGjFZz2jzyO1k6Da34jOQnkhKixZFwWG/m6de97o6GNR1+owv2mzilP3tZFXUdOE2qW2KIOglcS9xY3m0WSQBGByWZ4yrqW7Jx58hXzw3VOv6VjQ+l1Vm7IyngcicwwBEgVsWT6IvfIXTYZxORCP9bSrZVeQg6vtr1J4sG6AssG7ZBpreNokvJWIlWyQno1a6xyYvQuhaV67+nFq3x0qZCjizqrseqjbYIUUHAnui3GwLk5fcjrXOK9iCtPCVTjodTnfk+E6TGQXa7A8SrYlqJWSE1W76PzpnjtK8mRoU6ai0ONEPCVHdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vc3lQeJjmG42Vu4uDqA7R7UqMNmUPCtk+iUr/1UPH70=;
 b=XfmXhAvN2vrbBrUlFMxhKU4QcB6Y47osB09/eVF4lMZkUYe3gtsmFcCPiIzejxfOVPdz/64j1GV2cCnNY2zKq/Yc4YQVR5j2AkJOQbp6cSnXkp6SENH/IxO4ChLJQsQdP/dQnGGUtpShSjWvaQ2BnB2yjkXCQWT5GYCvWy3Fo0/KM8185e4myG8k77Y3QTzZzdiidBwFo4uPmt9xSe/dinrCkZh51QacNbYebe5cKKX1tVZ+UeWpcA+eDMc9Ga605X7TXkMBHgHpPpwVmQTjDywC2B7TncxMm2CLGxSkXfpOzAa7J+6c4msChpUHHwOnI+QF/bbfhTiJL9WmbuWvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc3lQeJjmG42Vu4uDqA7R7UqMNmUPCtk+iUr/1UPH70=;
 b=KcxJKKN1ldxXGIfl9/iBVOgp9dCzKj5mRjCveO8e8HbiFFudKENXjtpgKxL+j5QSbzWlLrRRRA2zuJvH/KiUcHuGHxmzd17/DIiw1+CZPH9Teosor25iATVgn9OA+RCSkVz1R0rgUDMQch95Q6LKV96QPsPjKMylEls7AxxT3NLvw7IkKNyxyre2acof20U2Nn+5l4TkJQDPxi4Eg4gbMcFUgNIGB7N0qrMZVgc5ZjN4Gurwgwsf0JVXyZCbVbjh9e/JICf72mglKS8EFuBxjEU/5b4zUikInWCfDEPbvYk3dQysWQpLrM58weSRpjPGFvQuqFXxrjfhANMJyAoxnQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4297.apcprd06.prod.outlook.com (2603:1096:4:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 00:59:01 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::80c3:a65e:1caf:2b32]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::80c3:a65e:1caf:2b32%7]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 00:59:01 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Philipp
 Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for AST2600
 i2C driver
Thread-Topic: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for
 AST2600 i2C driver
Thread-Index:  AQHYaPENO2grG+HzSECGUwldbn2ojq2VE+oAgAAINMCAAARRAIAGqoiggApywoCAAAVaIA==
Date: Tue, 9 Aug 2022 00:59:01 +0000
Message-ID:  <SEZPR06MB5269B2ACF6D765E214FD6DF2F2629@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
 <20220516064900.30517-3-ryan_chen@aspeedtech.com>
 <5d863bc1-4f27-48b6-89ab-c3f02bc09057@www.fastmail.com>
 <SEZPR06MB5269DFE2CF762B62846D315EF2999@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <4c4462a6-e950-48cb-b9ba-822909a86867@www.fastmail.com>
 <SEZPR06MB52695BDBE90ECE00DB2D9684F29D9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <cd11b517-ae6c-4a67-9f43-74825812b00b@www.fastmail.com>
In-Reply-To: <cd11b517-ae6c-4a67-9f43-74825812b00b@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2b56357-fe90-47e6-ec8b-08da79a25900
x-ms-traffictypediagnostic: SI2PR06MB4297:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6xexdJ3+JmBpSXMCRJNmG/m188oV/k6WRXcguJ48k6Ukfdw+Lh2SkpfBjLwST7ngMOC20mkU2nXuDRLAIU7sVD2NTuD+R69lsRhadb0ysXzijF/nD4z/SCI3ll7NJT/OqWa3pEmM3bvfKhIodRh/ZsRpLcX4YTifCfCUXatqyiH8FYr8tKpvZ6d/oihqRRyT5WshYS8KfpE3B65DYU4N69SJ6joBNIqSo8vb0/K9LYMSY2XNN6CJvye8EZsJYgIijsxqI5qk3XXBWKnrxRoRBpWjrwWVV0bgsbJ9KOPZ1XfdV1JLKqFQQ7geZ8Z2N0cXS6D/wVoxa3STVpQ67xLXitu2zWuCK/fuJobqQj4JtUJi2wyBIwGhW0ppcno0hqkgVcui0iWpNh5RoxULkFn+yh5Udd32hwbSRjVHph325l7YjMgUYhYXOvnXWcptrqAkHBNhPJyyhkS23B/LqmhhWVn8MVGUCk05pT/CmDO7dunf7zb3uLyLsTXXEL4Wsh4tl1A/F1GOu6iAYaHJXYEqqAGR9yQq34BsRwIUXxaPvA1CEuRWpKQuW71UiVIHSumOGtDSMd5/jmGgJ9Y7kacWpPHVAKHiN2ksBLq/kL26Lkh+HCgP4K/qc1DUhHKQkSpfQmnRzgTBU4XsukBsE/92DCmB41BYNIVjuWA7HianbO6g9Qbxt3b4uuuqo4w9TU53gScHsRDOho3FzmQVU2j96IJ7430lny0iXpxnmCOm1Bve3pAAPQ26l6fCQNzbOtiPXp25YI0gyt6LaIISzAJXKE/hLssd1SEogO9pKf8z6mNo9G3jAUNSP59KgtHAH9ku
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39850400004)(366004)(376002)(136003)(396003)(4326008)(76116006)(5660300002)(122000001)(8936002)(8676002)(66946007)(66556008)(186003)(66476007)(64756008)(316002)(110136005)(66446008)(71200400001)(52536014)(478600001)(107886003)(2906002)(26005)(9686003)(33656002)(41300700001)(38100700002)(7696005)(53546011)(6506007)(55016003)(83380400001)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?KCQUrVk7AlGe7NGw1Yh5q/d0SZgAE2J9RsfeYuaCalYosoJEs5nWtt/0FAhp?=
 =?us-ascii?Q?XLZ6GJyMVTfDvmHUhZa+OnE+DL5/vzc2q3egresIe0IL/eS/BTzFn6nQQGhD?=
 =?us-ascii?Q?+s0RJGI9E82DWMFKK4KcfGRJfYiiF34R4W5ZsvV6xZ9ByeGJMSm9W6KdZuSI?=
 =?us-ascii?Q?PxdVe7HepjgnqJ3Gn2MrDecU0tM6enmw9paYyjltnLlZeSDv1EF7l7/Sw//a?=
 =?us-ascii?Q?ZfUREPWpxgAbfF3Z6+5CCymyhTTymB4QIgnEdZNakdFiwhRoAubUHGIJtmso?=
 =?us-ascii?Q?kZqGz8J027ww3NLquwF1l/hLH0LqyVE3CnCasVYtZXWe5ERGszRl40+zFw/B?=
 =?us-ascii?Q?wmWefHvDjGhVK2z+vusBYUyQyi7JGzDKS7aFWeCmAI82nAho9nMWMbQCDN9/?=
 =?us-ascii?Q?XC2/K3JYzrFB+M1k+KYJx/SxfgmwT8yiUdvT8fFPIDWhYusPaI57hcmh16PY?=
 =?us-ascii?Q?oVWdg0t7M3aueJB+oFovIYK2vH0uuVQb50X6PKyIxtxCUVtnqJv/wRncXTdT?=
 =?us-ascii?Q?uxCT0QWqf+tJZWXxnqBO5LHtGuUlJg6s+Z2mJ8SsVhnlYqThbt4vRq+KgD6c?=
 =?us-ascii?Q?Xf9m8JuZ/nlOqW58GpTZ5czzgk/1bmHljZThb6dkrINwOJTFCXxGO7K6CZkG?=
 =?us-ascii?Q?3QGp0fB9XwDaIfdqRkWlZR6VQpD71OPJ5s2vG8Zf3tIBI4tByDjd8TSO9QrH?=
 =?us-ascii?Q?ySnhvJWiXQYVethVJBIvG7RxFxNT60U5DBkGXN8WOmLqW58gHoA1Lt7LfSI8?=
 =?us-ascii?Q?A6PIpRWZZkvKSHjQaByLNhhgEnEnwLBl5PbG0gkIHfeGyEABaPiRtb29UYuR?=
 =?us-ascii?Q?83C6xr3srXxQ6mI9t8yK2BDuULKKbVaSpi459s0A+WyIltXjYeJ0pY3ykUJU?=
 =?us-ascii?Q?qvl/MqKLKb7x6bAefxfjs63I0IgtGzqTYh6aGhoi9W6iuR7fSsRqlsLIX+zW?=
 =?us-ascii?Q?jK+C6RwKErBHd45FW7EtNFwTBBxfnZUQndxmeqGD5yp31D5Xi815k04CDo8+?=
 =?us-ascii?Q?RoAV4nd97/nL3FygWcGskZ3razi/j6MRGL1eihIYfLrHrWSiMwEiLvWZbiOy?=
 =?us-ascii?Q?s8wtala7nfYoACBf9eNECAgPNI+Ezfh2H0H1uFluLagiOZ81V5kZ7jIeKVk9?=
 =?us-ascii?Q?2zGkbZhg0dSJJikfQIi2nw/jfprk1QLJoZ9snX8oHVoAMpHRppXBLlaVNigq?=
 =?us-ascii?Q?LnB3ol9yTXTCIpHtU4Wj6ZYtEeAkRzysY4JRL03w3INO9Wk2mrbq/6+NT51i?=
 =?us-ascii?Q?C93pmwO4CU3R0nuGOLDobwye8FSqrH40yJh4hYKwTVR3oO0pJAjWKD0S2Lod?=
 =?us-ascii?Q?Bwj8jlFC5ie58RQ2h9I9qYoHH7D3C+SrSfWovR7BbgOPIaJxzxw9pbfWhi6x?=
 =?us-ascii?Q?cyH8GXsD/xP60qIWYgtUnt8A69ghf2fNegvjAAO6DJ4pVrmlC/DRwnU1aUSb?=
 =?us-ascii?Q?HTCkkNHDCYQeI5E5au1tDtzPeQLXq4Uink2JfGjUUzsOnFnzDLqSgaTYApas?=
 =?us-ascii?Q?0h07c2WWaVSnQs8QtTcgYQQcevFpE8Q0p/LrDTa3Cp54Di2bJJQjNI9sY5Yh?=
 =?us-ascii?Q?615sxZqKEYxCH2fkuTMURYCvMwyPDKZletYh0IBM+yyZQ0sMXYqrtalzuaV2?=
 =?us-ascii?Q?TA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b56357-fe90-47e6-ec8b-08da79a25900
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 00:59:01.0617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5WZoMp5PxE28WhPFZn8Lm1ws5lBWlfVomIACzBPfbiSsBn1Hm1sMtTztevfPh+0hy8s+VmAkJDmLC/oM6qpe2pZSW0l6QsY3R29pNE0SWQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4297
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Tuesday, August 9, 2022 8:35 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>; Joel Stanley <joel@jms.id.au>;
> Philipp Zabel <p.zabel@pengutronix.de>; linux-arm-kernel@lists.infradead.=
org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> openbmc@lists.ozlabs.org
> Cc: BMC-SW <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for AS=
T2600
> i2C driver
>=20
>=20
>=20
> On Tue, 2 Aug 2022, at 18:34, Ryan Chen wrote:
> > Hello,
> >
> >> -----Original Message-----
> >> From: Andrew Jeffery <andrew@aj.id.au>
> >> Sent: Friday, July 29, 2022 11:13 AM
> >> To: Ryan Chen <ryan_chen@aspeedtech.com>; Joel Stanley
> >> <joel@jms.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
> >> linux-arm-kernel@lists.infradead.org;
> >> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> >> openbmc@lists.ozlabs.org
> >> Cc: BMC-SW <BMC-SW@aspeedtech.com>
> >> Subject: Re: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings
> >> for AST2600 i2C driver
> >>
> >>
> >>
> >> On Fri, 29 Jul 2022, at 12:33, Ryan Chen wrote:
> >> > Hello Andrew,
> >> >
> >> >> -----Original Message-----
> >> >> From: Andrew Jeffery <andrew@aj.id.au>
> >> >> Sent: Friday, July 29, 2022 10:29 AM
> >> >> To: Ryan Chen <ryan_chen@aspeedtech.com>; Joel Stanley
> >> >> <joel@jms.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
> >> >> linux-arm-kernel@lists.infradead.org;
> >> >> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> >> >> openbmc@lists.ozlabs.org
> >> >> Cc: BMC-SW <BMC-SW@aspeedtech.com>
> >> >> Subject: Re: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings
> >> >> for AST2600 i2C driver
> >> >>
> >> >> Hi Ryan,
> >> >>
> >> >> On Mon, 16 May 2022, at 16:18, ryan_chen wrote:
> >> >> > +    i2c0: i2c-bus@80 {
> >> >> > +      #address-cells =3D <1>;
> >> >> > +      #size-cells =3D <0>;
> >> >> > +      #interrupt-cells =3D <1>;
> >> >> > +      compatible =3D "aspeed,ast2600-i2c-bus";
> >> >>
> >> >> This isn't quite right with respect to your binding description
> >> >> above
> >> >> :)
> >> > Yes, the compatible need to be " aspeed,ast2600-i2c" is that your po=
int ?
> >>
> >> Yes, but only if we agree that we should have different compatibles
> >> for the different drivers. I'm not convinced about that yet.
> >>
> >> I think it's enough to have different Kconfig symbols, and select the
> >> old driver in aspeed_g4_defconfig, and the new driver in
> >> aspeed_g5_defconfig. Won't that gives us the right outcome without
> requiring a new set of compatibles?
> >>
> > The new driver in aspeed_g5_defconfig.
>=20
> Right, behind a new Kconfig option.
>=20
> > And different compatible string
> > claim will
> > Load the new or legacy driver,
>=20
> I don't think we need this. It's enough to enable the new driver in the d=
efconfig
> (and possibly disable the config option for the old driver).
>=20
> > it should ok like the different
> > generation SOC. Have
> > different design.
> > Am I right?
>=20
> We have SoC-specific compatibles already, so the new driver can just bind=
 on
> the compatibles for the SoC revisions that have the new register interfac=
e. The
> old driver just binds to the device in the SoCs that have the old registe=
r
> interface.
>=20
> There's an overlap in support between the two drivers, but for people who=
 care
> about which implementation they use they can choose to exclude that drive=
r
> from their kernel config.
>=20
> None of this requires more compatibles be added.
>=20
> Does that help?

The kernel device tree driver use compatibles string to separate the driver=
,=20
like currently aspeed_g5_defconfig include the ast2500/ast2600.
So use dtsi/dts to separate which driver to loaded. Use can use dts to choi=
ce which=20
driver to loaded.

So keep the dtsi/dts for user implement to loaded should be good, right?

>=20
> Andrew
