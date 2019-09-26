Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1265ABEA7D
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 04:13:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dz4b1MVszDqmJ
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:13:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="E8JrBsRa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SMAgSj6P"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dz4170rGzDqc8
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 12:13:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 613763F7;
 Wed, 25 Sep 2019 22:13:19 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 22:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=DyMTJ
 z9/FJn6PL+Ekjsttgc+M66dqxvuqPvb7C2vQ28=; b=E8JrBsRa5HhaeWOHScKDg
 WwFpJYHOD/vd4SjSUbjH/wu0bMaYdFk2JiqgSctTAMJOP/OOIJ8+mNvp7rWd+w1+
 lfaqw8wZ63Qxri0wQ4nOSgwPYl0A+MdvDcehx4Mnp/Hok4cGM4KyT7+UknYSjnuS
 9NEWdaKB71qOMK3Gy06XgOOnJzirifdkVhJ1hgx4Qoj6ShxtE7AfTSj/B/mm3nCI
 PgjC1oOHjvwFYpXV9laYB0HBZfZtamBWm3UzRzEy0aLNXQnB1/U7kPyj9YS3vk+w
 ZYv8Q+mZlCp3BA33eYY9IbW2WzfEZSnjkWm4YP1hN0i8eBVkmY2u6jKg9xlyHOaA
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=DyMTJz9/FJn6PL+Ekjsttgc+M66dqxvuqPvb7C2vQ
 28=; b=SMAgSj6PgQU/qKorN0k60meKdXDa7xA4EdzkjZMSbv+VCdzD2X3w6cWzH
 VI5aW8iQ/emHXeE2wom0OydAA/5K/HXMgWZIyCV2vFSg6VcpK6RZFXabqbX+eMX4
 F3tr3sGMEo3Zzd9gBUQQwRImqvXEUR3hjHi0fObn86FFcC7kkouHVsADDC5yr58P
 2h4F7vQOuWk+X/y8ylq4xTdTkGDNWeG20n5rXjFMi0f1rxPot7ypPTf380CYCkUp
 8ZwVR0rC9xtB7wUAtQcpvhLz+0W9As2mtJjKLG3qysucIEF6Csx0OOj/rMxQ+09M
 Fn/mBLQcu4LYgBnrHZmhVYf25WaSQ==
X-ME-Sender: <xms:vh6MXUDZLn1brtgAJxHBIp_WretXIPCSwaBy2KKngKufKL5iT5uy0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:vh6MXdxs--wFKxsAXCLD6BqfxwNonJTu5mf8s_Kp0zb71C4TPxuyTg>
 <xmx:vh6MXXHGChqQGmit0dJar0QQJWK7WY4ncNFxN5TLwndBPnBT21TL_w>
 <xmx:vh6MXT6Mbb-dpa1bsDSkmaKE4_xy8Vfv65ky-mac4XzLJOfmD6MdNg>
 <xmx:vx6MXdaLKkfMPve5_2nJb6Pk4ktW42QfdNjaLEebNltkwBUFF2ryzA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D914FE00A5; Wed, 25 Sep 2019 22:13:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <233401e3-9b67-42e8-b9aa-bbbef424171a@www.fastmail.com>
In-Reply-To: <20190925124239.27897-14-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-14-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:44:01 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_13/13]_mtd:_spi-nor:_aspeed:_add_supp?=
 =?UTF-8?Q?ort_for_AST2600_training?=
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

