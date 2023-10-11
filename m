Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 514727C4C0A
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 09:37:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=rHyGfSLA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S54Nb1x2pz3cB0
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 18:37:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::729; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20729.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S54Mc52nmz2ytj;
	Wed, 11 Oct 2023 18:36:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZz78PHD9SsAwqdsLqDRe5bfGYRXVJww+Ttm9b71gdcfWvMmHQ2LmhPYFX20iKiSy+mBoGYUJxi45JPo76yOT7nZjid6hIw17DwdfhMUE+70BENRl6QStTHsdq0ThwHdk347ggAFjV6nfneJ6Elf4tEdl2mn7URu0Ob7D9YgySam9grYxxcbSwgy6atBlLo05tnxYxJZbbFYn8of9PDmwRIZapawR2ztasDKN4S3wnVvhYzajGfl0ySl5QiGc7aRwT1Xt4w4jOOeBfXhBN+6t9EN1AF3zDQ9cUCO4cOEH6K5+ggH1lQE9lZCiulx/+gd6Wwcg7f0QX5+Eu1po68FtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBhaYrwgUiz9ruaKQ/59XZHTozybsWlhlMJA67qc1LE=;
 b=Baq7SO2OINdKUujFFsjUgIn6o5GLt64SmgHbZiKcZRSaPFAIVTkBKIKJcqKlFbw4J4CCtQbIpry6NAE48Pdve6fM8t5oMF1MrHLh+9PPKrmyUxMBBNGqwIlPzyMvPMulvsU52hahjHB6BdZzqy44zYk2Sj8P782oowAapnBfQRjWzYJvTNnJUJT/SlIEMKZJmSHOXgHVO1i4H8Wm4TvjIKhN2wkbx09dtkOHSR7bsNs6/kh+IrBoBZjY6iljMSrL3G9fyqZpoCnGupBQwtDGyOuN74uWX1iXlYyQnU2Jd2ap6OqCfVTD3q3yYy1tnDydxuQ01kFHU1o2KGuIjVw0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBhaYrwgUiz9ruaKQ/59XZHTozybsWlhlMJA67qc1LE=;
 b=rHyGfSLAup7Evogj9FiybzonvwvJND8EcePSetQkSaWRmupxh1csdt9kgjwE9UJ0WoXXiHs4RuIu+Vf/VXWFkS79gDshqNz33BUAWkJDrkYuoQjFGUKkI6IkhzjOuSn16hkY/dSlOVR2GXIcBcOXA6XqJtnDNSzsqlk/bVQE1KuXYOc8iwEvotm93Vmpk+f5u7HAZgsdG4NVqenH2iC2JyrFcH97avhLriKc4Os3KY2pmv9x0kvDlv5LpHzlcfC4MSDl4+KbvbzNjSudIKVnIO3+/+zXSNVlG491v76kuT68k7ALMWhu0L5AOD3vOE7BT8FbwlOvsZd3fxhqeryHJw==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5258.apcprd06.prod.outlook.com (2603:1096:400:205::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 07:36:06 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::bbd0:e194:c82c:c8c1]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::bbd0:e194:c82c:c8c1%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 07:36:06 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Topic: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index:  AQHZtics0zDPons9tEqiPxizT4zKAq+49YuAgFMh/9CAAFvWgIAuwPEAgABlRACACSMw4A==
Date: Wed, 11 Oct 2023 07:36:06 +0000
Message-ID:  <SEZPR06MB5269464A3982E550D6DB8810F2CCA@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
 <SEZPR06MB5269831E049E2267661F181FF2E8A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <ZPcXJ4adUNMv4LDr@smile.fi.intel.com>
 <SEZPR06MB52699EC5463397F4BFF244DBF2CAA@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <ZR6kYMOB67+WJonG@smile.fi.intel.com>
