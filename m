Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4CD4EFBE3
	for <lists+openbmc@lfdr.de>; Fri,  1 Apr 2022 22:55:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVXVj3B15z2yn1
	for <lists+openbmc@lfdr.de>; Sat,  2 Apr 2022 07:55:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=Pk3f4fon;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BnJIng26;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=Pk3f4fon; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=BnJIng26; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVXVD6n17z2y7M
 for <openbmc@lists.ozlabs.org>; Sat,  2 Apr 2022 07:54:43 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B52675C023C;
 Fri,  1 Apr 2022 16:54:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 01 Apr 2022 16:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=yv5X4gYyYHFTyAj1Lzu/SkE18dSzfbyJsEB/Fd
 u3DYk=; b=Pk3f4fonLpZBAEl1X2vstxpkfiN87B84+OEe9NvPxD+lafFeMn1Nd2
 a5OscH0zF0cLMF0pUMEZGoy8dplUf+Q1yH5zAsJJjkrjWKgmiJUmDnfkDStwOzN5
 InlwUkCOzyQNGyE44aKf6glLqSNoTFprcBPU1qN0UW7bungH2/TgA3B2m/KiZQZ4
 uz6OjtJQH/tHYmv5jdS2wAe0gImt4IuPTouo0La0fz/PoZI8MnugMTeZXEMvyZnl
 dQKCFrum7dhSt1OtREMjMAEQf78UBj53LkckaATNvT1Z2qH5AyM66F9zKPJgufSZ
 d25eIIBdxgBoW6uvDbVYWuOa581uwGvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yv5X4gYyYHFTyAj1L
 zu/SkE18dSzfbyJsEB/Fdu3DYk=; b=BnJIng263H+QlbJJMnAA3l3+mdzSBrtyh
 XtzlvySaQdFOJXpQ88mWsqB+5P7jHIFxaJA0c3FpfOsesnRSjlWELpr/mTQSaifY
 wdcISkoxFlccgVVZ6fHGNnS2eIr7JufwLbjUJRZJeOYu2pDHEgQ+UaM3YL0JFLIP
 PW8exhM2qKcm9e4eoDJ1Sa6FN5kHXthA2GoZJ6I57mFTy/fxvZ4/EVgk2FlrlKIq
 OnESfs9JCb5v8GHokiuBlhgASKiUsnCau/XW1551H+YsQzZ5gEVlWByF9Odajt/t
 zZwXBSJ1rAgENJDrpC+PdJoOeT3vlH6IBFyAVNen0I+DvPuzw1AFA==
X-ME-Sender: <xms:jmZHYosp3c-fB2F8ueSl5JREz_2BRZKrkOPf9X-gzQs16O8xuJyHxw>
 <xme:jmZHYleul1JlxQdOXMea6E-cZdLoe0--wOSMYqf3DAZ7rAatpuDNQ-fMQ1320JmLk
 CC29lMIkoikFZcwnJ8>
X-ME-Received: <xmr:jmZHYjy9y5JxXrj5UuP6Rk-NcjL_Pw5v8kriivi077aLUr_zmLxhWcd3RLzQPmSm14AJj_HPvo_bhRaCkhlndn0oawCfV64rMh4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgudehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepff
 fhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
 lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
 hnpeduveffveffueehtdehieelvdehvdeikeeghfejiefgveefjeekfeehvdejkeeileen
 ucffohhmrghinhepshhtfigtgidrgiihiienucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:jmZHYrPm9kxKykcMOnreiN7SQ1Df-cO9gtjyHc5aPk-U6cNKqyr5jQ>
 <xmx:jmZHYo_QrLuKivP3_j_eROtocVzSjeki2nLdSHdiru-7kzecoDq_9w>
 <xmx:jmZHYjXjr_IuiPvvsRdjVOSTJqDSpgyimml4NIHVGHzh60il3h5tAw>
 <xmx:j2ZHYtHFxDxDgBb0m-m6hiQJBLBW9Zn4d85LKO9PtU9sPQ1TeuQbew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 16:54:38 -0400 (EDT)
Date: Fri, 1 Apr 2022 15:54:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Missed interfacesRemoved signal callbacks in object-mapper
 results in invalidated DBus objects
Message-ID: <YkdmjcI3Mk3dvySe@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UHMED4Np0MThLfp4H-i8R24o8pCns2-6MEzy1Me-9XJmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pvpx44H69+VqOctD"
Content-Disposition: inline
In-Reply-To: <CAGm54UHMED4Np0MThLfp4H-i8R24o8pCns2-6MEzy1Me-9XJmA@mail.gmail.com>
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


--Pvpx44H69+VqOctD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2022 at 09:19:40PM +0800, Lei Yu wrote:

> This looks like some fundamental issue in dbus-broker or sdbusplus.
> Is there anyone who hits the similar issue?

I've have a write-up on what I intend to do about this issue at:
    https://www.stwcx.xyz/blog/2022/04/01/sdbusplus-object-signals.html

--=20
Patrick Williams

--Pvpx44H69+VqOctD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJHZosACgkQqwNHzC0A
wRnXrA//TBLeXvupT3r6lO4Me5NsyNjM6UUyJ88LRXiWPGck1jfRC5Xv5BZOotwT
ScED0zhea8fnr212B0Ev0yiIFCFxFA6HrcsBMbKjN84MCBSgPUaQW8CJ0ShyWZMd
kz9wx5PIEOXoKc3wZx4d1eeSqtujjNWTBZsMH3QKEZTFysA1aUMEtiX0TbIuXQDh
lV58VZgznVE0MIxkrV8ujk9zKfrpjZ96tKaMmtg6mgt1HbSzNND6uVMEcCqRJleS
beWaVNpuJIE6nGwziiSvKl1NP5yK64lGMsM4kWw6ie20uj3OLruLrvzoJOrPuD//
LUu3f9Mi+/KM9o0eq0N8I9ruMwr6WvgO4r2d18BKnI9Qfz9JX0jb7Bo2r1zm7AiA
PnKDe5ds1fDwHoEK73jMIgoBrrpfXS38sZts1EfNs4QZSouInQDGW2ui0DcRQC7s
KSWBDpB8jB7dKf1AaaGIuwLkUROVT3BhX7+3S1om4pJ2EUBpH4xWZNOOulJ+gFp9
dUC3ZXxgrfvyZ624PQ0ZYlNnSxJ7qX1844aran6XLInlUrOPqgfELfmJHfUKlUaw
DixkzFOWWSMPkn0IlkXWk4NO4yg2d6xoltdmdE/dW5W0ZzdaiTR+XKPN7BGFyIIg
pJBshfh9IPjgzdus6XiTFQ69B5s/nwOh5JVb9y8BA8mrZbnLo1E=
=09CN
-----END PGP SIGNATURE-----

--Pvpx44H69+VqOctD--
