Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516AF52F4D9
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 23:14:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4fbr1GFxz3blt
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 07:14:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=YXZoom5q;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=To+ndcdb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=YXZoom5q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=To+ndcdb; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4fbQ2bzDz3bk6
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 07:13:38 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 50E685C019D;
 Fri, 20 May 2022 17:13:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 20 May 2022 17:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1653081216; x=1653167616; bh=oE/9BNw/9A
 YiohFLAv8h6wXSM9LZuZhfPcn9bQYbP1E=; b=YXZoom5q4Nb6cbIQAqzj9LH9Wi
 G3sinnnQ39oHKzipTqKU0mWuRPHj1HOGSrBlYtajvsHfuTw+JQ3LMyVxEkSITOFo
 AE8PkO1pT+m+mDlR1ujKAMvndDtcgZ9HqzmTX/oJXOAfCgGuhK5lBVyFoe2+DhBF
 1XQcHD9SV3bYqI1VCaAz11RG7Du3VHJrfmf6J4Yxe3TIorYu5eNV663YontdoYDr
 F2CIUIKYkEbLPSqCbJ5dxryD8l91BGHmqV5UMPRFHHsql1vGdXxL/Pbx+zloK3/9
 jp31om1kKXwwkaAoVn+PAVFuTlHrgvIzhe4W6F/cKYZJ4ZpbXJkM6BBUzCaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653081216; x=1653167616; bh=oE/9BNw/9AYiohFLAv8h6wXSM9LZ
 uZhfPcn9bQYbP1E=; b=To+ndcdb8H8QdNuAWhq0vY6ru0sT/1pAjSWBSUkYAVKF
 pMDp+O9aOZRwqE35huSw2kwa3Ba3a6XkVId0D67zIZB0T1lcxofaJIJ/9ttawMuH
 q8Xiqr78GyiCPSfOuWi+/rH5wJCVWdhk5qc8/XuVJoG0rYgroJec9zx+9sXR+NbI
 REZdLjYg+U4JKvGcmV29JPCVWMvp/1iUIZzTESwN0ErlIAhBzSE6BibKMANcsbl1
 vvwOyLTQOKwBRpoDeW7eeQORZKFQdW7YjS8VQdF39+ENLT+/b2WdrbthlIhE4QwU
 q4LnLPA70ZOIkrbPnvPvRqwiE/3oQwvkxYT5xvuLfQ==
X-ME-Sender: <xms:gASIYq0BE4pmfyVPi__yuRW5wK8scqZSnF_ObmYsP-ED5HpfLXSK5A>
 <xme:gASIYtFAC7e45PFc-TOYqEmM2gknuFqHo0pEM6I_7BtMPq0GVQXSzgU2DkF7H7Rm7
 81tvkpq0jU85BHxVps>
X-ME-Received: <xmr:gASIYi63EgIynuL3fVWt7NdNINsr2Yxnqg6gfdfmQZfmXU3OLzUEm6foN5vpT4mTyeefIdVdyjTPNYq0vmu9vaw7bHmyy7afvUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgdduheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
 ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:gASIYr2-1rloXIhVv1X52n85zBXK-_1POR9Y1bbnBNkTvlJXnsv-8w>
 <xmx:gASIYtHITAiieN1bhvJ3n8clbNZwHgZtBzityT6e3Gpm4s_0J-cxrg>
 <xmx:gASIYk_jr2Qj5mqzVJ61GVGugi3M4kZ-8r1jDd3aUwAJ1LTUCA19hg>
 <xmx:gASIYrMEzmRne3u2s2xigP1iEy1IC3cwYPTUtXXd-nZ7CIqp1ejKVw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 17:13:35 -0400 (EDT)
Date: Fri, 20 May 2022 16:13:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: The incomplete result of mapper GetSubTree/Paths
Message-ID: <YogEf3WTYNBnBvP1@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oLFLRu3PUKKUU79V"
Content-Disposition: inline
In-Reply-To: <CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--oLFLRu3PUKKUU79V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 11:14:15AM +0800, Lei Yu wrote:
=20
> If mapper could not guarantee the stable result, the service calling
> mapper will have to add more complex logic to make sure it gets the
> "full and correct" result.

The issue here is around causality.  There really isn't any way to
correctly kick this logic out to applications no matter how complex you
make the implementation.

The original mapper implementation was causally ordered but this was
lost in the conversion to C/C++.  We should look at getting back to
having mapper give causal order guarantees.

--=20
Patrick Williams

--oLFLRu3PUKKUU79V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKIBH4ACgkQqwNHzC0A
wRmzrA//ctd1zYQpabGoCNoxUtuAr0i3OeDp9I1VtsUgkKhAARA3LnG2XG7X83R6
hUCaH3AAdHFFK1LZtlpwPSk4GAJvscPeN5gPy5xbr6Y6XQdogxQImt8Hhz9Nq/q8
Xx6if8Om9Di+yIj/ILOQjOYbFEnu2JvBj2TvobNqUom07OufZjMa0MW4wFryBaRB
zZCUZ8v7OvozBj83YtBAysZ4jgF+87PYt71B46YK+KNGUecLxsUkzm3exgsstJmk
Rp+vD7d5SGlj97rLJf+vSdT+NUQVa9CaA+6juvN6Wvgyz574RlKBvdl3TfjeSLQ0
YhzcaCcitAMbB49p0PiHA5VUF3Qfcw6E8fRVs/TA0DDzM0kJR5DVmkPKhBavakWj
QNYDEcIOlR05+VlRwDZq7howbKv9R2et9RIVL8uX5g8b/sl52YuOmfGe0BpbHg4B
etxKS83j+K/ubn34RIZrJ9owu/UNtWtefo4BisUOxF1FxffuRlwnxWpcMtWwtbYd
O3dg0ESVlugdfPRita2T5CxjvzgBzEkvP1O8g2pMp3CFUQEgRXp/jhgco71UJJCU
kKULhxk0+l9ozwZ80bMjblZspRXthol6gyqhVGJaB1iUMq8iGZZgWgMZFnSCS5GB
q1m3olJrZNd8iLJGsEX2Ha2LATfQ0WTbOIOudKniQwTX3YU7qn0=
=eYj9
-----END PGP SIGNATURE-----

--oLFLRu3PUKKUU79V--
