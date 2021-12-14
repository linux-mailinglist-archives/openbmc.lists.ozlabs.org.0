Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C28473A58
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 02:40:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCgzl0wh6z2ymt
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 12:40:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=dbE68X0e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::70f;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=dbE68X0e; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::70f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCgzK33Xzz2xrr
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 12:39:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKpApxJsbAtVWR07ymtf2IPXiFe4TRAYG6h/vWSVMw9ksV0uyW6Ny0gkFhbibIBoxzevMoOfeb/WH4MF6mok5SaNtEaqRPUzgQ4KHrWPLFfSzu72ZIFVP8BjibJ/jd7htYZ8YSawbZyRKQieUhxE30CzJyOM8XjZnrA30tBCBt/XMwpHDsCCTmd7qKMwexxw/i1rFTKs5RRfw6oFEVMDjMWQ7mrYW98C0En/pE53bN33bgxdBcns7x8c0+Ecs49/AwFyIlwUmiIzmWkMWU/BLaFJDfZkqAJ821VS0exlAWua+BiHSp91ZmWjw0S+BGDKsdYwGHwyQ/f3babCPcuJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqWsRZGWfOwItF9LQW1MDTdBj8QIaYwfmvAK6bc3HRk=;
 b=lVYLBLpuschgRgzN8kjZdWI83PMQiDZ0rkIpkO2bjlcWn79TzoMJph4uUA9vIjFMNXMw2375YW/1URTRqAK6LlPsCQIAhHDT1gKI7HVEUtkXiwJFDZ6r04ivpUBfPHkX3PQTAdbXtBdEFh53O9H+4GmDtRUeksJ7lDoPhqsXatJ3IYTV2xZkqb2KIXZDEbWTtTmuH+PKG7okFDvNnqgvXcs6Olio37ILaKulCaXGDyL4Bw5N6039OYbLDvHLKOW6OFjQ+W74Ytufuvz2FIEZeOUGfzWZ6NGX48NRAvKm9rgxXa+0j9tC4iR7PIPdXPtb74PfQEQerJhTb0CKutV3Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqWsRZGWfOwItF9LQW1MDTdBj8QIaYwfmvAK6bc3HRk=;
 b=dbE68X0eifS7VgqsygQZ22Lpy3+MsWrZK3xC+BzbJPGajaMdgncOiv6KN8a64MVMLnLWaNULOBf7LusSwQS4EYRavKmUGdGwptiXduYAEroz8H0xbNTlcp36bR8+qBZS40z45jlelg+oKRJ1doiEJtSs+HRIDrqp0M7qbEY+HO9saP/vqQwFScGHTWG/Zw1vS7MRYaYaGyzoS8FIgYkm6xsOAJpsYrjdEpK5FXf2hqBiXX2rWMgws+qXih9OJlz/S9itm2B96/62RwSoWYmHzo00F9lpybZuasZt0eI5B9Ly9PCRGVrnclj1nLgpNMaBZwAyjFzG7h9R7JAAU8Gwag==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK2PR06MB3569.apcprd06.prod.outlook.com (2603:1096:202:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 01:39:17 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f%7]) with mapi id 15.20.4755.028; Tue, 14 Dec 2021
 01:39:17 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Index: AQHX8FpD0Nz3v2I3x0ycyTg/sZrw5qwxMObwgAADdACAAAFQoA==
Date: Tue, 14 Dec 2021 01:39:17 +0000
Message-ID: <HK0PR06MB3380B961DEE52F90241657FDF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20211213194703.24060-1-zev@bewilderbeest.net>
 <HK0PR06MB338026E6233FBF845BF04F5EF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <Ybf0TApJEEaM4FDL@hatter.bewilderbeest.net>
