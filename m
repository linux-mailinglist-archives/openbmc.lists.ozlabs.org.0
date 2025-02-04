Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A430FA27B4F
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 20:31:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnYPh3C5Nz3bSr
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2025 06:31:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738697461;
	cv=none; b=eTO23KgBf+czKroSA3pCetE4894EDqXbfDP4Ix26oka4mtxK3khVPmlshE0KS8q38FzyQLvbDB2DfVKkEnt4JwTxZ2FJlvoHDTCL9XA43FaZ/6Ud8NSHnSO2orziPDI13+foNBd8qBLfRjDlpE+xYj/CEQEqrncW3N3kUdpB02Y3o03Xzk71DKsy+qW8FjwIwaWCHlQvyMndhWDOmjhYr0xdnk76Xcy7FF3BGcIcpoAuD8ezAdlP7sI68wY9jK+Qo2eo6GFd/fFWYTRV5cy8zxW4lzNBA9U/nhhlR4OYG4C+NKTvl0PPZryKehXijocPO6KLoEhUrYHctmcTIzHmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738697461; c=relaxed/relaxed;
	bh=Q1wT9qVF3f4f4tUE1P5oM6Q6VhPe74PG5Vx6sGjHCWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dx57o528teD8RGaAvsh0wDT80PqtT7oLtnIE9r/4A2hjRVZ3m39Wwmlj+rnkCPWVp0jKHsY0038ofQWEoxenTFLPwVcjnYQpl3mTTQl08+fQ9T1SszLxAtla9zx6dzqYQnKil9hFEp6Qp7bFYMUwaENLHpy8eQsNAbYsaxIIBQc01xrGt2mMD70DGbQ4vl/GRst17e3fcogPO/OVJKG6Sqg7PJPkmjTRetm3CZh7gWO+Ay4BbeJb4o2xEp9TWCXkYm+RlcXbJPX9Xt+DcTuv8QGt2Y5Y/NjiF4R0NbfL+z6ahzgYxrbuy7WydAlx6kC4tV1ugatYJ2MOZ336qmsFVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QMpnY06C; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QMpnY06C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnYPc61H4z2ysv;
	Wed,  5 Feb 2025 06:31:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 400225C67BB;
	Tue,  4 Feb 2025 19:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EF8C4CEE2;
	Tue,  4 Feb 2025 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697458;
	bh=xHGH4a/Ywo4+o/ZzmwaCuhzBpYplcQuCjUSy9UL7dtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMpnY06Cph7s50YtSLnzh0whrBYj3+19NY8J/lXEJ5PtGPfiAqMLpaMv8pnJTFb0P
	 93oj+nkxIft/kgW92UACbNRdrZHHsuam2LDq3HHEy+Q2UlC5ngXXAjzLiTFmLRLuDx
	 43mtYvjCbAu2z+dzJzeQcFMNir+YLla30E7ytuMnJqpXDT0D9O+o3rpdwm1QMEqK52
	 eNZ4kpudcDR3Y8h8h8Uj61hw9nLJA6nXk92J694aOrDyitUUm8+Kp11wNoEbYE/LSG
	 FEpgIxGpOVPrGgqzJZYNcv6igP9KVImNEoKuY1qzDC/Toh2oV82rNQisd0Q2ALOSm9
	 gPhd3dYCEHM1A==
Date: Tue, 4 Feb 2025 19:30:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH] dt-bindings: media: convert aspeed-video.txt to dt-schema
Message-ID: <20250204-from-catsup-132a4af05f49@spud>
References: <20250204062822.3738037-1-jammy_huang@aspeedtech.com>
 <20250204-acronym-unshaved-18b89a389091@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S4lsoQVavYeukAq/"
Content-Disposition: inline
In-Reply-To: <20250204-acronym-unshaved-18b89a389091@spud>
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


--S4lsoQVavYeukAq/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 07:30:03PM +0000, Conor Dooley wrote:
> On Tue, Feb 04, 2025 at 02:28:22PM +0800, Jammy Huang wrote:
> > +  aspeed,scu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Specifies the scu node that is needed if video wants to capture
> > +      from sources other than Host VGA.
> > +
> > +  aspeed,gfx:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Specifies the Soc Display(gfx) node that needs to be queried to =
get
> > +      related information if video wants to use gfx as capture source.
>=20
> These two phandle properties are new and not mentioned in your commit
> message. Why have they been added?

nvm, I see Krzysztof has already responded to the v2

--S4lsoQVavYeukAq/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Jq7QAKCRB4tDGHoIJi
0u/dAP9W0ZzsPi1nGv0y3Mt5OGgJcbcIllWIJygiE1g/EgrSHAEA/s0hskJKMuu/
a2utbby4wEBmS2pfmG8tdx84sTac9gY=
=jK5r
-----END PGP SIGNATURE-----

--S4lsoQVavYeukAq/--
