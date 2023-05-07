Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC26F9694
	for <lists+openbmc@lfdr.de>; Sun,  7 May 2023 04:22:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QDSqP4SGfz3cdB
	for <lists+openbmc@lfdr.de>; Sun,  7 May 2023 12:22:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=mWt7eBIS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::71e; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=mWt7eBIS;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2071e.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QDSpm2jdvz3bpn;
	Sun,  7 May 2023 12:21:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLKOgnkMHzX0R8o2SU5eutGthSmNnMXElEbF9LqWvKrOC7/L6EWEIL40o0iOPhXNyk9nJYMZOCfgHvhLs/Ad5vzxqhNbbKN+tHn+mTqCdFtQf9yPp7Pw8xW7Ua74x9rUWBg9MtIZ6HnScntGwaONiXfvE+Aj3qxM20wFo7xK0QfjE4KAZmMGft7qes3sPEFTq7fGVtHYA9MCb7G3mxUZhibfK4SDCvJVEQHEv6O7ZwVJVTDfI47L5hwA1GMELEGoqV9Zrv0WVb27PdSebG9CtSA900q8Y4J/e5rUDij9fXLm+iHAVvOohdJofCkC6LWU58q4H4y1S1gHO0F5Bgj53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6upfybPELbzHVKfDxljbgRD0nNEHohSZSsTjDaAKivw=;
 b=e6OHMAivmf+oCf80QT/tZ+6CA20zLnt+wqn7cX0C5ZSo+TLhyA3IhGuzpgbeWIAjlDhiHFPH+EKtapXwnmxWlD15Al5YqgL7HV8XNFNTdorlv0hfD0873ehaZjQcO/v9vuMiDltT01V9r2L9XHCt7vJ0P/JI078arbAyKobhKJiJcK5ToIQJXXN0FmlKqLdw/UDx2OmHcHeTtuiINXMo256bGbTYuLgHLVD2WNDEepY1eAzsju7WHfOi40IpxSfbAt4zIFr3BM7SjC8WkXoz+9Gxz31z6VIXc0S2ctWRzIbptjcRSHrB6vYb7ql6o1sNEWyNKlJ52RaGE0UIcxO7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6upfybPELbzHVKfDxljbgRD0nNEHohSZSsTjDaAKivw=;
 b=mWt7eBISDnLiJ72sifttXiuRUTyeMNDKvJrX/5VgyOZyxkxi9HBRLWv9wai1uznxrOJ8yayXaTahnbcK6AGRfdJIa/Ta4cuOfyYnVQ6Wkq4QCZA/AnBtZAI7H20TVmUdE1o1Liz/r8Q9pWDSJy/GAac6rJNe2XBEsrQXTnKOFHoZOGlyQQwYz1JNBZHLGWhNvibMZwFeGtGF+qRJx4c+vQB8/pUqrOvIuILISVxIEpfv+2n4G8URZEYMuFSRuHXvZWZ2kLAk/z3FbeYAZNIrINkcmae/jawroa29DnjJssPlaEFgSuq9DpDB/gSe0iAKoeRHWZA/97WrrGJFIzCPPg==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5015.apcprd06.prod.outlook.com (2603:1096:101:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Sun, 7 May
 2023 02:21:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6363.029; Sun, 7 May 2023
 02:21:10 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v11 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Topic: [PATCH v11 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index: AQHZexqquS1FAKmTS0msEvFixuRDUa9HdBoAgAJWy8A=
Date: Sun, 7 May 2023 02:21:10 +0000
Message-ID:  <SEZPR06MB526906C3DAFFE0A8FA924AA7F2709@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230430041712.3247998-1-ryan_chen@aspeedtech.com>
 <20230430041712.3247998-3-ryan_chen@aspeedtech.com>
 <ZFFzRL/+73Ftix4Q@smile.fi.intel.com>
In-Reply-To: <ZFFzRL/+73Ftix4Q@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SEYPR06MB5015:EE_
x-ms-office365-filtering-correlation-id: b2d608a5-f32c-4f06-20d3-08db4ea1b8e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  TOvynNvd96ppo93orBpG/Zx9RrhKQEtt0NHIaH8JJZ6xk1Eq85ans/tLTxWKULSR05svMo4qUNt3WpZXfce5HMjG9nOJxQrxZnAXFV+tVTbCTz0LHuDZdNiDjPQ1PuciNWHO0iHPSasY6ZPwhQiS4rgMzRfS+xZqw2JUZaWNhO+dGf1P81MlbZRW97qZfpYFu8esITjbMr98JQZNHsjpZ/tYhymLScTZpuMTrDcsibLe49ZTIn9aSuY8ZPEoWqOgIUvp09qyXEpf8V24qxrh0D+VkPoYBUymcv7LgkqO8p/leRx6d1hHa15OAqvNlbqhCsh2WLza/pqiGZmogPod/DQZPlAJGodwvKrzM43hruxOKH9ya6ZU++7w+Ru83f4cA71tiCho6YP84VQOp7RgvlUz50NuVZmnIwidaCkWCH1uL3/gNVdASA038QicoQCYahyKMNJscCmw3UoLNefRQV/ASBCA2ZQGv2hviW5JM7UFiDzAA+o5cc5FR+FmNT71OWmhK6xZ1ZF9VakTqMox1QqWlRzqgjyc73tXTBUUKdN2blLC+oqkMG+ZQ31p0M3slFjnt9UqeSWUoVhdL6+YAB3tChNx2eNnJA3WpQbxBUQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39830400003)(366004)(451199021)(41300700001)(2906002)(30864003)(54906003)(83380400001)(478600001)(122000001)(186003)(6506007)(26005)(33656002)(9686003)(316002)(86362001)(8936002)(8676002)(52536014)(7416002)(5660300002)(4326008)(38100700002)(71200400001)(55016003)(966005)(38070700005)(6916009)(7696005)(76116006)(66476007)(66556008)(66446008)(64756008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?wz+7ml4/ToA3x7GWojGLEvYzXl76UZNcjw/6J6ypf7ooQPXaveNGsNkDJlib?=
 =?us-ascii?Q?E7+ff6KjE80eoqSG1s73MjPxxDYIVztUylCmvpjOzzkexQSV2mjchoqrsX8w?=
 =?us-ascii?Q?sP+TJpycvPSPKg2jGtryItze/jWeNDs0CuaPW7GyP5MJgQbUXO5HrcjHgZp/?=
 =?us-ascii?Q?RcqfmB+FhWAQ7dtaD2lKqFd6yCfUQnC9XI2RzVvmsAwwbjEp/WHtwRAftd3g?=
 =?us-ascii?Q?ftlIjoCoH0DYPT9GfP1JJwj6irzqbrgLYoNP+TmpAqDIvwmkKk7zJUcNSRkK?=
 =?us-ascii?Q?2LuLgTbX73M964sf76H+R1pc9BCeokVU44Z3NNfmNpwjt31iKbnZtCnc0gkw?=
 =?us-ascii?Q?ML/4FWbKOsRCtE1x8y0phpTSqCHj1VQbjFZ+ws2+D9F6HQ8m3Fa89XicZgUj?=
 =?us-ascii?Q?OtAvOL3aNfEF6TlDOxwD71B24Rx+wDkDwq5i4LVDZNEcYPacFkZkWGx/WgON?=
 =?us-ascii?Q?1ZrBL5o/KWe6VPf2ZRSCdceVKfKpJ5TjSngOv3r6OJKXg3LeTwK+CIUFx9Nn?=
 =?us-ascii?Q?awz/D6dwIT/EVCCIBlT4JOPkgCZgBU5aZdrXoU2RdF6KJk6pvyKltFGPtOWh?=
 =?us-ascii?Q?yRLqQY0iQN8sD0AwvI7kfxjOvxYmEaxJ1O+ghM9DiFw5n0/93AWrES1aLXgx?=
 =?us-ascii?Q?md4iXSRxBgs0eZXERsZdos1xQ5XnhIpXDZ6wvvhna92c+ClYffKH/2HoWZjy?=
 =?us-ascii?Q?sOCBFVlpUGdh6NBnc8PsRl78HMxq4Xk1VanM2ZBfWhBXQZg0vRuYAw4NBifX?=
 =?us-ascii?Q?h2yGeKA3OkuRToNJlPnpQpAHB3s7XdPE/Zw369tSzM4iyKBI+qZNTuqe+H26?=
 =?us-ascii?Q?jTtDLiqfb+8owf3sfIGrchaRVgDIJ/QTrqAKj2JIBJZxTzgDvahkspXSb8/L?=
 =?us-ascii?Q?f5XDKz5n+OaD1zezqHS7r93lP4oZuBStUW4vH/+9D+JVaeIh9AhqcPx9C9W/?=
 =?us-ascii?Q?ANdZOTigU8D+F8Y9WA2UiJFp9KizOgkGdEoHhEHuvgQd29sDxXlFaDzootF2?=
 =?us-ascii?Q?IAkkQFIgdgn+clAlcQPtLyxOXuExwyYEaXXGHe2bIDckq5wi6aufhq9+ZxA+?=
 =?us-ascii?Q?LS3z0M2GlOq+cZvERkukOvXvWvOWcFaL8J2Ax2diTvbWVSVhYd2HobAHe3+Z?=
 =?us-ascii?Q?o5RxRD8EewPDs5tgy7twEVk5RsseCRbp0uwIBl8vkcWpLSpnMTuDqHIMrdcp?=
 =?us-ascii?Q?e4QHN/kYVWl4PZZakT3h6PoBuhJHkwLbLsO39Y7PdRX86A5EkSpCFV1nxurl?=
 =?us-ascii?Q?YoyG+I3PCmMi/+sen2J6uLV+PyjM8DzrbULlCNw/s3+wX36D+DlTO/R0qZED?=
 =?us-ascii?Q?bpFTpUOFy4TodyZkBsDW2irGkshJ0sFu7zCG35GAzW2lMJBfaxw6DW9SrPf7?=
 =?us-ascii?Q?bJ0U8y4/4opDIvW+DUpLTcVfgxdYTgy4OBSS0U72IX2SkJQCNchwHArXF+Lh?=
 =?us-ascii?Q?X2opByLiFebNNxjRRodXOSpvu8DU8siKWpxX/4NeNQuJsJEhTahG989HTogL?=
 =?us-ascii?Q?7Eh9PUPYX6gqzloDx7CXxa+SyvHGwdq+TtJ2Jq2sApYXu7RrmMCQL/SC2BTM?=
 =?us-ascii?Q?in3Ih93oSVrhTvWO+mlo0UCheTj3WNm6rtGxNPLE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d608a5-f32c-4f06-20d3-08db4ea1b8e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2023 02:21:10.1608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kawdubgZlqE580GLXJhCf8MZdfb20Gkqadfj6BiqZ6GuPnsyCoZJJcl0xw7SqbWiyPhDRWHS8WZlmeWoTTQRDNKaJuIOhFlDoUz2eZqT0RM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5015
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Brendan Higgins <brendan.higgins@linux.dev>, Conor Dooley <conor.dooley@microchip.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Jean Delvare <jdelvare@suse.de>, Andi Shyti <andi.shyti@kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>, Florian Fainelli <f.fainelli@gmail.com>, "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, William Zhang <william.zhang@broadcom.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Andrew Jeffery <andrew@aj.id.au>, Wolfram Sang <wsa@kernel.org>, Tyrone Ting <kfting@nuvoton.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Andy,
>=20
> On Sun, Apr 30, 2023 at 12:17:12PM +0800, Ryan Chen wrote:
> > Add i2c new register mode driver to support AST2600 i2c new register
> > mode. AST2600 i2c controller have legacy and new register mode. The
> > new register mode have global register support 4 base clock for scl
> > clock selection, and new clock divider mode. The i2c new register mode
> > have separate register set to control i2c master and slave.
>=20
> ...
>=20
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/io.h>
> > +#include <linux/slab.h>
> > +#include <linux/delay.h>
> > +#include <linux/reset.h>
> > +#include <linux/module.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/completion.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/regmap.h>
> > +#include <linux/of_device.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/i2c-smbus.h>
>=20
> Ordered?
Update by alphabetical order

#include <linux/clk.h>
#include <linux/completion.h>
#include <linux/delay.h>
#include <linux/dma-mapping.h>
#include <linux/err.h>
#include <linux/i2c.h>
#include <linux/i2c-smbus.h>
#include <linux/interrupt.h>
#include <linux/io.h>
#include <linux/mfd/syscon.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/of_device.h>
#include <linux/of_irq.h>
#include <linux/regmap.h>
#include <linux/reset.h>
#include <linux/slab.h>
> ...
>=20
> > +#define AST2600_GLOBAL_INIT				\
> > +			(AST2600_I2CG_CTRL_NEW_REG |	\
> > +			AST2600_I2CG_CTRL_NEW_CLK_DIV)
>=20
> Make just a one TAB and put the last two lines on the single one.

Update by following.=20

#define AST2600_GLOBAL_INIT		\
	(AST2600_I2CG_CTRL_NEW_REG |	\
	 AST2600_I2CG_CTRL_NEW_CLK_DIV)
> ...
>=20
> > +#define I2CCG_DIV_CTRL 0xC6411208
>=20
> Is it decimal? Is it combination of bitfields? Can you add a comment what=
 is
> this magic?
>=20
This have been comment in previous line. I will move above of this magic co=
de.
/*
 * APB clk : 100Mhz
 * div	: scl		: baseclk [APB/((div/2) + 1)] : tBuf [1/bclk * 16]
 * I2CG10[31:24] base clk4 for i2c auto recovery timeout counter (0xC6)
 * I2CG10[23:16] base clk3 for Standard-mode (100Khz) min tBuf 4.7us
 * 0x3c : 100.8Khz	: 3.225Mhz					  : 4.96us
 * 0x3d : 99.2Khz	: 3.174Mhz					  : 5.04us
 * 0x3e : 97.65Khz	: 3.125Mhz					  : 5.12us
 * 0x40 : 97.75Khz	: 3.03Mhz					  : 5.28us
 * 0x41 : 99.5Khz	: 2.98Mhz					  : 5.36us (default)
 * I2CG10[15:8] base clk2 for Fast-mode (400Khz) min tBuf 1.3us
 * 0x12 : 400Khz	: 10Mhz						  : 1.6us
 * I2CG10[7:0] base clk1 for Fast-mode Plus (1Mhz) min tBuf 0.5us
 * 0x08 : 1Mhz		: 20Mhz						  : 0.8us
 */
> ...
>=20
> > +struct ast2600_i2c_timing_table {
> > +	u32 divisor;
> > +	u32 timing;
> > +};
>=20
> Is it even used?
>=20
Will remove.=20
> ...
>=20
> > +enum xfer_mode {
> > +	BYTE_MODE =3D 0,
>=20
> Why explicit assignment?

Will remove.
>=20
> > +	BUFF_MODE,
> > +	DMA_MODE,
> > +};
>=20
> ...
>=20
> > +	base_clk1 =3D (i2c_bus->apb_clk * 10) / ((((clk_div_reg & 0xff) + 2) =
* 10) /
> 2);
> > +	base_clk2 =3D (i2c_bus->apb_clk * 10) /
> > +			(((((clk_div_reg >> 8) & 0xff) + 2) * 10) / 2);
> > +	base_clk3 =3D (i2c_bus->apb_clk * 10) /
> > +			(((((clk_div_reg >> 16) & 0xff) + 2) * 10) / 2);
> > +	base_clk4 =3D (i2c_bus->apb_clk * 10) /
> > +			(((((clk_div_reg >> 24) & 0xff) + 2) * 10) / 2);
>=20
> The same equation is used per each byte of clk_div_reg? Can it be rewritt=
en to
> avoid this and using loop, so you will have an array of base_clk to be fi=
lled?
>=20
> Don't forget to use GENMASK().
>=20
Will update for loop.
	for (i =3D 0; i < AST2600_NUM_CLK_DIV_BYTES; i++) {
		u32 byte_val =3D (clk_div_reg >> (i * 8)) & GENMASK(7, 0);
		base_clk[i] =3D (i2c_bus->apb_clk * 10) / ((byte_val + 2) * 5);
	}
> ...
>=20
> > +	if ((i2c_bus->apb_clk / i2c_bus->bus_frequency) <=3D 32) {
> > +		baseclk_idx =3D 0;
> > +		divisor =3D DIV_ROUND_UP(i2c_bus->apb_clk,
> i2c_bus->bus_frequency);
> > +	} else if ((base_clk1 / i2c_bus->bus_frequency) <=3D 32) {
> > +		baseclk_idx =3D 1;
> > +		divisor =3D DIV_ROUND_UP(base_clk1, i2c_bus->bus_frequency);
> > +	} else if ((base_clk2 / i2c_bus->bus_frequency) <=3D 32) {
> > +		baseclk_idx =3D 2;
> > +		divisor =3D DIV_ROUND_UP(base_clk2, i2c_bus->bus_frequency);
> > +	} else if ((base_clk3 / i2c_bus->bus_frequency) <=3D 32) {
> > +		baseclk_idx =3D 3;
> > +		divisor =3D DIV_ROUND_UP(base_clk3, i2c_bus->bus_frequency);
>=20
> Will be optimized with above suggestion, I believe.

Will up with previous
>=20
> > +	} else {
> > +		baseclk_idx =3D 4;
> > +		divisor =3D DIV_ROUND_UP(base_clk4, i2c_bus->bus_frequency);
> > +		inc =3D 0;
> > +		while ((divisor + inc) > 32) {
> > +			inc |=3D divisor & 0x1;
> > +			divisor >>=3D 1;
> > +			baseclk_idx++;
> > +		}
> > +		divisor +=3D inc;
>=20
> I think the above loop can be rewritten to have better representation.
>=20
Will up with previous

> > +	}
>=20
> ...
>=20
> > +	baseclk_idx &=3D 0xf;
>=20
> GENMASK()?
>=20
Will update=20
> ...
>=20
> > +	scl_low =3D ((divisor * 9) / 16) - 1;
> > +	scl_low =3D min_t(u32, scl_low, 0xf);
>=20
> This can be done in one line. Also, why not 15?
>=20
> ...
>=20
> > +	scl_high =3D (divisor - scl_low - 2) & 0xf;
>=20
> GENMASK()?
Will update

>=20
> ...
>=20
> > +	data =3D ((scl_high - 1) << 20) | (scl_high << 16) | (scl_low << 12) =
|
> > +(baseclk_idx);
>=20
> Too many parentheses.
Update to=20
data =3D ((scl_high - 1) << 20) | (scl_high << 16) | (scl_low << 12) | base=
clk_idx;

>=20
> ...
>=20
> > +	/* due to master slave is common buffer, so need force the master sto=
p
> not issue */
> > +	if (readl(i2c_bus->reg_base + AST2600_I2CM_CMD_STS) & 0xffff) {
>=20
> GENMASK() ?
>=20
> > +		writel(0, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> > +		i2c_bus->cmd_err =3D -EBUSY;
> > +		writel(0, i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> > +		complete(&i2c_bus->cmd_complete);
> > +	}
>=20
> ...
>=20
> > +	/* send start */
> > +	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",
> > +		i2c_bus->msgs_index, msg->flags & I2C_M_RD ? "read" : "write",
>=20
> str_read_write() ?
Sorry do you mean there have a function call str_read_write?
Can you point me where it is for refer?
>=20
> > +		msg->len, msg->len > 1 ? "s" : "",
> > +		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);
>=20
> ...
>=20
> > +				for (i =3D 0; i < xfer_len; i++) {
> > +					wbuf[i % 4] =3D msg->buf[i];
> > +					if (i % 4 =3D=3D 3)
> > +						writel(*(u32 *)wbuf, i2c_bus->buf_base + i - 3);
>=20
> Err.. There can be alignment issues.

Will update
>=20
> > +				}
> > +				if (--i % 4 !=3D 3)
> > +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
>=20
> The above code is ugly. Can you think about it and write in a better way?
Sorry, that is because the register only support for 4 byte align write.
That the reason I need put for byte write to 4 byte align write.
>=20
> ...
>=20
> > +				for (i =3D 0; i < xfer_len; i++) {
> > +					wbuf[i % 4] =3D msg->buf[i2c_bus->master_xfer_cnt + i];
> > +					if (i % 4 =3D=3D 3)
> > +						writel(*(u32 *)wbuf, i2c_bus->buf_base + i - 3);
> > +				}
> > +				if (--i % 4 !=3D 3)
> > +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
>=20
> Ditto.
Will update

>=20
> ...
>=20
> Do you have similar code pieces? Why not doing it in a separate function =
with
> parameters?
>=20
I will think it to be MICRO function call.
> ...
>=20
> > +	return ast2600_i2c_master_irq(i2c_bus) ? IRQ_HANDLED : IRQ_NONE;
>=20
> IRQ_RETVAL() ?
Sorry, most return is handled or not handled.
Do you mean replace it just " return IRQ_RETVAL(ret);"

>=20
> ...
>=20
> > +	writel(0xfffffff, i2c_bus->reg_base + AST2600_I2CM_ISR);
>=20
> GENMASK()
>=20
Will Update
> ...
>=20
> > +	writel(0xfffffff, i2c_bus->reg_base + AST2600_I2CS_ISR);
>=20
> Ditto.
Will Update
>=20
> > +	if (i2c_bus->mode =3D=3D BYTE_MODE) {
> > +		writel(0xffff, i2c_bus->reg_base + AST2600_I2CS_IER);
>=20
> Ditto.
Will Update
>=20
> > +	} else {
> > +		/* Set interrupt generation of I2C slave controller */
> > +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CS_IER);
> > +	}
>=20
> ...
>=20
> > +	WARN_ON(!i2c_bus->slave);
>=20
> Why?
It can be removed.=20
>=20
> ...
>=20
> > +static const struct of_device_id ast2600_i2c_bus_of_table[] =3D {
> > +	{
> > +		.compatible =3D "aspeed,ast2600-i2cv2",
> > +	},
> > +	{}
> > +};
>=20
> > +
>=20
> Redundant blank line.
Will removed.
>=20
> > +MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);
>=20
> ...
>=20
> > +	i2c_bus =3D devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> > +	if (!i2c_bus)
> > +		return dev_err_probe(dev, -ENOMEM, "no memory allocated\n");
>=20
> No. We do not print error message for ENOMEM.
> You homework to find why.
>=20
Got it, will update.

> ...
>=20
> > +	if (of_property_read_bool(pdev->dev.of_node, "aspeed,enable-dma"))
>=20
> device_property_read_bool() ?
>=20
> > +		i2c_bus->mode =3D DMA_MODE;
>=20
> ...
>=20
> > +	if (i2c_bus->mode =3D=3D BUFF_MODE) {
> > +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +		if (res && resource_size(res) >=3D 2) {
> > +			i2c_bus->buf_base =3D devm_ioremap_resource(dev, res);
> > +
> > +			if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > +				i2c_bus->buf_size =3D resource_size(res) / 2;
> > +		} else {
> > +			i2c_bus->mode =3D BYTE_MODE;
> > +		}
> > +	}
>=20
> Can be done without additional checks and with a simple call to
> devm_platform_ioremap_resource(). No?
>=20
Sorry, I can't catch your point, can you guide me more about it?
> ...
>=20
> > +	/* i2c timeout counter: use base clk4 1Mhz,
> > +	 * per unit: 1/(1000/4096) =3D 4096us
> > +	 */
>=20
> Wrong multi-line style of the comment.
>=20
Will update to
/*
 * i2c timeout counter: use base clk4 1Mhz,
 * per unit: 1/(1000/4096) =3D 4096us
 */
> ...
>=20
> > +	ret =3D of_property_read_u32(dev->of_node,
> > +				   "i2c-scl-clk-low-timeout-us",
> > +				   &i2c_bus->timeout);
> > +	if (!ret)
> > +		i2c_bus->timeout /=3D 4096;
>=20
> What is this and why I2C core timings (standard) can't be utilized here?
It is scl clk timout setting. That have been discuss with following.
https://lore.kernel.org/lkml/20230314221614.24205-1-andi.shyti@kernel.org/T=
/

>=20
> ...
>=20
> > +	ret =3D of_property_read_u32(dev->of_node, "clock-frequency",
> &i2c_bus->bus_frequency);
> > +	if (ret < 0) {
> > +		dev_warn(dev, "Could not read clock-frequency property\n");
> > +		i2c_bus->bus_frequency =3D 100000;
> > +	}
>=20
> There are macro for standard speeds. Moreover, there is a function to par=
se
> properties, no need to open code.
>=20
Will update
ret =3D of_property_read_u32(dev->of_node, "clock-frequency", &bus_freq);
if (ret < 0) {
    dev_warn(dev, "Could not read clock-frequency property\n");
    i2c_bus->bus_frequency =3D I2C_SPEED_STANDARD;
} else {
    i2c_bus->bus_frequency =3D bus_freq;
}
> ...
>=20
> > +	i2c_bus->adap.dev.of_node =3D dev->of_node;
>=20
> device_set_node()
>=20
> ...
>=20
> > +	if (of_property_read_bool(dev->of_node, "smbus-alert")) {
>=20
> Doesn't core have already support for this?
Will remove it.=20
>=20
> > +		i2c_bus->alert_enable =3D true;
> > +		i2c_bus->ara =3D i2c_new_smbus_alert_device(&i2c_bus->adap,
> &i2c_bus->alert_data);
> > +		if (!i2c_bus->ara)
> > +			dev_warn(dev, "Failed to register ARA client\n");
> > +
> > +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER |
> AST2600_I2CM_SMBUS_ALT,
> > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > +	} else {
> > +		i2c_bus->alert_enable =3D false;
> > +		/* Set interrupt generation of I2C master controller */
> > +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > +	}
>=20
> ...
>=20
> > +	dev_info(dev, "%s [%d]: adapter [%d khz] mode [%d]\n",
> > +		 dev->of_node->name, i2c_bus->adap.nr, i2c_bus->bus_frequency /
> 1000,
> > +		 i2c_bus->mode);
>=20
> Useless noise.
>=20
Will remove it.

Thanks your review.

Best Regards,
Ryan Chen.
