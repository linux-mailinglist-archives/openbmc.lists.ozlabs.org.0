Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E16099594EB
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2024 08:43:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpcHB63rdz3024
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2024 16:43:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:feab::715" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::715; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20715.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpcGy6JCxz2xZq;
	Wed, 21 Aug 2024 16:43:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foCj/OZwUYWwXROG9aNfrMCn6+U9s2yG1UhYynEatRd6t8ioG4TDayFa8mJAH0Dhb9TZKRI22oNvZdGiSKoquxjHcODWDhqp4cvkbYGvQdDJd0J8Nc3qYvT8URVvDBCcpV/17sYJbQVlz5RaMWBcDDsEF+GD/Oz6bOmgMIzrDZy/SHYJf5+V4qwaDydyAmNP91NMmPYTtFsfowAgQxhfxFXZYKLP/hwjcXEuD8q2YC1838yHGUx+rD3UPantauDtcZbkysJDYGdN9p8/Cx+SDFCpb7EZjBwcQS7jTDKKs46I/f5WmSMX4us/lAwEHSOPYOeRtf2QShR+PXmNwwb4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SPQ+3n18x7So4leCZ6YRnLDfjAm4p/Z9L0+cp9tJCs=;
 b=TiRWUuuIX0kmkrU/uEnAoeZ+3TL4bdIzKH0+J6sLBGgraWWAEou6HfUwoT6gbyiRCSEc9FdarGwjTFam7abgQkg500+PObzA73bro5ShEmwtuIGImpuVqVj7L372ff7HRRpNCQq2oxME/pQsLuolvN79PzPv50RZkKAyR62Woi212Kc0MsZJH/TfghKCjzRkl9V3lKMiy8CBXPOQLf7I+NvLL7PS/NYnSDVk+xWSChuL2OgM2/BsVqU9nL4cy27g4I8LcZwN4FlbqIfP3Zuu2aD8WLSBAYps8zam7pvbxtcyQ2ONVhzKA8lbixc2Xa++348cWgH8UJ7TEsnp3h55Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SPQ+3n18x7So4leCZ6YRnLDfjAm4p/Z9L0+cp9tJCs=;
 b=SjSD0rs3nOH7WpxwxCdKIWIvCcC91tbhL2QtOWnvAV5RDkXeNA2nloo7/f7m5hod55yYLdltuwq79dnSTWjXhC+z7SCSKLwb+Zei5m41Ml1mdWcegRIiFU1tTHzOTp1FnSUMrdmDEt1wxR4+RT+NtQd+/3GwS9HvP+AD85lNeGrboetIyx0tQHytEd0BB2w3Moxvz1W7Ut1Pypj5pl0UAXYbeEyTO+/dPVBg3u3cnoFkfXGyDpbn21xXLdk5pkt6AH29AE/rvUnknWWenWFRkoisKgdN24woTIyaYIu5+JKE0dJNHaqa1Gwg0mj6CUTdEaXydz0SOZ9Y6ONTRUZpXQ==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SI2PR06MB5387.apcprd06.prod.outlook.com (2603:1096:4:1ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 06:43:02 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 06:43:01 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index: AQHa8ho4oLFWUX2yC0qHT9Kfp3UIaLIuoMcAgAJo7hA=
Date: Wed, 21 Aug 2024 06:43:01 +0000
Message-ID:  <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
In-Reply-To: <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SI2PR06MB5387:EE_
x-ms-office365-filtering-correlation-id: f1c0e400-1cbe-4f25-814f-08dcc1ac8089
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?ZMgWviHoI/jRflilPBCj6cxeNv8e3gwZZembe9Vy3OzeEPkiiRwUT8Pbo+y6?=
 =?us-ascii?Q?Z920XZT60p6SazaEHNZL4V2bTjeSfl6o49WaYDUDB/jQiH6CtuzaV4VvNSVg?=
 =?us-ascii?Q?7JaTT2psjCDTOIeFCR9J7dyKAWLkmG9yhJYCuVd8tIobxcievcl6PaLI7cx6?=
 =?us-ascii?Q?Q3KypDdsf8ZPmvkldQHqXfyiKa194cF5L9eB9p129pzR8BPgk2pK6mVoEOzu?=
 =?us-ascii?Q?cOSHg77NjGuiRZEJNlncUcosCem+sr5Ze7Rw2F1zgZK5Ia6geVOnmBn1IbDe?=
 =?us-ascii?Q?fpnFwZlI6fuEPPK8oxXdNZh1SkS/0WSOzVVjAg1wNzc+Yw3JZq9eaSH2zyAX?=
 =?us-ascii?Q?s0ZmeoKOxoax2hEJ/DER1KhmCSXJBn3r6oWhBKuzjDAtgnGH1qwSNuPlo+gU?=
 =?us-ascii?Q?GQCeZ/QZgc8LzDF4AHeqBKBCuwn1I4AGcdayp6F1aRHq2TMhACna4fXVRUbk?=
 =?us-ascii?Q?aY5pZVskW04f7Gkces+WVxuhNGwDU46GA5crcBREn++dO39tzaXbBaRyawFX?=
 =?us-ascii?Q?/UBi0bxN/YEkDoNMLR8+R70TGyvYj4ypcBwt6eBsST4yaNxenwiwJ9EvZ5nP?=
 =?us-ascii?Q?msSBc/pOfVTGrBPUScNlR/0Ymk71EfEiL1BMQJunF/L6vmI/eynqoyvvYMwo?=
 =?us-ascii?Q?Xd94TTWfunAGqVULyUNeHnViqrpyykEcglni+blJe4L7CB/0iLUCHv1sbqVf?=
 =?us-ascii?Q?zU3RjCwbrpmMy/3ZkkeDrTTInHOuQYr2RpPWEdVtjeBkwbqJq9aJRT9v2HSK?=
 =?us-ascii?Q?oJmG+egoe+3OEPqQBVtU/3u1R5Ru64ZoCljZM7rRsvG0TQvtDxFvZWOJJwPU?=
 =?us-ascii?Q?DOKso+FZbQvfuMIzOdlbkgQFS5C4atDgZopFT9KqW9cg7d6uPBv4ERHJkUKJ?=
 =?us-ascii?Q?spB5Rnb7u0kGVaIbUtxhjfI3b08GAopSIDHwWmAVBMqr1HUE0nR5xHidd8tJ?=
 =?us-ascii?Q?KrpFbNFFdZ4sw4xOfwYEQHJAjeUE7VeAKhNyIpoPp3jN1ax2NhugHGoAM0yA?=
 =?us-ascii?Q?FSU+FWB4aRQEzcKHiiWOPEWRV/Igo3NdUv7xHRZ56BRkG/PizUfMOvC8Ckry?=
 =?us-ascii?Q?GkZz/dTq8TV9kPuzafLTkdieMSav+xdmqXwFNxI/3y/Co47knrB+8S7MurtU?=
 =?us-ascii?Q?xo8EviJH7xxjDTK5XniZzgfu5TbsrKL1hLXo+FV3R/E89sD+Q9tRK3sl+JaH?=
 =?us-ascii?Q?A3amMDHXjjL5AucoJZ7MFIgXfBTdC8RiYdqf52uepl3YETLifIHT41VoGKqp?=
 =?us-ascii?Q?xADYbjjrQNatx8SaJWL0z8oGfALFMPG9lK3Ns0DZgQn52MZ7d64uHpKqTS1/?=
 =?us-ascii?Q?VPEtHfae/oZyLAJzspxwxA4lnZkTOMb8A75KtVdjkZ8WXycu1hfH3H+oYmJ2?=
 =?us-ascii?Q?N5whKxkivHalSRo9aqa7GzuFAeg+hNt3kUJ2tEJyhp6sFg9Kjw=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?rMipE9pxcMTKN7E1KbjHi1eSMl14V7ZHy4RGZyk3Xdfz223ay/gOR3xB3IIF?=
 =?us-ascii?Q?cmnYIOkQdU+5takVY+D75NMoHEjEjvrCQA6JJ+OJ3s+l/LQ+LOMpPRz8IpNQ?=
 =?us-ascii?Q?7W9mlr4rEEEeXpLMqIZcFmQ1LYxW9C/3qIYWD3Tvvxhtxs0wvWbCqPYhefHO?=
 =?us-ascii?Q?bYckr5owI//ayP3WToKOKGMsX7IsY9HaKAh0UjuUV+rtUl1VJPF+FGk2fzN2?=
 =?us-ascii?Q?1pKsuUnYLHyL6EoLNzPCk9SDmvJvJpYoBxIvnafMlgzfgPuXqT5rBAUWdNd8?=
 =?us-ascii?Q?FRT977Z9U8K74IiZH11xd1RtxlmiOEFxVtSqJ5R1LNZLXRQgOCAXD6JVEvPE?=
 =?us-ascii?Q?Pe4xQe5tlpLwpXxdT4j3McXZ4Ubq4Q+oJoWE/5720DIN58RC5gyhFY+HWuQO?=
 =?us-ascii?Q?0Hs2xBWVXAEjo/CTd1WW0AQECXnDvqwf57Rhj7ZE79lott8Y7+DEnpH5i1rl?=
 =?us-ascii?Q?V9rXuOZXGQF9qxe14Gev1jBHO86vLBHERfoW4kQxeJ00MLleAIT4HDSpZQJk?=
 =?us-ascii?Q?K3HLpFdyvctpF44LAihfGvmUjvdykWwEWE8I38EQzAni6nWFvhGXR2Uwkj5F?=
 =?us-ascii?Q?FsBqmIfqDBR/BZUTNxpZUNJnmaRxUoPvzjWWqaZIv4hEyFTvQt9rXsuUaZ01?=
 =?us-ascii?Q?rFyfQxlTkOEngX1mcu8b3WHxdaLOGGIdZekqx3BuKFi1R4g0FL7YJp/2Pdgb?=
 =?us-ascii?Q?OfdzR5UPB4d+ZfhuVP6ENmJYFnSFY0LrULt85KAlVIA2zmmoSfewOkU5JFfO?=
 =?us-ascii?Q?qt7WXV990susGDIeNw7+xO4zcmdJdVuPN5QDrSeJbxh+XjVu2QbMAjh6qelA?=
 =?us-ascii?Q?4qEuBFqrZWWbBz9EqOVdObyn3px5ATGAouVJSG9c/AWuipOhUK/DKS/3S7Ot?=
 =?us-ascii?Q?nVx/IIWmGT0I9atbBWYttnlIMyv4NJtZxoWnzGwyqJJ4nePkFb3yAoqbUM1u?=
 =?us-ascii?Q?7niuNjJ/5oVMq7g4bNAKfTEyiAaVLvYyBZbSsHANFr7Q2OGNYFowSSJqgUoe?=
 =?us-ascii?Q?LfOT3ALFGVYK6B46VrwFM2TVZ48adQiScFJFsX5sca/Gr5Z20nuB4vQoemll?=
 =?us-ascii?Q?4hNo4F/o4jniwuWq2NIOegPLckN9g71sxwc+NkQ/ksMP9+VhIxzG0IXn+k9b?=
 =?us-ascii?Q?TrLT3TPNZcFwjKcH2HhfW4aWkxk9tO3QYuUQiMItcS7Tqh1oVXxDeWJP/mdf?=
 =?us-ascii?Q?y38YpCTovlGi5jI3PeDFMLgvBNj6QQnk6P/M/un9HwjJgxbIi3na7KWKV7qN?=
 =?us-ascii?Q?aU8+DYYeyDg7N7HINFyDyj4Xk8rihgokBBVB8krXsaiIJxQ+qKNwy+xhHVZU?=
 =?us-ascii?Q?idzmXseeB3brD/n5En8IVved0kO/hfcYWisloKEBaWEkMWLoANHrllzdUPFF?=
 =?us-ascii?Q?+SgvYSi4XT4xJksCmeXoiUQ01KFH6wifmAGI0Xp1sJcU6Jo+rmfTknJRxize?=
 =?us-ascii?Q?faD1Sj3Bue1W3zTuCxLjtGZvuKocoLuH9CtXcxS6p/poKM4v5mz5K7fhji4D?=
 =?us-ascii?Q?6mxrUIHSPObyZ0Le4St78TMbJA7an8VdAveHj1gUYVoSfcP4X2XaO/kNDRsG?=
 =?us-ascii?Q?aZGAOyXKe9WQoR4uu87YffYdKXzRaddlzGTDT3P5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c0e400-1cbe-4f25-814f-08dcc1ac8089
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 06:43:01.4374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MaSxIdcgdYqGgkdI5WtMycgZsg1a8tKr+cjAWNBjQIB0CFeaHmovJUPLljialCTSRLNzEKUBGeZDZ/AyQYXElW9TVhBDZ88C/3csp1IH8ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5387
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
> On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:
> > Add i2c new register mode driver to support AST2600 i2c new register
> > mode. AST2600 i2c controller have legacy and new register mode. The
> > new register mode have global register support 4 base clock for scl
> > clock selection, and new clock divider mode. The new register mode
> > have separate register set to control i2c master and slave. This patch
> > is for i2c master mode driver.
>=20
> ...
>=20
> > +struct ast2600_i2c_bus {
>=20
> Have you run `pahole` to be sure the layout is optimal?

It will replace by following.
struct ast2600_i2c_bus {
	struct i2c_adapter	adap;
	struct device		*dev;
	void __iomem		*reg_base;
	struct regmap		*global_regs;
	struct reset_control	*rst;
	struct clk		*clk;
	struct i2c_timings	timing_info;
	struct completion	cmd_complete;
	struct i2c_client	*ara;
	struct i2c_msg		*msgs;
	u8			*master_safe_buf;
	dma_addr_t		master_dma_addr;
	u32			apb_clk;
	u32			timeout;
	int			irq;
	int			cmd_err;
	int			msgs_index;
	int			msgs_count;
	int			master_xfer_cnt;
	size_t			buf_index;
	size_t			buf_size;
	enum xfer_mode		mode;
	bool			alert_enable;
	bool			multi_master;
	/* Buffer mode */
	void __iomem		*buf_base;
	struct i2c_smbus_alert_setup	alert_data;
};

>=20
> > +	struct i2c_adapter		adap;
> > +	struct device			*dev;
> > +	void __iomem			*reg_base;
> > +	struct regmap			*global_regs;
> > +	struct reset_control		*rst;
> > +	int				irq;
> > +	enum xfer_mode			mode;
> > +	struct clk			*clk;
> > +	u32				apb_clk;
> > +	struct i2c_timings		timing_info;
> > +	u32				timeout;
> > +	/* smbus alert */
> > +	bool			alert_enable;
> > +	struct i2c_smbus_alert_setup	alert_data;
> > +	struct i2c_client		*ara;
> > +	/* Multi-master */
> > +	bool				multi_master;
> > +	/* master structure */
> > +	int				cmd_err;
> > +	struct completion		cmd_complete;
> > +	struct i2c_msg			*msgs;
> > +	size_t				buf_index;
> > +	/* cur xfer msgs index*/
> > +	int				msgs_index;
> > +	int				msgs_count;
> > +	u8				*master_safe_buf;
> > +	dma_addr_t			master_dma_addr;
> > +	/*total xfer count */
> > +	int				master_xfer_cnt;
> > +	/* Buffer mode */
> > +	void __iomem			*buf_base;
> > +	size_t				buf_size;
> > +};
>=20
> ...
>=20
> > +static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
> > +{
> > +	unsigned long base_clk[16];
> > +	int baseclk_idx;
> > +	u32 clk_div_reg;
> > +	u32 scl_low;
> > +	u32 scl_high;
> > +	int divisor;
> > +	u32 data;
> > +
> > +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL,
> > +&clk_div_reg);
> > +
> > +	for (int i =3D 0; i < 16; i++) {
>=20
> unsigned int
> ARRAY_SIZE(base_clk) // Will need array_size.h

Will update to for (int i =3D 0; i < ARRAY_SIZE(base_clk); i++)
And add include array_size.h
>=20
>=20
> > +		if (i =3D=3D 0)
> > +			base_clk[i] =3D i2c_bus->apb_clk;
> > +		else if ((i > 0) || (i < 5))
> > +			base_clk[i] =3D (i2c_bus->apb_clk * 2) /
> > +				(((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
> > +		else
> > +			base_clk[i] =3D base_clk[4] / (1 << (i - 5));
>=20
> This is the same as
>=20
> 		if (i =3D=3D 0)
> 			base_clk[i] =3D i2c_bus->apb_clk;
> 		else if (i < 5)
> 			base_clk[i] =3D (i2c_bus->apb_clk * 2) /
> 				      (((clk_div_reg / BIT((i - 1) * 8)) & GENMASK(7, 0)) +
> 2);
> 		else
> 			base_clk[i] =3D base_clk[4] / BIT(i - 5);
>=20
> Alternatively
>=20
> 		if (i =3D=3D 0)
> 			base_clk[i] =3D i2c_bus->apb_clk;
> 		else if (i < 5)
> 			base_clk[i] =3D (i2c_bus->apb_clk * 2) /
> 				      (((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
> 		else
> 			base_clk[i] =3D base_clk[4] >> (i - 5);
>=20

Will take the for better understand.
	if (i =3D=3D 0)
			base_clk[i] =3D i2c_bus->apb_clk;
		else if (i < 5)
			base_clk[i] =3D (i2c_bus->apb_clk * 2) /
				      (((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
		else
			base_clk[i] =3D base_clk[4] >> (i - 5);

> > +
> > +		if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <=3D 32) {
> > +			baseclk_idx =3D i;
> > +			divisor =3D DIV_ROUND_UP(base_clk[i],
> i2c_bus->timing_info.bus_freq_hz);
> > +			break;
> > +		}
> > +	}
>=20
> > +	baseclk_idx =3D min(baseclk_idx, 15);
>=20
> If the last conditional inside the loop is never true, you are going to u=
se\ a
> garbage here.

I will give initial int baseclk_idx =3D 0; in function begin.
>=20
> > +	divisor =3D min(divisor, 32);
>=20
> Ditto.

I will give u32 divisor =3D 32; in function begin.
>=20
> > +	scl_low =3D min(divisor * 9 / 16 - 1, 15);
>=20
> Missing minmax.h in the inclusion block.
Will add.
>=20
> > +	scl_high =3D (divisor - scl_low - 2) & GENMASK(3, 0);
> > +	data =3D (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | base=
clk_idx;
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
> > +	u32 state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > +	int ret =3D 0;
> > +	u32 ctrl;
> > +	int r;
> > +
> > +	dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n",
> > +i2c_bus->adap.nr, state);
> > +
> > +	ctrl =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +
> > +	/* Disable master/slave mode */
> > +	writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
> > +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +
> > +	/* Enable master mode only */
> > +	writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) |
> AST2600_I2CC_MASTER_EN,
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
> > +		} else {
> > +			if (i2c_bus->cmd_err) {
> > +				dev_dbg(i2c_bus->dev, "recovery error\n");
> > +				ret =3D -EPROTO;
> > +			}
> > +		}
> > +	}
>=20
> ret is set but maybe overridden.
>=20

If will modify by following.
		if (r =3D=3D 0) {
			dev_dbg(i2c_bus->dev, "recovery timed out\n");
			ret =3D -ETIMEDOUT;
		} else if (i2c_bus->cmd_err) {
			dev_dbg(i2c_bus->dev, "recovery error\n");
			ret =3D -EPROTO;
		}
If no error keep ret =3D 0;

> > +	/* Recovery done */
>=20
> Even if it fails above?

This will keep check the bus status, if bus busy, will give ret =3D -EPROTO=
;

>=20
> > +	state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> > +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> > +		ret =3D -EPROTO;
> > +	}
> > +
> > +	/* restore original master/slave setting */
> > +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > +	return ret;
> > +}
>=20
> ...
>=20
> > +static int ast2600_i2c_setup_dma_tx(u32 cmd, struct ast2600_i2c_bus
> > +*i2c_bus) {
> > +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> > +	int xfer_len;
> > +
> > +	cmd |=3D AST2600_I2CM_PKT_EN;
> > +	xfer_len =3D msg->len - i2c_bus->master_xfer_cnt;
> > +	if (xfer_len > AST2600_I2C_DMA_SIZE) {
> > +		xfer_len =3D AST2600_I2C_DMA_SIZE;
>=20
> > +	} else {
> > +		if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
>=20
> 	else if (...)

Will update to else if(...).
>=20
> > +			cmd |=3D AST2600_I2CM_STOP_CMD;
> > +	}
> > +
> > +	if (cmd & AST2600_I2CM_START_CMD) {
> > +		cmd |=3D AST2600_I2CM_PKT_ADDR(msg->addr);
> > +		i2c_bus->master_safe_buf =3D i2c_get_dma_safe_msg_buf(msg, 1);
> > +		if (!i2c_bus->master_safe_buf)
> > +			return -ENOMEM;
> > +		i2c_bus->master_dma_addr =3D
> > +			dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf,
> > +				       msg->len, DMA_TO_DEVICE);
>=20
> > +		if (dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr))
> {
> > +			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg,
> false);
> > +			i2c_bus->master_safe_buf =3D NULL;
>=20
> > +			return -ENOMEM;
>=20
> Why is the dma_mapping_error() returned error code shadowed?

Sorry, please point me why you are think it is shadowed?
As I know dma_mapping_error() will return 0 or -ENOMEM. So I check if it is=
 !=3D0.
Than return -ENOMEM.=20
>=20
> > +		}
> > +	}
> > +
> > +	if (xfer_len) {
> > +		cmd |=3D AST2600_I2CM_TX_DMA_EN | AST2600_I2CM_TX_CMD;
> > +		writel(AST2600_I2CM_SET_TX_DMA_LEN(xfer_len - 1),
> > +		       i2c_bus->reg_base + AST2600_I2CM_DMA_LEN);
> > +		writel(i2c_bus->master_dma_addr + i2c_bus->master_xfer_cnt,
> > +		       i2c_bus->reg_base + AST2600_I2CM_TX_DMA);
> > +	}
> > +
> > +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus
> > +*i2c_bus) {
> > +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> > +	u32 wbuf_dword;
> > +	int xfer_len;
> > +	u8 wbuf[4];
>=20
> > +	int i;
>=20
> Why signed?

Because it is for xfer len plus, also align with xfer_len and master_xfer_c=
nt in struct i2c_bus struct.

>=20
> > +	cmd |=3D AST2600_I2CM_PKT_EN;
> > +	xfer_len =3D msg->len - i2c_bus->master_xfer_cnt;
> > +	if (xfer_len > i2c_bus->buf_size) {
> > +		xfer_len =3D i2c_bus->buf_size;
>=20
> > +	} else {
> > +		if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
>=20
> 	else if (...)

Will update else if (...).
>=20
> > +			cmd |=3D AST2600_I2CM_STOP_CMD;
> > +	}
> > +
> > +	if (cmd & AST2600_I2CM_START_CMD)
> > +		cmd |=3D AST2600_I2CM_PKT_ADDR(msg->addr);
> > +
> > +	if (xfer_len) {
> > +		cmd |=3D AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;
>=20
> > +		/*
> > +		 * The controller's buffer register supports dword writes only.
> > +		 * Therefore, write dwords to the buffer register in a 4-byte aligne=
d,
> > +		 * and write the remaining unaligned data at the end.
> > +		 */
> > +		for (i =3D 0; i < xfer_len; i++) {
> > +			wbuf[i % 4] =3D msg->buf[i2c_bus->master_xfer_cnt + i];
> > +			if ((i % 4) =3D=3D 3 || i =3D=3D xfer_len - 1) {
> > +				wbuf_dword =3D get_unaligned_le32(wbuf);
> > +				writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
> > +			}
> > +		}
>=20
> This is overcomplicated and can be simplified.
> Why you can't perform
>=20
> 	get_unaligned_leXX(msg->buf[i2c_bus->master_xfer_cnt + i]);
>=20
> ?
>=20
> 		for (i =3D 0; i < xfer_len; i +=3D 4) {
> 			switch (min(xfer_len - i, 4) % 4) {
> 			case 1:
> 				wbuf_dword =3D ...;
> 				writel(wbuf_dword, i2c_bus->buf_base + i);
> 				break;
> 			case 2:
> 				wbuf_dword =3D get_unaligned_le16(...);
> 				writel(wbuf_dword, i2c_bus->buf_base + i);
> 				break;
> 			case 3:
> 				wbuf_dword =3D get_unaligned_le24(...);
> 				writel(wbuf_dword, i2c_bus->buf_base + i);
> 				break;
> 			default:
> 				wbuf_dword =3D get_unaligned_le32(...);
> 				writel(wbuf_dword, i2c_bus->buf_base + i);
> 				break;
> 			}
> 		}
>=20
>=20
> Now, with this it's can be a helper, with which
>=20
> 		for (i =3D 0; i < xfer_len; i +=3D 4) {
> 			switch (min(xfer_len - i, 4) % 4) {
> 			case 1:
> 				ast2600_write_data(i2c_bus, i, ...);
> 				break;
> 			case 2:
> 				ast2600_write_data(i2c_bus, i, get_unaligned_le16(...));
> 				break;
> 			case 3:
> 				ast2600_write_data(i2c_bus, i, get_unaligned_le24(...));
> 				break;
> 			default:
> 				ast2600_write_data(i2c_bus, i, get_unaligned_le32(...));
> 				break;
> 			}
> 		}
>=20
OK, I will modify by this.
		for (i =3D 0; i < xfer_len; i +=3D 4) {
			switch (min(xfer_len - i, 4) % 4) {
			case 1:
				ast2600_write_data(i2c_bus, i, ...);
				break;
			case 2:
				ast2600_write_data(i2c_bus, i, get_unaligned_le16(...));
				break;
			case 3:
				ast2600_write_data(i2c_bus, i, get_unaligned_le24(...));
				break;
			default:
				ast2600_write_data(i2c_bus, i, get_unaligned_le32(...));
				break;
			}
		}

> > +		writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> > +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> > +	}
> > +
> > +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> > +
> > +	return 0;
> > +}
>=20
> ...
>=20
> > +static int ast2600_i2c_setup_dma_rx(struct ast2600_i2c_bus *i2c_bus)
> > +{
> > +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> > +	int xfer_len;
> > +	u32 cmd;
> > +
> > +	cmd =3D AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr)
> |
> > +	      AST2600_I2CM_START_CMD | AST2600_I2CM_RX_DMA_EN;
> > +
> > +	if (msg->flags & I2C_M_RECV_LEN) {
> > +		xfer_len =3D 1;
>=20
> > +	} else {
> > +		if (msg->len > AST2600_I2C_DMA_SIZE) {
>=20
> 	} else if (...) {
>=20
Will update to else if (...) {
> > +			xfer_len =3D AST2600_I2C_DMA_SIZE;
> > +		} else {
> > +			xfer_len =3D msg->len;
> > +			if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
> > +				cmd |=3D MASTER_TRIGGER_LAST_STOP;
> > +		}
> > +	}
> > +	writel(AST2600_I2CM_SET_RX_DMA_LEN(xfer_len - 1),
> i2c_bus->reg_base + AST2600_I2CM_DMA_LEN);
> > +	i2c_bus->master_safe_buf =3D i2c_get_dma_safe_msg_buf(msg, 1);
> > +	if (!i2c_bus->master_safe_buf)
> > +		return -ENOMEM;
> > +	i2c_bus->master_dma_addr =3D
> > +		dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf, msg->len,
> DMA_FROM_DEVICE);
> > +	if (dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr)) {
> > +		i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg, false);
> > +		i2c_bus->master_safe_buf =3D NULL;
> > +		return -ENOMEM;
> > +	}
> > +	writel(i2c_bus->master_dma_addr, i2c_bus->reg_base +
> > +AST2600_I2CM_RX_DMA);
> > +
> > +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ast2600_i2c_setup_buff_rx(struct ast2600_i2c_bus *i2c_bus)
> > +{
> > +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> > +	int xfer_len;
> > +	u32 cmd;
> > +
> > +	cmd =3D AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr)
> |
> > +	      AST2600_I2CM_START_CMD | AST2600_I2CM_RX_BUFF_EN;
> > +
> > +	if (msg->flags & I2C_M_RECV_LEN) {
> > +		dev_dbg(i2c_bus->dev, "smbus read\n");
> > +		xfer_len =3D 1;
>=20
> > +	} else {
> > +		if (msg->len > i2c_bus->buf_size) {
>=20
> 	} else if (...) {
Will update to else if (...) {

>=20
> > +			xfer_len =3D i2c_bus->buf_size;
> > +		} else {
> > +			xfer_len =3D msg->len;
> > +			if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
> > +				cmd |=3D MASTER_TRIGGER_LAST_STOP;
> > +		}
> > +	}
> > +	writel(AST2600_I2CC_SET_RX_BUF_LEN(xfer_len), i2c_bus->reg_base +
> > +AST2600_I2CC_BUFF_CTRL);
> > +
> > +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ast2600_i2c_setup_byte_rx(struct ast2600_i2c_bus *i2c_bus)
> > +{
> > +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> > +	u32 cmd;
> > +
> > +	cmd =3D AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr)
> |
> > +	      AST2600_I2CM_START_CMD | AST2600_I2CM_RX_CMD;
> > +
> > +	if (msg->flags & I2C_M_RECV_LEN) {
> > +		dev_dbg(i2c_bus->dev, "smbus read\n");
>=20
> > +	} else {
> > +		if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count) {
>=20
> 	} else if (...) {
>=20
Will update to else if (...) {

> > +			if (msg->len =3D=3D 1)
> > +				cmd |=3D MASTER_TRIGGER_LAST_STOP;
> > +		}
> > +	}
> > +
> > +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> > +
> > +	return 0;
> > +}
>=20
> ...
>=20
> > +static int ast2600_i2c_do_start(struct ast2600_i2c_bus *i2c_bus) {
> > +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> > +
> > +	/* send start */
> > +	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",
>=20
> Drop 'ing', no need to have this in the debug message.
Will Drop 'ing'
>=20
> > +		i2c_bus->msgs_index, str_read_write(msg->flags & I2C_M_RD),
> > +		msg->len, msg->len > 1 ? "s" : "",
>=20
> str_plural()

Will replace by following.=20

dev_dbg(i2c_bus->dev, "[%d] %s %d byte%s %s 0x%02x\n",
        i2c_bus->msgs_index, str_read_write(msg->flags & I2C_M_RD),
        msg->len, str_plural(msg->len),

>=20
> > +		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);
>=20
> > +	i2c_bus->master_xfer_cnt =3D 0;
> > +	i2c_bus->buf_index =3D 0;
> > +
> > +	if (msg->flags & I2C_M_RD) {
> > +		if (i2c_bus->mode =3D=3D DMA_MODE)
> > +			return ast2600_i2c_setup_dma_rx(i2c_bus);
> > +		else if (i2c_bus->mode =3D=3D BUFF_MODE)
> > +			return ast2600_i2c_setup_buff_rx(i2c_bus);
> > +		else
> > +			return ast2600_i2c_setup_byte_rx(i2c_bus);
> > +	} else {
> > +		if (i2c_bus->mode =3D=3D DMA_MODE)
> > +			return
> ast2600_i2c_setup_dma_tx(AST2600_I2CM_START_CMD, i2c_bus);
> > +		else if (i2c_bus->mode =3D=3D BUFF_MODE)
> > +			return ast2600_i2c_setup_buff_tx(AST2600_I2CM_START_CMD,
> i2c_bus);
> > +		else
> > +			return
> ast2600_i2c_setup_byte_tx(AST2600_I2CM_START_CMD, i2c_bus);
> > +	}
> > +}
>=20
> ...
>=20
> > +master_out:
> > +	if (i2c_bus->mode =3D=3D DMA_MODE) {
> > +		kfree(i2c_bus->master_safe_buf);
> > +	    i2c_bus->master_safe_buf =3D NULL;
> > +	}
>=20
> Indentation issues.

