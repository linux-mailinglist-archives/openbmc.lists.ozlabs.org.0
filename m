Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74AA3CBB0A
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 19:20:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRHzz5tccz3bTg
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 03:19:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QnQ6UbJm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QnQ6UbJm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRHzf1MVvz2ym5
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jul 2021 03:19:42 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 006786115A;
 Fri, 16 Jul 2021 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626455978;
 bh=+YpgeVl8kNOpkcg3zWxfdpfu5sUBR5DtgOZLtCe1KRY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QnQ6UbJmJg+lt8/7+N7cMghPA4UajH/Vbg3qSays2/rc98e2PQ53Ff1UUI3sBCSGx
 ADX37Hjr5LAknzQD9O2J1ddhV934Xwce9o6rz68mOTcKM7srohJteB8Tsr22PgLqb6
 ZVuUG6ZKBVAODkBTcJJ2nTmMia44dFweeN3vC74VqR/NhVMxyjqZcmYxSwmquE1tva
 KaPrPJvg8U44Sth/9+209aRaPeUGj/B3KQSjeQrHPeD+hSjJrihunv3d0RzoDEVstU
 +5E68tKkFGOLIYjzRB8qIFQwzRPUx7wENcuIWDyj4LMFFpJ17QXfEQ8S9vGWDLPZ4l
 2K03UEhsITTGA==
Date: Fri, 16 Jul 2021 18:19:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 1/2] spi: fsi: Reduce max transfer size to 8 bytes
Message-ID: <20210716171936.GB4137@sirena.org.uk>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
 <20210716133915.14697-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <20210716133915.14697-2-eajames@linux.ibm.com>
X-Cookie: do {
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, robh+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 16, 2021 at 08:39:14AM -0500, Eddie James wrote:
> Security changes have forced the SPI controllers to be limited to
> 8 byte reads. Refactor the sequencing to just handle 8 bytes at a
> time.

Which security changes where - somewhere else in Linux?

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDxv6cACgkQJNaLcl1U
h9CX5gf/ZGL0S2R8LTjv19bHHY3qmjDxNZSgznVmQxQtQuo444TlpJcK/zHW+uDT
yFigB3LpxINXizUgBU16bR5P4JnwISufdE/qKxKhKZsbSQnu3PgsKyVuM1Ih3157
Qq6YATY0HF6UtqUa1O/EgnLOKsIZN4DCvg9YWF0Os2moWvol8nEYtPl/n43oDecn
KeSSI7np9OEhA7RGRfZLcgMF67OWqune5U0nqLEPln4jiUTibMBci5Pf7f5KO8SO
pBDt8HBvL0UJ1AXCMcgeRDjjR/hhYChgurh9alnHc+NtogOeyK4pl/V0j9d+rHs4
LfKsz5VbX+qiaxEnue2Pdu/5hP6fDA==
=6cCz
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
