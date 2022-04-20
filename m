Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BACC507F65
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 05:07:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjlvQ10Wtz2yn9
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 13:06:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=VU/hpXaO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::701;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=VU/hpXaO; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kjltq1jH3z2yNG
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 13:06:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c96DssWZK8VJUG24Sn4vM7aig2GWUDBLVS3MNmRHmwdWHbeoENuxSAjKZkxDwf8hobOhwMYylGhTpEFAXQPKAPxREjSFW6lEHbyKXDqJQDeXXH3abprHb2cgclIbQ0bZLpSDgstViwTndRsRJUtJ7+yLx/nP8KLsbnslJAq1MtRLUW7mMbv61kvJEZU70wNl7186/Lb9UqSI6iVIxDVlk93Gccgs+VcEHKPeYOqamBgCnoirb/JpbYPRyZdv0o5pd2U+Soc2lk3TzoZVuVXZIrH5Lmo9CIDA3/MgEuIfdEpTRYA7EA1WYzjmeyy0HQVbzpxf0jKmEvd9VFFdZxySnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8osW7os5ZymBH3Dgc+exRbwNh1kES1u2fMkNxl5JdY=;
 b=gRKyppQAc9uKU6nlOETwuZCadVrF0clS5ORXD3kh+JaD3HTzcW+tSl9Z//MBPHCs2pCmWcMtxYHtr/Pv97ozGpzc7lIclEoRd9EeStzwvWZ5+GnCvCH7wvCWq3OGE1HieAfTTJeAVb4TlMKAzlPWQiQ15o0TARxEb+hLgIHNeA3cIHFmQyI7YnzSJxGuQcI5Ycy181FgKU7ZPLtTmiR/icupOAmA3zsqxxS689kJn7hYZmb4RKIwTKg2fQ+UFMtug9SgV4E8G/HQtHr86F97wPu6ayvD+NsYe0cORi67FBbehjKu+uj846EUHbgVfiXoeBW+Fx2eaNn4z/DmA/UEUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8osW7os5ZymBH3Dgc+exRbwNh1kES1u2fMkNxl5JdY=;
 b=VU/hpXaOBqDsj7O51UtnMx8DnPZYCkz0Q8uVyhYrWFAmmi8yHCEmSkaa6PwK9RypspsKBP3UQLOtf/0UAZF1JZ2q8wJoaWSGax+diDMXtsc6dfzFOuXxyIg2dY70abBC62dZf13sCGL2eMykOZO6G+U1ylvqKpP6yjXLVWS8gEFGRkyoVHdJLUoWaxyMMQm50AwBAM6F9SyBk4UFXL524je7DrdHBDaebxTjEXFHINdyWQKVK/kY3HnEUNeCF69o4e2wlGzPijCIUCt5LFN105X8r2+1buEotKF8KTu+FmiAFzXQHP9lURYzd2d6wdw9j9QZ13i3yoh4Kg0LnR/ixg==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by KL1PR0601MB4036.apcprd06.prod.outlook.com (2603:1096:820:2f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 03:06:02 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::a897:fe76:bf0b:3558]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::a897:fe76:bf0b:3558%3]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 03:06:02 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>, Joel Stanley <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc v3] aspeed: Disable
 backdoor interfaces
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v3] aspeed: Disable
 backdoor interfaces
