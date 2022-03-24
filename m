Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1774E6693
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 17:00:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPVLl2QNxz308b
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 03:00:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=ZE3YV+vr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SSWlIXXJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=ZE3YV+vr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=SSWlIXXJ; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPVLF4jh3z2yxS
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2022 03:00:19 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E8F755C01D7;
 Thu, 24 Mar 2022 12:00:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 24 Mar 2022 12:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=UxzM3/Zrg83SQWfiG8xq1y0XFs5Rspylai1aUu
 GH750=; b=ZE3YV+vr1NB77r3bgQRz0ynegEIWmmlnTXlMr9MfGANur+pntpNKKa
 UWQ/lZ00Dapgem55N1DEN4qZKioFmZcMFmwQErvYPqzREd3JrYMpTmipeIaYTfMi
 iYhkA943dhHIn8i4WaRVVKYZeTInrhVn/7X0UbOEHxNnJp8/4G2Qk/uACij8/1pS
 ie+lB+QGVdEAqNPQ3B46B9KXVdv8g8xxVy6YGdjW71b/MWRMAiqJTgJqhffvz0CZ
 iOLRzf3bWXZeamDA+++QpFLDrpHZmOvGYvDMeecadm+d+qbrTvPNT2UAWCjgkNRR
 N+ICcxTDJXTSAoSIMpQbAWBIWYLmKyGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UxzM3/Zrg83SQWfiG
 8xq1y0XFs5Rspylai1aUuGH750=; b=SSWlIXXJXjan2gtrOf6TskgJvUaBHrQnz
 vmg3r8X1GPvN4VKvIEuajcA3iIn4b7iln4pnrVe41u05JbI2O5uOKMDubhiaKzi8
 E3ms7R7VpYkHcDuoA2UqQ84XsVUvwkagW5ZgUr5cia+m4UuJmJR6wt8OlfsOBwz0
 fLhjUd9WFrbC/mRc6YN6UZTZnD754ydMDrT9U7voJqk5BA1X8qVpTfIaqtHa3dbE
 pYVpMNjCVrUbFCazuj6FjR6TMCglHJQdDKv1VWI/hVm7rGJ//1b0EwQ0RB5wZ78q
 5PzXKsJxbd8DijUll6BzXVBzsQw0/bVhqv4mH0h7Hjyl0SBcUN0mg==
X-ME-Sender: <xms:jZU8YuY7rHLY_gq7k2EiAb9IyQVXOanCpUifhOxrfgdf65DrXd1DNQ>
 <xme:jZU8YhZBJIVBgYVglrrfWaTmywrmuDBZN2RoPb_JE-Et-lWCCCbeAqBEN9UIXWlax
 6fKTpuHmy0kRuugr8k>
X-ME-Received: <xmr:jZU8Yo_SkU5DPITrUKN7B1DWNMT2tsmBztNYos56Zr2s--I0WKyLikwpVdWpeJMHzu8f5BCsd-oJlNvYPVy-0py9aoCZAGYrg8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepuddufeelueehhfelheejjefgueej
 hefhtdeludefheekudduveekieduudfggeeknecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:jZU8YgqN-tmaR2d_NG7UNER_Fl-seR40ypw-C3Xa0uBTFngNQ5dOkQ>
 <xmx:jZU8YprN4Nf4kkfcUsI0sZrlQMrMOsuQ2ueGJL9oHWnQEmjleoWnnA>
 <xmx:jZU8YuSCTnrXhE6bLZmrnTPRKP3sGOF8TZfCY-2lv9NmxM15CAR1GA>
 <xmx:jpU8YgXhBvTVZjbDbjEq0Yo7YDQ5tXrO7QWnL4wnxNqyf_Av3gPrjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 12:00:13 -0400 (EDT)
Date: Thu, 24 Mar 2022 11:00:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: logananth hcl <logananth13.hcl@gmail.com>
Subject: Re: Applying patches to U-boot 2019.04
Message-ID: <YjyVjLQE1mjqGm5X@heinlein>
References: <CAGpPFEHeN0NL3EJ238BbGLNpaayRo4SGcfWdRTdNiEgpq2a0Ng@mail.gmail.com>
 <ea0c2d76-0a89-487a-a710-d6a07ae967b9@www.fastmail.com>
 <CAGpPFEHTu83O1S9NOP02WQpbuvrf3RRUf=VnPNc352CrzxnnQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vkUldItJBHs0/vBX"
Content-Disposition: inline
In-Reply-To: <CAGpPFEHTu83O1S9NOP02WQpbuvrf3RRUf=VnPNc352CrzxnnQw@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--vkUldItJBHs0/vBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2022 at 08:25:18PM +0530, logananth hcl wrote:
> I have pushed the related machine layer u-boot patch files,
> in the following gerrit link,
>=20
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/52263
>=20
> Suggest me to add these patch files to the list.
>=20
> In the local build itself, u-boot bb_patches are not applied during
> bitbake(copied to the build's u-boot folder), is there any restriction on
> this to apply bb_patch files.

I don't see this behavior.  I downloaded your patch and see the correct
modifications in my build directory.  I checked this file and see the
'console_slotN' modifications from patch 0002 being applied.  Are you
certain they are not applying for you?

=2E../lf-build-yosemitev2/tmp/work/yosemitev2-openbmc-linux-gnueabi/u-boot-=
aspeed-sdk/1_v2019.04+gitAUTOINC+ed55c4e7c3-r0/git/arch/arm/mach-aspeed/ast=
2500/platform.S

> I'm facing repotest failure, I think that will be resolved once it is add=
ed
> in the repotest.

I made the same comment in the commit, but we can simply update the
paths in repotest.  You've only renamed the files so we can move the
paths in repotest at the same time (with the same commit).  We just
don't want to add new patches.

--=20
Patrick Williams

--vkUldItJBHs0/vBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmI8lYoACgkQqwNHzC0A
wRlRUA/2KauPomHdOeOLeSh54dBRrnSSIQ9ZdlIoSWTM/SW9QUA4ocXBUQFT3NII
RZ1MLY+I4Bo5Qp2uCP0T4tbNGfjR1VYbWOosXVSynvXv6hMYGq/2wNt2Y2JQLnKA
zW1z7Bmun9HjHxeIdd0wesNS9Q2CUH9i/cNtsT9Dva7aC/ezQu1yn+bHacQbhNVU
y7A390nqgZlkFLJduTupcUbVg6bMJxbTPLmJ+cPTTKjBCNDhWRP9aRBhrogVsp3B
e6z9Tpc/My2jdRfJr4cOJa9OsKvnpGmJl+V+52H1doI+HtnlHuK41ccb5ST2OxQM
Gwiu2c1uyzxK/XWt71NjERk5KU/B2boKvaHM+MrGw8UoJlKaMMcpsdknALFK8PPK
fuTXyEMGolRxkOk8LCkFzYktFmRKRmOgtpNBlxoTEioV9TeNvbzPY3hygp6kehwa
MwFLLpxqyqRkQktsjHYXkOlbfcHqzmYNOEJSLHmMlvD6S3FSvvQgdOX5RoKi5bpi
RvoOr1TQrGYnbMK0Q5ogl1oGWieJfM81wqBm5bk1dcEY7MoVF5GYPzUtl5OjF23l
v2pDIsYiG66IfSApaLJ0dUuPslN/mPzQoveuKMuouYXnMNEkOiXTGHASoforHNyt
zzQve5sdDTUa4WaaCrnh0s6bwTn3EGoeioufQ8eVH02pqR3XCA==
=9+B5
-----END PGP SIGNATURE-----

--vkUldItJBHs0/vBX--
