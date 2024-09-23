Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B0983911
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2024 23:24:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCGFh2HQxz3c5F
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2024 07:23:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727126628;
	cv=none; b=YCDLEDC3fJYzFOAaAkG/T0Bp5zogaIoBnze4ipqdULkComdUA1qAKcfjKk5uD/1mRhKCldOj67cq3ToxrJfibs2sBQ9z0HqR5RE5aMR/iV36+O2iBiY2j85NHAx0+tGL9GDH4iJk9vezyg6zMg1MuH0U1GpMDj7NZ7MhStJkyM+5V0+u2eOw8oGx3DN8ipjvl2tcyBIhpJnzF3/Z6WskKXf1oEfijVPML1IvGyTEnOm5i4lLPQUHyFg2SMLFdH9Oz6nAmF8xLQd0Yw4yu4RBjmw9IMZ9FxmJmxjg18w4abPhdpoJJ8Z1aqnD4Ouwaiatf0g0LDK+9Q64oLtlBFFdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727126628; c=relaxed/relaxed;
	bh=PyoxAkm9JgyfVbUSq1e8N2U4lppCl4CIO5PherifYfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1UXedRihNdSRIAQwJy1Pg89tISPQWpyFoBLMFYcmRbhelY2ugEpiJTTs4EnTW+Ym4r/wCYyqLA1FZudSumDt0TiiId38MzmKucp0zoXCMwFLBm4BD1Ggy1y6Ksg3ji+N7ESQuyJzzTFkPfC2NTsau3NF5Khk4TJ7PmysylKBjkMUhRZn0u42mYngiSb2YJgAJkd2tgG6chWh1QXc/RyMxgZLfjk4YUKjv7oVXG18zm6v0fhav2/TS3kmGGRxdu1/mWPUctc5ipasIGZvtdra+fOyglT4f1exqvjv6pcJgx2cEg3ZezZDeoYlT9fRflJxLSsiLYJ8JL73KOQxwkRng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DWW5WqUH; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DWW5WqUH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCGFb5Sdwz2xm5
	for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2024 07:23:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C15B5C274B;
	Mon, 23 Sep 2024 21:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7E3C4CEC4;
	Mon, 23 Sep 2024 21:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727126624;
	bh=tj4LmrvGayH3XbbYtlkUr8l9vC6zcGbXYX0A15TEu4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWW5WqUHlB0Iq+flr9vUnaEgwPU099aociYwPrcfIJx1AP1dhptayX/uq4praF4Mq
	 rDz8VfnovTd9r3b7esT4ClSZnrzkpgWIv0r8DTH+jgp3JHMLA0rq/R8Ex4jS06S2Xf
	 Ma3WgsvmHom2mPKXHZehZJPTd6WzvdGTafcuqm0kiOZ7HBWpPEF3b1tHyWOFuDxPyq
	 2yUwWwNhVYxfe1icSyFWank+6OZ3cU0aGkU7+zGchOSBpxH1FQoLW6lACbHMpQgm0y
	 VpO5ZHcEkk42YguFpHIK6StJbu3RZqr/eSpVCHHFK/oVTKuGfsmVZNkjSh2OhFubqL
	 jj+kEjArkoVog==
Date: Mon, 23 Sep 2024 22:23:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: Re: [PATCH v2] dt-bindings: trivial-devices: add onnn,adt7462
Message-ID: <20240923-private-grower-af6a7c1fca09@spud>
References: <20240923093800.892949-1-chanh@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qNZzXI/TECE47qmF"
Content-Disposition: inline
In-Reply-To: <20240923093800.892949-1-chanh@os.amperecomputing.com>
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
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Phong Vo <phong@os.amperecomputing.com>, Peter Yin <peteryin.openbmc@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, devicetree@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--qNZzXI/TECE47qmF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 09:38:00AM +0000, Chanh Nguyen wrote:
> The adt7462 supports monitoring and controlling up to
> four PWM Fan drive outputs and eight TACH inputs measures.
> The adt7462 supports reading a single on chip temperature
> sensor and three remote temperature sensors. There are up
> to 13 voltage monitoring inputs.
>=20
> Add device tree bindings for the adt7462 device.
>=20
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
> Change in v2:
>    - Add onnn,adt7462 to the list of trivial devices       [Guenter]

Is this really a trivial device? If it monitors and controls fans, how
come those do not need to be represented in the devicetree? How is it
possible to tell the difference between monitoring 1 and 4 fans without
the extra detail?

Curious,
Conor.

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 0108d7507215..15f89d7ecf73 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -311,6 +311,8 @@ properties:
>            - nuvoton,w83773g
>              # OKI ML86V7667 video decoder
>            - oki,ml86v7667
> +            # ON Semiconductor ADT7462 Temperature, Voltage Monitor and =
Fan Controller
> +          - onnn,adt7462
>              # 48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
>            - plx,pex8648
>              # Pulsedlight LIDAR range-finding sensor
> --=20
> 2.43.0
>=20

--qNZzXI/TECE47qmF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvHcWgAKCRB4tDGHoIJi
0sNEAQCC3S9W5Yf6XyOTvzS2qKXG/O9P9J+FP7FXrlBEWIaLLAEAkw9U5FDVFaoq
TX1eEOoIoUhUMlOZ+Tb/wSbZKUP1IQw=
=I636
-----END PGP SIGNATURE-----

--qNZzXI/TECE47qmF--
