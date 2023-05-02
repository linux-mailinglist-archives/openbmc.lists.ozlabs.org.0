Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90A6F4AA4
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 21:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9rQ71ftBz3cM1
	for <lists+openbmc@lfdr.de>; Wed,  3 May 2023 05:54:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=A0+CzMGu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QauKKdd3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=A0+CzMGu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QauKKdd3;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9rPT0y1Tz3bkM
	for <openbmc@lists.ozlabs.org>; Wed,  3 May 2023 05:54:03 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id F225332009C1;
	Tue,  2 May 2023 15:53:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 02 May 2023 15:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683057239; x=1683143639; bh=5Y
	37jVyHZC+ifQGdEjH98huJ0uP8U3HdOuHPXBl+1to=; b=A0+CzMGub6R0sNxX0/
	lGpifCd1zshk4h59NmZNDp6FL1jB5j45F30gxESZRdGxoNSdo9khZp7Ql3dUGkyB
	OS3TihlDnLMeJynZHFQXdc8LLKK4q/dhX4B6QZevo1tazwQztS9SHCIcO54Qhq8t
	Yxx2b7biqQthEg43AuNcyNht6nZ2vYq0Qzn9KI0P5Vctsnn3U90iNJUQGlUsOvuw
	vuIa0Sggh+BuN8GuSWWO0hqy2BjewDD1JUk/rufAN+0wVr0OoM8uqlD9D/zeMvr1
	ft0TN9kBaa41sYSy8NU8myqbbyXUQv317xsC33GGITVRt3fOGwNrymm5Q0xwldvr
	6kyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683057239; x=1683143639; bh=5Y37jVyHZC+if
	QGdEjH98huJ0uP8U3HdOuHPXBl+1to=; b=QauKKdd3/8zsFy9XQUzvfQb5N+wJB
	LgNlgsa5mwIxTsyyf36x/URI2YlpzV0T2o1wY9jRqsqWlmkkMLSZY3g2aILttKAU
	0OQc02z+K5ZGPNpnpAK5uSJiRdjd0hfwaYsvvVxNFhLHYtCnwkOKuqs/8AV06EwG
	LNQiADB7MpE7GHEufWqGFClANki7BXRuYJNQyR9VsnjFQdB5lc5u9ByZIi+lz86W
	V5QdxhPcLoE2aeCWTluDe5uL4oG3tJWb0Zw5Y5ACsEC9KFFY6FTvxr4rXsw72Aag
	Vtc5wHv8o+Hy4P53DYxGZOPGUv2pkUfhPOYGsDaEwNom5ngDURtWP2XJg==
X-ME-Sender: <xms:V2pRZNQeL3Re8THluZRe0WPlyBTcE1g_fOqjNJEUIqxs-gYtlIdcjQ>
    <xme:V2pRZGy0KFn6OIceL52dvhL-SFJPJroerWaFNoJoR0EFPkzbKHZf6vhHoe7vYBTG7
    orFz2ktOnRHy2IJhlE>
X-ME-Received: <xmr:V2pRZC0yXnv_yNq_6tBr6rRdI0oX6lMt0r38oS4uAWcBZWVkjbOFBLyOMFPP7ymCcN7HGJi70v6C_GddwTEHeeuCSVChW4GCrlc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedviedgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeeiveeuudefvdegteelkeek
    hfejgfeiieelhfdtgedvheekffekuddvhfffhfehnecuffhomhgrihhnpehophgvnhgsmh
    gtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:V2pRZFA3j7REwu1JCkjgjCos81iP6UJlUpOq5Sy7-d1FPa_Mr9knkw>
    <xmx:V2pRZGgxsCaRx-a6c9GmjFlPVm8Ek4aGsKVMF1LLW1XhnxiOtPCNog>
    <xmx:V2pRZJoVLwJUkX3OhzwfGbGCJCII6ecrdZ7DCSoE_HZC2snoTo2AIw>
    <xmx:V2pRZOKHHMSkigW0HFax7cA-_WV2oWCelyY-9Xxj1dvoIgvX9W5lMg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 May 2023 15:53:59 -0400 (EDT)
Date: Tue, 2 May 2023 14:53:58 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: libpam 1.5.2 update
Message-ID: <ZFFqVqYnr0VfpB-2@heinlein.vulture-banana.ts.net>
References: <8b8a6d99-ae3b-499d-0f77-95bb619b1a0e@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zfn+pO8Du9cJaG9f"
Content-Disposition: inline
In-Reply-To: <8b8a6d99-ae3b-499d-0f77-95bb619b1a0e@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Zfn+pO8Du9cJaG9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 05:55:39PM -0600, Bills, Jason M wrote:
> Hi All,
>=20
> I have pushed a change to update libpam to 1.5.2:=20
> https://gerrit.openbmc.org/c/openbmc/openbmc/+/41357.
>=20
> This update deprecates both pam_tally2 and pam_cracklib and replaces=20
> them with pam_faillock and pam_pwquality, respectively.
>=20
> Please review and test if you have any customizations around the=20
> deprecated modules.
>=20
> I did my best to convert existing code that I found related to=20
> pam_cracklib over to pam_pwquality.

Thanks much for picking this up Jason!  It's been a while we've been
hanging on to an old version of PAM.

--=20
Patrick Williams

--Zfn+pO8Du9cJaG9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRRalQACgkQqwNHzC0A
wRluHxAAqEgCvIFs1bPZRmhedfWCFahXuz6DWsPhXCqhmhGdQyz+VtYmCcg2qWo+
bKOHWDuyXH7tZKpvrx453FwTXfjMeTwbqIL4B7e3/RezNDApW3lyr8Dwmf1OFjt4
fSGTWu4b452ShXZ0M7ju2ekFW3S8ci/e6cjtlpqNjhLWk53OLkWE6PUmTMlrXqGO
LSRAdn/ZGVrx/tAuKqiKq6RGVRnTSi4vr3fCAHIKmJUrtl32kOJUqF/uQa7EYmUF
PZRMCe0haInO9C1FhVfE5ZxFmVwzpVQ2DeTFO7mI8M2UOoaps05A6mp06gXl591E
85X72FGwshsQCVlPKek+G8AJ6t1RFguzwuytzddA/izlMrX7Hm/16x2c5C9UWuB1
VO2BnycJQvGs8EO6MjUmms/OprllBwf3JZuFGMIfZl7QCjjajfOhvG6004ytsGWA
z4nWsquhwQRj5ZUTROVk+G5KcBeNIVWifQTEo4O/Sp0rKi4v+VtdJvp30Xb6l0jo
7Pzu3+uUgxisYfZLSpaIJKh4dSxs2Qqx4uCqH1g+/4HjUY/UA6IJK3iaf5ILw24b
gyxGeRP2kMKk/nHMc1Mjvq6CR0eWSmqOFvamh1wfULxPX6sD2yh6uGFY+9NpKe+3
2W4IQbL+XNeG+U7NHs7Hb/fGqwRQ3fG8PoO8X77WDrcYi3vzWn0=
=K04s
-----END PGP SIGNATURE-----

--Zfn+pO8Du9cJaG9f--