In-Reply-To: <ZR6kYMOB67+WJonG@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TY0PR06MB5258:EE_
x-ms-office365-filtering-correlation-id: cfeb25d8-2b7e-47e4-f466-08dbca2cbac8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  792D6wBCuT6PMspppCOpE8h4YXY+EVSLGFwjonXFbAssp19ADB805a1PreaqfGYHr3sHgH6d+wciciOe+MIcI15zsqtNgid1yy5y7rvXfWFSgPj9n0XI3puD70Qp/1iCO7Ydf6oHUAaecNoeHIgvXpDKbKVNLmc6x9oGC0LFSmrLHuQ6dGnXYV8WIdMldBM/ft+TtSKSR6stdj4TG2H8V3AU8Mfn/JYNQJ0n0YbaNgq2gsEbaD9kx06NzGLeGDnUGeHGGm+7fEdySMiPp8MPBjfPDgdiOjHYne26q62k5f+0stXcCROBSEn7uoGjnnitucldD0Etx3wbJGYGhgfTmeRBHLSmHz9dC2HMT90m4TfVh1nX1BJeX1MjO+nBv1Tfq7Nc/L4hKGOPoZFT0kPJFpMa1IRWeHc6Jr8PjL7ou1M3Sx5s+a5F34MytgZQGywF0B8Lqjm5dkfjOv3QhGKFLuoTsbF9pWzYrWZgfnUfKY3UUALs8uJxgdeG2RXkYO8mDD/jRMzixni4gNX+yB2btuyXCLguKVcYvsuvezRZY3lXWY6nDmmekb28F3zNG3qPfBPCntU7B1J8yBThVm4sOKI2kjKL+IFyCRbgbdn6ad5vGxOYDQZrz/UbOzaxLBjM
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(346002)(376002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(9686003)(26005)(71200400001)(6506007)(2906002)(8676002)(54906003)(478600001)(4326008)(64756008)(66476007)(7416002)(7696005)(66946007)(83380400001)(76116006)(52536014)(8936002)(66556008)(66446008)(5660300002)(6916009)(316002)(33656002)(55016003)(38070700005)(86362001)(122000001)(38100700002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?JAWkcc16JJlPuhzclv9isbQZ/lkFtXipbb7iDX8TT5wDGq+RhVgfxSAaQtmV?=
 =?us-ascii?Q?CMwyg0XqUqFnCXeDyJIAXSpo203/T6yAajkQwMBl/qILp8anD+OxKqKvGZxT?=
 =?us-ascii?Q?6TcvCDMxN+/pMPScymmHmVsebr/0NkMZHFmHSF7x5NJscNGF8nc1sqtzEebn?=
 =?us-ascii?Q?ucIrmtwA+PsqhnOMzI03imIiMfwQb4YC5wiN5z34Rb7JhAiokzcpFtVxui5F?=
 =?us-ascii?Q?oaZhJHjA8KfI7cv95TeldkmAFWEYYrQMET9mU8hZlJ+fG9r/s+k5wGYEpqL5?=
 =?us-ascii?Q?nGWmWUxjH2tNVxt62eyHOwc7kvkWG8w8EaDrfuY9jHQiqCdFOnUMueXEbLll?=
 =?us-ascii?Q?WkjWs1r+NMIfi2IUrTY6BLKJSqeOH5jawCHz0q+b/wOfp9FT2lpkGIqcFdCu?=
 =?us-ascii?Q?m08vvYYRq3EHMWc3nzzHq6/jNC6RyCeRDJhcqwlCDRPxVAkuMh96S5K4DKVL?=
 =?us-ascii?Q?lzIrX/RngZbmRVpukZ62vZB6ahqexRAtADVlp9vXO3HV36CbIiF+KYuJbeqF?=
 =?us-ascii?Q?JIHT5LDfeviHfAIS/tCiBN1GlKufwjpQxawXKV+aVp42rJLYEp2S00WE1UXF?=
 =?us-ascii?Q?Qu2gRDuPSzJ3pRBcx69cfxUOZeSjJxtG6Dz7dmP+O82AavgSBNNtGXbiGBrj?=
 =?us-ascii?Q?Iwa4yBA9fGrbPGuv8JriKrxg8buHRuNM0mCndILP+nw4IbFjS9WFmNLNxeAO?=
 =?us-ascii?Q?FrmPnIZG1H8BR75td0BDuVVzPhVtD2mm2n/lcrRGKMe0KYNg59y6Uqa+R32H?=
 =?us-ascii?Q?Sj2fO7WmyREWbhzBEa8bySfMTVKgDRVnrNOwm5pIefFij23+583cfdv0EA4O?=
 =?us-ascii?Q?5Y1ZrxV1j0N/Z2MTgnf+DlpfjWAgUU+PcrEtI/GsHaBBAmttz1w0rHuJpE6W?=
 =?us-ascii?Q?Q7Jgg+dkUOuh2WnjmjRTuFlqRvFna5i4j8aRG9ZUT5BT8GSlDxWskitqPRsn?=
 =?us-ascii?Q?Btl/SVYEn/FpFghXU6bbMD7IIqvo9yLuL0QIjHr/4j478xl20ZIrUCVJIzKl?=
 =?us-ascii?Q?gtBfZkbf9B6aVdaAGImdlZNwtdO3hEU6C+ep8zBiDF3nVlhausuQFpdB6X/a?=
 =?us-ascii?Q?CCD34fJ6NG5b0n19WUwX/A40jQr5NX+2aMFqAWgvOM1Na7Fyorqd1ijbC72x?=
 =?us-ascii?Q?X1YgX/sfbP5lFfO0oqrNDOa5sL4Sgv7sT/+uhwUtiGNThsl0dKzp33cFXAuc?=
 =?us-ascii?Q?oAauldtrbQlZCsA7Zk1jlL5emiZMevOwczSsQeBc5cK7+MLDkYYyt9Nby2vm?=
 =?us-ascii?Q?Of5budGB0ILt1k5vEW1anmhyWTSgGUCha9Oo66kW1uoBrFVqAeftW5/YuVCr?=
 =?us-ascii?Q?of21lw/CzwZqOo287q7EML7DILWZzuWcL9ZJt/9HIrKObGYVK1BlKLew/AO5?=
 =?us-ascii?Q?a8rMX2enMouMLYz4bSoa/DayCjIqV08dUqz5LGpwwR2xbxVSopZQlxUYkNdU?=
 =?us-ascii?Q?bR0dFMGERRVyF34Z/tco4OqHXCf3xFi1xdehDaIATvAqfgiyIruRJLDwjU7F?=
 =?us-ascii?Q?xOl7vvMGmLbvl71Km3T9WV2pzArpHwDcHc54yQsTUomfZk116jbo7h0phNt7?=
 =?us-ascii?Q?FSH6s1FMZyPwrsAwu27ur58j4j6qqtrsAuUXrK/t?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfeb25d8-2b7e-47e4-f466-08dbca2cbac8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 07:36:06.3585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDDj5MEg8PESVrjVZovoGNrA8VHbPpr+mjGzqj3dq+yN8ciuR6QfcVxx63ta6KIW73vLWeY7gsGrHrZkSA4iFvb+uWhL3+6TKDll+lQNxJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5258
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

> On Thu, Oct 05, 2023 at 06:21:35AM +0000, Ryan Chen wrote:
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Sent: Tuesday, September 5, 2023 7:55 PM On Tue, Sep 05, 2023 at
> > > 06:52:37AM +0000, Ryan Chen wrote:
> > > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > Sent: Friday, July 14, 2023 4:55 PM On Fri, Jul 14, 2023 at
> > > > > 03:45:22PM +0800, Ryan Chen wrote:
>=20
> ...
>=20
> > > > 			divisor =3D DIV_ROUND_UP(base_clk[3],
> > > i2c_bus->timing_info.bus_freq_hz);
> > > > 			for_each_set_bit(divisor, &divisor, 32) {
> > >
> > > This is wrong.
> > >
> > > > 				if ((divisor + 1) <=3D 32)
> > > > 					break;
> > >
> > > > 				divisor >>=3D 1;
> > >
> > > And this.
> > >
> > > > 				baseclk_idx++;
> > >
> > > > 			}
> > >
> > > for_each_set_bit() should use two different variables.
> >
> > Will update by following.
> >
> > for_each_set_bit(bit, &divisor, 32) {
> >     divisor >>=3D 1;
> >     baseclk_idx++;
> > }
>=20
> It's unclear what you are trying to achieve here as the code is not equiv=
alent to
> the above.
>=20
> > > > 		} else {
> > > > 			baseclk_idx =3D i + 1;
> > > > 			divisor =3D DIV_ROUND_UP(base_clk[i],
> > > i2c_bus->timing_info.bus_freq_hz);
> > > > 		}
> > > > 	}
>=20
Hello Andy,=20
	I modify it to be simple way by following.
	Because baseclk_idx will be set to register [I2CD04[3:0]] that is indicate=
 the 0~15 different base clk selection.
	So I initial the base_clk[15] array and assign initial clk value, and then=
 find which clk idx will be right SCL clk selection.

	000: pclk
	001: base_clk1
	002: base_clk2
	003: base_clk3
	004: base_clk4
	005: base_clk4/2
	006: base_clk4/4=20
	006: base_clk4/8
	.....

