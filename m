Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A17519B86D
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 00:30:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t1B41JDrzDqgk
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:30:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=qW8h8CCd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Qac4mr4E; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t19G5JsLzDq67
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 09:30:10 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 308E45C0348
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 18:30:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 01 Apr 2020 18:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=rLQIXe1mP30y/hzlu0z/Q2NIBRx
 DCBQ/NhqAyhO3BPk=; b=qW8h8CCdy5JzLYA7eYdBW8yVcFNU7euZt+Qo+y3+Iew
 IVtaoLo7u1ZIb0ZISSYe2Bn7srlezb7Aah+pUoSDC2ablqyw5ENLR9fZuxNUZ1dU
 72P9BSiptb2Cv/QJRnKzrEsTiP1YjOnQ+JiTf9e0rZ6WDszHfDizOXaDdIo+2uBY
 4gZrfOGim4AV8hRdQRabdKQH6vvCQ2VC9TlQUfDNEitGh1yL5aTC4oN9MUjnhMGo
 PaOnEXsTSZjtXA1q2ktPRX8/RCajbxB7zM36mDwsmU1EPv2+iQDg7mq2CAPUSrov
 bzJ7tBpNf6wVhKxqAlb0f7bGEtkes47UI6AHuIJhaAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rLQIXe
 1mP30y/hzlu0z/Q2NIBRxDCBQ/NhqAyhO3BPk=; b=Qac4mr4EmBVdhl3fVARxqw
 IfgL+lFxw1bnhZdRc0S3ubAzDRqTSlMwPFbGMkP4RDsUx0MYZM5avoOG/M9jvs2Z
 XOq0hEUUSRzgyLaPfi2YvgKxAM5y/u3qgbe95bnhls4sQqagQahQwMJm273gKNRQ
 dgLI5bYyzsuxiMNUf95Jkjg75rFBplrkMdjPbR8BBmaR4a9SKi9XBDXv8PJwbtaE
 /MpQrcFeBGJpDHvKO3AKl61KWDeCt+gR+W3vq8ak0JAFYE7a8nr8VWLnR0LkIGp+
 vOSwZ/I7HBAyUha+UG7BYiyoG0WYOF1TD8gnNU1SkhXEAayXhZ+jR8NUSgn2HhfA
 ==
X-ME-Sender: <xms:8BWFXtuaP59HTAvSysJ4WDRryCB6vXhgl9cNwks-SEDviDHCAhjToA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdefgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucfkphepjeeirddvhedtrd
 ekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:8BWFXrZmpqwUtwX5tjIaJzmj2RP31XjX1zoxgPbCuR4jm63zxiamWQ>
 <xmx:8BWFXlBvaQjPhcTlQkv60pEQOVqZ0Tp2YCCN6pTDi71PwwuhGnrH0w>
 <xmx:8BWFXj_7R16G-HXl0Vus8_D0558BWefcH9MhxzhYQHINuVTA4BdB8w>
 <xmx:8BWFXv18FvwoCmoEHfHfZNfTfQhqA8usknkdM6SlC8-855uSRd6tkw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF8583280063
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 18:30:07 -0400 (EDT)
Date: Wed, 1 Apr 2020 17:30:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: meta-ingrasys MAINTAINERS
Message-ID: <20200401223006.GC580847@heinlein.lan.stwcx.xyz>
References: <20200401222641.GB580847@heinlein.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline
In-Reply-To: <20200401222641.GB580847@heinlein.lan.stwcx.xyz>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Similarly, meta-ingrasys has no MAINTAINERS.

On Wed, Apr 01, 2020 at 05:26:41PM -0500, Patrick Williams wrote:
> Can we get a MAINTAINERS file added for meta-intel?  There isn't one now
> and I'm not sure who should be added by default for any code reviews to
> it.
>=20
> --=20
> Patrick Williams



--=20
Patrick Williams

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6FFe4ACgkQqwNHzC0A
wRle/w//YnLyiOqdCAaB2AE3z3yDZHlmlVYf4aX+npiYOlyWDn7/d5axA8R91HeC
kh5EkLRBZwbEKC+TL6kMDafOd2qTwV3xXNnUYxaXIOS0SgQ0MC7c5FfmkZC+GxrS
3pmufJbfv+dyQ3sQ9Y5X2LS8P5rPRD/EX23cmCluK30AMUt/tr6Exj75pwQ7F7m7
OEgRInzAyYm0z0zrDNWXXxWqsXfkbvuXr+7eC+m1i9OxdaHRM8DKYJbvrVD4anVh
lJ9lEthirAEtMVaElhkt7VE21wgYr/rjSWmAyZIxMrgHxxvXNjaoIWlsQScAI7VW
Jac1TJIXyOi+YBD6zS8fH+PA0oqJFp3lH4GEAGhOpK/D5H1pFUGI4t7fYo16F3AJ
GUBNFaV0RHpQ3xK4u6lsvffsE5z/8q21hIc+gZYrhEuKUtl/eSL98/hY3VAgRjZ0
6+oDiAiQ2iiJ7ITaCJdRmN9JJ+GXndj2y4gsRUdhzo2hYtDplxWxmhQkk5XiVfPh
n3toY/8NHDX/fDjyPyDfohQ+Ih8Vf4T04QtE5CYuDMTyHnsEThUSjvdRHTewuBYQ
4+dSDf7O91tSRJsW9I9Q5gMRqf6+KVWWA263S5PQR6pVUqSRwSK/kmjS45qiQpog
xZ90EkxhUgxGvKyvbgrCfw7msCyRM3JwrwcaYEWvJY/MZO0zOUc=
=G53D
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
