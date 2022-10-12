Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE05FCD53
	for <lists+openbmc@lfdr.de>; Wed, 12 Oct 2022 23:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mnm8J0gkDz307b
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 08:32:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=G5R1frtK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FQST/m7J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=G5R1frtK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FQST/m7J;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mnm7g4CFjz2yMk
	for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2022 08:31:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C7EF25C0096;
	Wed, 12 Oct 2022 17:31:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 12 Oct 2022 17:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1665610316; x=1665696716; bh=urAtA4VFMr
	03YFlK+61ReZ7pOTtV36WgxGB6/al7fIw=; b=G5R1frtKhnAT+6dJZL8p+4yacx
	hT5FJd2kRrJqYKsl5mOuwZKkDPcjuKASrOMLXJ1eL7TEFAUyVyRTdlspoATFMkzd
	4B0AkTpnBQO9KK21Gd9RvTQPNesW1yZpagWTkPxwJy0jLYYiKCY6BfcPQZgXzxeg
	owk0sOsgVPDKosYVHDCqxQ74aY1l2hCCo2CYGyGMUZLAPzp5foMNiv1EymcF9l98
	AUAbshNpbV4r2Fymbhd2X1ANv9LiSrareHfI1LKGHk5Dk3m1/+I5O+c6cl0Ui9YE
	REKNty/6eU5tHznYCuCHECyMZWBLLmyI0qbutk6lyibMX/d4dH1FVI635HGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665610316; x=1665696716; bh=urAtA4VFMr03YFlK+61ReZ7pOTtV
	36WgxGB6/al7fIw=; b=FQST/m7JZ6kMpLCZQskzKU9HTPafTMO2qChM7nuPuHT5
	kkoNoiMxcGs4dp0NLdBRsfBsBVKfQv6Mtew82ABVXgOm/3okklOTYK3srPe6nckz
	4A+VnRweeAx1RJrTKpZrGMviwQ0bKXvP+/8wGLKQD3QswvpDUZfPtlfBqWlQpe5k
	Y/QIWm4cjG37IKZIIUy8w+0thir5vP+GLYlM+nAr0m4FM3pX6qZkxVhkupg4jmUp
	Sq/ngLEIfIOiw747P5YPVbQTxGuWJNjYztyGPjP8b0ljNvn3A/T4hWTI/0HmJHnu
	Lb5EiFr2+Vyx1PSRAUq7fX3sob+WgHHAoTY63Dp/RA==
X-ME-Sender: <xms:TDJHY2dPMs7WlgwMEOBoFggCgvN8VbKAsgf7Fikkb7poizTwjWCaRg>
    <xme:TDJHYwN1rMtPc2ZliNhFFHhM1C2OroKtJyfjl3Q_xjexe4DGJzoUTb0ZPMnNKLnXM
    T8RLuzPvZe--256BjM>
X-ME-Received: <xmr:TDJHY3jcshlkGN9L1-we6fwG6pXC5ZXfiaxJxeyl32tsoqA5aAIQsmybW0GmWnH7p2Q9w1xFYlm5aqPBO1smwZoC39qqwsAK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgudeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdejjefgudeghfetvddugffh
    jeefjeefhffffeefleegudevjeellefffedvffelnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:TDJHYz8bvzad-LJxzXonkvdeujtr9X2T1glcsB56mjYDJ9ol2ohGPg>
    <xmx:TDJHYyv4MP6JELlApC4UXplBeoBEcrBD8LoooLHmsBM92d8oSel8WA>
    <xmx:TDJHY6HoWszPvuj_zGI0qgg7ajWZj5zxYkTw4cjgQK0SApADPsLNUw>
    <xmx:TDJHY40QovReVUo4mRKoQIFFZKRignG3kmsKsTgZdxVW9L7x2I0zAA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Oct 2022 17:31:56 -0400 (EDT)
Date: Wed, 12 Oct 2022 16:31:54 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday October 12 - results
Message-ID: <Y0cySugUHS4Sn5Nh@heinlein.stwcx.org.github.beta.tailscale.net>
References: <74f2b64b-9f53-d5a4-b616-510bd75664d5@linux.ibm.com>
 <0674aa19-5a96-5f3c-4861-ecc54ad030fc@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FNU2qkZq6TUq6VrO"
Content-Disposition: inline
In-Reply-To: <0674aa19-5a96-5f3c-4861-ecc54ad030fc@linux.ibm.com>
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


--FNU2qkZq6TUq6VrO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 12:35:12PM -0500, Joseph Reynolds wrote:
> On 10/12/22 9:15 AM, Joseph Reynolds wrote:
>=20
> Meeting held 2022-10-12:
> Attendees: alda, cengel74, Dick Wilkins, dsp, galmasi, Joseph Reynolds,=
=20
> Rob, russWilson, RuudHaring, skoteshwara, YutakaSugawara. 1 Ruud:=20
> Working gerrit reviews for SELinux and for measured boot.
> Wanted: branch in public repo to show progress for measured boot.
> Can we start code before the design is approved?=A0 Specifically, create =
a=20
> public fork?

We generally do not create branches for development work.  Typically if
there is code that spans repos people might use a gerrit-topic for it.

Is there expected to be changes to existing repositories and/or new
repositories needed for this work?  I was under the impression that it
is mostly recipes (and bbappends) in openbmc/openbmc.  I think as long
as this is disabled by a feature flag, we can even review and merge
recipes as the work is in progress.

--=20
Patrick Williams

--FNU2qkZq6TUq6VrO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNHMkgACgkQqwNHzC0A
wRkHtg//R9R8jCPS3Za3kCXpYp42hEDvJsp2uu45hmrzZPSSPcSTeuxQlS+gTgzt
NXcpEN1mz0PJZ6+QnEVTJbyTdZQsqsLqOXqppdG7kN/g594C7epWFQehHharxlB2
Q6gx4SZnOiPErmzWX03MWYLibekR5hYQ/Jmsc+gTuWCQIro765SdFnL3/GtZvYcB
AT8dwGBnTdJktODbHgvZg2E0zPSqqeB7EaASPdnfW7fDP52L1a4p4rKQUHyyyE4M
yZo/IcD//ncGfLoC7d4rsXQvy85gN8lzbaixtZ65ZhE3v+Xha6bcEAiBtKie/bXu
MY+/k1c4gkrEd2GPJ/2KPi4PX4D7J++lJMIoniMCMRC7gooR1Mrh2KI2h2pQ0Fy7
KadrAeWUrX+e6RsX2DcXttxiJXA8+IYDjfC2znR9Y3QU5rXfUAbqk3bTCGxlKL3D
7Lti3QDYAij8kPwvtbHDHNB0raNL58c7rNB21/PrviS7ctvPH5yIJXmsgPM3bkiY
GiAyWU4uJfcf0e87lHgMJs1Zn2PgUj+wioLp2lPbY8l8YO+8Xv3OosT1rnBUS/wx
Fda8KzTzcznjbqLxzaOO1xZocf1CmTdWSIKOxcQslohSQ3GVxFU6satpFTj2TMtt
K/MDwpGdKg/dOwOOl2lyBuOKG/bJY4aNrL9yywbzpQAdExHjLhY=
=QWTo
-----END PGP SIGNATURE-----

--FNU2qkZq6TUq6VrO--
