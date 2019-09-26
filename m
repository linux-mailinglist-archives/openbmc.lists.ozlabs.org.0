Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C7ABEA58
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 03:59:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dylV22FdzDqfL
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:59:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h75xcDnH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="tqDgMnal"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dyks48hPzDqXR
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:58:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5A45E5B5;
 Wed, 25 Sep 2019 21:58:25 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=mknls
 5aM0k0jYEzbUlEZ6ETwXq/krtn1+1ruc9+v2l4=; b=h75xcDnH8kWGJEHOGpqJW
 kU1+vs5ePZqmmd8Nsxse5i0RFeqvZwkvcntHF68qjSCBwkEyL1JdEov4OIQWPrN5
 X79bC0IRlr7joYNlQv3eDntUtvMYDJJIprhLBveTmY60fZ3UQ7oqkdynaVE6ODiJ
 0pDeB2al4KqI5T0Q+vI5X9Pow01hfhf6Oz/V5AAAjOZAz56F1JeCdddPfdjlyrhz
 JkOkxA1wGxv3cqdvY2dGcTsmezsRm+ydeJtHvUKKZ9uZMXPsjZOCvbydPtOgdE7w
 LkeUtQ2h9tP0yxiA2Wp8fJoQyNBWgXoGkNL48f9z+UKLJM/Eyj2xIOam6+3sMgX1
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=mknls5aM0k0jYEzbUlEZ6ETwXq/krtn1+1ruc9+v2
 l4=; b=tqDgMnalJh4lp3bpEKEHDQOFeYGRj3o8I0cxSghZPy9e4JGwZVBCIk0yv
 9uyAklj/aUSe+s+n1/qKiTTCz0brsuYS9b6GxBHVgcZzg5TxHQbFhhNMWfuqqvPO
 PoSH/0hUuMr6jqvs74mhuwHZ08PrbJIZhUC56tW+PZcFjAT3IS8qHxuIwFeHQ5qH
 2lENQE3n4c3GwYZlRs/ArzMpFELlbEZzNeQLNwDHC+qS41mvow4YUq/lLMm0y2U3
 cRdYqPF+7ObVlmGJA5eEBIPn88KpwM71smsWioxaMScUawN/RJlBiDebLkR7Aa5K
 v7Hn/MIjKaChCoZbAcrHITI3v8/KA==
X-ME-Sender: <xms:PxuMXaif090PlbrYxv_qYR7wzvIRFZaS2FJIMrtTrupq0aqw6Y8fHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:PxuMXR9IT4hLpkHQyDfo8p8W16NQVodPSS2zUSGaEyBAVIoUZaz2NQ>
 <xmx:PxuMXXLhEFVlMo6FhW8fHEerndIHiSS3zG4WbkIxtTbA_8DHi3Dotg>
 <xmx:PxuMXaahijj0kYjyjlGH25UjTfo_I3lOLpASP14YzuvmfeH7dx7Cng>
 <xmx:QBuMXV0E_OOSsVwHDIavXHaPSUr1QrN6QX-I_eimgI9MHVkRA8HLFg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B724AE00A5; Wed, 25 Sep 2019 21:58:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <3b43ddc2-93b4-4ab1-8d92-891ac8ccfba1@www.fastmail.com>
In-Reply-To: <20190925124239.27897-7-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-7-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:29:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_06/13]_mtd:_spi-nor:_aspeed:_Introduc?=
 =?UTF-8?Q?e_a_field_for_the_AHB_physical_address?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 25 Sep 2019, at 22:12, C=C3=A9dric Le Goater wrote:
> On the AST2600, we will use it to compute the address of the chip AHB
> window from the Segment Register value. It also removes the need of
> aspeed_smc_ahb_base_phy() helper.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
> index 1cc89c965687..b3a128ada320 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -121,7 +121,8 @@ struct aspeed_smc_controller {
>  	struct mutex mutex;			/* controller access mutex */
>  	const struct aspeed_smc_info *info;	/* type info of controller */
>  	void __iomem *regs;			/* controller registers */
> -	void __iomem *ahb_base;			/* per-chip windows resource */
> +	void __iomem *ahb_base;			/* per-chip window resource */
> +	u32 ahb_base_phy;			/* phys addr of AHB window  */
>  	u32 ahb_window_size;			/* full mapping window size */
> =20
>  	unsigned long	clk_frequency;
> @@ -533,21 +534,13 @@ static void __iomem *aspeed_smc_chip_base(struct=
=20
> aspeed_smc_chip *chip,
>  	return controller->ahb_base + offset;
>  }
> =20
> -static u32 aspeed_smc_ahb_base_phy(struct aspeed_smc_controller *cont=
roller)
> -{
> -	u32 seg0_val =3D readl(SEGMENT_ADDR_REG(controller, 0));
> -
> -	return SEGMENT_ADDR_START(seg0_val);
> -}
> -
>  static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32=
 start,
>  			    u32 size)
>  {
>  	struct aspeed_smc_controller *controller =3D chip->controller;
>  	void __iomem *seg_reg;
> -	u32 seg_oldval, seg_newval, ahb_base_phy, end;
> -
> -	ahb_base_phy =3D aspeed_smc_ahb_base_phy(controller);
> +	u32 seg_oldval, seg_newval, end;
> +	u32 ahb_base_phy =3D controller->ahb_base_phy;
> =20
>  	seg_reg =3D SEGMENT_ADDR_REG(controller, cs);
>  	seg_oldval =3D readl(seg_reg);
> @@ -636,7 +629,7 @@ static u32 aspeed_smc_chip_set_segment(struct=20
> aspeed_smc_chip *chip)
>  			 chip->cs, size >> 20);
>  	}
> =20
> -	ahb_base_phy =3D aspeed_smc_ahb_base_phy(controller);
> +	ahb_base_phy =3D controller->ahb_base_phy;
> =20
>  	/*
>  	 * As a start address for the current segment, use the default
> @@ -1154,6 +1147,7 @@ static int aspeed_smc_probe(struct platform_devi=
ce *pdev)
>  		return PTR_ERR(controller->regs);
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	controller->ahb_base_phy =3D res->start;
>  	controller->ahb_base =3D devm_ioremap_resource(dev, res);
>  	if (IS_ERR(controller->ahb_base))
>  		return PTR_ERR(controller->ahb_base);
> --=20
> 2.21.0
>=20
>
