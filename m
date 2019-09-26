Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E367DBEA5F
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 04:04:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dysV4rMyzDqbk
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:04:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fL07LuSx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="wC74C7Ys"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dyqX0kW9zDqcL
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 12:02:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6142464A;
 Wed, 25 Sep 2019 22:02:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 22:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=cvIgz
 VR0ArKeVtWxnvrMcJ7go5HCno9vvQ2s10SnL5w=; b=fL07LuSxGQ+7/vwtijUER
 pvq9wlMJZsT/7dVzfpO9DwzmU/2UN0e1M0gc3WFZVYk/gYwkxKZO7mBoMgRCNr9P
 +JwOxqyribfmWqtXU3qlEHBicUcOIAfk98OWcKz1sGrzw9d9BlKXA3pQMrQeKz+r
 RUikocY8uzmE6uiIkX/k5pwYrhGPD02ViZwySOMweRgQWJBARJsw6d+RY1ZJL3aZ
 jVndV3ZBGoXy0A0XTQUTkdT8+GVyOSMVZGVKQZDi621RJwTnU1BcaeNzJGQfKh5H
 t571n5KOvBdp78G5donXq3C1SJN0dJBxwjFNsBJf4uEmYZcTevoGcD7YyUsq0kAT
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=cvIgzVR0ArKeVtWxnvrMcJ7go5HCno9vvQ2s10SnL
 5w=; b=wC74C7Yss2MW6pkTxE9/TUalDAZ9cKKrtgIuLWevuqmo8dLl8jLrgk4pR
 XHTp/Y6A/nbytXh1Mtdwism303J+tkjSM+yHLCsEttiAN/GmV7U3oTxOi7VGM4fC
 vfSHIMZ+74xM14iairrfGrIVDQZ1nO9+Bu1LDPuZrtih9xhJUK/k4jAT0e7Z2y7F
 u7Lzko1q38yh+w7cdAN3/dqreIKVF8YBLG3XuiKUnF3oqSRCPHB1r3WUHHslKfLx
 dNLXhmB85b01e2QkYldlcWdr5x9Wg0Vu4W2Df+V3YPdiXBgyfJgDNQ0+EvmHU/VG
 YyVH3UUoPunB4HPOtLaY8sGJmPM0A==
X-ME-Sender: <xms:NByMXcp-BGJ-aLxQ0KARyor4NrLzd_ZScvEzEsKSoQKs6iw9PrVeRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:NByMXYeKZBmEy5q4sgohZ6y7kTc_eYyyZOFPuE3GGE0-_HTBodnCrw>
 <xmx:NByMXWh_ODIZz32HRWv5Xu1AL0fTLXGvlt2raR5162l_A9vRt4v9dA>
 <xmx:NByMXeP0QIuVi-jCQZrDWT5Mw-8YnoHzmoi57Kqt1ei4ixT9Gzwnfw>
 <xmx:NByMXUELjmTkM_uXkRNJl6JNzkK7UeQaejWpKYLZorzoi-bS_xoW8A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5EAC1E00BE; Wed, 25 Sep 2019 22:02:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <8995c49e-7aaf-4028-a3df-2326ae7950fb@www.fastmail.com>
