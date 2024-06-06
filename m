Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C88FDC65
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 03:59:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Cj2psYwM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvnZg0wNTz3cVh
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 11:59:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Cj2psYwM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvnZ65LDsz30W7
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2024 11:59:10 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1961820154;
	Thu,  6 Jun 2024 09:59:08 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717639150;
	bh=mvRvz1v/VLE0lnlUzfmyGD4DXWnFTQnnLIOcJPyX3zc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Cj2psYwMf36dm5BaIhWMihd8VJrXZ/kyHYiykWZ5AxeoCaowacSI2WxMB/UOV+/UK
	 poUb4B/3Mo365ma6KWokEuHCBf7Bgi09dxUNMvBCd4U40xH5MMtFxr3CvvcAbxjD2g
	 gqthq/8w4rPxwdzgdJW3N6MLiH6ylQQlA7WfjYwTi2sfq4Vd/yUlf6JVYvLqXKWe7u
	 BGjZl3c7CK+8fwpOVSirQzTkKaXt57jXC40XRX1gLAgfmyenSf2Ow2/Xaxp+j35sPw
	 LG9fLoT6CizMHvEJNoYIwVPJgVcGY7g/QAQcu51FoARHzCKZQDwQy/Kw0K64hOW97o
	 rcnnphRLvbtxA==
Message-ID: <e60b20fed3ec9c0624bb714bf704a325f713394e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: Add IEISystems NF5280M7 BMC machine
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: George Liu <liuxiwei1013@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Thu, 06 Jun 2024 11:29:07 +0930
In-Reply-To: <20240605034918.2459000-1-liuxiwei@ieisystem.com>
References: <20240605034918.2459000-1-liuxiwei@ieisystem.com>
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
Cc: wangzhiqiang02@ieisystem.com, wangxingkong@ieisystem.com, liubaoyang@ieisystem.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,

On Wed, 2024-06-05 at 11:49 +0800, George Liu wrote:
> The IEISystems NF5280M7 is an x86 platform server with an
> AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
>=20
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed/aspeed-bmc-ieisystems-nf5280m7.dts | 658 ++++++++++++++++++
>  2 files changed, 659 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280=
m7.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index e51c6d203725..8fc1d866ab03 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>  	aspeed-bmc-ibm-rainier-1s4u.dtb \
>  	aspeed-bmc-ibm-rainier-4u.dtb \
>  	aspeed-bmc-ibm-system1.dtb \
> +	aspeed-bmc-ieisystems-nf5280m7.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-inspur-fp5280g2.dtb \
>  	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts
> new file mode 100644
> index 000000000000..379081b6a39c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts
> @@ -0,0 +1,658 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2023 IEISystems Corporation
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model =3D "NF5280M7 BMC";
> +	compatible =3D "ieisystems,nf5280m7-bmc", "aspeed,ast2600";

A few couple of things here:

1. Is 'ieisystems' the same as 'IEI Integration Corp.' listed at [1]?
If so, this should be 'iei,nf5280m7-bmc'. Otherwise, if not, then you
need to add an 'ieisystems' vendor prefix to the same file in a
separate patch.

2. Assuming the vendor prefix is 'ieisystems', then you need to add an
entry for the platform to [2].

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/devicetree/bindings/vendor-prefixes.yaml?h=3Dv6.10-rc2#n669
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml?h=3Dv6.10-rc2#n7=
6

As for the rest of the devicetree, Rob's bot identified a bunch of
issues. A number of them are a result of problems with the Aspeed DTSIs
and the lack of dt-schema binding definitions for the Aspeed
controllers.

I have a tree that deals with many of these issues, and I'm slowly
sending out the patches. Eddie also recently sent a series defining a
large number of FSI bindings in dt-schema. I've merged those two
efforts together and applied your patch on top of the result. Below is
the edited output from `make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ieisystems-
nf5280m7.dtb` identifying things that should be addressed in the patch.

Cheers,

Andrew

../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:162.3-16: Wa=
rning (reg_format): /ahb/apb/peci-controller@1e78b000/peci-client@30:reg: p=
roperty has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cells =
=3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:167.3-16: Wa=
rning (reg_format): /ahb/apb/peci-controller@1e78b000/peci-client@31:reg: p=
roperty has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cells =
=3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:305.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:308.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2/tmp1=
12@49:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:313.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2/emc1=
413@4c:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2,=
 #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:338.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:342.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp=