Thread-Index: AQHYVEdHOnIk4aIVwUuhjS4pJSx1mqz4HWOQ
Date: Wed, 20 Apr 2022 03:06:02 +0000
Message-ID: <HK0PR06MB3380C8FDEE1588E4BAE945B3F2F59@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20220419234202.8895-1-zev@bewilderbeest.net>
In-Reply-To: <20220419234202.8895-1-zev@bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 590efe04-fcd7-4683-4dfb-08da227ab3d7
x-ms-traffictypediagnostic: KL1PR0601MB4036:EE_
x-microsoft-antispam-prvs: <KL1PR0601MB40364176CBEB7B0275EC106FF2F59@KL1PR0601MB4036.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cTr/XqTa3vR5fh0SZ+jBhDtPWh6X5aCJAR0CfKKvAk6h2iL/FraILtqwWMTlFf/P9Nxto0tBJjdvTumh/Kgbhh9w2WfpIofEBqhES+oW3Vd0aCFMhELij3iBTmLY/+nF6dKbUoaxgb91kOMRJ2NzbBsWRc9PMUhhX6fe+brZnP6okz5rMoPCnh7+MA0Dl+rw7g0N9KLPmINr5Y+dmzItS1l0/5szOjYv4JZTkX+1xmdhzfXx7MSy5kqSu7VCM5urgBfka113K5a4nbVDeJ37Wo//k7XFZjCavRDF+3a5nYUpoExT8z1blu5k91QSy0HCr9VZe6zZuiQoMv0ogprsYem6pFnCjMhVfJKDKtrnZZnuzUf2q1vrGtHQHUelOLTsfaNiewV9zm0379JglP+W+ODpO5gShJasf3fVeVB+BNeJ0aHo+MnZMps4JFt9mKv6aTN6bcw7yKOkG8jghVeF2NgmsEf2EVLIyiV7sIQGmPoDqahFhRAAoWXSYgHltf9FFA4F+uCxClr3lxMBBlmWvdClqRMWRj2WmDdo1pW0W1NZ5LFiKWea5n9Uqz8edSWtV+XtmNXTPw0ssq19mTCSnk8ufG290cjMFS155GoaKyreBMRr44fs+qP4zsf6XCLkn9Q9Bx0VgEA7u4W+pFtefjI7wTq0+4h2qFv/ZGejDdpjyr3+wG64qVwbElZVdJDW2D4itSXwndoOzztDQ1mbkshqZyg2o3GynB7h6KskTdEJl2WKlVS71PqoXs0G3+jDtR5brj3CFDyG04jWDRayHkTJUtBTJYyTHFdR9Z6ZezIlzJSYf6ck3Fnk7hJlG8A8HGdcDzWsvVu3DmjBp/mlpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(376002)(136003)(39840400004)(346002)(396003)(86362001)(30864003)(83380400001)(55016003)(316002)(2906002)(33656002)(110136005)(9686003)(38070700005)(52536014)(66476007)(54906003)(66556008)(64756008)(966005)(66446008)(8936002)(508600001)(4326008)(66946007)(38100700002)(53546011)(7696005)(71200400001)(6506007)(8676002)(122000001)(5660300002)(186003)(26005)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?evGdvFDcAjTG1lmlOk+zWmyMnTPcrxuJnPwvs8+kAl77X9REEGPDKejdr09V?=
 =?us-ascii?Q?EvO9+V6X4eJ70sjIeHa/szcmZXOvrvIwJbJNYp6e/HB3qGGMU/uP8EZPlzqj?=
 =?us-ascii?Q?FU6HvorkRIiVQYuGfaGxCKPYEBsbArfKakSOSyUld6Dn7DCKgfTj4s4gN263?=
 =?us-ascii?Q?Csglf6ast9JoLZBYBDlxpQ6zrAvXLTBrjH5dMpvdPBhpTvZure2agdnIHmbA?=
 =?us-ascii?Q?7kNpiKj2DmMFJCQL4cLdG4WAX1GWS49LvaW1rZ3j8OsRWI2EmIMKkMw9Ll3B?=
 =?us-ascii?Q?Zapl8tXpXcwDOt/Ygmwh9g9D+SgpN24UPprLbzcuPE9diuASLkgma2ThKtLk?=
 =?us-ascii?Q?iTg8fbEiAW2FCEi66mig836f0sTBBh4JfQM1hCvpEwBz27LMwD9EMHDMe+7N?=
 =?us-ascii?Q?x7CloUOMQ4WB4uw9j7b9H8tRbgvHBb0FF258M/Y8p7dSlb1OEOvUiIv8ZdFW?=
 =?us-ascii?Q?/LXdOWSWl9VRtUNXW09yPeOwGT8PX8Kq+G4O5KvyW91ndznMrcgTuDpTWX/g?=
 =?us-ascii?Q?0XlUCquIk29ZR2Gbc22Xw4WH8r9nMBq2oZsWjJnBnRa6p6UdNf3NcOGwiu0B?=
 =?us-ascii?Q?85QSt0l2g78EH4M9ncaFvON2bIxx1ibQZ7mb5t2+8KUIFtlW+H38CzRo/hE3?=
 =?us-ascii?Q?bUIKnYR9KGRjxos3fV6d2IhWQeq9Y4Y7wpGzBYoZ2f0dtJAmGRumx3Y4tWHI?=
 =?us-ascii?Q?np5Yc2Gafs2D0KsLbd/GBWFhBMphLIrvUcxyw4Fe+aXYy4Jpgp4YlNlzqiFo?=
 =?us-ascii?Q?xGKKrh67HPDD+ifmz3gOsjT1300Rt9tcbP9+9/7URKm9LBS6iRZszw3heQgD?=
 =?us-ascii?Q?0X4fSGBYdJvP2mKp3OKmJErA9EqDw7fYN1g5NMJLJEFSj0Q9xCJxY2E1uVBt?=
 =?us-ascii?Q?gKxRd6ijtI8pINAQ5YNr0/pFqP5S31AP/wqAHd09DCbJP6c7OhLrElUkaovH?=
 =?us-ascii?Q?pxCc6qc2PogLSCDVa9IH45htaDTnVDJs4q9Nbdx6XFTKKMDckSl8tvX6eqcN?=
 =?us-ascii?Q?xDOLMGlA3NvyNh8oolryONT063GmkGxJCf5RGb1dMOZJFzquHovIvL9CPbMC?=
 =?us-ascii?Q?iYBwRxhi6DNg5fQSWVmJBxWDOpZtE81cwofduGh/3GqwfiED5qnXiSKWSPMj?=
 =?us-ascii?Q?ztjZjA4YVEl6kN9oPncJmW73fgSC9qjQCLEWdZiwxcaPQnC4xWy1YaZ2VY2u?=
 =?us-ascii?Q?x3Ra33fyGYnO+qUD/nvYcBLE+JCEKSNt63vI8J9AgaBNz1a9kQtCVxK5nWIR?=
 =?us-ascii?Q?UpjnQzUkI40p5HH7Y6vIUjaTwEGbEkYlsVEGmdu5TlJw7Z4tEU0OAkTDM6pw?=
 =?us-ascii?Q?WWabC9x02CfSPEMmFxx5ZuItQPbQCqNGW7Y5+lw0vL6iMhPf3lluRFD5lLDX?=
 =?us-ascii?Q?+yAw+uotJPvsJ9oq58xGOWJZdmMLXQtDeblHzB9c+cpUd3uxaY2bKLIMTEpn?=
 =?us-ascii?Q?cqH7bXmGUGcGrPL2ejsDQDicifRq/3QvJLr17JIuqm/LSPwCZD+nilzys7Sn?=
 =?us-ascii?Q?utqhbVqxB5NMEgNIkstj/ImINm4T2esf6eYtCfZEP0yhwVyVtCXcfI11XN4Y?=
 =?us-ascii?Q?7DRN7k4Rf95z6hmmnSeHnwrxwyOgEqNazk3vxH+dH6xnDZQSwdoU7+pOaIG8?=
 =?us-ascii?Q?jDewTamplIRlgsSlmMYJI0CvRr86jGAj4L5Ls9cn0B/9dbQP8v39MC6DM8bO?=
 =?us-ascii?Q?yPvEH3X4Edyyqobz7bj0184Dn2EgV29CjWwa/cbEwenUF2BuNc+sCqXh+Nv7?=
 =?us-ascii?Q?W6vZQZjJ3w8NykH++HAfBr4fR05xlSM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590efe04-fcd7-4683-4dfb-08da227ab3d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 03:06:02.3057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PH3qJcfDI7z63l+dimjjKjBQnatFZH99sk4CWhG/YdJOdxH1lEcSYS/ZML3ark4M0TbxLdN1x9zxHDZzy34cKYDpRF1fAbZktKoe08yL6BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4036
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Lei Yu <yulei.sh@bytedance.com>,
 Ian Woloschin <ian.woloschin@akamai.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> -----Original Message-----
