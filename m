Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A42FEFED
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 17:15:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM6tY36MGzDrQq
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 03:15:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JhHcaH6l; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM6sQ5vSjzDrBY
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2021 03:14:15 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id w124so2664777oia.6
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 08:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TBagkqmFq+Hcc8qhZMAUQAGKIsl7z7Y2VTUSgDHH17g=;
 b=JhHcaH6lLrB3s9OgW8wtG1G1J1z8Zm0GfVd9/PiKKGUStTN6x3V5qI7BXXDGdyzAPu
 lJv9E7iXZYXPm6IBiGOcOuhbmnCRnSproyJM6xksAR57RYnLe2/BPGl09Nb7JSBNsRiZ
 kfHtKOO3WISJGGkcFrbP6FcnKr2PntyPnfUJ6+5UVGNzfGlJw4rQ1e+szYdznpB0njAZ
 oGjhyVVpBztlqjHlmhG9dnxfJbcrjeKarCCTAbtwBGXVxRwwCf0m6xCFO5BfpNutesdk
 SbvbSqooGvi16n2T9OS8FiEYPf8j/UFZsMS8+OqZypTs+CQ2nV0iZJQprjoraydgbiiP
 lKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TBagkqmFq+Hcc8qhZMAUQAGKIsl7z7Y2VTUSgDHH17g=;
 b=IS2ngS+ocVzsLTr97k16SJAf4d4V/buNzU0TfUGaW7uzCAHqBTI3p9GGMDMlmVNRHl
 fwNFDi81bzeW1h3nWqMtLOLVeDEoFoAB7gwnvX1Z0RNBzZ39U8GfbNuCFpFVo8JQb5yc
 7ovn0ukphnEJWSHq3T3We7SjQjmX61qffIdrov222YYBNnlrxMiJpT0czshxv4wOp5I5
 ett3mAB6fTeSz1Rvuhnr6S2ogOLJsH2DikLzh5pcszfB7XBg7iFS0YPS7rF79wB64Qje
 JY7xZi2QTRGnqypTfRdyV3HIZAe0rWhf5cnjjxkCVvbO8tkeBEBwuhSyw62KJsOYgYUE
 nUFw==
X-Gm-Message-State: AOAM5329cOVQ0FiE/QUu79dunYQ4sf73msunjiYw0+0jCKnStM+vAf08
 b7xi0qxFDU5tPFSDlktaN8pJScO4zuJYVA==
