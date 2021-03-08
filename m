Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD28331672
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 19:46:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvS3C07plz3cLs
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 05:45:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=2BXnoL/B;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wAx2t0w+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=2BXnoL/B; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=wAx2t0w+; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvS2v6T5Zz30Lm
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 05:45:42 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E43695C004F;
 Mon,  8 Mar 2021 13:45:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 08 Mar 2021 13:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=x3FebiLVOQ7KGeWSHIxy62gVsPg
 SmEWDiV46dgsuwuw=; b=2BXnoL/BKqbdOsjqVDZDljs0UbtW72+QOOcb9NCQCja
 oGBG11lKpw3CapsZHpuilihbRKgxJHsG/JMVnd/WgoAop34KIcosZFN8+wFAdzy6
 nY5eM6nuihPWNUMuBcys9MWEaTb8rYpwKmH5OY/ZFtgAwVxNDbCugmZzq4blPJdX
 3ThEBzCPkAXcTllEZ5NzssrLXqqfVzQme9f1Mz002PLEXk3ii3quJqu03O/ZBwNe
 XycqSx+y4AccJjdDXFeKwnHYlA8j2v+2fzgYHQ7bqsW9X1lLwZLXQ+28NS2YzUOF
 JNTThcLLSyykEsUuY6SKtf+yg2xHzWYOBW8i7KVkCzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x3Febi
 LVOQ7KGeWSHIxy62gVsPgSmEWDiV46dgsuwuw=; b=wAx2t0w+C5arrJzyfhAQBI
 xGfUdeEcVOMmZAo7DhDHl93dRCR0dXhFphTV0c1ehXraEN6y+nNE5sKIFTtxvXPK
 +O45bAL7Cq7TACBB63m61J7CCWJt9lEaDyvilhk/w7B+sxm+NkOnCDaLNv7UxpMn
 hEFbMEOdKYc89x7+HqvY3C5nljIdTBbD5mrhElSZlzG4D6gE4xMsTv6yYclGIE/K
 alIXUx6j9AiSxCVoZRlMvjnmciNHnIJRUNlqJO5HEoqukrekVfMRXfD2Gunrb6pi
 X4UT/lereHz6SmPwN46ZmcH4FoWtOh6JYSxfSgTkngwEP1zTkKRI4Y9+tgCITdFQ
 ==
X-ME-Sender: <xms:0HBGYBY570VcUKSWCF9zci11UlZ8UQSXJh-xCgPnraar8wbsmz4Gow>
 <xme:0HBGYGMgjUEbx2tU9oN3UZkfkjvFEuA6YgwcEOaRfO2Rkb_mpqs5GuceMxYZBikFo
 V55rxlP-g70FeDlqJo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeffffdvgfdtledufeelfedvffek
 vdeffeeuleevudeitdegueevgfdtieeuueevnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:0HBGYObxtBYGq9W035CLqQLge1wdtKi1CKJHp2vpDEo2J_p3zBt9MA>
 <xmx:0HBGYM3w_f713ck96MjnnALxdBFFK879QYi8UB2gAgIVcjk6juoc_A>
 <xmx:0HBGYMfIXgOcDFVs4JSJ8eCa5CwMfkAtoKKyzo0TmwYGYqnWcNDDqA>
 <xmx:0XBGYCqqo6GXwX54IG7YdAmrK7vN2BXABy-4Akoavvojs9nroCQ3gQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5743324005C;
 Mon,  8 Mar 2021 13:45:36 -0500 (EST)
Date: Mon, 8 Mar 2021 12:45:35 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Request new repo for IBM-specific code
Message-ID: <YEZwz6C5uGk8Vobs@heinlein>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W64OsD1B+BUZDVxa"
Content-Disposition: inline
In-Reply-To: <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--W64OsD1B+BUZDVxa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 06, 2021 at 10:09:36PM -0600, Joseph Reynolds wrote:
> On 3/5/21 1:15 PM, Patrick Williams wrote:
> > On Thu, Mar 04, 2021 at 09:14:47PM -0600, Joseph Reynolds wrote:
> > My first reading of what is there, I'm not sure why typical certificate
> > based authentication couldn't solve your needs (but I'm just guessing
> > what your needs are).  It seems like you have a root-authority (IBM), a
> > a daily expiring certificate, and some fields in the certificate you
> > want to confirm (ex. serial number).  I've seen other production-level
> > systems doing similar for SSH/HTTPS without additional PAM modules.
>=20
> Our service team requires password based authentication.=A0 Period. And=
=20
> they don't like the idea of having to generate a certificate/password=20
> pair for each service call.=A0 But certificates offer the best technology=
=20
> we have to solve the access problem.=A0 And we are not yet prepared to go=
=20
> to a certificate-only solution. ... So this is where we are at.
>=20
> >> Note the [pam-ipmi modules][] are scoped to the OpenBMC project because
> >> the IPMI implementation is shared by all of OpenBMC.=A0 By comparison,=
 the
