Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC5BEA6B
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 04:10:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dz0H4kjyzDqTT
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:10:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pENWomWG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DloojewZ"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dyzh6H0qzDqRM
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 12:09:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AA578654;
 Wed, 25 Sep 2019 22:09:33 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 22:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=Oxpbd
 IZgGBsrKU+JKFs/5QhSKD+OtLHdIVTXz9pqueM=; b=pENWomWGvcrZOoy+m/vQG
 7T0xO+tSEfjRcU2atFFJKb42tPNjSImK8Yy9wLn64czeMNf/IdjOzd4jtwzYgAbP
 VApw/dpD+JWfqWTXdb5VFI5JuQTTuTglvVM72rQtSVV/vKHgUIvUI6EJyuJS/ZWS
 MGEQHB0JvR3tfT85I7wyc41uD0BD2XJ2g3tRyUNNIujWd8B6b0qYm0mAD4qyt+8O
 uVaJqYoUEButT/xNGWpp7VJySvd6eXUt84rVMrJBMO6Kmmp3XaVPZ6qJ0SX3QD80
 Rq6wLiL89Vglhsj01AhMOYH4r9pphJeHxsCebZLXNNz+jam6HX3VwNCNZX6E6kpm
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=OxpbdIZgGBsrKU+JKFs/5QhSKD+OtLHdIVTXz9pqu
 eM=; b=DloojewZeRnYgjG1sWdwEgfHsT9HYYd8+mfdeONXvYlr90XEhGVsqjX2p
 13D3umlhYegQvuuCgB/g067GotMV6BRWM2TM7tr8GRKV8lkJH85qZngJPLaBnmIO
 tGQOTXBe1Q8cuoLOkjVZ9xhuKq/noq+5IhFpV7PUJcA3h9hijZ0W67SahQgnMpjs
 RYgXnTunQ6wo2l7nQqsyBW4J2fkeqRaQNkeqtoKLyIRAr5UfIiCM53JIYTpOy213
 vcCecd7d+T5tWQtOpCSnR7JJQO0m5+S8qk57fnGgMdMLCQzv+FD45sdWd36ilgCQ
 1+Vew3bPpw8INTsGCdKtu5Gj6eVfQ==
X-ME-Sender: <xms:3B2MXW0kmsU0zy-_Z7P01zkBX8O7Ai1J36tqTC_juulIAjTJ7-NgJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:3B2MXSe8PYv_2aZs_VFGFA-iZ_XcTVcf9hQO-x8Hb6Ef4XKC8Sdb_A>
 <xmx:3B2MXXZkR9aFaI03epBbxX5eUEKvD_OOlU5l_nmp5OictVzYFdIRmg>
 <xmx:3B2MXXVIqI1AbxVXZT8HoPtBZHjyQiiQyco64fZiRoZrDUaLQQeezg>
 <xmx:3R2MXZX781vyAJtTOLUhR5Ax_Rjul0FUKa9zDV0usVqPamji4f5XaA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F38DEE00A5; Wed, 25 Sep 2019 22:09:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <6a83af7b-6bb1-459b-a75b-b84a006524bd@www.fastmail.com>
In-Reply-To: <20190925124239.27897-12-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-12-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:40:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_11/13]_mtd:_spi-nor:_aspeed:_Introduc?=
 =?UTF-8?Q?e_a_HCLK_mask_for_training?=
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
> The AST2600 handles more HCLK divisors than its predecessors.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
> index 768394068bd4..c6a80fdf51ef 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -41,6 +41,7 @@ struct aspeed_smc_info {
>  	u8 we0;			/* shift for write enable bit for CE0 */
>  	u8 ctl0;		/* offset in regs of ctl for CE0 */
>  	u8 timing;		/* offset in regs of timing */
> +	u32 hclk_mask;          /* clock frequency mask in CEx Control reg *=
/
>  	u32 hdiv_max;           /* Max HCLK divisor on read timing reg */
> =20
>  	void (*set_4b)(struct aspeed_smc_chip *chip);
> @@ -75,6 +76,7 @@ static const struct aspeed_smc_info fmc_2400_info =3D=
 {
>  	.we0 =3D 16,
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
> +	.hclk_mask =3D 0xfffff0ff,
>  	.hdiv_max =3D 1,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> @@ -91,6 +93,7 @@ static const struct aspeed_smc_info spi_2400_info =3D=
 {
>  	.we0 =3D 0,
>  	.ctl0 =3D 0x04,
>  	.timing =3D 0x14,
> +	.hclk_mask =3D 0xfffff0ff,
>  	.hdiv_max =3D 1,
>  	.set_4b =3D aspeed_smc_chip_set_4b_spi_2400,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> @@ -105,6 +108,7 @@ static const struct aspeed_smc_info fmc_2500_info =
=3D=20
> {
>  	.we0 =3D 16,
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
> +	.hclk_mask =3D 0xfffff0ff,
>  	.hdiv_max =3D 1,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> @@ -121,6 +125,7 @@ static const struct aspeed_smc_info spi_2500_info =
=3D=20
> {
>  	.we0 =3D 16,
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
> +	.hclk_mask =3D 0xfffff0ff,
>  	.hdiv_max =3D 1,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
>  	.optimize_read =3D aspeed_smc_optimize_read,
> @@ -1053,7 +1058,7 @@ static int aspeed_smc_optimize_read(struct=20
> aspeed_smc_chip *chip,
>  	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
> =20
>  	/* Establish our read mode with freq field set to 0 (HCLK/16) */
> -	chip->ctl_val[smc_read] =3D save_read_val & 0xfffff0ff;
> +	chip->ctl_val[smc_read] =3D save_read_val & info->hclk_mask;
> =20
>  	/* Check if calibration data is suitable */
>  	if (!aspeed_smc_check_calib_data(golden_buf, CALIBRATE_BUF_SIZE)) {
> --=20
> 2.21.0
>=20
>
