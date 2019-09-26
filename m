Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E5BEA5D
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 04:01:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dypH2q3bzDqcH
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:01:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AYV4+SLq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FaXPvDZD"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dymN09v9zDqcF
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:59:48 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E03125B5;
 Wed, 25 Sep 2019 21:59:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=Bus1u
 wnz4pgSuz7iWqAg9YtgDocth0wFekjn7aESKoQ=; b=AYV4+SLqEBr8xrE5F/rb6
 Vrl1/hg6wjujAci91EntRCVLWb9DD3jqE14vx2+HOzF5492GAFnkljD9YikKh078
 gsZltnoUUXs/gMad0d3NnEuX9GJWfx2jVxFK0ig3Z/k+893ZveV17nZVyYRyC0y4
 WBPc+ZS6pUIdpLkh94pPczg/4e+Jgb/sgezRydqbx8rVuEXTgQIheiYivQ20uWsK
 bj0Yoq0XzMUBMaBvv5XVpH6Qvw1sarOUecj/+Ie2dR/DyNdz0ygFEeKcQtX4/J1D
 z/vyfpagvjBhjFQKkuXiv3K9adTE8x00eorEqW2GWxUUcncOJYBv9BeCPDwHBWCN
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Bus1uwnz4pgSuz7iWqAg9YtgDocth0wFekjn7aESK
 oQ=; b=FaXPvDZDNyCy4ioJxiHKkvwFEcCsQHwlEadnoRWCZsK237t+giGHyPXtP
 Yz8KICe9oXCXJ+JWgJps4jgmdHYakfjvEbcs9cFieJfbQOq8I6UehZaUvj21gtSY
 VwTE+ye4LJRO0DnsjEdPRCQplsjKDqWsnInMIDwaEdd9M/RWcY5HZjBO7ekoY7XW
 xdAATyfUMbTmM5rMaE4mqjruZS8T91e9FXWZbE03uofm25JHu1GybdsXV7ElROJz
 NlhKl/7Sy4T/0DataY6rRW6Yp1DoyEuG9XR8p35kEHrJlbXrzCgIGeoFIfurnV6U
 FhczrgW7PjUM4ZopHZVtyA9zHMMTg==
X-ME-Sender: <xms:kRuMXXl5a6VNf0mnJl4M3cEuEG2EmByOZrgKsp8uV3YBZVsMm8Aw2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepvd
X-ME-Proxy: <xmx:kRuMXVFBQpH5TeDMrJJVlL5LAD_Vnedc1eEEzYIn0b2YN04hXXQPOg>
 <xmx:kRuMXadOqBQMU69DA1fQsK3gRNDI4EDdVgHk7JNoET1EbZFGDrjgGQ>
 <xmx:kRuMXXaU6qKHxyoM-JmZACZEmLxqXImS9kB1sJu1_9tFUoASEM16gQ>
 <xmx:kRuMXVXy7qgVuhzfVc9R4vUvKoPODlQLEOnxiVpKSUXsehYrTDN1xg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 56078E00A5; Wed, 25 Sep 2019 21:59:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <44faf5a8-e5d4-42b3-89fd-111da12cac02@www.fastmail.com>
