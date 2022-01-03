Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27375482F92
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 10:44:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JS9nv754nz2yp9
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 20:44:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcCLtTz7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fcCLtTz7; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JS9nR3WPbz2x9S
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jan 2022 20:44:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A09160FA6;
 Mon,  3 Jan 2022 09:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4581AC36AEE;
 Mon,  3 Jan 2022 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641203063;
 bh=ihGRiJtMqi1KackPQURTxGDLqipQgGwaNxDqfKCAvuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fcCLtTz7COwnFHF8HDOkCo76M0jaDy9+tnLxfu+o7qoBh/ocL9b4cCQ7AkjGy4RSf
 3fmAjZAcWDTkXglGrMalXzTA7rx9iiRTAu1dWCESgndBkn9HLghNOvJiU9C6eJ2J9r
 UE/lzm25TfjR/0FErn78a1+rjr4ALpJMUeZj4ubo01wX6esqmDsHLBlfqJu1dMVWPl
 IfiC511QnvkiJ1/1KXGHgC+TEgxJDhDV3xdyQ3ce8rozk73MBLuXj7ToI1Qd8aMgk3
 NvVt98gbNOoDe6xGCrQWgYuJleqiayC6Be6mw7dzDce6ZHD5IP+HxRs8oCwTV7jnhL
 7u67Wgt+Ln2bw==
Date: Mon, 3 Jan 2022 10:44:19 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sui Chen <suichen@google.com>
Subject: Re: [RFC Patch v2 0/3] I2C statistics as sysfs attributes
Message-ID: <YdLFc/sJDf8rrPQ6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sui Chen <suichen@google.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, joel@jms.id.au,
 andrew@aj.id.au, tali.perry1@gmail.com, benjaminfair@google.com,
 krellan@google.com, joe@perches.com
References: <20211203023728.3699610-1-suichen@google.com>
 <YapHznDoqJ+wjx8m@kunai>
 <CAJOps0u=seskB-YGvLBsHantJohkEX7do-mt7YSZ6zChQMQxbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SG3y9r3TeWn5kgv3"
Content-Disposition: inline
In-Reply-To: <CAJOps0u=seskB-YGvLBsHantJohkEX7do-mt7YSZ6zChQMQxbg@mail.gmail.com>
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
Cc: benjaminfair@google.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, krellan@google.com,
 joe@perches.com, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--SG3y9r3TeWn5kgv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> - Because we're targeting at-scale monitoring of fleets of machines
>    in large numbers with identical hardware configuration, the
>    I2C counters (including NACK) can be used for apples-to-apples
>    comparison, for detecting anomaly, etc., while this may not be
>    applicable to a single machine.

Okay, I buy this argument. Let's work on this during the next cycle.
=46rom a glimpse, we need some refactoring, like moving stuff away from
i2c-dev into the core and probably add a generic stats-struct which can
be attached to i2c_adapter. But I'll respond to that in more detail to
v3 when I have a better picture.


--SG3y9r3TeWn5kgv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHSxXMACgkQFA3kzBSg
Kbadew//YJJjHVOZvJkbqH10fwSHXbLcfLmRWbC7F3u0BLstTzPTXvm0ESE+4wQS
nMPzxnZHMzfTDfFObBwzkIVcdoY9msPlCxqgAXfBFDbLVBlca1ANtZbom8t26EYS
eqWtWtJ09qxIpbjMcecvF0SOcZzSA5CpCGKlpV0gXl5RXD09c9mw1HsB+zZoaKEE
/58mOG6Evjf0oAUO0oqbi6km3AmYDb74REXcgeL2npsbSkK0vO2vinwSgEOybIUE
G51tKqW6ESYGS7s2ZlYniaFhcNagy5J9HuXgbvRurX1ebsMsbJ7444qHPbmGP2uf
ZSu8E2IF9qsCGA1nQGhSsLXGY7OVXSISP3sKyfE7UFTHwTWVV/zebAZZPPfwD9py
yrokc66kBpWWwV6KLTPt+DJcEwPlVCsyo4vcjAz5+zglIFy9XmidsjZSjPgluAPV
EkPqx6n6ftylYIJeeKMquqmjKC3oZzNy6rhneVJ0moZRoZXeOF9/UO95qJgiikol
qYhzD7SW87ceiKFxLYhnj/SH149CxJighnfnMCOlfL4+zKuIKfDeHURRcW+ablyG
hcfaewyz+MbWhllgAmOmrBfJLCNzKvZCj3I504uLnQ22KYwiangvNOwuLRjSRSJ+
af1+YoVXg+pY9IcQy+7lP3uXUHWpu3aZq1hfPcn01MHffyQX+A0=
=RbAX
-----END PGP SIGNATURE-----

--SG3y9r3TeWn5kgv3--
