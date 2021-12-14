Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A427A473B88
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 04:30:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCkRQ4B0mz2yY0
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 14:30:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Ro6H1ufl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.255.112;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=Ro6H1ufl; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2112.outbound.protection.outlook.com [40.107.255.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCkQr2Hmgz2xtj
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 14:30:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0/JauQuBjSFepzX2nEIudJEXqewUFX8Zwfxw4VY8kCENapmLER3EPmiykfdsk2lA/BuQD7/8KQH6SpvTo1mOWFrn/de9Hj9RPZB7Bl/2umDxZIiQePOiy9bh9mWbVJ50JXN1uZktVTxyz9wG3MfrKpqj+QWdOKa8NWcGHkkFyV8641SDqPIm7PqfwkqWpZoezRKlfUqYaYNUEfO0Tw8hgtpgAB0rTyjnVLotzuMeyd822vUBaHCMSYzDLt0B4HTpcIvAZaoQmPYfevGwzaD3VQt+v3gNQie0w8P41mz/BnX1zrD2iE3Vo/WFJ7ucjVqtebNNCGoUpMAvH0GeIDJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR11WHD39Gfh43U7AWC4guDXWnhbs5Tr4M9clCIGCGQ=;
 b=jEZqLkwDT8bIIFvLFBomfHyjfB+AUwoXPfB2UjyXRFaHELbnnzoAi/uNkkt6qvdoYICZP/o3yA11R6jSnqr1N/TBNq/EV+ubzmWe9wiFfs8pTNNimdn79NmNdC0v8Lq8TB2okDtvIeJmj05c2fK0TBw0cV+EycQChUrsLtKmrANFPqMUn2fXHrhNygjs+vKjW1z1niXJvGciRgfALOgU0V7zm/A/NmFjDLJS1L/vsKCOWeyZ90QQ+thz6AtIqmlB1Meovet5twUliQ7Y9lNcvM414QYo8SKTnbsP3ew912/QcAf7OcBkd0Hk8gkHSRYjwKgw3EspxPovlwBZO5CImg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR11WHD39Gfh43U7AWC4guDXWnhbs5Tr4M9clCIGCGQ=;
 b=Ro6H1uflMXqK8XcL0iif2ecNTDXxobbF+8bQ1mEaS2i+CVGZNcEjA5+hc51LijIwoGrFu8ro3Lg/5pB70GJeRmryfjstFTX0UYKhN9xvSdIybGo+r4MrScN86fbWKqe7H0sdCQiebvheEmcXKb18pbE1JedoA1W3kaaimDaDd2LEkpd2BtHI0lpINjXxACmCJJSDzhU3s3OtIIpw0LR3U6SB1jvEYdQ9yO3HPpoi4HA4URak/6oUmVJEo7Gog4BwGdc9Xd8loeY4rpfxo1qkgs1lbiCj8HXVgHo8yhU/Iz0vVgX9nYleNkZBEzIEqkC0kzV2W5kzuCaJ9XWz1e6HQg==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB3682.apcprd06.prod.outlook.com (2603:1096:203:bf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Tue, 14 Dec
 2021 03:29:48 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f%7]) with mapi id 15.20.4755.028; Tue, 14 Dec 2021
 03:29:48 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Index: AQHX8FpD0Nz3v2I3x0ycyTg/sZrw5qwxMObwgAADdACAAAFQoIAAHLsAgAACI3A=
Date: Tue, 14 Dec 2021 03:29:48 +0000
Message-ID: <HK0PR06MB3380C413C9024689082AC4E2F2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20211213194703.24060-1-zev@bewilderbeest.net>
 <HK0PR06MB338026E6233FBF845BF04F5EF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <Ybf0TApJEEaM4FDL@hatter.bewilderbeest.net>
 <HK0PR06MB3380B961DEE52F90241657FDF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <YbgNgBDzrGEI+1/c@hatter.bewilderbeest.net>