X-Google-Smtp-Source: ABdhPJxV23VpJ4wQ3ZGw/aXbki2sMJnA/KXIBh/H83MMAap00vtb0qzbzGp0XYYj3rjqEOPEiMZJGg==
X-Received: by 2002:aca:480c:: with SMTP id v12mr237983oia.78.1611245650721;
 Thu, 21 Jan 2021 08:14:10 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:e93d:30e5:84f3:36c3])
 by smtp.gmail.com with ESMTPSA id 36sm1111184oty.62.2021.01.21.08.14.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 08:14:09 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH linux dev-5.8] ARM: dts: Aspeed: Add Everest BMC machine
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20201211170704.27640-1-eajames@linux.ibm.com>
Date: Thu, 21 Jan 2021 10:14:09 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <866F0F3F-BFA0-4DDB-AF92-8C1E1B16EE66@gmail.com>
References: <20201211170704.27640-1-eajames@linux.ibm.com>
To: Eddie James <eajames@linux.ibm.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Dec 11, 2020, at 11:07 AM, Eddie James <eajames@linux.ibm.com> =
wrote:
>=20
> Add the Everest machine powered by an AST2600 chip. Copy the basic
> configuration from Rainier.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> arch/arm/boot/dts/Makefile                   |   1 +
> arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 775 +++++++++++++++++++
> 2 files changed, 776 insertions(+)
> create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5fd12e8909d3..c13ac1bf7216 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1360,6 +1360,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> 	aspeed-bmc-facebook-wedge100.dtb \
> 	aspeed-bmc-facebook-yamp.dtb \
> 	aspeed-bmc-facebook-yosemitev2.dtb \
> +	aspeed-bmc-ibm-everest.dtb \
> 	aspeed-bmc-ibm-rainier.dtb \
> 	aspeed-bmc-ibm-rainier-4u.dtb \
> 	aspeed-bmc-intel-s2600wf.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> new file mode 100644
> index 000000000000..6bd876657bb8
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -0,0 +1,775 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2020 IBM Corp.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +	model =3D "Everest";
> +	compatible =3D "ibm,everest-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		i2c100 =3D &cfam0_i2c0;
> +		i2c101 =3D &cfam0_i2c1;
> +		i2c110 =3D &cfam0_i2c10;
> +		i2c111 =3D &cfam0_i2c11;
> +		i2c112 =3D &cfam0_i2c12;
> +		i2c113 =3D &cfam0_i2c13;
> +		i2c114 =3D &cfam0_i2c14;
> +		i2c115 =3D &cfam0_i2c15;
> +		i2c202 =3D &cfam1_i2c2;
> +		i2c203 =3D &cfam1_i2c3;
> +		i2c210 =3D &cfam1_i2c10;
> +		i2c211 =3D &cfam1_i2c11;
> +		i2c214 =3D &cfam1_i2c14;
> +		i2c215 =3D &cfam1_i2c15;
> +		i2c216 =3D &cfam1_i2c16;
> +		i2c217 =3D &cfam1_i2c17;
> +		i2c300 =3D &cfam2_i2c0;
> +		i2c301 =3D &cfam2_i2c1;
> +		i2c310 =3D &cfam2_i2c10;
> +		i2c311 =3D &cfam2_i2c11;
> +		i2c312 =3D &cfam2_i2c12;
> +		i2c313 =3D &cfam2_i2c13;
> +		i2c314 =3D &cfam2_i2c14;
> +		i2c315 =3D &cfam2_i2c15;
> +		i2c402 =3D &cfam3_i2c2;
> +		i2c403 =3D &cfam3_i2c3;
> +		i2c410 =3D &cfam3_i2c10;
> +		i2c411 =3D &cfam3_i2c11;
> +		i2c414 =3D &cfam3_i2c14;
> +		i2c415 =3D &cfam3_i2c15;
> +		i2c416 =3D &cfam3_i2c16;
> +		i2c417 =3D &cfam3_i2c17;
> +
> +		serial4 =3D &uart5;
> +
> +		spi10 =3D &cfam0_spi0;
> +		spi11 =3D &cfam0_spi1;
> +		spi12 =3D &cfam0_spi2;
> +		spi13 =3D &cfam0_spi3;
> +		spi20 =3D &cfam1_spi0;
> +		spi21 =3D &cfam1_spi1;
> +		spi22 =3D &cfam1_spi2;
> +		spi23 =3D &cfam1_spi3;
> +		spi30 =3D &cfam2_spi0;
> +		spi31 =3D &cfam2_spi1;
> +		spi32 =3D &cfam2_spi2;
> +		spi33 =3D &cfam2_spi3;
> +		spi40 =3D &cfam3_spi0;
> +		spi41 =3D &cfam3_spi1;
> +		spi42 =3D &cfam3_spi2;
> +		spi43 =3D &cfam3_spi3;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &uart5;
> +		bootargs =3D "console=3DttyS4,115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		/* LPC FW cycle bridge region requires natural alignment =
*/
> +		flash_memory: region@b8000000 {
> +			no-map;
> +			reg =3D <0xb8000000 0x04000000>; /* 64M */
> +		};
> +
> +		/* 48MB region from the end of flash to start of vga =
memory */
> +		ramoops@bc000000 {
> +			compatible =3D "ramoops";
> +			reg =3D <0xbc000000 0x180000>; /* 16 * (3 * =
0x8000) */
> +			record-size =3D <0x8000>;
> +			console-size =3D <0x8000>;
> +			pmsg-size =3D <0x8000>;
> +			max-reason =3D <3>; /* KMSG_DUMP_EMERG */
> +		};
> +
> +		/* VGA region is dictated by hardware strapping */
> +		vga_memory: region@bf000000 {
> +			no-map;
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0xbf000000 0x01000000>; /* 16M */
> +		};
> +	};
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&emmc_controller {
> +	status =3D "okay";
> +};
> +
> +&pinctrl_emmc_default {
> +	bias-disable;
> +};
> +
> +&emmc {
> +	status =3D "okay";
> +};
> +
> +&fsim0 {
> +	status =3D "okay";
> +
> +	#address-cells =3D <2>;
> +	#size-cells =3D <0>;
> +
> +	/*
> +	 * CFAM Reset is supposed to be active low but pass1 hardware is =
wired
> +	 * active high.
> +	 */
> +	cfam-reset-gpios =3D <&gpio0 ASPEED_GPIO(Q, 0) =
GPIO_ACTIVE_HIGH>;
> +
> +	cfam@0,0 {
> +		reg =3D <0 0>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		chip-id =3D <0>;
> +
> +		scom@1000 {
> +			compatible =3D "ibm,fsi2pib";
> +			reg =3D <0x1000 0x400>;
> +		};
> +
> +		i2c@1800 {
> +			compatible =3D "ibm,fsi-i2c-master";
> +			reg =3D <0x1800 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cfam0_i2c0: i2c-bus@0 {
> +				reg =3D <0>;	/* OMI01 */
> +			};
> +
> +			cfam0_i2c1: i2c-bus@1 {
> +				reg =3D <1>;	/* OMI23 */
> +			};
> +
> +			cfam0_i2c10: i2c-bus@a {
> +				reg =3D <10>;	/* OP3A */
> +			};
> +
> +			cfam0_i2c11: i2c-bus@b {
> +				reg =3D <11>;	/* OP3B */
> +			};
> +
> +			cfam0_i2c12: i2c-bus@c {
> +				reg =3D <12>;	/* OP4A */
> +			};
> +
> +			cfam0_i2c13: i2c-bus@d {
> +				reg =3D <13>;	/* OP4B */
> +			};
> +
> +			cfam0_i2c14: i2c-bus@e {
> +				reg =3D <14>;	/* OP5A */
> +			};
> +
> +			cfam0_i2c15: i2c-bus@f {
> +				reg =3D <15>;	/* OP5B */
> +			};
> +		};
> +
> +		fsi2spi@1c00 {
> +			compatible =3D "ibm,fsi2spi";
> +			reg =3D <0x1c00 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cfam0_spi0: spi@0 {
> +				reg =3D <0x0>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam0_spi1: spi@20 {
> +				reg =3D <0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam0_spi2: spi@40 {
> +				reg =3D <0x40>;
> +				compatible =3D "ibm,fsi2spi-restricted";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam0_spi3: spi@60 {
> +				reg =3D <0x60>;
> +				compatible =3D "ibm,fsi2spi-restricted";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +		};
> +
> +		sbefifo@2400 {
> +			compatible =3D "ibm,p9-sbefifo";
> +			reg =3D <0x2400 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			fsi_occ0: occ {
> +				compatible =3D "ibm,p10-occ";
> +			};
> +		};
> +
> +		fsi_hub0: hub@3400 {
> +			compatible =3D "fsi-master-hub";
> +			reg =3D <0x3400 0x400>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <0>;
> +		};
> +	};
> +};
> +
> +&fsi_hub0 {
> +	cfam@1,0 {
> +		reg =3D <1 0>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		chip-id =3D <1>;
> +
> +		scom@1000 {
> +			compatible =3D "ibm,fsi2pib";
> +			reg =3D <0x1000 0x400>;
> +		};
> +
> +		i2c@1800 {
> +			compatible =3D "ibm,fsi-i2c-master";
> +			reg =3D <0x1800 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cfam1_i2c2: i2c-bus@2 {
> +				reg =3D <2>;	/* OMI45 */
> +			};
> +
> +			cfam1_i2c3: i2c-bus@3 {
> +				reg =3D <3>;	/* OMI67 */
> +			};
> +
> +			cfam1_i2c10: i2c-bus@a {
> +				reg =3D <10>;	/* OP3A */
> +			};
> +
> +			cfam1_i2c11: i2c-bus@b {
> +				reg =3D <11>;	/* OP3B */
> +			};
> +
> +			cfam1_i2c14: i2c-bus@e {
> +				reg =3D <14>;	/* OP5A */
> +			};
> +
> +			cfam1_i2c15: i2c-bus@f {
> +				reg =3D <15>;	/* OP5B */
> +			};
> +
> +			cfam1_i2c16: i2c-bus@10 {
> +				reg =3D <16>;	/* OP6A */
> +			};
> +
> +			cfam1_i2c17: i2c-bus@11 {
> +				reg =3D <17>;	/* OP6B */
> +			};
> +		};
> +
> +		fsi2spi@1c00 {
> +			compatible =3D "ibm,fsi2spi";
> +			reg =3D <0x1c00 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cfam1_spi0: spi@0 {
> +				reg =3D <0x0>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam1_spi1: spi@20 {
> +				reg =3D <0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam1_spi2: spi@40 {
> +				reg =3D <0x40>;
> +				compatible =3D "ibm,fsi2spi-restricted";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam1_spi3: spi@60 {
> +				reg =3D <0x60>;
> +				compatible =3D "ibm,fsi2spi-restricted";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +		};
> +
> +		sbefifo@2400 {
> +			compatible =3D "ibm,p9-sbefifo";
> +			reg =3D <0x2400 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			fsi_occ1: occ {
> +				compatible =3D "ibm,p10-occ";
> +			};
> +		};
> +
> +		fsi_hub1: hub@3400 {
> +			compatible =3D "fsi-master-hub";
> +			reg =3D <0x3400 0x400>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <0>;
> +
> +			no-scan-on-init;
> +		};
> +	};
> +
> +	cfam@2,0 {
> +		reg =3D <2 0>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		chip-id =3D <2>;
> +
> +		scom@1000 {
> +			compatible =3D "ibm,fsi2pib";
> +			reg =3D <0x1000 0x400>;
> +		};
> +
> +		i2c@1800 {
> +			compatible =3D "ibm,fsi-i2c-master";
> +			reg =3D <0x1800 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cfam2_i2c0: i2c-bus@0 {
> +				reg =3D <0>;	/* OM01 */
> +			};
> +
> +			cfam2_i2c1: i2c-bus@1 {
> +				reg =3D <1>;	/* OM23 */
> +			};
> +
> +			cfam2_i2c10: i2c-bus@a {
> +				reg =3D <10>;	/* OP3A */
> +			};
> +
> +			cfam2_i2c11: i2c-bus@b {
> +				reg =3D <11>;	/* OP3B */
> +			};
> +
> +			cfam2_i2c12: i2c-bus@c {
> +				reg =3D <12>;	/* OP4A */
> +			};
> +
> +			cfam2_i2c13: i2c-bus@d {
> +				reg =3D <13>;	/* OP4B */
> +			};
> +
> +			cfam2_i2c14: i2c-bus@e {
> +				reg =3D <14>;	/* OP5A */
> +			};
> +
> +			cfam2_i2c15: i2c-bus@f {
> +				reg =3D <15>;	/* OP5B */
> +			};
> +		};
> +
> +		fsi2spi@1c00 {
> +			compatible =3D "ibm,fsi2spi";
> +			reg =3D <0x1c00 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cfam2_spi0: spi@0 {
> +				reg =3D <0x0>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam2_spi1: spi@20 {
> +				reg =3D <0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam2_spi2: spi@40 {
> +				reg =3D <0x40>;
> +				compatible =3D "ibm,fsi2spi-restricted";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam2_spi3: spi@60 {
> +				reg =3D <0x60>;
> +				compatible =3D "ibm,fsi2spi-restricted";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +		};
> +
> +		sbefifo@2400 {
> +			compatible =3D "ibm,p9-sbefifo";
> +			reg =3D <0x2400 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			fsi_occ2: occ {
> +				compatible =3D "ibm,p10-occ";
> +			};
> +		};
> +
> +		fsi_hub2: hub@3400 {
> +			compatible =3D "fsi-master-hub";
> +			reg =3D <0x3400 0x400>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <0>;
> +
> +			no-scan-on-init;
> +		};
> +	};
> +
> +	cfam@3,0 {
> +		reg =3D <3 0>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		chip-id =3D <3>;
> +
> +		scom@1000 {
> +			compatible =3D "ibm,fsi2pib";
> +			reg =3D <0x1000 0x400>;
> +		};
> +
> +		i2c@1800 {
> +			compatible =3D "ibm,fsi-i2c-master";
> +			reg =3D <0x1800 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cfam3_i2c2: i2c-bus@2 {
> +				reg =3D <2>;	/* OM45 */
> +			};
> +
> +			cfam3_i2c3: i2c-bus@3 {
> +				reg =3D <3>;	/* OM67 */
> +			};
> +
> +			cfam3_i2c10: i2c-bus@a {
> +				reg =3D <10>;	/* OP3A */
> +			};
> +
> +			cfam3_i2c11: i2c-bus@b {
> +				reg =3D <11>;	/* OP3B */
> +			};
> +
> +			cfam3_i2c14: i2c-bus@e {
> +				reg =3D <14>;	/* OP5A */
> +			};
> +
> +			cfam3_i2c15: i2c-bus@f {
> +				reg =3D <15>;	/* OP5B */
> +			};
> +
> +			cfam3_i2c16: i2c-bus@10 {
> +				reg =3D <16>;	/* OP6A */
> +			};
> +
> +			cfam3_i2c17: i2c-bus@11 {
> +				reg =3D <17>;	/* OP6B */
> +			};
> +		};
> +
> +		fsi2spi@1c00 {
> +			compatible =3D "ibm,fsi2spi";
> +			reg =3D <0x1c00 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			cfam3_spi0: spi@0 {
> +				reg =3D <0x0>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam3_spi1: spi@20 {
> +				reg =3D <0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam3_spi2: spi@40 {
> +				reg =3D <0x40>;
> +				compatible =3D "ibm,fsi2spi-restricted";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +
> +			cfam3_spi3: spi@60 {
> +				reg =3D <0x60>;
> +				compatible =3D "ibm,fsi2spi-restricted";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@0 {
> +					at25,byte-len =3D <0x80000>;
> +					at25,addr-mode =3D <4>;
> +					at25,page-size =3D <256>;
> +
> +					compatible =3D "atmel,at25";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <1000000>;
> +				};
> +			};
> +		};
> +
> +		sbefifo@2400 {
> +			compatible =3D "ibm,p9-sbefifo";
> +			reg =3D <0x2400 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			fsi_occ3: occ {
> +				compatible =3D "ibm,p10-occ";
> +			};
> +		};
> +
> +		fsi_hub3: hub@3400 {
> +			compatible =3D "fsi-master-hub";
> +			reg =3D <0x3400 0x400>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <0>;
> +
> +			no-scan-on-init;
> +		};
> +	};
> +};
> +
> +/* Legacy OCC numbering (to get rid of when userspace is fixed) */
> +&fsi_occ0 {
> +	reg =3D <1>;
> +};
> +
> +&fsi_occ1 {
> +	reg =3D <2>;
> +};
> +
> +&fsi_occ2 {
> +	reg =3D <3>;
> +};
> +
> +&fsi_occ3 {
> +	reg =3D <4>;
> +};
> +
> +&ibt {
> +	status =3D "okay";
> +};
> +
> +&vuart1 {
> +	status =3D "okay";
> +};
> +
> +&vuart2 {
> +	status =3D "okay";
> +};
> +
> +&lpc_ctrl {
> +	status =3D "okay";
> +	memory-region =3D <&flash_memory>;
> +};
> +
> +&kcs4 {
> +	compatible =3D "openbmc,mctp-lpc";
> +	status =3D "okay";
> +};
> +
> +&mac2 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii3_default>;
> +	clocks =3D <&syscon ASPEED_CLK_GATE_MAC3CLK>,
> +		 <&syscon ASPEED_CLK_MAC3RCLK>;
> +	clock-names =3D "MACCLK", "RCLK";
> +	use-ncsi;
> +};
> +
> +&mac3 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii4_default>;
> +	clocks =3D <&syscon ASPEED_CLK_GATE_MAC4CLK>,
> +		 <&syscon ASPEED_CLK_MAC4RCLK>;
> +	clock-names =3D "MACCLK", "RCLK";
> +	use-ncsi;
> +};
> +
> +&xdma {
> +	status =3D "okay";
> +	memory-region =3D <&vga_memory>;
> +};
> --=20
> 2.18.4

Thanks Eddie, this is a good base to start with. I=E2=80=99ve
tested out in our simulation.

Tested-by: Andrew Geissler <geissonator@gmail.com>=20


