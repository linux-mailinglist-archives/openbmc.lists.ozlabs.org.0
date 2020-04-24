Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7CC1B7237
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 12:43:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497rNy2WlYzDr8q
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 20:43:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=McV7CzAi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=hXUX8kBU; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497rN15M0mzDr5Y
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 20:42:24 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id E9C0DC33;
 Fri, 24 Apr 2020 06:42:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 24 Apr 2020 06:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6qjI5swdlVzocmbfeSbjXbstSzN
 7yU10roVtGuCBp2c=; b=McV7CzAiPDabpC3NAhgfKEHD5kTXzRvApLxbi2yp1AK
 z/AaHXUvdEOuxCKdV4XDyh6yizvTvOVjzzSozc5T6EMGZz/G+OSEzXuNrTQpJMml
 Z6A/sB774WKJeCiJQUPL0PcTaiRcqa7gKAym0xWe6LR+Rd8vvxAeLPgNIBGIa8xY
 o5V29XI1sgjbKNJIG0lPzOtYCOiDK6IMx72vGaJnjYuRxfT6QF+1jdRInE3dxkkQ
 6Jqn+NX41M85L1D/y7hl4J0uQxxxmjenjpfUBf8vK9JkNB7r3jVCGQUu91kwjaAk
 OWV2FqAF4nIWvqNhiS2iOLwwCepnfgBzCPF562SEKJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6qjI5s
 wdlVzocmbfeSbjXbstSzN7yU10roVtGuCBp2c=; b=hXUX8kBUer5hzUf712/cTM
 JYcsaK56XJf7M0387XjpWCuUxBvLH+e8cyAUN5umGwp43m3mQW0h2rrihHTJWBIM
 FTy0uLQoaC1VZH5h6hXHGJmyknWR0hdW3hRpvs58gPsceiLQ2M5+z/8QC67az0ZQ
 6KJcHPkmML/E3KL+DchV237YcGLAt8cMHXvWN5O5gR1i5HRhdV/ngESAllBANTzZ
 AhuKfWQvRUbDce+vUtWPyZIpVboiuFmAdjPC313z2nwqMzDh8Yf2far+d2yp2IWB
 dZtJt7NHhTX8dIUckeU1hsimQpCXs34eBGkpubaa2H6zJc4A8/TwtCA8+SxI+TgA
 ==
X-ME-Sender: <xms:i8KiXt2zjpl4Br5J9p01_0pgX1hJ8rlu0OXe0yWsow-CG5uXK94CwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiih
 iienucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:i8KiXrDd6w43UdgwFFo2Kys3OEmk6HN2isKHgkDCo87OvL22r__sLQ>
 <xmx:i8KiXm25TAyAxcbzFou9131v-gxc9UA5jig-JWv35v-6IX-XINMS1Q>
 <xmx:i8KiXirZjP6K_PK2Sa1s8uGmQ_ksQ4bLLLq78cKLwrBNR5UUbSmUyQ>
 <xmx:i8KiXu8lGF2NuIPXFB4LptloYAVGhgWfE_mfHCoG4_rWEcvY80OGVQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 470563065D8E;
 Fri, 24 Apr 2020 06:42:18 -0400 (EDT)
Date: Fri, 24 Apr 2020 05:42:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: dbus interface for SLED reset
Message-ID: <20200424104216.GA26818@heinlein.lan.stwcx.xyz>
References: <903F1195-A0B7-416A-8CD9-BDB1E30E0F2B@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <903F1195-A0B7-416A-8CD9-BDB1E30E0F2B@fb.com>
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
Cc: Patrick Williams <patrickw3@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 06:54:47PM +0000, Vijay Khemka wrote:
> Hi Andrew,
> As discussed this in patch review https://gerrit.openbmc-project.xyz/#/c/=
openbmc/phosphor-dbus-interfaces/+/31319/, I have thought of 2 approach to =
handle this interface.
>=20
>=20
>   1.  As included in patch create a new method Sled Reset in xyz/openbmc_=
project/Chassis/Control/Power.interface.yaml. which can be invoked by user =
for sled reset.
>   2.  As suggested by many reviewer to have a new chassis instance in xyz=
/openbmc_project/State/Chassis.interface.yaml and use powerCycle property f=
or Sled reset. As chassis are named as chassis0-N. What should be appropria=
te name to be used for this instance if we choose this option. Can it be ch=
assis-server or I am not getting proper name, please suggest.

#2 would be my preference.

Per xyz/openbmc_project/State/README.md, it is sort of implied that the=20
'{bmc, host, chassis}<instance>' are reserved for those relationships
but it isn't explicit.  I think we should pick something like
'chassis-{system, machine, server}' and add it to the README (I tend
to like "server" least because switches don't seem to like to be called a
server).

--=20
Patrick Williams

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6iwoYACgkQqwNHzC0A
wRkS/BAAqQ/9e+qQtXah3L3i7x3nFHDI2Cood7y6HYnYLMs/Y6a8WkBDIq7ytQti
CsBTc+vX/8ZDBf7gdwe51Ba9FlHKJRgZiZg3fi1NJRvPrlaBqXOw1PAeUjy1h+nT
0kbGVr9iSU0oui91c0YjfujLfCkLE28EYRA+2j0mEJ1BWd3lwLk0n7HX8ZcO67M/
7cJ1a7RvrWeZr6TU/Xj9q/o8o4INlZceDmMgofMufxf1DA2ejGVU+EPv/N1BwU5c
TK9IVdiJgFTql7nTf6gmM40ydxxl2U11Mbl4tuVUPLgO9+Vss894Fc1vx6uCJRX4
Oa5p4v3GL3A7qhcwk6zxge8QjCzlbEj/0s+xrOqrtM6JEZ+Wbk/IVJNoiwggXAVM
yLBo4sjzOmkQvDtvEW4WVYVmcVUoIHzZjcF1+Q2nnNfY1F5pXii1JNT1QBi0peAX
KGZAoaxw5xyZG7cbhgIJeG0j0UQoDv6uhmCXtdR6lv4Y91kiRq8oK9Oeb3fMHCyQ
KuTYGsZhagaI2IsKOyfa+xpZMA558whafLyYTNj/mxK26zWf7n4W/10v7lx5k+LL
GZRPuh03KY8zMsC9XzKXeOb8/7KxXJbUKbXkFFoYbRb3EI0dT3TPAYfBhN/HdhQN
t5f1hT9plyYQh9JdyQ2/NwqmDfRuPHF+SYhTYisT+mRrGcXlknk=
=v+qK
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
