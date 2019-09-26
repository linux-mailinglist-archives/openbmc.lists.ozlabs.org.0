Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC3BEA46
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 03:41:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dyMZ0lg5zDqdj
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:41:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="URB3Tioh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nQTvxxd9"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dyB537xLzDqkR
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:33:33 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DFCEB4FB;
 Wed, 25 Sep 2019 21:33:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=OOZmy
 DHR+DE218jmJYW+rV1BFHXoO5X1clUnPoblUcE=; b=URB3TiohsxQUuDY2DVcKg
 tHMESICl9JdsIROhR2br+9VI3FyrA+5csDD85uLrhqaxQRkkjk5lCn/rfRKqqn5f
 Y3os9kQCxxP3nyrLUX1nP/uI+97W4KRGhXO9N/G5/Ipe9N1IBigp6RlqbEzevOlX
 wQZQxAFvVWr3mBq41Ejtyh6ntsrjfvkBiPb/2baRsDxdqOVZ4claTcTy89ObxThl
 +fMS+CPeXUPqZ6H/tKVuEbAnyp8YShuvydxr/1Um5go2FN57Dr59aap3F+FFhPMH
 pNL5tOKIjMgRilLg7g43yjsBs8DnRzEhbXgz9pWCOi9Kh0LjmVndOGnmHKF3FX5W
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=OOZmyDHR+DE218jmJYW+rV1BFHXoO5X1clUnPoblU
 cE=; b=nQTvxxd9mAxSF3Kx+f794Qg7gUiYTPNhGA7tWmrhQ0CmUg6+uQM7fMo/6
 KYn91SJqK4sJ/avtYAGE+NYowUhVwsgUgI7FXKFXesRpUNxrEf65WI3sDro5SCx0
 22wF1IRfRPpZJXa0/iwxTlSGKPQfJ5dyAFPyFld8sbw9IKTGjymgf7DYp0+2a7LW
 xPc1kr16adp6v5a/zzWgIZKpDqiOBKA/NdWy9o7mbs9xvFKX8NHzlCuEuhjUQrVq
 pYTtj6Ezq0p6kTNESTT4fNokZZcRea/jFTEQmOBLCgaaHmY37B+LAnM6tFxUZ/tK
 QtHTkUU2KO+F2dw2kNPe48AQyjStA==
X-ME-Sender: <xms:aBWMXZQJ-wN-AYQS8nn0_x5M9uIVxspbUqpkWKeDN0pmvfksQKed0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:aBWMXe-3kksDyllOeC6k3rhQFSuOysi4WkY-7Hcj-eRbzvPaWsB9AA>
 <xmx:aBWMXV9x3dX3TBXTGy-esWLZ0nb6kLayq1bVWncTkUB7DvpC-nIxJA>
 <xmx:aBWMXckBRNfGinuaqK0LYHLHjOre35YarvqLwnAz_fLQ7jyCbnvCaw>
 <xmx:aRWMXUpTZgL7e8Q25hPHi-ix-x53H0c_8PsTRTyFCS3WoCNkiPKswg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 99960E00A5; Wed, 25 Sep 2019 21:33:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <3b2c92f5-ee69-4805-a0ab-fbded61135d1@www.fastmail.com>
In-Reply-To: <20190925124239.27897-3-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-3-clg@kaod.org>
Date: Thu, 26 Sep 2019 11:04:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_02/13]_ARM:_dts:_aspeed:_rainier:_Ena?=
 =?UTF-8?Q?ble_FMC_and_SPI_devices?=
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
>  arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts | 31 +++++++++++++++++++=
+
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts=20
> b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> index 485c8732eec1..5e5bc78bdce4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> @@ -444,3 +444,34 @@
>  &ibt {
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
> +
> +	flash@1 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "alt-bmc";
> +		spi-max-frequency =3D <50000000>;
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
