Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7174EA71D
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 07:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSJ2s5ysVz2xgJ
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 16:26:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=PEObBxjg;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MsY+YRrW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=PEObBxjg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MsY+YRrW; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSJ2N4ZyVz2xBV
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 16:26:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5467D3202083;
 Tue, 29 Mar 2022 01:26:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 29 Mar 2022 01:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=UEyTFYY+lHkzARK8MWyChvloU4DQEKZ6goNzaq
 kOXvk=; b=PEObBxjgtD177malMAbkvTfmq6DCMihItvMgDp6cZNgyLKhuxNY6Uq
 jpg76RvVjg0EA6rXM4VKnG2zuf2ejDo6OAFT2QN7je/QnAw7OucB2gD5xoZ2NFZt
 BAYX5/QKuwYl/jpyvdlKQpqbbrZ5jj8COkJokrN5lSSOSUxpxCi66kP6FGMbfGm2
 6PyEfx+AlwC5pszDaodGOq15MeLDbCAXq0c4r2LPagyF7Z0UXFZ9uRAx0TtbizTG
 MUPSKblAX6OfvLg4omPKSaSIGCpfrsTB/a/IA/lSgGWUaWPZZCklDHSw+Qt6aY+Z
 IhtnV1mKKoKDgqjIuE8lm4ltI94O6Caw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UEyTFYY+lHkzARK8M
 WyChvloU4DQEKZ6goNzaqkOXvk=; b=MsY+YRrWeFplZz4iwENVrCg8a/A4/KGk/
 tJY68rHzAf8TIUSCzzR3Ovr/NcKlzxE8y4vdrqNAWKV73iGaoL34lKFfhhAffdYT
 84y5dYAZ7PCePVUjqSQo+ykmKyTo25utgN9+UXhgk+jFgHngM8SeETv8B0sf+9GD
 XB/9ByChf0NmjzoIi+OIBUCmydD4vZzCuwwSY/wL/ex718RwovU/Tn5yF6+akSVY
 npJOTFAXLtPe5ZFHw9Ny4XLTumhJvmYuE1stNdXJN4DW06h8jD2xVpHneNueb2wz
 XBGsotnMK4WLtSj/9zH35i+aQg9mf7aRBFaxhSPRtjKKZkvHHD8gQ==
X-ME-Sender: <xms:d5hCYm-5GqDCsQ5W5iQUX3AGdNx6YYPb2iSCDGii3Q8Or5G7xNXoRQ>
 <xme:d5hCYmvKRKqmTQcY1VVYSkid0kDz7BKtZB6sfSLRmpf3NnK7uag_FQx4Y9AHcUymt
 vFOOUPVvu-wPc5MiUE>
X-ME-Received: <xmr:d5hCYsCpKqlFZCbNHI1QPTcnyHm8J7JJBMZ46_fdMUu0G2lZeGlfGpYmBsnr3G04HQuEAkXyuVLx23VidgwrTypBP3tPFYo8z2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehkedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdeuhfdvuedvgedtvedvjeffjeeh
 heejgedvfeekvddtudejtdfgfedtvdevkedtnecuffhomhgrihhnpehtrhhunhhkrdhioh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:d5hCYucykJ3pqjtc5lvwFQlL5PxFLSmx_hBqFFGP_UItYERZ84RisA>
 <xmx:d5hCYrP6WB8OUxdETWlknr3Dn62dGyvFLt78EuZo15q2BoM2J9o-6g>
 <xmx:d5hCYoksCiIOaFBUgB90Mr-pDX86Tol6sIWt7fYWuOTG90WZGFFqTA>
 <xmx:d5hCYm3fFPYQ8XFZLkp0Ry4s6uCFQ4Ys1Ms2u8QpOTCHs3KxzQ0bag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Mar 2022 01:26:15 -0400 (EDT)
Date: Tue, 29 Mar 2022 00:26:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Defining the behaviour of code formatting in openbmc-build-scripts
Message-ID: <YkKYdecCGm4vGMUa@heinlein>
References: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0FYqy1R8LqKHP43j"
Content-Disposition: inline
In-Reply-To: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
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
Cc: openbmc@lists.ozlabs.org, Matt Spinler <mspinler@linux.ibm.com>,
 jiaqing.zhao@intel.com, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0FYqy1R8LqKHP43j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 12:36:33PM +1030, Andrew Jeffery wrote:
> ## The problem
>=20
> "Like all Vogon ships, it looked as if it had been not so much designed, =
as
> congealed." - Douglas Adams, The Salmon of Doubt
>=20
> Code formatting support in openbmc-build-scripts has evolved over time and
> no-one has ever written down what we actually want. The lack of concrete
> requirements has lead to an counter-intuitive and convoluted implementati=
on
> that has ended in some repositories (e.g. entity-manager) not having thei=
r code
> formatted as expected.

