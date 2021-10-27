Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 220DC43D605
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 23:46:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfj280FgLz3bmx
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 08:46:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=buh8cyCo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=N48eE68x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=buh8cyCo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=N48eE68x; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfj1d3vVRz3bWq
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 08:46:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F2085C008F;
 Wed, 27 Oct 2021 17:46:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 17:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=d7bOf7Wth91GQpQloAfVUGAAl48
 GegLgMNWZcyu95Ig=; b=buh8cyCodV9L0Jr3/FV/lfcygk6s6Cz2y/1fRIzLdka
 k+HJH7P/4MGIDmeqgh1BFnR211kFu4NVdP6v0bdWLLbeNo71i8U/qEb6miSRsyXH
 lC7efON/ivBxWbCRTrzWleuQWd2D9LSm0E0TrhznsOU1EPvuRbaE68SK1BrURLDU
 6kqYD36PoUA2c2XqMqYPYyts6IpMeSn19uEID6ZBuJzQzLAxpU92ayQkI6EZ1CeA
 NMoI6poAP8V62CKvn3TQUB20t4U9o/8S3rQMNRTQInAhDkChpHA8QYsiou3OORLm
 J76NOLB+6DXy+1XDbdRhxHXdusHznRI3rsSxoMcFbdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=d7bOf7
 Wth91GQpQloAfVUGAAl48GegLgMNWZcyu95Ig=; b=N48eE68xl+Ew4V2vbPx+Cu
 hkokb/bFylZy29su4laciau7brFf+cjvqZdpq6y9tISwDd2SL1s7BTxm3ga2ZP5U
 K807OYJPRXE5GTjNdoB3iBUT4vqoEGMuTjIXXwrA7hebaQSSBk71INrKy670FRjJ
 5vywvdR77YktpXE3wt1y6gofE/Cs0bW9Eoky5NoVBoCukMoGzxvL9auiiQgClKkU
 zw7Cc7gEfujADqvKlvbsl5pXviKb33VxSWhiFk+ntMBevB29QrrALV1Be5kDDn88
 0znQIkuxk5GlbnBw1Ae+qveXbGeV4GQOUs7dLqRzPP6hNrXMVKWGOjbcCUCPyUUw
 ==
X-ME-Sender: <xms:oMh5YQAquRTVykaFog8Uh9L-RkP6uS2agpZ6nprbiND5Zcnr-TznPg>
 <xme:oMh5YSj-iC7AhzH5LGAppvGN6fjPWxDjb0a0F1L_ROGxSuzktSe3FV79gqRIi6WsK
 HkVGuo-6lqdzw7o_ck>
X-ME-Received: <xmr:oMh5YTl_7NgiXH77tZ-wkv_qnpoH3_uQE0_KWvfCEerJdChGGZHMzUk9O-AOEkTiTPDN8AaW1B_37-JVsx_APd2HqHQBe6LYxJR7QsDZUlohhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:oMh5YWzNbtL-IQRuzrqvIdMt33l8X2-plOySlrqkvzUlISazzv672w>
 <xmx:oMh5YVRDkGkCX79rFBNt3QqvEFJZ6Zir_EqMW7w_YzpBwl1RvIdAEA>
 <xmx:oMh5YRa_QPl1oK1MBb8Pm1XCyLBm0xPyqCOrVVbtZCx4qgMXZNbNhA>
 <xmx:och5YW7qCswBeDP3UL8R2eLhpiTnIt62L2G_vu9HuAQvtTbl_krG7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 17:46:08 -0400 (EDT)
Date: Wed, 27 Oct 2021 16:46:07 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group - Wednesday October 27 - results
Message-ID: <YXnInyPT3dDck0Mg@heinlein>
References: <d0b57999-f452-5239-ccd1-3823fc551a30@linux.ibm.com>
 <58aa5187-9b0a-7c65-f058-79f749287bb1@linux.ibm.com>
 <YXm3KZ34arM0avFK@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HNOUvCOXjUzYmaLA"
Content-Disposition: inline
In-Reply-To: <YXm3KZ34arM0avFK@heinlein>
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


--HNOUvCOXjUzYmaLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 03:31:37PM -0500, Patrick Williams wrote:
> On Wed, Oct 27, 2021 at 02:11:15PM -0500, Joseph Reynolds wrote:
> > On 10/26/21 8:12 AM, Joseph Reynolds wrote:
> =20
> > 1 FYA: Changing the os-release BUILD_ID back to its default value of=20
=2E..
> > DISCUSSION:
> >=20
> > This was resolved: the project defaults are not being changed.
>=20
> Can we get some more details on this decision and a reply to the original=
 ML
> post?  It seemed like almost everyone was on-board with the initial propo=
sal and
> then a separate meeting with limited minutes was held which came to a dif=
ferent
> conclusion.  This is out of sync.

I missed Adriana's follow up and thus I also misunderstood what you wrote h=
ere.
I think what you intended (please correct me) to communicate was:

    "It appears that the direction of this is now to not make the change, so
    there is nothing for us to discuss."

> I don't understand how "deterministic builds" is directly related to secu=
rity
> and I'd be immensely surprised if you could actually, today, build two im=
ages
> from the exact same git commit and end up with a byte-wise identical buil=
d as
> it is.

I still stand by this part.  Can someone educate me on how deterministic bu=
ilds
is related to security?  And, are deterministic builds already a stated sec=
urity
goal for us?

> If someone seriously wants a reproducible build on their system they can =
easily
> override this BUILD_ID value but it seems odd to me that:
>=20
>     1. We would choose to purposefully deviate from what upstream Yocto d=
oes.
>     2. We would punt on the usability issue that originally pushed us down
>        pursuing any change here.

I'll move this to the original thread.


--=20
Patrick Williams

--HNOUvCOXjUzYmaLA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF5yJ0ACgkQqwNHzC0A
wRmABg//dtRVqeno5G8DORqiisEvXdw6FtlUVWK8PpBavpfcMzMHtXAUDA5SsZrQ
WqojR4ufnH6iHB8t6sGxtW720cqdr3nJ+CQajC3+jghQhuyiecPOjC2FoNlNS6Kr
/3iaCsZYRkLJqY1ZAGZfCKrGSrRxS8FWLfWatljyo6LRKKe3nyit3vgNk2lzhFNK
n9rbqeZIxydfZBeHtRzoD7akby4eZi4wVlKvzlrYneC8h6u6Dwa75dfrPtowlvOr
RjlyRqLh6wSn3eA+TljeM9n3fVy7qpzb0IXaQZTgb/XTcF79PtdFVJJUsMR1RPnZ
+p0hp+nLNbUbTi5NjwhmaXxBbFzgqxYjl8aRs8BioJLz8RAISM4W1TNY21FGkqjk
/+axn5anP1YoQVK8TAa3pU0ZB+OSrQLUpd24oR1xVJAO+7fMJgu/+x6BcikMwSj8
t0kH5UvKRlW6bEKg+lI8NZh8TGO5oOhfftSYesUiRudG8xni/NRcobKeyJKJRMnt
Zu0WQaxCxubRAJYJ4N6T9FC0ATkb9rDMWD1wKGM8Pw3nQdQz+gjSNQsYBu3hs1/r
533lqxEU9HbhlyvziM7rjIxly/ElrbMnuTdyHPvmPb3ZyAzA0jw/rnDMGKhz086X
Qca37MlLnk5WJBSw96kkDXacmxp+4XyhXd3cMTM1NFTCRGrhkH4=
=pOL7
-----END PGP SIGNATURE-----

--HNOUvCOXjUzYmaLA--
