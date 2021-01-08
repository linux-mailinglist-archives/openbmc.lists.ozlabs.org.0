Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DA52EEB51
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 03:34:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBnHy28WTzDr5L
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 13:34:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febe::707;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on0707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBnGh1NFSzDqNx;
 Fri,  8 Jan 2021 13:33:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fp3SKyhdecl9hy9TX0gh0dtG2zEJYrc9pisqAOMgTaK4W+/1+AgbmBuFzkWpNHNyDfQEElGS91j3EZa4dDvBr7HgZbijBkHvA2H1Tj2IPf0U+kA44obLpZuXjVt09zgrzX+DHlX0XSrN48B80gaNJ/P8IGIbFejCnfR8D9eJBhcZk4sRqEEPjOoOl2dW6VX4ZMR3HRdmlgplpuXuFb+bT9M8EuOH6aY52mECuvBLx2vANH1NorE6Gc/qQWxF4UPNtEcg/zYq0rri784jmN+9i/Db4d0tTkt3zv0mGauYwwzN984XPo/oKHgeBj/bB42+OXk3Piobv/xyH/UUAMSk4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T66uO4Jb5m9Esj2CAWgmgrEgPej/DIkkVtrbAJdMWSo=;
 b=Zd6Wk8+qda7S4m4bqIXAZ2lkNkN1z9yMDx9YOK2BgtLPyEbEbSBMbb1MC8lU2Wj6IHQEvka/KUOyY3G16H4D03A26gq6cRsQSTssvCt9elJZ7p5Ea2HNLCFChsyo8y1T5u5N7SkyVQLbIKDQj2ptosrf/RdRfr9fK78l5sjZ/gX3R1orslVlfO9fqGF9uDB3wdop13/otGY+plr2XE7IrdaZx5PkiE6FAeb/mpuaVdlObRw1GF5ljrg09p3O/vyp9cSN4YUlcRGLlKZ8h6Dy+POJJBaJTps7MjaDsoDf0h7UwxMWe/q9Bw/ZmU1u1ShSy/29lEBztr/O/DHGYZcx9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3251.apcprd06.prod.outlook.com (2603:1096:202:3a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 02:33:25 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e%7]) with mapi id 15.20.3721.024; Fri, 8 Jan 2021
 02:33:25 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Marc Zyngier <maz@kernel.org>
Subject: RE: [PATCH 4/6] irqchip/aspeed: Add Aspeed eSPI interrupt controller
Thread-Topic: [PATCH 4/6] irqchip/aspeed: Add Aspeed eSPI interrupt controller
Thread-Index: AQHW4/EFDPfA39yS00+qPo9RMp545KoabhuAgAEH4eCAAH7GgIABD6TA
Date: Fri, 8 Jan 2021 02:33:25 +0000
Message-ID: <HK0PR06MB377925CC8C39FF57B663A37C91AE0@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
 <20210106055939.19386-5-chiawei_wang@aspeedtech.com>
 <123bc25c72b3b17c0c4154d8bd8ce3b0@kernel.org>
 <HK0PR06MB377957C33FDD43C5A7F5EA1691AF0@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <beae3a8ba0a89ac6dff638df4e8b3211@kernel.org>
