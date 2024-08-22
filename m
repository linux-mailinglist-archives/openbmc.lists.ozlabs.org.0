Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D8A95AAF2
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 04:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq6Vt52snz305C
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 12:25:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=N1tFL4LF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq6VD2RRKz2xJ6;
	Thu, 22 Aug 2024 12:24:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfdCAa42CEcR0B29j0cacj5XKmnV0nuuGP5JcjPpXNecRhMtTMWl2un5O+qUiLiGsoqvb6yfZpqjPwZUsdmE2S0ID5DW6zZFBZ/GpBulXlSKRkAGr+Wki456zUmhVyJIpR329Sj3K980I16mFWNIkiLoMPs3e9A38+T6IB8VKEJ2rbivZVhqyWI1MTBav9UHyTlUv7q7XfnnS/fcdurAMFv96qoAoDSXi6+wL/lSAp6ps51un+HaDoXxUkTj7rO82gVv1P0gDcuy0EkMaCerfvPL+ULG8BSe2kIrVa+2xCR5F0U+/JMyPeCAaWEB6XQ1NXmxIGCrWfq3cHeIFT8S5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAZLkh1h62Os4K6rQv45YOaeivGMcuXVcWBQSwnbhFY=;
 b=mZ436PvC/62uJiiaRYcNjzDq9HsF2nTUJk1Q0XnoaMvhdJUENvEXnn4ayF1bIortFNFa7BIL4LYgNQkYKJIr7ZK3/HEhYgENXGF++olR90mIXFQrf6O7s578vgoarioXoeTlAtHL24YFmVMRNJVLF2k9zpZOzzLJAjygXWZp1e38Tcbym/eiXvFXz9z+OCyuWWwKUy5YPFMPkYodp+RIa4qSQvd4LqnNjkW7crcKIjzRt7csG1Jei0XhMPGIaXGqDX2zjsoiOMMvyh972x2Z6WLnXSz/ODr4YlsbaJObaa18nEktJ2fFkx74eTKEDVeUrwrG9mUX6YeN6iTRt/aGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZLkh1h62Os4K6rQv45YOaeivGMcuXVcWBQSwnbhFY=;
 b=N1tFL4LFvoFs6y4XKfpl8XKVQ798ZAXGywAslNS+dczgQOLPqSiA83rj5zT5jc//Ha/Sby+z00nidzxoNGiPsl+JtFt8CbaVLag8w7CyF4rlzhbmrbvtY6ylGQkKsCChiDy5b0tuJpTfh7TnwglH4y6JAw4i5s1TtEHkxDrkdmvrSf+E/FF43cEyKA08akMyD9JKC7LntAqwd+ftS6r3F7LmVshwwA3DpMWie+1RdS+9XG1V2UJzO85+4JQk6wtOI2d1sjVaIV2h2qF489dQxcpJWfC1yE501qGzjwge04njrLbb7oc6wxYoiycaTNhxY6rTb4/Yja78t9x0/nidiw==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR06MB6162.apcprd06.prod.outlook.com (2603:1096:820:d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 02:24:27 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 02:24:26 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index: AQHa8ho4oLFWUX2yC0qHT9Kfp3UIaLIuoMcAgAJo7hCAAJOvgIAA5YcA
