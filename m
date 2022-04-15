Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57465020DA
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 05:21:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfhSz3zx7z3bZs
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 13:21:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ndLXtN7A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::726;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=ndLXtN7A; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::726])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfhSS0201z2xvW
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2022 13:21:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGdVEw12bqROEZxWYYVnQe+oj14Hcv6A7xkSNCs5wzYPquGyiHSe21ahh5JF6Hm0oHf4FH92drXLI/HL+kTpykLGnx4Ecc3miPLTOK+4u9OYdXgWTjxvt5aQFpu/Oa+82yvjDrFpK9xFNDHXYL2jP3foz2s9HZQQYbOJbEFhUvPSzsYEiLqmObj69idJ4HtqkE4MMqc7nieKDamBAjFyzo3v2Bt/OiHDyYHcovhAbRz1C9LmF2f375xn5KnLYm4gKd3QqLpEaIfzaNfXytr6vvSYlHmKIuidjHL7v2hLpmoSWnKxUc3uNKDi++AxADz7d4VNtfrEGhd559w902H4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1cq6DrE9qP8i8Du7YvQM611wdGxek/GC7PgzdFGmBI=;
 b=ndUV6nABA2nnA39Gi1R/hovlwgqy8f21tqFeBbpI+CZucu/e4YJCDZOIRIANLUK+5OIGBwRTQiXp5cywB+BsiUTfZOj+sRF+4Z3zSVWYBOZtt2DsTHShSInf66XYbx5RXS6v40jwLn1bIiPbRWuc1lP/TEFW4mgJAeVoy+CfbTm16RDEWM150Yr3MhySGmHcAhSnXu6Gg3NqhQia4Jjpgb6TgKAckUy+SjZATzLQ8yQOII5nV1dT+QYVxEhyET/ntFkp3e1Mvkao1ZtKqSmYWtJmB7nZe05f66Qi/R871SwC9rWkYjsYFJw12pSJ9WKJozaZmcRagqyzkqaZyTGMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1cq6DrE9qP8i8Du7YvQM611wdGxek/GC7PgzdFGmBI=;
 b=ndLXtN7AdRV33XrBrZ3JgZb8O55A/N0hXlbcfSakr8t3z2T4E+uCywgE0Og9ON5QQ8xMPbda6+oT8Leazxg4X0452OwfY/Mtn5cJfl6Gv/nPUM45JZU6vbjWeLtSif+c5F71Xn3bpRhdMjq5eEbf2VwZdbtGU3/SkIbHuZCT1wIYl3Kh4+bKIB466sU4BTsPsA/h6YSptXW+GFqJUZKxyc7Y3HCoJRW//tG/QUE8xfHndHzxb+cBkF5vU+j9Znc40xcclJEE5oSrWbGyWMx1a8BHrkRKvrwgqwHgVS5WICQDFV2/iuIEWoIGQKl21VmBVo4Woyw+sgABZJspcoQsZw==
