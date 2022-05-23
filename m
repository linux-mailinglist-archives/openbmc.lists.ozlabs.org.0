Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 802BD5315BE
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 21:29:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6S7Y3V4zz3blt
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 05:29:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=t9n75ySi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jMbg1LiP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=t9n75ySi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=jMbg1LiP; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6S742qftz2yn2
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 05:28:46 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 271DE32009E4;
 Mon, 23 May 2022 15:28:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 23 May 2022 15:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1653334122; x=1653420522; bh=MzGoVEHoH5
 /MHzwTi3Wyi1RJ5Yp6AQLzXC6hk767KRc=; b=t9n75ySiYLAdCf2KJE9bLA5DkY
 dFMyOe3fp+Ma1QLHfew7sB4/3+COqgzIFCUO2hiGDjpeJfLjux2D0Mo/A/Godlhu
 mnb+5iAQ/dTA/tr40qXur30AqBmvjFGCv0IXz0XRmQtp6d7ZqgSKYYJg6jmSwy7Z
 9auX5ICfKKwj+uF5o51rrCuDuZwV1hB2EJhaGE++cmA6bN8wY+AiXUSNk62TOMfY
 hQ0JYBbKQSRHW9FGAEsZiN/k6BseYIBRK8w8bj1iggRCV6A9DCMRAxK6xbCWqbO2
 tCC6N12UN6gGN323QEilPJ0c4RwiWWUxupTbSD2ebUE+WUVcb3jcdgceZKgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653334122; x=1653420522; bh=MzGoVEHoH5/MHzwTi3Wyi1RJ5Yp6
 AQLzXC6hk767KRc=; b=jMbg1LiPavhL1yUkKquuhgxyysGiQKaJCN8spj8bvxpq
 G9ZC2SGrvIHEFjS42AnEi99ztatywtijjnwplZ80YGCMHEfZcknc8PHCk+rzVDYw
 4mR7IAeU/JuXWnLhEPCyTMF48mG1sr+dRtgaZWz8M5g1G6Ghm2KMhQOTVucXLKmb
 y4Mb7D7djh8MGVUG33VJKw4yWgJN/KktMyTEzxljhtysElrpbNs/NbhvB76xr/+Q
 XUqk0qOcI+tOW4XmDqhdmOi56EPfSexkCIZyh8bu/2aNT0N5Mse04MNQPtwMqD0L
 NVdWX7HFX9u3wmDvesP32bObjTQ1TV3xi2jMMBv8nw==
X-ME-Sender: <xms:auCLYuIWQ1aHcrYTN6j01oyWYpVNCnf1KTaTQ9KHphy5JQMTo5I60A>
 <xme:auCLYmLmbV1EVD3Y4QUU-OMb09yJCEHc84Jmo0Auf-VfjkObHfAsxQygLtynUHjmD
 Few0f7UVmCZ2wC1tlo>
X-ME-Received: <xmr:auCLYut7f9piaekKstH1vlVOzCdD1O0TXsBrnP7ZGDY19PYI0-k5aahwRTLYz44tDaHdwiON-a6L0Nb4LFY8Rnf8zZjYKah3jW0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjedugddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
 ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:auCLYjZRJN2RHL4CIdU_M5p7xVb4uzR9K9ADCYOJvDyEBMTiU6G-MA>
 <xmx:auCLYlbceLciVGiV10MssFQI8fMMwu9gjbYQ299U0svAxdmGQ5pBLA>
 <xmx:auCLYvCwmeiHpPdagG65YvfBAcNQn4-o2pwYksGOQgsvC2hyCXcfPQ>
 <xmx:auCLYkwNRHKTHWt5dgzvAIw6QUlqrjxagiE4_gX-HfXXpDvlNW4Icg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 May 2022 15:28:41 -0400 (EDT)
Date: Mon, 23 May 2022 14:28:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <edtanous@google.com>
Subject: Re: The incomplete result of mapper GetSubTree/Paths
Message-ID: <YovgaMxp/TWjxkfD@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com>
 <YogEf3WTYNBnBvP1@heinlein.stwcx.org.github.beta.tailscale.net>
 <CAH2-KxDXXPL7_qx9yzcwT55_EeeTp=VKaK771L=VX4gTpj6txw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hr0khwmBJcQHXYAH"
