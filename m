Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBDB560709
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 19:10:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY7JC4jgBz3cgT
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 03:10:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SO91+wnw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SO91+wnw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY7Hg56S0z3c9B;
	Thu, 30 Jun 2022 03:09:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A61CB61DDA;
	Wed, 29 Jun 2022 17:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D836C341C8;
	Wed, 29 Jun 2022 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656522588;
	bh=4bJvFFx7ZcxPoQfjBr9hzR8NIRYqurDvP08BnkCGIfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SO91+wnwTa89hRSXSoTp79ezg57zJGwf8HGqcEEn7epijpLCS8vAZnSLxA1x8CO1Q
	 aqCGDCX5pkN23N6MvilsV0Q6lrH9TJpR0IDCuqxqyjp3eqXRg0x6v6B0v6AxlNDSHj
	 69szh3v2AH/ZCtAN4xlDy0tkGdKPEHhFc3AbwR5f0LEAn5y0b8tc1oghqnIexY+GtR
	 nBnPKxStD/oTzMF6q8w00jjgjYZAh1F8L5Bw1b+10G5oOiB8RDRpfL3GM9sFmGeDEC
	 DllLL4qEZueiq4lG8pEqsgbgsovUv20WBC10MWYX9hbuEuaCNhspurOOu/oQebSZ+Y
	 PqGWCfgpLCtXg==
Date: Wed, 29 Jun 2022 18:09:42 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v3 2/2] spi: aspeed: Fix division by zero
Message-ID: <YryHVsrqNlhdwKzq@sirena.org.uk>
References: <20220622161617.3719096-1-clg@kaod.org>
 <20220622161617.3719096-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mK7klt+5JZlbXfIT"
Content-Disposition: inline
In-Reply-To: <20220622161617.3719096-3-clg@kaod.org>
X-Cookie: Victory or defeat!
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Ian Woloschin <iwolosch@akamai.com>, Ian Woloschin <ian.woloschin@akamai.com>, Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--mK7klt+5JZlbXfIT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 06:16:17PM +0200, C=E9dric Le Goater wrote:

> Fixes: 54613fc6659b ("spi: aspeed: Add support for direct mapping")

This commit isn't in mainline.

--mK7klt+5JZlbXfIT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK8h1UACgkQJNaLcl1U
h9AVewf/WQAmOe0+ScAYOGgcQEmnOEp4TS1cWQo0BAxd7OgZqLodwQqLfeM2CaMK
SXelE3kPHJunj/B2YC11bTbsgi8nvoA03dS6BXF8i2LPRzQq7+294VdOgkdap5ei
WA7lqQRSDAyaA4hAAJQqKSSM2zT9RYoXlVUXf/VUXX7KyLhMBjFuO2MuioX6Pzxg
VCcwaTnaximxm/beko5YUoaDgiixxbSA6L5yLAXckzD7OZ7xDhXllZSfd5A9/xe8
o9JRYNo8tutfLxLjCwBK0qRLgu9cPy++YF4qX8HfdayxRE1GXd23BH4GK0+8EhNe
vxvDGPtY4UV7LSZAFXFDociwrctE8A==
=Ag5J
-----END PGP SIGNATURE-----

--mK7klt+5JZlbXfIT--
