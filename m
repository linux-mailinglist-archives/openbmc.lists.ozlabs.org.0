Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF068EFE9
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 14:37:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBgys0w1kz3f48
	for <lists+openbmc@lfdr.de>; Thu,  9 Feb 2023 00:37:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=dR/jdT8m;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ftBvLlqR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=dR/jdT8m;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ftBvLlqR;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBgxz2Zhhz3f48
	for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2023 00:36:22 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AF7715C028D;
	Wed,  8 Feb 2023 08:36:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 08 Feb 2023 08:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1675863378; x=1675949778; bh=yYabOGhMrf
	XmA0drNF3BSEEy49d/Q6U2V73iz8vycf0=; b=dR/jdT8mgmI5Sq7j0POU9J9QMQ
	GWTf4nQudxAarQIiZDRJr/TIdXFjrfF6SlANj16s+190gRDGQQFvnSl4+ouh2tfY
	P0FYopBRS8qBP8MZTiwU51e62d7NQydZzVDJCgdcKBb/gOCaABxiIjAZOl3Xgkx7
	IVpnUmzqAd6WOvoEcKGwt0kEiw+YrwZ9cu3vQOgiJfC+kyzTYlxodwNxxeLDbOHv
	ewF2qvZKajYjaJf9zFkCnA571UAm8RAsBR59OxzBwG60HqC6YK7ADut1vBFE3MP3
	V1EyfCOYS+cZmnGH62BbyoHA3MxDQumBeGGQ7q1f3ocCerCi3FOZCBzEZ5Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675863378; x=1675949778; bh=yYabOGhMrfXmA0drNF3BSEEy49d/
	Q6U2V73iz8vycf0=; b=ftBvLlqR79/g2yQ90ps29qNHnZl3A5lIhOIAIoZ39rxa
	7TyBq6Qr8+TEXqf3GaqXH8Bp8HvwhJ4NBH/5aFfhhLlJd7Z7khx/7uCxewNQyhI+
	qh/z0VqNnuvqHrlKbi1zncchsQoUNJrQ1qMSwOXced5ODOZoA0ZFURtMkOrHQEId
	G9ls5ZUM4U7sl3yZFhc0C7x31vFllT8ZAyaYI12VZB4fEP7ruREhoX0xzcmEZBsi
	IEDSwR2C23lQdU+w9yHN3tnB4GDFegxZtD6bWurZmIicoUkzeJGyuvCm0bdUwfJ/
	RRTNpE3rrXFBKcXsv8La1gIvu2StUrmeKWu5QMcfdA==
X-ME-Sender: <xms:UqXjY2W7dUDLeAvU1nMbCL-pBCbzjSqN2KU4IjfMvr31n8sckg4meA>
    <xme:UqXjYymkj9cmYamQsLr3FbjC2UtOMYJ-_AqIbVJ64SuFdZbJ-36ED4yGL9H8n21zx
    vUvsaJ_LJvritdqSj0>
X-ME-Received: <xmr:UqXjY6YT0rAH1SliIPlYerFGU4Ty2cvnzheKQi4GbfKotnY5EpwxK8G_8T7d7VmlcmNc8UO5XCa0Sj-NOVYTXB7nu4lVbWuO_5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehtddgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:UqXjY9XtBF1IwGZfJZPx5o28CacTUD3SR2iEKzESfQg0We_ZCIPGog>
    <xmx:UqXjYwlmZjuMpSuq6pu_5wuQmEVG4gcRsQD1H1U5NVNpl7rH5JcVPA>
    <xmx:UqXjYyckeKlTGCBPBz8LkN56SictRZDgdcVZWLJoRSYTZhe0JrOFCQ>
    <xmx:UqXjY3u_k140LtX8lSmZx_vZTRVRYykrUyfpKezU2DQKXkSWo0kfog>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 08:36:18 -0500 (EST)
Date: Wed, 8 Feb 2023 07:36:16 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Sandeep Kumar <sandeep.pkumar@tcs.com>
Subject: Re: OpenBmc support for RISC V
Message-ID: <Y+OlUJkSPwRev1sC@heinlein.taila677.ts.net>
References: <MA1PR01MB41298C4DDD52B649014A599F87D89@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y5jHJnh3NLMp1Hik"
Content-Disposition: inline
In-Reply-To: <MA1PR01MB41298C4DDD52B649014A599F87D89@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
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


--Y5jHJnh3NLMp1Hik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 05:42:44AM +0000, Sandeep Kumar wrote:
> Is there a support for RISC V systems for building openBMC ? I don't see =
any specific layer for RISC V in the OpenBmc stack.

Are you asking to:

1) Build on a RISC-V build host.
2) Manage a RISC-V based server.
3) Run OpenBMC on a RISC-V based BMC.

So far I'm not aware of any of those being attempted.  I don't see any
of them as being especially difficult.

--=20
Patrick Williams

--Y5jHJnh3NLMp1Hik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPjpU4ACgkQqwNHzC0A
wRmWag//WD/nn9fwFlF8dChcEj3deTsj01HPMEYeZ8jAArSgbLNJfsIBQb5BXLYX
6gGViXsn4IAh0Q7H3DnXcvIb4XbuS1i0PCS3gfN+OH6ixyMh6k/Pjk/p2ryPIy0N
iu8gRhhttHQfHUJdBBTQEEWfCdZM20uxOWxr82OQLN+t4njVXPYQXW9cQD5xDoAp
JG0aSXZCecuwI7vkYhQbI5VWbPCp0JK/xX1fjGQm1+E5c3vvGAR1VbNv0UDd7exx
pBgpnY+9YqKup+5f0yk/MxSaupeVwzsSw+rQP+ZUUtYJH5jI7wYpxwck8BYQcS+p
vAwnRBjShEJ+rXGPlRp27FeRMdhGmj43Qfc2yVNlsKILWRLtEYKTZjhE0dhU3QII
7cWQJdBO9YPBZ3pbLc8mWc0gjq0wQ3NkbmI5WGoKxl1i+NhmBa8RjNgrgyjV06kQ
MoutYhWC7rKzo6Ibmzei4gU/cd+osayPa6O67amJfodNs02jKP2KrnkIjZd4WPy8
ssjWhSrXIN+PBlF9UcEtVJxEbe4/8CVxFhrOqfzScvoTbK5P4XWP3wsLL7zzn0kx
4gHqOcVE/2H1JJEXg6qyvvWcHDWLh1Zf0O834FUm4AZP0kteH6xDFOY7YiJuBEea
bfD5NmMNzIXNtdTZquqD2G4jtU6kWspF2qgXiHp3dygUOk7Vskc=
=JRu3
-----END PGP SIGNATURE-----

--Y5jHJnh3NLMp1Hik--
