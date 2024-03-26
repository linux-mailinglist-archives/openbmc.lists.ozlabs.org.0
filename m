Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DA988CBF1
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 19:25:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b28mlofq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3yrz55w4z3vZR
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 05:25:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b28mlofq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3yrM4bS3z3d28;
	Wed, 27 Mar 2024 05:24:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C95B6134A;
	Tue, 26 Mar 2024 18:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0572BC433C7;
	Tue, 26 Mar 2024 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711477471;
	bh=3xBRhog27kxC70sDx2aQpj3OzOt3xnmvvAsyDrsmcII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b28mlofqMpgdxgVoQwKl8xE5R3uFIancJn4ehIIqdxVvqItovYRjc0SScholjd/QT
	 GWuk/KKHJsAkhi505UdUHjsnvpf/1qlIHa0yMn6hV3w11DZOqTFfwSF8X/60t/JQ9/
	 jc6M4mWwT/YjK+WblM3Aq7Y1INPJmcz45pHvSpcppInNgQz4zB6q0cma1NXVV/0fs4
	 /I3HB2oSaVfGFVuY9gfatvsW22+uoQV9IEgAL83hxaxaBOPu5Hp4AL+aIYEaQiFfSe
	 f4PBLdf45fUGRRtaC2HGu1v4CzVhmmyhEilob1839hZkBy0S2pOfWyCSY+FN8PdAkw
	 7QXys+J0KIVjg==
Date: Tue, 26 Mar 2024 18:24:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Message-ID: <20240326-april-word-972cd4836e81@spud>
References: <20240326103549.2413515-1-Kelly_Hung@asus.com>
 <20240326103549.2413515-2-Kelly_Hung@asus.com>
 <32cd6f33-b4e9-4b7a-bcea-b1f2e421d67e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/q+Q8QflJy7p9izc"
Content-Disposition: inline
In-Reply-To: <32cd6f33-b4e9-4b7a-bcea-b1f2e421d67e@linaro.org>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Kelly Hung <ppighouse@gmail.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, kelly_hung@asus.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--/q+Q8QflJy7p9izc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 12:36:50PM +0100, Krzysztof Kozlowski wrote:
> On 26/03/2024 11:35, Kelly Hung wrote:
> > Document the new compatibles used on ASUS X4TF.
> >=20
> > Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> Where did it happen? Where did you receive this tag? Please provide link
> to lore.

Robh's bot sent two reports, but I do not see a tag:
https://lore.kernel.org/all/?q=3Dc%3AKelly_Hung%40asus.com+f%3Arobh

> > Reviewed-by: Zev Weiss <zweiss@equinix.com>
>=20
> Where did it happen? Where did you receive this tag? Please provide link
> to lore.

Zev seems to have left a comment on this, but not provided a tag:
https://lore.kernel.org/all/20240223220115.GB9299@packtop/

Kelly, it is important that you do not add tags unless someone gives
them to you explicitly.

Thanks,
Conor.

--/q+Q8QflJy7p9izc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgMS2QAKCRB4tDGHoIJi
0sgmAP99qKHB+cAXDMc3qKChE30qQxxp/UYWhpZUny6oL3v5fgD/Vi2hhcCmf16A
C/hk3u2rhCGbNyawGryEwd6Z81hpgw0=
=cX+i
-----END PGP SIGNATURE-----

--/q+Q8QflJy7p9izc--
