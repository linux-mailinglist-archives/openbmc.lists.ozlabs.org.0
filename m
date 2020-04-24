Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA1D1B78AB
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 16:58:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497y3S2yPXzDqWb
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 00:58:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ab/JPris; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ztYvEeGC; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497y1b2T0qzDqLv
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 00:56:49 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 248FE10E1;
 Fri, 24 Apr 2020 10:56:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 24 Apr 2020 10:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Cn2DnYUXmq84ONoor1VC7MxKN6H
 YEyqamjopLxKntTE=; b=ab/JPrisKdIZdg4mIwa67h1EoCX4VZbvkCTmDio/CwH
 gFGwPwc/Toax0lBz5nSLkywlDHoy7pwXpzuGCuAXJANilwOhqC9Bx6VKEG5zfKe+
 VNh2cp9AYl9jgzzEPkCJUJPx4doPBv17KaNLFpOxY6ma4bg71UThQlfwxB3auTDK
 LNamKhfSQ2Qi9ZP4zy4mdRGDVDHFkGyHJ8jiAh2VupnM+h/POpfgws2Zi9llf+fR
 yz2yd21oGXXqPT2L4quHCm+qcjVKdDPseRjMnJjchUqvgINJ3m/wT9IAJJDyMAik
 mO0O2NUWggkiUolgmPVMZ/T9C+gSb2ydO12RncM33Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Cn2DnY
 UXmq84ONoor1VC7MxKN6HYEyqamjopLxKntTE=; b=ztYvEeGCvs0RmUWOsEBw73
 Khzhv/inI/4hMuPAzTAGZAgw9WXXg3Y95qUEdqDPWJfAm/sSvJ73BxrYU614BjYF
 Y7q8Vd6axsJ7gMD5wbQWbO6ejeEZ4j2XyBEAX/AGXWDPwcuaLA/l8pNVA+GvNmUr
 GhgVH+LgBu1nWmW9kzjzeYCkkmmnxJH+wsyuWpbvpHoGdmUDv+pcW5F8mmR9FQ8W
 v7uh+T0mJbZltC7FkD2mf15Mly/fpNL/ZDXnei6mSL2iQtxl+0NTF7OAZ5Eu1VNu
 RiMMhWAD0/9cehoAEKePt0S9F2/RZNtHgawIwtFvtrWuAyD1e7+hFBfmvD6FO/Qg
 ==
X-ME-Sender: <xms:JP6iXgoAOCKlXcVP6F6ajsfT9h9RaoiZks9pIAvPFqq72IcO-jC8-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepudeiiedrudejiedruddvuddruddvfeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:JP6iXp4Il8uVysGUMELMDXqrMbknnP3r4gmWQH2yp4ip1XS1NaGaTg>
 <xmx:JP6iXuoifz-y-lgS6oLqcXxJeu6yXDWQFMXenM4tYdU7hVM_DCJV3g>
 <xmx:JP6iXjiVmcid_0zSAXwEWBvNoKVAWqyiOA3esecgPSIFSG40lqZgxQ>
 <xmx:JP6iXsEPAX28MRy_LPzkbpmDEMwc6tyzUoMaLsYEJID3tYy_ICv6Ng>
Received: from localhost (mobile-166-176-121-123.mycingular.net
 [166.176.121.123])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25ACE3280060;
 Fri, 24 Apr 2020 10:56:36 -0400 (EDT)
Date: Fri, 24 Apr 2020 09:56:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Proposal: how to make incompatible changes
Message-ID: <20200424145635.GB26818@heinlein.lan.stwcx.xyz>
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
 <05835fa0-508f-d3ba-13be-280f4dfc92e4@yadro.com>
 <DA097328-158E-48DA-9F8F-6CD0C7FC4DDE@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline
In-Reply-To: <DA097328-158E-48DA-9F8F-6CD0C7FC4DDE@fuzziesquirrel.com>
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
Cc: openbmc@lists.ozlabs.org, Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 12:20:53PM -0400, Brad Bishop wrote:
> at 8:11 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
>=20
> > Internally, for inter-process dbus communication the interface version =
=20
> > could be checked during compile time to prevent problems that couldn't =
be =20
> > detected by compiler/linker automatically.
>=20
> I like the idea of a stable, versioned DBus API.  Does anyone else?
>=20
> In the past there was opposition to that.  I=E2=80=99m not sure if there =
still is.

Since we're deprecating the REST-dbus path and moving towards Redfish is
there much advantage to a versioned DBus API?  Alexander mentioned
compile-time checking of the interface, but we already have that through
sdbusplus.  The issues are:
    1. Client bindings are not currently being generated.
    2. Not every implementation is using them.
    3. We don't have a good mechanism to deal with cross-repository
       interface changes.

I don't think a versioned DBus API solves any of these, except maybe #3
but that is only if we're going to write servers that support N-versions=20
of the interfaces.

It seems to me like a better investment is #1 and #2?  I'd personally
like to have #1 implemented by the end of Sept at the latest.  Solving
#3, I think, requires us to do some CI investment to support Gerrit
topic-based testing.

--=20
Patrick Williams

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6i/iEACgkQqwNHzC0A
wRlWdA/9FWdXhmkoWKQjHXrrSIrRiyZVlCntbaAtBDn29eLtBhW/T/9BKVSu4uWK
Np+T8DO1Z3cjyiGREhjHHdS53ZFobPKJ+aDSwVO3om+LdmkyMSsjXc9Ub6r4xE9x
Y5QyB/A14zTR2ZKxAW9wc6qbBxAkmq1eFiS4fYKDtfKffRmyywAVi/VrUSMhntwo
QcGwYc2hpRgU0mqIQanE0ECaK3Fz29g3tKOxdDtgOuH4meaHPnklT5KMZsHe+tye
K4T1hm67oUNjGkPFIYDfq+Rtio8loesaeUl841tmKbMRgz6XKn5GeES5CMWbB1Df
5Od4K/zRv9fEVBj6eAq3OO11NbImNzZhwZZSchbW88nE7Iv4kwDB+eVrmC5V9LWV
QCu8X+K3NtLI+SePJNlczzeAu6W6T3b2pNzlS0dotehm5F/+fBX+D3j0QvsKo9FC
49a1hyYQYMqW6MPAtFLjlxpTUyqATureEaT5/tP9UiAh77AklxgBpvSUMiEn3qKI
8yNuC106oxJpt+d7Q0miXyhVrWPOW09KME+q9ADmjlfRdy5JfkSHmVYK70mwjCuq
MCVD1yzGEQ5/Bul4wBDqj++gxYgljBGnAn1yP77TNb5Dnb57ILOQfFKZ+LN1rnAd
OTCCTVTbh8n2dpWyZtaKI22mdTgN8XAyTsrEDCse+AYapcEPtV8=
=4rNs
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
