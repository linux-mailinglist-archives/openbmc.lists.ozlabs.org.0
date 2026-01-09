Return-Path: <openbmc+bounces-1119-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C8D06C33
	for <lists+openbmc@lfdr.de>; Fri, 09 Jan 2026 02:43:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnPfp4R9Vz2xpl;
	Fri, 09 Jan 2026 12:42:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767922978;
	cv=none; b=O9SMoeuizPls+l+QIs4ctsJLp0HFWTyYagRQw7/4Y3ULCLQ+2hSlFG2NAkemRypNhw3XZsxfce+mpCAmuXtvYbN14fndj3iSuCGesdkpSDrKtKKSTZTrBypWM+MryN7aux2I38qNumXox15PM2BcCdcLqYfD9jZ79zLyp5gus3xyouupgzJqdRkcyd1UlItT9KNQ5AadTckx1pK+w9wxR9P23f+A47j9VW0ik4uBkejqaRfsv03F0Mfb3tTWn0HQStzWMPE8+FdZ8PKGcW3BUWvkUvTdh7qn47075yUBoY5NavO+iNWOhOisZWOag0xhlqwqE/BQ2iIlWGyXx1XBug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767922978; c=relaxed/relaxed;
	bh=IkrQu39P2MBu4p39dfE/oFaxwIHrYbqhnM4/i3CzJ6k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WmN0yC9jFXVaoyEzudvfTYA3fvsOsuzBM2o/UIZvcBuNZZE0ND9+D6f9uIC/vjgM5XrFfqeeTS3gR4ADMap7VsDS30rwVAM+IjX26ffVuBc9tD0GWP0jTkOBRufJuWkVlP2U3cZPaHiUgXVmi+6WaMqU+BFPtBIp4LU6j5p6ei0hgOZhiHjIIJ1D8keJFHdrqX64QxWKXo7LrlMEiOMLTR8tGQ4lJIilma7nflX7wXzyhkO9CQUgMVjr4VAMY7bbihKTSl3KGK0DMGQjS/YpHkOWOsAr3Ic56v2+25QOhchbNFY+hIxaxWAVddoZaIODipQuYFc1uzzUuPRPEimVfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CgP7QUwk; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CgP7QUwk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnPfp0DJfz2xFn
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 12:42:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767922977;
	bh=IkrQu39P2MBu4p39dfE/oFaxwIHrYbqhnM4/i3CzJ6k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CgP7QUwkCwC2sDasSBU10pleMP5h/wQNys0EuOPuypD6auTGU2zVrM8cWeH3cUJIu
	 Y72nkswIv2jSEfxEPZSInUfBDNG60oMUZaGwjMdGhMSa2n1bX44jDa/EXKyeBZYBhT
	 NYcI1EYfcIWa1dXNEYXV5Kjn9ZeSuXbDaJ39ah2pXJC1qY7Tov65liMZNSlD1Idb2c
	 zS8uMlX8Xx7A40iQJPiTD857dOm4MTACxpTBFBVsDO28Uvxr+IofeiCCx8uimqLmeQ
	 GMqW2Ao7P8HTH5mDo4BdF7AEhGWQm0RL9diAVuaay3e5DfcBRDBDUnyAMwx3rRisWA
	 f3ZFT6ou972Ag==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3ABD67C834;
	Fri,  9 Jan 2026 09:42:56 +0800 (AWST)
Message-ID: <5d7a8487a30363d2cc4b77d08ba357e962e26337.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.12 1/6] dt-bindings: gpio: cdns: convert to
 YAML
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kuan-Jui Chiu <kchiu@axiado.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Cc: Harshit Shah <hshah@axiado.com>
Date: Fri, 09 Jan 2026 12:12:56 +1030
In-Reply-To: <20251226015750.377679-1-kchiu@axiado.com>
References: <20251226015750.377679-1-kchiu@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Kuan-Jui,

I've recently moved OpenBMC to use v6.18 (with a bump to v6.18.4
pending). From brief inspection that upgrade removes the need for this
series. Can you confirm?