Date: Thu, 22 Aug 2024 02:24:26 +0000
Message-ID:  <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
In-Reply-To: <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR06MB6162:EE_
x-ms-office365-filtering-correlation-id: 26d522d7-77a6-41a5-2585-08dcc2518b8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?gwXgYpevgIOyi1FS9w3zVdNiQ6ffoWacthlHHCFeLq3r73+5+bYGUG8CR7Ig?=
 =?us-ascii?Q?zeVtKXq9x94FR4V/FFpxfX1mLK40Ffl4mqtuVHXdJaaz6ciej0iihlelu8rD?=
 =?us-ascii?Q?kXDQrrDXUu/QAVGebx8zSTzCIdPJJcP1wB1tHR5R8QceDgco4C7IynwT9CPr?=
 =?us-ascii?Q?LIaRyM8xinJLYjHhZFRFEKzuqcDVwVXqFbYPEnw7yKQjmShLdLJy/rz3G7LS?=
 =?us-ascii?Q?a4SMmmnd1g5XXZsZn9U+9kO92UYgWDoMLsRut00Vql24OAuUZ1aMb78IFRsM?=
 =?us-ascii?Q?TqMp0Zy1qnGdfVQOSAOMjIDUjEHpv3i0nogjPC+lI+YHnHF4bUcIHGFEZ7qy?=
 =?us-ascii?Q?Q19w6Y8E/es9DTE0NTkyeVcflk7BN5Ya6zgdGBNfYsNPueQBspkBw33RU2IW?=
 =?us-ascii?Q?SVgqyg1OLalC3ivA8Bwe9s+0LO0lsjnuWnMY5o+kgnGtGZFF5e9Ssmx12wpB?=
 =?us-ascii?Q?9/UOCSn5fcaApgHh0Lj+q+rYQUIv2pV/ZmS6SWibHWwhrkPjJjabSaa1ccFA?=
 =?us-ascii?Q?tth7SjZ9TgLz7SV8JQCp5sUNZwI9UajXvUsofVHmbZ/v4ZanhaApEUX52DsM?=
 =?us-ascii?Q?vjCU6spBhLQkoIij31TT3bP0Eh2X4JsELrW+WrKbiUrzIW0Il8I2oWhFx1iV?=
 =?us-ascii?Q?xxHyTTp9/iZpKiXBpydmPa22UCxDlVTOjfDpzTEUvjjRznKYNXmrbhiEhH8s?=
 =?us-ascii?Q?RNyR7HSVkLBb/5MVze7cFc0OdASI0Xs9dzz3Vzy5QcQJdUPpz/uSqF2ce0zo?=
 =?us-ascii?Q?lrOsLJ9whF0zMvlM7mmwDfweYQMFawp0Aorj5zjTXxoHNcrbhTjBpa3Ny5gv?=
 =?us-ascii?Q?O18AaU76+NeFj8D1R/1/E1HB772AwBkywgVE/TAWdpJRQDaNk1v/lsu2SyS/?=
 =?us-ascii?Q?qjET3VIKZInehcdf9QlMxXTlXfGx5LhSdswhdmn3tRapjVgORSOMUzXU8Vh0?=
 =?us-ascii?Q?uAMk0G4yw4MhAPVhBq965igbmYIHMJyUmHggeRsZ25kNwJ8JstmK2vRIXPCu?=
 =?us-ascii?Q?FJenC7aNuB4jGbioph+3+Kg8l6AXUb7UnGWEAUJ7ROuDE9lzg7EPojQ0y6++?=
 =?us-ascii?Q?pGMdC3v3+XqOB8n+pStAuneeqzcqcHxJF+HmBI/iAyrWOw5T8VWoEwSJkcIS?=
 =?us-ascii?Q?AefXoR2GuGNKvn4iUQYpKeMBQFb1Jg2Rc/liQaBLzstzx2lYBOaZW7bp17zZ?=
 =?us-ascii?Q?57qS1OkVXluxpOCZCqudgUxS683K0HXMoUKOaJ3Ei4+HYTzB+Iuzv+wi36da?=
 =?us-ascii?Q?K/Ohij+Up3d1+T9IQ6jjZn6mC6nOFwn5/ciSHtD/DB21uzwuc5WM7iWOhF6n?=
 =?us-ascii?Q?CDpdt0wuOriexQEWv1VUy2xiCSgQ8xP8gMOX1zXT/1lkuHTlX1llomwJ6trB?=
 =?us-ascii?Q?S0LK7QYrcs0ErcTpMKv7NTXjXB3ieuzD4n/NW9wKV6CawW5t+Q=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?BTYuAUZSB1d11FKksabwmW2wFYeJaAY5LIRXc/UNkrgCEHmnNtcaYz4iBb+o?=
 =?us-ascii?Q?ZU6hOk5LfdNqC/U9eJy/z8BWMlS+kzPAYNHU6LfEGEpQpdfVGip314SSyWcm?=
 =?us-ascii?Q?ipdaxu0q0VhOqWo8CN7EWBbXoKFCT2y7mbfmKAl0WQu5CG0tz0/HwwtPy80T?=
 =?us-ascii?Q?k9ugxeJvWoGtMxqhU0fjawAD3/3DreH4HWMoJdqpJ0apU6/KfQWzuXN6kXQY?=
 =?us-ascii?Q?ywLXKqkdsuMvB4NBVgqwFn9Aj9l9gggushIW80EdeoxFylhUXEa9s8z1keq8?=
 =?us-ascii?Q?ZvrDmbxdk7j+Lad3dcTo7D8m+cRKipT1Jc5LDf93AtJVE0/jO0LdlVyzB/Dh?=
 =?us-ascii?Q?pIxkRll6UFzkRBxNHwZLi4M3GAgjI1lLXzDgoto3YlllbltYD4cJ3cwM4eAr?=
 =?us-ascii?Q?jz+0gukgASPXZNGxlKHCk7ZXUUQbJSEzHVvsTr9sQBqZGicYBHriecT6ZoYz?=
 =?us-ascii?Q?lr8KXuJtHy2GWN+/Z/IyLBltS1HRBUa2nRu7Zgiubjeeff7V5N3brNahn/pv?=
 =?us-ascii?Q?WOin7yyrekKdtTbm1MxL0i/yL2fpCNtGXtQMQ8dAbESlEClaYSLYHFdVf/+f?=
 =?us-ascii?Q?5FryuI3V7Sz3XXCwZku5HaAXEGEzOaa/hN+kR99WPmgbPAvmFMkQ7HQbjj2J?=
 =?us-ascii?Q?2oUnNfrxOj50RSEnquBKndcoEFl5JVCSw90vO0jAJ9kIsnDu0yvNdyRwKpLe?=
 =?us-ascii?Q?FKj4+jQE872xnBFCrPmH+yYdWZUqoAKc65OScvyrJYZaoQMKQ2LS+HMbqoyJ?=
 =?us-ascii?Q?c1VlET7xPb+z3vLQpaqtOE1PuNfRU5RzeUgvFeSsCRyNj88OFDiFbP3pisLJ?=
 =?us-ascii?Q?vPqb1opDyV/1fKK27cUwzvvHVyu33oRccM7ExbylRlxNhsZ08XPTL7FNyf9W?=
 =?us-ascii?Q?ZdCjr+8CGCFl3vpH1qCCyPOSPPbEEl7m6Nd3tL4H4u5MVZLb9iJ5p5tNhTfz?=
 =?us-ascii?Q?zoHANtk/MM4/B81mN/cx3KV0P66imz/Ca1McWE15Xx5dF6PR5syOGbxvtZtU?=
 =?us-ascii?Q?q++35JG6WphNIQ/nRC+uyRB8i/zMUc2Y6+JiL+lzT4MVPzghSG4ehPQKpUj3?=
 =?us-ascii?Q?/yJWqQZUfhCLcv+++SjO3hUGbtalQk7u7fAoiDhZ4UbIjsYlVCmxWQijdbnj?=
 =?us-ascii?Q?xjEk7ACEwQyxyXRm7I5WZpTwi5kQ1oLp2cfhLomnHViPKXYTPwG92LLe9RIZ?=
 =?us-ascii?Q?WHQRfWEKGq6WTAxzVhgoFV49346ThnCKRn6kT0XxpprOxjWiGhXsz+SdZ+cS?=
 =?us-ascii?Q?XyuG9ZJbTiNrjZj9EE4H4z4s7lxw5lQq4CkQCbmRJM55kdXPZ+QJR71z8/tl?=
 =?us-ascii?Q?tDRoNR7SMAMRLlIeL87HEdjLXU9HQi84vI6uYfE9CJ90wi9BCelquRt3AAcd?=
 =?us-ascii?Q?FyJBKUfyGdVALOlwGWUUVZBPGPByP/Oqy4lKXKtJwJaIqJAjU42pfI5Lkfzq?=
 =?us-ascii?Q?tyu3cSBST20U9xV072knEDE89vg9QGlm3hahoP6wJhQiM5BzO5VbWumaBx5J?=
 =?us-ascii?Q?elfqwO+wvAn0BmLhxBpGaZr5ry7sNkfilmCLtH9m0vgxJu595i8CVNr5lFTg?=
 =?us-ascii?Q?AkWYd374PSW0qMtEwytWwoR1qsOihsihPNDuLiaB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d522d7-77a6-41a5-2585-08dcc2518b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 02:24:26.8967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmsUGjFP2IAzj8U8grMkehgqftxPAtu32QsC0Mi2HrvaBZuZ8M/AW9UpLUEdlqaV61JdSS09lYZ4118Gtvwae5dOwEGZGaZZfuWFdqcaqVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6162
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new registe=
r
> mode driver
>=20
> On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:
>=20
> ...
>=20
> > > > +	/* Check 0x14's SDA and SCL status */
> > > > +	state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > > +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state &
> > > AST2600_I2CC_SCL_LINE_STS)) {
> > > > +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base
> +
> > > AST2600_I2CM_CMD_STS);
> > > > +		r =3D wait_for_completion_timeout(&i2c_bus->cmd_complete,
> > > i2c_bus->adap.timeout);
> > > > +		if (r =3D=3D 0) {
> > > > +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > > > +			ret =3D -ETIMEDOUT;
> > > > +		} else {
> > > > +			if (i2c_bus->cmd_err) {
> > > > +				dev_dbg(i2c_bus->dev, "recovery error\n");
> > > > +				ret =3D -EPROTO;
> > > > +			}
> > > > +		}
> > > > +	}
> > >
> > > ret is set but maybe overridden.
> >
> > If will modify by following.
> > 		if (r =3D=3D 0) {
> > 			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > 			ret =3D -ETIMEDOUT;
> > 		} else if (i2c_bus->cmd_err) {
> > 			dev_dbg(i2c_bus->dev, "recovery error\n");
> > 			ret =3D -EPROTO;
> > 		}
> > If no error keep ret =3D 0;
>=20
> It doesn't change the behaviour. Still ret can be overridden below...

