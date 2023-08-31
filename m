Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A778E619
	for <lists+openbmc@lfdr.de>; Thu, 31 Aug 2023 08:05:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=PNsh38vD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbrHZ4dlSz3bY3
	for <lists+openbmc@lfdr.de>; Thu, 31 Aug 2023 16:05:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=PNsh38vD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::731; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20731.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbrGv0jrTz2yVw;
	Thu, 31 Aug 2023 16:04:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxZgDt4vDZFJ60sQn0DVM63Yu2LN962uuzuC/Qrn+2RevQzeuqmLH/FSVi4VSsXUs/Zg4EHQOaL+8pzpI7dsB6BSOBkKHLP9Uk2a+T+HAev9gQyMjtzIvVZnPfSMrrz9heXJ/+qf+WRRFrfSNVJbDMR9rQrAkbLxOQ5egSW76IXsXFHnLJkrrlsVcnV9XL3JkU/YTxakO6S5n4drYymG8ZUQBPU80gNHtdyp0BpLutuIVWTm6woEE6b87o9dZgRgt8bPkrA2aP4/OEnAvPiP6Y+JWu3hMoN67uR4LhdAioAsK/tZkHPqc29StYor6LVHr+vN5v2dn3mXKjVOtvVu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf3L7EbDK7gZlj/j2JilVMlrglQIiqZzs9crEl8yPW8=;
 b=nq3afrRNCJRRBzLo4m9DEouHYu+84J057D6M4be+LHn6BHJkpmbei99vHHQ08Dn+uL9pWm8LAXZZ2UqPdvB1QDAaCemeU0JB4yKlTZyfKr3xJoweDvjyM4MnGrLBZspgoUdALocKzhtknDF2EGml8dtvSU1gBLQUgIhvSbCufP6z0nR5KksGUYyT5J6JB3pcKrDyUWOwO5GKaMQpSTFsizxD3O60DH9MGNvDTAR4fIG4K6Y15yXwbdSC4IPwvvzGEE+6AVKuiAncP59J2xGwb+YOc7CsAJp60+zrlqSPQxr1JUjD7DbgEERaybitCkeVx/Z9hhi8Dk+jRvUCOeeHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jf3L7EbDK7gZlj/j2JilVMlrglQIiqZzs9crEl8yPW8=;
 b=PNsh38vD3nTTdJzsybQb0XFVVKN/ztwzRrB0myqwT37+hh76IYVYMmK9opvJLRi4QYWY1/M9NXkjSNAfMCHTBBgveWmvb1pC4rJ/ajmqAjWGCk5duCYj+C9pqhii0aJTB6o84+AVu0xfWeUTwa4Un4A2HRu2muVyU0r5ZsaqoZ5kaeF1JtuP1FAs7LnATlv+9m2A+Ep3Eq9XqecHtbejN6l2U5paNzqsf3ERhR91WlvOLwBlTossvnt+IDxZPgVU7PBkrIT7kl+fY/CbogGh+DrcWjB3VqJivcjcpNLJfQpr4xRs3MJSRmoP2jkOP0cN+E6CaiLIadbO+prXRGqLig==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5302.apcprd06.prod.outlook.com (2603:1096:101:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 06:04:31 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::d6ab:2a17:4633:9a7d]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::d6ab:2a17:4633:9a7d%5]) with mapi id 15.20.6745.015; Thu, 31 Aug 2023
 06:04:30 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Topic: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index: AQHZtics0zDPons9tEqiPxizT4zKAq+49YuAgEs+97A=
