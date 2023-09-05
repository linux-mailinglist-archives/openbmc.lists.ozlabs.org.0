Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D38C79209D
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 08:53:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=HFlTGzqT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rfx6y3t6Pz3c01
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 16:53:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=HFlTGzqT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::71e; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2071e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rfx6C601Xz2yWD;
	Tue,  5 Sep 2023 16:53:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anBhylP2ZsJUq5faIeBgQ00tpiEmdzlcjkW/35B11WEQkhFhi8CczPwoTU9nMkz9MY4kJf8sYck0VhBJ0llm59/CImfwkIsLoHzZGeSY3HAWccfLCfY91wpUXjEOlD5wINobeH9Pn/DyBBE2Ot559WEnFQEv29fotFjo3dD9qiAph/5vhTxAd998emrB322a/aXgdZs+COBYt1UO32dhncGrufa1kOS1HBUzC1Qw5er9JrZSVCG/A9njfLf3JHPa5GZrEuAddINSafExR+vtytfSve+U/sRTt3TeiIDf2+t4CHA7z9N3txr7rHUlSu0r9vkDo6Qcond7XzgJRFQA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYPX+CjRK+F/if6ypqjUYoL6UESxImNypupSWGv4JPs=;
 b=UJ4EZkf5XhXeIkDppQlb7/ZcOHXilPzC0hSnrQTjlVftorhdMoy6V/IbaFsPL+rfEdmnEZ1kETWOr0uhyoQXJ7Cqob/MO33a66knqaFwRa9PmhPf2znr69bqhIRe2p9l28GutisMiOE18XD9aFhcfrCpsCNqxsVMGopbBxuj7mcboyUDXAEkrW1kWebZVRzQDmq6cmTlOYNKXfXWP3B5hpbN4B7HkUEur8rsL91i52D38Z94k3UnMEx9d6QJigjXhg+NNcnB2nhaj1cXDArMOddGOHkr3X9FwxbUJCLpJFlOffJtBqNFXkcpPE717M7V9CqY5SCMumOiG2FLaLTRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYPX+CjRK+F/if6ypqjUYoL6UESxImNypupSWGv4JPs=;
 b=HFlTGzqTFXccK336GQ8DWl+0Xfx8jj7rr/VGHqQcJN53+Fa2IjJjndjzwEIkSggF8Ks+bTGIaW8XBBN6zZZ4E9A1QaJVsrw5sPvy3oPuwmS2sxMqoIRGhLN2tVvGpfP65i6510JDns+6EZiCK+3pODZCrShyzgXvHn1CL0142jHx5o0fY0X7ZFxzgEE9a+O5SnyBTnejSVgMRgBk8Nj08BLWetAloNYQAC8NTsZzlBgUN3A2AmW4QHhYIVVSDJev00XYUtPQY1blkwokzG8QKfDedFUHVxLkY/9n91CbY8AshxIx7WCnZVZGp00OIf5+3OlLL7qTElCu7mgsmfhnWQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5318.apcprd06.prod.outlook.com (2603:1096:101:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 06:52:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::d6ab:2a17:4633:9a7d]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::d6ab:2a17:4633:9a7d%5]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 06:52:38 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Topic: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index: AQHZtics0zDPons9tEqiPxizT4zKAq+49YuAgFMh/9A=
