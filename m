Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C2314531
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 02:02:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZPl128K3zDsXK
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 12:02:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=LjMAfjlZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=cC2NJ5t5; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZPk7687nzDqRM
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 12:02:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BFEFE5C01AE;
 Mon,  8 Feb 2021 20:02:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 20:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=U+Ci9Db+j+OKTbfhIKfz4JUMTCl
 JSyzD+MljU4yJdRc=; b=LjMAfjlZjZer3gAhcHaR8ggCrvqUB4mc8kUdLebPOLr
 lWn21TkC7gn8iHnx2buRiPRkhGfY7ER3zqV/qVT3Z3JI7jmaKLZ3JoUX6I4vytSF
 4htVYPQoGNtgwJFeyKYF20eCpaWqYeaxHgAJPyKu4QfM+E0NCgESRH94ttsRpGBL
 //ybA+WB50DyGKSt1oRakhdH7InViDYWGCkFomoF72bJlBqvhAq5J5n83zzbULuj
 FiNn9eHfIp4ARTJV+58Q+3yDzxRwtQkVq1fxlrV+3Z8QprNfgjxCxp4+gARJNZlS
 vVjFh/dEfcy3036BaZrZ8OGbCYBD/tY9q/Jjvrigjgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=U+Ci9D
 b+j+OKTbfhIKfz4JUMTClJSyzD+MljU4yJdRc=; b=cC2NJ5t5gTZKjac72vJGC/
 abRCvFHpOniGKFsRhKPHrTaUROg34poe/NAi96KxlLQUKobG9esA7LSmfjFh9JJL
 ZO68fsgR+VR+FOkz8/uI24pftYpQsHVTZNUisMqk1oG3lgxeGkegVQgHcJjsNM1x
 98PYy3Mj1Klw1dofo1eQ8Uz1lJiNAoodinENHWOSW9TpfZZbuSX+f2yS+k9wag4S
 SH4WXU6dm9okMmuCX7IcDfQYJoz4ftHTZRVNKn8wllAFkrvs2m0M8D6boy4GkTMQ
 SxZ1vePICfQhx4qoWdx7u0tABPnQjKyZm+3/m+eTbRe23BcbHpPAiJwZOs2UUvmw
 ==
X-ME-Sender: <xms:C98hYEkeBj4sfdkktGXGgzACMT9v9V6hsALyAUNI-ky5Ptfkd7elCA>
 <xme:C98hYDz8kYmJcPS9cwE0lGFEd_rHjxBOHOsDgmL-7ROMTbzLi0XQeH-omuFLJNjOh
 Ubwbpp3lhFgYntvJjE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:C98hYPhCO-yxVAaKJDxWmzgiyWBe8Vqtut9LH0o9eYUPWQWaDMZLuQ>
 <xmx:C98hYIVAsWGg_Sb4r6FPV5V5OQKR8Ky5XLFvgtcf31-kRn_rX_MZqg>
 <xmx:C98hYB0AC7gnBBHvggEvSOl6NI8DUKFPxGUNuFVFt1mtz80c66D3rg>
 <xmx:DN8hYLwAK_NVxKDGyRysk9gcZLvJru6EmFaC-Sv5avOC503_ehGDjw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 283EE240066;
 Mon,  8 Feb 2021 20:02:03 -0500 (EST)
Date: Mon, 8 Feb 2021 19:02:01 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Does openbmc implement NC-SI over MCTP over SMBus to obtain
 information?
Message-ID: <YCHfCQP72MmgNQSg@heinlein>
References: <380419ba.ece.1777679c335.Coremail.ouyangxuan10@163.com>
 <12175d11-f353-4926-a125-f01e59135113@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kGH5MgiybCwHUHF5"
Content-Disposition: inline
In-Reply-To: <12175d11-f353-4926-a125-f01e59135113@www.fastmail.com>
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
Cc: www <ouyangxuan10@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, benwei@fb.com,
 amithash@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kGH5MgiybCwHUHF5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 11:11:57AM +1030, Andrew Jeffery wrote:
>=20
>=20
> On Sat, 6 Feb 2021, at 19:03, www wrote:
> > Dear all,
> >=20
> > Does openbmc implement NC-SI over MCTP over SMBus to obtain information=
?=20
>=20
> Unfortunately not. There is an out-of-tree implementation of the SMBus MC=
TP=20
> binding, but that needs some effort put into it for it to go anywhere. We=
're=20
> likely to see a socket-based AF_MCTP implementation before SMBus support =
is=20
> merged in libmctp for the purposes of OpenBMC.
>=20
> I haven't yet heard of anyone running NC-SI over MCTP so you might be bre=
aking=20
> new ground on that front too :)

CCing Ben and Amithash.  I think we added some code recently on top of
the Intel-BMC/libmctp to talk to an NC-SI NIC.

--=20
Patrick Williams

--kGH5MgiybCwHUHF5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAh3wcACgkQqwNHzC0A
wRnATxAAoaIsz/9DonAP5zoevqHrfuMWwfSRR2oyK8g4ZYem4DXo5pK3q6t2rY7r
rOu2TLRnU4JjH/OFIgUzVjLQqmbgB3AI8Y+HJytGIcZ1lUZIAFvPd+Ntcpcni544
Nfsj6Y7RLUYfOq1zdI5hcuv0RgjSPjjTTncd5BuXehyrPhoLU3RrMliT4O8yYd/C
Ux/Wbmt6SAjYLbRAL4dsRBGflX74IEeSW5c8gpQ32R0K4VBzgabGCefQGImASzZR
5REPOe1LzVcIq7ej/upRlqmcsXImSTPq+zIkrIMCIHf0uknfqQ2S5vp7nKAlHywV
x2X4RJTOYGZURzp8r9rX6I+Vr9M9RtNrtLFBALH/WWtPY7qZVdCh8WlCWYoHhgzR
pDoVyFJBwy3HjRB5MeBt8jEpmBZJOqCmpsBU0KlPzpxULoGMZ4vxTvmtX9B90VOB
puYz3zxa+2CMUvKhoJmTfQKe+WXCEQ3vXuSskeZNpxxaMFjH0um1GTFFermPA3Mo
vJJJXHzFfD9u1UY+g1cUyz9EHR+hRDGxmgFRIFKg5T3IIA0pNWMH0y1jc4rcZa5a
huqKYRwdgwHtOrlFkf0QZ/eFXqetGR61G2J4WuZw0T6uzvzTruD0hnCvf7Cv7GK7
lLuY8+sHlVkOTuwF2lCq98UOo/ECkLtcjmJvAxfhBQbflLhhw6o=
=jZpj
-----END PGP SIGNATURE-----

--kGH5MgiybCwHUHF5--
