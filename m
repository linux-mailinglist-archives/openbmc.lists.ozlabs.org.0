Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A43C445BD8
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 22:51:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlclg11N5z2ymk
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 08:51:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=WQmcxZzf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BY0eMKBH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=WQmcxZzf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BY0eMKBH; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlclJ0hbtz2xX6
 for <openbmc@lists.ozlabs.org>; Fri,  5 Nov 2021 08:50:51 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 07E125C0058;
 Thu,  4 Nov 2021 17:50:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 04 Nov 2021 17:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=js2BCd6B2UHNUbfD9ELQVUe7j0s
 Glk72vuo25VIAAMs=; b=WQmcxZzftPXn3tePj5FJC7WIApUtk/7Toi/ZlFiNO9m
 nlI5RXmm+EKJjI5wiyZtChxv5G0cCeigSLyq5BaUysAdf56tsk8G0HAV+bYFS1D2
 G5MeqnlWLul0Um8hB9DJYITzqykJgzIVt5V2SWvOCFPCumKw9s90LDjUCbO1W9BW
 tO4e9HVHL9DjqEv5tyEBuXdD68TQFG5k+HEWe9M+EJxGTZMEKZCLukn2GJuJftVz
 LsUnB1ZfTFDEVDN4b9Zk00C995kVr5Kbk4zljBDitmOqqDFdxxwY2AxrB0j+iS11
 nonnGv3K2vGMQ8H6bVJOQeHw6Voxkbmyuuv/wCV+ekg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=js2BCd
 6B2UHNUbfD9ELQVUe7j0sGlk72vuo25VIAAMs=; b=BY0eMKBHeBN0ZVirE2CVwd
 7t8tvo51WI4YtD5fJj+ZgUB9Bwz0FNKaPeCNcCnNOYnQIw5B5HlgvUefws1C15Su
 hr+DpJLorrMUCwbGvmjWH/qtzkhxnBBCR6dBfwaY7bgEW5okjLDjbf8TMoGjx+I4
 xd63cOpUeHRTObzBNrJoNMEfBE1FHPGTiVtpYkpFZosPlbi4nn5T0TWUIYlVcGyD
 8/85in3JcGsIHHasl7RtFSJEF1e3jr2d1AfeAtZY0mYEN67sDto3/e6C5dKFSR4Z
 ObEHWUaLPKE8PhedfLJ0d07JkXCWWHUBQjtj/b91O2pMEf7NPhvDgcS0EMsZVjDQ
 ==
X-ME-Sender: <xms:uVWEYX2mLiduULiqxGI1zBdd-FrCp6mte3Hp6Y1OXV_9Riwsm5c_8Q>
 <xme:uVWEYWFNo8F63j8BVLORuQFSPl36RZBfGssOyywy_fbCFr5Fs2sJrkzM3J0uTcXSI
 IqmD_8_SUuPcnZRDQc>
X-ME-Received: <xmr:uVWEYX5w2ZQ_glJEjIy9EoqjSdotZogkb8tk5uXwdHTUCIh8ZIS5gwh9A6qVZqUX8UD1UY2KtaLctMgCdW_y20O2c70wYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeggddugeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:uVWEYc2FsfiwI63Amj7kT20R6ib-aB1InWC_A1L9wEgpKBQMzYtGBQ>
 <xmx:uVWEYaHqC712NxiQ0vQ1vaDWkSpq0DvYdpMN9w8Bqy3z-B0LVaz-Yw>
 <xmx:uVWEYd8oMp5ZiedAz3D-uzJg3GVQD0laCuCjGRapfp7VElqoZp_ddg>
 <xmx:ulWEYVPfaOl-B4xmqTCEkexiu-RGk5c5cvKtTzkqGMWToNqK2QNomg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 17:50:49 -0400 (EDT)
Date: Thu, 4 Nov 2021 16:50:47 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
Message-ID: <YYRVtwO7ZUotzZTO@heinlein>
References: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
 <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
 <YXBPMNi5yzzEtE/R@heinlein>
 <CACWQX83=F77Rh=oGJWRd9SkhqFoik-duLGJdVpaU2E+SBgWXQQ@mail.gmail.com>
 <YYROU4ar31l9iibj@heinlein>
 <a6be0a56-664a-9685-e058-67edb6a3e5b7@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mCx/DXC54233AytT"
