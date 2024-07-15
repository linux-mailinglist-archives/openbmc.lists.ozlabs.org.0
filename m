Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCEB930FB6
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 10:27:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l105uXyB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMwLG25lQz3d8x
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 18:27:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l105uXyB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMwKl3gNBz3cXD
	for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2024 18:27:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721032025;
	bh=6HDfT9a/j1eL6mcxIyZskTKJF8N3jQi2mTBlhTG3scE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l105uXyB5oucPooj0Wzd78etMbd5n6xxiGi4Adqg1oZj5FzWK4yGDBPsh9IpXodzW
	 9J6H04KbcOtLK4YqzfDkpkSYlSVGAG15OLYy3Q/bwRPrkCc0XFnj9YmyiqtTi2KqVD
	 btCJxPYO2nE0KxFbIg//yydqGD30pPkL4LqYw3WoVz421gX8/zV3BAJ7L8maZPIHXV
	 xB34n4dLf1jd/i4JijXVEi5Jinqr9DL+k5NsriFiRWhkI7CrdwzBGhXvtSKxfzQ/m3
	 J4yUla0ehctzyBilT6mszVsZ/wwUMub4AioSJ8yTrpXtuEMPK0w6WXTbMHQTb7r6z2
	 pyJrb10wiITng==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B842654EA;
	Mon, 15 Jul 2024 16:27:05 +0800 (AWST)
Message-ID: <6f4f65d942b156daee15ee493c2bacb87f1ff466.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 3/3] arm64: dts: nuvoton: npcm8xx: add
 modules node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Mon, 15 Jul 2024 16:27:05 +0800
In-Reply-To: <20240714152617.3055768-3-tmaimon77@gmail.com>
References: <20240714152617.3055768-1-tmaimon77@gmail.com>
	 <20240714152617.3055768-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 2024-07-14 at 18:26 +0300, Tomer Maimon wrote:
> Add the following modules nodes to Nuvoton NPCM8xx BMC device tree:

So we seem to be missing bindings for the following nodes:

> - GMAC.
> - OHCI=C2=A0
> - PCIe.
> - KCS.
> - eSPI.
> - JTAG master.

Can you chop these out of the patch, or send the bindings for these
nodes as part of the series, along with links to the corresponding
upstream patch series?

Also:

> - BPC.