Will update
>=20
> > +	return ret;
>=20
> ...
>=20
>=20
> > +MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);
>=20
> Why do you need this table before _probe()? Isn't the only user is below?

It is for next generation table list. Do you suggest remove it?

>=20
> > +static int ast2600_i2c_probe(struct platform_device *pdev)
>=20
> ...
>=20
> > +	i2c_bus->global_regs =3D
> syscon_regmap_lookup_by_phandle(dev->of_node,
> > +"aspeed,global-regs");
>=20
> dev_of_node(dev)

Will update i2c_bus->global_regs =3D syscon_regmap_lookup_by_phandle(dev_of=
_node(dev), "aspeed,global-regs");
>=20

> > +	if (IS_ERR(i2c_bus->global_regs))
> > +		return PTR_ERR(i2c_bus->global_regs);
>=20
> ...
>=20
> > +	if (device_property_read_bool(&pdev->dev, "aspeed,enable-dma"))
>=20
> You have 'dev' Why not use it?
Will update
	if (device_property_read_bool(dev, "aspeed,enable-dma"))
>=20
> > +		i2c_bus->mode =3D DMA_MODE;
>=20
> ...
>=20
> > +	if (i2c_bus->mode =3D=3D BUFF_MODE) {
> > +		i2c_bus->buf_base =3D
> devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > +			i2c_bus->buf_size =3D resource_size(res) / 2;
> > +		else
> > +			i2c_bus->mode =3D BYTE_MODE;
>=20
> What's wrong with positive conditional? And is it even possible to have N=
ULL
> here?
>=20
Yes, if dtsi fill not following yaml example have reg 1, that will failure =
at buffer mode.
And I can swith to byte mode.=20

reg =3D <0x80 0x80>, <0xc00 0x20>;
> > +	}
>=20
> ...
>=20
> > +	strscpy(i2c_bus->adap.name, pdev->name, sizeof(i2c_bus->adap.name));
>=20
> Use 2-argument strscpy().
Do you mean strscpy(i2c_bus->adap.name, pdev->name); is acceptable?
>=20
> ...
>=20
> > +	i2c_bus->alert_enable =3D device_property_read_bool(dev, "smbus-alert=
");
> > +	if (i2c_bus->alert_enable) {
> > +		i2c_bus->ara =3D i2c_new_smbus_alert_device(&i2c_bus->adap,
> &i2c_bus->alert_data);
> > +		if (!i2c_bus->ara)
> > +			dev_warn(dev, "Failed to register ARA client\n");
> > +
> > +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER
> | AST2600_I2CM_SMBUS_ALT,
> > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > +	} else {
> > +		i2c_bus->alert_enable =3D false;
> > +		/* Set interrupt generation of I2C master controller */
> > +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > +	}
>=20
> I2C core calls i2c_setup_smbus_alert() when registering the adapter. Why =
do
> you need to have something special here?
The ast2600 i2c support smbus alert, and according my reference.
If enable alert, that will need i2c_new_smbus_alert_device for alert handle=
r.
When interrupt coming driver can use this hander to up use i2c_handle_smbus=
_alert
And update layer will handle alert.
Does I mis-understand. If yes, I will remove this in next.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

