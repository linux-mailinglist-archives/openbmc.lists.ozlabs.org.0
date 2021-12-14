Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2E2473A24
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 02:23:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCgcw449Yz30Hj
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 12:23:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=zWseV/c0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.255.114;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=zWseV/c0; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2114.outbound.protection.outlook.com [40.107.255.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCgcL3WkDz2ymg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 12:23:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5TjDRu3xaosfqn/pv21JRY6cpwwQOW6ljzBSWMrWcLYlS22uqSwddvkVK/kM8SPe7/MNuvjVeKo24Kjb+1vpsXEoOJ06ErNA4E5+3YnzH5io3qCw3h1ddGd9MLFCFdgcajCXgVop0Xmi4jltdGVeQdC/e9BTiM3ERe1C4ifNiaJIkmvLsNrEQQVZ5/iei/T9f7gfVILspHaTInGQSYWSoX4XEMYCXbfTLxsyxXDszJ40OcTLWIKePZgeQC1lgCkoyEbLwqGOIdOiq/1+yBVnhA/5ri4TQnkp4A7ey2/FrUxIxPGPia7YUfEFgQ9Wv1ydGFSLIKTR+g96BC3EcHPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZEaEE2ssSx3tX0izfVFyr3y8mYppnL658MjgUoRWBw=;
 b=XDpDr3R0k5U4p8tCVKapw/4eNwTuh78wn9qByntjnRit4LwdpqLCEw00hI/gqEFHGN/3Huw9VbLE3YGsyjEvx2BS4iz0icFipFvuCMGMUWSs05tWuC3+scEUgwymTCKwuuXhfuHHbcibpY5Q8jxFsk15Ycy5uj0YpUjdznCLlKPfy2o6oMIlZ7sC1cyRZ2A2YLlARG/8gOen6qLMi9aEZndnKJ/YkiNSbgOPiI9Di6T9Gxb7desKIeHJjy5n1XdkIUBNH3OaUPZTQJA8ctv8ZKE/2JtIIy1KbPGmDr0b5UCZSiewmaGzV9mNhGJrT0+jd9i6xG/C3RbOpEAI1CigYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZEaEE2ssSx3tX0izfVFyr3y8mYppnL658MjgUoRWBw=;
 b=zWseV/c03ZY/ISMdwuA/OFC2rbZEbHJRzJqtVyPbYAVgAQL3cgGxI4PLGpCEhMKD8W79ktpkAW81FZ9jm0j5cDm+AgP6AJxOexEOMC7JCtCZZS52We8neluDXOSHH/EbJumvgMjHcAJ43BjGyDqs0KczDGmrL0xnnIYB0PELtjUngL2DfbX2+NEh9EfIVymoCI9JrXFwf5fwichk3TYBar5W23NbSunygj4SKiPWgc41Xob3LcQI1p1CYtCy5FXTH3spYoRWioGtCVFj9wF/m+qqfOKCvQb2cBkfEEZA5g/J9quRhkh+Ek1MbmChyyfuXNxbVn7naXMMghZzUdZuMA==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2833.apcprd06.prod.outlook.com (2603:1096:203:30::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 01:22:52 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f%7]) with mapi id 15.20.4755.028; Tue, 14 Dec 2021
 01:22:52 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Index: AQHX8FpD0Nz3v2I3x0ycyTg/sZrw5qwxMObw