I entirely agree that this is ultimately the problem.  The code has
evolved as people add new checks and it has a lot of looking for magic
files to make determinations on what to do.  Unless you know all the
knobs it's hard to discover what is even possible.

> Code formatting support in openbmc-build-scripts began with an implementa=
tion
> of 1. However, along the way we introduced the phosphor-mboxd repository =
which
> due to some unfortunate history has a mixed C and C++ codebase. The C cod=
e is
> written in kernel style, while it was desired that the C++ be written in
> OpenBMC style.

Do we still have this situation?  (I think this repo is now hiomap which
does seem to have two different clang style files).  Can we just do away
with the "C code should be written in a kernel style" and use the same
format between all the userspace code?

> At the time the problem arose, clang-format had two issues:
>=20
> a. It treats C and C++ as the same language, and so maintaining a code
>    formatting split across those language boundaries requires two separate
>    clang-format configuration files
>=20
> b. clang-format's -style=3Dfile historically required that the style file=
 in
>    question be called ".clang-format"

I believe (a.) is still the case but not (b.).  We could add yet another
special case to detect the two .clang-format files.

> Hence, we support 1, 2 and 4, but not (yet) 3.
> ## Proposal
>=20
> I don't really have one. Does anyone have thoughts on how we differentiate
> between cases 3 and 4? Use different file names? Invoke the script and as=
k it
> what it expects?

I'm somewhat surprised still that the difference between 3/4 is hard to
detect.  Is hiomap the only repository expecting behavior 4?

In my opinion if you have a .clang-format, we should run clang-format; if we
don't find .clang-format, we should not run clang-format.  And that
should go for any formatting tool.  I believe we should always treat the
`format-code[.sh]` as yet-another-formatting-option and run it in
addition to everything else that we discover.

There has been talk previously about making something like
`.openbmc/config.json` as a further configuration file where we could
enable / disable all these check.  I think it would be worthwhile as a
way to eliminate many of the "search for special file X" checks we have
where we simply touch an empty file, but I suspect we really shouldn't
be using the "touch a magic empty file" mechanism anyhow.

I've been playing locally with a relatively new tool that seems pretty
promising: https://trunk.io/ .  They have something like the JS
packages-lock.js` that allows you to enable and version-pin all your
style checks and linters and it automatically downloads pristine copies
of those tools (without installing them globally on your system).  They are
missing a few features that would allow it to integrate nicely into our Doc=
ker
images, but hopefully it is getting there soon.

Ideally I'd like to see some automation that:

    1. Leverages trunk.io to run all the linters / style checks that
       trunk.io supports, which is way more than we do now.

    2. Create a common set of configs for all these linters and tooling
       detect if some repository has deviated from the common set.

    3. Run a nightly Dependabot-like fix-up commit for any repositories
       with an out-of-date linter version.

This is a longer term project than what you're probably after for this
immediate problem though.

--=20
Patrick Williams

--0FYqy1R8LqKHP43j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJCmHMACgkQqwNHzC0A
wRlx7g/7B7FoQFfrtw6t29sAeOTRg6pFsZMDDxPJqXegFgPleJZ/uuHBq/G4EK3e
frceu0OKGf7Ey/QrzSxciOEN4buaNACMTzWmVwavFfQfNA+DjSwdGjjaCNRGoeN2
pWLxdQJs0KvIUuEFPHTb43uMBgg6slc5Vmr3nHECKF58nnJ+K3kyclnC62yd8qa3
6Ys+ER0TCLeQ++vTC9yy9xGjylPewKHRTDqtqK5gNs6l8Kq6RGd9/1l3tnVCapHX
wcW0a9PaTcBRUPONjQ4MrRUNQCLgHtSY9K7wYnP6RxSy9qVsrGBdFOCK4EEuui+N
1zqIgtyiA6/DHTmsu0KPFvDPPB87OXYmUocbHiez60r8buAcw98oxnF93+Ag1hz3
nZUoY/mB43tSh+rBTSshq25RWhBopG/8PSi/ok63L80vHcTL3zzPquQn206m7Wau
ebCPWt21n6AiB/WJ6MlewJxXlg8qXgv/dC9P2C6cLLogyig9oVKWpbT+BO1GaEjF
k/kJOWSS1nHTz4IutrmJFGhKUo1UEFYcEYzxU0jE9kD+r/sBvY3BWfKtSZ5hHksI
QpRQwOAoCLmD5mMLCVxVwPjAiIq0GW7KfnW8BbxiPsay1ClRTdaPsD/Ias1DWCSz
MEtpQjVfOmaHDR0Ugx7B8uUeCMP/zFaxxjPqiljWkKUhwr8jrWs=
=6Exi
-----END PGP SIGNATURE-----

--0FYqy1R8LqKHP43j--
