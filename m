Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B336FB7A
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 15:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWtWT6C8rz301N
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 23:29:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=wJz/2gRH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Kk31iWPJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=wJz/2gRH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Kk31iWPJ; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWtWB02nnz2yhf
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 23:29:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 344825C009C;
 Fri, 30 Apr 2021 09:29:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 30 Apr 2021 09:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=gjBF3DXkYOrKjCWB/MvUbBrkYDm
 A01dLMjFI7iHnSWU=; b=wJz/2gRHzM0dx9PDO48alpO9vvWA5ySdedJDGhkpIMr
 JlVspGbax4X6LcGfUpalT/l1DdGzEsy/bBU/2Z7bM1Mu2QQ8T1lI9cI8Amw8rOPy
 mXCvSrMV3IHtR7ezZjPhJQBthWHGVuOjT1i1HztWeTloeBP6y50QwJRAN2UYLLxW
 Ls/+dtRnXgTMN748ITHUVs3sPScwTSKvSYKFrmi774YRMZcwwquEY6wC5GHZstgb
 Kt2LEU6kX6TRGybOUdPmj0EzrbnAjLvFhSaryZEW0QAekRkoJDMTSlF4wGUj2jZ/
 yUxOxY5Np/+fEGIZA1Pi2i4qfbRsFqYbnszijXEhvYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gjBF3D
 XkYOrKjCWB/MvUbBrkYDmA01dLMjFI7iHnSWU=; b=Kk31iWPJ7ahnzGWY2p5ueJ
 c5pV9rWfGQdjrPF91lne1qa2ZcY6MInhCf3JjrkzqGgUNGiIbk15WmC2hzeSo0L5
 kwFVwWpJWJEr+XZQmU1Ypd7XXkHdT1hg1vL6m3zuNWMmIsLg18ziT66aSB7mJlti
 ItSVHP3C/dPCijnssvveQ8Dm+T4fF2XEa3gUuuocZW7+XnwbA7d8ZLTqihT3Ig0k
 5lBxdS/k747GL2+m1Dba1LpITNtfh2S0o4+wIiF1/b0DP7Gi0me/CNw3eribyMi5
 hvIh3qzMzJB5m1Mjf1dszoXSJrGXJOwQXNG6aVlqXjERX6ZOn/erLBZGYMa87UHA
 ==
X-ME-Sender: <xms:HgaMYPoZKEuQCeXPiFUDl8BgvBa8p-suLcnYWv13ZHX6JlHMdubETw>
 <xme:HgaMYJrH1w2dEzczvYYGxchGGWX-FFoGOTPs_6V-8nci3qme6O0lyQn0ZkSX7roXG
 f7hFUHwsXgAgezqDWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:HgaMYMOwjEeAHXbBSe9w1SeGUsnkBgQxKHmOjBjxAICnkA9sUyY6IA>
 <xmx:HgaMYC7hXTCWyapZE9Ufe51H8yoJu3F3UMTpmwPO2LcQD4P3y_66KA>
 <xmx:HgaMYO7486b-NJyX9y_4CzuRkth66MjG8i8AyWE6DutjcK4Ekl2qKg>
 <xmx:IAaMYDgDaGwaCpFswIPJtMR7Oign19XsOzzt8ECsRIZY3oyyI6IqoA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 09:29:02 -0400 (EDT)
Date: Fri, 30 Apr 2021 08:29:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Request new repo for IBM-specific code
Message-ID: <YIwGHYc11MZ6Dxz7@heinlein>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
 <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZM3GR5fxr5p9u5QA"
Content-Disposition: inline
In-Reply-To: <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ZM3GR5fxr5p9u5QA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 04:09:58PM -0500, Joseph Reynolds wrote:
=20
> So ... does the GitHub OpenBMC organization host vendor specific repos=20
> (perhaps github.com/openbmc/ibm-misc), or does the source code go=20
> somewhere else (such as IBM's public fork in=20
> github.com/ibm-openbmc/pam-ibm-acf)?

I'm strongly opposed to dumping-ground repositories like
"<company>-misc".  We approved exactly one of those and the rationale we
were given was they had a bunch of existing code they were going to work
at getting upstreamed, but wanted a place to be able to interact with
their vendors in the interrim.  We should not be having *new* code going
into that or any other "misc" repository.

We have generally not wanted OpenBMC-oriented code in non-openbmc-org
repositories that are then picked up by openbmc/openbmc recipes.  If you
have a generally applicable library that isn't tied to openbmc in any
way, or especially one that already has good usage outside of openbmc,
then another github org seems reasonable.  That isn't what you have
here.

It sounds like you have a good definition here of what you want to do,
so I'm fine with `openbmc/pam-ibm-acf`.  I don't see any reason we
cannot host `openbmc/<company>-<feature>` repositories for things which
are company specific, as long as those repositories are only picked up
by your meta-<company> layer.

[[=20
   I think is / will be additional work going on in the background to
   come to better consensus and document any rules around repository
   creation.  This is my current opinion.
]]

--=20
Patrick Williams

--ZM3GR5fxr5p9u5QA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCMBhsACgkQqwNHzC0A
wRn61w//Ql9TtWKCd2rEmucvhPO+6L6wdLTCa+bi9c928uDisDk4FtzZeADzWFTG
JyQ7SG46zJrnkwTAZT0lzL/2IxfvOZXJfLV/bDIpcBUzXEiIvXOgAl83NyFHGVI8
AtNf/tDm1nM80xCpomDDfaRsU7uGRz/R2wLduZNbTJfnTsZsc5+8/AStnXdg5SSy
s27iP4E8gyZvt5XnCvBUzvK8PbFjJXioXzePZDwyOknHJp+PGV3D2wXbY+I1/no4
7XVhW4xWKNIUiIwqOlGxXsptmQCRVWfYWHIPzAiC7qSUIJkXWKpZ2AM+S8Zv35Kt
HkhzhfUX08iPkDCZct3wAzNuXSKxSnl0yhhLniuGYl+/gpbxswq0R+hF19ccbAt2
svjN+XpFYD8IWv3fesWT+s5Au2y6MYCiwWEtvCw8pUbZ/mHkes8EhcuBaBlcQGZk
8oGDEaqMLoCDbj5324w4AyxJSBeeKt18RBU3YLM5dW70k1ydE0zQpaDQk06uTRBm
pbaK/jamHsr2M8yWGZkb/j5PGuUTXAL+sJHnIugIdQ4EzdXw8jCftfFAK5wDPlnv
m9FMFMCQN2YdmQlzEPuc0/X7sM5hq0j5GiudZOd/MjLqu3OFlo2zRpfuPhJ+RI/f
zdBeQYiivqO0qpdYqu34zGGUJdwDgBIH0WDtrMsQU8Wbbzt6W3Q=
=0EYW
-----END PGP SIGNATURE-----

--ZM3GR5fxr5p9u5QA--
