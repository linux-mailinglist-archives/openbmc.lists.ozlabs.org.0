Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B57C4CF0
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 10:18:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=WywW4NzJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S55JX5HM8z3cPm
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 19:18:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=WywW4NzJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::720; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20720.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S55Ht2rlhz30MQ;
	Wed, 11 Oct 2023 19:18:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhuJ+ZJpM6fXhKeMshVVaRMRcgiSzXsMogMNFzrtoR7BWuTjmjEnoCh7VInIaSeqSnR/NNUPo6pYvgZgrwDBGJ3zwK+pXE/JfySk2ygLgv1/DuS8fom7PgWmAJrej3S6O46RB8ZQhHFuvjQVynKzuH/M50Yf40UYP5t81uacb7jq/1YLfHJs89fZId2zkpwiVxFfDmixUg9Vt4kW0Wm7asJ2aZ1fdgHKpMinNfpEzNDyrcCBV5yyxYAPDxM1k5NQ2y7hcZHZpkOgcqklgjk8LhJ4qa4uJWJ3zwyO+f6uTjXC4y29zbRTS6nNvY0ttpXrIjaUSKdfiO8iHl5gNEiKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcUBRjz74aWTflXpoVMMqpTThjli/6f3uGh1LWYwSTo=;
 b=Ohx2B8C6s3goehDRWsWWsQfgpqmS+vK4V8Kg6mykZt9hkIGd2LbVPk6pW0qv2VAqtzvRGh5hVOiaFoIcyWRg4YdViHvJO4y/IwpFq2AZYKaEu+mIaUHMC6nc7Om25XkvRjIYmKZGjarM8whNsSk5u/6pTV3PJQ8KfpbHI9+/rz7qCqo9KZ8kT30ej4oMewH42DiqcgKJzkhiVft8HtUFpDqNnL/3b43O6Isz3DKqj5HbD97SfEpY4lHKsq9xLAP+ElcjyrUBakJV+J4k6GMqVswA042DdLtgc5iwxqa5aQMiufshj0ra7R3p/FKVnClekt4s+n5hSudm7qJkBZmV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcUBRjz74aWTflXpoVMMqpTThjli/6f3uGh1LWYwSTo=;
 b=WywW4NzJJe3eFhysfG4Pk2CbFCNYlSGltJ+rD3GKPC8/bYf9Njlu/9PMynLk+IZ9bN/L1xpNxniK5QuA24lgNyQLXTXMG3ZaowgkRCV/39GPBgmeMcfIAQBVH8wkbF3sD13PURIhAtboVjOg222R8k73Qg0Nm4UgtE0QNeF60uOv0XZ38D32/L4ZdfnYVfIbSmF2RLreBpml7SWNNjyQ+N2l9RujtnSxkveLAdWlYw7wCy876FPOxbjQDpQ+z2lv/GHpplIHqVTiCB3IKyWc6qufzvuSJO6RBanffFsaFLQu9T1bZPEiIkACrz4LxPz4lTPFK8KiCu1B5RvKsQ+6Qw==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by JH0PR06MB6440.apcprd06.prod.outlook.com (2603:1096:990:3f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 08:17:57 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::bbd0:e194:c82c:c8c1]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::bbd0:e194:c82c:c8c1%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 08:17:56 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Topic: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index:  AQHZtics0zDPons9tEqiPxizT4zKAq+49YuAgFMh/9CAAFvWgIAuwPEAgABlRACACSMw4IAADX3w
Date: Wed, 11 Oct 2023 08:17:56 +0000
Message-ID:  <SEZPR06MB5269B5372D1FBAC2D4119982F2CCA@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
 <SEZPR06MB5269831E049E2267661F181FF2E8A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <ZPcXJ4adUNMv4LDr@smile.fi.intel.com>
 <SEZPR06MB52699EC5463397F4BFF244DBF2CAA@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <ZR6kYMOB67+WJonG@smile.fi.intel.com>
 <SEZPR06MB5269464A3982E550D6DB8810F2CCA@SEZPR06MB5269.apcprd06.prod.outlook.com>
