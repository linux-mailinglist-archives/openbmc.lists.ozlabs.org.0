Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2411B7972
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 17:23:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497yc74CsMzDr3S
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 01:23:19 +1000 (AEST)
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
 header.s=fm1 header.b=CVfMDtcg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=37ClmtB3; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497yYw6rf4zDqpC
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 01:21:24 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 571CC13FB;
 Fri, 24 Apr 2020 11:21:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 24 Apr 2020 11:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xXxgaZRy72BMID9TopsM1WGOFuj
 pU10kJIJ9+gOWIso=; b=CVfMDtcgdf9W/toVKgwsZR6J2tlkTJjBDF7u0Kk4ECu
 79Rtbed35QURjq6PMAynPF3a9lyhCX687R6Z59Cr6OOrSox2awSiS95psrlIIFla
 9UDwhFd28Nw5+DNGjTcaWn1GXx+9GNN4gVbsRZsFyFivE7qkgQYHpbkTSuKGxcD9
 Ddju87gCR1JRV6YHLC59tMYY3nAMp3OBAgTUWiaZ01IO19tXEzv17bpmSSVtP9CU
 F+h0S+Pa72IaPWkuIjuTnUtG8XFwuoWfq4qjiNE2om9PKgfCMJ2fvEu7JEEp/Esa
 RHAzYnq2wFjzXqgMHY/JJI2r1/p+PP8hJmIyjX+nIOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xXxgaZ
 Ry72BMID9TopsM1WGOFujpU10kJIJ9+gOWIso=; b=37ClmtB3a4wXnOjQO5pbef
 n2y3lTnsUXy6DcueecmwKwKMjQ5x1TiLJPgX+SivpTu/WNAAX35GL3CFn//tKZye
 eJ2UyiX5bImy7MsUI2py8Oi/5idFjkVI4FwJzfLJ/5dbOqpAM9y9bVGZoKN1tz6O
 hUJeE8lnsGugbLMx0cvi1UAgykvJo2GiU90wQ08qB0vGKS/rSfNMr2wCWB3WhbfA
 x1OrFsWl0F3iZkZZ6lKWO0jIyTcImdLzT01pWGeFc2sVI7w3l7x9JAsp6PpBtpQM
 o1zwHONsCj3I7jNqRr7M8AQXadDUoLngxuVm8zBQoAhMzI/WhnpfvaXoYzUIceZg
 ==
X-ME-Sender: <xms:8QOjXp4SbVxX0N5qvKy24Pgo41OGLLVJW6QYxz1L3dX2k87KbZ6kxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddu
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepudeiiedrudejiedruddvuddruddvfeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:8QOjXrLW9ydWc0R6C22L9y91v0XcsbcJnnrNwNh1NsjZoyrf6qUuRA>
 <xmx:8QOjXrdCLbkIM7Jf8vetMECjNujwI70n3gDn75FWGHxsnOqzcS1GYw>
 <xmx:8QOjXmfb6MP0nVBBze9pzW79cvmWHMKGQ4i5pCjeVkdbRrMaU3DbmA>
 <xmx:8QOjXlJ0YNDlvc1B228j09_V8bbh7EICE1HayxlW5I-kSnLk9kwvKw>
Received: from localhost (mobile-166-176-121-123.mycingular.net
 [166.176.121.123])
 by mail.messagingengine.com (Postfix) with ESMTPA id 08B38328005A;
 Fri, 24 Apr 2020 11:21:20 -0400 (EDT)
Date: Fri, 24 Apr 2020 10:21:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
Message-ID: <20200424152120.GD26818@heinlein.lan.stwcx.xyz>
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline
In-Reply-To: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, johnathanx.mantey@intel.com, wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 08:36:26PM +0530, Ratan Gupta wrote:
> ~~~~~~~~~~~~~
> Kernel IP routing table
> Destination=A0=A0=A0=A0 Gateway=A0=A0=A0=A0=A0=A0=A0=A0 Genmask=A0=A0=A0=
=A0=A0=A0=A0=A0 Flags=A0=A0 MSS Window=A0 irtt=20
> Iface
> 0.0.0.0=A0=A0=A0=A0=A0=A0=A0=A0 19.168.2.1=A0=A0=A0=A0=A0 0.0.0.0=A0=A0=
=A0=A0=A0=A0=A0=A0 UG=A0=A0=A0=A0=A0=A0=A0 0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=
=20
> eth0
> 0.0.0.0=A0=A0=A0=A0=A0=A0=A0=A0 10.10.10.1=A0=A0=A0=A0=A0 0.0.0.0=A0=A0=
=A0=A0=A0=A0=A0=A0 UG=A0=A0=A0=A0=A0=A0=A0 0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=
=20
> eth1
> ~~~~~~~~~~~~~~
>=20
> Kernel will first try using the default gateway having higher metric=20
> value and then fall back to the lower.

I'm not seeing us with an interface to adjust the metric for an
interface.  I think we need to add that at the same time?  Otherwise, I
don't think we have a way to specify which interface outside-the-subnet
should go (vs today we can set the default-gateway to the desired
interface's gateway).
--=20
Patrick Williams

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6jA/AACgkQqwNHzC0A
wRnFgA/+OZZ8Mj3QN78kiPBLK+neniAkQuTvvI1YWn798e+sThxFtibD1SJIjbQE
ynf8xpBwxfy8/j+8PS5o17KfQEIk++lDvQkACW39md2zykr6h52ehfxIGurx/eWc
7N89RZsW3UFlBOnLPl70IGxzjktWPOwa3GtVHquDZl+l2nmUwtqSj2Jj+R950eFL
tj+q0jkV17lUVVOAy1oO0OXp7ytDtFPs6l5T9CHtPHZfcp3Ep8lPzgGuFIu6HZdU
xbF3kUO5sNsnoLEjoWhuwEJn1Qru5wzqsd4xmbknpkozHuxHc/KMK/uCm9gW1q0Q
en4Du9uzQnFtSNrb9n4bM1EFkNDw0/I1YoxzVy99+j3Bsd0bCTTdNvOCleeUBtA6
EFD5EvCQpVEE6bToi8N2Y5cH97femDi+Kxck/fDcidJ2ZOBtBkzBOiclTjZkXHV5
qCUjvP10ZGpLVhoWSjZX7e3fTuIVv9fOXNrRsIIcKg9ZAaUqf9tGrIusdL0d7Lo7
dQXVieirs4u1txH7vA08wzKBdHfyTPNq/3fLdEX32xUg2UdZvPteXQhR8DW6h2rK
/JBIhL+7Qu17XRLlOuwoqY4iHT/F5I9sZHzyL2Ani2d0lKcVnW9DC/REKdzPBXYi
XTeaf0btzcU56/H8dDWyOEG5aIhxOY5KykcFRwTEqI80xihhU7o=
=ygi6
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
