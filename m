Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BAC38E3AE
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 12:06:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpXtZ1lmmz301K
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 20:06:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=mKIABpaQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.105;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=mKIABpaQ; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310105.outbound.protection.outlook.com [40.107.131.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpXt8610mz2yYQ;
 Mon, 24 May 2021 20:06:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KulFYzE+YpKeODk2HXzzBItSCA/jY02TAkNKtRCel4OZqW4zllfubuHIuStkiv8YwabWFTK/yd4Wf5JxijpOK35Fc3wi9TuR9RKVSuNb0rgZcXtzhCp+s6UxxvsoH29AL/Uc9aEXi22VI7j95EcmfxDgxRSmpXooigrJR5JE8zuHo/dFQo1q/S3Y4ILxfjk5XvF7esKRnmCd/XQYTa83iifi9PsrOhPsKJZFoaDS6m67VqglNXglQJiIBn42zbWUt31H4L+kBHgVFoKWJ3iBIq6FqbRZ5h7YPX1gkRXPwrJ+6BHCyexKccHNJ4S4XiHln/RGC72pdaG4nqmIqwnDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgKXfjbtHrW06do2INpix45cXQhlTD+/5X9lSQ/LKOI=;
 b=Qu5g9Y8L1PIfngCplOBwC+RiFC07yPO4gftzqMeSA8G3bV2c3+rZCNgDoufAgN46VsDEYhVike9BUtQgcmF608oY1k4Pur+7buHQ9YihDdzCQXtPuz07dyyuIn29Y6fMT4qdApTBCl+tBAyP0EBGKkvktpSuR12mMnsDiPx2Nnk74bOPYbaPM9el0x7v3OFER9VraD2bG6zpVwTI2vKVEHgQW3uFmd0ii0/L65gREQtmkAzLdsJAdTURyDgXCam8sEGlDwxwMMFqDsA7kec5Jbw22A/rryRNESgQnSIMURyj694ketb7XEvIjcjbhQVfBlufJXmpe/XJRH3MkXR2Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgKXfjbtHrW06do2INpix45cXQhlTD+/5X9lSQ/LKOI=;
 b=mKIABpaQJ9fha0ZxZ8kWPcrrOFHCg5+8W/kaIa4BNXL/d1RRkKEIE6OLELHQuqyDWxp60DORcCaaj+/S4QtIhXItQXaoq2fl1X6RA70HOJRxYqG80bZw/X3p/uHnRE/72ggapP0eZLmzA0MLfryYykEaRa+R3C+jPzoY7JKcrML0Zr/qnx4FtWQh2p1oLNyuMAx1Rrzh/FJTOXro/nsU2fH/haxysGdsAllSNi/yN5gq5Uz/fVoyZLUUJlsZyVtW5LN2rzSrSFSnA6n1Pg6ndG/4lvyxMVPebulWS/0jxp9uOm6OQ+8tlIGM1bBjhWV97p4h68QzAS07kpNh/FP8DA==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2578.apcprd06.prod.outlook.com (2603:1096:203:63::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 10:06:13 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::ec25:881b:f113:93dc]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::ec25:881b:f113:93dc%6]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 10:06:12 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Quan Nguyen <quan@os.amperecomputing.com>, Corey Minyard
 <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Wolfram Sang <wsa@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Thread-Topic: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Thread-Index: AQHXTIQCISnhT+/XbEiDVKSu2FVXwqryb5QA