Date: Tue, 14 Dec 2021 01:22:52 +0000
Message-ID: <HK0PR06MB338026E6233FBF845BF04F5EF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20211213194703.24060-1-zev@bewilderbeest.net>
In-Reply-To: <20211213194703.24060-1-zev@bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c327cf7d-6933-4ee1-a440-08d9bea03fb7
x-ms-traffictypediagnostic: HK0PR06MB2833:EE_
x-microsoft-antispam-prvs: <HK0PR06MB2833860A773F5C362FEAE984F2759@HK0PR06MB2833.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:147;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Il/PhvntTgcLn5a/Ibe1frsG9PsrcO88sp3Wj4Ef+XVUpjUIBZYUEBBbHaSdkTiBQntabjDBGrIp9rpY3fPYDsobHpJiAAVuZLWKMxRbEdJBedzf+6epzO6aNXCs/TbOjWHgUAsLZ666Hya4GR5amUKvEq02zBeM+KMPJNDAWjfcZjsbe3lN8gBvxFDCw8FB4NbLTdXfIQ2/uXYoygmGrRtmTQzbyCxx0x5mHphQBcU8XkdIf1tUdS3+iNZjERzsR8tz5W1nybtHWSdD0Y+ZCRKnfiEpRBWYo4Q3EbtGUclURxQuw2WcvFSzjzX9GcUaWY1qTkFESACPPwHYr9HPIwpEF1ceYK9dcb5DhmEXPgB5Oq8gRFf+6RdY3EhOYvm5UqVHFKDRwZSLY/b7zN4aYomWS0x4g/RTHgeWTjPhx0ZWUNfYcH3MY4p9e5mWRUkGTkZjH7MhucfO0K89t2oe7pbA67/f4xK97U1ZwQ9qiYE1m5R/4OwBBL3SAtTif3bJdhWWwxgCLWUsdbs7qh22y+6FkdZSTlUmjGQnxunpzf2G8bv9VM3AD4iUv9d/s9Qi+WKs9O+eN97uaE642BGJ3EItD0e/FKgcUtT5us5KlfgxrIwcoL1Xdw8YM9cUds7fabwmYoQCrxnpH6wFxZ/Ay9PSjtIGoi2KEtJ89W9WiEMPJxT21qDZ8dgEh5Q0Pv1raZzEnV3zPXKpniqmP+2DMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39850400004)(346002)(366004)(4326008)(9686003)(107886003)(508600001)(66946007)(83380400001)(66556008)(122000001)(8676002)(64756008)(55016003)(52536014)(66446008)(76116006)(38070700005)(71200400001)(86362001)(53546011)(2906002)(26005)(110136005)(186003)(33656002)(7696005)(66476007)(316002)(8936002)(6506007)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ryuT1nQ1zuqAcVdUb/cMQVOof5a9uD01eSGp5yLk9MRvZVllcATBqcHwcE5P?=
 =?us-ascii?Q?UbJV91WVlSyhs/2bLD9qJwokb32NcaXLqnv6MxpADQ3c5+J025E3pPzBLQyk?=
 =?us-ascii?Q?XQ/8j6BjfLPwu4t+g/a36Qw7f6azpIyqlwLqNjqMBv42AJo1Oulz9HI/v4Yu?=
 =?us-ascii?Q?oW0ver/CTT1WK0ArNmrizbtlGSx0GSnpPRa/x6VRRyLTNWf7oCv1Pz6W2I/r?=
 =?us-ascii?Q?bvqmru0K966bbf/lQYDQssMI6A6rzfAYC4mhYlBfb18k/H2edo0KE9a/AqkT?=
 =?us-ascii?Q?rJgQ2FhhEvQ0H1t1Xum3IVmS3v1p4u/CDLDKs52TQtZnU/mO/bj/u8msNSc/?=
 =?us-ascii?Q?6pw1PN3cuqgZJLx02WW1Q+yGM67omM12EQ+iRI4sSHsB1RLogVYF3LtWQ4A4?=
 =?us-ascii?Q?Ryy1lGYI4V8hzhxoajibnNlOPRv6l9ghnTRFSjLvncxPqjgnUvftSsjrs51v?=
 =?us-ascii?Q?swnIDFBAqs89FcKo+cMXeqrmGx3jrjFM80xVsusAxISuDqGmPp8L+NvCtCmk?=
 =?us-ascii?Q?tuOMqmhLuSayFNxUi6wKzuGke0FwR/Lg0NyncWvcIU3Dh6srDB+zYX3KdFHZ?=
 =?us-ascii?Q?hI1M60DqkT0HNZXnzR46FFaHcGO+X6i20/+JHd/nLcicgIeg+7TNTy28nw2N?=
 =?us-ascii?Q?S5ggRH5aLenZFufQUkmXtAoSunnETBI6jw/fsfOKTTTxcF0XZTAiqaD33VQA?=
 =?us-ascii?Q?DsE+JqjO65Q2x9gcPb1XfEYdMTaxWHFD1H/EjCjXHS5XwAzy39ZVRThSNOCR?=
 =?us-ascii?Q?3xpG252RaHMlC08vuDy/Tmk6i7gO+ObG9Kp/qLCdPOUJrofDh76ZPfcedusl?=
 =?us-ascii?Q?ImxjX/FBkH188POVuxh9xqg9UuPomLZxnm4hCAf4mlhQWiOA+l9PoGX4MdP1?=
 =?us-ascii?Q?282CapBDjTPRqrJFKZ+m2lSagn58ejc9/wWIvJsY27KEONMAF6WxXZyk3ndd?=
 =?us-ascii?Q?aAnpMa4WeRDWeWEUQzsjdl6zaP3Gt6675rUAangOKeQmodGAxJjEeEw2JjaT?=
 =?us-ascii?Q?wv/2R5tVSHTk07iy2yCHVP1wnOEcPrsj7MSS0TRRuPludS/bc0+cBjAP+aCS?=
 =?us-ascii?Q?mvgsB92bWrL8ipv7bUntUI9moRuirTFULi/HUr2L0C3YDfUfhA1ma9fWkwLB?=
 =?us-ascii?Q?cyu2vwj1Hi7CIUqrACaIuoNfljISY/2VqH0ZWkSVx9bsnwhQkUaxhU+axps5?=
 =?us-ascii?Q?MEJhrcPZQxh4aXDdkyaXqCQ9e7WhfS6xc7SSNL+QnXSu3vbmo/IYtPilMa5j?=
 =?us-ascii?Q?cyVzB1rpy8hdR8/21HCee/Ak4OREXDSwf7Jn3dgMI5Knv48ZK5UI5a2P19Eg?=
 =?us-ascii?Q?gEsgXKEuoM2xIjkUw/UHZQtBjaycaehN4BZlEYvFwpzw7u/9tT0Gn5uW+Egn?=
 =?us-ascii?Q?fDwmhSHLBf1nPVmccg0ByIMKUuFIvCzc0yLf3ELkNaJNjicHh6ooXhqBhftw?=
 =?us-ascii?Q?QVcN0ZzFzKWD3/hv/5v/U3xmfglJhOrlQV9rnUaQN8GNAGMFp9Zkbf8+ErRc?=
 =?us-ascii?Q?GCoKcU3mWd5/eMZsqV1NUvRhnbhYB1WO2VYsUH1I/I37tAJ3G/KNxk4YOQaQ?=
 =?us-ascii?Q?HJaR1+j/SyzvgYTg7Lz87GPK0prQDb6u/TjU6rQl3ZeXyegQ3zOGwjdjeOcA?=
 =?us-ascii?Q?5GiLM4jmqddn8eRa+o7QFFcRqnmxiu6vDZ0+KLP2pcdSM/SQh99sef6Jc6Jc?=
 =?us-ascii?Q?618cvw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c327cf7d-6933-4ee1-a440-08d9bea03fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 01:22:52.1541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6Hrfzl+rRhKoD/nQDkW66uLiqHSD5k63BqmbKWEy3jAdpn3JGC635TWoJ7Z7tmBR+XCZCTH4NDZuGeYKFBmGbEoe0QpZN8rG1nPoPqjx9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2833
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
Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,
	You may need claim for function group for link, not for pin link.
	Ex.=20
	static struct aspeed_sig_desc uart3_link[] =3D {
		{ 0x80, BIT(22), 0},
		{ 0x80, BIT(23), 0},
	}

	ast2400_groups[] =3D {
	{ "UART3", 2, uart3_link },
Ryan
> -----Original Message-----
> From: Zev Weiss <zev@bewilderbeest.net>
> Sent: Tuesday, December 14, 2021 3:47 AM
> To: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>
> Cc: Zev Weiss <zev@bewilderbeest.net>; Ryan Chen
> <ryan_chen@aspeedtech.com>
> Subject: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
> support for TXD3/RXD3 pins
>=20
> In order to support putting the u-boot console on UART3 of the ast2400, t=
his
> commit adds support for setting bits 22 and 23 of SCU80 to enable TXD3 an=
d
> RXD3 on pins C14 and B14, respectively.
>=20
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/pinctrl/aspeed/pinctrl_ast2400.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> index 7a6c2892f469..a8a5ff517108 100644
> --- a/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> +++ b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> @@ -125,6 +125,14 @@ static struct aspeed_sig_desc spi1_link[] =3D {
>  	{ 0x70, BIT(12), 0},
>  };
>=20
> +static struct aspeed_sig_desc txd3_link[] =3D {
> +	{ 0x80, BIT(22), 0},
> +};
> +
> +static struct aspeed_sig_desc rxd3_link[] =3D {
> +	{ 0x80, BIT(23), 0},
> +};
> +
>  static const struct aspeed_group_config ast2400_groups[] =3D {
>  	{ "MAC1LINK", 1, mac1_link },
>  	{ "MAC2LINK", 1, mac2_link },
> @@ -146,6 +154,8 @@ static const struct aspeed_group_config
> ast2400_groups[] =3D {
>  	{ "SD1", 1, sdio1_link },
>  	{ "SPI1", 1, spi1_link},
>  	{ "SPI1CS1", 1, spi1cs1_link},
> +	{ "TXD3", 1, txd3_link },
> +	{ "RXD3", 1, rxd3_link },
>  };
>=20
>  static int ast2400_pinctrl_get_groups_count(struct udevice *dev)
> --
> 2.34.1

