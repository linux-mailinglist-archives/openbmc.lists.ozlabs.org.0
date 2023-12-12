Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C68123B6
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 01:09:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uY9B8bTG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrCQW1nCyz3bd6
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 11:09:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uY9B8bTG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqP1n1fRmz2y1Y
	for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 03:18:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2E3161834;
	Tue, 12 Dec 2023 16:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFC3C433C7;
	Tue, 12 Dec 2023 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702397929;
	bh=UYaXZrFDR/cy/SyqvoOFltStolzjOE3ACy1szjYwMKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uY9B8bTGeoApiuOFnJoml3G+mhJpKS4M7gpksSdv8eIO/TM1Q/6bOcRWyWMql1eFy
	 SFSeCAMH9JpJCXM3I0ZQNo4gx0/gx2mfxDSluDvRkLk7ceSrpAe5L6CjlFT/HPxtph
	 HfgoyafWpBfd/J1Omjoral0LpYzL6JW3iO28+/0JJ9KBx4v0p72azZZQY5HaztlUHu
	 pWK4DyLohwVfCqhS6MXNbDWZaY6VSla3fyzcjpCe6gogZ3E18mO3j/kgk8YSMePsKW
	 Kbh3wNKfJpD5QNsv1A/S0h3Pk6fkNrtpg3bkzqjyA8fTJVeaslqC7RIDbwlQ621ews
	 vP4J4lK7i8WLQ==
Date: Tue, 12 Dec 2023 16:18:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: nuvoton: Add NPCM BPC
Message-ID: <20231212-uncut-sixfold-9359b141b149@spud>
References: <20231212100703.3374555-1-tmaimon77@gmail.com>
 <20231212100703.3374555-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EKatXyW3mv8oRlRW"
Content-Disposition: inline
In-Reply-To: <20231212100703.3374555-2-tmaimon77@gmail.com>
X-Mailman-Approved-At: Thu, 14 Dec 2023 11:09:11 +1100
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
Cc: pmenzel@molgen.mpg.de, conor+dt@kernel.org, benjaminfair@google.com, arnd@arndb.de, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--EKatXyW3mv8oRlRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 12:07:01PM +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC NPCM BIOS Post
> Code (BPC).
>=20
> The NPCM BPC monitoring two configurable I/O addresses written by the
> host on the bus.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../soc/nuvoton/nuvoton,npcm-bpc.yaml         | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton=
,npcm-bpc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-b=
pc.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.ya=
ml
> new file mode 100644
> index 000000000000..30033cdac8f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-bpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton BMC NPCM BIOS Post Code (bpc) controller
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +description:
> +  Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable I/O
> +  addresses written by the host on the bus, the capture data stored in
> +  128-word FIFO.
> +
> +  NPCM BPC supports capture double words, when using capture
> +  double word only I/O address 1 is monitored.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-bpc
> +      - nuvoton,npcm845-bpc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  nuvoton,monitor-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Contain monitor I/O addresses on the bus, at least one monitor I/O
> +      address required.
> +
> +  nuvoton,bpc-en-dwcapture:
> +    description:
> +      If present, Enable FIFO capture of the DWord address according to
> +      one address setting.

This sounds like something you can either infer from the compatible or
is determining software policy. A more detailed
explanation/justification is required here.

Thanks,
Conor.

> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - nuvoton,monitor-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bpc: bpc@f0007040 {
> +        compatible =3D "nuvoton,npcm750-bpc";
> +        reg =3D <0xf0007040 0x20>;
> +        interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +        nuvoton,monitor-ports =3D <0x80>;
> +    };
> +...
> --=20
> 2.34.1
>=20
>=20

--EKatXyW3mv8oRlRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiH4wAKCRB4tDGHoIJi
0sLCAQDUf4LaNco4BW20mKaW2lH+BVibKLD9Jte4xNrK4aGvzQD+O4RM8COYi+g1
NthOdrrQn5Cf2XV545V37YT7QRKckAI=
=Ch0H
-----END PGP SIGNATURE-----

--EKatXyW3mv8oRlRW--
