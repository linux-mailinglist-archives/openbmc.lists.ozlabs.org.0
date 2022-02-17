Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F744B96AD
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 04:30:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzgLx0lVbz3cBr
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 14:30:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Wr6K9RV1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DQnl3iEH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Wr6K9RV1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=DQnl3iEH; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzgLV3N2rz30NW
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 14:29:53 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 50F3A5C012B;
 Wed, 16 Feb 2022 22:29:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 16 Feb 2022 22:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=4+YgZVrTNSqTWky0wazo5w1jwwg0ppXqVyzqya
 Oe3fE=; b=Wr6K9RV1QgnE/K+qXWLN1XSV96m14pcvgVOc6UFKx9dAwWm9Udyhtk
 7nGi124V1VswFup2Lq4OshMBQNjG+0QlS9AbGn0aSuBs+Om+1jK0TKLgFy8MXgBU
 980NVKzx236fPH5eZQjookRinLHNKCUy2L3IpABIXaVWLIf9bFO0Q5v2rDIUsLcr
 YURCqHyWIsR4N/0XRPeMMaZE4ZcNad/5yKj+olK0ozq0BbqqeHDVX68sg+FwB7Ln
 IVUPzzyWUPUb3LfRxO6jy91i2Smk9UsXJSNQDkIG73AoZoKHCPRxey6A9BhbQDN7
 EvuHQU/Q9XsvfsvitbGEW7KntepEDvUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4+YgZVrTNSqTWky0w
 azo5w1jwwg0ppXqVyzqyaOe3fE=; b=DQnl3iEHRVWsMwOL9JWkr5XAMityGBAEb
 U8FhU898fEe0G3nnL434VHJuNZmsPxDhf5Min12XH9vT0PJ7gcnXxlzICOCk8k57
 8JtAW7+kC7BBvsJ3QWW0ft7wQ598GclLGUj+CK0+bpm7b3gECtjgwr0JVUz4LQfu
 conw86vllzJkB9rXMWcrIx3OKrxvE5tOrgfyK/QztJEDOHp+gRoVBQW9WtpMq8+M
 Um2NCkDgeLyDR4QPvjcrj2KCSXhxFOPrXy5e+DW8vV9ecIhM9HDolTXnY4TSdH8a
 U4tg5J39wgAcPkREDKhIbrpWClLVxDjOHCcc+DAv0h4VxQfrHGR7g==
X-ME-Sender: <xms:LsENYrQfQcooep9DJn5dlG__KVCYe9E3RYfEPWmA5gWIOt7G0oj_QQ>
 <xme:LsENYsxTHDq5E6XiAOTti2E3o-DqJwuRiYn9P7DcVxY01s-jY7f4pbuDLAe79vEM5
 nmneo-v3zX7g40BUgE>
X-ME-Received: <xmr:LsENYg1OyVDcMtUqn3VpPZiBKd0NWfZDKe8Z3tETDyTrkuRQeAOeNHros4VHGNKkpDyOs3k3ebNewYjpNj-SIo69BaUtWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvkeeuveeuudelgffgfeelteeffeeh
 jefhtdffudettedujedvhfeikefhhfeuheenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:LsENYrBVtcBG2gIy7b7QvWvN2cY15hnqqgx8s58weRim0dRh49Xlgg>
 <xmx:LsENYkhgtdJqpI5gx1tyh25NrBiZOn8NHW1Va6NZ7EW4aQbvcTlq3g>
 <xmx:LsENYvpKAV-w63LLaX6TZ69a_H7tYDtIaJNJ2xIb9kvvp6T6R8hC4A>
 <xmx:L8ENYtXTS4s2iz5kKwjzlCHeMLU7ICgSvNcA6R_RCCL3HqaPk8soWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 22:29:50 -0500 (EST)
Date: Wed, 16 Feb 2022 21:29:48 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Openbmc u-boot trees (was Re: u-boot:rsa adds rsa3072 algorithm)
Message-ID: <Yg3BLAxgCuExE7HJ@heinlein>
References: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <CACPK8XfwLCxNVLfVa=FYw0TVXPE_Kj8+p7=6Svw_O10x22Jf1g@mail.gmail.com>
 <TYZPR06MB4015B2ADBBB832D151F4B433FC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <HK0PR06MB3779776EED65721E481F8676912E9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8XfM+jNJ6bsABCPgGYWDg7bczjKKFjmA=Lzbi166nSOjbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/QfYSL2DkLOapRC9"
