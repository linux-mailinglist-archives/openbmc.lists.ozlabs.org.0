Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6A691ABDA
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 17:52:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CEkq0hQn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W933W2Xnnz3cYb
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:52:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CEkq0hQn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W932z0X2Zz3c13
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 01:51:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0D7C61F35;
	Thu, 27 Jun 2024 15:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56EAC2BBFC;
	Thu, 27 Jun 2024 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719503490;
	bh=8sNmBRbLYtnOF9l6k5kdWe+U29xtoepmvDGnR4Vle4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEkq0hQnBZ+KNYUesU7oE5e3CjPxEjIcd+kDInMzgBmoqMrWOBCZjMFuNDFksaLgA
	 B349Jiu41uqUzX+CtcDiWGgV7bIMsSwNyNw9IkCB1qoOCBS8t6b/XW1rrKG4R1rOUE
	 4qC7axIyxiMNpaPpA+/n/qgHBa5XDsuGvigOnz73uxhU+lnx6wlHvnZdb+xfT0YMI4
	 q5ONx4IfGxclT/naaa2lJETxyQD8xhU0w1KzDRdBDoUEryhCEn2oQFRRHeowiWcULD
	 EvCQQrEphJ4gXeMz8S0mumv4QPuCm8PqJRdbZs4WK0eAqQryrvv9HkA5zZBup742WK
	 Zxhe4UF9mJ4og==
Date: Thu, 27 Jun 2024 16:51:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v3 06/10] dt-bindings: net: Add Synopsys DW xPCS
 bindings
Message-ID: <20240627-hurry-gills-19a2496797f3@spud>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
 <20240627004142.8106-7-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KQdBdOR3fsoaQVmH"
Content-Disposition: inline
In-Reply-To: <20240627004142.8106-7-fancer.lancer@gmail.com>
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


--KQdBdOR3fsoaQVmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2024 at 03:41:26AM +0300, Serge Semin wrote:
> +  clocks:
> +    description:
> +      Both MCI and APB3 interfaces are supposed to be equipped with a clock
> +      source connected via the clk_csr_i line.
> +
> +      PCS/PMA layer can be clocked by an internal reference clock source
> +      (phyN_core_refclk) or by an externally connected (phyN_pad_refclk) clock
> +      generator. Both clocks can be supplied at a time.
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    oneOf:
> +      - minItems: 1
> +        items:
> +          - enum: [core, pad]
> +          - const: pad
> +      - minItems: 1
> +        items:
> +          - const: pclk
> +          - enum: [core, pad]
> +          - const: pad

While reading this, I'm kinda struggling to map "clk_csr_i" to a clock
name. Is that pclk? And why pclk if it is connected to "clk_csr_i"?
If two interfaces are meant to be "equipped" with that clock, how come
it is optional? I'm probably missing something...

Otherwise this binding looks fine to me.

Wee bit confused,
Conor.

--KQdBdOR3fsoaQVmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2KegAKCRB4tDGHoIJi
0kCTAQDqWeZ7LyH0ZTe86qqVq1cd1SncHuw8+sZsegmlMUWaWgD/QLzoKs61xpZg
Gdvue5pIwWCgd5AWlNaYMf/fQIBK7ws=
=bQ4k
-----END PGP SIGNATURE-----

--KQdBdOR3fsoaQVmH--
