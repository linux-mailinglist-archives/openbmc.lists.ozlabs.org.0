Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A16E05F6AB0
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 17:33:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjwTJ4DN6z3cfB
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 02:33:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dqylxaX+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dqylxaX+;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjwSc0Gkwz3bjy;
	Fri,  7 Oct 2022 02:33:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9AF18B82067;
	Thu,  6 Oct 2022 15:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2208C433D7;
	Thu,  6 Oct 2022 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665070393;
	bh=b5fz2Faps9g6VlZUHemqmOjeGlkHE/XuO+Ju+7K214A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqylxaX+JXllTIj8yLEPkVZBqPOA8RVrx3AnU9xEinCebuNlOnMyggpT2Y80GCOKD
	 jn8iiFVa+0tWfLJIarZ3gsc9/5t0tmhNFVpZDSmYTxEm3+VkTnm0l0SUpgjsEB63l2
	 CggpubewSFAbm+eamVnZO4CyMN9gRy+UD59XmmVr4BYO4qxyiS9KmAjYRaSobvpfXz
	 DnSX30IFKdyjSNgEeCssZktyaIUkNxCpFB7k0Lc+SXVgkoMAgW8m2BDe1NFSnP52GJ
	 X4HbSOH8Yj7yBUvZLDbotfkDUcHGpOI7PFo5Ulpg6CEjrH0C7sa5mARjW+j67nRLWp
	 XjHxO0UAdVaJw==
Date: Thu, 6 Oct 2022 17:33:10 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v10 3/3] i2c: aspeed: Assert NAK when slave is busy
Message-ID: <Yz71NjbmLZeRpmM2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	thang@os.amperecomputing.com
References: <20221004093106.1653317-1-quan@os.amperecomputing.com>
 <20221004093106.1653317-4-quan@os.amperecomputing.com>
 <Yz3VmWCqdolKg5sm@shikoro>
 <c8c774c5-b274-a6f9-303b-e84c50800b5c@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+SCqpgtCPKo+UDYP"
Content-Disposition: inline
In-Reply-To: <c8c774c5-b274-a6f9-303b-e84c50800b5c@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, thang@os.amperecomputing.com, linux-aspeed@lists.ozlabs.org, Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--+SCqpgtCPKo+UDYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thank you for your patience with me through many versions.

You are welcome. In the end, I think the update of the target interface
is an improvement, in deed. So, thank you for that!


--+SCqpgtCPKo+UDYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM+9TYACgkQFA3kzBSg
KbYACw/9E3V2Y6ViQwRZW439rY0GLtJGPos89UPLB3b8h2XUl/8KWQBrU4MDD46d
6VEho+Ae8+5OHpqczwMiXkgc+Z/Yc0OtfOUXCqEr339KH09Z2k930RdTb20dZf6t
UZbq+wAaD9xn4nXBMEBM3YoBDbncbhTEamK0mKkh5lHmD2fZqXXRqpbBtwSZXN5s
Y+Oshsl9cuGEkqde5gVhRR1DWJrOesWHmg51VhBvq0E74sSlWc3D4ByKYJ2K95qw
w0gd48NMY5vtSvM8e2X2SqA/1rwYYi91bn5xFCM0hSXWmAU+hKhEW6O0rQrbZPu1
9mwoOHEvTanaLpYiWCsnevEgEsLifpiKMlojSmQZIQLeFLTg69K36Gdyb57mNzD1
4+Mb5QP4yjHkjA9uwr03qJv08xDKmQtnQhO/dkjz0iAE3uxdpGYb3XB0chL+YI7p
rJV9CIETC+HFpzrKiOu9XGRNnLzu7dJ6Jx489UKzS+d2cofL+gZMTsAkeu1WXBEj
UY8cqIm1rxaOJgy8SBotNJssqRS7TGL/TYtXFgFtQIJ2pISQHB1Yc9FdZSRdXHLF
5wRpQZlTnIS9/wL/K29aAvePtLJHbDhUgaDIqU0JgNEdA1wA9wUj0RK0FrQyHBP0
W96sDicwz7oVBGNZuX1lQHtfYGZqdBPIllgG8XaGlwNlwgRCiyg=
=WHBN
-----END PGP SIGNATURE-----

--+SCqpgtCPKo+UDYP--