2888@76:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:346.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp=
2888@72:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:350.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp=
2888@62:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:354.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:358.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp=
2888@76:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:362.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp=
2888@72:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:366.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp=
2888@62:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:370.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:373.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@3:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:405.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@71/i2c@0:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:410.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@71/i2c@1:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:415.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@71/i2c@2:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:420.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@71/i2c@3:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:425.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@71/i2c@4:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:430.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@71/i2c@5:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:435.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@71/i2c@6:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:440.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@71/i2c@7:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:452.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@72/i2c@0:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:457.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@72/i2c@1:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:462.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@72/i2c@2:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:467.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@72/i2c@3:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:472.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@72/i2c@4:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:477.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@72/i2c@5:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:482.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@72/i2c@6:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:487.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/p=
ca9548@72/i2c@7:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (pci_d=
evice_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (pci_d=
evice_bus_num): Failed prerequisite 'reg_format'
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:304.22-316.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2=
c@2: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:304.22-316.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2=
c@2: incorrect #size-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:337.21-352.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@0: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:337.21-352.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@0: incorrect #size-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:353.20-368.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@1: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:353.20-368.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@1: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (i2c_b=
us_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (i2c_b=
us_reg): Failed prerequisite 'i2c_bus_bridge'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (spi_b=
us_reg): Failed prerequisite 'reg_format'
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:160.17-163.4=
: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci=
-client@30: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:160.17-163.4=
: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci=
-client@30: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:165.17-168.4=
: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci=
-client@31: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:165.17-168.4=
: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci=
-client@31: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:304.22-316.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
546@70/i2c@2: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:304.22-316.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
546@70/i2c@2: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:306.13-310.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
546@70/i2c@2/tmp112@49: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:306.13-310.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
546@70/i2c@2/tmp112@49: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:311.14-315.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
546@70/i2c@2/emc1413@4c: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:311.14-315.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
546@70/i2c@2/emc1413@4c: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:337.21-352.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:337.21-352.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:340.16-343.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/vrmp2888@76: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:340.16-343.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/vrmp2888@76: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:344.16-347.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/vrmp2888@72: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:344.16-347.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/vrmp2888@72: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:348.15-351.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/vrmp2888@62: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:348.15-351.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/vrmp2888@62: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:353.20-368.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:353.20-368.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:356.15-359.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/vrmp2888@76: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:356.15-359.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/vrmp2888@76: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:360.16-363.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/vrmp2888@72: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:360.16-363.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/vrmp2888@72: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:364.15-367.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/vrmp2888@62: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:364.15-367.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/vrmp2888@62: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:369.20-371.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:369.20-371.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:372.20-374.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@3: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:372.20-374.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@3: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:402.22-406.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@0: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:402.22-406.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@0: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:407.22-411.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:407.22-411.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:412.22-416.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@2: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:412.22-416.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@2: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:417.22-421.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@3: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:417.22-421.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@3: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:422.22-426.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@4: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:422.22-426.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@4: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:427.22-431.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@5: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:427.22-431.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@5: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:432.22-436.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@6: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:432.22-436.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@6: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:437.22-441.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@7: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:437.22-441.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@71/i2c@7: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:449.22-453.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@0: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:449.22-453.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@0: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:454.22-458.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:454.22-458.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:459.22-463.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@2: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:459.22-463.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@2: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:464.22-468.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@3: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:464.22-468.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@3: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:469.22-473.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@4: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:469.22-473.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@4: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:474.22-478.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@5: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:474.22-478.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@5: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:479.22-483.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@6: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:479.22-483.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@6: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:484.22-488.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@7: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:484.22-488.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@0/pca9548@72/i2c@7: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /: failed to m=
atch any schema with compatible: ['ieisystems,nf5280m7-bmc', 'aspeed,ast260=
0']
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: peci-controller@1e78b000: 'gpios=
', 'peci-client@30', 'peci-client@31' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/peci/peci-aspeed.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/peci-=
controller@1e78b000/peci-client@30: failed to match any schema with compati=
ble: ['intel,peci-client']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/peci-=
controller@1e78b000/peci-client@31: failed to match any schema with compati=
ble: ['intel,peci-client']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9546@70: $nodename:0: 'pca954=
6@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9546@70: Unevaluated properti=
es are not allowed ('i2c@2' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@180/pca9546@70/i2c@2/emc1413@4c: failed to match any schema=
 with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@280/ipmb0@10: failed to match any schema with compatible: [=
'ipmb-dev']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9546@70: $nodename:0: 'pca954=
6@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9546@70: Unevaluated properti=
es are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: i2c-switch@70: $nodename:0: 'i2c=
-switch@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: i2c-switch@70: Unevaluated prope=
rties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', '=
i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', 'i2c@6', 'i2c@7' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9548@71: $nodename:0: 'pca954=
8@71' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9548@71: Unevaluated properti=
es are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', '=
i2c@6', 'i2c@7' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9548@72: $nodename:0: 'pca954=
8@72' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9548@72: Unevaluated properti=
es are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', '=
i2c@6', 'i2c@7' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: i2c-bus@400: Unevaluated propert=
ies are not allowed ('#retries' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9555@21: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9555@22: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: gpio-keys: 'cpld' does not match=
 any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[=
a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: leds: 'fan-fault', 'heartbeat', =
'memory-fault', 'psu-fault', 'system-fault', 'system-hot' do not match any =
of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

