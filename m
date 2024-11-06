Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6D9BF919
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2024 23:18:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkKMY24xxz3dSr
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 09:17:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730909599;
	cv=none; b=ORzG32qsRqo4558f6Jp3wm6TfkNuGbXgLhWYtn+K+dEwOYXjw2JFT2pDLJ1dAcUHVnZTeLoqKVlz2S4RZkdQXb8JYVF51OkwVMTGTAOwdqlyzg2uSRbev58y0HHzRMm9rplegcScV+6OosPSHYs1JGABH3cUBobwuLX0PMjTghNhw1p4luo9ZUFpUzm4UrdcBq24yPgNg48JrB6/OcHxGDxiSwHEVGs63UK8++nkN1e9TDz24o4vXNO87esYBlpU7l1DkfYDbQCsLCJfrvxdfHQIK5maRVHcUlS6Pcz22rehC93rwWdCCkA5/JmxSOHIIG6Et0QKpJKHuJn6pxFBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730909599; c=relaxed/relaxed;
	bh=YBASNF6daobaecWfAiCQfsu4ScCUTHaYV/WgGQ65WJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zai7MVbJVn8KxvwIk4R8oGLCSGJiKp9DTV2tWr2kKZOrJFF+ADAxJklKS1PeRdkT6pbVtJRjT0/1vqrGQcX4BhDJx7M61T9pd3Og6wEWYrge9OG3f04aoZa8Vy9lMxwBMDj4lB3POu2AdcPAxyPNkP2mGlnhMlZH6a7dnBrdoKXj7e/XGux3UkWaSjHMZKgnpRGAe1sJmIV8MrqNpNgOvzR/vEfpygiIfFR99WAi9vIFIs+XSsAiSfK+l0C1YYjAlsTB/b2xy07CSdeDuJ9BasswuYA5UfLn6jqXW3rG456poa/8xRonNPCj+ah4BRZak5Bi2QFUO+tFEfQuZPpf+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cshKHZZV; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cshKHZZV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk9H02vcwz3bcj
	for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2024 03:13:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D007C5C58CC;
	Wed,  6 Nov 2024 16:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F3AC4CEC6;
	Wed,  6 Nov 2024 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730909592;
	bh=dTuD8etQK1as5a2h+NWAEDvTetEZY5ki9oji2OXxqRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cshKHZZVNpfpeAjwuoOwWomv7lCCQFOmVRMbCC7WT4kNyMQKFjWHoFPWb8GmipzYc
	 hIz+8lhyrssZigWqq3FKL/8XbVIC8I+ssq0aliIPCCs8TybGcfg+QxmVlsSoqfaTAn
	 OWv2KGutS01+3hTJTNPHjThOCdlvWxJEfIVoO+y4WN7+yae750oUsL585Jgx5zI1rh
	 m4/DToo8zuSBwwR6EtDxtwTCjrBHujBn4RfxUNhxIkwArjVeI2ck5bG4aA6sbQheDr
	 CNJbzUu1GbXnxNbO23+5n5eeqOuv01d+QJpMBg3vk8bKfX0LniFbRc7WjTOEDQvCU5
	 sTZ2YVnG+tolw==
Date: Wed, 6 Nov 2024 16:13:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
Message-ID: <20241106-humid-unwired-1d3fa1f50469@spud>
References: <20241106023916.440767-1-j2anfernee@gmail.com>
 <20241106023916.440767-2-j2anfernee@gmail.com>
 <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MjU5mkQF8kA0duUf"
Content-Disposition: inline
In-Reply-To: <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 07 Nov 2024 09:17:12 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, Eason Yang <j2anfernee@gmail.com>, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MjU5mkQF8kA0duUf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 11:58:06AM +0700, Chanh Nguyen wrote:
>=20
>=20
> On 06/11/2024 09:39, Eason Yang wrote:
> > This adds a binding specification for the Nuvoton NCT7201/NCT7202
> > family of ADCs.
> >=20
> > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > ---
> >   .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 +++++++++++++++++++
> >   MAINTAINERS                                   |  1 +
> >   2 files changed, 48 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,=
nct720x.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.=
yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > new file mode 100644
> > index 000000000000..3052039af10e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton nct7202 and similar ADCs
> > +
> > +maintainers:
> > +  - Eason Yang <yhyang2@nuvoton.com>
> > +
> > +description: |
> > +   Family of ADCs with i2c interface.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,nct7201
> > +      - nuvoton,nct7202
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  read-vin-data-size:
>=20
> Is it generic property or vendor property? I tried to find in the
> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bi=
ndings
> , but it seems this property hasn't been used on other devices.
>=20
> If it is vendor property, then I think it should include a vendor prefix.
> For examples:
>=20
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/iio/adc/adi%2Cad7780.yaml#L50
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/iio/adc/fsl%2Cvf610-adc.yaml#L42
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/iio/adc/st%2Cstmpe-adc.yaml#L22

An explanation of why it cannot be determined from the compatible would
also be good. Two compatibles and two values makes me a little
suspicious!

--MjU5mkQF8kA0duUf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyuVjwAKCRB4tDGHoIJi
0r8qAP9P7kaywRwDNIUfUhRZgobeyzxRZW+mS9lmBafdUk9w+wD/abZJkKEzZukx
MAAD/6b+6Bclx/ACc2ypkNzWVK4scAU=
=fggK
-----END PGP SIGNATURE-----

--MjU5mkQF8kA0duUf--
