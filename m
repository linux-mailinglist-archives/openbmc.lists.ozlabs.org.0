Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B102543D2D6
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 22:32:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfgNC47g2z301B
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 07:32:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=uIrsswE4;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=M+qv3lXw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=uIrsswE4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=M+qv3lXw; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfgMj4mhmz2xMF
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:31:44 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C27855C0132;
 Wed, 27 Oct 2021 16:31:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 27 Oct 2021 16:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=FTQq+jPsQXvF2zLPRseRd2cWFix
 AiVRf2hdAJiA6Ob4=; b=uIrsswE4uqslNk2095W2ODK7uBnHjqIlh3JCfExp8fG
 xlZYkdBXRyuYOLLpCDl/bWy19kGlz841e//UBjlaOWSMp0/HIK5+A3Gg/aQOA1hP
 x27lk0fk3b/9Z9KA29i9NjEtSq6mt/77TDiQDcIgK2t7VBGBI9luGTg2DNK8hzXG
 b269B3LBAIbjccmXhIimU1405a3iyq7W6cw52Cvvq+0NbkeXfTL8KbIwZLMdErLR
 mcI5oPbB4FJ4wk0PMolg1Sm3G4yGld9ZtUfqgHZDN+71TtdUi95Dua5YHyG9tQdB
 XosYNTjjBinkLcme9iAy8aRKQpfiW5XZDU8YN3tAMzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FTQq+j
 PsQXvF2zLPRseRd2cWFixAiVRf2hdAJiA6Ob4=; b=M+qv3lXwGq8iD2k/5rk/VV
 ahPBQFKHeaZJ1Xbk35fnQXGJT94gTFA2QcOD8wu4S5Axp9M/VDU7GbBKSwEVGEhM
 In8CpWA7Qaq3KRec4ao6W3RdfoccPSEzISK4l56/OYSIOvv78top1YrTBSbZ7pyx
 Sk4OxNlif9F6PeKaEjyVDyfAqgbZ+7fTmeb06uDtAYocW4bkJ2KponPoqA41c/3b
 zPX7N0BF02ZEvsDaHWQDcyCoDIEaOldgbx2nC4QROjo7x2ssMBrFO4y1KSYB/hbD
 kNZeYfCr5TEcAJDTRt+/BH+x6au+teyHg1cnnd9UbYQGYucTihR/d1SP5ZNZspwA
 ==
X-ME-Sender: <xms:LLd5Yc4TEJ7_MOpdm64B4YWJv3qTpvm8cS_SKw4uf0HLGyBBq9DVMA>
 <xme:LLd5Yd6egewlJHqWllYSQE5WRY6FoS9XtMQOTJpU69AK7ats4whXdMd4HYWDHOzxn
 AUIg44HeqpVWRzx5l0>
X-ME-Received: <xmr:LLd5Ybdw9BcM918DqswGxmF1x6CbqXYgJempNhKHdZuM7lb0Yz7h9_jUs7hPAt45DrK7b59U-451pHaTIRHcQIy9r7UyHCELYtGJ1R_SKpYdAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptddvtddtiefftdeuudelledvhefh
 fefggffggfevteevveegheeluddufefgffetnecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghdpmhgrnhejrdhorhhgpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiipdhgihht
 hhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:LLd5YRLU76-3W_P7ggFRtljbSwSQ58QhWAfvXNRo09BF3ONBt9A4Eg>
 <xmx:LLd5YQI8gbquDV2-GTrWqbYph4Ks7AwBxKjEmLRyZyZaKZ63eELKxQ>
 <xmx:LLd5YSz1rhNAjCkYgtEEUBs0mo6KE1kbdtCJf2cyMK3iKeMh66h1lQ>
 <xmx:LLd5YaxNRARHDWKdwk2B0cj3h17lksrjhmHl3gwtA6LU23-8q4GCpA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:31:40 -0400 (EDT)
Date: Wed, 27 Oct 2021 15:31:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group - Wednesday October 27 - results
Message-ID: <YXm3KZ34arM0avFK@heinlein>
References: <d0b57999-f452-5239-ccd1-3823fc551a30@linux.ibm.com>
 <58aa5187-9b0a-7c65-f058-79f749287bb1@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R4TizLi/JX8M+R+v"
Content-Disposition: inline
In-Reply-To: <58aa5187-9b0a-7c65-f058-79f749287bb1@linux.ibm.com>
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


