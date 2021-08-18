Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD433F0A53
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 19:33:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqZkj3Rrbz3cVD
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 03:33:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=KuGOQ+Nx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ExjcfEy0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=KuGOQ+Nx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ExjcfEy0; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqZkF3kSCz2xb6
 for <openbmc@lists.ozlabs.org>; Thu, 19 Aug 2021 03:33:24 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E369B5C0190;
 Wed, 18 Aug 2021 13:33:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 18 Aug 2021 13:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jqfl/WUAMR+iLCrt7dwaO+Wt+vq
 0nAV9Pj5qcNTGgXo=; b=KuGOQ+NxezREFvvKSvP0fnQlqrKXQxrr4nA7Ae99s49
 gQZfkC3ufIXJ4TRsZfKXWNeyTaON3WunXdXdAoemrsdfUtG20PF+iK9SmuYCAQ0C
 Z9LXxFELyNYPt08hVrd+LIfwXDukkG58nz1/XM0EqiuZdNnqggxqc+znfjH9S4uU
 wlcgePWzn8byNQcsranjJyAwcXT70YKKUVuL7OF8JWw8yMyYPp2wJ99q18wGHn5b
 x1QrgHVkZxbW+l6qbjt39+EMBt1AFRWSXRmORbZpQKOqle2laf1KHhRruOx8ScQt
 OOnRz3ENhEH/ts18F9GD8mrGDiHjsQZ9mNfv2T1YfCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jqfl/W
 UAMR+iLCrt7dwaO+Wt+vq0nAV9Pj5qcNTGgXo=; b=ExjcfEy07W15Z2TuHiSX+Z
 /TFhPo0BRpLQDJXz4ZiGsAfqSDrmP0QHQ6jRqYpBxycJkyGM13VhPx2UUIQfSROm
 ywnm3Cs9vX01oWInNL003nxq8+Tfahd42echCiIOCfNzUONQYKAzomUEuT/8bM7d
 4QaE8p4iJqDqOhEqjSH57bHRnEK5DofGu+sXkXrp7A1qSWQ7HDSY1y1z0hmu8cFb
 X0y2idp8c/mLzqVbEIzdYw7jvoILRGhyF/jc6VzcUU0sv4VA4rhT95Zvd4aiT3Cp
 0VNNttv8xb+Vz6rcWwwk1Ku2m9QOxqnxjxTxXClx86TRoFdIDgg+oMgicoGQ0Fxg
 ==
X-ME-Sender: <xms:X0QdYX3zJwHPi3xu__41h0R3QI8ejUljFt6Ln5JmYOReIt1z_ttkLg>
 <xme:X0QdYWEW94eTIt6hZgUw2mZScVPcvUV7PFUlVX3Pi3Z5NfJS_Xm2jM2TwDJ6iyj04
 tz__pt2yhazO9UAq9M>
X-ME-Received: <xmr:X0QdYX4FHJkNgLq0MkQrPJqJOKxCO4vWwfKbrhPP4ct7akR4j3S5kKlGBhflQtsr3HTsa1m-F0gitTSomR-uRDPhiBBpYRyieWPmZaCEJSJgwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeeftdeuuddugfekueefveejgeej
 feevfedugfetleeiiefffeeufeetiefhudeunecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:X0QdYc326PbqRkniWntfU1Q7m0UPhFkLKu8BKh9oLbekpFnygRWYNA>
 <xmx:X0QdYaEHLfZaaHN6ZOGWW2JWxi3daxnnUedV-M7oS7XeQCbowz7sWQ>
 <xmx:X0QdYd-BWW0hyVMmq_ENHDETqFOFFC_h0pjKw4hWOtOUtM5AL4_DDA>
 <xmx:X0QdYVMUiVlm-ReSGAVEwh0W8dquaWI8VkoOgfNJfxVmZ5Uloq4uJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 13:33:18 -0400 (EDT)
Date: Wed, 18 Aug 2021 12:33:17 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday September 18
Message-ID: <YR1EXQVdfz3RwIso@heinlein>
References: <5dfb0b20-2c1b-8d6e-343d-2df228b3fdb3@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kDr6xLff2FN6ae3D"
Content-Disposition: inline
In-Reply-To: <5dfb0b20-2c1b-8d6e-343d-2df228b3fdb3@linux.ibm.com>
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


--kDr6xLff2FN6ae3D
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 08:54:52AM -0500, Joseph Reynolds wrote:
=20
> 1. Wholesale changes to bitbake recipes were made.=A0 See=20
> https://lore.kernel.org/openbmc/YQ1FD5q8KbhbXVBK@heinlein/T/#u=20
> <https://lore.kernel.org/openbmc/YQ1FD5q8KbhbXVBK@heinlein/T/#u>=A0 My=20
> non-specific security concern (Joseph) is accidentally mis-configuring=20
> something with these changes.

How do we ensure that any configuration you want to ensure is done,
security-wise, is covered by tests going forward?

--=20
Patrick Williams

--kDr6xLff2FN6ae3D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEdRFsACgkQqwNHzC0A
wRmgOw//YCcwAqSJfBW/7crE5x6J9rrqBNAGqV7RPg1V5DxMYxflCZR+1KTmpHSt
7whdndLvPtC7lzVns4fZ0oBMTtZ7M6dwLpiciOKn7TR37KJF/mJc0ED1GzRm/eRT
jEfW9WHs8g198XXrdFv9DLGtRftdEGIwA4P87E7Dhnl+Z0gU2YJAfsk/r5TEtmwn
xe3uVQJ4Uup/Jq1kdJZnfFozvXBnixxwNLGQm3PlFRQZC2MMWrKazRuFDM844yOp
aZc8yJossY3kebds4aKGiiNiKC2/1jeYCWzf/Iwcceskbk4xAAlxi3J6ycAfPTBf
dCQE1Ol7f73yN8SX6XL51T3PNp9ppPHTLB7MfgmPGSKt8KCwWbcaEl4UQUY+LTjB
8s6p93V8FJBkW44ExAkYvaTA0sA3zEoCyz86C6EuQIqSyRwjcqCZ1I3sfVWpOoo1
waxVKRGY7/9H0vELMJG9fp9kU7Kf/p3BisGH4NN4nsDdFJz6EF8rqbKBzGYC+Hz3
odzZqJScVnWXDGr++jynuEOex8GyxGKcQZDeq3hlmVYRUakWVuOY5anaqzpkdmGJ
Gs3zWuz4mQRa3OKQk6X99TogMf8W3kCwpFUWfzTWE2a6oORxQizHQf/cgULw6u3u
tlMfCQ2tQqrEtc1namu4nSdQYfu27+kOZQpBGaUyNODs3LsPv1k=
=Lusg
-----END PGP SIGNATURE-----

--kDr6xLff2FN6ae3D--