Yes, it is expectable, previous is issue recovery command out then the foll=
owing is double confirm the bus status.
If bus still busy, the function still return recovery fail.

Or should I modify by following?
	/* Check 0x14's SDA and SCL status */
	state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE=
_STS)) {
		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_=
STS);
		r =3D wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.t=
imeout);
		if (r =3D=3D 0) {
			dev_dbg(i2c_bus->dev, "recovery timed out\n");
			ret =3D -ETIMEDOUT;
		} else if (i2c_bus->cmd_err) {
				dev_dbg(i2c_bus->dev, "recovery error\n");
				ret =3D -EPROTO;
		}
		/* check bus status */
		state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
		if (state & AST2600_I2CC_BUS_BUSY_STS) {
			dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
			ret =3D -EPROTO;
		}
	}

>=20
> > > > +	/* Recovery done */
> > >
> > > Even if it fails above?
> >
> > This will keep check the bus status, if bus busy, will give ret =3D
> > -EPROTO;
> >
> > > > +	state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > > +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> > > > +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> > > > +		ret =3D -EPROTO;
>=20
> ...here.
>=20
> > > > +	}
> > > > +
> > > > +	/* restore original master/slave setting */
> > > > +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > > > +	return ret;
>=20
> ...
>=20
>=20
> > > > +		i2c_bus->master_dma_addr =3D
> > > > +			dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf,
> > > > +				       msg->len, DMA_TO_DEVICE);
> > >
> > > > +		if (dma_mapping_error(i2c_bus->dev,
> i2c_bus->master_dma_addr))
> > > {
> > > > +			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf,
> msg,
> > > false);
> > > > +			i2c_bus->master_safe_buf =3D NULL;
> > >
> > > > +			return -ENOMEM;
> > >
> > > Why is the dma_mapping_error() returned error code shadowed?
> >
> > Sorry, please point me why you are think it is shadowed?
> > As I know dma_mapping_error() will return 0 or -ENOMEM. So I check if i=
t
> is !=3D0.
> > Than return -ENOMEM.
>=20
> First of all, it is a bad style to rely on the implementation details whe=
re it's not
> crucial. Second, today it may return only ENOMEM, tomorrow it can return =
a
> different code or codes. And in general, one should not shadow an error c=
ode
> without justification.
>=20
Understood, The following is better, am I right? (if yest, those will updat=
e in driver)
		Int ret;
		.....
		ret =3D dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr)
		if (ret) {
			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg, false);
			i2c_bus->master_safe_buf =3D NULL;
			return ret;
		}

