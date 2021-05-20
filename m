Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082538A9FE
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 13:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm6QG16tBz302f
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 21:07:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=egksinNR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.92;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=egksinNR; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320092.outbound.protection.outlook.com [40.107.132.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm6Pv33fZz2xfP;
 Thu, 20 May 2021 21:06:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acfIEirOecbRkQgBx4FJewjnbwJC99EoIty2cqp2DWG1keLTzBVHU9GzjTyy4C+XndV24I1cFR0Bsknj9BSVwrchYUjvMzb3i9L2av8kWhlVP+oikDST6G8RKRZPYjY4hJu8RufCmkSv9jz2d6FuIXjL89QDRghWFT0zSG+zxrcdbuEgV8hmxBRUOD5X9N3xkaZ7nYPPa9Si/1xaZScBmXu9jjiL5sBccD+7C9SHDBzjCYMtmcRIBBezgTTsH3V1THcz5u43OfKb3SlzFJMhD1ylzjo/eQAAACZ+LtYOl/Do0VlKLvCzj5u0E6AdQcJzZTueFCWGH+SWYxeDhFYQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpFp5dDCTLU/n/fANNVDayB4RHXBgyU28su+zc0Jh7g=;
 b=RvBQlSKnmf52XYSVJmxQ4oob3tjU/GZjx4bFVgpoBD81pUcx4nH0z54cQlFV7MYaz3yjV62H+zD5yq+xvBA157M6Gb/Dgg0xpmaIGH/xhvtjgEc7le2SpsZRgXR90Knmtp7fmaAOkrhFb4k8F4N8g434X0Rq6W1wG17NqdrS+rHrvR81cNbW+XUAyDkLDtWp6u9FPJohOvtmVy1W42L8XLRHfYKmSI3vWV+4fTkr+4bz7IFTUhvqJtccYv0zMsWCC+Hf65kqsL0/b7Hynwfc8yeVt9OCiGbQ7ddga8+XoYlghfmdfZG4Tln9AueAJiIaTjdnsGnQ6Ji2eMhrcEFPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpFp5dDCTLU/n/fANNVDayB4RHXBgyU28su+zc0Jh7g=;
 b=egksinNRUCuUPv0La0VcuYWjurgVLzdFgjaT0zZGSpe7gVfSmrG4tT/wojs7WkqWFIMdsSEwse2fXdTJsagmNCiRGBlUDCxeYCNvDWR3rngUptki+balWzMVFEQzUZvD63Bj6YjPHNm5pV2aR2J4w7Cy6KThGUGA9vVYLK5Hoe+Q/IWpprrWyMIE7KlXZkXvsnbi+BONLr+5yzsPGIOePfYQS9L3mHgsPaQM4tFYVEiL07FXpqM+YJ1cNZ4ELtIRCxPVqEr91CObSDx2Nf0NALoDpEcvQBO4qz3ur0qYBhdmaSGDSvIvssPBrx84R/gG49hlHHV8fNX0AjACErjCzQ==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK2PR06MB3313.apcprd06.prod.outlook.com (2603:1096:202:3c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.29; Thu, 20 May
 2021 11:06:37 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::2984:f1bd:e1f9:5ed6]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::2984:f1bd:e1f9:5ed6%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 11:06:36 +0000
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
Thread-Index: AQHXTIQCISnhT+/XbEiDVKSu2FVXwqrsNmDA
Date: Thu, 20 May 2021 11:06:36 +0000
Message-ID: <HK0PR06MB3380BFA9FD9EF8F51F9DCC23F22A9@HK0PR06MB3380.apcprd06.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: c8d57627-b93e-47d6-af56-08d91b7f5626
x-ms-traffictypediagnostic: HK2PR06MB3313:
x-microsoft-antispam-prvs: <HK2PR06MB3313A857F435615262D5F676F22A9@HK2PR06MB3313.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BcYzV4OWQ4ZoEc6VgGFNkxneATjNGJMCcwA9rr23xEcgk1yYqQI469v6MANIOkvkppgV6GPuvi4Yeb9XMZjDju9FBCNPPIRpKesU7F4patYs0XzQyXYR/HaBHLZeIppI0IhJvUFlbQpuq1EHw2SdGsx8eraLRa1ZN3rLqj4al2LMdeyxgdYdQCS7XPjokIb8zOPXVfvgHipEY2UkbZWuXXmKevG8KjCXvt1R+G/2pkCiG/2+qSWM3XVPpmBii8ZisFAK4nIPbIhh6RVi53ugxNI+7w10RNTkCe2UmU8n6FmWXtx2UyqtTakFiNjfJoBICzHYxImwhXk5hIk8C7v/tYBPkdl+5tRTCCgDKkamMp8Yb0gq/cAaQFWdXTM6RMEVQw3aZIzRAla/4A8G//QgWybcV2c6EWBpxFlmsBD5MlCNV59jb99AvenB2MhQBxJH3z8ZV/bq0QSWQErcZmH3liZZo6IO573r5CW/QHeVeB1Mx8ZoFDALcR6goxCg3TKWnmM7h2XMilf8AJ0lBWTYc0shpFkkrtNsL0EJd7XleEGt9lDTVBTSuo3bo48WzFKuPhjsBs8WKdTSXvbW1NX96mxQDOa+saevJ149VBA5GFC9aGHgBT6vNtsEIyIRenABqaVkvP6dJDYCI/bbfAi9Yw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39850400004)(366004)(346002)(376002)(7696005)(316002)(86362001)(186003)(7416002)(110136005)(9686003)(54906003)(55016002)(6506007)(55236004)(83380400001)(53546011)(2906002)(76116006)(38100700002)(71200400001)(33656002)(66556008)(66476007)(921005)(26005)(66946007)(122000001)(478600001)(4326008)(5660300002)(64756008)(8676002)(66446008)(8936002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WoHRyKJqhjWT6xFq2CY3RiC0ikig1fwljBWpiE38zIX0n7B9yZoTNmcX/KT9?=
 =?us-ascii?Q?+XlqKihoZ2O81Ox0YPhdJqII7k8W/xChSB1HW+wKZouE5wOlpj2lhTTS8lF3?=
 =?us-ascii?Q?qNPSR9ox3P40mRoQ9nCHCCUyAwjzNO8N0R9OVBbx9mUQOXzq5TqebG9vAhrc?=
 =?us-ascii?Q?RxBxr33XsHax8wYjePHBQStznu2GzQuVErBwa93ef649BxIW3zOWTnu2hath?=
 =?us-ascii?Q?wiEAtipjx0QnXImV1yKIbApGuI2nuV+6L+3hkX0nQIco+y8+7hcL3oXwdnnS?=
 =?us-ascii?Q?dGahFzu01EoMu0R8eoFncDPUhYY6oDnsYaOcM1UwDw9g90JcZQFhCujz6i2b?=
 =?us-ascii?Q?fg+AMMGpyLhOGMTnGDI0exUL59LaPv5PaodP5yNo1n7cJYFqXp4NPvRi27xx?=
 =?us-ascii?Q?lUMmQ3WBplU/hCfxn8fSVB9XRHoRXtSynP5f/58gf4TN/JySQ2VYw2AzFkbp?=
 =?us-ascii?Q?cO1aCJedbixAJCKDVVpVa8eyMSyBJjd9gfiAotB0wZsCoZHN8HOUpg3SRd1/?=
 =?us-ascii?Q?fEBB2/W833OQmH/6Dy2zBX9uK2bfXR7sksC5GmbPwj7w6juikwBamXyHd4wA?=
 =?us-ascii?Q?wFSha02DTT4tGYkJmExoY1Qd/tSPVLD/piiGrxni7PjbV4UC0kLtsraCtH90?=
 =?us-ascii?Q?053kEsYDmve+1JK6rZoIQRk705b9heic6FH5PDL02LNzT0nvDu3h1k+KPSjX?=
 =?us-ascii?Q?OlHO6uwuYhL++HHD04HX1JjdVnnHDJEuBN9IZwbcTuA58qfXoXkdK6a48c9/?=
 =?us-ascii?Q?Vp+1u5vsRBS1yzdlI9L38pyG8ZOB8S0Zi3DIjQ6Y0OYbcXquanucyNZowsKq?=
 =?us-ascii?Q?2C3r1WNI4Hm7w/vHuqlEvu3rzKRPA9NOYOScxIyx2va3fRdnFxjFpqdV32g/?=
 =?us-ascii?Q?Na3/moLpi+NxjNXp/wPfInvd7/86oq4ZoafX/tAI2tDetN8fFgFx7o++RHSb?=
 =?us-ascii?Q?fD5MAmFQaamZPk3OkdqO8gbkN9Gak9NkmW+Eo+QhiWA3jS1yxhQTiCXppGzx?=
 =?us-ascii?Q?zssi/s1ftdFUR61WPYtRA7fFtRq7wSuXRsdZE6qdUcE4+XhvfqJnyueZVMkm?=
 =?us-ascii?Q?zNde3dSqzbI8YM9FpqgXLIDT2nn0hPfRBbgeEFdHngkYy9qyZv8UhxTwS0UO?=
 =?us-ascii?Q?cknqEt9/xnLIPV4zIs4fId4DHAQdOLelkhQBldFWWZ+5cRoeGP3zen8Eqi98?=
 =?us-ascii?Q?iEwtbfIlYCSQAp0PNWWCJ8QAxIwq/9UF67R1XJz7Z+c7yQYIVKgfRqvD13O2?=
 =?us-ascii?Q?WxDDqmWxxd7N9Ytsjd4FF7UFjJ9AhBYe7sHxIWQkdc2w69l2RyzQZZ7LJdD9?=
 =?us-ascii?Q?VJRJPMJ0iUIPcYtAx6FS2brx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d57627-b93e-47d6-af56-08d91b7f5626
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 11:06:36.8548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eygZ4tMay3FlkM6zPUBqyQBwsgavD6Nqn/UxQ8c4hdQQR5RQEdA5MxotXhdwRZx46TG2utPxPXbt7XXK8rJaBSuUUMHXGfUTRlXjChTNi+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3313
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

Hello,
	The better idea is use disable i2c slave mode.=20
	Due to if i2c controller running in slave will get slave match, and latch =
the SCL.
	Until cpu clear interrupt status.=20
Ryan