static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
{
	unsigned long base_clk[15];
	int baseclk_idx;
	u32 clk_div_reg;
	u32 scl_low;
	u32 scl_high;
	int divisor =3D 0;
	u32 data;
	int i;

	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, &clk_div_reg)=
;
	base_clk[0] =3D i2c_bus->apb_clk;
	for (i =3D 1; i < 5; i++) {
		base_clk[i] =3D (i2c_bus->apb_clk * 2) /
			(((clk_div_reg >> (i * 8)) & GENMASK(7, 0)) + 2);
	}
	for (i =3D 5; i < 16; i++) {
		base_clk[i] =3D base_clk[4] / (1 << (i - 5));
	}

	for (i =3D 0; i < 16; i++) {
		if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <=3D 32)
			break;
	}
	baseclk_idx =3D i;
	baseclk_idx =3D min(baseclk_idx, 15);
	divisor =3D min(divisor, 32);
	scl_low =3D min(divisor * 9 / 16 - 1, 15);
	scl_high =3D (divisor - scl_low - 2) & GENMASK(3, 0);
	data =3D (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | baseclk_i=
dx;
	if (i2c_bus->timeout) {
		data |=3D AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
		data |=3D AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
	}

	return data;
}
> ...
>=20
> > > > 	divisor =3D min_t(unsigned long, divisor, 32);
> > >
> > > Can't you use min()? min_t is a beast with some subtle corner cases.
> > >
> > Will update to
> > divisor =3D min(divisor, (unsigned long)32);
>=20
> No, the idea behind min() is that _both_ arguments are of the same type, =
the
> proposed above is wrong.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