> >> proposed ibm-pam-acf module is intended only for IBM Enterprise
> >> systems.=A0 The intended implementation is based on standard cryptogra=
phy
> >> techniques and could be developed into a general authentication
> >> solution, but the ACF is specific to IBM in terms of its exact format
> >> and content, and I expect it will only be used by IBM and its partners.
> > Are you planning to open up the tools necessary to create these ACFs?
>=20
> No, I hadn't been, but good idea!=A0 We have prototype tools to generate=
=20
> and read the ACF.=A0 They should be useful to our test team.
> There should be nothing secret in the code.=A0 ("The only secret is the=
=20
> private key.")=A0 I'll check with my security team.

My two concerns about hosting a repository for this are:
   1. Is it actually a secure method?
   2. Is it [potentially] useful to anyone else?

WRT, #1, I think we need more details to make an assessment.

For #2 I think there is some unsettled debate around "what do we do
about code that is only ever going to be useful to one company"?
Opening up the tools would at least make it possible that someone else
could find this useful.  I think the proposed "Repository Review Board"
might work on better guidance otherwise.

Beyond that, I just have the normal "is this the right way to be doing
this" questions.  You've answered that somewhat with the Certs.  I may
disagree with it, but you obviously know your support team better than I
do.

I recommended some SSH support for certificates before.  Based on your
ask for password-based authentiation, I would suggest looking into
pam_2fa[1] as a potential implementation as well.  I know on the surface
this doesn't sound like 2FA, but the pam_2fa module has some benefits, I
think, in this scenario:
    * We avoid writing our own [scary] PAM module.
    * You pave the way for a much more common use case that others could
      build on for other scenarios.
Using pam_2fa, we would only need to make a small localhost-only REST
daemon to answer the 2fa requests for your service users and not a full
PAM module.  Your service users would have a static password plus a 2FA
code (secondary password) populated by whatever this ACF method is.  On
other installs, we could use a proper 2FA server with slightly different
configuration to satisfy things like Yubikey-backed 2FA.

1. https://github.com/CERN-CERT/pam_2fa

--=20
Patrick Williams

--W64OsD1B+BUZDVxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmBGcMwACgkQqwNHzC0A
wRldPBAAmJ+TqEuKo3dRokdXi3pC3R+ipDSM+pcnupUhQFvxGHYeyEcu2HkkwXkf
JkvB5doRaz58gCtNksEl8SgKCzkIcIsUbahDjmgXQa9UZ8z2fSpNgTG3tHS9FqMH
EaaWX3yyGZ/suZoNYd1LFK6jMOH1sZmpupprKOakALodofB17JR/w1vovhJXL6c8
DwThk7wGAH1VdctarQB20dRe9jBOxoZQOjcHc44KoAzo2YQbORV0UMQIICYqAWCP
/1S//ohM2rnB03Q4XgXN2sPmRwbA5U3fcB/dXDmwRBcHPILv0tS5O1LXpq7IKaL6
fgo0XqgUw0f71kwzzyTLhlsrFOtloVKPjDXgTY/h3KlAeK5yqR0daHnB2ts0+4Zl
ytgFgCshhsOJeZJ+I1l3mDzRCiPhyVvA6IRtcDtTS9KKdVznWY/dLMw6diCzJndz
x0Pf7sKFhqF7wkEA7C1WU+fzswx+AtbNgChxIs2XgaJI8eW7jmEfemhA2rWAk03n
Z+RxUuNALuPLobIx4a8DT9XvXe1h9HGwnYLoBemrEeOHWW531/BJXJIhC+T7/5+G
EYxYLYMNCoGpeNQxGNuWUkDTCeAA8Y59mC8FG28+lXsw0LehPD/Pz5yQmJHudADY
0v8E7uOQ1ddKppwUZYW81IEaaYPK8eFvwL1EheGN6IFmstKi4/o=
=BhKm
-----END PGP SIGNATURE-----

--W64OsD1B+BUZDVxa--