> From: Zev Weiss <zev@bewilderbeest.net>
> Sent: Wednesday, April 20, 2022 7:42 AM
> To: Joel Stanley <joel@jms.id.au>; openbmc@lists.ozlabs.org
> Cc: Zev Weiss <zev@bewilderbeest.net>; Andrew Jeffery <andrew@aj.id.au>;
> Ryan Chen <ryan_chen@aspeedtech.com>; Ian Woloschin
> <ian.woloschin@akamai.com>; Lei Yu <yulei.sh@bytedance.com>
> Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3] aspeed: Disable
> backdoor interfaces
>=20
> On ast2400 and ast2500 we now disable the various hardware backdoor
> interfaces as is done on ast2600.  Two Kconfig options can selectively
> re-enable some of these interfaces: CONFIG_ASPEED_ENABLE_SUPERIO leaves
> the ast2x00 built-in Super I/O device enabled, as it is required for some
> systems, and CONFIG_ASPEED_ENABLE_DEBUG_UART leaves the hardware
> debug UART enabled, since it provides a relatively high ratio of utility =
to
> security risk during development.
>=20
> This patch is based on a patch by Andrew Jeffery for an older u-boot bran=
ch in
> the OpenBMC tree for the df-isolate-bmc distro feature flag.
>=20
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>=20
> Tested on ast2500 and (hostless, BMC-only) ast2400.
>=20
> Ryan, are you OK with having an option (off by default) to leave the debu=
g
> UART enabled as in this version of the patch?
>=20
Thanks your submit.
Again, my opinion still keep the direct patch to disable it.
Not have config to enable it.