What's BPC? I failed to map it to a node below, but possibly I didn't
look closely enough.

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 918 +++++++++++++++++-
>  .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     | 162 ++++
>  2 files changed, 1075 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/ar=
ch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> index 8aef313a6ff6..d733509cab90 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> @@ -21,6 +21,23 @@ soc {
>  		gcr: system-controller@f0800000 {
>  			compatible =3D "nuvoton,npcm845-gcr", "syscon";
>  			reg =3D <0x0 0xf0800000 0x0 0x1000>;
> +			udc9_mux: mux-controller {
> +				compatible =3D "mmio-mux";
> +				#mux-control-cells =3D <1>;
> +				mux-reg-masks =3D <0x9C 0x3000>;
> +				idle-states =3D <0x3000>;
> +			};
> +		};
> +
> +		rst: system-controller@f0801000 {
> +			compatible =3D "nuvoton,npcm845-rst", "syscon";
> +			reg =3D <0x0 0xf0801000 0x0 0xC4>;
> +		};
> +
> +		fuse:fuse@f0189000 {
> +			compatible =3D "nuvoton,npcm845-fuse", "syscon",
> +				"simple-mfd";
> +			reg =3D <0x0 0xf0189000 0x0 0x1000>;
>  		};
> =20
>  		gic: interrupt-controller@dfff9000 {
> @@ -39,6 +56,12 @@ ppi_cluster0: interrupt-partition-0 {
>  				};
>  			};
>  		};
> +
> +		spswc: spswc@f0800038 {
> +			compatible =3D "nuvoton,npcm-sp-ctrl";
> +			reg =3D <0x0 0xf0800038 0x0 0x4>;
> +		};
> +
>  	};
> =20
>  	ahb {
> @@ -62,15 +85,276 @@ clk: clock-controller@f0801000 {
>  			clocks =3D <&refclk>;
>  		};
> =20
> +		gmac0: eth@f0802000 {
> +			device_type =3D "network";
> +			compatible =3D "nuvoton,npcm-dwmac";
> +			reg =3D <0x0 0xf0802000 0x0 0x2000>,
> +				<0x0 0xf0780000 0x0 0x200>;
> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "macirq";
> +			clocks	=3D <&clk NPCM8XX_CLK_AHB>;
> +			clock-names =3D "stmmaceth";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&sg1mdio_pins>;
> +			status =3D "disabled";
> +		};
> +
> +		gmac1: eth@f0804000 {
> +			device_type =3D "network";
> +			compatible =3D "snps,dwmac";
> +			reg =3D <0x0 0xf0804000 0x0 0x2000>;
> +			interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "macirq";
> +			clocks	=3D <&clk NPCM8XX_CLK_AHB>;
> +			clock-names =3D "stmmaceth";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&rg2_pins
> +					&rg2mdio_pins>;
> +			status =3D "disabled";
> +		};
> +
> +		gmac2: eth@f0806000 {
> +			device_type =3D "network";
> +			compatible =3D "snps,dwmac";
> +			reg =3D <0x0 0xf0806000 0x0 0x2000>;
> +			interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "macirq";
> +			clocks	=3D <&clk NPCM8XX_CLK_AHB>;
> +			clock-names =3D "stmmaceth";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&r1_pins
> +					&r1err_pins
> +					&r1md_pins>;
> +			status =3D "disabled";
> +		};
> +
> +		gmac3: eth@f0808000 {
> +			device_type =3D "network";
> +			compatible =3D "snps,dwmac";
> +			reg =3D <0x0 0xf0808000 0x0 0x2000>;
> +			interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "macirq";
> +			clocks	=3D <&clk NPCM8XX_CLK_AHB>;
> +			clock-names =3D "stmmaceth";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&r2_pins
> +					&r2err_pins
> +					&r2md_pins>;
> +			status =3D "disabled";
> +		};
> +
> +		ehci1: usb@f0828100 {
> +			compatible =3D "nuvoton,npcm750-ehci";
> +			reg =3D <0x0 0xf0828100 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +		};
> +
> +		ehci2: usb@f082a100 {
> +			compatible =3D "nuvoton,npcm750-ehci";
> +			reg =3D <0x0 0xf082a100 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +		};
> +
> +		ohci1: usb@f0829000 {
> +			compatible =3D "nuvoton,npcm750-ohci", "generic-ohci";
> +			reg =3D <0x0 0xf0829000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +		};
> +
> +		ohci2: usb@f082b000 {
> +			compatible =3D "nuvoton,npcm750-ohci", "generic-ohci";
> +			reg =3D <0x0 0xf082b000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +		};
> +
> +		sdhci: mmc@f0842000 {
> +			compatible =3D "nuvoton,npcm845-sdhci";
> +			reg =3D <0x0 0xf0842000 0x0 0x100>;
> +			interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D  <&clk NPCM8XX_CLK_AHB>;
> +			clock-names =3D "clk_mmc";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc8_pins
> +				     &mmc_pins>;
> +			status =3D "disabled";
> +		};
> +
> +		pcie: pcie@e1000000 {
> +			compatible =3D "nuvoton,npcm845-pcie";
> +			device_type =3D "pci";
> +			reg =3D <0x0 0xE1000000 0x0 0x1000>,
> +				<0x0 0xE8000000 0x0 0x1000>;
> +			bus-range =3D <0x0 0xF>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			#interrupt-cells =3D <1>;
> +			ranges =3D <0x01000000 0 0xe9000000 0x0 0xe9000000 0 0x01000000
> +				0x02000000 0 0xea000000 0x0 0xea000000 0 0x04000000>;
> +			resets =3D <&rstc 0x34 15>;
> +			interrupts =3D <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask =3D <0 0 0 7>;
> +			interrupt-map =3D <0 0 0 1 &gic GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +			nuvoton,sysgcr =3D <&gcr>;
> +		};
> +
> +		fiu0: spi@fb000000 {
> +			compatible =3D "nuvoton,npcm845-fiu";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0x0 0xfb000000 0x0 0x1000>,
> +			<0x0 0x80000000 0x0 0x10000000>;
> +			reg-names =3D "control", "memory";
> +			clocks =3D <&clk NPCM8XX_CLK_SPI0>;
> +			clock-names =3D "clk_ahb";
> +			status =3D "disabled";
> +		};
> +
> +		fiu1: spi@fb002000 {
> +			compatible =3D "nuvoton,npcm845-fiu";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0x0 0xfb002000 0x0 0x1000>,
> +			<0x0 0x90000000 0x0 0x4000000>;
> +			reg-names =3D "control", "memory";
> +			clocks =3D <&clk NPCM8XX_CLK_SPI1>;
> +			clock-names =3D "clk_spi1";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&spi1_pins>;
> +			status =3D "disabled";
> +		};
> +
> +		fiu3: spi@c0000000 {
> +			compatible =3D "nuvoton,npcm845-fiu";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0x0 0xc0000000 0x0 0x1000>,
> +			<0x0 0xA0000000 0x0 0x20000000>;
> +			reg-names =3D "control", "memory";
> +			clocks =3D <&clk NPCM8XX_CLK_SPI3>;
> +			clock-names =3D "clk_spi3";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&spi3_pins>;
> +			status =3D "disabled";
> +		};
> +
> +		fiux: spi@fb001000 {
> +			compatible =3D "nuvoton,npcm845-fiu";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0x0 0xfb001000 0x0 0x1000>,
> +			<0x0 0xf8000000 0x0 0x2000000>;
> +			reg-names =3D "control", "memory";
> +			clocks =3D <&clk NPCM8XX_CLK_SPIX>;
> +			clock-names =3D "clk_ahb";
> +			status =3D "disabled";
> +		};
> +
> +		pcimbox: pcimbox@f0848000 {
> +			compatible =3D "nuvoton,npcm845-pci-mbox", "nuvoton,npcm750-pci-mbox"=
,
> +					"simple-mfd", "syscon";
> +			reg =3D <0x0 0xf084C000 0x0 0x8
> +				0x0 0xf0848000 0x0 0x3F00>;
> +			interrupts =3D <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		vcd: vcd@f0810000 {
> +			compatible =3D "nuvoton,npcm845-vcd";
> +			reg =3D <0x0 0xf0810000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +			resets =3D <&rstc 0x24 14>;
> +			nuvoton,sysgcr =3D <&gcr>;
> +			nuvoton,sysgfxi =3D <&gfxi>;
> +			nuvoton,ece =3D <&ece>;
> +			status =3D "disabled";
> +		};
> +
> +		ece: video-codec@f0820000 {
> +			compatible =3D "nuvoton,npcm845-ece";
> +			reg =3D <0x0 0xf0820000 0x0 0x2000>;
> +			interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +			resets =3D <&rstc 0x24 13>;
> +			status =3D "disabled";
> +		};
> +
>  		apb {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			compatible =3D "simple-bus";
>  			interrupt-parent =3D <&gic>;
>  			ranges =3D <0x0 0x0 0xf0000000 0x00300000>,
> -				<0xfff00000 0x0 0xfff00000 0x00016000>;
> +				<0xfff00000 0x0 0xfff00000 0x00016000>,
> +				<0xf0800000 0x0 0xf0800000 0x00060000>;
> +
> +			lpc_kcs: lpc_kcs@7000 {
> +				compatible =3D "nuvoton,npcm845-lpc-kcs",
> +						"simple-mfd", "syscon";
> +				reg =3D <0x7000 0x40>;
> +				reg-io-width =3D <1>;
> +
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +				ranges =3D <0x0 0x7000 0x40>;
> +
> +				kcs1: kcs1@0 {
> +					compatible =3D "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"=
;
> +					reg =3D <0x0 0x40>;
> +					interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +					kcs_chan =3D <1>;
> +					status =3D "disabled";
> +				};
> =20
> -			peci: peci-controller@100000 {

No compatible? Did you test this with `make dtbs_check`?

> +				kcs2: kcs2@0 {
> +					compatible =3D "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"=
;
> +					reg =3D <0x0 0x40>;
> +					interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +					kcs_chan =3D <2>;
> +					status =3D "disabled";
> +				};
> +
> +				kcs3: kcs3@0 {
> +					compatible =3D "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"=
;
> +					reg =3D <0x0 0x40>;
> +					interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +					kcs_chan =3D <3>;
> +					status =3D "disabled";
> +				};
> +			};
> +
> +			lpc_host: lpc_host@7000 {
> +				compatible =3D "nuvoton,npcm845-lpc-host",
> +						"simple-mfd", "syscon";
> +				reg =3D <0x7000 0x60>;
> +
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +				ranges =3D <0x0 0x7000 0x60>;
> +
> +				lpc_bpc: lpc_bpc@40 {
> +					compatible =3D "nuvoton,npcm845-lpc-bpc", "nuvoton,npcm750-lpc-bpc"=
;
> +					reg =3D <0x40 0x20>;
> +					interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +					status =3D "disabled";
> +				};
> +			};
> +
> +			espi: espi@9f000 {
> +				compatible =3D "nuvoton,npcm845-espi",
> +						"simple-mfd", "syscon";
> +				reg =3D <0x9f000 0x1000>;
> +				vw_gpio: vw_gpio {
> +					compatible =3D "nuvoton,npcm845-espi-vwgpio";
> +					interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +					gpio-controller;
> +					#gpio-cells =3D <2>;
> +					status =3D "disabled";
> +				};
> +			};
> +
> +			peci0: peci-controller@100000 {

Didn't we define this one above? Should they be merged?

>  				compatible =3D "nuvoton,npcm845-peci";
>  				reg =3D <0x100000 0x1000>;
>  				interrupts =3D <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> @@ -79,6 +363,48 @@ peci: peci-controller@100000 {
>  				status =3D "disabled";
>  			};
> =20
> +			pspi: spi@201000 {
> +				compatible =3D "nuvoton,npcm845-pspi";
> +				reg =3D <0x201000 0x1000>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&pspi_pins>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk NPCM8XX_CLK_APB5>;
> +				clock-names =3D "clk_apb5";
> +				resets =3D <&rstc 0x24 23>;
> +				status =3D "disabled";
> +			};
> +
> +			jtm1: jtm@208000 {
> +				compatible =3D "nuvoton,npcm845-jtm";
> +				reg =3D <0x208000 0x1000>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&jm1_pins>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				interrupts =3D <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk NPCM8XX_CLK_APB5>;
> +				clock-names =3D "clk_apb5";
> +				resets =3D <&rstc 0x74 29>;
> +				status =3D "disabled";
> +			};
> +
> +			jtm2: jtm@209000 {
> +				compatible =3D "nuvoton,npcm845-jtm";
> +				reg =3D <0x209000 0x1000>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&jm2_pins>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				interrupts =3D <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk NPCM8XX_CLK_APB5>;
> +				clock-names =3D "clk_apb5";
> +				resets =3D <&rstc 0x74 30>;
> +				status =3D "disabled";
> +			};
> +
>  			timer0: timer@8000 {
>  				compatible =3D "nuvoton,npcm845-timer";
>  				interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> @@ -126,27 +452,50 @@ serial3: serial@3000 {
>  			serial4: serial@4000 {
>  				compatible =3D "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
>  				reg =3D <0x4000 0x1000>;
> -				clocks =3D <&clk NPCM8XX_CLK_UART>;
> +				clocks =3D <&clk NPCM8XX_CLK_UART2>;
>  				interrupts =3D <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
>  				reg-shift =3D <2>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&bu4_pins>;
>  				status =3D "disabled";
>  			};
> =20
>  			serial5: serial@5000 {
>  				compatible =3D "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
>  				reg =3D <0x5000 0x1000>;
> -				clocks =3D <&clk NPCM8XX_CLK_UART>;
> +				clocks =3D <&clk NPCM8XX_CLK_UART2>;
>  				interrupts =3D <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
>  				reg-shift =3D <2>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&bu5_pins>;
>  				status =3D "disabled";
>  			};
> =20
>  			serial6: serial@6000 {
>  				compatible =3D "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
>  				reg =3D <0x6000 0x1000>;
> -				clocks =3D <&clk NPCM8XX_CLK_UART>;
> +				clocks =3D <&clk NPCM8XX_CLK_UART2>;

The UART clock changes seem somewhat unrelated and probably deserve
their own patch?

>  				interrupts =3D <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
>  				reg-shift =3D <2>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&bu6_pins>;
> +				status =3D "disabled";

This too.

Andrew