In-Reply-To: <beae3a8ba0a89ac6dff638df4e8b3211@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5650a0ab-1b20-40ef-423c-08d8b37dc659
x-ms-traffictypediagnostic: HK2PR06MB3251:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB3251F258D916A6235AE74CAC91AE0@HK2PR06MB3251.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K9KZxhXqNn5LqLzgTFBLjnR9/59nEHjZ9oj/6AGPxYrvH1MCpajatcqDKbwSkVQJXRZNBglUGNEgP8KXhgmcBi6uVqai2x/oWA0mMuBllcbuIG9htUPl7J02Gf5Ql6p9M3S/whpyJB/6YDwDwb+nsv8GNSX5AdgkTLS7Cfv76B+LwlejRl5iQh6IiAszyFKeWbc/RpAhRpO5HYlnocQ3ri4ZPkJRgzrr+RN2b7TZ7dwv0WohXT4hAWLVBavbX/oC2HubhQZXUZGmyTgiAA0HwyQDLdlSGv1qNY4BHgZw72MtVnn+aHuC63o+so/qzBs7AXH+2ppY7IDwvpRgIPQodBRTFWxrYGpTRi3voyzOt6pGyjfNev+Q/jU2xUBSYbOyEahoaFBiE8PQ7qMXSPjcyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39840400004)(136003)(376002)(366004)(346002)(186003)(26005)(83380400001)(53546011)(6916009)(9686003)(107886003)(55236004)(316002)(71200400001)(55016002)(6506007)(7696005)(52536014)(8936002)(66946007)(2906002)(86362001)(33656002)(66556008)(66446008)(64756008)(76116006)(478600001)(66476007)(7416002)(54906003)(4326008)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?etcOvRODgLZBullz3m/6TmaOCz1TWTN77o1yytgI8XsZZiVtPG8CePGpQJSa?=
 =?us-ascii?Q?6ACRXS4aKYMvLHJSKioaldLjTNvc27ORY1Qq0iOoUq3f1KWOmql5LJc63ntd?=
 =?us-ascii?Q?ZOCgFClHlqazI7XD+oR/uAXLn9tyVaR7CpcERJU1PxY6F/sbP7I2X9OBMwtk?=
 =?us-ascii?Q?3ab2eo36Avvy7r5dOkEk7wXg6MUlyRKhBw3fmLo6vbIPccoZEperH1nQmkQx?=
 =?us-ascii?Q?LR8BqhOZns1HTjEzIRnsprn5+AmvIdo9GoaqrQ5luPQAelBl/EOKqa8joldY?=
 =?us-ascii?Q?SV0NCCCiDMD2LBXvHpjScAYZrkozN6ZUNC8YBkFiCS/fSANycDsp4lgr8Kgi?=
 =?us-ascii?Q?L80+V3pUxitQbvzk5I/NZLKER6sUpbxBTZ7robnG7ZHhgA/vP6q05g4LxRTQ?=
 =?us-ascii?Q?DFf244kFGGBHspPz4DeHdbS6UvmUQW8WcczS0jeiF3Kk7Gz+8Yw4CfRTzI1E?=
 =?us-ascii?Q?W75CVkP4fnkqsE67Cwk0/SVUSfqVQAreL3QVeUQdR+LBnAHDqOqF8IYwtDB0?=
 =?us-ascii?Q?3sVb2shDd/TQVzkio1pSUXFkCTrxwjhRET6tlGa5wzaZ2OOT70Rl5xSSdcAg?=
 =?us-ascii?Q?d16P1vHkAu3azfsG+FVzuqpYJSu8AV/uamgnsaXDK+qQo76adyM69aS16C/Y?=
 =?us-ascii?Q?St+lUQWcK+2OnodsI1yh4ifXM8T2s4bW02e2TfpXMbI7lyROY36e/u417wA6?=
 =?us-ascii?Q?bE9ZlRDa2ysYFuonilybuP+3fCwi1Fnj79To9L4AwJtXLoen9KZ/+EEgeRpI?=
 =?us-ascii?Q?3opDISVS/2n3vZ2aJrqwveoyrg5rdtrVuvngsecORzA1+Cq09eCPmCaRLy7D?=
 =?us-ascii?Q?8Ej6XeeArTmoCmws/wDxT7S+91hRoL2/pdcVpyJekxazNdEA3Qcf2AWU9WyD?=
 =?us-ascii?Q?bUsZcthLJwkaozt8y3OeM+KZeboYf7ffQTJXctOyfBxvKkpYDQx5vPh5pO7L?=
 =?us-ascii?Q?u+5oI4MWSDMHfJFM6bsdOG5jPgD3e4ZkckZoiHypgjo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5650a0ab-1b20-40ef-423c-08d8b37dc659
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 02:33:25.0958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OmY4t/JCQWA+wXWZy9RXa/pNkxaEGh4/jL7HKAe17f1GxATZ6l0Zp4P8qFXh/SSL3seJOuKnnQ5Phrz0/r0VeeQCkQp9GEB86gnGa+IGT1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3251
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Marc,

I will revise the patch as suggested.
Thanks for the feedback.

Chiawei