Ryan
> Ian, if you could test this out with CONFIG_ASPEED_ENABLE_SUPERIO=3Dy on
> one of your systems and confirm that that setting works as intended that
> would be great.
>=20
> Changes since v2 [1]:
>  - made most of the changes unconditional/unconfigurable, but added
>    Kconfig options to leave Super I/O and debug UART enabled
>=20
> Changes since v1 [0]:
>  - extended to cover ast2400
>  - inverted sense of Kconfig option, default (n) is now secure mode
>  - renamed some register/bit macros more appropriately
>=20
> [0]
> https://lore.kernel.org/openbmc/20220414040448.27100-1-zev@bewilderbees
> t.net/
> [1]
> https://lore.kernel.org/openbmc/20220414224004.29703-1-zev@bewilderbees
> t.net/
>=20
>  arch/arm/include/asm/arch-aspeed/platform.h   |  7 ++
>  .../arm/include/asm/arch-aspeed/scu_ast2400.h |  7
> ++  .../arm/include/asm/arch-aspeed/scu_ast2500.h |  8 ++
>  arch/arm/mach-aspeed/Kconfig                  | 22 ++++++
>  arch/arm/mach-aspeed/ast2400/board_common.c   | 66
> +++++++++++++++++
>  arch/arm/mach-aspeed/ast2500/board_common.c   | 73
> +++++++++++++++++++
>  6 files changed, 183 insertions(+)
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
> index 579a547df61e..fc565e0da830 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -45,6 +45,28 @@ config ASPEED_AST2600
>  	  which is enabled by support of LPC and eSPI peripherals.
>  endchoice
>=20
> +config ASPEED_ENABLE_SUPERIO
> +	bool "Enable built-in AST2x00 Super I/O hardware"
> +	depends on ASPEED_AST2400 || ASPEED_AST2500
> +	help
> +	  The Aspeed AST2400 and AST2500 include a built-in Super I/O
> +	  device that is normally disabled; say Y here to enable it.
> +	  Note that this has security implications: it grants the host
> +	  read access to the BMC's entire address space.  This should
> +	  thus be left disabled unless required by a specific system.
> +
> +config ASPEED_ENABLE_DEBUG_UART
> +	bool "Enable AST2500 hardware debug UART"
> +	depends on ASPEED_AST2500
> +	help
> +	  The Aspeed AST2500 include a hardware-supported, UART-based
> +	  debug interface that is normally disabled; say Y here to
> +	  enable it.  Note that this has security implications: the
> +	  debug UART provide read/write access to the BMC's entire
> +	  address space.  This should thus be left disabled on
> +	  production systems, but may be useful to enable for
> +	  debugging during development.
> +
>  config ASPEED_PALLADIUM
>  	bool "Aspeed palladium for simulation"
>  	default n
> diff --git a/arch/arm/mach-aspeed/ast2400/board_common.c
> b/arch/arm/mach-aspeed/ast2400/board_common.c
> index 3829b069342e..7134105232cb 100644
> --- a/arch/arm/mach-aspeed/ast2400/board_common.c
> +++ b/arch/arm/mach-aspeed/ast2400/board_common.c
> @@ -4,14 +4,80 @@
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
> +#if !defined(CONFIG_ASPEED_ENABLE_SUPERIO)
> +	val =3D readl(ASPEED_HW_STRAP1);
> +	val |=3D SCU_HWSTRAP_LPC_SIO_DEC_DIS;
> +	writel(val, ASPEED_HW_STRAP1);
> +#endif
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
> +	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICR5); }
> +
>  __weak int board_init(void)
>  {
> +	isolate_bmc();
> +
>  	gd->bd->bi_boot_params =3D CONFIG_SYS_SDRAM_BASE + 0x100;
>=20
>  	return 0;
> diff --git a/arch/arm/mach-aspeed/ast2500/board_common.c
> b/arch/arm/mach-aspeed/ast2500/board_common.c
> index ce541e88fb8e..c63fe466eb4b 100644
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
> +#if !defined(CONFIG_ASPEED_ENABLE_SUPERIO)
> +	val =3D readl(ASPEED_HW_STRAP1);
> +	val |=3D SCU_HWSTRAP_LPC_SIO_DEC_DIS;
> +	writel(val, ASPEED_HW_STRAP1);
> +#endif
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
> +#if !defined(CONFIG_ASPEED_ENABLE_DEBUG_UART)
> +	val =3D readl(ASPEED_MISC1_CTRL);
> +	val |=3D SCU_MISC_DEBUG_UART_DISABLE;
> +	writel(val, ASPEED_MISC1_CTRL);
> +#endif
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
> +	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICR5); }
> +
>  __weak int board_init(void)
>  {
>  	struct udevice *dev;
>  	int i;
>  	int ret;
>=20
> +	isolate_bmc();
> +
>  	gd->bd->bi_boot_params =3D CONFIG_SYS_SDRAM_BASE + 0x100;
>=20
>  	/*
> --
> 2.35.1