In-Reply-To:  <SEZPR06MB5269464A3982E550D6DB8810F2CCA@SEZPR06MB5269.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|JH0PR06MB6440:EE_
x-ms-office365-filtering-correlation-id: 9511f731-3b87-4fd6-7c63-08dbca3292ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  k6LEUdWMGPJEfoobXCvp4NQLb3JR8rCCUrXwy0Gg2z+7/iRFPqRy8XvQd5NQSPUtDPnH6QTI1NTagNr5wI63z2GvP8L9KCFveS71YI6oLXkUlwk2CdT0G6ViN6QC2YihulNHC2jYRgwxzN5mR4QexV2I9wVxbXg60i5wg1OhzuS99zRDRQGaYsdegrGWKYtPEOlNVpPV+gkD7ezjXOaJaajBYI8V1vGApQCRL99vMcJgJhyPiYv045DcvG4IyU4iICeBQUSp4SQm8IaSAKq09y/FGugfMh4BtBatU2gKeTXKINf1wT1Lq1nuX5Qj6Yz915DNHDljhY4uUsl9LZuxQ+IrEUcGZ50mQh0z7tkeTbPDC446ANrrW6gEDOn5CXpjKiICW6UGXsZFvP1ZgaKD/4NJUtp2DNcRN/6rE1l08slgp/F4nKeP+mHyakKSoFZstRzdu9pRA6aPvTFtoAfkwGIYoYW7d+FzPJZq5xldUIK2C+sF/MKZuk8iMEl4vTgLA57RrP6VUCRDc+WRRQkCZq628BJd+hIWADMFLjg3Ha70USjGRnk+B2kZ+Uv/bmSE8C/3S3q5HkxbeExWFpcsLA0p10eGSEPZwErYrr+8wnPXr6a1nRKQl+nOlMMp0z8Y
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39850400004)(396003)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(55016003)(9686003)(26005)(122000001)(83380400001)(38100700002)(4326008)(8936002)(8676002)(52536014)(66946007)(66476007)(2940100002)(76116006)(64756008)(66556008)(2906002)(7416002)(5660300002)(41300700001)(478600001)(7696005)(6506007)(110136005)(71200400001)(316002)(66446008)(54906003)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?tSUdW0WN4gHMoaul7rZVJ9me7iOTH8+8YZ9xq2FKfa+HxYkx2Zit5oWH3F7M?=
 =?us-ascii?Q?vfvNs5lx5EQ0p+JngWSBD9l77IWH0dEbVDhkS6AM95Zg0DFd7yGoUTLJjmhZ?=
 =?us-ascii?Q?yoCrseih+tBz9CF9JGxkqAqH2FOndP2wjTN5r8KeUH2IaqFaO6dmyhw4/vve?=
 =?us-ascii?Q?sy57pJF5xNg+4HkSzykz7K3xERss1nG9syhVpEEmicTY7mTkxknJSB5osTzO?=
 =?us-ascii?Q?uLwasJxh+viCOy3P/BM3NxFYJJJiM1GeEEmbxT39fyvHQrrSfNynZyAblc3B?=
 =?us-ascii?Q?f9sFmKnw5HM+NZlFRqbVz0UGH8JkwDg2GRM9yO0DpVrTBt/wshLPtqpiMfKW?=
 =?us-ascii?Q?CqK7xDQUenU4pvq3Hnn6liDul5cYFUzzNE5NCa86EdMVsER3CaQFxVtxI2te?=
 =?us-ascii?Q?rw02y5IcGoZNdK3M22bpljs8w5fHfySzNx/iE0WuKst+Z5yo3/+oIyeUdZ+a?=
 =?us-ascii?Q?oaU0P+HGXDd5qXRZkTa/EdcR/bYNTFS1qbGRY4CeuQeXb18PPwZdwQLfL8W4?=
 =?us-ascii?Q?Ps2z7kJU4cEyJf+U4l01SjCzKOTLpjTpcHUaDAht5Xxa4HVG03q6/X7uyAS1?=
 =?us-ascii?Q?yCiWOpQwCbAySd+5jtGfrthnsbr/v9t7g7qbBFDCBOZDVPEphoUtkiseRqq6?=
 =?us-ascii?Q?L00muTtTHy/kFcLLP4iVHjqVzWDzu5BAZCKhhRTafJmqsQqY9SAg/gL3xURK?=
 =?us-ascii?Q?pclT8xsEqO+5E5iht8WfKx9M8pzPqZPlrP6ApI3WvUo4mez9ZB9JJTJuTSK4?=
 =?us-ascii?Q?tHwyHRi82a8SmYUb55prKWP1Ftgl0fwkgEtdX1KBFkDtngTab4hkpyH7kqXN?=
 =?us-ascii?Q?hIYAlgVtf8KKOVMCpYARW3VERm+w8gI1tlf031b+PqJm/e/Lz1xidKtyq950?=
 =?us-ascii?Q?JYiPeqYcaxFt5MTjOvKCpP1OhCEoR9fx+aJ1NPrGUGPwRJouAnCaUEUlx4vR?=
 =?us-ascii?Q?cmf7OZUv6HOzjIf/SFqPVNhWeuoCNysADJPWuJgjr6cIFUV5i0drDlAI+MdF?=
 =?us-ascii?Q?XbjoTwFCgryKCh5JxnnjHy5KgE5k5ipVcaTEOq8kzidHtC5Fer9GKdk4+Ghv?=
 =?us-ascii?Q?5C9OaxmmYM2jHnbemcXGH1s9s1xS4IYeA6HyOuQStP6wgH/uGYLKyDmZ66u7?=
 =?us-ascii?Q?nGxrQzvDuVG+YcrbP0xkIollUVvToFTl60D0YaVTDjS/WYXKECPFJg6N2xgV?=
 =?us-ascii?Q?h8YM0WUqaJBCZNpUqTKMt9L2Qu48dKXruhp7mfBBayA4wU2lxqPgfitFnjpR?=
 =?us-ascii?Q?NeFiFNO+/a0bEyzzzDJj8ixawwoqb6ZVpGgzEkvxDVkuU93tYnAyrNZ++IU7?=
 =?us-ascii?Q?GTuFD8rZh/Ls2G19dC9m3uqxVaztvQvi1To1mKWEaK95mTf5n5IvGFPcZqtw?=
 =?us-ascii?Q?0OhaKYBXg08mPKg9SrtuznCF0M5a0UODyTMCuPuRR5m6ceh3tzRSaUs+IGij?=
 =?us-ascii?Q?W3dOV+Ikdvl7SBJEy0mflCxO1Jkqv0bRohSmT60+MbmHtNweghknqDbnH6Au?=
 =?us-ascii?Q?/vjtuwOBxdc54HWvzEKhl+PC+/duWDj/iLaF4Q3S7uFJj8+XFhSVbaEkxn1x?=
 =?us-ascii?Q?2/toZ7ey4QFeZPNPRaVvjR9ezZ7E8UjK0g9p36hh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9511f731-3b87-4fd6-7c63-08dbca3292ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 08:17:56.6065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uraNla6e/Hb7neIQ6yJXLmPu7XVEMw/h/uCp+d0w4CnECaG+NxH72KgjJQcgXwKkry4H5mNiRx7f750C+JkL48O/hYNWRI0uZm9rVLwXIak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6440
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>, Florian Fainelli <f.fainelli@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Tyrone Ting <kfting@nuvoton.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Jean Delvare <jdelvare@suse.de>, William Zhang <william.zhang@broadcom.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>=20
> > On Thu, Oct 05, 2023 at 06:21:35AM +0000, Ryan Chen wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: Tuesday, September 5, 2023 7:55 PM On Tue, Sep 05, 2023 at
> > > > 06:52:37AM +0000, Ryan Chen wrote:
> > > > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > Sent: Friday, July 14, 2023 4:55 PM On Fri, Jul 14, 2023 at
> > > > > > 03:45:22PM +0800, Ryan Chen wrote:
> >
> > ...
> >
> > > > > 			divisor =3D DIV_ROUND_UP(base_clk[3],
> > > > i2c_bus->timing_info.bus_freq_hz);
> > > > > 			for_each_set_bit(divisor, &divisor, 32) {
> > > >
> > > > This is wrong.
> > > >
> > > > > 				if ((divisor + 1) <=3D 32)
> > > > > 					break;
> > > >
> > > > > 				divisor >>=3D 1;
> > > >
> > > > And this.
> > > >
> > > > > 				baseclk_idx++;
> > > >
> > > > > 			}
> > > >
> > > > for_each_set_bit() should use two different variables.
> > >
> > > Will update by following.
> > >
> > > for_each_set_bit(bit, &divisor, 32) {
> > >     divisor >>=3D 1;
> > >     baseclk_idx++;
> > > }
> >
> > It's unclear what you are trying to achieve here as the code is not
> > equivalent to the above.
> >
> > > > > 		} else {
> > > > > 			baseclk_idx =3D i + 1;
> > > > > 			divisor =3D DIV_ROUND_UP(base_clk[i],
> > > > i2c_bus->timing_info.bus_freq_hz);
> > > > > 		}
> > > > > 	}
> >
> Hello Andy,
> 	I modify it to be simple way by following.
> 	Because baseclk_idx will be set to register [I2CD04[3:0]] that is indica=
te
> the 0~15 different base clk selection.
> 	So I initial the base_clk[15] array and assign initial clk value, and th=
en find
> which clk idx will be right SCL clk selection.
>=20
> 	000: pclk
> 	001: base_clk1
> 	002: base_clk2
> 	003: base_clk3
> 	004: base_clk4
> 	005: base_clk4/2
> 	006: base_clk4/4
> 	006: base_clk4/8
> 	.....
>=20

