Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5E4847D3
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 19:26:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT1KZ6m0Vz2yPL
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 05:26:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=P1GGDR1P;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IeLRfKAi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=P1GGDR1P; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=IeLRfKAi; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT1KB0VCjz2x9P
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 05:26:21 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2F4415C0252;
 Tue,  4 Jan 2022 13:26:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 Jan 2022 13:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6B/z5IHY6viGvNLw1ZeyhGpptFR
 hXUYHdqIgd7eT3Yo=; b=P1GGDR1Ps1qDg0ZL2Wjl35HvBA3AAX96Sb2sKmBOVk6
 5E7vdEE9yxqIlWk6iKVx2ogMJgqrv+jOK3T/bbQ+WwbsPl4zCNzgwd1CF08lrImP
 qkUzI8LzvISD5k0ahE1fNmMmengLbSVHGvqa2Keoq2xqdOs3L8/D42IkgE0+sErf
 SsHvB1/82bYhWEzW5tvm2p2xWreKgov/Fs6mUfaEwxndeVGeu+maGxyaKwxMgz8S
 EsQ6SjJbXFkja1MVLOrk3jYQ2L0Pm6r462FN89CKiPmM0GBhBk8T655UfZyb3Mig
 YEgcI6qFCE2mpEIaB6YynBRA3xFBqh2pEER7fUnS1+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6B/z5I
 HY6viGvNLw1ZeyhGpptFRhXUYHdqIgd7eT3Yo=; b=IeLRfKAinZw7n6rVIH3ZPr
 8jPAlTX0zG5IZcK2JF2EblvOw2eJuEg3plVEBgN6jMW5NODWzkgLvVxPvUnZuK1Q
 J5iaIw/eVqXH6OP0go4jkvni0Cl7coRI2cGee55ZFDLlxsBuslehNSv8eilq6kDa
 zwgf8SyFmAD2xH1dDsTEpSBD0xN0mtGihlwQqKHAt1yx9OatAmHF+BZrmYSSZKHh
 P1hVPgNmeSWz4MkFle+umZkKzk6b0oUjk/xeRzgCR6G6SKl3uFwJM/bgOw52dQ8V
 jBfwzJIF2KSduGs5MGvGcKFb2MIWoqJufhmWdb0qQniFrWFxniEcwwWt070ElTjw
 ==
X-ME-Sender: <xms:SpHUYY-s-P2SG5MCgUskDsrREbWBRf_8ccjSIWojauNd6yoEC7_Qpw>
 <xme:SpHUYQsPtOtLAiRfVd4P6Hq-GnzEn1JOJ6qFNzsCR-ReAw_rF7_v9juOUhhjNawhO
 AO6ftPdlkI8ojvPx_k>
X-ME-Received: <xmr:SpHUYeChsoDpIcuotK1d-_ASX7B5aNWnaKTiAM665whUIPisxPrAv6jb2bS2z2KbcupdsHHHzCDmGboW_RQ9US4TOV4hrmJn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:SpHUYYeY4QhvCUrFwZkJhXojHZPbfb5Ph8mn48WytPtlC2uDwbyRLw>
 <xmx:SpHUYdP_zmFtKoHrxhTrtBkLLgWlxIGHuaLMehbAS5p4RBrOYkHVGQ>
 <xmx:SpHUYSkbZfCEN2dEFqvrlivoKT7Hp-rAPwdpvrbjoDQTOIABwKb5zA>
 <xmx:S5HUYfUaPjc2tiejnWinrq76Qg39cXKoAmtAxmU3ufY4Lb3hrSH6oQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jan 2022 13:26:18 -0500 (EST)
Date: Tue, 4 Jan 2022 12:26:17 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: meta-phosphor: enable `allow-root-login`?
Message-ID: <YdSRSUhGYWj58YJb@heinlein>
References: <Yc25imp2cCDpyXNt@heinlein>
 <af0e61cd-283d-1ba6-c426-5648c53c4915@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QrsFDZp3RKdnDa37"
Content-Disposition: inline
In-Reply-To: <af0e61cd-283d-1ba6-c426-5648c53c4915@intel.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--QrsFDZp3RKdnDa37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 04, 2022 at 07:32:06AM -0800, Johnathan Mantey wrote:
> Patrick....
>=20
> On 12/30/21 05:52, Patrick Williams wrote:

> > I am currently enabling this IMAGE_FEATURE in meta-facebook to avoid ha=
ving this
> > happen again.  Is there any reason why we wouldn't want to enable it by=
 default
> > in meta-phosphor?  There isn't really full support for non-root users i=
n the
> > base systems anyhow, so is there anyone that wouldn't want "allow-root-=
login"
> > enabled by default?
>=20
> Intel explicitly requires root login to be disabled for production=20
> releases. Especially since the default password is a known quantity.
>=20
> The Intel security audit group enforced blocking a default user for the=
=20
> S2600 WF/BNP/STP series of servers. All user accounts are created using=
=20
> local IPMI commands.

Is this currently able to be done with all upstream functionality or someth=
ing
that only works in your own forks?

> Intel will prefer the existing behavior remain.

It seems to me that the current behavior is broken for typical cases using
currently upstreamed functionality and so that's why I'm suggesting that
meta-phosphor be "fixed".  It'd be pretty easy to IMAGE_FEATURE:remove this
for meta-intel-bmc, right?

--=20
Patrick Williams

--QrsFDZp3RKdnDa37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHUkUkACgkQqwNHzC0A
wRmouQ//e+jVI/RGN1i+Ucb2vKCkUYr5HT5sOf6pSiG52S2Obk3d2fYTPbP3XBQA
ydjk/+EY/h1gBaV2Hd382HkZbtkRqugo6VH6wPpFyRUP1i9+i5cnkb5rdiRJ8on6
5cMgQ30Ufik1ywz17vGJgJvthUpPn8/6HCBa8Snp0mCUHEd+EPxj1aLiogciqj6S
tQC1ZoUNkaKm9XQdMQRCRoTVv6KHCKxyUaXKqbT5c7UDXrGF2UNQev+XPhkDL5pS
JBsyXy5Za4qtfmGYQRSfwb+p+QNspNveeYsgA1qnCgEp2LIkW07zN9YW9MB5nWi6
8TPjTWnaWUMF0y5Mi8HxE7Edq2qIcycjTJmJC7ddvDfehnJ2lFBJtH5t9T8zFxcC
FZ7lzNn8Ty6Cah1xvyulrxpPfnzHrnHJdck0FPe5/3nExiCsrBUdFoxZ05UEBOnw
NXFeXIRHKcscv4i2j/B4PrJ+isWWxPQBtpMkvRpWDUukFtBkRe7WKr0u8jE/cVfM
5CToP7BsVixpmmn/s8P9eL35hw8a+oMTMAk9Lg1ZCc+Rq+glxMyc9D6YcSsCMIvy
i4ym8NUK39AtJLPAB7z4AJVsuaDe6/ysb7Br8KbvkvAVNIZK23NB8EgBKadVXeCg
7zrB4gdFwltfeRctRfIBjABluNLVdSUaO1Hl66lNM9duZzQ4VT8=
=4eti
-----END PGP SIGNATURE-----

--QrsFDZp3RKdnDa37--