> > > > +		}
>=20
> ...
>=20
> > > > +MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);
> > >
> > > Why do you need this table before _probe()? Isn't the only user is be=
low?
> >
> > It is for next generation table list. Do you suggest remove it?
>=20
> My question was regarding to the location of this table in the code, that=
's it, no
> other implications.
>=20
I will move before platform_driver ast2600_i2c_bus_driver, like following.

static const struct of_device_id ast2600_i2c_bus_of_table[] =3D {
	{
		.compatible =3D "aspeed,ast2600-i2cv2",
	},
	{}
};
MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);

static struct platform_driver ast2600_i2c_bus_driver =3D {
.......
}

> ...
>=20
> > > > +	if (i2c_bus->mode =3D=3D BUFF_MODE) {
> > > > +		i2c_bus->buf_base =3D
> > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > +			i2c_bus->buf_size =3D resource_size(res) / 2;
> > > > +		else
> > > > +			i2c_bus->mode =3D BYTE_MODE;
> > >
> > > What's wrong with positive conditional? And is it even possible to
> > > have NULL here?
> > >
> > Yes, if dtsi fill not following yaml example have reg 1, that will fail=
ure at buffer
> mode.
> > And I can swith to byte mode.
> >
> > reg =3D <0x80 0x80>, <0xc00 0x20>;
>=20
> I was asking about if (!IS_ERR_OR_NULL(...)) line:
> 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
I will update to following.
		if (IS_ERR(i2c_bus->buf_base))
			i2c_bus->mode =3D BYTE_MODE;
		else
			i2c_bus->buf_size =3D resource_size(res) / 2;
		=09
> 2) Why _NULL?
	If dtsi file is claim only 1 reg offset. reg =3D <0x80 0x80>; that will go=