Sorry updated.

> static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus) {
> 	unsigned long base_clk[15];
	unsigned long base_clk[16];

> 	int baseclk_idx;
> 	u32 clk_div_reg;
> 	u32 scl_low;
> 	u32 scl_high;
> 	int divisor =3D 0;
> 	u32 data;
> 	int i;
>=20
> 	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL,
> &clk_div_reg);
> 	base_clk[0] =3D i2c_bus->apb_clk;
> 	for (i =3D 1; i < 5; i++) {
> 		base_clk[i] =3D (i2c_bus->apb_clk * 2) /
> 			(((clk_div_reg >> (i * 8)) & GENMASK(7, 0)) + 2);
> 	}
> 	for (i =3D 5; i < 16; i++) {
> 		base_clk[i] =3D base_clk[4] / (1 << (i - 5));
> 	}
>=20
> 	for (i =3D 0; i < 16; i++) {
> 		if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <=3D 32)
		{
			baseclk_idx =3D i;
			divisor =3D DIV_ROUND_UP(i2c_bus->apb_clk, i2c_bus->timing_info.bus_freq=
_hz);
		}
> 			break;
> 	}
> 	baseclk_idx =3D i;
> 	baseclk_idx =3D min(baseclk_idx, 15);
> 	divisor =3D min(divisor, 32);
> 	scl_low =3D min(divisor * 9 / 16 - 1, 15);
> 	scl_high =3D (divisor - scl_low - 2) & GENMASK(3, 0);
> 	data =3D (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | baseclk=
_idx;
> 	if (i2c_bus->timeout) {
> 		data |=3D AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
> 		data |=3D AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
> 	}
>=20
> 	return data;
> }
> > ...
> >
> > > > > 	divisor =3D min_t(unsigned long, divisor, 32);
> > > >
> > > > Can't you use min()? min_t is a beast with some subtle corner cases=
.
> > > >
> > > Will update to
> > > divisor =3D min(divisor, (unsigned long)32);
> >
> > No, the idea behind min() is that _both_ arguments are of the same
> > type, the proposed above is wrong.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >

