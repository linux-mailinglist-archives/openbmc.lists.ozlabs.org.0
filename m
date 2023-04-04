Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDFC6D66F7
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 17:15:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrWY20qLDz3cKv
	for <lists+openbmc@lfdr.de>; Wed,  5 Apr 2023 01:15:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=K4kM8dnt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BSq++bko;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=K4kM8dnt;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BSq++bko;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrWXM1THVz2yWN
	for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2023 01:14:57 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 016063200904;
	Tue,  4 Apr 2023 11:14:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 04 Apr 2023 11:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680621293; x=1680707693; bh=VQ
	mb4Pp6ni3hHP7hFLHi95ISI8E1XgqvXcUY5jsxHW8=; b=K4kM8dntFDIxF0jPWz
	2I9ZRNhnN1bL+NO+hc+TGjfjCXOfN4rZ20aztFqTf/CR0e6656UKtSVVeceEerTU
	Jzl4DkvK9nwB3T5m1HzF4+HSDraLaJ2tlf4SP3BHw4N7EdSMnJ8LnyOukFIH5kyj
	Pbds65kTp6ylyw4VflX+PTrOV9S/cZ5IsIS8LpVPmgG6iKNoXOdQNSlpZILfhgj0
	eEkzVCQEGhSzJY88awiruTd5xdRMejFeHn0F0WnMwXVR+LmASxCVym8EwKdgMkqy
	EoDw3jN2NFhs00A3kGse8YPEUeq94vOHx4exNSpiHQToy33zp72z7M4baqsgMUS5
	1AgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680621293; x=1680707693; bh=VQmb4Pp6ni3hH
	P7hFLHi95ISI8E1XgqvXcUY5jsxHW8=; b=BSq++bkorQXdaoLRuvwc/CbGAiKw2
	UUlx1+eGHs91zJ2lFbisZ0Yo0kD+9BDUa9REniprX/+vy+uSQ+hze0bzFn2J/2U0
	rVNRP0GtZH4lxCWZAF516VFqNISxTBbYyUt5nRhlly/YsNDHR2emeTi75z2DE6QV
	Mgbl0tZR6MtL7+SoIrwndXHTNdP3jOEcoUUzmCc2oxYwCANTDjXLX0jEcl/+WabB
	rQj3uf6tZnwehLdKRUVyFmGYF6D+SAAwtPMg2Av1ZLnut99J9jbCZadBtJBSyVba
	WXOmVD5NphnFsIQxWszPvWBZi8oZbhV/3WpaJxxTJ4jAFlphN1f+wWbbQ==
X-ME-Sender: <xms:7T4sZMLH3MbKP1TCJABZxABYfwl2g_mMfKUrch8NouSDHyPExP-duw>
    <xme:7T4sZMJ1R7Ksi9moqvTAPUwUHoa7eSZlI6xArMq8pVm46AR3di7Wso4SZX8WDvmyt
    rC2WmVTkKxbgKRF6Qk>
X-ME-Received: <xmr:7T4sZMvHcd4KxpV6jaAiY6NLycxEk82bw7s2RXYEmAAhTvspIMka_d_pvvFgBYaooby2uYTtCWMqeGyNLcZ1UDcGUPmU3Z1xPK4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:7T4sZJbf-W14WDltF_z-zlJOhQWu4AMtidwJvsHMdyL5Fn5jfbDD1A>
    <xmx:7T4sZDa70MDOrj9cgVv_kc_Ec3Awzel5CXIF7F8xocdFJE7cSSDrWA>
    <xmx:7T4sZFDWwIvBwJnrhq-thMZplp5veG4uKEHpfxbKLDEsNudvgmhFZQ>
    <xmx:7T4sZKwHGfXwU43l0Mc_WZMy8clBTvmmDVVmBsfFMtRFEcO8RQ6OxQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 11:14:52 -0400 (EDT)
Date: Tue, 4 Apr 2023 10:14:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Satish Yaduvanshi <satishroyal4u@gmail.com>
Subject: Re: Containerization Enablement in OpenBMC firmware
Message-ID: <ZCw-64zbxizKN5eQ@heinlein.vulture-banana.ts.net>
References: <CAGugOWsUK=2gE6iBiumKukO87b_cgAm2eT+Y=su1PPWow1-S8Q@mail.gmail.com>
 <20230328224413.GB18848@packtop>
 <CAGugOWvofh+f15KuMCkC97V-9Hn4QxuVTgw5aXkTM3bVNaeEDg@mail.gmail.com>
 <CAGugOWv=XF9UHLcgcr-W5_3DE5+w3EaP4i0eHe-nbSFVgJqsHg@mail.gmail.com>
 <ZCq82_K1gRdlM7Tg@heinlein.vulture-banana.ts.net>
 <CAGugOWtUdXVUN3p1oGSe=DS_g04YfxUoe98vfxOL6xYxM9=pjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kFFPFWdhubuW99fF"
Content-Disposition: inline
In-Reply-To: <CAGugOWtUdXVUN3p1oGSe=DS_g04YfxUoe98vfxOL6xYxM9=pjw@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kFFPFWdhubuW99fF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 07:54:51PM +0530, Satish Yaduvanshi wrote:
> Firmware can be containerized to get the more benefits.
> so is there any plans to containerize the OpenBMC firmware?

No.

--=20
Patrick Williams

--kFFPFWdhubuW99fF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmQsPukACgkQqwNHzC0A
wRm/7Q/9G9/YfUQxZk7v+wMsptfhtpTw4xIIpzYeeTVSIiKAKzPZuRGLVWReJigj
iBui/OjSS4pXBTKB+P+8yqBHYOnhmE+OYijad1+ffEq3ch+KVIrkI5zJszXY576V
dsO3pxPwLWmmNINRiSsgmdCZ6qYtfORKP6x2BmYwE4KAozzPxwdPtTbB+RkuElFd
6khB717PpcUXtxNcUpta1EOcVgMbtxI1/yfKwX6Wvalkcg3RQKrL5BrHFq1hA1bv
9bkFp/OcLjSEByNQne1/1iMBqu4l86QiCwroAVdiNQoKrBu26nCn3ICHLoSdkejI
fnDH37LhgB/0d5IWO21GgYtPISRldmtqsPwqYb3g/VRDJqT3/0H/8aLvDFaqSdZz
YaBylZCb+wjwqfj1SB8p/B8gFcBG0Cm3ge6t/WV5dyg7YsMCXeG+1u2v5ID7uwNi
H9QVFNrL1bf1tjbJ7TmZP/KgOX98g9pUGzxgIogFqyLZ83Itxm7eIX6H1vcyptck
Yxwe6cd7P6XFWgE3oSsReBOsMeQFIwtKy583jNt+mjpPr8LZYIH245qn7ItjcKda
JkO6GsI/wbnkKynMsml5tm3dgjdfso7iZbtMLV11zUZ+gXmYKiRqBKHyvmCT2WX0
n+XakqDFJFl/Mvg1bk9XD0oD9440pCDjC207ydSMqOIxlYyR+Jg=
=zszR
-----END PGP SIGNATURE-----

--kFFPFWdhubuW99fF--