> -----Original Message-----
> From: Marc Zyngier <maz@kernel.org>
> Sent: Thursday, January 7, 2021 6:18 PM
> To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH 4/6] irqchip/aspeed: Add Aspeed eSPI interrupt contro=
ller
>=20
> On 2021-01-07 02:59, ChiaWei Wang wrote:
> > Hi Marc,
> >
> >> -----Original Message-----
> >> From: Marc Zyngier <maz@kernel.org>
> >> Sent: Wednesday, January 6, 2021 6:59 PM
> >> To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> >> Subject: Re: [PATCH 4/6] irqchip/aspeed: Add Aspeed eSPI interrupt
> >> controller
> >>
> >> On 2021-01-06 05:59, Chia-Wei, Wang wrote:
> >> > The eSPI interrupt controller acts as a SW IRQ number decoder to
> >> > correctly control/dispatch interrupts of the eSPI peripheral,
> >> > virtual wire, out-of-band, and flash channels.
> >> >
> >> > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> >> > ---
> >> >  drivers/irqchip/Makefile             |   2 +-
> >> >  drivers/irqchip/irq-aspeed-espi-ic.c | 251 ++++++++++++++++++++++++
> >> >  include/soc/aspeed/espi.h            | 279
> >> +++++++++++++++++++++++++++
> >> >  3 files changed, 531 insertions(+), 1 deletion(-)  create mode
> >> > 100644 drivers/irqchip/irq-aspeed-espi-ic.c
> >> >  create mode 100644 include/soc/aspeed/espi.h
> >> >
> >> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> >> > index
> >> > 0ac93bfaec61..56da4a3123f8 100644
> >> > --- a/drivers/irqchip/Makefile
> >> > +++ b/drivers/irqchip/Makefile
> >> > @@ -86,7 +86,7 @@ obj-$(CONFIG_MVEBU_PIC)			+=3D
> >> irq-mvebu-pic.o
> >> >  obj-$(CONFIG_MVEBU_SEI)			+=3D irq-mvebu-sei.o
> >> >  obj-$(CONFIG_LS_EXTIRQ)			+=3D irq-ls-extirq.o
> >> >  obj-$(CONFIG_LS_SCFG_MSI)		+=3D irq-ls-scfg-msi.o
> >> > -obj-$(CONFIG_ARCH_ASPEED)		+=3D irq-aspeed-vic.o
> irq-aspeed-i2c-ic.o
> >> > irq-aspeed-scu-ic.o
> >> > +obj-$(CONFIG_ARCH_ASPEED)		+=3D irq-aspeed-vic.o
> irq-aspeed-i2c-ic.o
> >> > irq-aspeed-scu-ic.o irq-aspeed-espi-ic.o
> >> >  obj-$(CONFIG_STM32_EXTI) 		+=3D irq-stm32-exti.o
> >> >  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+=3D qcom-irq-combiner.o
> >> >  obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+=3D irq-uniphier-aidet.o
> >> > diff --git a/drivers/irqchip/irq-aspeed-espi-ic.c
> >> > b/drivers/irqchip/irq-aspeed-espi-ic.c
> >> > new file mode 100644
> >> > index 000000000000..8a5cc8fe3f0c
> >> > --- /dev/null
> >> > +++ b/drivers/irqchip/irq-aspeed-espi-ic.c
> >> > @@ -0,0 +1,251 @@
> >> > +// SPDX-License-Identifier: GPL-2.0-or-later
> >> > +/*
> >> > + * Copyright (c) 2020 Aspeed Technology Inc.
> >> > + */
> >> > +#include <linux/bitops.h>
> >> > +#include <linux/module.h>
> >> > +#include <linux/irq.h>
> >> > +#include <linux/irqchip.h>
> >> > +#include <linux/irqchip/chained_irq.h> #include
> >> > +<linux/irqdomain.h> #include <linux/interrupt.h> #include
> >> > +<linux/mfd/syscon.h> #include <linux/regmap.h> #include
> >> > +<linux/of.h> #include <linux/of_platform.h>
> >> > +
> >> > +#include <soc/aspeed/espi.h>
> >> > +#include <dt-bindings/interrupt-controller/aspeed-espi-ic.h>
> >> > +
> >> > +#define DEVICE_NAME	"aspeed-espi-ic"
> >> > +#define IRQCHIP_NAME	"eSPI-IC"
> >> > +
> >> > +#define ESPI_IC_IRQ_NUM	7
> >> > +
> >> > +struct aspeed_espi_ic {
> >> > +	struct regmap *map;
> >> > +	int irq;
> >> > +	int gpio_irq;
> >> > +	struct irq_domain *irq_domain;
> >> > +};
> >> > +
> >> > +static void aspeed_espi_ic_gpio_isr(struct irq_desc *desc) {
> >> > +	unsigned int irq;
> >> > +	struct aspeed_espi_ic *espi_ic =3D irq_desc_get_handler_data(desc)=
;
> >> > +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> >> > +
> >> > +	chained_irq_enter(chip, desc);
> >> > +
> >> > +	irq =3D irq_find_mapping(espi_ic->irq_domain,
> >> > +				   ASPEED_ESPI_IC_CTRL_RESET);
> >> > +	generic_handle_irq(irq);
> >> > +
> >> > +	irq =3D irq_find_mapping(espi_ic->irq_domain,
> >> > +				   ASPEED_ESPI_IC_CHAN_RESET);
> >> > +	generic_handle_irq(irq);
> >>
> >> So for each mux interrupt, you generate two endpoints interrupt,
> >> without even checking whether they are pending? That's no good.
> >
> > As the eSPI IC driver is chained to Aspeed GPIO IC, the pending is
> > checked in the gpio-aspeed.c
>=20
> That's not the place to do that.
>=20
> >
> >> > +
> >> > +	chained_irq_exit(chip, desc);
> >> > +}
> >> > +
> >> > +static void aspeed_espi_ic_isr(struct irq_desc *desc) {
> >> > +	unsigned int sts;
> >> > +	unsigned int irq;
> >> > +	struct aspeed_espi_ic *espi_ic =3D irq_desc_get_handler_data(desc)=
;
> >> > +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
> >> > +
> >> > +	chained_irq_enter(chip, desc);
> >> > +
> >> > +	regmap_read(espi_ic->map, ESPI_INT_STS, &sts);
> >> > +
> >> > +	if (sts & ESPI_INT_STS_PERIF_BITS) {
> >> > +		irq =3D irq_find_mapping(espi_ic->irq_domain,
> >> > +				       ASPEED_ESPI_IC_PERIF_EVENT);
> >> > +		generic_handle_irq(irq);
> >> > +	}
> >> > +
> >> > +	if (sts & ESPI_INT_STS_VW_BITS) {
> >> > +		irq =3D irq_find_mapping(espi_ic->irq_domain,
> >> > +				       ASPEED_ESPI_IC_VW_EVENT);
> >> > +		generic_handle_irq(irq);
> >> > +	}
> >> > +
> >> > +	if (sts & ESPI_INT_STS_OOB_BITS) {
> >> > +		irq =3D irq_find_mapping(espi_ic->irq_domain,
> >> > +				       ASPEED_ESPI_IC_OOB_EVENT);
> >> > +		generic_handle_irq(irq);
> >> > +	}
> >> > +
> >> > +	if (sts & ESPI_INT_STS_FLASH_BITS) {
> >> > +		irq =3D irq_find_mapping(espi_ic->irq_domain,
> >> > +				       ASPEED_ESPI_IC_FLASH_EVENT);
> >> > +		generic_handle_irq(irq);
> >> > +	}
> >> > +
> >> > +	if (sts & ESPI_INT_STS_HW_RST_DEASSERT) {
> >> > +		irq =3D irq_find_mapping(espi_ic->irq_domain,
> >> > +				       ASPEED_ESPI_IC_CTRL_EVENT);
> >> > +		generic_handle_irq(irq);
> >> > +	}
> >>
> >> This is horrible. Why can't you just use fls() in a loop?
> >
> > The bits in the interrupt status register for a eSPI channel are not
> > sequentially arranged.
> > Using fls() may invoke an eSPI channel ISR multiple times.
> > So I collected the bitmap for each channel, respectively, and call the
> > ISR at once.
>=20
> And that's equally wrong. You need to handle interrupts individually, as =
they
> are different signal. If you are to implement an interrupt controller, pl=
ease do it
> properly.
>=20
> Otherwise, get rid of it and move everything into your pet driver.
> There is no need to do a half-baked job.
>=20
> As it is, there is no way this code can be merged.
>=20
>          M.
> --
> Jazz is not dead. It just smells funny...
