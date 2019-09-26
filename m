Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D706BEA72
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 04:12:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dz2f28BjzDqcP
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:12:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Yny1+lEB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bw2rlWEi"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dz2417x7zDqc8
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 12:11:39 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 787A75B4;
 Wed, 25 Sep 2019 22:11:37 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 22:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=yiREJ
 q/6y8qrTt+kPFP3d2fTunrqTgxhUjgoaW1viUM=; b=Yny1+lEB9jauxpbbps/ju
 5dtAXNccCa4uxtH9ELyg5aVMNO4rbeTCXxd1N7Nq/wtNMcSx32+Dn+RnmAOsZeDC
 +bIIRyosrlTxbM0j+TB7fO+Tz2UG1krHBQvVGlMm5zIqOFiJAvKX2ZW1JMJ5XgWG
 h1qkMic4UKTRg0IOfSR334Zrjfrxxc/zigezOLPy7GMPtVSbLD+mu8N2va7Xmk69
 B134JHsrsgYkGikmXV1mt5x+f5FmN/fe0a59FVcnql63KkqhocGnQNr7tGkbri8X
 KHIRSeHyzT5yGEmVBDf7IU3vb82XCnIbdXmAEuVFToIg/ikoS2MREwCQ5wLmpLQF
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=yiREJq/6y8qrTt+kPFP3d2fTunrqTgxhUjgoaW1vi
 UM=; b=bw2rlWEihpMZIyjmFvZSLRXbQpuXQYNmFcJPpME5edFxbUAbdaoYe7VyQ
 HcSi8nYvUlMF21yYr4SENxeM7gvroGMS7o3sXCdbHW/4fchkCByGUHjbxXCzdZ7y
 mS/i3EIUpU7ycmMsC7GcznsMsr5n6MLa2WEvwiEyi6Az2nnwgdBvusa5H0sqZSbx
 JXpW74mJPLznubZE50QrjlMM2E0AgBpmu1XIYH/BQ8i1Oey7DFMmEh1R/CCEp/4i
 Mn5XalmPzq118cYZhRM093xzuQ7s40f/IcQMw9CN12JhyyrzOK8Za3QvNYRO9MzX
 1Ql3crMUqiaB+tHZr3B5/oezxhOIA==
X-ME-Sender: <xms:Vx6MXfauK1axv49RLMlgvN53FdVkUY8SCH9vyshV8vlbqJ1qiH4Xrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:Vx6MXSp4ty-a1AS0_CZLK7GTRIXUGs6JnkBUOCSOBaY7HE9iJKibTw>
 <xmx:Vx6MXc_Sdhutz73j1GIPmKRQfhq7-CzzkygjS1TFW0ImkTKtpHikDw>
 <xmx:Vx6MXZ_F0FqWutp3fNH0fhng1s2vSY7qD7IXntb-bWpq2Z34XOar0Q>
 <xmx:WR6MXRfUvgf7_vajgAC5trIR8-Rbg2VxEiTa2zLECDpM2oplfWLURw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8F005E00A5; Wed, 25 Sep 2019 22:11:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <2b4f6932-084b-4279-8631-f03af054496a@www.fastmail.com>
In-Reply-To: <20190925124239.27897-13-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-13-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:42:17 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_12/13]_mtd:_spi-nor:_aspeed:_check_up?=
 =?UTF-8?Q?per_freq_limit_when_doing_training?=
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
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c=20
> b/drivers/mtd/spi-nor/aspeed-smc.c
> index c6a80fdf51ef..48164d819a37 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -1075,7 +1075,7 @@ static int aspeed_smc_optimize_read(struct=20
> aspeed_smc_chip *chip,
> =20
>  		/* Compare timing to max */
>  		freq =3D ahb_freq / i;
> -		if (freq >=3D max_freq)
> +		if (freq > max_freq)
>  			continue;

Heh.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> =20
>  		/* Set the timing */
> --=20
> 2.21.0
>=20
>
