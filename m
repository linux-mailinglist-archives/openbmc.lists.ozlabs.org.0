Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 815A7BEA5A
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 04:00:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dymg6GxWzDqbk
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:00:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AZAQHCwQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ivB0j+qv"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dylz75fDzDqYX
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:59:27 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A36B564B;
 Wed, 25 Sep 2019 21:59:25 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=MjZNF
 DOTXMAKRP/N2qvGGPOiVUv+GpDn3dGN4JwIKYE=; b=AZAQHCwQ7UHRDUkijXwPm
 s+GAck+lglFEKXc2i7p3hRflGPR2f+wclUh+dJc2sjpTXBsisFBWaa69e9FKAx/o
 j5vWei9K3gh7AYpMkDgk5qmP9mftH7t10XwxMLQ3GLqVydPHjGomkdnYEaSKRRES
 cb+ilKOuLXh8jj/HkSGqvUVyRqG8uf5FHGvzmJkSMgiW5noPbM7tQtRQBaa4PSjq
 NYWzEbvB28vJS8T4Dn2Z+cQkE1N6BMcakVxh+FSOpRwxlp4WDm99m41ulfUuWrj/
 svpGfW5g5pGfLrv1XZ6St9j/OK1FZRmePayKmRQHmG/GDt4o40SbJATHI02spDXy
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=MjZNFDOTXMAKRP/N2qvGGPOiVUv+GpDn3dGN4JwIK
 YE=; b=ivB0j+qv3Ag81txvegtg3RPvnUfnO+vO7a4sEHREMfat9IBlRDyHrlzsT
 wJSSu/upLzRSRGpjBiaKomaRS1DFZSR8joK2VzzIG+00EpYK7FRhIBP75cv8G01r
 9VOzVCy1oRZN5bCzMV4cOUDIwHK+GrgZ3pdGj8F1X2e4sGLc4saEw4znBzeeWLjk
 TrpZ8nblg9zjTV22kjXltvEkD+pEFXraDd6E/6BoxDRwcZxcEe2DVmMFSZxNh0ho
 hEAGqhnX0LxIsFNzR2IrK5VqNYM4ujSF+inVLUERMf0ysSUOETbJA7yi0p2Ofhim
 LCZz2RItedB0uhVrwmcXwWI7ctUdA==
X-ME-Sender: <xms:fRuMXXyzmNsfaveVuAT_5bErQYdAKfTHhdB1o_EIc0CrS-8x5KMnYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:fRuMXTjJulAz3LbtZ7QsJL_sfodB2XMhK6brPW7iUiu8cBX-5kRLBw>
 <xmx:fRuMXcXpmgGheysSWG1gOrVhkjBCKTD9LGwGL2JOezn742bCzztdBw>
 <xmx:fRuMXV2Ql0PfhKIBNHGNIqk-onyyqzIXF-fBfek5s_o2jp5wKu-eMg>
 <xmx:fRuMXeX4icGYTdlcon5pS70rVvkxShiqAMb50kmcR0YTaQ4CaAbmsg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 20A92E00A5; Wed, 25 Sep 2019 21:59:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <5bc3cde3-fd39-4abf-81e4-b54990b47084@www.fastmail.com>
In-Reply-To: <20190925124239.27897-8-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-8-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:30:07 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_07/13]_mtd:_spi-nor:_aspeed:_Introduc?=
 =?UTF-8?Q?e_segment_operations?=
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
> AST2600 will use a different encoding for the addresses defined in the=