Date: Tue, 5 Sep 2023 06:52:37 +0000
Message-ID:  <SEZPR06MB5269831E049E2267661F181FF2E8A@SEZPR06MB5269.apcprd06.prod.outlook.com>
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
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SEZPR06MB5318:EE_
x-ms-office365-filtering-correlation-id: 0da92195-d1c4-4060-1611-08dbaddcb12f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hfJx+3q0hw4kNWmBCeWApaRXa0CU6REhLXWGmFZyeQ/cXklMtGPZ0zOfknWLcLtMNdNDdehhOke+LZ9eLwGM/wDI0yNm+uBG0S+8plZXym3H18BvgDboHaURQ8CEt47L8oo320mw6g1XhoxE2CNh1RaHILfd6Eth/CUVzjBiaXfyK3CSaP5uNRoOgy9LtOacEcMfFxrJWAJE/zFlwZTe3xOCPemqWaAUzAigpTquCBF3aeonXMSyY4fDZnY27D24sv6UU9QxVkZS+d6WYJSGSntOTnlQliKRXlhXtGEZCktEmzuMwM4W1Zck45taZhcxyoZrVNjvzprghjdw8/fx1739GSsbT9ed/xSmw/lESM0eGgoSXlU7Ezrg3X1YL2YM2o8XPGf6TD5zJZ1sAAXNWMwF8ozOj5lUMIHYOZeH4v5geBw6mcJxrpjrK7SLupnDmqlTyL8su2dPSQrG4rjvCniK9HbXPxY+q7F3wf/iqeoX/SyMt/40voAD8VlUU1vPqRx/jbuxDotw77m4McDLkCWUStxXGG53jddz4vkoFgzD8/JjdpxN7eL3YItmQnWURcpZzpcj8BlDyNoPFyVf7kovxtF+caGPw/YhM1cxR61RZhJ0vIPt0pl25drAdSqk
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(39850400004)(346002)(136003)(84040400005)(1800799009)(451199024)(186009)(52536014)(5660300002)(41300700001)(7416002)(66446008)(6916009)(66946007)(64756008)(54906003)(66476007)(8936002)(66556008)(76116006)(316002)(2906002)(30864003)(478600001)(53546011)(71200400001)(6506007)(7696005)(9686003)(8676002)(4326008)(26005)(83380400001)(38100700002)(122000001)(38070700005)(33656002)(86362001)(55016003)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?I1DEEDV6py0ZReBLheksKQ/UF5XZTLWodkTmxbafPmCNn5EE95ZLkDHb40xZ?=
 =?us-ascii?Q?q7MTiK6GhL7E6/HKyq2/OQ/qP3TiXff6XYUt+R78QHs52ifphIDRR8rl9v73?=
 =?us-ascii?Q?mOSu8LScvI+WDQkYU72I25zooEtDwk4ME8IvScf16x7HGmCEZnVW6J4coAMi?=
 =?us-ascii?Q?7RZG0KdMkwDBA3LNascrcWQDEVMIaJKSyygP4yNeoWXYrWf5alCjrDzUCQ0X?=
 =?us-ascii?Q?ZHvEV2RPo9+CQ891/F4pISDGPDEFEItotge71nR37Bs7IO3ywXccTl1QRhy8?=
 =?us-ascii?Q?E2lD5GUjqjfAHB0nS7gvaw932asV84bDK6VsvkbrXt9s9u+Cv3IQxQnuuI/6?=
 =?us-ascii?Q?+tKLjDie385oMTCukgUELq58Mb7K+OP4UJ0uiRmjjre7Py7a7/TZXqtEEM/p?=
 =?us-ascii?Q?79XqLmJug/fscHpLnwSIf8/+sxmrT1O2/dNuWMqr3mD3iAI9qVrM2Fy85eWL?=
 =?us-ascii?Q?BKEy7SEbtFySpiuu4LvS4v0XokHBI+3BJi5FwaAc2kpkFjtXAcZErfWW6RCJ?=
 =?us-ascii?Q?6YGtDdI5si/dBP843elIBdnc2YORi7zl3Lr6xFp5cfarNN38OOvZwdIdKxCK?=
 =?us-ascii?Q?i+e8MOBtkXA4n255l659Al+uRgqxe0DrKCj2lKVcH/CyPI0NxxTbnIl/nUQW?=
 =?us-ascii?Q?R4KLOUzPbKJ72WkqYtXWIv2cd+pRNmt8DgTITU5uFaTLTL/Pu+0VqaWdqq1c?=
 =?us-ascii?Q?x55kP/ZRsBF9eAkrGPrQT/ScZtMZT3/KuEJpFv0gglARl+bBZ7X0hEDhyRBF?=
 =?us-ascii?Q?otXmbU/aq8ibd1TyNgpl46ZvTQ/AAbjq/CCDlZLPaC5aBhMpUvNjLAPs0zlD?=
 =?us-ascii?Q?DkofSrneyig3d0JYEdrt7yh5bK+ySJZZbdsp3ERgQZ9azjS4pVW4WSNytokw?=
 =?us-ascii?Q?NKgw+YF0KsHm9GAwKKjMNinoQxoZs1zg/SH1GZzK848chw2fqnqNvwF7Pkt7?=
 =?us-ascii?Q?rLDtt/A9lEnrQTgvfXY6JKTukRWniJaBYTAXQ1wmz/8WYrDdVDzJg7jL3/sY?=
 =?us-ascii?Q?TFH3PBJyYw2sG5EGXJNmvS3CRD6iuGW5Tf+1jpqW3LYdI8BPmGg3P9q2gNOJ?=
 =?us-ascii?Q?fSN2dCqRJgi9+x1/ODJrHQznnw3vV/MU4/V2EH314m8bC6FDie6IIiYQKrTf?=
 =?us-ascii?Q?cZBPkOf2FXecwF4jmWNAvHiTKG86lGlGy2OFf/IvB1+g+Pjg4j2nC2K40kq9?=
 =?us-ascii?Q?8/khfvnTtTslp09L00kCbzDSkHR2kFsEFJjBWBVJsZ+9l0kwChqzmDqnnbjA?=
 =?us-ascii?Q?TQgdmGL/U6wlTo8+Kp/XQFoCGj/i0DQ+UZlJxcjM/1ACYDBsLzGs5gvktmGG?=
 =?us-ascii?Q?2lhYE0CpXaT7kacjmjE2PdOHNR8rNSKc3SKUvu+OfLmMdEACbmdYDMKy+tCF?=
 =?us-ascii?Q?2GFryAD5Ue4HuDjlxJBeGwmOm8UfVx4NTHaQ2Vbzobzj2yuZUCFBq6XTWRrj?=
 =?us-ascii?Q?wtbLQPT+ft7GoU90tsMFri2ta8CXKyMZHirTDAJ+SlVi/yu+nYtPPXUzkJnc?=
 =?us-ascii?Q?dKWMIHidXdIUN4hgWmYnT/pUd2hf0GZ78J4rg3tD+Zm63jweZgfzA2YfDklO?=
 =?us-ascii?Q?NhOD4ocukFhR3Ncml5cRPrv+Zkk24ASVkuN56gbS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da92195-d1c4-4060-1611-08dbaddcb12f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 06:52:37.9701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7vG5RAYXcL3inb+OdZQAQmpyuDUj39n4Fp1ri5PZe/3ZjrG60qcw6CIGeDModlkAWKYh0Fhgr8PNfiNkyChHlWcY3+cKP1U+IkDd4ia9Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5318
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
	Sorry for overquoting, I reply with historical.


> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Friday, July 14, 2023 4:55 PM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: jk@codeconstruct.com.au; Brendan Higgins <brendan.higgins@linux.dev>;
> Benjamin Herrenschmidt <benh@kernel.crashing.org>; Joel Stanley
> <joel@jms.id.au>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Andrew Jeffery <andrew@aj.id.au>;
> Philipp Zabel <p.zabel@pengutronix.de>; Wolfram Sang <wsa@kernel.org>;
> linux-i2c@vger.kernel.org; Florian Fainelli <f.fainelli@gmail.com>; Jean
> Delvare <jdelvare@suse.de>; William Zhang <william.zhang@broadcom.com>;
> Tyrone Ting <kfting@nuvoton.com>; Tharun Kumar P
> <tharunkumar.pasumarthi@microchip.com>; Conor Dooley
> <conor.dooley@microchip.com>; Phil Edworthy <phil.edworthy@renesas.com>;
> openbmc@lists.ozlabs.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
> =3Dlinux-kernel@vger.kernel.org; Andi Shyti <andi.shyti@kernel.org>
> Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new registe=
r
> mode driver
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

Modify with following.

#include <linux/bits.h>
#include <linux/clk.h>
#include <linux/completion.h>
#include <linux/delay.h>
#include <linux/dma-mapping.h>
#include <linux/err.h>
#include <linux/i2c.h>
#include <linux/i2c-smbus.h>
#include <linux/interrupt.h>
#include <linux/io.h>
#include <linux/module.h>
#include <linux/mfd/syscon.h>
#include <linux/platform_device.h>
#include <linux/property.h>
#include <linux/regmap.h>
#include <linux/reset.h>
#include <linux/slab.h>
#include <linux/string_helpers.h>


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
It will update next version.
#define AST2600_I2CC_GET_RX_BUF_LEN(x)      (((x) & GENMASK(29, 24)) >> 24)
#define AST2600_I2CC_GET_TX_BUF_LEN(x)      ((((x) & GENMASK(12, 8)) >> 8) =
+ 1)

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
Upon will update in following=20

static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
{
	unsigned long base_clk[4];
	unsigned long divisor;
	int baseclk_idx;
	u32 clk_div_reg;
	u32 scl_low;
	u32 scl_high;
	u32 data;


	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, &clk_div_reg)=