Date: Mon, 24 May 2021 10:06:12 +0000
Message-ID: <HK0PR06MB3380FD2B7649CFB48BEA2D4FF2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-6-quan@os.amperecomputing.com>
In-Reply-To: <20210519074934.20712-6-quan@os.amperecomputing.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15891d5d-64cb-4472-997b-08d91e9b8f7a
x-ms-traffictypediagnostic: HK0PR06MB2578:
x-microsoft-antispam-prvs: <HK0PR06MB2578D54E9D2E885BBACD3DA4F2269@HK0PR06MB2578.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xom3LaH8GLXnegelyBcJAh4PtCc2f+BAWkARviG2EF+DCzep+Qpo/TCAy9sxPAdPz4NtvVh3aFCj0S9pYi7QEGxXWD+CdEKPS1RwK2NchFrP8kfqugWrfy02RYxQNAuZKotyUJf84Hg/amK5SFeDy/FwRGKA5V4MlDQSQUPGDCqj1UdTs0ZIPOqQJYhXk521rVD4GBNnLJ248N3BCMOJRgZdzh+5CpDxcGIdiyesOUfxrNJ7CI2wXQrbTYCq1SUSny4nYM6S3nWVlHSoKedfwt7ZnOycsnC3SAIOaDp8OP9Qq5ju6P7jiPYDbAEaeECisNHpe2RthBKDS0SQrHL3Q+UlZEU4QESx7q8yWJJuUiMG234fCNunnS4lAEr/OJO2k6zc3KCr1iqa80PRrbzBMUqyejxMsm2xgv6aWQ9DJoszSO8v6t+/gr8MfwXl5RgZwVDVkl7Ij/N+7zblgTV/zdOhvIog3wNXNc4jRXbWOcZlgb95ewj80x3w91bSlu9Y4ZsCXH2RZXydKBzYSM7FLe7zBFPX9fHj1Osz2ej608fVU2cGBtRUaAQk8t0oBZxvRJSwYAfeXu+w72qIYiGPPFl12YTITLJLHotjn81rnmHQ3ujW+W8GCqAAzNFCJyFRRGnk50WFoJIjWxDjkcUbyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(396003)(366004)(39840400004)(64756008)(66556008)(66476007)(5660300002)(66446008)(122000001)(66946007)(38100700002)(52536014)(83380400001)(6506007)(53546011)(7696005)(8676002)(54906003)(2906002)(110136005)(9686003)(55016002)(86362001)(76116006)(316002)(186003)(7416002)(71200400001)(26005)(55236004)(8936002)(33656002)(921005)(4326008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PPO+fGFyzZV+5lPUa5JDaIo2Ap4ueUslNsfwg6vpaPwvlwL6gLXN55rwXiT8?=
 =?us-ascii?Q?qtWWL67Y8wtEcaQ8ihs9cFk9oy/2en406bsm4Y3H2E37Wr51U0qac74U8jML?=
 =?us-ascii?Q?QhQlZXT2DerybVgTyMRHjRV8eTtiwDELkwETBp5ySRyNGgWmnpDJpS4rWcK2?=
 =?us-ascii?Q?gp1eBt5ujiQ6nPlL1xgTMDSB80hWAX+wa+JrfndZ0e2zYV9o1WSUF/Qy8B7D?=
 =?us-ascii?Q?Lp1AjKPfQRYLmxvzD6qW6J9BupjBoYNKKV/SrzbJcLf6+xKekLuYYJTaBfEd?=
 =?us-ascii?Q?mmgC3yq27ZmeZwQXjFgkN+IcAUXV2R3JqAUihwfAw+f245zqvl2Zn+QY2G+P?=
 =?us-ascii?Q?AXgRTUP762ktrfipdIIAbnI4Fa6bLzbzdx3xvoRlABcd9VzTEg+TENcvyW/4?=
 =?us-ascii?Q?TvLYm4g/YsDmPynntwNApcz2pnVpNecjYGDC0MNleitdWWCctGRh/WN+iThm?=
 =?us-ascii?Q?4FplFFncTBo7aO0jwinjyT8B5cCgWoVn1WENdzcZH+ngZuFByfV5d3GXAn5x?=
 =?us-ascii?Q?ONQX/8Fdl94mPmYlce8P5zoM1PKRUvka54ZbycZYhpznD0X/M87QMXxUY2Dj?=
 =?us-ascii?Q?oteQ8DwT2fqSjMWBi1ESiyAbMDi6ybHakBwBJPDg5WvtiDXG6O2CRGYuQkx5?=
 =?us-ascii?Q?J8RuhOGjR7OxoixLC/TBBUwU8NBZ/EtBzXIWJxjQsPqWt3UE+318E2odPS8i?=
 =?us-ascii?Q?MN4DkCecexhacRn82WGGpK1DNmxQ9eBhLYVYOcjT9LCRFvxuGVzFqmub2KEj?=
 =?us-ascii?Q?QDoAeYOhjz5kygkLk1CqOLMfIDToi0DdMqWFzLSUZ2co80O8FN0keQmg063T?=
 =?us-ascii?Q?gQThjicS0RfLauTpMCIZi/lXImcun3CkrmToxpsaIttL9U+OnMg8+3lIkUH9?=
 =?us-ascii?Q?yCgk0RZc7y4DaicLdCtcM6O3ZYWa3i3IUXrSQUlQd7ADp4quoI/f666xOE9m?=
 =?us-ascii?Q?MyFo6qEAJRCT66W+Xr/UMLFWFTQepcWVeIfBQIdooi4u1lE+TTarKSpUqDXY?=
 =?us-ascii?Q?Ejqg29lIPeJ/2l4uieQxFJeRzEabm2FT+spotnVmpnbcisj+BhfYtY1JwC+r?=
 =?us-ascii?Q?THw300np5XF/NIinqlxOXVn9nEfHmgIz+rzsiJpDeju+ftgEiwa+MuCWIT9y?=
 =?us-ascii?Q?76AG1obRAvG1Lc1KmjKrI3TqQdM0i0nZiTK2CJwAUUq8uSGck1BLjeIrFqyM?=
 =?us-ascii?Q?yJiKksOhp5uBeYHM0KA8ZCiqL32DngxhUF0Nx9ZBg847/fkEPtkb5YV6bE1v?=
 =?us-ascii?Q?HLnGIvWUz/pfLIJ/5nj31ldEQucTs5QXIvjYb/faMyj4yQyPjjKfWNERLRSe?=
 =?us-ascii?Q?IOVpFNxU7SbP3lDRQUCTbXas?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15891d5d-64cb-4472-997b-08d91e9b8f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 10:06:12.3787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbBdAaZ51nKhGZs8WzKlOktVxQiWOvGlFqgQDyi+0ESoYkIoSk2Bs5LqTojL3p+p91y6Lowk4YDx5vg+RRrLt6pnUjG2KhmX/H2opbf4/EE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2578
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: openbmc
> <openbmc-bounces+ryan_chen=3Daspeedtech.com@lists.ozlabs.org> On Behalf
> Of Quan Nguyen
> Sent: Wednesday, May 19, 2021 3:50 PM
> To: Corey Minyard <minyard@acm.org>; Rob Herring <robh+dt@kernel.org>;
> Joel Stanley <joel@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>; Brendan
> Higgins <brendanhiggins@google.com>; Benjamin Herrenschmidt
> <benh@kernel.crashing.org>; Wolfram Sang <wsa@kernel.org>; Philipp Zabel
> <p.zabel@pengutronix.de>; openipmi-developer@lists.sourceforge.net;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> linux-i2c@vger.kernel.org
> Cc: Open Source Submission <patches@amperecomputing.com>; Thang Q .
> Nguyen <thang@os.amperecomputing.com>; Phong Vo
> <phong@os.amperecomputing.com>; openbmc@lists.ozlabs.org
> Subject: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
>=20
> Slave i2c device on AST2500 received a lot of slave irq while it is busy
> processing the response. To handle this case, adds and exports
> aspeed_set_slave_busy() for controller to temporary stop slave irq while =
slave
> is handling the response, and re-enable them again when the response is r=
eady.
>=20
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + First introduce in v3 [Quan]
>=20
>  drivers/i2c/busses/i2c-aspeed.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index b2e9c8f0ddf7..9926d04831a2 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -944,6 +944,26 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus
> *bus,
>  	return 0;
>  }
>=20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy) {
> +	struct aspeed_i2c_bus *bus =3D i2c_get_adapdata(adap);
> +	unsigned long current_mask, flags;
> +
> +	spin_lock_irqsave(&bus->lock, flags);
> +
> +	current_mask =3D readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
Hello=20
	Where the bus->base to be remap?

> +	if (busy)
> +		current_mask &=3D ~(ASPEED_I2CD_INTR_RX_DONE |
> ASPEED_I2CD_INTR_SLAVE_MATCH);
> +	else
> +		current_mask |=3D ASPEED_I2CD_INTR_RX_DONE |
> ASPEED_I2CD_INTR_SLAVE_MATCH;
> +	writel(current_mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +
> +	spin_unlock_irqrestore(&bus->lock, flags); }
> +EXPORT_SYMBOL_GPL(aspeed_set_slave_busy);
> +#endif
> +
>  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)  {
>  	struct platform_device *pdev =3D to_platform_device(bus->dev);
> --
> 2.28.0