Date: Thu, 31 Aug 2023 06:04:30 +0000
Message-ID:  <SEZPR06MB5269A43F801EF04F39461174F2E5A@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
In-Reply-To: <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SEYPR06MB5302:EE_
x-ms-office365-filtering-correlation-id: 7a0e561b-a2f4-4d69-6de0-08dba9e82417
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  AsIPioTas+ZrS880J9G4iCcgLqOCgfQI8CSIHFMPl4DxFhBYjtpwxWaFlo10bypIwpNGJsrEP6OPVkVtq6ZCjvdxVdnb84RGz/aOFEk2jngcvSRsagkYpoMT3Z5U2qjvB82ex+AltdBivtENmJ5rlhL/k4FVFfebwPLz+F4wKJZ/6KL8znM1RgWIYsXG0nxDOtD47mXsmvb0b+6Dcpt1ftQCTY4wTXl8SCXdYTuhbw+JmKSQm/SgweHU36liUwaZ4cw9oZjaYmqbAnNwS7xvjxJtihiZ0k/P76+XD++YeMxYW+7BhhFpPjh9DdL2JphJzdTbwT3CAe3R5wOzLT1MRdwXeVQaRWsOV8z9Z+KFH0qS5GzpvH5hUf0+AD9y9REI/AxVHAffBnFKSuSb5/f1ItB2b+Hf9u4u0YhbXKwbYE8mFAk2J6rZFHzgxFWwRsDhVONcQfHT+wC2hSUQtYE+LP4pRX84b2prtpr3aNIjUns8PvBOBxH6VA0zfpxFScK+2/BjswnpF1mgpMAdcDFkFCJgl/RLSgZgY4dwz+6zwsjZqKghE1hzWhHtERMBIl0+OCjoajlnYJGJoDh+pmm3SCGn9FVivBRA01oRSQpwIU2SneeIQJpDsARrYxwLatVe
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(39850400004)(346002)(396003)(186009)(451199024)(1800799009)(55016003)(66476007)(66446008)(66556008)(64756008)(54906003)(316002)(6916009)(66946007)(38100700002)(478600001)(76116006)(38070700005)(122000001)(2906002)(30864003)(8676002)(7696005)(4326008)(5660300002)(41300700001)(52536014)(83380400001)(8936002)(86362001)(9686003)(6506007)(71200400001)(26005)(7416002)(33656002)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?7AV0VQeTBuPouCrvEs6zvd/vqWC3j/8uRl40/Z0AEaDAmAXEyJfq7AoKuDbK?=
 =?us-ascii?Q?5Yl02TMYgAFp6o54tMSOq9riK4b8sN0WJyn1ITskp2yU5RrjajwKTwP2w7ec?=
 =?us-ascii?Q?h1pi/o8oBlZ1t60wtAWrUK6y8R7LLxvkuspaH5seOt5c15WEJuYhW6nkk6yo?=
 =?us-ascii?Q?HMzbSqkz0P3ntoTq0CoFdd2VJTI14ZezT1o+f7xGseEqRjcUtaqVuWCj7bAh?=
 =?us-ascii?Q?h6LP9gQ4YEnIUeCBE0T2U29a4H/uHlCbagdTRCMev9R8KwMl54TjXsJ+KyGi?=
 =?us-ascii?Q?ZYq4Mx7x7iryRVy40A8x+QhlaSveCDsHncfuR4eOyb2wDQKMzUTcDMetyiX5?=
 =?us-ascii?Q?spCg1cxE0dYIHdBKXzXbBqLMpfqwkBFeMPaDxkBAIkjTcNkGQi49aEWHIhuN?=
 =?us-ascii?Q?RFFEjIGiABbtiL5gUpjL7MIi7m8LuolXvG4/8hByVBrOF9kMUL+uNM0w6EEe?=
 =?us-ascii?Q?/KepPSNcOW4UJcs/lPwCUX/H1RChk3h8GN47BXaYjhfgTSpY0lCsPtMd8Axa?=
 =?us-ascii?Q?16HxOkmPlsW5Rkq/V2D2k0//uye3NqNZ0VZwjTJu3SdcIlwf+8T5grIoGA5u?=
 =?us-ascii?Q?lNhvLClMsE7fdDkEp6ZDemLQog4iydo7SHjaWo7C4FqdHKGednAzqv13dy+D?=
 =?us-ascii?Q?75Pb32jHVvOiEsRP5G3aHI9hygRLUh0jCx1gP+MuIu/14kADARZAteiQlDHR?=
 =?us-ascii?Q?4qQx2Lne41gaC499egg7Sav6Dk4RmSmPZG3q9Q9QowJB3cPeNOi9Dj3cY1vy?=
 =?us-ascii?Q?cZ78z5iewIXlrAyoo3BYCFHwPLVV1rhR+dR+0TuZD2ttlQF0Y5pmU2LWZQgb?=
 =?us-ascii?Q?lpL/kvMKIqvVk10gHEiA5zf9FTiklF7uG1GBo8ikFdQ8uQlIx7lOddkmaQgm?=
 =?us-ascii?Q?LgrXdnhvtlUKRceJffBIyb6ErJ9Ibs568F+7+eX6gxNCT25rA+CuQmEwP40C?=
 =?us-ascii?Q?/KlrcGbJpu9tJnyyYPDYL5CRQ46U50tc6QCcev7ZoDbuuirSSD7dUzDgtEsg?=
 =?us-ascii?Q?gKSeBHDuO5J+I/9kcVywa4RYIzw6oYNcFSZjHwOeOZ8XPQ/DqpehhHgMKIbp?=
 =?us-ascii?Q?MYW1FCWGVs0u/ihXxFHwhqCCEzzFR3CH/U5lbs5LarhTSmKrR/Rkq2O39U6M?=
 =?us-ascii?Q?DM5cWnvML3or1WNsFc2Rsk1vllrYYukUjKywcgx3z2wYHK2WBzLlDQsZ2Vl8?=
 =?us-ascii?Q?VXB6seQsV5Ej6vuUYiGiRWb1Efupn92vb42GpX4eCl/Pb8srwTPnaw4SyzSx?=
 =?us-ascii?Q?b+Jy8YZSS0kjY9b3M8D6qAtt5GLWWMvYlV6Cm1UpqkcmLkx3xg48jYYf7M8x?=
 =?us-ascii?Q?c60+WRLJrQzVj5lbOm6YkzX+Tzjvk7n/QNIbxOecArRRgPhmmKORvwz/zwDE?=
 =?us-ascii?Q?SQ0QvSznf3kd7eeV0Eel2kXFwmgpALxh+1DFBKQzgiZDm/njFqQ8UQumi0r5?=
 =?us-ascii?Q?y1yYglLybxqsOwGkvjOfAs1Z7ldPqLuas/9woKn1z8YNCwgUOKgcf9CNusD6?=
 =?us-ascii?Q?5xZiPYfP967TN3F1qIVxBJdeumMAv5fk6SsDQQwicBNnHXuPfGkTveD7HH9t?=
 =?us-ascii?Q?LZkGdlhQ7rcg7HtDfAFln6tgxW/CBP4ze67DdHhW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0e561b-a2f4-4d69-6de0-08dba9e82417
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 06:04:30.5517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvLiag73bMMkX/Fe6YSzscVXGw9pDVsqCcmMfY5RbGFFvJekksMqMo6fgoAchtbP5+nrhwYg43CeMlqGIn72GuKXpQxAqT1gPlaWoxcHf8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5302
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
> On Fri, Jul 14, 2023 at 03:45:22PM +0800, Ryan Chen wrote:
> > Add i2c new register mode driver to support AST2600 i2c new register
> > mode. AST2600 i2c controller have legacy and new register mode. The
> > new register mode have global register support 4 base clock for scl
> > clock selection, and new clock divider mode. The i2c new register mode
> > have separate register set to control i2c master and slave.
>=20
> ...
>=20
> + bits.h
>=20
> > +#include <linux/clk.h>
> > +#include <linux/completion.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/i2c-smbus.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/mfd/syscon.h>
>=20
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
>=20
> You missed property.h
> and these of*.h probably not needed at all, see below.
>=20
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +#include <linux/slab.h>
> > +#include <linux/string_helpers.h>
>=20
> ...
>=20
> > +#define AST2600_I2CC_GET_RX_BUFF(x)			(((x) >> 8) &
> GENMASK(7, 0))
>=20
> > +#define AST2600_I2CC_GET_RX_BUF_LEN(x)		(((x) >> 24) &
> GENMASK(5, 0))
>=20
> > +#define AST2600_I2CC_GET_TX_BUF_LEN(x)		((((x) >> 8) &
> GENMASK(4, 0)) + 1)
>=20
> With right shifts it's better to have GENMASK to be applied first, it wil=
l show
> exact MSB of the bitfield.
>=20
> (Ditto for other cases similar to these)
>=20
> ...
>=20
> > +static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
> > +{
> > +	unsigned long base_clk[4];
> > +	int baseclk_idx;
> > +	u32 clk_div_reg;
> > +	u32 scl_low;
> > +	u32 scl_high;
> > +	int divisor;
> > +	int inc =3D 0;
> > +	u32 data;
> > +
> > +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL,
> &clk_div_reg);
> > +	for (int i =3D 0; i < 4; i++) {
>=20
> See below.
>=20
> > +		base_clk[i] =3D (i2c_bus->apb_clk * 10) /
> > +		(((((clk_div_reg >> (i * 8)) & GENMASK(7, 0)) + 2) * 10) / 2);
>=20
> Second line is wrongly indented.
>=20
> > +	}
>=20
> > +	if ((i2c_bus->apb_clk / i2c_bus->bus_frequency) <=3D 32) {
> > +		baseclk_idx =3D 0;
> > +		divisor =3D DIV_ROUND_UP(i2c_bus->apb_clk,
> i2c_bus->bus_frequency);
> > +	} else {
>=20
> > +		int i;
> > +
>=20
> Just add to the definition block:
>=20
> 	unsigned int i;
>=20
> > +		for (i =3D 0; i < 4; i++) {
> > +			if ((base_clk[i] / i2c_bus->bus_frequency) <=3D 32) {
>=20
> > +				baseclk_idx =3D i + 1;
> > +				divisor =3D DIV_ROUND_UP(base_clk[i],
> i2c_bus->bus_frequency);
>=20
> These two can be moved outside of the loop
>=20
> > +				break;
> > +			}
>=20
> 			if ((base_clk[i] / i2c_bus->bus_frequency) <=3D 32)
> 				break;
>=20
> > +		}
> > +		if (i =3D=3D 4) {
> > +			baseclk_idx =3D 4;
> > +			divisor =3D DIV_ROUND_UP(base_clk[3],
> i2c_bus->bus_frequency);
>=20
> > +			while ((divisor + inc) > 32) {
> > +				inc |=3D divisor & 0x1;
> > +				divisor >>=3D 1;
>=20
> 	unsigned long divisor;
>=20
> 			for_each_set_bit(divisor, ...)
>=20
> I.o.w. think about this, maybe you can refactor with the above.
>=20
> > +				baseclk_idx++;
> > +			}
> > +			divisor +=3D inc;
>=20
> 		} else {
> 			...those two lines...
>=20
> > +		}
>=20
> > +	}
> > +
> > +	divisor =3D min_t(int, divisor, 32);
> > +	baseclk_idx &=3D GENMASK(3, 0);
>=20
> > +	scl_low =3D ((divisor * 9) / 16) - 1;
> > +	scl_low =3D min_t(u32, scl_low, GENMASK(3, 0));
>=20
> (with the divisor being unsigned long) this can be rewritten as
>=20
> 	scl_low =3D min(divisor * 9 / 16 - 1, GENMASK(3, 0));
>=20
> which improves type checking and readability.
>=20
> > +	scl_high =3D (divisor - scl_low - 2) & GENMASK(3, 0);
> > +	data =3D (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 |
> > +baseclk_idx;
> > +
> > +	if (i2c_bus->timeout) {
> > +		data |=3D AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
> > +		data |=3D AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
> > +	}
> > +
> > +	return data;
> > +}
>=20
> ...
>=20
> > +static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus) {
> > +	int ret =3D 0;
> > +	u32 ctrl;
> > +	u32 state;
> > +	int r;
>=20
> > +	dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n", i2c_bus->adap.nr,
> > +		readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
>=20
> Why you can't reuse "state" (assigned below)?
> If not, then something like
>=20
> 	/* ...comment that state can be changed... */
> 	state =3D ...
> 	dev_dbg(state);
>=20
> > +	ctrl =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +
> > +	writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
> > +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +
> > +	writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) |
> > +AST2600_I2CC_MASTER_EN,
>=20
> will it be different from ctrl value?
>=20
> > +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +
> > +	reinit_completion(&i2c_bus->cmd_complete);
> > +	i2c_bus->cmd_err =3D 0;
> > +
> > +	/* Check 0x14's SDA and SCL status */
> > +	state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state &
> AST2600_I2CC_SCL_LINE_STS)) {
> > +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base +
> AST2600_I2CM_CMD_STS);
> > +		r =3D wait_for_completion_timeout(&i2c_bus->cmd_complete,
> i2c_bus->adap.timeout);
> > +		if (r =3D=3D 0) {
> > +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > +			ret =3D -ETIMEDOUT;
>=20
> > +		} else {
> > +			if (i2c_bus->cmd_err) {
>=20
> 		} else if (...) {
>=20
> > +				dev_dbg(i2c_bus->dev, "recovery error\n");
> > +				ret =3D -EPROTO;
> > +			}
> > +		}
> > +	}
> > +
> > +	dev_dbg(i2c_bus->dev, "Recovery done [%x]\n",
> > +		readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
>=20
> As above.
>=20
> > +	if (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) &
> > +AST2600_I2CC_BUS_BUSY_STS) {
>=20
> Two sequential reads may give you different values?
>=20
> > +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n",
> > +			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
>=20
> Again? With this inconsistency it will be "nice" to debug.
>=20
> > +		ret =3D -EPROTO;
> > +	}
> > +
> > +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +	return ret;
> > +}
>=20
> ...
>=20
> > +#ifdef CONFIG_I2C_SLAVE
>=20
> For (at least) review purposes I recommend to split slave out to the sepa=
rate
> change. This driver is 16 hundreds LoCs long...
>=20
> > +#endif
>=20
> ...
>=20
> > +		} else if (i2c_bus->mode =3D=3D BUFF_MODE) {
> > +			/* buff mode */
> > +			cmd |=3D AST2600_I2CM_RX_BUFF_EN;
>=20
> > +			if (msg->flags & I2C_M_RECV_LEN) {
> > +				dev_dbg(i2c_bus->dev, "smbus read\n");
> > +				xfer_len =3D 1;
> > +			} else {
> > +				if (msg->len > i2c_bus->buf_size) {
> > +					xfer_len =3D i2c_bus->buf_size;
> > +				} else {
> > +					xfer_len =3D msg->len;
> > +					if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
> > +						cmd |=3D MASTER_TRIGGER_LAST_STOP;
> > +				}
> > +			}
>=20
> This...
>=20
> > +			writel(AST2600_I2CC_SET_RX_BUF_LEN(xfer_len),
> > +			       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> > +		} else {
>=20
> > +			/* byte mode */
> > +			xfer_len =3D 1;
> > +			if (msg->flags & I2C_M_RECV_LEN) {
> > +				dev_dbg(i2c_bus->dev, "smbus read\n");
> > +			} else {
> > +				if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count) {
> > +					if (msg->len =3D=3D 1)
> > +						cmd |=3D MASTER_TRIGGER_LAST_STOP;
> > +				}
> > +			}
>=20
> ...and this have a lot in common, can it be deduplicated?
>=20
> > +		}
>=20
> ...
>=20
> > +			if (msg->len > AST2600_I2C_DMA_SIZE) {
> > +				xfer_len =3D AST2600_I2C_DMA_SIZE;
> > +			} else {
> > +				if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
> > +					cmd |=3D AST2600_I2CM_STOP_CMD;
> > +				xfer_len =3D msg->len;
> > +			}
>=20
> See above.
>=20
> ...
>=20
> > +			u8 wbuf[4];
> > +			/* buff mode */
> > +			if (msg->len > i2c_bus->buf_size) {
> > +				xfer_len =3D i2c_bus->buf_size;
> > +			} else {
> > +				if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
> > +					cmd |=3D AST2600_I2CM_STOP_CMD;
> > +				xfer_len =3D msg->len;
> > +			}
> > +			if (xfer_len) {
> > +				cmd |=3D AST2600_I2CM_TX_BUFF_EN |
> AST2600_I2CM_TX_CMD;
> > +				if (readl(i2c_bus->reg_base + AST2600_I2CS_ISR))
> > +					return -ENOMEM;
> > +				writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> > +				       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> > +				if (readl(i2c_bus->reg_base + AST2600_I2CS_ISR))
> > +					return -ENOMEM;
> > +				for (i =3D 0; i < xfer_len; i++) {
> > +					wbuf[i % 4] =3D msg->buf[i];
> > +					if (i % 4 =3D=3D 3)
>=20
> > +						writel(*(u32 *)wbuf, i2c_bus->buf_base + i - 3);
>=20
> This is incorrect memory accessor.
>=20
> > +				}
> > +				if (--i % 4 !=3D 3)
> > +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
>=20
> Ditto.
>=20
> > +			}
>=20
> ...
>=20
> > +static int ast2600_i2c_is_irq_error(u32 irq_status)
>=20
> This function is not boolean, so "_is_" seems misleading.
>=20
> This is basically error code conversion, something like
>=20
> ast2600_i2c_irq_err_to_errno(u32 irq_status)
>=20
> > +{
> > +	if (irq_status & AST2600_I2CM_ARBIT_LOSS)
> > +		return -EAGAIN;
> > +	if (irq_status & (AST2600_I2CM_SDA_DL_TO |
> AST2600_I2CM_SCL_LOW_TO))
> > +		return -EBUSY;
> > +	if (irq_status & (AST2600_I2CM_ABNORMAL))
> > +		return -EPROTO;
> > +
> > +	return 0;
> > +}
>=20
> ...
>=20
> > +				u8 wbuf[4];
> > +
> > +				cmd |=3D AST2600_I2CM_TX_BUFF_EN;
> > +				xfer_len =3D msg->len - i2c_bus->master_xfer_cnt;
> > +				if (xfer_len > i2c_bus->buf_size) {
> > +					xfer_len =3D i2c_bus->buf_size;
> > +				} else {
> > +					if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
> > +						cmd |=3D AST2600_I2CM_STOP_CMD;
> > +				}
> > +				for (i =3D 0; i < xfer_len; i++) {
> > +					wbuf[i % 4] =3D msg->buf[i2c_bus->master_xfer_cnt + i];
> > +					if (i % 4 =3D=3D 3)
> > +						writel(*(u32 *)wbuf, i2c_bus->buf_base + i - 3);
> > +				}
> > +				if (--i % 4 !=3D 3)
> > +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
> > +				writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> > +				       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
>=20
> Wrong memory accessors. You should use something from asm/byteorder.h
> which includes linux/byteorder/generic.h.
>=20

