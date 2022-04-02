Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5294F013D
	for <lists+openbmc@lfdr.de>; Sat,  2 Apr 2022 13:46:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVwGw6B7Fz3073
	for <lists+openbmc@lfdr.de>; Sat,  2 Apr 2022 22:46:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=DiMt/Vkq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OeX8YPsD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=DiMt/Vkq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=OeX8YPsD; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVwGQ54Xlz2xjY
 for <openbmc@lists.ozlabs.org>; Sat,  2 Apr 2022 22:45:49 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B68EF5C0185;
 Sat,  2 Apr 2022 07:45:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 02 Apr 2022 07:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=7ydg/DZLmfvT64EtSgjXiwq/RuT3zFNsib6hgq
 OFIEY=; b=DiMt/Vkq6Oesvfrt+DJFWWZBsysbv2YhHH0c7A0Um0MoqLJI+21CRv
 AqeZyuzqK9zfsMJuB9jQJrWtYlEwR96i8bsoCDjbXt6N0w5bUeKxg/PRaZksna9T
 4CWtmGZwr7EwE1n5liXvErx+z8zBKAebg/XRRK9tqLIKnyG5d0UE2+urF2eqGq+y
 WIYThwdZQxPWWdjBWwkPyskovHTURM+fRqG67/x/fjrPXRg+gFzTjqb4OIVd/PHp
 SbkHvlQCoHB+nMOJFiROj1jXhJsm4u64Kjp8SA70geQDYtV/BYV4hdSO2/+FKDIm
 DBP/nzMJhp/ggtjfNWrDg15IeqyjRA0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7ydg/DZLmfvT64EtS
 gjXiwq/RuT3zFNsib6hgqOFIEY=; b=OeX8YPsDoHCFzDVmbqsb+sW3SlPFO4IoO
 MU0uWeufiqF9erreQXib/KLJSdqjNNof7BM3jeTEcxwIGlXDgy4vGAI/61UU6RBL
 UKo8E2K0GFkJp2adgSq0bHFnOsc0pbCN6qkOnuarBQfnKyFxOaAQU3oild2zT1n4
 +CCoetsKhHj/Yh4X/QekhIIzLolBdNOw0KvLfQn+eJj5oQKj4wqwLkTnSHWr+FaK
 3G6G5hUSRXRcHHkkCgztUM41W0enCVuPtLfqwFagRx+CihavOPTSHlAMS55ZtPk4
 eaWwoJwGVTXk7smajxcYNPLnsvuMY5WWlSMARAdHAkDQ99w7Tg+yw==
X-ME-Sender: <xms:ZjdIYhAGdJj3I0bmmj6mX9Qh72DeCmsS_s8nU3Xc30AqA7TaH2Y8YQ>
 <xme:ZjdIYvgQj-Wd4QjoXYaoHFtrGhzckQEwwL1APPOzqo1eahk48k68brKt0Ant9qrh7
 UQob4itZWuSuldNQpo>
X-ME-Received: <xmr:ZjdIYslhKfOrmQPXGmEE8TZWJdX2Pswph04G5GVD2Rchq49DEUAPaoBr3Kww2vimXqd9esVfm4zy2YZkk_dsezNjNC2S0_U2LGI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeikedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epkeduuedtfeeihfehfeehfedvjeeujeeikedtteehledvhfelheekgedvieevkefhnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ZjdIYrykqG6jvI1b2mTozJPuOoBjYz82UzckBp1lauIYyTh-76rmMA>
 <xmx:ZjdIYmTQYsNcDNR_2nEfAsnjOJOZCrzMmb9vGI6gbbzbBh6bSDe43g>
 <xmx:ZjdIYuYuY01n66PtSYtVwt7Q2v_tfTP9_wGxfofKUGW5CHJeCad-tw>
 <xmx:ZzdIYv6Oay20wBlSPAKdB0S9z_DwJMGpZpxnzpyrWn8xO6cfHTw41g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Apr 2022 07:45:42 -0400 (EDT)
Date: Sat, 2 Apr 2022 06:45:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Missed interfacesRemoved signal callbacks in object-mapper
 results in invalidated DBus objects
Message-ID: <Ykg3ZO/aqNsY+SKG@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UHMED4Np0MThLfp4H-i8R24o8pCns2-6MEzy1Me-9XJmA@mail.gmail.com>
 <YkdmjcI3Mk3dvySe@heinlein.stwcx.org.github.beta.tailscale.net>
 <CAGm54UHYuUsJxYqxdmNVJJxRaJvHF3hcmnTD4d06TMqA0qfMQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5b1nMCt92mi60Dpz"
Content-Disposition: inline
In-Reply-To: <CAGm54UHYuUsJxYqxdmNVJJxRaJvHF3hcmnTD4d06TMqA0qfMQg@mail.gmail.com>
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


--5b1nMCt92mi60Dpz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 02, 2022 at 11:33:57AM +0800, Lei Yu wrote:

