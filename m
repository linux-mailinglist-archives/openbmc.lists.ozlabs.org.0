Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB8A489D56
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 17:17:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXfBB2Mz8z2ywt
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 03:17:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=OeH4EZhn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BqgEblWI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=OeH4EZhn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BqgEblWI; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXf9h4yHCz2yMt
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 03:17:28 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D72CF3201DD2;
 Mon, 10 Jan 2022 11:17:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 Jan 2022 11:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=HwXEFN0meP4nhmxW6BQmIgCV6fg
 oJEUiAorTEgyokQU=; b=OeH4EZhnhzVYjabMMAmsKFboOcZi3vZP0xI9Wc++zgt
 QSwg7x0papvdc6+Pjif34Yd1WYkuBS4X5aMvhTQB+xdq8V5VU2vsP61LAondV90n
 hGEpUXp/xx6qKZlXGUVLtIBxvqZxfbjvIvQEgepkI3yc13XDHk7wwBNegLs9xE6K
 6+dHm24QtLJSOPCG3PYZS8u/UZWHJlskzMbwhf4mQRoVLtN2LGSLxynKRymfw/C3
 0k1oVPTI2TgIDauJlS91BcAnHj7w3eAd/3vOR5wbUT7p+xrYUJV6GUTtKU5rsn8a
 NV4d68zZhum50/s7Spp43frgO4oaL7ishz+ltzPvT1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HwXEFN
 0meP4nhmxW6BQmIgCV6fgoJEUiAorTEgyokQU=; b=BqgEblWIR9Kv5ewkD2xyXs
 +vt+ECAojCpwpvgxydJ7n3PY1+76aLJbtQxE3J9AWFOK9ZZVSWUSIWzLsv5SY4/A
 tN+JTyHsSUn7yNXrU4GuJ49SKZ8QGHIKpnca2Z/HsgyWYr69A26K4KilRRDTwYeC
 sV6b0ifKjIh0sKfJME+TkIw+4l6vcz/CmmMx1lqzZD2Xm9yNZSUqvCS2C5C68tP3
 S5hgc5MfSbtDySwpiO7WM2Z+mKmYAqFX9tEaLV9PQXjjuvZ2lL4x+OZXPbQJKwhC
 dsC+XoLrG+PGfm5WBI1/32ZMnwiEfiNLvxoCfUzScgshSYNIsu706H6ZreeB5AqA
 ==
X-ME-Sender: <xms:FFzcYapwyW9JJERiO8UMkNhEAWrunGOawBEqQdgj6eeFy4HgBn2NRw>
 <xme:FFzcYYrQqyTiY_f1gxNNNUouNBIPdqbyq-KYkREDkM2LLr3_I-M4n4GWJSB2428Y5
 A1fvc7yKBrAhBEUmCM>
X-ME-Received: <xmr:FFzcYfMeHN33qiLsIsaAGnZl1qRnwY6QnXGUdVw0CPWOmjViDq69_1SJDGhO02H318iLrDDW5jElt-GbrCTd3oagLE4JDnTD1e5OGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:FFzcYZ7rru82GX6n4CFDUi0wZTNlr3tSyAi72UKzWUc8MiK8xxqqRA>
 <xmx:FFzcYZ4KFqv7vDltUCYJTTXscj2yAChK2jepGDA-mzwHClW3KW2sqg>
 <xmx:FFzcYZgVe_T9ftz_o4GYvIPld_AoXttRg65bpTOz3vSS-uDzR4cIpw>
 <xmx:FFzcYWgHRYYbua2O_z14U84bXzjJwScGK82VSaaBjyrZ4YdiLinpHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jan 2022 11:17:23 -0500 (EST)
Date: Mon, 10 Jan 2022 10:17:22 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: Sensor Whitelist
Message-ID: <YdxcEtd0AqfdXr2c@heinlein>
References: <9F164585-0D50-47A9-AE4C-54695769F02B@gmail.com>
 <YdxDuatxZZiAP1yP@heinlein>
 <EE5CE97F-DD57-4930-B279-A9E77A1102C1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="duoAM+SAdOlVEZn7"
Content-Disposition: inline
In-Reply-To: <EE5CE97F-DD57-4930-B279-A9E77A1102C1@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--duoAM+SAdOlVEZn7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 08:01:33AM -0700, Mike Jones wrote:
=20
> Do you know how this works from a policy point of view? Like is there som=
e conventions about how devices are added and merged?
>=20
> Is it just anyone can send a patch, or are there any gates to get by?
=20
Generally anyone should be able to make a change to any repository (assuming
you've signed a CLA).  Some maintainers might have specific standards of wh=
at
testing they'd like to be done.  Best bet is to look at 'git blame' on these
lines and see what kind of 'Testing:' statements were in the commit message=
s on
commits that previously touched this list.  If the maintainer wants you to =
do
more testing than what you've listed in your commit message you two can work
that out in review.

--=20
Patrick Williams

--duoAM+SAdOlVEZn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHcXBAACgkQqwNHzC0A
wRnu3hAAhHPek2bM5kHQXwKMOnSpMwtTaLnxyitpgrH7FGv9LIWV2uvT7rRIyxjq
/wg4/JUd0qzCcBY3LUWPReduBom+WkTweEaXnIRl27lH5iH3KxdnfGB3Yyt57ANX
5LExTmphGRTYiIt55tiFA6xz5NZq6OMFTMm0CTRE3BafuCKTjIvh+pC6ylvVrnJi
VpxnfRld9hqIdXop3qyLHnWsJXBx29RBonYcwaLTQr+ZaAthcoiC9slKRlpMk8/u
+Ycf18wwM4VnJM49Rb385xGJyO0lAv3R1ZNZIkc7p/CL3NrlTGXdJTzWIvjCn/Zf
m9OSqwOwKXKNfSb7aKAWqaHn0tbyXmpEUNT+PtGFuG8eauZ+Og3VcImF5U+gZEnh
qXw7qlLmYX7if7z4z+HEDKTyoWSjs8WAQRsklgnBsv6zI8OvTKPnmeRkoWmrBl+m
uvjNOFY2pFJlWGfVDleiQ2CLCAKlbqr/6dVBr3Egc1bL9uWQzHaNCnURSQ+J1HMB
lfp/GRa5l/nqArIPpAFVuYOLgIztApl7lvmn5pIcNncBYI+8dXwCVept+GiPZp2c
XKfYzqA0Vewsylxvpbvi4tNbj9As9FR744SBUoOCGapoL8gM3BQW03vjEg0L55vS
LFLZBzG7wNNEvYXHBsx61fJgh9txHJpysjo5mqHyDoMdeapYeg4=
=wX/X
-----END PGP SIGNATURE-----

--duoAM+SAdOlVEZn7--
