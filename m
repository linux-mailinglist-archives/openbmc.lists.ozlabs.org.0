Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E75AF5C2
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 22:22:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMcHq4MmKz3bY8
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 06:22:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=SxhSNL+2;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=p3XZaAWf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=SxhSNL+2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=p3XZaAWf;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMcHQ6cN4z2yJ5
	for <openbmc@lists.ozlabs.org>; Wed,  7 Sep 2022 06:21:54 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id DE2F35C00C0;
	Tue,  6 Sep 2022 16:21:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 06 Sep 2022 16:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662495712; x=1662582112; bh=ahDiQO3Kfj
	fnwxVq+UcGSz85XlAFxH84D80J/LtT9rU=; b=SxhSNL+23sQVMrXACydRtSKB0m
	i6YqGhX+TPEiHmA2pjANTpvz+q8JzO/5DNGgB6Jzz+TJe7PORmHgJxhffTGqrMTt
	p7yplo1mGxoYob7rRlutHB8Z6n1xJjQUr5WH6ZmK3GbKbMT2OnR2NLJWuvneuE38
	AgsoDKsDTphKsgVuikSjz6EUNorsBnywdpWmUngWR02eWX9Q8USiyMlPn7h+ZIkH
	4TuwY54WgSJ9zKdnJlc/UKBhTwJVDw2wmxJByRbpiaaU7KxN1k4pH+LgJ4Rhnvpk
	9gXEiH88YfQlZagVIdCNhwLq7CP95R9EOMP+lDz1/taH8FICbJ/3pW0te+3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662495712; x=1662582112; bh=ahDiQO3KfjfnwxVq+UcGSz85XlAF
	xH84D80J/LtT9rU=; b=p3XZaAWfVP0+P7TAS7xoS7FIFGwzrRKxNLYrsx0czeA1
	J/w//JRf2Oke6L62XxHqukxXwenIxYitX1K4+/ZLfnepTRjlrdkehU56+MQKhYZ0
	AyPvXoglsg/to9WzNe8DYyZyixWoEHl2ok9myZjSsWJY78UoXrClZ/Bsst2GNo8V
	xfel0YA9Lc+SxHVmbxLCTPE2uGS5oKM9ZAAvQ9P6CkndNul4jo5t0kBN4d8wJevK
	lxKYwgM0toueV94Osjfx7d7+NIWa84fDJE+z0HCiOczLJ4YouSq6diTVhKoPr+BZ
	IH9ZqSQZ0XlBFAP510NVa7HaJsHOYojuQ5b0uCv+Lg==
X-ME-Sender: <xms:4KsXY_CEwLnKqXTTCmX3r6E4XAk5Coa4cOwgSFxVdxYNrDg7EiGbgQ>
    <xme:4KsXY1hWngPSWtVEPqyJR0iqtMcUviH5G_kYWS7_CkM2TLBnf1q5pHvhpFf8cIQld
    1neg5AgtZbvzR4ZRq4>
X-ME-Received: <xmr:4KsXY6krfqypiWdFI7IxV3XXRyfW6jhrgK7OQEGIVL3gXhNZauCw2NIqFQXpK1O54zg-ygXi5W-8yitjjK640hWPofYyUWJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:4KsXYxzZod_Mc1OjVvBgZ0y0V83eFJGUOc4akNFHA5akwOIoKgX-YQ>
    <xmx:4KsXY0RdDEtTY8aTTqlfS-Xj6aqj0v-6pCT_NFzQ6MTZ-lfT2t8hRQ>
    <xmx:4KsXY0ZqpYMKmZEreaaAUVOTVDAQsKMQfokmwn9kFWogmUfWUmRNgw>
    <xmx:4KsXY960GwgHVXmgJz3siYfi88x2F1OBn-tnl1yaQFbtbsWlIN8vZA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Sep 2022 16:21:52 -0400 (EDT)
Date: Tue, 6 Sep 2022 15:21:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rohit Pai <ropai@nvidia.com>
Subject: Re: Handling State Sensor Association in Bmcweb
Message-ID: <Yxer3wVzCQVZS7Uv@heinlein.stwcx.org.github.beta.tailscale.net>
References: <LV2PR12MB6014694AB12A5A82EED51FCDCD7E9@LV2PR12MB6014.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y7eMrXGuAumsLOnu"
Content-Disposition: inline
In-Reply-To: <LV2PR12MB6014694AB12A5A82EED51FCDCD7E9@LV2PR12MB6014.namprd12.prod.outlook.com>
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


--Y7eMrXGuAumsLOnu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2022 at 03:46:25PM +0000, Rohit Pai wrote:
>                Option 2: There will be an explicit association defined be=
tween the inventory object and the state sensor object
> App1 :
>    - /xyz/openbmc_project/inventory/system/processors/CPU0
>         - xyz.openbmc_project.Inventory.Item.Cpu
>         - .Associations
>               - all_states
>                      - /xyz/openbmc_project/State/CPU0_Performance
>             App2 (pldmd) :
>=20
>    - /xyz/openbmc_project/State/CPU0_Performance
>=20
>         - xyz.openbmc_project.State.ProcessorPerformance
>                New keyword 'all_states'  is used as an association string.
>                Bmcweb will use this association to find the object path o=
f the state sensor which implements the state sensor which belongs to the C=
PU0 instance.
>                This pattern is very similar to how the numeric sensor cod=
e is working today.
>=20
> Please provide your thoughts/preferences regarding the options.
> Comment If there are other ways to solve the same problem.

Associations would be the preference.  The inventory tree should be
[mostly] static and non-changing.  Signals from this tree should be
relatively infrequent.

Generally, I think associations should be named using past participle
forms of speech.  So, 'all_states' probably isn't a name in line with
this.

--=20
Patrick Williams

--Y7eMrXGuAumsLOnu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMXq98ACgkQqwNHzC0A
wRkWzg/8DNIiBCfhomkxDa9S4AmTYK/rHKU/jx6QV598Ry0cldPES3IH0srf7oy/
sYINHETOIyw2otbUA1Ur1hsoowrzPg/VEXK3t0i6Z1MHSdQ4Fh1/EdK7QQq+lXR8
GdCZ241YqFiGovcboRu8BGXl6+vc/OYaVYWHXLgf6NVC7CXGAMYTOmDBdoEJZdAV
rqB3yGmhWliL2ilOsdmA5QCwIE2uyQyJi5x8hNwRiljt7PoZOulsjCnXnLUmcpEC
0LProislQNiazJujh9QJVp5gXB7kI45g4Slk//WaowhcJWdhKGtPgnsWjCoQYKf9
fBZPpoVdYCCPJWg0qLkiGYdgPlqsBRblMuVmBDjObjg4N46MH/53DM3m2NZJwVJ3
mox7wHcF+7V3v5ZfefSGRxaJ8rQvmqiIC9HZ/o6W8FFzD/9qju55GAd5pjtBi+qH
itzW0PcRo/utvJp3dzve9Afcx/k2h98NOQpASqC5pxPkJ51S6fkKEW1T+XfHKhAA
jzG15/ikC77a+Ef2oLP6e0PAP8YCcyvNlgyfV/XnTMN0FSDkHbGe9ERlPFoW3th3
gqBYyKhYRgrer1i1/anPb1h14Ym4oyUcxQjHEGar5ExaM7GnfLakl6vquIH0JPIz
kZU8e3V6aUNpW33pqxzSUAaZdl5F/zddN9T/7T7BjvcYTWjtmNM=
=5ZDk
-----END PGP SIGNATURE-----

--Y7eMrXGuAumsLOnu--