> Thanks! It's a nice article and clarifies the different cases.

Thank you.

> But I still have a question about `Permanent Sub-Objects`:

> > We never want the sub-object to deal with its own lifetime signals! If =
we
> > did they=E2=80=99d also be the lifetime signals for the parent object b=
ecause they=20
> > are all residing at the same dbus object-path
>=20
> For example the `Value` and `Critical` objects in phosphor-hwmon:
> 1. when it's destructed, it will emit the interfacesRemoved signal for
> the `Value` interface, but no such signal for the `Critical`
> interface, is it? I do not think it's expected behavior.

No, this is not the case.  Value _will_ emit the interfacesRemoved for
Threshold::Critical.  This is because Value (as the primary object) is
using emit_object_added() to signal the InterfacesAdded and it will use
emit_object_removed() in the destructor to signal the InterfacesRemoved.

I also wrote this:

    The systemd sd-bus API provides the following functions:

       * sd_bus_emit_interfaces_added
       * sd_bus_emit_interfaces_removed
       * sd_bus_emit_object_added
       * sd_bus_emit_object_removed

    The interface-level functions take a list of interfaces and create the
    corresponding Interfaces{Added,Removed} signal. The object-level functi=
ons
    are simply helper functions which create the signals for all interfaces=
 the
    sd-bus ObjectManager is aware of having resided at that object-path.

The object-level functions have nothing to do with the interface types insi=
de
the `object_t<...>`.  They send signals for *all* interfaces on the same
object path.  From the manpage:

       sd_bus_emit_object_added() and sd_bus_emit_object_removed() are conv=
enience functions for emitting the
       InterfacesAdded or InterfacesRemoved signals for all interfaces regi=
stered on a specific object path,
       respectively. This includes any parent fallback vtables if they are =
not overridden by a more applicable
       child vtable. It also includes all the standard D-Bus interfaces imp=
lemented by sd-bus itself on any
       registered object.

Notice the "all interfaces registered on a specific object path" and
"includes all the standard D-Bus interfaces implemented by sd-bus
itself".  That means interfaces like `org.freedesktop.DBus.Properties`
even though those aren't part of the `object_t<...>` directly.

> 2. It has the assumption that the service needs to know which is the
> permanent `main` object, and which are the `sub` objects. What if the
> service could not tell which is the main and which is the sub? I think
> this makes it harder for sdbusplus' users to design the object
> hierarchy, is it?

I've been doing the conversions and I've done half a dozen so far and I
haven't really seen a case where it is a challenge to identify.  We
almost always have a `std::optional` or `std::unique_ptr` holding the
sub-object, which isn't constructed in 100% of the code paths.  If the
sub-object _were_ constructed 100% of the time, it would have just been
included in the original `object_t<...>`.

If you really have a case where you create interface X 50% of the time
and interface Y 50% of the time (and 25% of the time both), then neither
of them are the primary object and you'll probably need to use
`emit_interfaces_added` instead.  I haven't run across code that does
this yet and I can't really come up with a scenario either, so I didn't
document it in the article.

--=20
Patrick Williams

--5b1nMCt92mi60Dpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJIN2IACgkQqwNHzC0A
wRl2Rg/9FZ4O41KuvUiGj29s5pAeUAGFZEVsqi65unPWs2t2bLkCwql/LYwF29sZ
/1XTCQ2k2zEIUr2O9rQKpq6iDufOhtpuC5GOna8e1q9xx4xxG2B05YwOjk2m1An1
TXUSGdWxYMq5XfQVaax0Q5QAVlC/f6vZgsfGkA9Yo38hWzNjdYrYb74x0y+wIeev
qLhqdtn7jutO8uFijRd4Aqz6liz1m2qJ4xptuIhugKxPq+kANX7X5nymDjJzkrbn
xuQBc5Wtc0EdcWzTogQWz4gAPoPbvEYZNE1yDjUWvfQELUxohGxE/Af/BCjORcBi
KmKGbNN8GjBdQUkNgJntd1/oomQ4oaPAWuder8TBo3pkrpBN3Ll19Sm2TElhyAUh
Y2ygqSIBT0EIZp8SnV60ljR5NnAtvmCzyNt4J+4mXlHCnjJ8EqbScOWcturhLT/h
0NjtzxpBJ+tZk+jQcYIHAkwGjpcT63KCCcFa1UR416smnTNG4RMI0lg94SkEUTRA
kvZ0fpHZfhJnPWeUUgrFS2PbqDRcDHU+5xb+5dfXUsBiIOLQNC+u/UHS1ZYKV+cI
TejAeC89LVvO4YYlBIc1wEm2GH5QspoZkr/wXBIq6qXaPrpSrGcjlF9Uj5t9F2b8
gQWHsv6QRadaNQcT5QXWaUk5bpYSisu8mwMqdGUfKKJ3sNgfl54=
=itpX
-----END PGP SIGNATURE-----

--5b1nMCt92mi60Dpz--
