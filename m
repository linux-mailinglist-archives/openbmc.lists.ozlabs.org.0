Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C7285666
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 03:44:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5cZG73Y5zDqFh
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 12:44:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=UsNM6Vry; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=eATi+Oak; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5cYY4qTFzDqC7
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 12:43:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6B210D42;
 Tue,  6 Oct 2020 21:43:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Oct 2020 21:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=QUaTvYO0oDwTq9cN7oOBGebQG/u
 7GjzHfxgAwqxLCfc=; b=UsNM6VryxMN++TLhqqyhDv+NuuwnjF1NN9N7IfOu6Pr
 rcIdobg8ZagvXYpkUferYW9Wk+GMUHeScSK+ES/2tStR8fc2ijRejZDcfL59+eh9
 LY8UcKRgrsEQix9OsQ1ZdXsDYNdSxRv8zuVOxLrqIAlLHifz8LlNKq/MDv9DYPi/
 PmUCP2ms9vuyoXin/NbNvPj3qxaMQ2NJcBWABgxda1j1mdJF88m5Y9lsmsoZd3ve
 QkZHzEqfIDa/bD7RsKSsfTeLvAgkxrqxd1rp8eMrwP4K+SsFu80cSOBIrt8vBlUd
 NqJ/ij1nAIXWG9uMuXpl7pxBeMukmL2xgvtOcyIuibQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QUaTvY
 O0oDwTq9cN7oOBGebQG/u7GjzHfxgAwqxLCfc=; b=eATi+Oak+lNSYPkQbmfhVJ
 cZzCh/bGvdBn4mxMjZAFFGjYJLEze8sDmZNeiFF4Zr48q26DVUL/r4Pm8Sk0wSds
 CuHCFhbCmpwIWpPpQ05NdXyLnSpzqabJp4dYB5JP6CBl8p8f8WYGYRZj+PVce7MB
 /t6JV9vBJorQO9Ene+b4XdDb1LWwTjIYDFF1bPuTNZpu3K55eav1hboQx628JQ8G
 wNUqACvlOcLtJspgCM+F3Mg/psoB7/RaaBvtceQj9dMHcW5szF8BE+OxFpUYYuNc
 yXKJ2IBcwqWRLwAx9BWw7IgnYJ7rCUgrhnw53ZzCPfv8NZwUCPA8rBF9StGT0UtA
 ==
X-ME-Sender: <xms:PR19X3TrKuAkIkAnZoFQTglSLvpkIpLlzXfhiIyLnuBsOK51hkiooA>
 <xme:PR19X4yUtvBcDMUnLjJx7G0vYwsULmnHHmI8R595bM2WlrW5rPlPqk0YTgAvhN8L3
 LEWPVLGnIEjh3w_Gpk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeehgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeujeeh
 hfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiienucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:PR19X81fo9dkIjriggvEbKadNfNcf6zb7ItUbrf7jn5cbq52PNpE5Q>
 <xmx:PR19X3BkgfTeVJk_f6useVT-1Xctxn82VY77RYg5Z2_YPp5NU2hNQA>
 <xmx:PR19Xwgo2E7UYkJl5KMhtwG6HFmvNiXTHu8S1YRB8nttVfCe1ktiuQ>
 <xmx:Ph19X4LJfZitlXn1mxgkG1tH2IVIlLJAyG8_piNvOUi4Fuci5QbTYQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92577306467E;
 Tue,  6 Oct 2020 21:43:25 -0400 (EDT)
Date: Tue, 6 Oct 2020 20:43:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Sui Chen <suichen@google.com>
Subject: Re: Request to create repository google-ipmi-bmc-health
Message-ID: <20201007014324.GG6152@heinlein>
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
 <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b83RC7qtkHpuKkAY"
