Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 201806FEA40
	for <lists+openbmc@lfdr.de>; Thu, 11 May 2023 05:37:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGyJL01d4z3fP6
	for <lists+openbmc@lfdr.de>; Thu, 11 May 2023 13:37:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=cKsjxpBH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BG4Oyk/T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=cKsjxpBH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BG4Oyk/T;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGyHh28TPz3bkZ
	for <openbmc@lists.ozlabs.org>; Thu, 11 May 2023 13:36:47 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 905C632006F5
	for <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 23:36:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 10 May 2023 23:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683776201; x=1683862601; bh=F5
	pQmPXcmBKbtnjPa3jKvQgStV3Wdhn5xC6rbz9a3tI=; b=cKsjxpBH+WuCdXoCnn
	6JNJN0IRL5dHUikwbvPFVpoPOo2PqLPrDf9bQHCCkaJ0GqTcI1knIAJPtdtyF3je
	ljE9yxMYUsibFxfr/ebGsj3PeQnpzN2XGClNi+WwiBMFM/T0mcwhcXjsQHxRWEi+
	1cG7/z3JTqvQz9IiZtVBfvcS8IsORF3yUDoukzlsLFMtmE7SNIEasazajoq3XHc0
	dwBKoMvc4HztaFXSFRMR5jWgCTtwXJ/GdsIK3L7gVLw3cSNR/ay3RJNfsRkwy0pG
	9xO6P1yGuKQjrNeZ5LHgLNpxWmzHY2YPmubUvd0zhNnbCRcO43AAFI5mRHixJWix
	qUtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683776201; x=1683862601; bh=F5pQmPXcmBKbt
	njPa3jKvQgStV3Wdhn5xC6rbz9a3tI=; b=BG4Oyk/TfX54Yvg92ERQFEnI/BzAx
	OAQn4z3VCGMsbomH0V48Cw9bSMWVjcvaFUgK7xw4ITFKlIqygpz6/vuPv7jRXYc4
	N0DFO0nReEpal3ufyqlDSAfPAF5FHTs49Sf8Rbv8qPtryCUcis9x1MqE58Qsq+5O
	oD8xDX4wfgsXxX8M1Us8n1ESHhoLUHbPCbAvgEFl9aWEKBu0/vZCVyfBsxgcKiSq
	e4Te6hOxQ3NFQ69dQdFK+R2gBnmHVtAl7GytNIE8GGX/meqPnTQbWW6MlNhEClgh
	ByKQBClXBtlFT0CB0uQz0CnlB+V3AjdcJUqOkA0/rH3WaFdvvwqTKjwWQ==
X-ME-Sender: <xms:yGJcZEgGX3Di6ZQ38PSUTdr_xMerh2CWXMr5fouB8-Nfyp3HEqCZcQ>
    <xme:yGJcZNB4cLpnYHOjXgcX__Pix14vupY84O-wKtj0KYKBRQdrleym4uzHiw-MnTdxX
    QTQzR6VJTfARpmOS8A>
X-ME-Received: <xmr:yGJcZMGojiWE5Rd3eZUBDnDop2nkN2GzRXJtBj3jGR9H9yrkmqGBMK4zgKj9rx9tRvg65PaCIf_erJ8ZfVuMAIlau9wFjB8mVzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegjedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepieduvdffhfeuieetteffhffgkeek
    heejhffffeevledtudeileffudfggfetffegnecuffhomhgrihhnpehophgvnhgsmhgtrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:yWJcZFSsKl778zYHHMt5f0OA09Y-JFW_K1LYT9uQsw5NpHdHi6zXVA>
    <xmx:yWJcZBycsmDGrRvmh5QDVW-Q2f8QJoMzVSTUY4QYq44YcMrv-5m1yA>
    <xmx:yWJcZD48BFeyloi7pk4GEOE5SVD4vwGKB4m6r70Gly7Hlpm7XctzTQ>
    <xmx:yWJcZKv1XPlMS0HvW52exyJJ5-T-b5NQsa1_f68IoveBpgzYm4tCpA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 23:36:40 -0400 (EDT)
