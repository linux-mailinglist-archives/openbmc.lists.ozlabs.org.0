Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048A519FAB
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 14:36:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtbtH1N4fz3bfR
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 22:36:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=poc+PVxB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=poc+PVxB; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktbst20R8z3bYM
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 22:36:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 214B7B82582;
 Wed,  4 May 2022 12:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B56C385A8;
 Wed,  4 May 2022 12:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651667772;
 bh=HzGvB9CCpC11C8Cqx5ROkgu5ak8t8rYI3wecQARRh6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=poc+PVxBbj4u1k6ULEs5eDwAqQ0b3vkXKzN21uf55zgCMYaK8iP45Mb/Dxw5wuL5/
 T7KXxBzq6/o4W0EamSWmTt7VWBQv/P7nBJJZbJO9V+iXyWGMdiXCyA03zc3YLMKVxx
 cGSzw0TzVpS6BjulxoCpz2Hrk0WJUFxwZAoUqzgOnv29y03Pohfz/xU5Wh9duy40C2
 llKVCiK23dcgLXjCHRr7p8jiISl6QHccQ54Pwvb+7yC9vq31Mml6v/dM59YArf8XR/
 +OaKYRn+6A6zy3IalreBpn7gkhaFDS5mXLksecyq0zK4HkW5CQddo0jyRCZ9Xiaips
 Q6rON2+a8mHDg==
Date: Wed, 4 May 2022 13:36:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 1/6] dt-bindings: regulator: Add
 regulator-external-output property
Message-ID: <YnJzNoM17ZLoQJdk@sirena.org.uk>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dHNaXTnT9yGpJ6h3"
Content-Disposition: inline
In-Reply-To: <20220504065252.6955-1-zev@bewilderbeest.net>
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


--dHNaXTnT9yGpJ6h3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 11:52:47PM -0700, Zev Weiss wrote:
> Some regulators do not provide power to anything within the system
> described by a device tree, and simply supply an external output.  The
> regulator-external-output property can now be used to mark such
> regulators.

Why not just add a device representing this output?  Presumably it has
some other properties (eg, labelling for a connector) and may need some
integration with some form of control mechanism.

--dHNaXTnT9yGpJ6h3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJyczUACgkQJNaLcl1U
h9DONgf/TnKauW2D2FMve+R72GPbx65yXEI1OuQ2PY8lehkxxXbA8NB22x892fZ5
evHWspiwPjOpdJ/Rlos9hs8jMgjue6BdSOPIGvzczXAM5PtOpZ8CrklZuiDgxMzu
SqmK5y15AG73UhkQ8uzoCRXIRgUo4JldAYNe9v1/Eu6RCoxQfJSaR21hLNgbDq0e
Z1ij5rG8dQe48v9u+VfEhVV1UpG+TQKHrBm+j/V6JS5QVfHcxMXPspi29FehOlOo
7PGhjjyCxwu121HD6ehHuHQM1LDIEgPNEZYi4b8KtKXjth08Z/hz9GiXRpduCmTr
yxUyqqpfHogr6Vp9jKJdfvB6UKcXuQ==
=gOK4
-----END PGP SIGNATURE-----

--dHNaXTnT9yGpJ6h3--
