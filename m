Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38E532F35
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 18:48:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L70WG218Gz3bnS
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 02:48:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=K6EJNM/p;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ADMBbaNS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=K6EJNM/p; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ADMBbaNS; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L70Vm6ZTCz30D0
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 02:47:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D8A325C03AD;
 Tue, 24 May 2022 12:47:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 24 May 2022 12:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1653410859; x=1653497259; bh=N4/TxzjdPa
 tsLzJHMLQPM4yOYPuJ6Yf1N00HEvFoXbs=; b=K6EJNM/poJZpA4alBFCCtB03oG
 rS0ZUig4Kf0Il9IFt4zmTuPiuQFVsM5k7npTVdxf5EVaxjwVWP+pIyvQzGYlKD4n
 lNAOhoDc8qaDQs3MR312MYhUqpTpaAh5RmcagPR7pRCPjpV/Sqb9VGR4ropnBllp
 HPrhtUDn3JhU4OoGsx76tvrzBcO5nWDSc77d1WVErJ+RkyvdyIpKc52IQINKB49K
 P73wgMbtv2v4kwxn0ebsnWK1q4qmaUZAyEB5X1SyM8a5bZaGEiV6nP7u8B+5uK6S
 lFCzI8U2rXvvGFhniKNYwmK6h1U8y7pjEbW3pmYg2erlzr5uz2JXwTBHTXfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653410859; x=1653497259; bh=N4/TxzjdPatsLzJHMLQPM4yOYPuJ
 6Yf1N00HEvFoXbs=; b=ADMBbaNSqS6vBmIU9DfPme0G/O7E7fN6H6CbAD3KWDaY
 /d3Mb//r9SsCW8MDcBE7bFnno4ikPAvx2II1NIZB+l+Hk6RcgBxj9Cby+FjJ0GUH
 5tyyjfg53TJWBa8bLx+XADn4AUBi+9a9KGxFzdEqhq93Tv1iR9fpEo0+w7MbqpTx
 SQ9mtTRrxQhKGNxBMcZAUiBmDgjhIFYtpGC33ZiJODgoO1JmLOfuIVWBEDzulpWW
 wi+nIT90xu/R6g33nXpqM0QS8oAo4HHk1fDGCKrROwWgccDz7hYeswCjvIV3FZ8x
 JSxG4fuR73vAHjE2gyF3Jc9/OCKK7/mf1StEyG9phQ==
X-ME-Sender: <xms:KwyNYol9Or9t3af_l35YQ0ussDqHZ0UVqIG8RlK4eSEqc3Pl3lTYpQ>
 <xme:KwyNYn2l8sj55kUqje5p1pYlo3qJ_-s6oF_pQsvUNzRb_AtyszjE2mTjttwq-ErK2
 AavzehFRiTdn_lO6f8>
X-ME-Received: <xmr:KwyNYmocm3w73tBS9YkWHfZc7OMD-EZR616TgKgA8xNMPGJ5Lp1P5LFD41FwaXzWwerjwcskAPETigA62-2zUG7B9X-TYeT4XG0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeefgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejjeetleehleeijedutddufffh
 ueeufefhfeelheevgedviefgffehudelheelhfenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:KwyNYknBLczyljyNGazO5hqu9uY3WTJmkvbJwJbQKozOc9LtTViqZA>
 <xmx:KwyNYm2mssS7fvPP5gUxAsp1Y3fpsEstkUFznjFNC4ZI8H5TWYcDLw>
 <xmx:KwyNYrtm-bQQpZNUQMSoLkNzR3dCQoXN34bDcywb3gBij3dUATUs0A>
 <xmx:KwyNYrzIox5N17oQRexCJef1ZJfzmxSsLPwG_2UA3I1sGG817N__jQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 May 2022 12:47:39 -0400 (EDT)
Date: Tue, 24 May 2022 11:47:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Graeme Gregory <quic_ggregory@quicinc.com>
Subject: Re: Updated CCLA for Qualcomm Inovation Center Inc
Message-ID: <Yo0MKXgiWUP8QCYk@heinlein.stwcx.org.github.beta.tailscale.net>
References: <9c5a07b1-99a4-3eae-6cea-973d96bb14f1@quicinc.com>
 <228c6f6d-51aa-41c9-bd34-9ce27766761e@www.fastmail.com>
 <f9364e8a-6183-3306-fc28-5874821cd918@quicinc.com>
 <YlciUMACC3Nv3Lht@heinlein.stwcx.org.github.beta.tailscale.net>
 <b8e85f57-3846-7cd6-c1f8-e9e13e7b542c@quicinc.com>
 <YlcyTpAB7j2mLhh5@heinlein.stwcx.org.github.beta.tailscale.net>
 <cb68c4a1-f3da-a3fe-5e56-4646ed083396@quicinc.com>
 <20220414083338.7mfc5ql35kl253fr@ggregory-linuxws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mu0k/pHsAmk/Bd7G"