Content-Disposition: inline
In-Reply-To: <CAH2-KxDXXPL7_qx9yzcwT55_EeeTp=VKaK771L=VX4gTpj6txw@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--hr0khwmBJcQHXYAH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 09:26:43AM -0700, Ed Tanous wrote:
> On Fri, May 20, 2022 at 2:13 PM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
>=20
> > On Fri, May 20, 2022 at 11:14:15AM +0800, Lei Yu wrote:

> > The issue here is around causality.  There really isn't any way to
> > correctly kick this logic out to applications no matter how complex you
> > make the implementation.
> >
> > The original mapper implementation was causally ordered but this was
> > lost in the conversion to C/C++.  We should look at getting back to
> > having mapper give causal order guarantees.
> >
>=20
> I'm not really following what causality has to do with it in Leis case.
> From my read, it looks like this is a case of "introspect takes some time
> to complete, and the results for one daemon aren't expected to be added
> atomically". =20

This is exactly a causality problem.

The logging daemon is creating 1000 objects _before_ advertising the
service.  It then advertises the service, which everyone hears, and then
mapper starts introspection.  If I ask mapper how many objects logging
has it should tell me 0 or 1000.  There was never a state when logger
hosted 438 objects, so I better not get that as an answer.

It is even worse than this (and a stronger demonstration of causality).
Suppose we had (and I'm making this up because it is an easy
demonstration):

    - logger starts up and projects 1000 objects.
    - inventory recognizes logger came back and instantiates an
      association.
    - power handling hears the association signal and queries mapper to
      get information on the corresponding logger entries.

In this case the paths...
    Logger -> Mapper -> Power Handling
           |
           -> Inventory -> Mapper -> Power Handling

give results as if the inventory association happens first, which breaks
the causality relationships.

> This exact same race is present any time an object is added
> or removed from dbus, so you're right, there isn't really a way to avoid
> it, aside from writing implementations that don't fail if the object count
> on a connection doesn't match what the mapper gave you, which is something
> we "learned" in bmcweb a long time ago.

Adding and removing isn't a causality breakage, so it isn't a problem.
You can't expect objects to be steady state and that is fine, but the
paths through dbus should preserve causality relationships.

> One workaround here to cover the startup case would be to simply batch
> together all objects for a given daemon in the InProgressIntrospect object
> such that all of a daemons dbus paths are added to the global object
> atomically, so we'd avoid the race in the startup case, but it would still
> exist when new objects are created, so it doesn't completely solve the
> problem, just solves it for the case above.

I don't know how this solves causality, unless mapper gives
InProgressIntrospect for every request after the signal comes in, until
introspection is complete.

--=20
Patrick Williams

--hr0khwmBJcQHXYAH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKL4GYACgkQqwNHzC0A
wRm0Ag//d5TQn2vD2IeeqVL70dsk8dzIyhT1xLYOD4iq9OGdpdmti6ByCiEfCmB/
IOKBro2INHCWZ+b5zF5rpRSF68lzFqvJRDzkT0pHGLoXJ6Re6afzA7lbsLwJiurx
QOceaTbLbYWeTzmeDwhQU1G7FzfVmkyfpI/oNM4c8pzfOFtPwfL2+WpyMOUMGvf/
K5gEhqNI6L3E1aZQgWY2Zcr5Fh9IGc8ZGqx2crhPkuZGYwQrKfnyT07ficBCN1vP
GLB06if+qzw0ZUxTBOXLDYzLfgiU/L1VZIqNFjpN2HaoCO1M3uZhGf1ktk1vXIuE
1tRBzvkl6/O3o/NnTPZAeHeIRuCJIJJ5zRl6K6xUB/9loc83jxNBAbd0kkgSjZal
EYER2monnYPd5i3aPEV5tN9kJrOvfuBW9WOC5g5ja4XrxdiJ6l1NinpqhlK7CGTF
/ArXAASt834Q/yyjqZlO2z06/f90ofagmdqAgyX+qCSHigBsGrjkQBcqvh7NBUtj
fy84b4SF7ioR08AKGR5f7hEoUL3qS6s5Efi+MFbNf1cHA1QJNFy2gp+5morbJ7ou
EFHsfF/rQMHTg9z9279EZikfDqVQtSxOZQuM7zzIV2YI8HyXMQcgNaW/pLU07XhU
CD/t70Cz3JmoQ+sQNsS+nCiZ+wzMdQi2l06k0vraTKoo8ayhy4w=
=aEvI
-----END PGP SIGNATURE-----

--hr0khwmBJcQHXYAH--
