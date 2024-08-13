Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E034950932
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 17:34:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BqBJQhB2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjwRK4KbGz2yQG
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 01:34:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BqBJQhB2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjwQn5RH8z2y8l
	for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2024 01:33:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 14158CE167C;
	Tue, 13 Aug 2024 15:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E2CC4AF09;
	Tue, 13 Aug 2024 15:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723563231;
	bh=aBoadrasI7W57NZaSVKLOZTY0EhuP2+mHH77sl5XLqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqBJQhB2BTi81gvNKtt+5KE+UVicUbzTqXIUYTCN25rM9EdjT7sFBgt2FxXZQY5b4
	 omVRq/AGr0pgos0eOM1nIPIbWgND0BD8PF13j5PQ6qMy6+FCx+ID5SowOocMv/lfYl
	 JLTfHwSRC6Srixo9FEBbTYwM5/LSKxBlZaAGTGqwoCOD6xBoRz+wr29Kj2XOhdO0rI
	 p3CDQZUU/BU0/iqpFIzAEqcgZ1/e6JLM6hZHwtGr6l2+B+bzLtZEgQPauW69Z8Asnt
	 z0S9UjfWJjXj9WXSDZJAYKR7pjxlmuE+ZPgSoGSCMWlnFBDRTA7aqizh1cqa4KlBpo
	 zgsm2KbaGCjxw==
Date: Tue, 13 Aug 2024 16:33:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: hwmon: Add maxim max31790
Message-ID: <20240813-sister-hamburger-586eff8b45fc@spud>
References: <20240813084152.25002-1-chanh@os.amperecomputing.com>
 <20240813084152.25002-2-chanh@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KmLWo4HnUrmMuilX"
Content-Disposition: inline
In-Reply-To: <20240813084152.25002-2-chanh@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Justin Ledford <justinledford@google.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--KmLWo4HnUrmMuilX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 08:41:52AM +0000, Chanh Nguyen wrote:
> Add device tree bindings and an example for max31790 device.
>=20
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
> Changes in v2:
>  - Update filename of the maxim,max31790.yaml                        [Krz=
ysztof]
>  - Add the common fan schema to $ref                                 [Krz=
ysztof]
>  - Update the node name to "fan-controller" in maxim,max31790.yaml   [Krz=
ysztof]
>  - Drop "driver" in commit title                                     [Krz=
ysztof]
> Changes in v3:
>  - Drop redundant "bindings" in commit title                         [Krz=
ysztof]
>  - Add the clocks and resets property in example                     [Krz=
ysztof]
>  - Add child node refer to fan-common.yaml                           [Krz=
ysztof, Conor]
> ---
>  .../bindings/hwmon/maxim,max31790.yaml        | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max3179=
0.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml =
b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> new file mode 100644
> index 000000000000..d28a6373edd3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: The Maxim MAX31790 Fan Controller
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>

Why Guenter and not you?

> +
> +description: >
> +  The MAX31790 controls the speeds of up to six fans using six
> +  independent PWM outputs. The desired fan speeds (or PWM duty cycles)
> +  are written through the I2C interface.
> +
> +  Datasheets:
> +    https://datasheets.maximintegrated.com/en/ds/MAX31790.pdf
> +
> +properties:
> +  compatible:
> +    const: maxim,max31790
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^fan-[0-9]+$":
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      fan-controller@21 {
> +        compatible =3D "maxim,max31790";
> +        reg =3D <0x21>;
> +        clocks =3D <&sys_clk>;
> +        resets =3D <&reset 0>;
> +      };
> +    };

What does this example demonstrate? The one below seems useful, this one
I don't quite understand - what's the point of a fan controller with no
fans connected to it? What am I missing?

Otherwise, this looks pretty good.

Cheers,
Conor.

> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      pwm_provider: fan-controller@20 {
> +        compatible =3D "maxim,max31790";
> +        reg =3D <0x20>;
> +        clocks =3D <&sys_clk>;
> +        resets =3D <&reset 0>;
> +        #pwm-cells =3D <1>;
> +
> +        fan-0 {
> +          pwms =3D <&pwm_provider 1>;
> +        };
> +
> +        fan-1 {
> +          pwms =3D <&pwm_provider 2>;
> +        };
> +      };
> +    };
> +
> --=20
> 2.43.0
>=20

--KmLWo4HnUrmMuilX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrt82QAKCRB4tDGHoIJi
0mfTAQCIh7cHlaxYyQpgjq8jaFAybQNe1wPKzSldTsOMfKR2tgEA9R5fCsaqh07Y
tdouMeBz+xGCY7U3NBLB02Z6xDiydAc=
=CZ86
-----END PGP SIGNATURE-----

--KmLWo4HnUrmMuilX--
