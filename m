Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D564251EDE
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 20:09:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbcTK4ZH8zDqZN
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 04:09:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=W0fqA8vg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Hc8Pi76i; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbcST4Q8rzDqNr
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 04:08:56 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 043DD5C01B5;
 Tue, 25 Aug 2020 14:08:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 25 Aug 2020 14:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Sg49uzJDZpFTCAWr2bsDMFQB5nQ
 aypGzFLwy/TfY5hI=; b=W0fqA8vgMxIxgJD11elU28bZRD5uFsxx9GoN/pQbLS3
 SH+ASe1B/lzT1y+eD71ZaZ4oI4XIjIIxpAStSJPyfyiyTV3yLg1RBCNPNAlxNhhw
 RRue8ME4nLioVJO91iGRSE50fQksAx/VgHeqZdQyPWInMzaDZXpgHIh114FwWu5H
 Azy5tN4rBo1WtV8zhejA0afq9CZaKqM9OXxz8Jjuyv3bwDp2u9gvV97lqNTtoSJ1
 HSKV2RgANm2asygjVoB5xNXYn1YAILVL/K+Mk+9rCFi8++WDcDbbRI3c1oR5TYwB
 yHUhYMzBkz7w1HHwkTjHyscRzf+sJKA8QLQ/SegdpAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Sg49uz
 JDZpFTCAWr2bsDMFQB5nQaypGzFLwy/TfY5hI=; b=Hc8Pi76izU0nnpDcqrlLlZ
 Q3TWbjwGLDdJscXfw5FZ5a2CYWFYV+yx+lqRGOv6LM7jyxIv84ZgkDkhuG8rFNAf
 olaktu+3dFOFKk6DgcQuckDNr2Oh7p2bKM8BzuodN2SsUVbTJsXpkhSaxVnQqNDH
 dfO8zBB/W941C/AdkT2emTd7LF2HHzRDNwkip1oTGA8v4hAQua+9V5YG3yAGZY6A
 IVqMv/ZiWLzTdVX44fywsDvu97ob0LVyKPJQvrz97eByaqIxwXxVnE4PTys07gdk
 qv2Z2Deiq2JKwBR6HTFtnlO26gy7DvDbbTSyWWHBw/cY8p2Ah171bY9EaYga7RkA
 ==
X-ME-Sender: <xms:tFNFX-qMAgxcGR9bzjX-ueYD690pVIhDEX0PNa0IwJBooK8pMUZq6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepuddtjedruddtjedrudekke
 druddukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:tFNFX8pXXoNwzJMypJUZFb6u0Y6kS3MMwAK_Bqk-tJt1S7ZK08ni9g>
 <xmx:tFNFXzM1o8MO53Cgn5WphzI07Qiy1LakAMS6y5yQWPAXjgq-oabVjw>
 <xmx:tFNFX97kMHgbvDmkb9fxf-jNVRnhowV2jfY2Ft4CEPvcfQKjFvX0LA>
 <xmx:tFNFX_Hq-2FU2z8qBGMWUk5tU9IZ-WxOA5kJtqBec4P-JgRxeGk0Vw>
Received: from localhost (mobile-107-107-188-118.mycingular.net
 [107.107.188.118])
 by mail.messagingengine.com (Postfix) with ESMTPA id 700A6328005E;
 Tue, 25 Aug 2020 14:08:52 -0400 (EDT)
Date: Tue, 25 Aug 2020 13:08:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Matthew Barth <msbarth@linux.ibm.com>
Subject: Re: sdbusplus - const/readonly flags
Message-ID: <20200825180851.GL3532@heinlein>
References: <20200825150028.GK3532@heinlein>
 <fb22f956-19df-b44f-5ae9-113f6443c2e9@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tv2SIFopg1r47n4a"
Content-Disposition: inline
In-Reply-To: <fb22f956-19df-b44f-5ae9-113f6443c2e9@linux.ibm.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--tv2SIFopg1r47n4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 12:50:06PM -0500, Matthew Barth wrote:
> On 8/25/20 10:00 AM, Patrick Williams wrote:
> >
> > ALSO: I could really use the help of the domain experts for the
> > phosphor-dbus-interfaces listed in the gist[4] to review and determine
> > if 'const' or 'readonly' is more appropriate.
>=20
>  From the info you provided, sounds like the ThermalMode interface's=20
> Supported property needs to be updated to "readonly" as there may be a=20
> reason where the supported thermal modes are changed by the server of=20
> the interface due to machine configuration differences.
>=20

Yes.  In that case 'readonly' + 'emits_change' is probably most
appropriate, since you want a signal sent out if that property does ever
change value.  ('emits_change' is the default for most properties if you
have NO flags, but once you start adding other flags it no longer
becomes defaulted).

> > What does this mean for us?  A few thoughts.
>=20
> Are there any code update implications after these interfaces are=20
> changed from const to readonly that would require code changes by the=20
> server code implementing them?

I don't think changing from const to readonly has any implications to
the implementations (assuming they are using the sdbus++ generated
server classes).  The existing code already prevented clients from
writing to 'const' properties and 'readonly' will do the same.  The only
difference should be relative to the ability to emit signals, if
desired, and the implication that a client should never need to re-fetch
a const property.

--=20
Patrick Williams

--tv2SIFopg1r47n4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9FU68ACgkQqwNHzC0A
wRmx4g/9Gqir/mmrysOfHd6WGtikDtI87+GPKGFtSyCOFHOggc79xn6gjU7Q4X35
+M+ZdyHaNOEbxtqMWx54oUVvoNIn9ycB2+ye+328WOGRLLQY5XVsc4mCoqjuDpWR
rDbC5rTXjy6skFSQi81bTC3J9j2zTUtJOU/mwjXczneW91Ci7LlVXOjxGH7lF7zI
Sj5o+gEMrrF43MdPd18JoOFIJDVYccdSixFbwzL0YyjisOMJihmbEKNoV1Y3A1j0
OIpWAZ3O+zGuAa/uYbK1T4qwqBy997RfTY7HeLD2qWNexVfbXNUuRkDwsHxNWIjt
BS2KxR5OsHJdBOiDJWFvtQA4sgg1SaSMgivOneeQr/j6KZlhT19DK3TC+0ugXGxA
RIgDlt40m+7oioyXmnVocylnx3iC1WsRQzZlLNsMVDEgeW4bGeMecYsV1uvUToBs
vs8zBJmcz72Qeob1MlEaUSlWvzOa50P3QbUsB+hKiJDF+BzQlezfXQVV/0CC+OvM
6Q4pxC5SwYfOXstbvq3WYWNxNyQBmqzJO8QJVrEw7Jp80/lvcci2hM7g6k/lmhzR
LL5tx1Znsjf5+GFIrBx6+S70hfyrfAozZHHlbw3gSmefUuAdJKej3KoO/+pmHErK
05dy5AsmQuS5EWFqEb1FNfRijRVKz8LNUlQNw/lSw5aqqq1Mg98=
=T89L
-----END PGP SIGNATURE-----

--tv2SIFopg1r47n4a--
