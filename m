Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB1B3692F3
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 15:21:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRZgB0mmfz2yqC
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 23:21:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=VOe5jSbJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lMjVUs3X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=VOe5jSbJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=lMjVUs3X; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRZfw4hfRz2xfy
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 23:20:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 699C15C01D4;
 Fri, 23 Apr 2021 09:20:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 09:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=pv3RiIpuLG5/x/ZoZO+dYpwb6e3
 Kl0ZPuxn/oydlnSg=; b=VOe5jSbJO4qEpfEQM3R2pyBjfecLDiv73/9v45nKDzA
 iIa7lynMupPytrJ4wMpVFmApFJlXoqGA0f8q4N5It+vw+YsoEI3OBsBw6FR/Ovnz
 rN+56RAawUmCnvo8MHF9/fVNS0uP1tpnjww/ZHWg3eWtxF3Ktl4+Th3RWKEAgzl9
 ikiHUGBvDGN0LA/GZO/+iuEFM5KNPIS99j4CpVBqJoyMZ80ag0PjWoW0SnpAHoky
 mlqfSXcieD3Yeog0CEzpHqq+RdGF23s8AXhG8vb27V9nCF0wrNA8zHLb4rZJnGSZ
 4hH149p5Mv28k35iJe5J64ZG3EzpOQeyZbihS6PccYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pv3RiI
 puLG5/x/ZoZO+dYpwb6e3Kl0ZPuxn/oydlnSg=; b=lMjVUs3X5Xsp1QQHd76WP2
 iGhoN6OawoJrUOdLO4sAIcZ7mSIVp7cGKjxfmJQGR6tJGBK7hZMDJ/LhubHNxVbC
 Lw4+NB1AjoPpXDRAl1v362krVC68hkTROHKpcVa7MR/mSzYlxOHZ3PW/qRW0GSjX
 r2QrZjIxDnS88PHBV/gSUVHM9W1I4Ts+zRJCo0O3G54oL77nNVOkEECjaLcJCXK1
 aeQdcRmvzNEAPEmuvaKgB4BMeXmJwU9k9mEcXpg4F2+S2L+ddF/Q9RyVdChdAOam
 VHuxyUkXwRxihbjSz5KNX127xjw8GOT1sfEf/2ZEA93roTOlQEtrTqWlZy6vL3Pw
 ==
X-ME-Sender: <xms:s8mCYA0Fxb2F2kILyp4HC7AeX9AII1QT1QEQbF6ZpziLDM2Ua37VxQ>
 <xme:s8mCYLHwXgWAiXtYD9EIvwT6BSB8qYdfpSHT5vxZfYBaPUq7_FKqXDQcmhEn5bCf1
 0Z8El0rvuYKfugTaJ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:s8mCYI7ZN-6WcnrthIV3e7Lk4uw3rc3s00pSFepFhAMqf2EV9fYRRA>
 <xmx:s8mCYJ2hCJO1gh4sb3SjBh5jf469TJI_lCfm3ju3hxhX7HgR1E9eXg>
 <xmx:s8mCYDGi37rHS5obV-CF2Enuo-E3tlXP2KQpE9yYBiCBmGHWSINwdA>
 <xmx:tMmCYIRkcJnskCwpIRKXxoPnZo-zbT8WCKqA5Uae6vOOalBTksox8w>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6C3C71080067;
 Fri, 23 Apr 2021 09:20:51 -0400 (EDT)
Date: Fri, 23 Apr 2021 08:20:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: CI build for yosemitev2
Message-ID: <YILJsgzS9otvmnJL@heinlein>
References: <PU1PR04MB224835088E75178D9AB64B85A7C00@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <4C410766-951F-4543-AE09-BC3F31197F5E@gmail.com>
 <20210115132613.GA47865@patrickw3-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dcAdtUv4y/POjQ1g"
Content-Disposition: inline
In-Reply-To: <20210115132613.GA47865@patrickw3-mbp.dhcp.thefacebook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--dcAdtUv4y/POjQ1g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 07:26:13AM -0600, Patrick Williams wrote:
> On Sun, Jan 03, 2021 at 07:27:06PM -0600, Andrew Geissler wrote:
> > > On Dec 21, 2020, at 9:32 AM, Velumani T-ERS,HCLTech <velumanit@hcl.co=
m> wrote:
> > > Could you please help us to add the Yosemitev2 machine in the CI buil=
d verification.=20
>
> > 2) Donate a jenkins compute node to openbmc CI
>=20
> Facebook will allocate a few compute nodes to the Jenkins pool.  Andrew,
> I'll work with you to get them online and integrated with Jenkins.  Once
> that is done, we can enable Yv2?

I wanted to follow up and let everyone know that this work effort is
done and Yv2 is now enabled in CI.  Facebook is currently contributing 4
pretty fast machines to the Jenkins pool.

--=20
Patrick Williams

--dcAdtUv4y/POjQ1g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCCybAACgkQqwNHzC0A
wRkpfxAAhXrXY9Ywsu0bG1f8dqil7UK1GxYSLXJbMLKEc1cLRiREEet7728ZY1Oe
4M5MPjI/ZEN1VQt1JtH23HUdwSjqn8b0km4YbTUKXoppIEU39N/WGRsw4UDuHE3A
qhPWdONFdPyVgc92S2WAb46GSIbkky0SgLbIhkypJmEUjjJHMIniHZZh2KyQFMw5
I91t9D/P+1naF1vuLociwWgoH1MsYQvcrQjTvC1XgbYKmeJpjRBUnUmie6TeOOGS
G3j/cgxAeIpqo8yn0DyGgCWzndDeemYGCtz3wxo0EL4JCmCoMoPexqBnJK/uZOG/
yemVEDCwnOphyd4B59qmi1UQeT9Fx2IJzuTzbmZiup9ivxujcOsMBsRUCH9naXz3
BN/ro/GZDCzPblbS9dXuoe1jZN3x6+n0kKUEr4F7pFBHk9WykFs1KiCiRhwJObcM
DqJwLJsCLQpmM3uKFoSJFBrYlzx0znzzusXW4wAVd5Ayt9/NY5qH9yqSohAkn0N9
/bO9syK683fju9axBUIEZ5BzakEswXEVa9Whdn9k8KEQmd2fop/c+rzMxvb/B1dx
woMTkVeSeQTZvOtbmGFPaX0g3nz37qtZJfiE7nRNVm3pzvuVFiiFQOMfWXq9/3I8
4LBotrH/4xat/XhIdBHf91hJ93esMulC9GU0ELKuIhJrJKZq7MI=
=3YG5
-----END PGP SIGNATURE-----

--dcAdtUv4y/POjQ1g--