--R4TizLi/JX8M+R+v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 02:11:15PM -0500, Joseph Reynolds wrote:
> On 10/26/21 8:12 AM, Joseph Reynolds wrote:
=20
> 1 FYA: Changing the os-release BUILD_ID back to its default value of=20
> DATETIME (recipe os-release.bb) -=20
> https://lore.kernel.org/openbmc/CAH2-KxB6P2HTE5iqJMx1Gwrrq_w2-gXCZ47ZXaO_=
x5kZ2RAzCg@mail.gmail.com/T/#m0065dab191fe8048ea02ab3c28b31362252f7622=20
> <https://lore.kernel.org/openbmc/CAH2-KxB6P2HTE5iqJMx1Gwrrq_w2-gXCZ47ZXaO=
_x5kZ2RAzCg@mail.gmail.com/T/#m0065dab191fe8048ea02ab3c28b31362252f7622>(ba=
ckground=20
> reference: https://man7.org/linux/man-pages/man5/os-release.5.html=20
> <https://man7.org/linux/man-pages/man5/os-release.5.html>).
>=20
>  1.
>=20
>     Will the builder need to supply BUILD_ID to maintain a stable (aka
>     deterministic, aka reproducible) build?
>=20
>  2.
>=20
>     https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48204
>     <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48204>
>=20
>  3.
>=20
>     https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48205
>     <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48205>
>=20
> DISCUSSION:
>=20
> This was resolved: the project defaults are not being changed.

Can we get some more details on this decision and a reply to the original ML
post?  It seemed like almost everyone was on-board with the initial proposa=
l and
then a separate meeting with limited minutes was held which came to a diffe=
rent
conclusion.  This is out of sync.

I don't understand how "deterministic builds" is directly related to securi=
ty
and I'd be immensely surprised if you could actually, today, build two imag=
es
=66rom the exact same git commit and end up with a byte-wise identical buil=
d as
it is.

If someone seriously wants a reproducible build on their system they can ea=
sily
override this BUILD_ID value but it seems odd to me that:

    1. We would choose to purposefully deviate from what upstream Yocto doe=
s.
    2. We would punt on the usability issue that originally pushed us down
       pursuing any change here.

> Is this general topic (=E2=80=9Chttps://github.com/openbmc/openbmc/issues=
/3383=20
> <https://github.com/openbmc/openbmc/issues/3383>=E2=80=9D) important enou=
gh to=20
> escalate to the Technical oversight=C2=A0 forum (TOF)?

What is the escalation to be done?  Is there some stale-mate encountered or=
 a
seeming disagreement on direction?  It seems to me like only 1 developer is
actively working on it and the progress has just been slow as a result.

--=20
Patrick Williams

--R4TizLi/JX8M+R+v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF5tycACgkQqwNHzC0A
wRmxSQ//TXmUmMX1DrTTdm0q5+X7KBLbRTxLn3HWeKxY+XvXn00duAnFIlmX7SKq
qdflC7PH/4VkSwT+45m25sCV4uTBCBOeyT3RknXEUOuZIsrfv6RLGULLr8s1saZC
Sw53bVpT6MAu3vL28PK/f7627wMwWGZCF/vDBp2tBtH6evAzPpE8zDiPyY92aJCk
cz+KHfp653xjxwkd5I+wg9W8ixF7L07qvFkvjncYsVJ2H3gqnNWqo9M/3KT4ESUx
bJIM+IUFtQiUEHNUiOOKbeT2cW2lcMetTC1OlDIeRhBdd5ZfAqvaK/LwUuxcA8u+
bUwOqXhs+x/RWpDkL7J7htiaAXAZPmnmVq1iPweoQhePGo6qUeb7JDygx1WoKqPp
zjNbkYpiuR6ZzUy1X88jIWDFh1Y4Z6rAZ5QuBqevgdsLl7xapt1bqB3uHabiIOiL
V/Jth7Iq5wH4F3DybNkSKVbRjPdJ8yh7ALa2lsGY7Z01J2FODiGy63VRSsvZuOBy
9IL8/c5b509MBMVrbUtImtD+JqM0nFWUmbUph/Y7/aPwVrbTT03E1jBPSX8M2OAY
2TW3Kn9d/BgM6KDMHvyPKDf3pOa3NWVwc8/KyCrpm1Awny8iQS7dbguYxtrZeC/U
Iqb97NiHHJs8cLAICXRhMUqtMqZwkRQ8PR5hVXE4F1KfwvF+Uv8=
=+h+A
-----END PGP SIGNATURE-----

--R4TizLi/JX8M+R+v--
