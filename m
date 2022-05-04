Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B8251A016
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 14:56:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtcK44GLRz3bff
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 22:56:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GiRoDcjC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GiRoDcjC; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtcJg1q7Sz3bbG
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 22:56:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12E8161698;
 Wed,  4 May 2022 12:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B761DC385A8;
 Wed,  4 May 2022 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651668958;
 bh=kTceZKaSae8dEs+i0l1pReBP7AnGtYSXSHGjRB5sBmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GiRoDcjCnjPMOR+OupvzqaEVdo+3p1ITb84GN+/B5EkRtVzdE40dsqPiMrDEXdz7P
 nkJgkk7rZ5dKw2PH1lN6vuU2ctPLb4371XlSLJcurETAY6957q9WThOe/qtKDXKtq1
 ANQSWjwp5+rf07iyjEC+TA0P8hpvjyuFtNvZEJS6X6Phivw9Cj+fxU1IynE02dAeVS
 jTK14uGFUP2xlM5bGK7XI2oYaSx8/1L3AGVy3N6YzwKp0ImPO/KsF77UVt7m/dnwUE
 +ho1ZXbFL7L8LSK2N1csXgBRX2uZfMoMbD+TAYZXXftTK9jH8nQ/bTG/OR7naGFDNZ
 9t241WyWfuNxA==
Date: Wed, 4 May 2022 13:55:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 2/6] dt-bindings: regulator: Add reg-external-output
 binding
Message-ID: <YnJ32bG4IkSrRtHV@sirena.org.uk>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
 <20220504065252.6955-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OeS2mizHPjpFFiLa"
Content-Disposition: inline
In-Reply-To: <20220504065252.6955-2-zev@bewilderbeest.net>
X-Cookie: Mother is the invention of necessity.
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--OeS2mizHPjpFFiLa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 11:52:48PM -0700, Zev Weiss wrote:
> This describes an external output supplied by a regulator, such as a
> power outlet on a power distribution unit (PDU).

OK, so this is that represnetation of the connection - which raises the
question about why the regulator needs a property?

> +description: |
> +  This describes an external output supplied by a regulator, such as
> +  a power outlet on a power distribution unit (PDU).
> +
> +properties:
> +  compatible:
> +    const: reg-external-output
> +
> +  vout-supply:
> +    description:
> +      Phandle of the regulator supplying the output, which should have
> +      the regulator-external-output property.
> +
> +required:

I think at a minimum anything like this would need some sort of
representation of how the output physically appears so that people can
work out how outputs are mapped to the hardware they see.  However we
already have a subsystem for external connectors - extcon.  Perhaps this
should be a regulator client in the extcon API?  It's common for
connectors to include some sort of power provision so it seems like this
would fit right in.

--OeS2mizHPjpFFiLa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJyd9gACgkQJNaLcl1U
h9AKZwf+Kv5LJYapRQXolMBLWWzK2Nn85PgabLCHlDg312x1LS4BqxJGYDX9mRTF
UAYoRIgM8itBAMqd/p2ia6jbpfynvjQ4R+hMx1rIKcPl3qIPV8X7MsLnutU9fjvg
StTLlWzLW/at2L1yGq3ca3PAqJZh/jZOaxU1EPdZNiuXUT0xet0lfvhxt4dGWiHP
ZoGd+muGLfNDflUHBs5jR87rD0WmL4c5/daPJoK47ZFXk2S2wJ0fBa/5l1kPLDkq
QfRmtNC5zFFAj3f5tZfJFt54ozljaCEPuaj7Jt4LVU8/DJDnkioYB5QiYe767X4P
uSBZMYJvEyIzr0gXgk9WJrVRthK1zA==
=VA9P
-----END PGP SIGNATURE-----

--OeS2mizHPjpFFiLa--
