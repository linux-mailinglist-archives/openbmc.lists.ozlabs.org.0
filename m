Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6076BEA5E
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 04:03:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dyrV3Kx5zDqWF
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:03:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="n2Cp/HfC"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="B/ftOum6"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dynp3J1kzDqfX
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 12:01:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DAA0328A;
 Wed, 25 Sep 2019 22:00:59 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 22:01:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=tqCCN
 hju9HaYI3+wUh6QqeHfKz8YtNSlVG+Do8K89fg=; b=n2Cp/HfCH/+Kwm+Q/r240
 7Eyj5gme+cfYjaKSFWWz5NbpYp5QWU7PjC9TFUHnxJT6v5yAZkeVb5rIYvtu7qCh
 fGZjOqWIAoDTFDLdH1j3lXpQrG6LvLv0wlLxgv2q9j6M2ybOT+YC4CNMmoUvnJ2D
 12+iRDg5uJeEi19eRFL1dDcw6PWZRzbHsqy+ccpsz1GfpejhqiiBmu7MKnER1yHE
 WwPB2WNsE5iSJ/vuojNoC7R1nm/tG5HH4hqbFYIeX8hXjMbVO953xrwGa2nSfciu
 ibVflRMzHB5z5zgfeKSVFAIrotzd1WkozyjyoS3LoC5yOq3gJOfJAFdR4j+HTPAk
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=tqCCNhju9HaYI3+wUh6QqeHfKz8YtNSlVG+Do8K89
 fg=; b=B/ftOum6SoHMsK1qsp1lUu2IUm1qawPLNfFk/RbU27zkX6wKOnyGsUcwR
 52pT06+1kDM1TLgZzXOA1EmHhgePKq2W5FcfqLwDtGO9dD6y9P0sqqM7XfATgf41
 ZqCP5QTPEbn+y4Gr+vp72PyNjN6zxXcvUmt7QIZi2+IvSq3hUeS75MZrJwQQR2Jz
 4zlZWRQXYmt1qYBFM/4RoL4mUSrtnmmgJgVGiny9E9erlUqV+2ahSEBvBjF7M7xL
 bAPmRLHytStTNRpRTgnFkzE3DtRehQkM8+n9pMi0ycJQP42gBwg1iznq+RHucJck
 mciQoljx4A6+2g1XfLwFCe6PUzvCA==
X-ME-Sender: <xms:2xuMXRxGlmOipcGIIQDlByWCBgrL2b3ZEp1gjjL5JYnmiXmImhHmwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:2xuMXb8HdjJlkbA2ljRwtgIIceHBtdBNorFzOuvzdwyhHQ1wdbEfiQ>
 <xmx:2xuMXUCwzPpMEo_3MN9aNp3OIq7f7OrZ52Sr_4WQpbQ42XKhMb3raw>
 <xmx:2xuMXaotdmTQwG3kViMleMM1EqnaEN-4z8JZUHkFsKhFdD49KngFTg>
 <xmx:2xuMXaR3xvUqmv3tRHZW0WmJZeom169xr-UZGiIFMXFQnu23-061DQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1D3E7E00A3; Wed, 25 Sep 2019 22:00:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <5ed9983e-c5b2-4aad-a18e-2203cf3de440@www.fastmail.com>
In-Reply-To: <20190925124239.27897-10-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-10-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:31:41 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_09/13]_mtd:_spi-nor:_aspeed:_Check_fo?=
 =?UTF-8?Q?r_disabled_segments_on_the_AST2600?=
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
> The segments can be disabled on the AST2600 (zero register value).
> CS0 is open by default but not the other CS. This is closing the
> access to the flash device in user mode and forbids scanning. For
> multiple CS, we will need firmware or a DT property to reopen the
> flash AHB window.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c=20
> b/drivers/mtd/spi-nor/aspeed-smc.c
> index 6c5ecea21882..ea9b4a157677 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -659,8 +659,15 @@ static u32 chip_set_segment(struct aspeed_smc_chi=
p=20
> *chip, u32 cs, u32 start,
>  	 * size, but take into account the possible overlap with the
>  	 * previous segment
>  	 */
> -	if (!size)
> -		size =3D info->segment_end(controller, seg_oldval) - start;
> +	if (!size) {
> +		end =3D info->segment_end(controller, seg_oldval);
> +
> +		/*
> +		 * Check for disabled segment (AST2600).
> +		 */
> +		if (end !=3D ahb_base_phy)
> +			size =3D end - start;
> +	}
> =20
>  	/*
>  	 * The segment cannot exceed the maximum window size of the
> @@ -689,8 +696,8 @@ static u32 chip_set_segment(struct aspeed_smc_chip=
=20
> *chip, u32 cs, u32 start,
>  		size =3D end - start;
>  	}
> =20
> -	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
> -		 cs, start, end, size >> 20);
> +	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB%s",
> +		 cs, start, end, size >> 20, size ? "" : " (disabled)");
> =20
>  	return size;
>  }
> --=20
> 2.21.0
>=20
>
