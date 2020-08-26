Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBC3253320
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 17:13:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc8WK6CHtzDq9J
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 01:13:17 +1000 (AEST)
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
 header.s=fm2 header.b=WSAg4R0N; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=XxF7z0mR; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc8S33WMczDq9J;
 Thu, 27 Aug 2020 01:10:25 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 7624D1388;
 Wed, 26 Aug 2020 11:10:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 26 Aug 2020 11:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8AnZ67KP5cho8T587AuNuRYl0TL
 vfffNNgGcIjTL4LY=; b=WSAg4R0Njaw1B/2ysuzupPQ8S6+CulKoED5mSJ50clU
 JqYSZIrZR113kMiMSjOMd8XfbRXGVkEP+uCQNYxU4yUaMrBf+ivZR3QyPttqBcr+
 uFPfRZOX2c6A1QDcluOE0Rk2cGh/8QOI0hGNt6rn+2JjmkDz6/eWuRLl1pvrqlBa
 oYzgcprHbourQtxdfn1JbnAus9i0e4r72g2K3BkWEbIl3CCOpU5f7dwIPxz0DQCp
 FIXRG9QA1iwHbTnzzyYKyWgfVYsCdKvoSwFE2bIb9AJgyG1DcxODtGSohgVQERJP
 9rA0jLZ8k+reoZKbcCkzxiw0/ssQcCj2KQzITCwJ+1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8AnZ67
 KP5cho8T587AuNuRYl0TLvfffNNgGcIjTL4LY=; b=XxF7z0mRE7r+ybuLVHxYTP
 mYE8WkiR2XkfBc4mfQ+dP2tg9llHbsrbpPUotdKaurVQhq9zpsDvBKBqePpQg11c
 unF2L31Kqc2LJXXgolzXImmcBVI1hV5zaqfxh8Tqvsc4Y0Odq+hxk3t0Es1HjZVd
 v5kDHJ+WhoabPwWSFzcdamYFSnTwz+YzsMxZEBsY6ClniMPw1d/lrluTxa83tVlk
 Xp8BVmgiucg3q3R7uqqFvGLQpNKu3+y+zU9Hu92vpVZpC9kfNJ7yKp6ujxWmk/Uh
 5ZJccD27bF+Y624Xn0RDMQieNoX8+H3dx3Gq1nBP/mJYW7xdZo7MCD6xXHFxLZVg
 ==
X-ME-Sender: <xms:XXtGX5nPMv3flriw6d7PJt1EVG0KSA0reqv2SAYqS-FQzMHfzjbicw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvvddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:XXtGX032J8z6J0pzLsOLMUbx372TGpEZ6d1r1DHwGe9sNsGyhpSEKQ>
 <xmx:XXtGX_pkqaAj_Th_RHskme249SqEarC_H_YppBDXvtr_oH2rIYV5Pg>
 <xmx:XXtGX5kGNMBHSykD4dopoiYGIdsL1R2LI6Pb6H36nbLHuRcr9b6oNQ>
 <xmx:XntGX8jFBf9Y8n50HUpebvlxtb43TWF1Yo5wFWW0wO0ICtBYmyM-9A>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 571F430600A6;
 Wed, 26 Aug 2020 11:10:21 -0400 (EDT)
Date: Wed, 26 Aug 2020 10:10:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: sdbusplus - const/readonly flags
Message-ID: <20200826151019.GM3532@heinlein>
References: <20200825150028.GK3532@heinlein>
 <421fddd2a3f5b352f0cd5b260216bc8b@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8c07nsHwQobhlezh"
Content-Disposition: inline
In-Reply-To: <421fddd2a3f5b352f0cd5b260216bc8b@linux.vnet.ibm.com>
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--8c07nsHwQobhlezh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 03:52:42PM -0500, Adriana Kobylak wrote:
> On 2020-08-25 10:00, Patrick Williams wrote:
>=20
> >    * I expect some of the 'const' flags in phosphor-dbus-interfaces are
> >      wrong and should be changed to 'readonly'.  I have collected a=20
> > list
> >      of them in a gist[4].  If you really intend to mean "this property
> >      will never change during the life of an object" continue to use
> >      'const', but if you mean "this property shall not be changed by
> >      clients", use 'readonly' (and probably also add 'emits_change').
>=20
> There are also some properties in phosphor-dbus-interfaces with=20
> descriptions that say "read-only property", and the implementation is=20
> enforcing it. It may good for the owners to revisit those as well and=20
> see if a 'read-only' flag is applicable.

Yes, that's also a good point.  If there are any descriptions that say
read-only property we should transition those to using the read-only
flag so it is enforced automatically at a code level.

Here is another gist with all the variations I found of "read-only".
https://gist.github.com/williamspatrick/03d72260982332c786770d0678644f94

--=20
Patrick Williams

--8c07nsHwQobhlezh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9Ge1kACgkQqwNHzC0A
wRnrKA//bkjZgye503UZdh+1+hGplYj4ZsVnYD7FGG1N1cWmEf4m1cnOqttszR1o
BGqQVDCa3Wt+PeQ/L+DzGqdSWG7apnNVuh1RzzX3AH11YfD1mOnQrwzOhGniZmlT
sLOYH5EDIHUP/f+28B3oM3M5HS56IOVFnFcG7vANaW0gU1Wr1BdMeLvsB5ygxk7h
GFe5r/7Xw/yQWbde1hgOosxziTiOVstfLq0AL2KXAB8LNm4vWz5L2VPIb3zRRqlD
VtL57rdF4489agaUvq7DxU9yxr56uFWaRa7bR4u1Y5hAFZqeuYxCPj+Ey8X0jYAT
QeFgngUSNaqvFCcF2B138EbplZUhXcgntBpbZeK1SalfeMZw5fGEDO3c8dXQbFB9
P3UhtX8CT7K8xqEPh2a98NLXWiksImOEjPdZYi9USPkYgnWB8m0vNydJVRiK4cx+
WhK9geNmhJGH5jk4dej0eDt1JhSUPW5BeiQmKVHahKUFDq++UgtXGdQv1dU4WOJc
FBUO2u0enAQlqnFpJp5ifWcolb8sRfIPMZxJ6Ndu3/z57rXMb5J/v3wC4xsBm371
eL2ZG5jZvHhUglp4EkATRGHtceeYn0QlwOKLkvqef6hxTiC1jxF0Rsi7t7G0PKeQ
5EhUJkAAfis8Ly84b7l/PKPPJKhZ/gfcg0uVPnkXeocWmy3VRRY=
=WR/8
-----END PGP SIGNATURE-----

--8c07nsHwQobhlezh--
