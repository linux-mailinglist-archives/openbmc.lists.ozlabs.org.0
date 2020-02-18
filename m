Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 915D2163338
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 21:40:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MXmR0F8ZzDqcq
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 07:40:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=rxH5AbyA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=MGBqU+S4; 
 dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MXlc3kr4zDqWX
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 07:39:39 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 5460360D;
 Tue, 18 Feb 2020 15:39:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 18 Feb 2020 15:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WllBqMgz0fc1p5gBNihFF3BF5+z
 6rzNCerWwErFyRLA=; b=rxH5AbyAP2M5absLNqMNaZAoszr3pWKo+qyZGZdRoaD
 4UcfINfsbwCoCVyrIJYasJPLsyLgGcr/5I5Oy23FEjcA1o3CBZnmwFV8k1PlPQou
 o4M35mJTxbqdw794GxQYU7sXyg/Gq5nMIFPVGunCnk53LC+pLi1UlKzIT/bIeUl/
 E6CnN9JdPZNdBOy+rtyRcd40Nczkt8ewtU2oAbVln3TmghP69yGrRTxvARlVVeBq
 gWeXbXl3feFutSbLmn/QdDTfwO6UGo4o3SkHVd5JffLtkM5ZxPFwva0S2beTv7kV
 kZcHoFa/DTs8Fgmbx1BbOi2Of6iwI3eXTVQQXIhVaJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WllBqM
 gz0fc1p5gBNihFF3BF5+z6rzNCerWwErFyRLA=; b=MGBqU+S4VCNkqho/Arx/sY
 vO4jE+YJ0hh79+pCVrm2ZZX7IW/tvW6kMhkmygqxi02qEltFjyqc/o/VCmR1BHDL
 9AqOKGpUpd7Zo7d4+h8t2fmPQ2cYIE4SHBY4LPCf0/lF9xJb7kSaC+pqnREJgrD7
 3P/qhKSqlMhOQ/DgqIUUf/wWSB3Tc1D6Npky7fG3xm7CAHC75DzHSRRPPIQcf+Df
 iuX36gVFVk4768xX3GDvx+WEPMCa74/JvKJCWyf9GDK236FtAT/BaL+s8Ri8Hmsy
 CeZQaU/1kqXGuYSik3B6XhlmJJPTtjaRFijeYGbRpjUz8Fc+AAEksqQacvR2mmYQ
 ==
X-ME-Sender: <xms:h0tMXgkuQCFCPGfYVjLnfOMUkZVk7iARPmjGKXaELBBMcDkm88wHZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeekgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepjeei
 rddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:h0tMXhIJRKyTewJFNzkioZCeZVzUTEwAISwL3YQySrrQ74aV6U4pew>
 <xmx:h0tMXhFQ4D_uXHMTYOGBnY61NqbFxGC4CGE_JGvlcoSltriw60v33A>
 <xmx:h0tMXiOd2pBelM-dygx1ca3dKnGIHC3H-TSMaQdnNgkoVMkD_GudFg>
 <xmx:iEtMXtTYqyWKtIrpnNR4lDQvR9Ey690SHFzoaPLl5EpE4KJ8knhc7Up2THw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7CA653280060;
 Tue, 18 Feb 2020 15:39:35 -0500 (EST)
Date: Tue, 18 Feb 2020 14:39:34 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei YU <mine260309@gmail.com>
Subject: Re: [sdbusplus] To generate a common header for public information
 of interfaces
Message-ID: <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
References: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline
In-Reply-To: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 10:38:37PM +0800, Lei YU wrote:
> Currently, sdbus++ generates the server code separately, and in
> phosphor-dbus-interfaces, the separated headers are installed, and the
> separated cpp files are combined together, and compiled as a library.
> The public information of the interfaces (e.g, the interface strings,
> the enum strings) are either in the separated header or in the cpp
> files.
>=20
> The result is, when a phosphor service needs to use an interface, or
> an enum, it has to define the interface string or the enum string
> manually, and it happens everywhere.

