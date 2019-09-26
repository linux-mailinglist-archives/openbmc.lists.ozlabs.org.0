Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A99BEA12
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 03:27:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dy2X5f94zDqjb
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:27:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lLpe4WPu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MFdWLpui"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dy1z63z1zDqgB
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:26:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1DB3E54E;
 Wed, 25 Sep 2019 21:26:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=IbBG2
 PAxUyk7OFoz99Awv0ZJj5ucruwMfXjcGG1bUAI=; b=lLpe4WPu6rFKRlBM8qbax
 kS4AmxVGDJDYES8GSZD4saFXXkvkrTfQJToV4Kf8ChdJTMWkTHg5+T5wRvCBWX1e
 LdsJ337v1gNU98JF9SFqyI0cwW85vP93URcw7QIrG7phjDqp9E1gjNH5WtN8ickM
 aftJXYrsa1HmcPObpXYiOTdc/+xwqYMN5x36UbapHfMunnxFRiQHERdKh7LHCX9j
 g3YFtswoEehCI80dbaej0KZ8j7m9M7zC2Ms6VlDIN4y5IobNnftZm+n/u+WyrCTZ
 uN4pxeo6XXXsXSFBWpOKJ4D2c5v78di8VsxJQwITM9hCWCm8vpNGiZ2bQbk9Kt/b
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=IbBG2PAxUyk7OFoz99Awv0ZJj5ucruwMfXjcGG1bU
 AI=; b=MFdWLpuiOoXyQRdcikOAIFpTuOWs95YeICifAGXdCarmJTNXcvY+F8UDI
 ah+5N+up9SArgROD5ZJAAfaVXqpFJ+EubxdRhwFs11W1Zqg/mxkQYRVIA0UJTIjq
 Ji8P/irDnduEPlPz6leb53JmvHR7IveYfjlEMzlZxOeHBk8m0qeIxIKpk3Jrlvgr
 QfCKTWGy5vbu/uoYluIwtvCcom4HnQ+b5l5ndiCe2HBl4OZLGak//BrrOpa7vI6U
 wB8Qpz+jIH95/6kplJZ71zISYcJoY/4LAjS29biSLpl9rj+AdUBu0bACTLoKISWm
 VIuQpfv8EwEPUYHDr9yLwvNAcrzzQ==
X-ME-Sender: <xms:xBOMXWEFjVx7zhK_6aa69Nd9Oo0ZBT4Qpo5hCu2rpV9JyHasZ9uFFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:xBOMXYTuhGq3hdBBbqdCSDkvRFeSoGyg9XsR-xsNzlFtPg5hbVmYpg>
 <xmx:xBOMXQcsQQFLjaSt5SXHElz05XVlqQC0ZugPJN0S44d4VvV_n98sqA>
 <xmx:xBOMXejSQ2yhc2WoSh4B0wx9XD7DRvuHRqelGkkTo0RuC971sL0dbA>
 <xmx:xBOMXZy_ADH-pdKV4ZS40Wpp6Q4IlKRC78Wb3i534mZp7iEifnsApQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 09A41E00A5; Wed, 25 Sep 2019 21:26:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <edbb08b3-7e86-44a3-9912-41e0d8ee2725@www.fastmail.com>
In-Reply-To: <20190925124239.27897-2-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-2-clg@kaod.org>
Date: Thu, 26 Sep 2019 10:57:10 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_01/13]_ARM:_dts:_aspeed-g6:_Add_FMC_a?=
 =?UTF-8?Q?nd_SPI_devices?=
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

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 79 +++++++++++++++++++++++++++++++=
+
>  1 file changed, 79 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspe=
ed-g6.dtsi
> index b4991cbe1f36..e8c335416da8 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -80,6 +80,85 @@
>  			    <0x40466000 0x2000>;
>  			};
> =20
> +		fmc: spi@1e620000 {
> +			reg =3D < 0x1e620000 0xc4
> +				0x20000000 0x10000000 >;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "aspeed,ast2600-fmc";
> +			clocks =3D <&syscon ASPEED_CLK_AHB>;
> +			status =3D "disabled";
> +			interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +			flash@0 {
> +				reg =3D < 0 >;
> +				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
> +				status =3D "disabled";
> +			};
> +			flash@1 {
> +				reg =3D < 1 >;
> +				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
> +				status =3D "disabled";
> +			};
> +			flash@2 {
> +				reg =3D < 2 >;
> +				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
> +				status =3D "disabled";
> +			};
> +		};
> +
> +		spi1: spi@1e630000 {
> +			reg =3D < 0x1e630000 0xc4
> +				0x30000000 0x10000000 >;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "aspeed,ast2600-spi";
> +			clocks =3D <&syscon ASPEED_CLK_AHB>;
> +			status =3D "disabled";
> +			flash@0 {
> +				reg =3D < 0 >;
> +				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
> +				status =3D "disabled";
> +			};
> +			flash@1 {
> +				reg =3D < 1 >;
> +				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
> +				status =3D "disabled";
> +			};
> +		};
> +
> +		spi2: spi@1e631000 {
> +			reg =3D < 0x1e631000 0xc4
> +				0x50000000 0x10000000 >;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "aspeed,ast2600-spi";
> +			clocks =3D <&syscon ASPEED_CLK_AHB>;
> +			status =3D "disabled";
> +			flash@0 {
> +				reg =3D < 0 >;
> +				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
> +				status =3D "disabled";
> +			};
> +			flash@1 {
> +				reg =3D < 1 >;
> +				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
> +				status =3D "disabled";
> +			};
> +			flash@2 {
> +				reg =3D < 2 >;
> +				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
> +				status =3D "disabled";
> +			};
> +		};
> +
>  		mdio0: mdio@1e650000 {
>  			compatible =3D "aspeed,ast2600-mdio";
>  			reg =3D <0x1e650000 0x8>;
> --=20
> 2.21.0
>=20
>