In-Reply-To: <20190925124239.27897-9-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-9-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:30:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_08/13]_mtd:_spi-nor:_aspeed:_add_init?=
 =?UTF-8?Q?ial_support_for_ast2600?=
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
> The Segment Registers of the AST2600 have a different encoding. A 1MB
> unit is used and the address range of a flash SPI slave is encoded
> with offsets in the overall controller window. The previous SoC
> AST2400 and AST2500 used absolute addresses. Only bits [27:20] are
> relevant and the end address is an upper bound limit.
>=20
> SPI training yet to come.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 73 +++++++++++++++++++++++++++++++=
+
>  1 file changed, 73 insertions(+)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
> index 4e768092a965..6c5ecea21882 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -115,6 +115,39 @@ static const struct aspeed_smc_info spi_2500_info=
 =3D {
>  	.segment_reg =3D aspeed_smc_segment_reg,
>  };
> =20
> +static u32 aspeed_smc_segment_start_ast2600(
> +	struct aspeed_smc_controller *controller, u32 reg);
> +static u32 aspeed_smc_segment_end_ast2600(
> +	struct aspeed_smc_controller *controller, u32 reg);
> +static u32 aspeed_smc_segment_reg_ast2600(
> +	struct aspeed_smc_controller *controller, u32 start, u32 end);
> +
> +static const struct aspeed_smc_info fmc_2600_info =3D {
> +	.maxsize =3D 256 * 1024 * 1024,
> +	.nce =3D 3,
> +	.hastype =3D false, /* SPI Only */
> +	.we0 =3D 16,
> +	.ctl0 =3D 0x10,
> +	.timing =3D 0x94,
> +	.set_4b =3D aspeed_smc_chip_set_4b,
> +	.segment_start =3D aspeed_smc_segment_start_ast2600,
> +	.segment_end =3D aspeed_smc_segment_end_ast2600,
> +	.segment_reg =3D aspeed_smc_segment_reg_ast2600,
> +};
> +
> +static const struct aspeed_smc_info spi_2600_info =3D {
> +	.maxsize =3D 256 * 1024 * 1024,
> +	.nce =3D 2,
> +	.hastype =3D false,
> +	.we0 =3D 16,
> +	.ctl0 =3D 0x10,
> +	.timing =3D 0x94,
> +	.set_4b =3D aspeed_smc_chip_set_4b,
> +	.segment_start =3D aspeed_smc_segment_start_ast2600,
> +	.segment_end =3D aspeed_smc_segment_end_ast2600,
> +	.segment_reg =3D aspeed_smc_segment_reg_ast2600,
> +};
> +
>  enum aspeed_smc_ctl_reg_value {
>  	smc_base,		/* base value without mode for other commands */
>  	smc_read,		/* command reg for (maybe fast) reads */
> @@ -249,6 +282,44 @@ static u32 aspeed_smc_segment_reg(
>  {
>  	return (((start >> 23) & 0xFF) << 16) | (((end >> 23) & 0xFF) << 24)=
;
>  }
> +
> +/*
> + * The Segment Registers of the AST2600 have a 1MB unit. The address
> + * range of a flash SPI slave is encoded with offsets in the overall
> + * controller window. The previous SoC AST2400 and AST2500 used
> + * absolute addresses. Only bits [27:20] are relevant and the end
> + * address is an upper bound limit.
> + */
> +
> +#define AST2600_SEG_ADDR_MASK 0x0ff00000
> +
> +static u32 aspeed_smc_segment_start_ast2600(
> +	struct aspeed_smc_controller *controller, u32 reg)
> +{
> +	uint32_t start_offset =3D (reg << 16) & AST2600_SEG_ADDR_MASK;
> +
> +	return controller->ahb_base_phy + start_offset;
> +}
> +
> +static u32 aspeed_smc_segment_end_ast2600(
> +	struct aspeed_smc_controller *controller, u32 reg)
> +{
> +	uint32_t end_offset =3D reg & AST2600_SEG_ADDR_MASK;
> +
> +	/* segment is disabled */
> +	if (!end_offset)
> +		return controller->ahb_base_phy;
> +
> +	return controller->ahb_base_phy + end_offset + 0x100000;
> +}
> +
> +static u32 aspeed_smc_segment_reg_ast2600(
> +	struct aspeed_smc_controller *controller, u32 start, u32 end)
> +{
> +    return ((start & AST2600_SEG_ADDR_MASK) >> 16) |
> +	    ((end - 1) & AST2600_SEG_ADDR_MASK);
> +}
> +
>  /*
>   * Switch to turn off read optimisation if needed
>   */
> @@ -536,6 +607,8 @@ static const struct of_device_id aspeed_smc_matche=
s[] =3D {
>  	{ .compatible =3D "aspeed,ast2400-spi", .data =3D &spi_2400_info },
>  	{ .compatible =3D "aspeed,ast2500-fmc", .data =3D &fmc_2500_info },
>  	{ .compatible =3D "aspeed,ast2500-spi", .data =3D &spi_2500_info },
> +	{ .compatible =3D "aspeed,ast2600-fmc", .data =3D &fmc_2600_info },
> +	{ .compatible =3D "aspeed,ast2600-spi", .data =3D &spi_2600_info },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_smc_matches);
> --=20
> 2.21.0
>=20
>
