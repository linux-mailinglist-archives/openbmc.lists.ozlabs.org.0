Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCFC3CFA3D
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 15:13:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTfKb71bcz30Jw
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 23:13:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dlu6Q+yS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Dlu6Q+yS; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTfKL0dYrz2xxg
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 23:13:10 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66AFB61106;
 Tue, 20 Jul 2021 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626786787;
 bh=al7tI0KVVLdEI4uEKfWFTCtxVhUgyhsr1HgYUh500/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dlu6Q+ySyWZD/KOuzvnza5z39lV+sx/aVol9fNomcLzbau6nuEWQ4LKJ8WvHxRgFM
 iAfLf4SxCoqV2s7L19ynzMrcOk4oPJzPfAK9bNwIEPMaotlhMhcqt9EyA4phEjyoA4
 g5s1Qtgj9z53VBqvMQVhCRoQ6TmP7anJTwRknLd7W0o34WL4x5E3Aoa/Kv+PwkKXZz
 hGW5yFzBGaDaAt48sLWTDNdN4hOwbJtfcHay+2TbXIKgMLJU4McVc2ddm4VvL1Nq2p
 xSZSInGNJkpO77wcCmuWjyTqBeAdZUqVrenD8uEXl/dEIHR0q1Pn4wnd6JuFTjX6nx
 gc2SAuESGV84g==
Date: Tue, 20 Jul 2021 14:13:03 +0100
From: Mark Brown <broonie@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 1/2] spi: fsi: Reduce max transfer size to 8 bytes
Message-ID: <20210720131303.GB5042@sirena.org.uk>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
 <20210716133915.14697-2-eajames@linux.ibm.com>
 <20210716171936.GB4137@sirena.org.uk>
 <81a40f8690d297ebfb6697dbea63279bcf2f24fa.camel@linux.ibm.com>
 <20210719152010.GB4174@sirena.org.uk>
 <d2e07f0beda57ffeaa31e8cf5bf28edfbd982e58.camel@linux.ibm.com>
 <0a637d7704df4303abe783215080578d@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline
In-Reply-To: <0a637d7704df4303abe783215080578d@AcuMS.aculab.com>
X-Cookie: Revenge is a meal best served cold.
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 'Eddie James' <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2021 at 01:04:38PM +0000, David Laight wrote:

> Having said that, you might want a loop in the driver so that
> application requests for longer transfers are implemented
> with multiple hardware requests.

No, that's something that should be and indeed is done in the core -
this isn't the only hardware out there with some kind of restriction on
length.

> I do also wonder why there is support in the main kernel sources
> for hardware that doesn't actually exist.

We encourage vendors to get support for their devices upstream prior to
hardware availability so that users are able to run upstream when they
get access to hardware, this means users aren't forced to run out of
tree code needlessly and greatly eases deployment.

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD2y94ACgkQJNaLcl1U
h9CU5wf/TxYsQY9aTbblj5w4EVv8uLKbvy6PBj1SnrM4wfytzyTYihrRE6uCLTAS
Nn9FkI1moqB5RREdDHk4HKQOiZQ2SD5FZn9jM5VV74hMRgyU70vk6DcgobQVYS2h
YE23Evtq4wcxvTHbPHhZcYYj8NcoUbsbabuGB8smW5DU0qP8uVe8T1bTPcnBWE6g
fXVdzjeRDykoTPTariCs1V02ZdqORUtSJF1TXJPaI2tLTqPEoBNPJzx2fgocdB7D
jK1YKiTQV/TI+GED/c9cbvs+QW/uhBcJ7WVvqHrDcg8JnpRwVPp0K/x61vX0VeLq
AN8yydmcf/WWsUCHBc1fwemQYA4WBQ==
=Dkpn
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