Regardless, a few procedural things for the future when sending
backports for openbmc/linux. Can you please:

   1. Send your series with a cover letter
   2. Use `git cherry-pick -xs` to establish your series
   3. Use the `--suppress-cc=3Dall` option to `git send-email` (if that's
      what you've used to send the series)

The first gives you an opportunity to provide context for the series
(and this reply could be against that cover-letter rather than patch
1/6). It also makes the mail threading sensible, rather than the tail
patches being a reply to the first patch.

The second helps me track how you pieced it together. I haven't looked,
but I'd be unsurprised if the collection here isn't in one contiguous
series of changes upstream. Adding the upstream commit information
allows me to use tools like range-diff to inspect what you've sent.
Having your sign-off in the case that I directly apply your series
helps track the chain of custody for the patches.

The third ensures that upstream contributors and maintainers aren't
bothered by the noise of backporting to a fork they might not care too
much for.

Cheers,

Andrew

On Thu, 2025-12-25 at 17:57 -0800, Kuan-Jui Chiu wrote:
> From: Harshit Shah <hshah@axiado.com>
>=20
> Convert Cadence family GPIO controller bindings to DT schema.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> =C2=A0.../devicetree/bindings/gpio/cdns,gpio.txt=C2=A0=C2=A0=C2=A0 | 43 -=
---------
> =C2=A0.../devicetree/bindings/gpio/cdns,gpio.yaml=C2=A0=C2=A0 | 79
> +++++++++++++++++++
> =C2=A02 files changed, 79 insertions(+), 43 deletions(-)
> =C2=A0delete mode 100644
> Documentation/devicetree/bindings/gpio/cdns,gpio.txt
> =C2=A0create mode 100644
> Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
> b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
> deleted file mode 100644
> index 706ef00f5c64..000000000000
> --- a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Cadence GPIO controller bindings
> -
> -Required properties:
> -- compatible: should be "cdns,gpio-r1p02".
> -- reg: the register base address and size.
> -- #gpio-cells: should be 2.
> - * first cell is the GPIO number.
> - * second cell specifies the GPIO flags, as defined in
> - <dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
> - and GPIO_ACTIVE_LOW flags are supported.
> -- gpio-controller: marks the device as a GPIO controller.
> -- clocks: should contain one entry referencing the peripheral clock
> driving
> - the GPIO controller.
> -
> -Optional properties:
> -- ngpios: integer number of gpio lines supported by this controller,
> up to 32.
> -- interrupts: interrupt specifier for the controllers interrupt.
> -- interrupt-controller: marks the device as an interrupt controller.
> When
> - defined, interrupts, interrupt-parent and #interrupt-cells
> - are required.
> -- interrupt-cells: should be 2.
> - * first cell is the GPIO number you want to use as an IRQ source.
> - * second cell specifies the IRQ type, as defined in
> - <dt-bindings/interrupt-controller/irq.h>.
> - Currently only level sensitive IRQs are supported.
> -
> -
> -Example:
> - gpio0: gpio-controller@fd060000 {
> - compatible =3D "cdns,gpio-r1p02";
> - reg =3D<0xfd060000 0x1000>;
> -
> - clocks =3D <&gpio_clk>;
> -
> - interrupt-parent =3D <&gic>;
> - interrupts =3D <0 5 IRQ_TYPE_LEVEL_HIGH>;
> -
> - gpio-controller;
> - #gpio-cells =3D <2>;
> -
> - interrupt-controller;
> - #interrupt-cells =3D <2>;
> - };
> diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> new file mode 100644
> index 000000000000..f1a64c173665
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence GPIO Controller
> +
> +maintainers:
> +=C2=A0 - Jan Kotas <jank@cadence.com>
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 const: cdns,gpio-r1p02
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 ngpios:
> +=C2=A0=C2=A0=C2=A0 minimum: 1
> +=C2=A0=C2=A0=C2=A0 maximum: 32
> +
> +=C2=A0 gpio-controller: true
> +
> +=C2=A0 "#gpio-cells":
> +=C2=A0=C2=A0=C2=A0 const: 2
> +=C2=A0=C2=A0=C2=A0 description: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - First cell is the GPIO line number.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Second cell is flags as defined in <dt-
> bindings/gpio/gpio.h>,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 only GPIO_ACTIVE_HIGH and GPI=
O_ACTIVE_LOW supported.
> +
> +=C2=A0 interrupt-controller: true
> +
> +=C2=A0 "#interrupt-cells":
> +=C2=A0=C2=A0=C2=A0 const: 2
> +=C2=A0=C2=A0=C2=A0 description: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - First cell is the GPIO line number used=
 as IRQ.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Second cell is the trigger type, as def=
ined in
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <dt-bindings/interrupt-contro=
ller/irq.h>.
> +
> +=C2=A0 interrupts:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - reg
> +=C2=A0 - clocks
> +=C2=A0 - gpio-controller
> +=C2=A0 - "#gpio-cells"
> +
> +if:
> +=C2=A0 required: [interrupt-controller]
> +then:
> +=C2=A0 required:
> +=C2=A0=C2=A0=C2=A0 - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gic.h>
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> +=C2=A0=C2=A0=C2=A0 gpio0: gpio-controller@fd060000 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "cdns,gpio-r1p=
02";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0xfd060000 0x1000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&gpio_clk>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-parent =3D <&gic>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI 5 IRQ=
_TYPE_LEVEL_HIGH>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio-controller;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #gpio-cells =3D <2>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-controller;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #interrupt-cells =3D <2>;
> +=C2=A0=C2=A0=C2=A0 };