In-Reply-To: <20190925124239.27897-11-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-11-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:33:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_10/13]_mtd:_spi-nor:_aspeed:_Introduc?=
 =?UTF-8?Q?e_training_operations_per_platform?=
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
> The read timing compensation register is different on the AST2600 and
> training will be slightly more complex.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
> index ea9b4a157677..768394068bd4 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -41,9 +41,13 @@ struct aspeed_smc_info {
>  	u8 we0;			/* shift for write enable bit for CE0 */
>  	u8 ctl0;		/* offset in regs of ctl for CE0 */
>  	u8 timing;		/* offset in regs of timing */
> +	u32 hdiv_max;           /* Max HCLK divisor on read timing reg */
> =20
>  	void (*set_4b)(struct aspeed_smc_chip *chip);
>  	int (*optimize_read)(struct aspeed_smc_chip *chip, u32 max_freq);
> +	int (*calibrate)(struct aspeed_smc_chip *chip, u32 hdiv,
> +			 const u8 *golden_buf, u8 *test_buf);
> +
>  	u32 (*segment_start)(struct aspeed_smc_controller *controller, u32=20=

> reg);
>  	u32 (*segment_end)(struct aspeed_smc_controller *controller, u32 reg=
);
>  	u32 (*segment_reg)(struct aspeed_smc_controller *controller,
> @@ -54,6 +58,9 @@ static void aspeed_smc_chip_set_4b_spi_2400(struct=20=

> aspeed_smc_chip *chip);
>  static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
>  static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
>  				     u32 max_freq);
> +static int aspeed_smc_calibrate_reads(struct aspeed_smc_chip *chip,=20=

> u32 hdiv,
> +			 const u8 *golden_buf, u8 *test_buf);
> +
>  static u32 aspeed_smc_segment_start(
>  	struct aspeed_smc_controller *controller, u32 reg);
>  static u32 aspeed_smc_segment_end(
> @@ -68,8 +75,10 @@ static const struct aspeed_smc_info fmc_2400_info =3D=
 {
>  	.we0 =3D 16,
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
> +	.hdiv_max =3D 1,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> +	.calibrate =3D aspeed_smc_calibrate_reads,
>  	.segment_start =3D aspeed_smc_segment_start,
>  	.segment_end =3D aspeed_smc_segment_end,
>  	.segment_reg =3D aspeed_smc_segment_reg,
> @@ -82,8 +91,10 @@ static const struct aspeed_smc_info spi_2400_info =3D=
 {
>  	.we0 =3D 0,
>  	.ctl0 =3D 0x04,
>  	.timing =3D 0x14,
> +	.hdiv_max =3D 1,
>  	.set_4b =3D aspeed_smc_chip_set_4b_spi_2400,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> +	.calibrate =3D aspeed_smc_calibrate_reads,
>  	/* No segment registers */
>  };
> =20
> @@ -94,8 +105,10 @@ static const struct aspeed_smc_info fmc_2500_info =
=3D {
>  	.we0 =3D 16,
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
> +	.hdiv_max =3D 1,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> +	.calibrate =3D aspeed_smc_calibrate_reads,
>  	.segment_start =3D aspeed_smc_segment_start,
>  	.segment_end =3D aspeed_smc_segment_end,
>  	.segment_reg =3D aspeed_smc_segment_reg,
> @@ -108,8 +121,10 @@ static const struct aspeed_smc_info spi_2500_info=
 =3D {
>  	.we0 =3D 16,
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
> +	.hdiv_max =3D 1,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> +	.calibrate =3D aspeed_smc_calibrate_reads,
>  	.segment_start =3D aspeed_smc_segment_start,
>  	.segment_end =3D aspeed_smc_segment_end,
>  	.segment_reg =3D aspeed_smc_segment_reg,
> @@ -984,7 +999,8 @@ static const uint32_t aspeed_smc_hclk_divs[] =3D {=

>  	0x6, /* HCLK/4 */
>  	0xd, /* HCLK/5 */
>  };
> -#define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)
> +#define ASPEED_SMC_HCLK_DIV(i) \
> +	(aspeed_smc_hclk_divs[(i) - 1] << CONTROL_CLOCK_FREQ_SEL_SHIFT)
> =20
>  static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
>  {
> @@ -1015,6 +1031,8 @@ static u32 aspeed_smc_default_read(struct=20
> aspeed_smc_chip *chip)
>  static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
>  				     u32 max_freq)
>  {
> +	struct aspeed_smc_controller *controller =3D chip->controller;
> +	const struct aspeed_smc_info *info =3D controller->info;
>  	u8 *golden_buf, *test_buf;
>  	int i, rc, best_div =3D -1;
>  	u32 save_read_val =3D chip->ctl_val[smc_read];
> @@ -1047,7 +1065,7 @@ static int aspeed_smc_optimize_read(struct=20
> aspeed_smc_chip *chip,
>  	}
> =20
>  	/* Now we iterate the HCLK dividers until we find our breaking point=
 */
> -	for (i =3D ARRAY_SIZE(aspeed_smc_hclk_divs); i > 0; i--) {
> +	for (i =3D ARRAY_SIZE(aspeed_smc_hclk_divs); i > info->hdiv_max - 1;=
 i--) {
>  		u32 tv, freq;
> =20
>  		/* Compare timing to max */
> @@ -1058,8 +1076,8 @@ static int aspeed_smc_optimize_read(struct=20
> aspeed_smc_chip *chip,
>  		/* Set the timing */
>  		tv =3D chip->ctl_val[smc_read] | ASPEED_SMC_HCLK_DIV(i);
>  		writel(tv, chip->ctl);
> -		dev_dbg(chip->nor.dev, "Trying HCLK/%d...", i);
> -		rc =3D aspeed_smc_calibrate_reads(chip, i, golden_buf, test_buf);
> +		dev_dbg(chip->nor.dev, "Trying HCLK/%d [%08x] ...", i, tv);
> +		rc =3D info->calibrate(chip, i, golden_buf, test_buf);
>  		if (rc =3D=3D 0)
>  			best_div =3D i;
>  	}
> --=20
> 2.21.0
>=20
>