Are you preferring add comment to explain more by following?
				/*
				 * The controller's buffer register supports dword writes only.
				 * Therefore, write dwords to the buffer register in a 4-byte aligned,
				 * and write the remaining unaligned data at the end.
				 */
				for (i =3D 0; i < xfer_len; i++) {
					wbuf[i % 4] =3D msg->buf[i2c_bus->master_xfer_cnt + i];
					/* accumulating 4 bytes of data, write as a Dword to the buffer regist=
er */
					if (i % 4 =3D=3D 3)
						writel(*(u32 *)wbuf, i2c_bus->buf_base + i - 3);
				}
				/* less than 4 bytes of remaining data, write the remaining part as a D=
word */
				if (--i % 4 !=3D 3)
					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
				writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
				       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);

Or more columns (use get_unaligned_le32(wbuf); ) by following.

	for (i =3D 0; i < xfer_len; i++) {
		wbuf[i % 4] =3D msg->buf[i2c_bus->master_xfer_cnt + i];
		if (i % 4 =3D=3D 3) {
			wbuf_dword =3D get_unaligned_le32(wbuf);
			writel(wbuf_dword, i2c_bus->buf_base + i - 3);
		}
	}

	if (--i % 4 !=3D 3) {
		wbuf_dword =3D get_unaligned_le32(wbuf);
		writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
	}