to byte mode.
	reg =3D <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
	due to 2nd is buffer register offset.
>=20
> > > > +	}
>=20
> ...
>=20
> > > > +	strscpy(i2c_bus->adap.name, pdev->name,
> > > > +sizeof(i2c_bus->adap.name));
> > >
> > > Use 2-argument strscpy().
> > Do you mean strscpy(i2c_bus->adap.name, pdev->name); is acceptable?
>=20
> Yes. And not only acceptable but robust for the copying to the [string] a=
rrays.
Got it.
>=20
> ...
>=20
> > > > +	i2c_bus->alert_enable =3D device_property_read_bool(dev,
> "smbus-alert");
> > > > +	if (i2c_bus->alert_enable) {
> > > > +		i2c_bus->ara =3D i2c_new_smbus_alert_device(&i2c_bus->adap,
> > > &i2c_bus->alert_data);
> > > > +		if (!i2c_bus->ara)
> > > > +			dev_warn(dev, "Failed to register ARA client\n");
> > > > +
> > > > +		writel(AST2600_I2CM_PKT_DONE |
> AST2600_I2CM_BUS_RECOVER
> > > | AST2600_I2CM_SMBUS_ALT,
> > > > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > > > +	} else {
> > > > +		i2c_bus->alert_enable =3D false;
> > > > +		/* Set interrupt generation of I2C master controller */
> > > > +		writel(AST2600_I2CM_PKT_DONE |
> AST2600_I2CM_BUS_RECOVER,
> > > > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > > > +	}
> > >
> > > I2C core calls i2c_setup_smbus_alert() when registering the adapter.
> > > Why do you need to have something special here?
> > The ast2600 i2c support smbus alert, and according my reference.
> > If enable alert, that will need i2c_new_smbus_alert_device for alert ha=
ndler.
> > When interrupt coming driver can use this hander to up use
> > i2c_handle_smbus_alert And update layer will handle alert.
> > Does I mis-understand. If yes, I will remove this in next.
>=20
> Have you seen i2c_new_smbus_alert_device() ?
No, I think I will remove it, when if it is more clear. Thanks a lot.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

