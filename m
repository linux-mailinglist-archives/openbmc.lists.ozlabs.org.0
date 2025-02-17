Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A812A3792B
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2025 01:25:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx3Mc6cDqz3c7q
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2025 11:25:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739751913;
	cv=none; b=DE5KdXvijlY9nAC8eakS1dAKf5MhQUPJIGhqWBJp6xxTY+VXf1AMoOznYUSnWQvoYA/ZuySPiW19hgHpLVhNXLbut4tE3Mko8HxddbhDYx9DeYoTnk7egTKoEvXhFeCCIzMWuaLMO/z7OV5uGHBvcV2ipY8hzDgvsM+xyuYLiJiglZl6IGv4P9nLVF9CNFbZ2N1kkhOmbxMsIiwW3WQvE7RHicl61oPWV6QUlZzSoYnBpBfT/mliefFo+OkzUZcNDAOYqSRhh1E4XyGvgCjeZcupKVRgUslh3tMfh5eeIzEj01P6W0wXqWv1HqCk7faBG1i/xWbXg6R9GnBJNFXtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739751913; c=relaxed/relaxed;
	bh=Uo2KVxU4UmXc9VhyrMc8Oxo8xX5Nh+L8NJ06hBNOhs8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WwcyXl3L7ByFBVXMfvhJVTTisgzYplbCJTWhcWAO8BgAuVwkqQ1qBr4l9CY1EV+hh9Yif4kZF3i0AKr48/BBao1ShU6D6x0OEWWOnhpx7aXt/uOpIP3MBkVx8x3s+R3oEQ6F/zHZgjTWgJghkqXpyq8B6Vxow3AAp7WbBOS35s3NTf9PFx9dkwNrmjsAEBsm5p7C36uhKvUvyPc+YVHc9dCrfRtA/vbT2Iax1w7qLLuxYSTD2ceqP/pso1zTQFT/hkZ+1NMvAUodl5UJ8Jlw2FuVAHtV49dXLku8miNvsP3ONJnsmG3Ss9de/FGYZUIs2HtG2DlqAytcEsfJUyoPiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HBeC/nrI; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HBeC/nrI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx3MX74fRz2xdn;
	Mon, 17 Feb 2025 11:25:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739751912;
	bh=Uo2KVxU4UmXc9VhyrMc8Oxo8xX5Nh+L8NJ06hBNOhs8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=HBeC/nrInBooqZJLpNlOfHkeEwbWVmtRzFeKIKccLKE2tIFQ1TDxKL07NROWJEvig
	 t8OkVn8vPOmMp0vHUowaAzNe/KtayxNvkttBdrScJVMoBMlOISa8eMwCv7p7SBjW4W
	 H7zJVDxPs7JOIj+BDZyN1l+r6ICg8EvOwCKtKXFeB+dbKP8CWslrFAvRVC5qtpcCxH
	 ECyR4+bkROfLazcUnj7Rx0ZeljMeKRapesFtf5mIGdPycHR/JUvdPFQAGgHB5qgWgi
	 mn+ReAtKB3RxqukdGUYMbvc1GULqFLfOSuJZWXwcUr0nyL9VqAr5uQ0ERS8bGYzC3P
	 V+YwxYXdcIozw==
Received: from [192.168.68.112] (ppp118-210-170-58.adl-adc-lon-bras34.tpg.internode.on.net [118.210.170.58])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2DC9272F1E;
	Mon, 17 Feb 2025 08:25:10 +0800 (AWST)