Received: from TY2PR06MB3391.apcprd06.prod.outlook.com (2603:1096:404:97::21)
 by TYZPR06MB5225.apcprd06.prod.outlook.com (2603:1096:400:1fa::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 03:21:00 +0000
Received: from TY2PR06MB3391.apcprd06.prod.outlook.com
 ([fe80::6ca0:894d:97e2:f667]) by TY2PR06MB3391.apcprd06.prod.outlook.com
 ([fe80::6ca0:894d:97e2:f667%7]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 03:21:00 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>, Joel Stanley <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Thread-Index: AQHYUFCjQ4cXcwiUTUOHxDLCRcfyL6zwTs5A
Date: Fri, 15 Apr 2022 03:21:00 +0000
Message-ID: <TY2PR06MB3391889683F53ACE067875ADF2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
References: <20220414224004.29703-1-zev@bewilderbeest.net>
In-Reply-To: <20220414224004.29703-1-zev@bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0790dded-edc2-403d-2cb7-08da1e8ef71f
x-ms-traffictypediagnostic: TYZPR06MB5225:EE_
x-microsoft-antispam-prvs: <TYZPR06MB5225A8EE2CC77349532F340AF2EE9@TYZPR06MB5225.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vyad397R02dmvMWe1hN7oJDv1bcn90Zc43RVE78H5kTyVbrm/r8UePz6WUZLR0Z5AvGXR6MRP3NS3gHn8BZskFxuTb6ejAviXzh321X3avez+s/7x/v4jk3EfxIFLekSqlltiIB2FMN1b8X7VmvPAzBtKRUmSkI9OpMBbdoPJJOskLRbro/2JOtbGHQKx4IhnlQlwkB1vgdsOhp3TITn7UxU8u6et6x1t0wNBJRMFSRHW9IhAQre3ngk4sdmFBokQ8PHk2kfZ9Hy5Xmt1V9p6yyE81PfJbmeJXQDnOam6cPkf1YBwxmJzOX+WL3xOsk2TgB5ohGtnGaw2ibV/8vrhpu/CCEnL6CHsmbyWhw/U7PlOHAUlEk6tQsFV5kQU2FTN1ygRl4ii23szhmLsD/QikqrfOItx37MbrPOmyVQDBNpYoA6oO+BgXYY5DWomXg8PDwctLO0fNJF0ISme/LTyH8+ynSQGP0zx6ejOrqFT5SgHbeyM/5pSFa6pGLIdxrHQHsFZKzDl24UwMmnJLxXQktmTAymeobxZhvOwRKHOREWyqtvTJELuKgpFyyds7pu79KQx8xORBmV7PEkpn458b3EP67URy5kJky0JeuI/G9R/5Jx+zgz+ogThgUjaSR07YDk8R5sMGcbdvi6tqLeeq9aMuSYwIboEDUuapfmu/cGofynPLeErb8AE+mgrXfLG9n79/0PbyBK4+9Hs2kPo9/pG4b7hEt5dXmV7gjTL0I0DTnRdeUBDLG1GZ48lN+nVRCZXVXXOk7UPe2KH95mwBk24T3gt2y5j2z3knRI8cA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3391.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(366004)(346002)(396003)(39850400004)(136003)(66556008)(4326008)(86362001)(316002)(66946007)(8676002)(66476007)(64756008)(66446008)(2906002)(30864003)(5660300002)(38070700005)(76116006)(52536014)(8936002)(122000001)(38100700002)(83380400001)(6506007)(7696005)(186003)(53546011)(9686003)(26005)(71200400001)(110136005)(966005)(508600001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?44UiUgshNAIep6CXnS33aaHPHk1vb+3Qv8LU8vy04MZegpheszuu4hYPy7wU?=
 =?us-ascii?Q?tLJ4sw/JTMplDaiR9M5mNt5Yv2mhZlnWV1achvW9TlpmNRoLWGzUlP2IugE0?=
 =?us-ascii?Q?01bqh2XdgBstEmI2Aam7g6vHl/L6kYqz4ClYJ3n3S4/QK51x9a4KTeqYYPss?=
 =?us-ascii?Q?QH7bEFWjgk0wu7Ce1pHiAcaaYU8ZwP/vxSPHmKfspIxY2fY3djCApUyq1CFZ?=
 =?us-ascii?Q?HTvuvpMe4B7svDF4n79zHC9tZuXdTuwcxGRc92tn5GGbZ5mAdBY65HAO+DJD?=
 =?us-ascii?Q?tQGqVlXNc9Qh+TWG0ccdSSzXQ1NaJFqCD5PWmOlyfqPTtHvI0irbvp6oq8xc?=
 =?us-ascii?Q?ZuGVm8yEUsQWgb/UTZ0fWrRmQMU1Kfk0An2xiQxSZoolsZzSvAgz8mxTW1tm?=
 =?us-ascii?Q?F/dDZtpYNgfpcnzIxue0CLdRslfLp94WQ7IvFVNGFeOHWaZHtb3Rb+rcpC0t?=
 =?us-ascii?Q?Jz0ghfptk+PN3LJXV95pq996qCqq0fv2z2HJhXqBYkbl6DTPUo2VwUGQIWvy?=
 =?us-ascii?Q?w1tVayVgSArBtZ5iz287wsg4qc6HEf46F98Z0aItEEScEUzutYP9hOkeLlj9?=
 =?us-ascii?Q?ERyxnwds1Kjw4SsNmcMH9mGutIElt5TqyVOGvB+09arnO0/M0E+Wvn7+bNVb?=
 =?us-ascii?Q?LL8TNxYTKFdiT90KKmUPnNX1TrGmMvrzIUWuqMcQfJWD3Q+VqZbUMcNOJwgr?=
 =?us-ascii?Q?8kix8iWIoBI6+Asuw6fTvGWtBN8GckeEIv/13k4tOhWFZsX8phnEE+SdVLjN?=
 =?us-ascii?Q?8U1VX+Do6/VXzcsSWKewfBoWlsxltnG2b18RYFV0utDP8+1zIwkSR3p6P02s?=
 =?us-ascii?Q?2sRSGZentq0866bZRWOP0FgCGopURf3PqRawGFdFED4xlRu5cxvLgabWsuQk?=
 =?us-ascii?Q?lpfQKx7o5ydvz7vPP2/7Ll6aOsf0ic1hnFK91bQyDgk9hJ7xkEjhWxeZZHxT?=
 =?us-ascii?Q?oj2IiFocf8fi5xha95OJuGuN7AaUgdvHfxXfzyM9JidVfjKIgzx8rPDh+Dj9?=
 =?us-ascii?Q?+aZkjDVV/rc+HRJie0zAZeSiKNJ6P1NwPE6rpQbbgTw2DN9w4OpOJAFbip0y?=
 =?us-ascii?Q?iQA1MlrJO6tKMuF+y5/e1qC+uoHvy86q0i/QlUgMODFdUpCLtIh8hV/+3+2C?=
 =?us-ascii?Q?ndNRfG3ULOkb/YB2YeAyQyHprwgQ/Rh52TgnWdYqdvYzwhD1u0iB3EYMEIR/?=
 =?us-ascii?Q?8KjPyKQFF9xU+w0NMNX/0s7ieXz4cUQpN1dx+5icitTpooncCMnTp1a1w6WY?=
 =?us-ascii?Q?EBpUh6Aq+D9qyAvAyTW7lhZSVFLn02Bkzt2yl3SgrkAb/TPVbHHpYJOM/HSX?=
 =?us-ascii?Q?JDSkVoJf6nV4LsXCgPzneXhjGSW57LoYBAFztY80HZS392eQ1Bo5HmhtMcPk?=
 =?us-ascii?Q?gcVBLslHRJ8p+3Ih3V3km0ghPFZe0t3IXybE9YIISPkVBaVYkpQgQ5fRklqm?=
 =?us-ascii?Q?3M0jiW71FtQm2CHpbP9ud8cILSbLp0zwkj+ZEsfgtO9INntUBfYvmplq17qm?=
 =?us-ascii?Q?bq02TNnL/iuWBcmQGPR6O6N4ob+XaI8b93T7IfmW175yP/RgaeUogpysEPkX?=
 =?us-ascii?Q?rYC0sTzjDMGLvh0e6S0MhT09JnTLN3WNOmMtRwaMzeDwDlJBajhpgz7eYoGd?=
 =?us-ascii?Q?iH3+hG5cevkg7u/i5Rh/ZfRk7fuDdErRuzodB30gdBvVrcdDYNYMRvRqma25?=
 =?us-ascii?Q?QPZCJqGJHWMLXi+cYbYs7o59JE8HecaEMdl6sXlPm1r9Uyp4bmX3ADr4WPKL?=
 =?us-ascii?Q?ASpNTyt2/3BjkpXEgHtcLrDQ+X14AMw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3391.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0790dded-edc2-403d-2cb7-08da1e8ef71f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 03:21:00.3426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Z254B3SeqQG/ZshuIkQSBOKJS9dxlWZQ38YCeGG8MzwCN9ScsCDZbcgFPZe3Z2/SeKx3C9qdqTDIUZ/oeU/g10KtJnhFeEvJ9U6dydC7xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5225
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Zev,
	I don't think it is good to send a patch to enable security backdoor.
	It should not be enabled, even it user aware it.
	That will cause big issues in BMC.

Ryan

> -----Original Message-----
> From: Zev Weiss <zev@bewilderbeest.net>
> Sent: Friday, April 15, 2022 6:40 AM
> To: Joel Stanley <joel@jms.id.au>; openbmc@lists.ozlabs.org
> Cc: Zev Weiss <zev@bewilderbeest.net>; Andrew Jeffery <andrew@aj.id.au>;
> Ryan Chen <ryan_chen@aspeedtech.com>
> Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
> CONFIG_ASPEED_ENABLE_BACKDOORS
>=20
> On ast2400 and ast2500 we now default to disabling the various hardware
> backdoor interfaces as is done on ast2600, though the Kconfig option can =
be
> set to y to re-enable them if desired for debugging.
>=20
> This patch is based on a patch by Andrew Jeffery for an older u-boot bran=
ch in
> the OpenBMC tree for the df-isolate-bmc distro feature flag.
>=20
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>=20
> I've tested this on both ast2500 and ast2400, with the slight caveat that=
 the
> only ast2400 hardware I have is a hostless (BMC-only) system.
>=20
> Changes since v1 [0]:
>  - extended to cover ast2400
>  - inverted sense of Kconfig option, default (n) is now secure mode
>  - renamed some register/bit macros more appropriately
>=20
> [0]
> https://lore.kernel.org/openbmc/20220414040448.27100-1-zev@bewilderbees
> t.net/
>=20
>  arch/arm/include/asm/arch-aspeed/platform.h   |  7 ++
>  .../arm/include/asm/arch-aspeed/scu_ast2400.h |  7
> ++  .../arm/include/asm/arch-aspeed/scu_ast2500.h |  8 ++
>  arch/arm/mach-aspeed/Kconfig                  | 13 ++++
>  arch/arm/mach-aspeed/ast2400/board_common.c   | 68
> +++++++++++++++++
>  arch/arm/mach-aspeed/ast2500/board_common.c   | 73
> +++++++++++++++++++
>  6 files changed, 176 insertions(+)
>=20
> diff --git a/arch/arm/include/asm/arch-aspeed/platform.h
> b/arch/arm/include/asm/arch-aspeed/platform.h
> index f016bdaba3e7..f05747642f38 100644
> --- a/arch/arm/include/asm/arch-aspeed/platform.h
> +++ b/arch/arm/include/asm/arch-aspeed/platform.h
> @@ -15,24 +15,31 @@
>=20
> /***************************************************************
> ******************/
>  #if defined(CONFIG_ASPEED_AST2400)
>  #define ASPEED_MAC_COUNT	2
> +#define ASPEED_SDRAM_CTRL	0x1e6e0000
>  #define ASPEED_HW_STRAP1	0x1e6e2070
>  #define ASPEED_REVISION_ID	0x1e6e207C
>  #define ASPEED_SYS_RESET_CTRL	0x1e6e203C
>  #define ASPEED_VGA_HANDSHAKE0	0x1e6e2040	/*	VGA fuction
> handshake register */
> +#define ASPEED_PCIE_CONFIG_SET	0x1e6e2180
>  #define ASPEED_DRAM_BASE	0x40000000
>  #define ASPEED_SRAM_BASE	0x1E720000
> +#define ASPEED_LPC_CTRL		0x1e789000
>  #define ASPEED_SRAM_SIZE	0x8000
>  #define ASPEED_FMC_CS0_BASE	0x20000000
>  #elif defined(CONFIG_ASPEED_AST2500)
>  #define ASPEED_MAC_COUNT	2
> +#define ASPEED_SDRAM_CTRL	0x1e6e0000
> +#define ASPEED_MISC1_CTRL	0x1e6e202C
>  #define ASPEED_HW_STRAP1	0x1e6e2070
>  #define ASPEED_HW_STRAP2	0x1e6e20D0
>  #define ASPEED_REVISION_ID	0x1e6e207C
>  #define ASPEED_SYS_RESET_CTRL	0x1e6e203C
>  #define ASPEED_VGA_HANDSHAKE0	0x1e6e2040	/*	VGA fuction
> handshake register */
> +#define ASPEED_PCIE_CONFIG_SET	0x1e6e2180
>  #define ASPEED_MAC_COUNT	2
>  #define ASPEED_DRAM_BASE	0x80000000
>  #define ASPEED_SRAM_BASE	0x1E720000
> +#define ASPEED_LPC_CTRL		0x1e789000
>  #define ASPEED_SRAM_SIZE	0x9000
>  #define ASPEED_FMC_CS0_BASE	0x20000000
>  #elif defined(CONFIG_ASPEED_AST2600)
> diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> index 9c5d96ae84b9..55875fd8312f 100644
> --- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> @@ -8,6 +8,7 @@
>  #define SCU_HWSTRAP_VGAMEM_MASK		(3 <<
> SCU_HWSTRAP_VGAMEM_SHIFT)
>  #define SCU_HWSTRAP_MAC1_RGMII		(1 << 6)
>  #define SCU_HWSTRAP_MAC2_RGMII		(1 << 7)
> +#define SCU_HWSTRAP_LPC_SIO_DEC_DIS	(1 << 20)
>  #define SCU_HWSTRAP_DDR4		(1 << 24)
>  #define SCU_HWSTRAP_CLKIN_25MHZ		(1 << 23)
>=20
> @@ -104,6 +105,12 @@
>  #define SCU_CLKDUTY_RGMII2TXCK_SHIFT	16
>  #define SCU_CLKDUTY_RGMII2TXCK_MASK	(0x7f <<
> SCU_CLKDUTY_RGMII2TXCK_SHIFT)
>=20
> +#define SCU_PCIE_CONFIG_SET_VGA_MMIO	(1 << 1)
> +#define SCU_PCIE_CONFIG_SET_BMC_EN	(1 << 8)
> +#define SCU_PCIE_CONFIG_SET_BMC_MMIO	(1 << 9)
> +#define SCU_PCIE_CONFIG_SET_BMC_DMA	(1 << 14)
> +
> +
>  struct ast2400_clk_priv {
>  	struct ast2400_scu *scu;
>  };
> diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> index 8fe4028e4ff0..06dc998afaa8 100644
> --- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> @@ -11,6 +11,7 @@
>  #define SCU_HWSTRAP_VGAMEM_MASK		(3 <<
> SCU_HWSTRAP_VGAMEM_SHIFT)
>  #define SCU_HWSTRAP_MAC1_RGMII		(1 << 6)
>  #define SCU_HWSTRAP_MAC2_RGMII		(1 << 7)
> +#define SCU_HWSTRAP_LPC_SIO_DEC_DIS	(1 << 20)
>  #define SCU_HWSTRAP_DDR4		(1 << 24)
>  #define SCU_HWSTRAP_CLKIN_25MHZ		(1 << 23)
>=20
> @@ -107,6 +108,13 @@
>  #define SCU_CLKDUTY_RGMII2TXCK_SHIFT	16
>  #define SCU_CLKDUTY_RGMII2TXCK_MASK	(0x7f <<
> SCU_CLKDUTY_RGMII2TXCK_SHIFT)
>=20
> +#define SCU_PCIE_CONFIG_SET_VGA_MMIO	(1 << 1)
> +#define SCU_PCIE_CONFIG_SET_BMC_EN	(1 << 8)
> +#define SCU_PCIE_CONFIG_SET_BMC_MMIO	(1 << 9)
> +#define SCU_PCIE_CONFIG_SET_BMC_DMA	(1 << 14)
> +
> +#define SCU_MISC_DEBUG_UART_DISABLE	(1 << 10)
> +
>  struct ast2500_clk_priv {
>  	struct ast2500_scu *scu;
>  };
> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> index 579a547df61e..4bbf6fff326d 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -45,6 +45,19 @@ config ASPEED_AST2600
>  	  which is enabled by support of LPC and eSPI peripherals.
>  endchoice
>=20
> +config ASPEED_ENABLE_BACKDOORS
> +	bool "Enable hardware features that provide back-door access to the
> BMC"
> +	depends on ASPEED_AST2400 || ASPEED_AST2500
> +	help
> +	  Aspeed BMCs include a number of hardware features that
> +	  provide access to BMC internals that is undesirable in
> +	  production systems for security reasons (iLPC2AHB, P2A,
> +	  PCIe, debug UART, X-DMA, LPC2AHB), but may be useful for
> +	  debugging.  Say Y here to enable these features for a debug
> +	  (insecure) build.  (This option is not available for the
> +	  ast2600, on which the backdoors are disabled
> +	  unconditionally.)
> +
>  config ASPEED_PALLADIUM
>  	bool "Aspeed palladium for simulation"
>  	default n
> diff --git a/arch/arm/mach-aspeed/ast2400/board_common.c
> b/arch/arm/mach-aspeed/ast2400/board_common.c
> index 3829b069342e..10ce7af8c108 100644
> --- a/arch/arm/mach-aspeed/ast2400/board_common.c
> +++ b/arch/arm/mach-aspeed/ast2400/board_common.c
> @@ -4,14 +4,82 @@
>  #include <ram.h>
>  #include <timer.h>
>  #include <asm/io.h>
> +#include <asm/arch/platform.h>
> +#include <asm/arch/scu_ast2400.h>
>  #include <asm/arch/timer.h>
>  #include <linux/err.h>
>  #include <dm/uclass.h>
>=20
>  DECLARE_GLOBAL_DATA_PTR;
>=20
> +#if !defined(CONFIG_ASPEED_ENABLE_BACKDOORS)
> +#define AST_LPC_HICR5 0x080
> +# define LPC_HICR5_ENFWH BIT(10)
> +#define AST_LPC_HICRB 0x100
> +# define LPC_HICRB_SIO_ILPC2AHB_DIS BIT(6)
> +
> +#define AST_SDMC_PROTECT 0x00
> +# define SDRAM_UNLOCK_KEY 0xfc600309
> +#define AST_SDMC_GFX_PROT 0x08
> +# define SDMC_GFX_PROT_VGA_CURSOR BIT(0) # define
> +SDMC_GFX_PROT_VGA_CG_READ BIT(1) # define
> SDMC_GFX_PROT_VGA_ASCII_READ
> +BIT(2) # define SDMC_GFX_PROT_VGA_CRT BIT(3) # define
> +SDMC_GFX_PROT_PCIE BIT(16) # define SDMC_GFX_PROT_XDMA BIT(17)
> +
> +static void isolate_bmc(void)
> +{
> +	bool sdmc_unlocked;
> +	u32 val;
> +
> +	/* iLPC2AHB */
> +	val =3D readl(ASPEED_HW_STRAP1);
> +	val |=3D SCU_HWSTRAP_LPC_SIO_DEC_DIS;
> +	writel(val, ASPEED_HW_STRAP1);
> +
> +	val =3D readl(ASPEED_LPC_CTRL + AST_LPC_HICRB);
> +	val |=3D LPC_HICRB_SIO_ILPC2AHB_DIS;
> +	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICRB);
> +
> +	/* P2A, PCIe BMC */
> +	val =3D readl(ASPEED_PCIE_CONFIG_SET);
> +	val &=3D ~(SCU_PCIE_CONFIG_SET_BMC_DMA
> +	         | SCU_PCIE_CONFIG_SET_BMC_MMIO
> +	         | SCU_PCIE_CONFIG_SET_BMC_EN
> +	         | SCU_PCIE_CONFIG_SET_VGA_MMIO);
> +	writel(val, ASPEED_PCIE_CONFIG_SET);
> +
> +	/* X-DMA */
> +	sdmc_unlocked =3D readl(ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
> +	if (!sdmc_unlocked)
> +		writel(SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL +
> AST_SDMC_PROTECT);
> +
> +	val =3D readl(ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
> +	val |=3D (SDMC_GFX_PROT_VGA_CURSOR
> +	        | SDMC_GFX_PROT_VGA_CG_READ
> +	        | SDMC_GFX_PROT_VGA_ASCII_READ
> +	        | SDMC_GFX_PROT_VGA_CRT
> +	        | SDMC_GFX_PROT_PCIE
> +	        | SDMC_GFX_PROT_XDMA);
> +	writel(val, ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
> +
> +	if (!sdmc_unlocked)
> +		writel(~SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL +
> AST_SDMC_PROTECT);
> +
> +	/* LPC2AHB */
> +	val =3D readl(ASPEED_LPC_CTRL + AST_LPC_HICR5);
> +	val &=3D ~LPC_HICR5_ENFWH;
> +	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICR5); } #endif
> +
>  __weak int board_init(void)
>  {
> +#if !defined(CONFIG_ASPEED_ENABLE_BACKDOORS)
> +	isolate_bmc();
> +#endif
> +
>  	gd->bd->bi_boot_params =3D CONFIG_SYS_SDRAM_BASE + 0x100;
>=20
>  	return 0;
> diff --git a/arch/arm/mach-aspeed/ast2500/board_common.c
> b/arch/arm/mach-aspeed/ast2500/board_common.c
> index ce541e88fb8e..29554011eb38 100644
> --- a/arch/arm/mach-aspeed/ast2500/board_common.c
> +++ b/arch/arm/mach-aspeed/ast2500/board_common.c
> @@ -7,18 +7,91 @@
>  #include <ram.h>
>  #include <timer.h>
>  #include <asm/io.h>
> +#include <asm/arch/platform.h>
> +#include <asm/arch/scu_ast2500.h>
> +#include <asm/arch/sdram_ast2500.h>
>  #include <asm/arch/timer.h>
>  #include <linux/err.h>
>  #include <dm/uclass.h>
>=20
>  DECLARE_GLOBAL_DATA_PTR;
>=20
> +#if !defined(CONFIG_ASPEED_ENABLE_BACKDOORS)
> +#define AST_LPC_HICR5 0x080
> +# define LPC_HICR5_ENFWH BIT(10)
> +#define AST_LPC_HICRB 0x100
> +# define LPC_HICRB_SIO_ILPC2AHB_DIS BIT(6)
> +
> +# define AST_SDMC_PROTECT 0x00
> +# define AST_SDMC_GFX_PROT 0x08
> +#  define SDMC_GFX_PROT_VGA_CURSOR BIT(0) #  define
> +SDMC_GFX_PROT_VGA_CG_READ BIT(1) #  define
> SDMC_GFX_PROT_VGA_ASCII_READ
> +BIT(2) #  define SDMC_GFX_PROT_VGA_CRT BIT(3) #  define
> +SDMC_GFX_PROT_PCIE BIT(16) #  define SDMC_GFX_PROT_XDMA BIT(17)
> +
> +static void isolate_bmc(void)
> +{
> +	bool sdmc_unlocked;
> +	u32 val;
> +
> +	/* iLPC2AHB */
> +	val =3D readl(ASPEED_HW_STRAP1);
> +	val |=3D SCU_HWSTRAP_LPC_SIO_DEC_DIS;
> +	writel(val, ASPEED_HW_STRAP1);
> +
> +	val =3D readl(ASPEED_LPC_CTRL + AST_LPC_HICRB);
> +	val |=3D LPC_HICRB_SIO_ILPC2AHB_DIS;
> +	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICRB);
> +
> +	/* P2A, PCIe BMC */
> +	val =3D readl(ASPEED_PCIE_CONFIG_SET);
> +	val &=3D ~(SCU_PCIE_CONFIG_SET_BMC_DMA
> +	         | SCU_PCIE_CONFIG_SET_BMC_MMIO
> +	         | SCU_PCIE_CONFIG_SET_BMC_EN
> +	         | SCU_PCIE_CONFIG_SET_VGA_MMIO);
> +	writel(val, ASPEED_PCIE_CONFIG_SET);
> +
> +	/* Debug UART */
> +	val =3D readl(ASPEED_MISC1_CTRL);
> +	val |=3D SCU_MISC_DEBUG_UART_DISABLE;
> +	writel(val, ASPEED_MISC1_CTRL);
> +
> +	/* X-DMA */
> +	sdmc_unlocked =3D readl(ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
> +	if (!sdmc_unlocked)
> +		writel(SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL +
> AST_SDMC_PROTECT);
> +
> +	val =3D readl(ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
> +	val |=3D (SDMC_GFX_PROT_VGA_CURSOR
> +	        | SDMC_GFX_PROT_VGA_CG_READ
> +	        | SDMC_GFX_PROT_VGA_ASCII_READ
> +	        | SDMC_GFX_PROT_VGA_CRT
> +	        | SDMC_GFX_PROT_PCIE
> +	        | SDMC_GFX_PROT_XDMA);
> +	writel(val, ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
> +
> +	if (!sdmc_unlocked)
> +		writel(~SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL +
> AST_SDMC_PROTECT);
> +
> +	/* LPC2AHB */
> +	val =3D readl(ASPEED_LPC_CTRL + AST_LPC_HICR5);
> +	val &=3D ~LPC_HICR5_ENFWH;
> +	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICR5); } #endif
> +
>  __weak int board_init(void)
>  {
>  	struct udevice *dev;
>  	int i;
>  	int ret;
>=20
> +#if !defined(CONFIG_ASPEED_ENABLE_BACKDOORS)
> +	isolate_bmc();
> +#endif
> +
>  	gd->bd->bi_boot_params =3D CONFIG_SYS_SDRAM_BASE + 0x100;
>=20
>  	/*
> --
> 2.35.1