;
	for (int i =3D 0; i < 4; i++) {
		base_clk[i] =3D (i2c_bus->apb_clk * 2) /
			(((clk_div_reg >> (i * 8)) & GENMASK(7, 0)) + 2);
	}

	if ((i2c_bus->apb_clk / i2c_bus->timing_info.bus_freq_hz) <=3D 32) {
		baseclk_idx =3D 0;
		divisor =3D DIV_ROUND_UP(i2c_bus->apb_clk, i2c_bus->timing_info.bus_freq_=
hz);
	} else {
		unsigned int i;

		for (i =3D 0; i < 4; i++) {
			if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <=3D 32)
				break;
		}
		if (i =3D=3D 4) {
			baseclk_idx =3D 4;
			divisor =3D DIV_ROUND_UP(base_clk[3], i2c_bus->timing_info.bus_freq_hz);
			for_each_set_bit(divisor, &divisor, 32) {
				if ((divisor + 1) <=3D 32)
					break;
				divisor >>=3D 1;
				baseclk_idx++;
			}
		} else {
			baseclk_idx =3D i + 1;
			divisor =3D DIV_ROUND_UP(base_clk[i], i2c_bus->timing_info.bus_freq_hz);
		}
	}

	divisor =3D min_t(unsigned long, divisor, 32);
	baseclk_idx &=3D GENMASK(3, 0);
	scl_low =3D min(divisor * 9 / 16 - 1, GENMASK(3, 0));
	scl_high =3D (divisor - scl_low - 2) & GENMASK(3, 0);
	data =3D (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | baseclk_i=
dx;
	if (i2c_bus->timeout) {
		data |=3D AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
		data |=3D AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
	}

	return data;
}

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
Will read state in the function begin.
static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
{
	u32 state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
-----

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
Sorry I don't catch this split slave out to separate change?
Do you mean go for another file name example ast2600_i2c_slave.c ?


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

I will modify by following for deduplicated.
That can reuse the tx/rx function.

static int ast2600_i2c_do_start(struct ast2600_i2c_bus *i2c_bus)
{
	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
	int ret;

	/* send start */
	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",
		i2c_bus->msgs_index, str_read_write(msg->flags & I2C_M_RD),
		msg->len, msg->len > 1 ? "s" : "",
		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);

	i2c_bus->master_xfer_cnt =3D 0;
	i2c_bus->buf_index =3D 0;

	if (msg->flags & I2C_M_RD) {
		if (i2c_bus->mode =3D=3D DMA_MODE)
			ret =3D ast2600_i2c_setup_dma_rx(i2c_bus);
		else if (i2c_bus->mode =3D=3D BUFF_MODE)
			ret =3D ast2600_i2c_setup_buff_rx(i2c_bus);
		else
			ret =3D ast2600_i2c_setup_byte_rx(i2c_bus);
	} else {
		if (i2c_bus->mode =3D=3D DMA_MODE)
			ret =3D ast2600_i2c_setup_dma_tx(AST2600_I2CM_START_CMD, i2c_bus);
		else if (i2c_bus->mode =3D=3D BUFF_MODE)
			ret =3D ast2600_i2c_setup_buff_tx(AST2600_I2CM_START_CMD, i2c_bus);
		else
			ret =3D ast2600_i2c_setup_byte_tx(AST2600_I2CM_START_CMD, i2c_bus);
	}

	return ret;
}

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
Will update in next patch.

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
> ...

Sorry, about these parts. I quit no idea.
This is chip register limited, it only support dword write, not support byt=
e write.
So the only way I have is use get_unaligned_le32 function get the byte buff=
er to align dword write.
Or I may need your help point me a good way.

 	for (i =3D 0; i < xfer_len; i++) {
 		wbuf[i % 4] =3D msg->buf[i2c_bus->master_xfer_cnt + i];
 		if (i % 4 =3D=3D 3) {
 			wbuf_dword =3D get_unaligned_le32(wbuf);
 			writel(wbuf_dword, i2c_bus->buf_base + i - 3);
 		}
 	}
=20
 	if (--i % 4 !=3D 3) {
 		wbuf_dword =3D get_unaligned_le32(wbuf);
 		writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
 	}=20


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
Will update in next patch.

>=20
> > +static int ast2600_i2c_master_irq(struct ast2600_i2c_bus *i2c_bus) {
> > +	u32 sts =3D readl(i2c_bus->reg_base + AST2600_I2CM_ISR);
> > +	u32 ier =3D readl(i2c_bus->reg_base + AST2600_I2CM_IER);
> > +	u32 ctrl =3D 0;
>=20
> Redundant assignment.

Will update in next patch.
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
Will update in next patch.

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

Will update in next patch.
>=20
> ...
>=20
> > +		i2c_bus->buf_base =3D devm_platform_ioremap_resource(pdev, 1);
>=20
> > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
>=20
> Why not positive check?
If dtsi file don't claim resource index 1(that for buffer mode register), i=
t will use default BYTE_MODE.

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

Will use i2c_parse_fw_timings(i2c_bus->dev, &i2c_bus->timing_info, true); t=
o do.

>=20
> ...
>=20
> > +	if (of_property_read_bool(dev->of_node, "smbus-alert")) {
>=20
> device_property_read_bool()
Update
	i2c_bus->alert_enable =3D device_property_read_bool(dev, "smbus-alert");

>=20
> Doesn't I2C core handle this property?
Sorry, I don't see any in i2c core.
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

Will remove.=20

>
> ...
>=20
> > +		dmam_free_coherent(i2c_bus->dev, I2C_SLAVE_MSG_BUF_SIZE,
> > +				   i2c_bus->slave_dma_buf, i2c_bus->slave_dma_addr);
>=20
> Ditto.
Will remove
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