In-Reply-To: <Ybf0TApJEEaM4FDL@hatter.bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f46c695-7328-4b0e-ac63-08d9bea28ad0
x-ms-traffictypediagnostic: HK2PR06MB3569:EE_
x-microsoft-antispam-prvs: <HK2PR06MB3569608B1833BDF1E16F2BA3F2759@HK2PR06MB3569.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /1DpvR5HO3lQ8i21qmsWe1UjHo6iT+wv2vbOUd6dDtzqfaAWjpnE5Tax2g+NgdCYsXMhiVajjwjstmhnH2gS90++gqX9ofUtzqt5ysQiEE1Nwl4u9afrpmmL/I4dVg/tXDLGMslARx8ya7e8z9SaleAInYhK0x21BMZOAy1Ut5YO92C94V8yoLIzgpLVq2s2VaJraaklJ9puZykTnL2wzVH+u7tlxT7M0EaiqC8G2ezWY3GyUjkcyf2EzKzk7vLaIB5gv8cbfRkdTxBEBb8xysx0qrhNjgzMlblGvhzDSdG/enx3FAfxSsGvaYwlkZzZuJPm76BXLVjaUfnENu2i/ZgHLYGt4GvF6WANme1c6lm41kAEpEt9+qZahDdGiZQoL7evQ/k0xF1a7aByMh/8wZ1qXvHEBpfXSFK4TRYQPDFqK/qqsKIeUsS3LS+9OqS5L8I7STftbugYO/LpWA8X5tTrqOPyibU73WM9yNKgsbKmJuIivMkb1m9I6UNePTCdyPNqvL2oMdlUZAyHOi+3Eg9yboSh3RRH1PMHX4XewL1XcQCsNgbCKyDtaEi0FpXXS2q5NCaHciRLKRrXSMCmOq7oWGq6lnZA6MuVH+ihZZGH0D5XWYNSrhdrrUFwjoMC30CpzAPN6XFqG4Ydt8t3ErH4SHTjm2BZwFyYKGvZutLhX+mwukEvIs8LesD3cw7hBc5mArPdTOueuwpZFfq+yQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(346002)(136003)(366004)(376002)(38100700002)(6916009)(86362001)(2906002)(8936002)(186003)(76116006)(107886003)(5660300002)(66946007)(55016003)(66476007)(64756008)(66446008)(66556008)(83380400001)(122000001)(508600001)(9686003)(4326008)(38070700005)(71200400001)(52536014)(7696005)(54906003)(33656002)(8676002)(6506007)(53546011)(316002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XZSPCgjlmCYem+RKpTL/wE98CvePBUs5hSrJ0BNdc838hHoRkNV43qRGqtru?=
 =?us-ascii?Q?WRN6jL2slxKCgGe+s+XyNtJ8GjQFDQlTzYWqzBGKnG9kDMtxUAL6uU39z81z?=
 =?us-ascii?Q?iFe1va3pgwwhjYVjF6m3hypLTeGM9aVT/t8uUxmrLy/gdSwR/Y7a9ufPhxRa?=
 =?us-ascii?Q?JDK4DzqAceAYvYw0VeHg/ani9/tl17Lw3CYjsctwuDiSd9d1J4syGNyxHx+S?=
 =?us-ascii?Q?pN3iQHlLgAYatAxBzfSaSVkkXrnjjDAote8Rzkz50+HaBdWaOUuGsXcQ8GrA?=
 =?us-ascii?Q?zzNiTR0xi1SPtnXbDWv2RuU7OmirbFc8y5cqQXd8kEKB8MO6v2aL4TjTWfrr?=
 =?us-ascii?Q?nb533CfJGK7Sr4/n//bClVUUojjGBmSorY6jOSXEd1VF9cWjmgajC4lp88OX?=
 =?us-ascii?Q?DgxmiUj9WrEcnMovaW4GLRIwtT247tvXJQGPfgn7zztSoQeVJKiKLtKI1hhN?=
 =?us-ascii?Q?7gbkC7AFx4cNymCeQPKkc//6ce6EbE2tCHq2PiWVV3C6HM5zAraIX0gNSwfv?=
 =?us-ascii?Q?5bDVWiLCh9n2uvdiSTdJUN02r8tvPyeDX34g4PU+dK8jUklO7Hnhc+aGbZQa?=
 =?us-ascii?Q?EmFgoF8AwTmh6uYUDVdblnrZ1EMPmt6DTEufsjkaoFh2a0WOUlntwGq5SfYc?=
 =?us-ascii?Q?LClBEE2eQoh5ieDWbwitzFlw9VvozBX2luKdkr961pNRz98mOsOsZp8x0WUy?=
 =?us-ascii?Q?ULCXqbcdo7VzqFivCIFCxl6fdYqi+Z4//J0iw3J5BJKnlwRLu38iIqh4ArI9?=
 =?us-ascii?Q?yqMtzlu0SuDf08VIri7F7YFVHtVTugsFxhC7xprOOEEOQmY6QAT5DdnQHRTu?=
 =?us-ascii?Q?CD/tnLgHht8PrG105o+PUXW04t/EmdIS+lXaISowrqHs5bGNh0Sc+hcUyPHf?=
 =?us-ascii?Q?Dr/LpxisYDNXUrizLkzkyV8GHf8GX7OKniajkW13rcK3KfK+EgXAf9GpF5Jt?=
 =?us-ascii?Q?RyXTxHTzfGuVPoi7zVPNpMFPKfDb32M9y2rfY5EFICdT4peH3xnB0WWbqmgW?=
 =?us-ascii?Q?zX/eycASmMd84kj6S+sRAMcOSjqc3L646+ORsDMpW4W86JF9WEsQ52d4zelu?=
 =?us-ascii?Q?kIX0leea5zFGkJ/3FZR7nax9pHZTRaAZZPWQu4w2H2XKN1pZa1BSrSNpFuk8?=
 =?us-ascii?Q?RcYi6vX6IswXY9jab8zk/x4yTJi2qnMb4XILFT2S0qk62Nb6FncpauBv6O71?=
 =?us-ascii?Q?Ta3rNMj5FSA3d7W1sEjryzTRnNtRn/uKfvUUXPb6eB0rCCsDx3dqfsAMQs3c?=
 =?us-ascii?Q?q883p1CCU3m+1iPomTiifF70NIB4mEhugu2LCumSvxiHMkpaZJDqTCn9JcH2?=
 =?us-ascii?Q?E5dXPZ5S0bnaSYIQhaQsgW2AG2QWkVSakj7jyR9JUarRjgjVAqcqXAW/Xh2W?=
 =?us-ascii?Q?FA2gmkWlE+qOfoqdNgPvJY1iK/I14H7xT2z2ab0keeOsc3l+p67WAZ8tepET?=
 =?us-ascii?Q?Ch6b7umRSpArqgS+S+JtXrtmZzVXipB3Lj7QtjzNicMt8n580AeTePbSLpZf?=
 =?us-ascii?Q?8bXYmuOB8Ldf0WFmVAUdEGDcEWtUKFzg6KYGM9mji6g2S9mSrPFK7A+HESX3?=
 =?us-ascii?Q?hkd6HFzJBa9xPcb5KbcN8ugJolwn99eDYvSqatVIa9vsh34W34Kf7S3kJPoQ?=
 =?us-ascii?Q?VIFMtM8HILgbxPZQ5Yapll2i0prCIB0Xs3GLMBWL1uQnvwQQS1r5nw36j8rD?=
 =?us-ascii?Q?Rsz4Jg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f46c695-7328-4b0e-ac63-08d9bea28ad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 01:39:17.1017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZhGrzV+nd18wsHhFpdRYRJLZ4DjWE2SSmrxNFDIt9YQlnVV4zgwVURkN5ZZGryHUJc0qW+rtFDxn1yI6DhSdqMlAiZBWNsfmjiTeVyVJX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3569
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
> Sent: Tuesday, December 14, 2021 9:33 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>; ChiaWei Wang
> <chiawei_wang@aspeedtech.com>
> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
> support for TXD3/RXD3 pins
>=20
> On Mon, Dec 13, 2021 at 05:22:52PM PST, Ryan Chen wrote:
> >Hello,
> >	You may need claim for function group for link, not for pin link.
> >	Ex.
> >	static struct aspeed_sig_desc uart3_link[] =3D {
> >		{ 0x80, BIT(22), 0},
> >		{ 0x80, BIT(23), 0},
> >	}
> >
> >	ast2400_groups[] =3D {
> >	{ "UART3", 2, uart3_link },
> >Ryan
>=20
> Hi Ryan,
>=20
> That possibility occurred to me, but the existing function/group names in
> arch/arm/dts/ast2400.dtsi (lines 1130-1133 and 1375-1378) made me think
> they should be separate. =20
This device tree is copied from Linux kernel.

> I'm certainly not an expert on pinctrl stuff
> though...is there some other existing logic or mechanism to link a "UART3=
" to
> the separate "TXD3" and "RXD3" in the device tree?
There is no separate in u-boot device tree.
May I know why you need separate?
>=20
>=20
> Zev