In-Reply-To: <YbgNgBDzrGEI+1/c@hatter.bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb5e4215-92fe-4e7c-ced6-08d9beb1fb5a
x-ms-traffictypediagnostic: HK0PR06MB3682:EE_
x-microsoft-antispam-prvs: <HK0PR06MB3682A41A820340655DDBBFA9F2759@HK0PR06MB3682.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y5BNDVCJ2RazVeRZ87H1sKEatwP4uMWDKW1alSHaZWTSi+CinWdLtYfrh99s45Iib5JssvckSKYnEf62EvKFV+RUHen28e5I0zcjiE3EYcvjbWG+pPZXBdARPwmqz+tGRwFZDZC0GQUp1lxVT8G+As+IEZuueCpqBW0E5EE8/gKsiiGSvKV5bZD6iPRw7M5WYtBdLWxlEaggK8MwdZdd3N5Ibb/zpeEagh4Sz7llg8jlLaTZr4vgeeeopC8PPgJ9/IpGMkVLC7MIqha7m7BhbXys6Qif03Hc0Uiph+nT1B6r03ZpXwSdQKfleD0jh757O7Aa3MsBAS+rfYscJ/8rYILz/Bvp3TOME4AZS58b7vmCAfiPjKbq9/I7dfd/HDpbb9DWZrYJwgQWondM1a3VEPvrMysXgAj4PxkOSVMw2KX8yn2CDFMaSMXtDUEhfmmAX4I48qmV+AEseQC0YBi72EivPal3sfg0cXiCmcvGV/wZMo/d/3+UFz/v0hVM8qIneKketQk1J3CIUPzqjP+Lvu1SszpRcpQkEQ2jN0iIVdYSfEzGvYeHWRPbfZmeUpAXoay9Tt1xhPkZQNkuuY6Ou+4cnz66ERAguo5//aHf2LNeBaORsD+XEddFnv1TpgVzgcfredW3Ki/HtuqSsNLiexlDEgLxnx0hw/WAZ5pD2f/LXPe5ZaRilmcnmbpnnajdTTk2jR5UAQfGNkwCoqkiqlt3MitQ92f6FnSIITD+azwduApUASSrPKgEQINw/tE1J8T8ievc8ht1atudgT7bpFEB3MhLwT7REMDhVoER8H6BP0I3F9FpbJG9GMb9oc+ab5BOUirDbgf2nzCES5icvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39850400004)(366004)(396003)(376002)(136003)(5660300002)(86362001)(33656002)(4326008)(186003)(38100700002)(55016003)(122000001)(52536014)(8676002)(66446008)(76116006)(71200400001)(8936002)(66476007)(66946007)(66556008)(64756008)(26005)(107886003)(83380400001)(508600001)(9686003)(966005)(6506007)(6916009)(2906002)(53546011)(7696005)(54906003)(38070700005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LeuYvvlG8z7TXq6OUXxGzfWIhzUK5KGaOJ+vbDsDU6M8ejx1owd+d5f/Lbk2?=
 =?us-ascii?Q?KOfwIn5jyIUluC8bwBeU/e2XFeSbGKM6EPZ+D9JbGuRmHQ+bttx3UkxyndKW?=
 =?us-ascii?Q?yERjYv5IXn9yZFS+BvYSDWYHzs5VRLHHeevU2t4+CLD4fqqSQKTBNZOEshpt?=
 =?us-ascii?Q?ZL2QyUb6HMq0tsgMbYpj/rpbw5X5d15SE3uSbtfEQfbcq0vqP4irjnd4C4WL?=
 =?us-ascii?Q?NdBp2P9dWryemoZ/XnolOUUzURAU55P5gSiKNANl75sBRsDDD0SiIGkS3o0B?=
 =?us-ascii?Q?U6sB+lulqGyTUFsH4+/AYyxkqM6XaNHPJq2xkGH3ujCyYGkm0y+6ckxPiEeL?=
 =?us-ascii?Q?YhHpAsp03aLwizqsJ6wrdoCK0l2MIKN4xa4mnHzK1Zp9PxY7zmz+jxxHNSGh?=
 =?us-ascii?Q?ofpe60S4H38fi+EkSUx7x6Hufh2wrviDipe7s/W105mFI0BdVBp6UJ02zfJq?=
 =?us-ascii?Q?guU4KCHykTjL4SzIS9Uc5t4WMHMXIaX0ivZrHVCIn/X1zQvLxvEOc1rzSz8L?=
 =?us-ascii?Q?iKcKzSetN02f++5S/NFh5AIegtkgNLtE5knlQOK5AHPQtpSpqaZD2Y2rZRB1?=
 =?us-ascii?Q?NYDOhjB5ECs96gd4uuNK8Y7jvFiQc5DWLZGqb5GcqD0kHqFEapvrl5P15t8U?=
 =?us-ascii?Q?CT7DtG4ItVq9OFvZGu8RQ3Ei54a3pS8+5oct9SQHWGR4Tw15l5MSVjVk+xv0?=
 =?us-ascii?Q?mVaKOFS895g4n5W+v/pWFRAp8DAVqKtV4qZ60Is/cCLRvzmFyyYw7FgfmbO0?=
 =?us-ascii?Q?oS55gYdRjFXLlFzgmtP5sndgJ8/u/rHM8L94bGSDnT6gGOI2U3W7/D50Yj3d?=
 =?us-ascii?Q?XGUESHCIa11mTCMB9s4KqSU4D4OD/p5ABYZkqZAGDlOfxFe6NtMqyPgK8NOw?=
 =?us-ascii?Q?BsjhBcxTOzIzACLJ3AemPM2Er0mB9uSRv0SmJYWxjbNUu6RhSH+l2GUQjFHK?=
 =?us-ascii?Q?N0lUFjwDDRtBJeaIw2CUAzZXeaaSPOOR9Qntrrrh9c/I4WXEFVJxKkl78LHn?=
 =?us-ascii?Q?JRJemQw6cck3zfqr36/hVn1e/lkFu6WmhnhFx6ZqgcAvk5vswHyCPris4dBc?=
 =?us-ascii?Q?ieQRodhOmktIRUXELtxvng875eWZhS91iPxQTaTVJqnFc7kEwRRNyDC0bdvc?=
 =?us-ascii?Q?1zoGkdbEUpPw/a932ylJMdGRhN1oQcqVFQqSQwSZz4jFVf5SjW7/QyXXQU1b?=
 =?us-ascii?Q?foMo/5Ool3RX68/FbAmTF5NW/kqdDgMEkck54mrBiupqLBkK7+iE48itIAjN?=
 =?us-ascii?Q?hcFN6m52ol8dQJLjacB/DomHjjZS/sJh/f3KoM3lzPTcatzipBfctUC7csr6?=
 =?us-ascii?Q?LBzZMJXdAN00W44dYlugUGVh1TopCjVw9OEgU9iH5iKwwrSlGjxEOMCYD+3m?=
 =?us-ascii?Q?GICUbTE2d8lH6GpuXkTXIFvzHJZ5D3z/u4F7pT1iEFslxbY3Aenepf+Y3uKg?=
 =?us-ascii?Q?tZ2AVGXtS5zUBHA5Ci+IY45Y2JncVsDumVVsNJ14xsBix3V/oEFCHqKXW8KU?=
 =?us-ascii?Q?fkdxJzt+M/fxkxTx3N4zW6DJ7iCYV0OHasB4myCK97sfBa4DoZLYSpFFSS4V?=
 =?us-ascii?Q?KEl3EzMq6oDr0r4P8lFckaC3S+5hp7qD1KFD8orrYSv40tK6C/5ImR8CefHO?=
 =?us-ascii?Q?ebNbT5wzc+UNE/SX+j93wwWXo/tLTM74+E7jdyDbFjz37MoyopreFAJDYuM7?=
 =?us-ascii?Q?DHbKZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5e4215-92fe-4e7c-ced6-08d9beb1fb5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 03:29:48.4647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJMDnCm+Ow19WeEhgONSohno1aLAo90Rv+inBqTyU48iLLBVPJ3B9+LtIIgqt9gGg+08J6Gsk+DfcroQjuDffrs1Q7aX/ZddIUQNQprj6No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3682
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,
> -----Original Message-----
> From: Zev Weiss <zev@bewilderbeest.net>
> Sent: Tuesday, December 14, 2021 11:21 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>; ChiaWei Wang
> <chiawei_wang@aspeedtech.com>
> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
> support for TXD3/RXD3 pins
>=20
> On Mon, Dec 13, 2021 at 05:39:17PM PST, Ryan Chen wrote:
> >Hello,
> >
> >> -----Original Message-----
> >> From: Zev Weiss <zev@bewilderbeest.net>
> >> Sent: Tuesday, December 14, 2021 9:33 AM
> >> To: Ryan Chen <ryan_chen@aspeedtech.com>
> >> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>; ChiaWei
> >> Wang <chiawei_wang@aspeedtech.com>
> >> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400:
> >> add support for TXD3/RXD3 pins
> >>
> >> On Mon, Dec 13, 2021 at 05:22:52PM PST, Ryan Chen wrote:
> >> >Hello,
> >> >	You may need claim for function group for link, not for pin link.
> >> >	Ex.
> >> >	static struct aspeed_sig_desc uart3_link[] =3D {
> >> >		{ 0x80, BIT(22), 0},
> >> >		{ 0x80, BIT(23), 0},
> >> >	}
> >> >
> >> >	ast2400_groups[] =3D {
> >> >	{ "UART3", 2, uart3_link },
> >> >Ryan
> >>
> >> Hi Ryan,
> >>
> >> That possibility occurred to me, but the existing function/group
> >> names in arch/arm/dts/ast2400.dtsi (lines 1130-1133 and 1375-1378)
> >> made me think they should be separate.
> >This device tree is copied from Linux kernel.
> >
> >> I'm certainly not an expert on pinctrl stuff though...is there some
> >> other existing logic or mechanism to link a "UART3" to the separate
> >> "TXD3" and "RXD3" in the device tree?
> >There is no separate in u-boot device tree.
>=20
> Perhaps we're misunderstanding each other...
>=20
> https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a4
> fa5013d6dd/arch/arm/dts/ast2400.dtsi#L1130-L1133
>=20
> and
>=20
> https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a4
> fa5013d6dd/arch/arm/dts/ast2400.dtsi#L1375-L1378
>=20
The following is my point.
https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a4fa5013=
d6dd/arch/arm/dts/ast2400.dtsi#L3

> look fairly separate to me?
>=20
> >May I know why you need separate?
>=20
> In my particular case I don't need these two to be separate, but it seems
> conceivable that there might be other cases that would require a differen=
t set
> of signals to be enabled for a generic "UART3" group -- possibly more
> (sideband signals like CTS and such), or perhaps even fewer (e.g. if you =
had an
> output-only UART3 just for logging or something, and only needed TXD3 for
> that, but still wanted to use pin
> B14 as GPIOE7 instead of RXD3).  Keeping them separate seems like it leav=
es
> things as flexible as possible, avoiding imposing any artificial constrai=
nts.
>=20
>=20
> Zev