I would say any case where this was done should have been fixed.  There
were already functions in sdbusplus to convert<Enum>ToString and
convertForMessage(<Enum>).  There are lots of cases where these are
being used today[1].  You recently made the interface public as well, so
we should begin converting these over.

I've also got commits pending, for merge soon, that make the enums be
supported as native types, so code should rarely even need to call the
"convert" functions anymore.  Another refactoring once that is merged.

>=20
> How about
> 1. Making sdbusplus to generate a "common" header for each interface
> including the public information;
> 2. Then phosphor-dbus-interfaces could generate a single header file
> that includes all the public information of the interfaces;
> 3. Then the phosphor service could include a single header file, and
> use the interface/enum strings it needs, without manually defining
> them?

Currently only the 'server' interfaces are generated and some clients
are including the server header files even though they are a client.
The intention all along was to make proper 'client' bindings but there
hasn't been sufficient effort put into that yet.

I'm not sure if it is better or worse to have an explicit 'common'
header rather than the two separate 'server' and 'client' headers.  Is
there any reason to not simply get started on the client headers?

Some pro/cons of 'common':
    - Have an extra pass we have to run through 'sdbus++'.  This will
      probably make the templates more complex (3x code paths rather
      than 2x).

    + Explicitly consistent types between client and server bindings.

>=20
> There is an initial concept implementation:
> * https://github.com/mine260309/sdbusplus/commit/78cb63fb7e1ceb62165c71e1=
5779f23f7e9f166c
> * https://github.com/mine260309/phosphor-dbus-interfaces/commit/6079d2554=
7f0143fc7562a1c7ee6beb888a66432
>=20
> With the above changes, a service could directly use the generated
> interface string, e.g.
> `sdbusplus::xyz::openbmc_project::Software::ApplyTime::interface`.
> In the future, the enum strings could be put there and thus we do not
> have to manually write the long full qualified string.
>=20
> Ideas and suggestions are welcome.

[1] https://github.com/search?q=3Dorg%3Aopenbmc+convertForMessage&type=3DCo=
de

--=20
Patrick Williams

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5MS4QACgkQqwNHzC0A
wRlwTw//TTA5huFcEruIYrK1lp0ME/8anskYx3QHHkQA3sFU379PeuMLyS2PO068
6tK+EQLtWWx6RdqOKEDqE0oYVEPO0t+LvCyXH8a5OXnfjSQBJoKUwAAW4ljItT8S
E4cvRxf58dMWiTbA9rTpI5RkrUH4aWMXXf8R84EBYhbwuAF4205j5kiTwtTxl/jp
/ZG1dW2GcRj6L/rhV1UKqp8pu07MUjY3zJsSLwtjFQ9QBPIsrBE8pEnX+TW9p5om
7jk25nEgrCztQHE4Vb513TwNBNkEaSsodPF2EfHTUPhhNEm+jGzetra2oXt8Hm1u
sSU2NWubjo7kZO/vFysZHC9Zi2emSdo0Xr5FX63GGMXzxIPO+KZ15WlNZf5MW2+Q
jLhR1aPmBv/UGRHHderh+tjRJqno1NIXXY+3Zb1mLqY8niKi71LvVgomsdQqqyNl
zGO4rsq06KudS28qMkCU7uM6mlmYpkPr3wJizztbBeWLypbnAr7vi42K+pVsf0kr
8hVs0cl0+x6BQdpFeqmhotSmIQBKUPVsY/47DiubV35r75rsGvjkfG8c4JKoNRec
kbFfHH/Uq4kPPYH5wrF7A5KAPfJM+YfLP5bcvB/E+2ksH+ItK3aHRiQVKu69mJWC
lQfJC1PpZzDXhJ5eUiOk2NXASHqRaoSXjxjv7deajQZuQMdC/qw=
=nGUu
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