Content-Disposition: inline
In-Reply-To: <20220414083338.7mfc5ql35kl253fr@ggregory-linuxws>
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 quic_mkurapat@quicinc.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Mu0k/pHsAmk/Bd7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2022 at 09:33:38AM +0100, Graeme Gregory wrote:
> On Wed, Apr 13, 2022 at 01:38:56PM -0700, Jae Hyun Yoo wrote:
> > On 4/13/2022 1:27 PM, Patrick Williams wrote:
> > > On Wed, Apr 13, 2022 at 12:41:21PM -0700, Jae Hyun Yoo wrote:
> > > > On 4/13/2022 12:19 PM, Patrick Williams wrote:
> > > > > On Wed, Apr 13, 2022 at 09:59:16AM -0700, Jae Hyun Yoo wrote:

> > > > > 2. Create a commit in openbmc-build-scripts to add quic/ci-author=
ized to
> > > > >      the Jenkins approved list.
=2E..
> > > It would be good if, at least,
> > > your CLA Manager could create a Gerrit account so that we can add them
> > > to the `quic/ci-authorized-owners` group and they can add new members
> > > themselves.
> > >=20
> > > I've manually "+1 Ok-To-Test" your EM commit, as mentioned.  Waiting =
on
> > > you to take care of #2.  See this example commit:
> > >=20
> > > https://github.com/openbmc/openbmc-build-scripts/commit/123ffbe915660=
73ecc73553cb32ddccf7a8a342e
> >=20
> > Thank you so much for your help! I appreciate it.
> >=20
> > I'll check #2 with my CLA manager.
> >
>=20
> I have created a gerrit account ID:1001418.

I've added Graeme to quic/ci-authorized-owners which gives him the
ability to add/remove individuals to quic/ci-authorized as your CLA
schedule A is updated.

Jae, are you still working on Jenkins commit (see openbmc-build-scripts
link above)?

--=20
Patrick Williams

--Mu0k/pHsAmk/Bd7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKNDCcACgkQqwNHzC0A
wRn15w/+Ix9eSLvh8rcVNcKmMnPKWlZ8IF1s1vf4X5E3XtAkFmRtfbW3n2lp+PkF
Wry3SsuQxjd4rhzBIlw12eCaN3e0Htl9EgkMkjjwWl1SJn0rED+SXdydlkc0GHOU
RNqlTKEw9quOfBCJeVvlAFD2U4z1LG/0mpWw3rxFWuPIFpVH/jZLAl28uXp9xTU/
yGoOdX0aLd+Qq5xxi4ZoJFeSEjNuTn53HjrF5tm98VF5cfnlL5yMZj+JbcS4vaUZ
e1ccDPBf4e/ZfTiARcKQrFD7q5AagoGZ4Y17Uvru+ucEXXj6V+02K1pkvaTapbXy
CdX5T8yAmskIfD6zkVN9AA0L+jXKJm4m7VEuqlP8qEuNmFbez7Ys1gLZUb4EFc4W
AkJf9YLd8ThyRBoGgleFLEQtEF5Y3PxMBAkRLSiL11kt4WiwFK3iom19iifgwDbI
I2W75jIKep2wvlM18WQUfh2WPF3ffNSLEyW4OmJuYrZDHznj/SS+A/kMJ/jlY8gL
/E4SXAkJnIX8Wwn5pbHdJpvCg00tuBsdrKCNt5PZAAzK4WTDM0xm63eJC7nYc5mH
WlC5G5YzgRTKm/yAOhCH48csGbNS19+JBykV2Q/Pvpq8qG1+hRQItfXH4nz6pLnG
Fr5k4pAXfhxVUYIU5CZhrJ9mf9LksD/+vR+EkdfKo9l1w8u3GII=
=gp7A
-----END PGP SIGNATURE-----

--Mu0k/pHsAmk/Bd7G--