> Segment Register.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 76 +++++++++++++++++++++++--------=
-
>  1 file changed, 56 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
> index b3a128ada320..4e768092a965 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -32,6 +32,7 @@ enum aspeed_smc_flash_type {
>  };
> =20
>  struct aspeed_smc_chip;
> +struct aspeed_smc_controller;
> =20
>  struct aspeed_smc_info {
>  	u32 maxsize;		/* maximum size of chip window */
> @@ -43,12 +44,22 @@ struct aspeed_smc_info {
> =20
>  	void (*set_4b)(struct aspeed_smc_chip *chip);
>  	int (*optimize_read)(struct aspeed_smc_chip *chip, u32 max_freq);
> +	u32 (*segment_start)(struct aspeed_smc_controller *controller, u32 r=
eg);
> +	u32 (*segment_end)(struct aspeed_smc_controller *controller, u32 reg=
);
> +	u32 (*segment_reg)(struct aspeed_smc_controller *controller,
> +			   u32 start, u32 end);
>  };
> =20
>  static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *c=
hip);
>  static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
>  static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
>  				     u32 max_freq);
> +static u32 aspeed_smc_segment_start(
> +	struct aspeed_smc_controller *controller, u32 reg);
> +static u32 aspeed_smc_segment_end(
> +	struct aspeed_smc_controller *controller, u32 reg);
> +static u32 aspeed_smc_segment_reg(
> +	struct aspeed_smc_controller *controller, u32 start, u32 end);
> =20
>  static const struct aspeed_smc_info fmc_2400_info =3D {
>  	.maxsize =3D 64 * 1024 * 1024,
> @@ -59,6 +70,9 @@ static const struct aspeed_smc_info fmc_2400_info =3D=
 {
>  	.timing =3D 0x94,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> +	.segment_start =3D aspeed_smc_segment_start,
> +	.segment_end =3D aspeed_smc_segment_end,
> +	.segment_reg =3D aspeed_smc_segment_reg,
>  };
> =20
>  static const struct aspeed_smc_info spi_2400_info =3D {
> @@ -70,6 +84,7 @@ static const struct aspeed_smc_info spi_2400_info =3D=
 {
>  	.timing =3D 0x14,
>  	.set_4b =3D aspeed_smc_chip_set_4b_spi_2400,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> +	/* No segment registers */
>  };
> =20
>  static const struct aspeed_smc_info fmc_2500_info =3D {
> @@ -81,6 +96,9 @@ static const struct aspeed_smc_info fmc_2500_info =3D=
 {
>  	.timing =3D 0x94,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> +	.segment_start =3D aspeed_smc_segment_start,
> +	.segment_end =3D aspeed_smc_segment_end,
> +	.segment_reg =3D aspeed_smc_segment_reg,
>  };
> =20
>  static const struct aspeed_smc_info spi_2500_info =3D {
> @@ -92,6 +110,9 @@ static const struct aspeed_smc_info spi_2500_info =3D=
 {
>  	.timing =3D 0x94,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> +	.segment_start =3D aspeed_smc_segment_start,
> +	.segment_end =3D aspeed_smc_segment_end,
> +	.segment_reg =3D aspeed_smc_segment_reg,
>  };
> =20
>  enum aspeed_smc_ctl_reg_value {
> @@ -201,22 +222,33 @@ struct aspeed_smc_controller {
>  	(CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 | \
>  	 CONTROL_CLOCK_FREQ_SEL_MASK | CONTROL_LSB_FIRST | CONTROL_CLOCK_MOD=
E_3)
> =20
> -/*
> - * The Segment Register uses a 8MB unit to encode the start address
> - * and the end address of the mapping window of a flash SPI slave :
> - *
> - *        | byte 1 | byte 2 | byte 3 | byte 4 |
> - *        +--------+--------+--------+--------+
> - *        |  end   |  start |   0    |   0    |
> - */
>  #define SEGMENT_ADDR_REG0		0x30
> -#define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)
> -#define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)
> -#define SEGMENT_ADDR_VALUE(start, end)					\
> -	(((((start) >> 23) & 0xFF) << 16) | ((((end) >> 23) & 0xFF) << 24))
>  #define SEGMENT_ADDR_REG(controller, cs)	\
>  	((controller)->regs + SEGMENT_ADDR_REG0 + (cs) * 4)
> =20
> +/*
> + * The Segment Registers of the AST2400 and AST2500 have a 8MB
> + * unit. The address range of a flash SPI slave is encoded with
> + * absolute addresses which should be part of the overall controller
> + * window.
> + */
> +static u32 aspeed_smc_segment_start(
> +	struct aspeed_smc_controller *controller, u32 reg)
> +{
> +	return ((reg >> 16) & 0xFF) << 23;
> +}
> +
> +static u32 aspeed_smc_segment_end(
> +	struct aspeed_smc_controller *controller, u32 reg)
> +{
> +	return ((reg >> 24) & 0xFF) << 23;
> +}
> +
> +static u32 aspeed_smc_segment_reg(
> +	struct aspeed_smc_controller *controller, u32 start, u32 end)
> +{
> +	return (((start >> 23) & 0xFF) << 16) | (((end >> 23) & 0xFF) << 24)=
;
> +}
>  /*
>   * Switch to turn off read optimisation if needed
>   */
> @@ -519,16 +551,19 @@ static void __iomem *aspeed_smc_chip_base(struct=
=20
> aspeed_smc_chip *chip,
>  					  struct resource *res)
>  {
>  	struct aspeed_smc_controller *controller =3D chip->controller;
> +	const struct aspeed_smc_info *info =3D controller->info;
>  	u32 offset =3D 0;
>  	u32 reg;
> =20
> -	if (controller->info->nce > 1) {
> +	if (info->nce > 1) {
>  		reg =3D readl(SEGMENT_ADDR_REG(controller, chip->cs));
> =20
> -		if (SEGMENT_ADDR_START(reg) >=3D SEGMENT_ADDR_END(reg))
> +		if (info->segment_start(controller, reg) >=3D
> +		    info->segment_end(controller, reg)) {
>  			return NULL;
> +		}
> =20
> -		offset =3D SEGMENT_ADDR_START(reg) - res->start;
> +		offset =3D info->segment_start(controller, reg) - res->start;
>  	}
> =20
>  	return controller->ahb_base + offset;
> @@ -538,6 +573,7 @@ static u32 chip_set_segment(struct aspeed_smc_chip=
=20
> *chip, u32 cs, u32 start,
>  			    u32 size)
>  {
>  	struct aspeed_smc_controller *controller =3D chip->controller;
> +	const struct aspeed_smc_info *info =3D controller->info;
>  	void __iomem *seg_reg;
>  	u32 seg_oldval, seg_newval, end;
>  	u32 ahb_base_phy =3D controller->ahb_base_phy;
> @@ -551,7 +587,7 @@ static u32 chip_set_segment(struct aspeed_smc_chip=
=20
> *chip, u32 cs, u32 start,
>  	 * previous segment
>  	 */
>  	if (!size)
> -		size =3D SEGMENT_ADDR_END(seg_oldval) - start;
> +		size =3D info->segment_end(controller, seg_oldval) - start;
> =20
>  	/*
>  	 * The segment cannot exceed the maximum window size of the
> @@ -564,7 +600,7 @@ static u32 chip_set_segment(struct aspeed_smc_chip=
=20
> *chip, u32 cs, u32 start,
>  	}
> =20
>  	end =3D start + size;
> -	seg_newval =3D SEGMENT_ADDR_VALUE(start, end);
> +	seg_newval =3D info->segment_reg(controller, start, end);
>  	writel(seg_newval, seg_reg);
> =20
>  	/*
> @@ -575,8 +611,8 @@ static u32 chip_set_segment(struct aspeed_smc_chip=
=20
> *chip, u32 cs, u32 start,
>  	if (seg_newval !=3D readl(seg_reg)) {
>  		dev_err(chip->nor.dev, "CE%d window invalid", cs);
>  		writel(seg_oldval, seg_reg);
> -		start =3D SEGMENT_ADDR_START(seg_oldval);
> -		end =3D SEGMENT_ADDR_END(seg_oldval);
> +		start =3D info->segment_start(controller, seg_oldval);
> +		end =3D info->segment_end(controller, seg_oldval);
>  		size =3D end - start;
>  	}
> =20
> @@ -639,7 +675,7 @@ static u32 aspeed_smc_chip_set_segment(struct=20
> aspeed_smc_chip *chip)
>  	if (chip->cs) {
>  		u32 prev =3D readl(SEGMENT_ADDR_REG(controller, chip->cs - 1));
> =20
> -		start =3D SEGMENT_ADDR_END(prev);
> +		start =3D controller->info->segment_end(controller, prev);
>  	} else {
>  		start =3D ahb_base_phy;
>  	}
> --=20
> 2.21.0
>=20
>