Message-ID: <31c7189bc04ed8c5cce463951b717bed6a2ccf9a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com, 
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org,  openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Mon, 17 Feb 2025 10:55:09 +1030
In-Reply-To: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2025-02-13 at 09:53 +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> =C2=A0v6:
> =C2=A0 - Remove new properties in example.
>=20
> =C2=A0v5:
> =C2=A0 - Don't put additional changes in this commit.
>=20
> =C2=A0v4:
> =C2=A0 - Keep | after phandle description to fix dt_binding_check error.
>=20
> =C2=A0v3:
> =C2=A0 - Add Additional changes into comments.
> =C2=A0 - Remove | after phandle description
>=20
> =C2=A0v2:
> =C2=A0 - Update patch subject
> =C2=A0 - Add NOTE for false positive warning
> ---
> =C2=A0.../bindings/media/aspeed,video-engine.yaml=C2=A0=C2=A0 | 70 ++++++=
+++++++++++++
> =C2=A0.../bindings/media/aspeed-video.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 33 ---------
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
> =C2=A03 files changed, 71 insertions(+), 34 deletions(-)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/media/aspeed,v=
ideo-engine.yaml
> =C2=A0delete mode 100644 Documentation/devicetree/bindings/media/aspeed-v=
ideo.txt
>=20
> diff --git a/Documentation/devicetree/bindings/media/aspeed,video-engine.=
yaml b/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
> new file mode 100644
> index 000000000000..682bba20778c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/aspeed,video-engine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED Video Engine
> +
> +maintainers:
> +=C2=A0 - Eddie James <eajames@linux.ibm.com>
> +
> +description:
> +=C2=A0 The Video Engine (VE) embedded in the ASPEED SOCs can be configur=
ed to
> +=C2=A0 capture and compress video data from digital or analog sources.
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2400-video-engine
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2500-video-engine
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2600-video-engine
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 maxItems: 2
> +
> +=C2=A0 clock-names:
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vclk
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: eclk
> +
> +=C2=A0 resets:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 interrupts:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 memory-region:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +=C2=A0=C2=A0=C2=A0 description: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to the reserved memory nodes to b=
e associated with the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VE. VE will acquires memory space for 3 p=
urposes:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. JPEG header
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2. Compressed result
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3. Temporary transformed imag=
e data
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - reg
> +=C2=A0 - clocks
> +=C2=A0 - clock-names
> +=C2=A0 - interrupts

This should list `resets` as well, as that wasn't optional in the text
binding.

> +
> +additionalProperties: false
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gic.h>
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/ast2600-clock.h>
> +
> +=C2=A0=C2=A0=C2=A0 video@1e700000 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "aspeed,ast260=
0-video-engine";

I guess it's not much of a concern that the example is different...

Andrew

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x1e700000 0x1000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&syscon ASPEED_CL=
K_GATE_VCLK>,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 <&syscon ASPEED_CLK_GATE_ECLK>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =3D "vclk", "eclk=
";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI 7 IRQ=
_TYPE_LEVEL_HIGH>;
> +=C2=A0=C2=A0=C2=A0 };
> diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/D=
ocumentation/devicetree/bindings/media/aspeed-video.txt
> deleted file mode 100644
> index d2ca32512272..000000000000
> --- a/Documentation/devicetree/bindings/media/aspeed-video.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -* Device tree bindings for Aspeed Video Engine
> -
> -The Video Engine (VE) embedded in the Aspeed AST2400/2500/2600 SOCs can
> -capture and compress video data from digital or analog sources.
> -
> -Required properties:
> - - compatible:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"asp=
eed,ast2400-video-engine" or
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"aspeed,a=
st2500-video-engine" or
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"aspeed,a=
st2600-video-engine"
> - - reg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0contains the offset and length of the VE memory region
> - - clocks:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0clock specifiers for the syscon clocks associated with
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0the VE (o=
rdering must match the clock-names property)
> - - clock-names:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"vclk" and "eclk"
> - - resets:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0reset specifier for the syscon reset associated with
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0the VE
> - - interrupts:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0the =
interrupt associated with the VE on this platform
> -
> -Optional properties:
> - - memory-region:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0phandle to a memory region to =
allocate from, as defined in
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/bindi=
ngs/reserved-memory/reserved-memory.txt
> -
> -Example:
> -
> -video-engine@1e700000 {
> -=C2=A0=C2=A0=C2=A0 compatible =3D "aspeed,ast2500-video-engine";
> -=C2=A0=C2=A0=C2=A0 reg =3D <0x1e700000 0x20000>;
> -=C2=A0=C2=A0=C2=A0 clocks =3D <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon A=
SPEED_CLK_GATE_ECLK>;
> -=C2=A0=C2=A0=C2=A0 clock-names =3D "vclk", "eclk";
> -=C2=A0=C2=A0=C2=A0 resets =3D <&syscon ASPEED_RESET_VIDEO>;
> -=C2=A0=C2=A0=C2=A0 interrupts =3D <7>;
> -=C2=A0=C2=A0=C2=A0 memory-region =3D <&video_engine_memory>;
> -};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..7e59daa1e89d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3549,7 +3549,7 @@ M:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0E=
ddie James <eajames@linux.ibm.com>
> =C2=A0L:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0linux-media@vger.kernel.org
> =C2=A0L:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0openbmc@lists.ozlabs.org=C2=A0(mode=
rated for non-subscribers)
> =C2=A0S:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Maintained
> -F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/bindings/media/=
aspeed-video.txt
> +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/bindings/media/=
aspeed,video-engine.yaml
> =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/media/platform/aspeed/
> =C2=A0
> =C2=A0ASUS EC HARDWARE MONITOR DRIVER
>=20
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b

