Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B991C3F7
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 18:43:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DTdsSCmp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9h8W0YvCz3cjS
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2024 02:43:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DTdsSCmp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9h800B5dz2ysX
	for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2024 02:43:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38D1DCE4216;
	Fri, 28 Jun 2024 16:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC1FC116B1;
	Fri, 28 Jun 2024 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719592986;
	bh=/k1CPyU+XO2vXsbEnUV0QGlSHspgxIC0z5i/wwJgdsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTdsSCmp/RV3A0DWzYJo5AY5jA6vTjzSmfYAvRAmsjcejNx+rZ5x209iqIc4/hpSo
	 j3QbrCS5MLZ2CsJIVid/k4a6xgeb6lqe04SheFd78mUZ8MU31dj6oOUbCQP3lm/vTH
	 yviwXfPLD4odoqzN9OUcNaxPvQklUukKh7r3jKDd1Dxnf1Utl8c09LnN4+gUzndEmv
	 XfayDPc4WE7vMMIkY3Ea5q4/IqxQhne4bOKB/HtMAaXbJsZR4nFcWosgsTprm8pqAJ
	 hqJwVXZCIxEE+UtLXksaioXvIBQi7pVOnIARt5FNSX6xpydywhJKpB1hhskB0Cw0/X
	 mJjfAh/GBjgYQ==
Date: Fri, 28 Jun 2024 17:42:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v3 06/10] dt-bindings: net: Add Synopsys DW xPCS
 bindings
Message-ID: <20240628-ovary-bucket-3d23c67c82ed@spud>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
 <20240627004142.8106-7-fancer.lancer@gmail.com>
 <20240627-hurry-gills-19a2496797f3@spud>
 <e5mqaztxz62b7jktr47mojjrz7ht5m4ou4mqsxtozpp3xba7e4@uh7v5zn2pbn2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BMxyj/+lWel1Q7do"
Content-Disposition: inline
In-Reply-To: <e5mqaztxz62b7jktr47mojjrz7ht5m4ou4mqsxtozpp3xba7e4@uh7v5zn2pbn2>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--BMxyj/+lWel1Q7do
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 08:10:48PM +0300, Serge Semin wrote:
> On Thu, Jun 27, 2024 at 04:51:22PM +0100, Conor Dooley wrote:
> > On Thu, Jun 27, 2024 at 03:41:26AM +0300, Serge Semin wrote:
> > > +  clocks:
> > > +    description:
> > > +      Both MCI and APB3 interfaces are supposed to be equipped with =
a clock
> > > +      source connected via the clk_csr_i line.
> > > +
> > > +      PCS/PMA layer can be clocked by an internal reference clock so=
urce
> > > +      (phyN_core_refclk) or by an externally connected (phyN_pad_ref=
clk) clock
> > > +      generator. Both clocks can be supplied at a time.
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +
> > > +  clock-names:
> > > +    oneOf:
> > > +      - minItems: 1
> > > +        items:
> > > +          - enum: [core, pad]
> > > +          - const: pad
> > > +      - minItems: 1
> > > +        items:
> > > +          - const: pclk
> > > +          - enum: [core, pad]
> > > +          - const: pad
> >=20
>=20
> > While reading this, I'm kinda struggling to map "clk_csr_i" to a clock
> > name. Is that pclk? And why pclk if it is connected to "clk_csr_i"?
>=20
> Right. It's "pclk". The reason of using the "pclk" name is that it has
> turned to be a de-facto standard name in the DT-bindings for the
> peripheral bus clock sources utilized for the CSR-space IO buses.
> Moreover the STMMAC driver responsible for the parental DW *MAC
> devices handling also has the "pclk" name utilized for the clk_csr_i
> signal. So using the "pclk" name in the tightly coupled devices (MAC
> and PCS) for the same signal seemed a good idea.
>=20
> > If two interfaces are meant to be "equipped" with that clock, how come
> > it is optional? I'm probably missing something...
>=20
> MCI and APB3 interfaces are basically the same from the bindings
> pointer of view. Both of them can be utilized for the DW XPCS
> installed on the SoC system bus, so the device could be accessed using
> the simple MMIO ops.
>=20
> The first "clock-names" schema is meant to be applied on the DW XPCS
> accessible over an _MDIO_ bus, which obviously doesn't have any
> special CSR IO bus. In that case the DW XPCS device is supposed to be
> defined as a subnode of the MDIO-bus DT-node.
>=20
> The second "clock-names" constraint is supposed to be applied to the
> DW XPCS synthesized with the MCI/APB3 CSRs IO interface. The device in
> that case should be defined in the DT source file as a normal memory
> mapped device.
>=20
> >=20
> > Otherwise this binding looks fine to me.
>=20
> Shall I add a note to the clock description that the "clk_csr_i"
> signal is named as "pclk"? I'll need to resubmit the series anyway.

Better yet, could you mention MDIO? It wasn't clear to me (but I'm just
reviewing bindings not a dwmac-ist) that MCI and APB3 were only two of
the options and that the first clock-names was for MDIO. Maybe something
like:

  clock-names:
    oneOf:
      - minItems: 1
        items: # MDIO
          - enum: [core, pad]
          - const: pad
      - minItems: 1
        items: # MCI or APB
          - const: pclk
          - enum: [core, pad]
          - const: pad

--BMxyj/+lWel1Q7do
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn7oEgAKCRB4tDGHoIJi
0vUkAP91mL5HozxNT6oDCThjtd+7mltthe8Q+r0IJLYFCEMEEgEAma2+j1iod5gj
qAd6c89tOFymOHfSWvAKjyGEyH9YZwE=
=8AMU
-----END PGP SIGNATURE-----

--BMxyj/+lWel1Q7do--