> ...
>=20
> > +#ifdef CONFIG_I2C_SLAVE
> > +		/* Workaround for master/slave package mode enable rx done stuck
> issue
> > +		 * When master go for first read (RX_DONE), slave mode will also
> effect
> > +		 * Then controller will send nack, not operate anymore.
> > +		 */
>=20
> /*
>  * Wrong style of multi-line
>  * comments. You need to fix
>  * them in the entire driver.
>  */
>=20
> > +		if (readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS) &
> AST2600_I2CS_PKT_MODE_EN) {
> > +			u32 slave_cmd =3D readl(i2c_bus->reg_base +
> AST2600_I2CS_CMD_STS);
> > +
> > +			writel(0, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> > +			writel(slave_cmd, i2c_bus->reg_base +
> AST2600_I2CS_CMD_STS);
> > +		}
> > +		fallthrough;
> > +#endif
>=20
> ...
>=20
> > +static int ast2600_i2c_master_irq(struct ast2600_i2c_bus *i2c_bus) {
> > +	u32 sts =3D readl(i2c_bus->reg_base + AST2600_I2CM_ISR);
> > +	u32 ier =3D readl(i2c_bus->reg_base + AST2600_I2CM_IER);
> > +	u32 ctrl =3D 0;
>=20
> Redundant assignment.
>=20
> > +	if (!i2c_bus->alert_enable)
> > +		sts &=3D ~AST2600_I2CM_SMBUS_ALT;
> > +
> > +	if (AST2600_I2CM_BUS_RECOVER_FAIL & sts) {
> > +		writel(AST2600_I2CM_BUS_RECOVER_FAIL, i2c_bus->reg_base +
> AST2600_I2CM_ISR);
> > +		ctrl =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +		writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +		i2c_bus->cmd_err =3D -EPROTO;
> > +		complete(&i2c_bus->cmd_complete);
> > +		return 1;
> > +	}
> > +
> > +	if (AST2600_I2CM_BUS_RECOVER & sts) {
> > +		writel(AST2600_I2CM_BUS_RECOVER, i2c_bus->reg_base +
> AST2600_I2CM_ISR);
> > +		i2c_bus->cmd_err =3D 0;
> > +		complete(&i2c_bus->cmd_complete);
> > +		return 1;
> > +	}
> > +
> > +	if (AST2600_I2CM_SMBUS_ALT & sts) {
> > +		if (ier & AST2600_I2CM_SMBUS_ALT) {
> > +			/* Disable ALT INT */
> > +			writel(ier & ~AST2600_I2CM_SMBUS_ALT, i2c_bus->reg_base +
> AST2600_I2CM_IER);
> > +			i2c_handle_smbus_alert(i2c_bus->ara);
> > +			writel(AST2600_I2CM_SMBUS_ALT, i2c_bus->reg_base +
> AST2600_I2CM_ISR);
> > +			dev_err(i2c_bus->dev,
> > +				"ast2600_master_alert_recv bus id %d, Disable Alt, Please
> Imple\n",
> > +				i2c_bus->adap.nr);
> > +			return 1;
> > +		}
> > +	}
> > +
> > +	i2c_bus->cmd_err =3D ast2600_i2c_is_irq_error(sts);
> > +	if (i2c_bus->cmd_err) {
> > +		writel(AST2600_I2CM_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CM_ISR);
> > +		complete(&i2c_bus->cmd_complete);
> > +		return 1;
> > +	}
> > +
> > +	if (AST2600_I2CM_PKT_DONE & sts) {
> > +		ast2600_i2c_master_package_irq(i2c_bus, sts);
> > +		return 1;
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> ...
>=20
> > +	if (of_property_read_bool(pdev->dev.of_node, "multi-master"))
> > +		i2c_bus->multi_master =3D true;
> > +	else
> > +		fun_ctrl |=3D AST2600_I2CC_MULTI_MASTER_DIS;
>=20
> 	i2c_bus->multi_master =3D device_property_read_bool(&pdev->dev,
> "multi-master");
> 	if (!i2c_bus->multi_master)
> 		fun_ctrl |=3D AST2600_I2CC_MULTI_MASTER_DIS;
>=20
> ...
>=20
> > +	struct device_node *np =3D pdev->dev.of_node;
>=20
> It should use dev, but see below.
>=20
> > +	struct device *dev =3D &pdev->dev;
> > +	struct ast2600_i2c_bus *i2c_bus;
> > +	struct resource *res;
> > +	u32 global_ctrl;
>=20
> > +	int ret =3D 0;
>=20
> Do you need this assignment?
>=20
> ...
>=20
> > +		i2c_bus->buf_base =3D devm_platform_ioremap_resource(pdev, 1);
>=20
> > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
>=20
> Why not positive check?
>=20
> > +			i2c_bus->buf_size =3D resource_size(res) / 2;
> > +		else
> > +			i2c_bus->mode =3D BYTE_MODE;
> > +	}
>=20
> ...
>=20
> > +	ret =3D of_property_read_u32(dev->of_node,
> > +				   "i2c-scl-clk-low-timeout-us",
> > +				   &i2c_bus->timeout);
>=20
> 	device_property_read_u32()
>=20
> > +	if (!ret)
> > +		i2c_bus->timeout /=3D 4096;
>=20
> ...
>=20
> > +	ret =3D device_property_read_u32(&pdev->dev, "clock-frequency",
> &i2c_bus->bus_frequency);
> > +	if (ret < 0) {
> > +		dev_warn(dev, "Could not read clock-frequency property\n");
> > +		i2c_bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> > +	}
>=20
> Use standard API from I2C core for this.
>=20
> ...
>=20
> > +	if (of_property_read_bool(dev->of_node, "smbus-alert")) {
>=20
> device_property_read_bool()
>=20
> Doesn't I2C core handle this property?
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
> > +	devm_free_irq(&pdev->dev, i2c_bus->irq, i2c_bus);
>=20
> Why explicit call?
>=20
> ...
>=20
> > +		dmam_free_coherent(i2c_bus->dev, I2C_SLAVE_MSG_BUF_SIZE,
> > +				   i2c_bus->slave_dma_buf, i2c_bus->slave_dma_addr);
>=20
> Ditto.
>=20
> ...
>=20
> It looks to me like you ignored part of my comments. If so, I would like =
to know
> why.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