Would prefer some description here, this patch gets complex. At least fo=
r me,
probably because I'm not familiar with the flash training routine.

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 68 +++++++++++++++++++++++++++++++=
+
>  1 file changed, 68 insertions(+)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
> index 48164d819a37..e9bc89755912 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -142,6 +142,9 @@ static u32 aspeed_smc_segment_end_ast2600(
>  static u32 aspeed_smc_segment_reg_ast2600(
>  	struct aspeed_smc_controller *controller, u32 start, u32 end);
> =20
> +static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip=20=

> *chip,
> +	      u32 hdiv, const u8 *golden_buf, u8 *test_buf);
> +
>  static const struct aspeed_smc_info fmc_2600_info =3D {
>  	.maxsize =3D 256 * 1024 * 1024,
>  	.nce =3D 3,
> @@ -149,7 +152,11 @@ static const struct aspeed_smc_info fmc_2600_info=
=20
> =3D {
>  	.we0 =3D 16,
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
> +	.hclk_mask =3D 0xf0fff0ff,
> +	.hdiv_max =3D 2,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
> +	.optimize_read =3D aspeed_smc_optimize_read,
> +	.calibrate =3D aspeed_smc_calibrate_reads_ast2600,
>  	.segment_start =3D aspeed_smc_segment_start_ast2600,
>  	.segment_end =3D aspeed_smc_segment_end_ast2600,
>  	.segment_reg =3D aspeed_smc_segment_reg_ast2600,
> @@ -162,7 +169,11 @@ static const struct aspeed_smc_info spi_2600_info=
=20
> =3D {
>  	.we0 =3D 16,
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
> +	.hclk_mask =3D 0xf0fff0ff,
> +	.hdiv_max =3D 2,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
> +	.optimize_read =3D aspeed_smc_optimize_read,
> +	.calibrate =3D aspeed_smc_calibrate_reads_ast2600,
>  	.segment_start =3D aspeed_smc_segment_start_ast2600,
>  	.segment_end =3D aspeed_smc_segment_end_ast2600,
>  	.segment_reg =3D aspeed_smc_segment_reg_ast2600,
> @@ -1101,6 +1112,63 @@ static int aspeed_smc_optimize_read(struct=20
> aspeed_smc_chip *chip,
>  	return 0;
>  }
> =20
> +#define TIMING_DELAY_DI         BIT(3)
> +#define TIMING_DELAY_HCYCLE_MAX     5
> +
> +static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip=20=

> *chip, u32 hdiv,
> +					      const u8 *golden_buf, u8 *test_buf)
> +{
> +	struct aspeed_smc_controller *controller =3D chip->controller;
> +	const struct aspeed_smc_info *info =3D controller->info;
> +	int hcycle;
> +	u32 shift =3D (hdiv - 2) << 3;
> +	u32 mask =3D ~(0xfu << shift);
> +	u32 fread_timing_val =3D 0;
> +
> +	for (hcycle =3D 0; hcycle <=3D TIMING_DELAY_HCYCLE_MAX; hcycle++) {
> +		int delay_ns;
> +		bool pass =3D false;
> +
> +		fread_timing_val &=3D mask;
> +		fread_timing_val |=3D hcycle << shift;
> +
> +		/* no DI input delay first  */
> +		writel(fread_timing_val, controller->regs + info->timing);
> +		pass =3D aspeed_smc_check_reads(chip, golden_buf, test_buf);
> +		dev_dbg(chip->nor.dev,
> +			"  * [%08x] %d HCLK delay, DI delay none : %s",
> +			fread_timing_val, hcycle, pass ? "PASS" : "FAIL");
> +		if (pass)
> +			return 0;
> +
> +		/* Add DI input delays  */
> +		fread_timing_val &=3D mask;
> +		fread_timing_val |=3D (TIMING_DELAY_DI | hcycle) << shift;
> +
> +		for (delay_ns =3D 0; delay_ns < 0x10; delay_ns++) {
> +			fread_timing_val &=3D ~(0xf << (4 + shift));
> +			fread_timing_val |=3D delay_ns << (4 + shift);
> +
> +			writel(fread_timing_val, controller->regs + info->timing);
> +			pass =3D aspeed_smc_check_reads(chip, golden_buf, test_buf);
> +			dev_dbg(chip->nor.dev,
> +				"  * [%08x] %d HCLK delay, DI delay %d.%dns : %s",
> +				fread_timing_val, hcycle, (delay_ns + 1)/2,
> +				(delay_ns + 1) & 1 ? 5 : 5, pass ? "PASS" : "FAIL");
> +			/*
> +			 * TODO: This is optimistic. We should look
> +			 * for a working interval and save the middle
> +			 * value in the read timing register.
> +			 */
> +			if (pass)
> +				return 0;
> +		}
> +	}
> +
> +	/* No good setting for this frequency */
> +	return -1;
> +}
> +
>  static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)=

>  {
>  	struct aspeed_smc_controller *controller =3D chip->controller;
> --=20
> 2.21.0
>=20
>