Content-Disposition: inline
In-Reply-To: <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--b83RC7qtkHpuKkAY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 03:57:30PM -0700, Sui Chen wrote:
> On Fri, Oct 2, 2020 at 1:54 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
> > If I understand correctly, protocol buffer will be used by daemon who
> > Is responding to the IPMI request and connecting to this daemon via
> > library call, then it is completely restricted for the use of protocol =
buffer.
> > If you are passing protocol buffer to this daemon then we have to define
> > some policy here.
>=20
> The Protocol buffer is only for serializing the data to be sent
> outside of the BMC. It is not used for communication inside
> phosphor-health-monitor and will not be passed to the daemon.

Why isn't this part done from within an existing IPMI provider (ideally
to me a google-ipmi-* repository at this time)?  I'm not especially keen
on these details leaking out into other non-IPMI repositories.

> >
> >     Other than these two things I think adding new metrics to
> >     phosphor-health-monitor should be manageable. I can start by trying=
 to
> >     add the IPMI blob handler to phosphor-health-monitor; my first atte=
mpt
> >     might not look very elegant, but if we find answers to the two
> >     questions above, the merged result will look a lot better. Hopefully
> >     we can find a solution that works well for everyone.
> >
> > I am looking forward to your patches
>=20
> Please check out this WIP:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/37=
092
>=20
> This WIP currently just adds the IPMI blob-based code to
> phosphor-health-monitor almost as-is.
> It also shows what we already have now.
>=20
> There will be some work to merge the daemon and the blob handler in an
> organic way, and I am open to discussion with you how to do that. The
> first step I think I can do is to put the code for extracting the
> metrics (metrics.cpp, blob/metric.cpp) into a single file and share
> that between the daemon and the IPMI blob handler.
>=20
> Another issue I found is I am not using the latest sdbusplus so I have
> to comment out the usage of ValueIface::Unit::Percent for now.
>=20
> To build this requires 1) adding a pkgconfig file to
> phosphor-ipmi-blobs (before
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-blobs/+/37133
> gets merged) and 2) adding phosphor-ipmi-blobs and protobuf to DEPENDS
> in phosphor-health-monitor's Bitbake recipe.
>=20
> Hope this WIP change illustrates our intention clearly.
>=20
> Thanks!

--=20
Patrick Williams

--b83RC7qtkHpuKkAY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl99HTwACgkQqwNHzC0A
wRnzXQ/9F8kfyVzJdUmecP5VFEyAWup1xKbPPU3rGYZ1S+jeL3w0LPikQfguppHU
wm02KsR7WkwtGG63SAyIC251sBXMSF8bJuwMwz2zm6x8aPlVjLKpQ/sH7qQ1sG99
DWssAFZG6yQCHdxS/+4CN1Kt2AyF02E5cOGR/OsBfsG4FoWegVs+TKg3PyGij5ok
BtTSxugNaWQ6IeQ+mZtsto68JgXmMSIulZhkka+kar5+B+KyXpapG0ODUgBXRdaN
kyC/qx9MYWXqevgqK/MER6iMwrGaowIJzshykbYOLgZtP2CLUgdYzG2qP9qy+Skc
oqm9N+PITQFLVbMhZp178z1HKFErkrbfH8MrkXot7Sz6HRt7MeDbmvhR4LzSz7AT
mZr6/SvZcTbqZDHup0Hji9m6o4lmUoWpmwZLx5d7z3sQexbJKKOkyiJ4eUDXPvEh
4EJ9j3PEaJ25WUo0p0JoOzNpowpp5UEmHOVOfSjBxVVJC32iSN2oJ62q7euF1GEc
avyIYNT5EmEMhfWRy2rOy7uMCjMLZKhAD69w/HhI2aeA7c4kqrQSWmWNscNAXfm9
FhCXI5GDFH9xgek8KynDgJS1V0qUmkMv9lUFe2fQhBD2xYjZKs/bVTYptH7Cucfq
vIEPZz9tuv7U6UHeGc2pPUCwcbW4NNVqsAS6sh17mkVXIOYmPEk=
=wylh
-----END PGP SIGNATURE-----

--b83RC7qtkHpuKkAY--
