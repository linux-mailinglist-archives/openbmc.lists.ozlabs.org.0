Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37F98CB55
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 04:45:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJK1T6XWlz30gG
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 12:45:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727837146;
	cv=none; b=AWN8wppnAI4d2t9v+wpZZyf1j6qg0WIndtGQbputlSlkE2+p9odNrokBUy0CRWM0Pwyo+g9EPZPW31PjQCA/gKkiUuMEkQ0Hf/WvDnzKDIyygTiOLiFtsWvI3S5TMH15XYPGXGuXmwtZ/PIffAQJO9SrtuQLpuNiQwhz4b7vB2SGSCBHhm/t8wBHDFDGpNk2prUdvQD4848qWrqKTXv5S07Tbx3cAtMbEjZHjWpI2g2qqrf0gUY9+R8GC+YuqUCFn3bsf31kxPJU3BgPiraA58AOfOa0TdIb0NWclqjE1Cj2FYGqwkat4hVETpoNMoSXHO2IMGv8cUfmsKbANoFGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727837146; c=relaxed/relaxed;
	bh=ZUn9UovPgHmeFFF+zpOHis/BLdKXh4bjjfAz3/zpkgg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tt1G0nIAmvP/6sWfstdRut6/TJaGoLStkgRnmN8T6AX9PmFrDHU19M7JM7aVkTrc/TtIYJrTelFdHC7GcsL6J2Whs3pze7zWl1S7rCxNBSxpq78n165H/YJmjSU5kc5MDGyEl8Vr6RVBjTFpgc0vc+gNWnr968Mf/pSXJlhP50PKcnOlYpQ6jz9ud8JahKwVxm6yKxpty6fl5fAda/yC7KRy3ZclYgRKjv6t14En/hQ6dePv7fiQ+3gB4Nm8Zw4m0tkfJYAjdDBqT2xID1Kha4QHsfjYdleLJXDFLQGWqsHZaioagdPRGpGE78tHchuDixrpdF/MRonwoy19oujBdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jZ5Ityfj; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jZ5Ityfj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJK1Q4Yczz2y66
	for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2024 12:45:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727837144;
	bh=ZUn9UovPgHmeFFF+zpOHis/BLdKXh4bjjfAz3/zpkgg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jZ5ItyfjzqHkHG4BJI0XaEm5VX2scMBhebfeXRkfxMNTrPj32sSp2GZq3PgfolvSJ
	 iLUeicqHmM4RE/mIeOjNwdHrJVoXM+DItiSnxU8F2M0Z+B0C8OwNsaiuBnMmaL8A4c
	 ht4M4PjWdlVEqc03BlIUbwf14Ohd8TwbcSnraWOTX49gx0X4aSeeVUUAjc98ag2Y4M
	 m1t/qZ3uJHJsdzE+jnIaTW1Kx633YCyMCPlse1XROs4TLTW4Brylmr5oFRMQTOUBq6
	 R+pW3ivP3sAhrMTdFwlbeymtepypAwbufkz3Lx1SfBbZQBS6iHNOaFqNiXB61tB/6u
	 ISKt5NCWru9tA==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F237964BDC;
	Wed,  2 Oct 2024 10:45:43 +0800 (AWST)
Message-ID: <965d0f005ed9a36eeaefe69d897cad44839d06cc.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add UDC nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "William A. Kennington III" <william@wkennington.com>, Tomer Maimon
	 <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>
Date: Wed, 02 Oct 2024 12:15:43 +0930
In-Reply-To: <20240925093956.2449119-1-william@wkennington.com>
References: <20240925093956.2449119-1-william@wkennington.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi William,

On Wed, 2024-09-25 at 02:39 -0700, William A. Kennington III wrote:
> The driver support was already added but we are missing the nodes in our
> common devicetree. This enables npcm7xx platforms to enable the udc
> nodes and expose USB devices endpoints.
>=20
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
>  .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 71 +++++++++++++++++++
>  .../arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi | 65 +++++++++++++++++
>  2 files changed, 136 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch=
/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> index 868454ae6bde..358b52894ac0 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> @@ -99,6 +99,11 @@ rst: rst@801000 {
>  		};
>  	};
> =20
> +	udc0_phy: usb-phy {
> +		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
> +	};
> +
>  	ahb {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> @@ -179,6 +184,72 @@ fiux: spi@fb001000 {
>  			status =3D "disabled";
>  		};
> =20
> +		udc5: udc@f0835000 {

Testing this with `make CHECK_DTBS=3Dy nuvoton/nuvoton-npcm750-evb.dtb`
causes the following additional warning:

+/home/andrew/src/kernel.org/linux/origin/build.multi_v5/arch/arm/boot/dts/=
nuvoton/nuvoton-npcm750-evb.dtb: udc@f0835000: $nodename:0: 'udc@f0835000' =
does not match '^usb(@.*)?'
+       from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yam=
l#

This is the same for all the other nodes added.

Can you please fix that up in a v2?

Andrew

> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0xf0835000 0x1000
> +			       0xfffd2800 0x800>;
> +			interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
> +		udc6: udc@f0836000 {
> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0xf0836000 0x1000
> +			       0xfffd3000 0x800>;
> +			interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
> +		udc7: udc@f0837000 {
> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0xf0837000 0x1000
> +			       0xfffd3800 0x800>;
> +			interrupts =3D <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
> +		udc8: udc@f0838000 {
> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0xf0838000 0x1000
> +			       0xfffd4000 0x800>;
> +			interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
> +		udc9: udc@f0839000 {
> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0xf0839000 0x1000
> +			       0xfffd4800 0x800>;
> +			interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			nuvoton,sysgcr =3D <&gcr>;
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
>  		apb {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi b/arch/arm/bo=
ot/dts/nuvoton/nuvoton-npcm750.dtsi
> index 30eed40b89b5..00615e7d1462 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
> @@ -58,5 +58,70 @@ gmac1: eth@f0804000 {
>  					&rg2mdio_pins>;
>  			status =3D "disabled";
>  		};
> +
> +		udc0:udc@f0830000 {
> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0x0 0xf0830000 0x0 0x1000
> +			       0x0 0xfffeb000 0x0 0x800>;
> +			interrupts =3D <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
> +		udc1:udc@f0831000 {
> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0x0 0xf0831000 0x0 0x1000
> +			       0x0 0xfffeb800 0x0 0x800>;
> +			interrupts =3D <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
> +		udc2:udc@f0832000 {
> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0x0 0xf0832000 0x0 0x1000
> +			       0x0 0xfffec000 0x0 0x800>;
> +			interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
> +		udc3:udc@f0833000 {
> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0x0 0xf0833000 0x0 0x1000
> +			       0x0 0xfffec800 0x0 0x800>;
> +			interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
> +		udc4:udc@f0834000 {
> +			compatible =3D "nuvoton,npcm750-udc";
> +			reg =3D <0x0 0xf0834000 0x0 0x1000
> +			       0x0 0xfffed000 0x0 0x800>;
> +			interrupts =3D <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM7XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
>  	};
>  };