Content-Disposition: inline
In-Reply-To: <CACPK8XfM+jNJ6bsABCPgGYWDg7bczjKKFjmA=Lzbi166nSOjbw@mail.gmail.com>
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
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Dylan Hung <dylan_hung@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--/QfYSL2DkLOapRC9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joel,

On Fri, Feb 11, 2022 at 02:11:12AM +0000, Joel Stanley wrote:
> On Wed, 9 Feb 2022 at 02:29, ChiaWei Wang <chiawei_wang@aspeedtech.com> w=
rote:
> > > In the short term, one option is we put all of the openbmc patches in=
 the SDK,
> > > and continue using that for openbmc. Would this work for aspeed?
=2E..
> Works for me. I've sent two PRs with the obvious changes:
>=20
>  https://github.com/AspeedTech-BMC/u-boot/pull/9
>=20
>  https://github.com/AspeedTech-BMC/u-boot/pull/8

I can't tell for certain, but are you proposing that our recipes would now
exclusively point to AspeedTech-BMC?  Or would we still point them at
openbmc/u-boot?

I have a few concerns about pointing at AspeedTech-BMC:

    a. This seems to conflict with our existing guildlines for meta-layer d=
ata
       and some of the stronger guidelines we are close to consensus on wit=
h:

           https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/51099

    b. We seem to be farther from commonality between Aspeed and Nuvoton (a=
nd
       any other future vendors that might surface) by taking this approach.

    c. This is different from how we handle the kernel and seems to tie us
       more specifically to the whims of the vendor, especially around upda=
tes.
       We're already working off an early 2019 snapshot.  I recognize that =
the
       current maintainership structure is additional burden on you, but is=
 it
       possible someone else from the community might be interested in assi=
sting
       here?

    d. We're prohibiting patches in any meta-layer (and already explicitly =
block
       them from passing CI), but new machines often require at least DTS
       changes to u-boot.  Is Aspeed committed to taking up DTS changes at a
       similar pace to what the community needs?  What are the requirements=
 for
       those changes (by Aspeed)?  What is the process for them and is it t=
o be
       documented in our project anywhere, since what appears to be a PR-ba=
sed
       proposal deviates from our typical "use Gerrit or do it like upstrea=
m"
       model?

I think most of these are manageable as long as we understand what the
expectation is (and document it as appropriate).  It may require some wordi=
ng
changes to our guidelines and/or modifications to our guideline-validating
scripts.  The one that is most worrying to me is (d) especially around the
potential pace of acceptance of new machines.

--=20
Patrick Williams

--/QfYSL2DkLOapRC9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmINwSsACgkQqwNHzC0A
wRlhXg/+Ne5P4QVlsT++HqA4zLbecGJXGzzfWBfmHJcNrZFLTcjTaHMahcKb9Z3S
otelE8pafDdv4qNMEESqtcuICX7/Fj/JrGQtxQFxgYVFerLrC54zdp1PfQZx1gCg
CDK14KUKkRCcblNdOU8+lUjKtIq73f4jwmfYNHgrVgorjSaXGXcnWlnevHFLieUT
mZlOXAlvxN/mqAJx+qec9FPhILAh0k4MREQW1cXSSFTLYyIEZTO+YX1w1NpSP/P/
woztzkYvKrkmgWp0DBa7YCVGHqCXT5PeWiGTHo2kpAlFx2LMjfJiIDdx724XYo7l
LQ+ElfgbDGBWYXqcHJS/V/j2tuTRMBk4Va6LWtenAcjTXG+Ik16EHI/6mGbux8C4
j1PiN2+9Ub/izhnLRQdqpa8lksQCA8i8BrehlNuzkFeWbGfAegh4YXqhDgUmQvRV
rb7Kd6mQMeoEAdZSIHNlAXC0Y6HdGj0zZeVNBg9DQXobV9T+MEf3evYrRpF80C8T
IC7Z8hGyXmO5OGlh9p4FJjFEnjqalBXHOzjRmDk3X0NTuRyUrwqNvR46kt0Kyw+z
Hnx6Z+i86QiC8Sa+x3OAGU2eESX/x6Pxu/sHfzQRR50w47ImJ5Urf5ZlRB7YUV0S
Fl5bdBef95uM+TVeAXwvmHmHGyRWKQkgGQAVs5OjoFNbPCuAYzg=
=Bqqj
-----END PGP SIGNATURE-----

--/QfYSL2DkLOapRC9--