Date: Wed, 10 May 2023 22:36:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: clang-16 rollout
Message-ID: <ZFxixiiHQrRY_5jf@heinlein.vulture-banana.ts.net>
References: <ZFuSH0kBl3uOp2wg@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtTk2S4annI1/49o"
Content-Disposition: inline
In-Reply-To: <ZFuSH0kBl3uOp2wg@heinlein.vulture-banana.ts.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--vtTk2S4annI1/49o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 07:46:23AM -0500, Patrick Williams wrote:

> I will also be pushing up to Gerrit under the 'reformat-clang-format-16'
> topic[3] fixes across all repositories which:
>=20
>     1. Copy the reference .clang-format from docs into the repository.
>     2. Re-run clang-format on the repo.
>=20
> We will need maintainers to merge these in order for CI to start passing
> again.

Many maintainers have begun merging these.  Thank you.  If you see
clang-format issues on a repository, you might check the topic to see if
there is a pending commit you can rebase on top of.

> [3]: https://gerrit.openbmc.org/q/status:open+topic:reformat-clang-format=
-16

There are a few pervasive issues related to clang-tidy-16 that we are
still investigating.  The most common one, which affects many
repositories  is an issue in Boost that looks something like this (but not
always io_uring):

```
/usr/local/include/boost/asio/detail/impl/io_uring_descriptor_service.ipp:1=
09:3: error: Called C++ object pointer is null [clang-analyzer-core.CallAnd=
Message,-warnings-as-errors]
```

The bmcweb repository has a big set of clang-tidy issues and I've been
working on fixing some of them [1].

Maintainers can currently ignore the Boost error on other repositories
and force a +1 Verified if everything else looks good.  If you are
unable to do that, reach out to me on Discord and I can help if you want
to merge some pending commits.


Please let me know if you're seeing issues that are not either 1) the
above Boost error, 2) clang-format errors that are already fixed in the
aforementioned topic, 3) failures in bmcweb.


[1]: https://gerrit.openbmc.org/q/status:open+project:openbmc/bmcweb+author=
:patrick%2540stwcx.xyz

--=20
Patrick Williams

--vtTk2S4annI1/49o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRcYsUACgkQqwNHzC0A
wRk32g//dkqZu4y0GygAhNoTCxCcknd64Eu2uZg6tS6nyNeqrh156gsiLy/Vn8Fo
mf936Me1xhEZ2BycBfE1c/kwobIoOXVVJ7AxT44d3r84IqBXDph6i48mBrxEc/t4
VxN9NhByHrx6u3wCcQymW5tu6cUr7zLJuXxW+98IMD+thWHhBOl8mtlQ1poHOMkj
ID+W/tOVuBsNn12pj111Wb0yrFTjfs2+zcwReRh3EcrvAeTRo2vwxkmqgk/88ca/
JllgA3Yq9TWxwg7QqPlC0Re1J1cUlN/q0H6JIxklZTv5upAEOi+TeM1iOfg56Emu
o89Id92c1H1gk+1CIqWAzP1MEuRdAVSpCpPYTz4Q/LJKbwnZy+4jLHGEmuesQlEm
twI9gjR+UceiANSTgVmZgV/USV2x8jdwUgCIpxF+SjnDsf4Z0+xtadyr5t/Ps4HD
eYXIHScbm9KWUNLowrfIsl10iRtlxOvM2waGGuoTV2Ipjw1TBK40w8IYw6bMuAB8
gUlolrM49Lli0tKjv8nnN3oglrJ6Jq4qOhr3Evk1ss2Rx6sh9O1vmrlil+UXDRVM
GhU/3cVdQ/TFFdbbvTqwR/0OVBgasRpFqJSvuo+OkrBRcjDWRgOEB2JiTPtanMd4
JtKmfUx6j+vldLYAYD4HCE7VR5ta8TOSFlLy20rGRKVyvUgpngQ=
=ZO/g
-----END PGP SIGNATURE-----

--vtTk2S4annI1/49o--
