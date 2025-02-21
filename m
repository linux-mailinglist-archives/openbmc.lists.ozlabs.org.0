Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E7A41238
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KZN34Djz3g53
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:19:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740157476;
	cv=none; b=Likkp7sUM89TUf1nfgB+jMgMLX0i6QEXnevazGbS/rtlUAnBIZUT8OI4qu4KBd8Hjku7yWE8sn5fLzaQ/0JJrpF5ieQiVIq2QmyqrcGs9igYAM61unQuyHKV9IbO90V/mXFSe4TLRvnmlVLnvQQnDWEG649fsIhGuofESzBrPjZt+nRJF8ev3H5jPwdY3iBYrUhD67NonTFEzXIeJndXM2nQ/SFH5l1sKfracvdKBGO7nu7f5kHinGC/8AmBt37S8uwJj6O65dJ1jcodYZrad0ytmo+4RN0B1S6+0cBgJKiJO6LhZpQZV7MH2MMkC3+DH/laaloQ91MKMbFvkKkE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740157476; c=relaxed/relaxed;
	bh=PmF54Ejccm6H1BS21XLzObPH34mHtte2hx/2br9r+L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cX75cJTl3E0jRvRs+O2iVOVHdgJdVwjmuuqOxnKvurTeCh+KOQnujMQdXuQ0UOVk1nquY/VjgJa6tlaE5Dwygn5CzBMiwCMejRmq+vHZ12mkebujM2rOOVqvmo0FfTxVY+Vrdj4u0H/PLcZVvwGLYf0be8ItSM/PLYOYLi3Yai2nrRX+NRNGHmmvTWq9ykV8w5O1FHcKtU9H36kjq/loGTexz8z12b1dx1rlVpVFcrNgJ3TSrVZofoBjwbgOWVu2VNy+UO234Y1v6tsxw7FZpLMLIJfB4ct7DSu1EY05U+d0nKaSLI1YiyCEx4I1PM9WMZsr+CEQ90m6AUQ76FgXnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rejCUcjj; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rejCUcjj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 470 seconds by postgrey-1.37 at boromir; Sat, 22 Feb 2025 04:04:35 AEDT
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YzxLq6Fxkz300C
	for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2025 04:04:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58EB861510;
	Fri, 21 Feb 2025 16:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EC6C4CED6;
	Fri, 21 Feb 2025 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740157000;
	bh=4NYNCyUlBCcUiP2flqZ7vpZ04JrfY05TT3Q9of0jt1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rejCUcjjFUhWfC4zPJeNa1HrBYGq2xsIqO0ZPaU8aMD1mp8MbDX81KHJKm8uC1N4G
	 nZ1Uip6A11axdtE8FsNCFX7Aq9EnYmS46aoACenNEv0ma2HctX5SbNSwqAZRLyGMWC
	 lyRKYCXrGs8JR1p66yMCStilgPUAaCcbaXQ27IRa0daLgmqXucCHpzWn1c9qzULyVJ
	 bwWxE7Mf0fc1oE0RYZRole8xO6UtHf1xx1VmsUr2I9YVpWXkODSr265pUQVWcajUh/
	 Fqo0kKew/oQiCo693InP0JB0KlhaxgZKb72mseLhCyftg1IVG/4hTFdDfhBQnUOejn
	 40vGGHGGJiz4A==
Date: Fri, 21 Feb 2025 16:56:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Eason Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: add NCT7201 ADCs
Message-ID: <20250221-spinout-opt-7d9b5a529610@spud>
References: <20250221090918.1487689-1-j2anfernee@gmail.com>
 <20250221090918.1487689-2-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JLz+NO4dK9qNL/Og"
Content-Disposition: inline
In-Reply-To: <20250221090918.1487689-2-j2anfernee@gmail.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Feb 2025 10:18:50 +1100
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, gstols@baylibre.com, joao.goncalves@toradex.com, andriy.shevchenko@linux.intel.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, krzk+dt@kernel.org, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--JLz+NO4dK9qNL/Og
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 05:09:17PM +0800, Eason Yang wrote:
> Add a binding specification for the Nuvoton NCT7201/NCT7202 up to 12-bit
> ADCs with I2C interface.
>=20
> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> ---
>  .../bindings/iio/adc/nuvoton,nct7201.yaml     | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct=
7201.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.ya=
ml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> new file mode 100644
> index 000000000000..830c37fd9f22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct7201.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton nct7201 and similar ADCs
> +
> +maintainers:
> +  - Eason Yang <j2anfernee@gmail.com>
> +
> +description: |
> +  The NCT7201/NCT7202 is a Nuvoton Hardware Monitor IC, contains up to 1=
2 voltage
> +  monitoring channels, with SMBus interface, and up to 4 sets SMBus addr=
ess
> +  selection by ADDR connection. It also provides ALERT# signal for event
> +  notification and reset input RSTIN# to recover it from a fault conditi=
on.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nct7201
> +      - nuvoton,nct7202

When you respin, please add a note about what differs between these
devices that requires different handling in the driver.

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        adc@1d {
> +            compatible =3D "nuvoton,nct7202";
> +            reg =3D <0x1d>;
> +            interrupt-parent =3D <&gpio3>;
> +            interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>;
> +            reset-gpios =3D <&gpio3 28 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3864d473f52f..fdc4aa5c7eff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2831,6 +2831,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subs=
cribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/*/*/*npcm*
>  F:	Documentation/devicetree/bindings/*/*npcm*
> +F:	Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
>  F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
>  F:	arch/arm/boot/dts/nuvoton/nuvoton-npcm*
>  F:	arch/arm/mach-npcm/
> --=20
> 2.34.1
>=20

--JLz+NO4dK9qNL/Og
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7iwQAAKCRB4tDGHoIJi
0lg0AQDsCEVD4EkUP/fg7wjfm3Cmgy9UN51JuRZ9eaXp870WdQD6A/esC7erCxcf
CxjVOVmPKf/shRAcubLnpnBnLq4xlQI=
=Az49
-----END PGP SIGNATURE-----

--JLz+NO4dK9qNL/Og--
