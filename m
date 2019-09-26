Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B009BEA47
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 03:43:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dyP770xSzDqdj
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:43:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BPAMiQWm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nc1qmY6W"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dyGz11zszDqD8
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:37:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7F485635;
 Wed, 25 Sep 2019 21:37:44 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=eLUZ9
 BwkxUIYVNhkreXYvX/CbcnZjdcZAVVYq4e9/y4=; b=BPAMiQWmGQiN2aNo3IvV9
 neaUWqRk5lNRuAhBs0eryV105aGwTfPKM6Ts3tcfMyt3Fuy436oE4kitLeiJfAYE
 hepyuwElwOMdMmzaRM/mVbY/9xhu5PuyHtzUdySBAY7MhonQjtRSN275SxYdhCXL
 VgdOY0qhMT0k8k0swytZZv14Y16RR4oJ8MepcQmA6gbwjZ5oVoZCLQOgWEoUU9M7
 2nWU91EO7VeR4tEsBcjKuRTFlIM5POZ1nYVpuDgW49y6AFTGv//cilnj494CJIHw
 MGn2UmtjI1pmvBAGiYvDrkcYxIl9dfmVak408E4HxlVJM2spiJd0JQmcqVJSwbHJ
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=eLUZ9BwkxUIYVNhkreXYvX/CbcnZjdcZAVVYq4e9/
 y4=; b=nc1qmY6WwK2f+VS7+DIvHubSYMkzsfAm26wY8lGU7Xov7oNnwR6s9kA9b
 ar2aWHnVwVYc0YyeH7a41cqA4wJB2NuXn0Vj0dbF+BLO4ckXZQ7WG49Ot8wx6/LG
 IcqdQaXtrTdE65bCnoSCQWwLSEkqMb2cLPQuU4BzyxYtG8N9H7ur8ACEia79sH5q
 Ds8oy9GiVui8c3cFDL7uiHFgX29iAKLmxwZgDnVDxqsBWAAltwB0qPB+qj7M+q7r
 OT9/cjt86wYRepBiKR/jGqFnvgzhFQvp35tTVAv7Tj0g+N0JzvYjy42cXwhHvNjL
 7kb/7t6kOZ3TNa2kV74wTd6u8x2DA==
X-ME-Sender: <xms:ZxaMXUDMoTKQEvbilA9fhhqIuT2xzlniW099khtEeVnfnyfU-q6wUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:ZxaMXVjY7jdhqXpvoEjZWpxTaGfkVgn7aaRB_km3nmnL55z6FrvI3Q>
 <xmx:ZxaMXf3E11egNsAX1AJi_yQkIRB2JWjZ_CzNVTG0IuIY5kjgZzRTcw>
 <xmx:ZxaMXXJDiGYw26oo_IafjQb_u29J6p9HaoFWcXSnXZVgcMO2jvG8og>
 <xmx:aBaMXVxZ5dGcrX4u5-jNgnQWnUke4q9_0hShgCb3JjK1muA9guiMlw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 286FFE00A5; Wed, 25 Sep 2019 21:37:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <fb4ecaf8-6144-4738-a43f-4e97ce50b8d9@www.fastmail.com>
In-Reply-To: <20190925124239.27897-5-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-5-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:08:25 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_04/13]_ARM:_dts:_ast2600-evb:_Enable_?=
 =?UTF-8?Q?FMC_and_SPI_devices?=
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

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 24 +++++++++++++++++++++++=
+
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts=20
> b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index da8c931c7295..7bcafb027afa 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -88,3 +88,27 @@
>  &fsim0 {
>  	status =3D "okay";
>  };
> +
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "bmc";
> +		spi-max-frequency =3D <50000000>;
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "pnor";
> +		spi-max-frequency =3D <100000000>;
> +	};
> +};
> --=20
> 2.21.0
>=20
>