Content-Disposition: inline
In-Reply-To: <a6be0a56-664a-9685-e058-67edb6a3e5b7@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--mCx/DXC54233AytT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 03:36:51PM -0600, Bills, Jason M wrote:

> I'm not sure if it's what we're talking about here with the behavioral=20
> change, but in sdbusplus when a new interface is initialized, by default=
=20
> it will also send a PropertiesChanged signal for newly added properties.
>=20
> There is a 'skipPropertyChangedSignal' parameter that can be set to=20
> 'true' to skip the ProperitesChanged and only send InterfacesAdded:
> bool initialize(const bool skipPropertyChangedSignal =3D false)
>=20
> https://github.com/openbmc/sdbusplus/blob/master/include/sdbusplus/asio/o=
bject_server.hpp#L740
>=20
> I think there are some components that depend on the default behavior=20
> and only watch for PropertiesChanged rather than InterfacesAdded.

This behavior is only in the ASIO object_server implementation, which means=
 it
only covers a subset of daemons.  I really don't know why this was ever add=
ed.
There is nothing in the dbus spec to suggest that you should emit a flood of
PropertyChanged signals when starting up.  Maybe this is part of the cause =
of
some of the boot up performance issues.

We should probably change the defaults to `true` on this and see what break=
s.
The commit[1] where this 'skipPropertyChangedSignal' argument was added gave
this as the rationale:

    InterfacesAdded signal itself will send out all propety
    details and it's values during start-up of a D-Bus daemon service.
    Sending properties changed signal confuses the signal handler
    as it can't differentiate between service restart or real
    property change event.

The original code that added the `initialize` method and the
send-signals-for-all-properties behavior was the very first commit[2] James=
 made
so it doesn't give us a whole lot of history or rationale.

1. https://github.com/openbmc/sdbusplus/commit/1ecde800380fbe9c9ce7c8a908aa=
55aeddb92c1d
2. https://github.com/openbmc/sdbusplus/commit/fce038ad5ac9f458b03d55b44125=
3a9c05dadc3e

--=20
Patrick Williams

--mCx/DXC54233AytT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGEVbUACgkQqwNHzC0A
wRkPhRAAi8qvbnh0k/ZOg5cYolS45sI79iDtHQjyGLsW1FqolkS5u0bTbqD3ylpm
8cow5myFDIC4cmRklHKkQYvAk0iFB9RZxT0txj2ve0kVa6kEPHq7cXdBh1kSrqVO
hlGGbXpFNTeX5AI2DQ1PpMWTRl1ziLAK95U6H0b9i7TzLeublw6LouhtMZruszL4
lXpJ3yH8wMt9EMjOQnajFP0uXSbm0QZD/kcEJ1DBkU6Vn4sMS2mNT3e8Y3Xa9Zt5
op94MNkfGErF3zZFwqm3rTN68HVR7slI+T+0QV5zsmq0G6+rlt0NWMsRAwLEU0ra
2lC8WxadOPRuJUKlDFWOqFY7Qh6eRcJY3im89GSO70QKTudXv4qRbREoV5pu7UAE
4mTPuPEiq9YOswxqwaMgOary8Zxugg4hgOU95FWXP/3RZsZ8iPx0vCwxwz0jcKHt
9s/8YgW2hSJPyyD+5M7C1pjWo4NiIL706UMKlGNdiG7m2zeVEnETNoKH/BHvO8EY
2HIHyhq4ZcvuPz1xlyyVtZ0pq2nKjuGqvFhxKgx0NXGE6yMgL5L3ymlnRdmEaGQ9
6QL5bEtg7RfxoihtxaTWk3wFwbz2k3DuXNU7C2Tk/jO+olceuQ0A/c0QSDGFw/q1
/7z0HC1YLBEsI2xZvf6se4D0wAKUujvLCkOEmvZXdmGS1tRODeo=
=+y9r
-----END PGP SIGNATURE-----

--mCx/DXC54233AytT--
