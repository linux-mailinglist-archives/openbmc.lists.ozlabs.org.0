Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024EA27B47
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 20:30:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnYNl3GBBz3bT8
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2025 06:30:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738697412;
	cv=none; b=Or2Ne0+ZMvbmTNGdk/VBCmtiGdZrI3V6Zooi3SLo7bPmSRRRNaB9bsPQCBEbKlX9AZk3JCeOCbSGWGMEtlsiiuoMmvuA2dS7y5bbmaOVGo3HeJS0xiR0BEFwXuXW7d1LLuOZDx9AqqdK+cG2zy+S4ihGwnc+D8c4O3wrlD+V89z3DQ4DGHTy8u6RiQjNn4x+vH1/2qt93Hje+jD34xnw83VyF1DpP6I8GnPdXIeI5Xg8Xdvf7zG4/cHJYRZk8ycxqTXSwLuBFTOXyKQ4jeKAF2CWeRJ7xaE6L2PpmibPOvmMRECox37b4hz3v2jVzhr1pK6jjshMB19JNxIsaZfliw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738697412; c=relaxed/relaxed;
	bh=klzFW5qufSNhopssaHB67PSC4MM864bFLdh0AdosYTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBa9x32IiG3c7EPzVUumZU8k0gGVJw4VrChNn2V5v6mvfW7/OHFQSd8an7o8KfGh6YQmZhrzh2z7QVfam4csxhsMgtLCdLK1huczXaHOpY9UsiKyWQBxKBJ4rVJC+Q/stpOjVOpEGZj1BhXrwVqIjekKLNb36MygCZMavWwRRu8/WE7Y0tmWfYprJzniwQtoBqhbY+avP3+JDymVsphvUXabC00Xa7udoCnCfj294Iy6dQB+ivwDON6enfj1C1ZD1D9MN9OcXajYXolCxHKWyKks0fDhezcu6P6VDynltRvMAeDdcCSBHk+tZFInUKCMpDfbLc5TEIPKmZx0OcTJmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PJ28FiwK; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PJ28FiwK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnYNg0QS5z2yDx;
	Wed,  5 Feb 2025 06:30:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BCF25C67BB;
	Tue,  4 Feb 2025 19:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AC9C4CEE9;
	Tue,  4 Feb 2025 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697407;
	bh=dp3KkiRbpI5jTq31jDz9RRKWBTNV3PSWERsFVIuYVUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJ28FiwKrc8NJPI/UEnZa67oUEmxwlDSox0/vLcuo50zurUwA2+ytfQnM6Bv4u0PK
	 vAoehoqdy9VadUapFOhWNyKJeVT++wKSeKmI7OkjbiXd6uV4midvRdJZancpyQ/RFe
	 iHJ9n9P7LXMc5SUQiCKC5Leqbdieg7Yh1vV1vN4UFk+3/zV2NcTwFK9e/Js+zHfCKH
	 B4bGIZak2YsfPaoAp0ADRNr0gPsZR2oevAC0Zda/tE85Zf2fsfTN/re9Xd6/r3qCiF
	 7w7Rze4iYR5KCqJ4/giOPWK9lTqwVCOzrq61Sgtpt4Bcd0Y2Pb3bE41emxsTaPxzeq
	 csBuOwM6KBsKg==
Date: Tue, 4 Feb 2025 19:30:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH] dt-bindings: media: convert aspeed-video.txt to dt-schema
Message-ID: <20250204-acronym-unshaved-18b89a389091@spud>
References: <20250204062822.3738037-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i8IRvi06tcsVtedw"
Content-Disposition: inline
In-Reply-To: <20250204062822.3738037-1-jammy_huang@aspeedtech.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--i8IRvi06tcsVtedw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 02:28:22PM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../bindings/media/aspeed,video-engine.yaml   | 84 +++++++++++++++++++
>  .../bindings/media/aspeed-video.txt           | 33 --------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 85 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-=
engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.=
txt
>=20
> diff --git a/Documentation/devicetree/bindings/media/aspeed,video-engine.=
yaml b/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
> new file mode 100644
> index 000000000000..c66ae6b53cbb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/aspeed,video-engine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED Video Engine
> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +
> +description:
> +  The Video Engine (VE) embedded in the ASPEED SOCs can be configured to
> +  capture and compress video data from digital or analog sources.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-video-engine
> +      - aspeed,ast2500-video-engine
> +      - aspeed,ast2600-video-engine
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: eclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +    description: |
> +      Phandle to the reserved memory nodes to be associated with the
> +      VE. VE will acquires memory space for 3 purposes:
> +        1. JPEG header
> +        2. Compressed result
> +        3. Temporary transformed image data
> +
> +  aspeed,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Specifies the scu node that is needed if video wants to capture
> +      from sources other than Host VGA.
> +
> +  aspeed,gfx:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Specifies the Soc Display(gfx) node that needs to be queried to get
> +      related information if video wants to use gfx as capture source.

These two phandle properties are new and not mentioned in your commit
message. Why have they been added?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    video@1e700000 {
> +      compatible =3D "aspeed,ast2600-video-engine";
> +      reg =3D <0x1e700000 0x1000>;
> +      clocks =3D <&syscon ASPEED_CLK_GATE_VCLK>,
> +               <&syscon ASPEED_CLK_GATE_ECLK>;
> +      clock-names =3D "vclk", "eclk";
> +      interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +      aspeed,scu =3D <&syscon>;
> +      aspeed,gfx =3D <&gfx>;
> +    };
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
> - - compatible:		"aspeed,ast2400-video-engine" or
> -			"aspeed,ast2500-video-engine" or
> -			"aspeed,ast2600-video-engine"
> - - reg:			contains the offset and length of the VE memory region
> - - clocks:		clock specifiers for the syscon clocks associated with
> -			the VE (ordering must match the clock-names property)
> - - clock-names:		"vclk" and "eclk"
> - - resets:		reset specifier for the syscon reset associated with
> -			the VE
> - - interrupts:		the interrupt associated with the VE on this platform
> -
> -Optional properties:
> - - memory-region:
> -	phandle to a memory region to allocate from, as defined in
> -	Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> -
> -Example:
> -
> -video-engine@1e700000 {
> -    compatible =3D "aspeed,ast2500-video-engine";
> -    reg =3D <0x1e700000 0x20000>;
> -    clocks =3D <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon ASPEED_CLK_GATE_=
ECLK>;
> -    clock-names =3D "vclk", "eclk";
> -    resets =3D <&syscon ASPEED_RESET_VIDEO>;
> -    interrupts =3D <7>;
> -    memory-region =3D <&video_engine_memory>;
> -};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..7e59daa1e89d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3549,7 +3549,7 @@ M:	Eddie James <eajames@linux.ibm.com>
>  L:	linux-media@vger.kernel.org
>  L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/aspeed-video.txt
> +F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>  F:	drivers/media/platform/aspeed/
> =20
>  ASUS EC HARDWARE MONITOR DRIVER
>=20
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --=20
> 2.25.1
>=20

--i8IRvi06tcsVtedw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JqugAKCRB4tDGHoIJi
0mCkAQDv+QJAtLQu581nLzkejap/mpHejKb7ON+oLm+XbsuanwD/XWZyc+D15A2m
NvFwrl1iWOd3s3nRf2VSuRWBz8w31wk=
=GNL1
-----END PGP SIGNATURE-----

--i8IRvi06tcsVtedw--
