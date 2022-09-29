Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E35EF7BF
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 16:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdbYz4BLkz3c6N
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 00:37:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=PVsLbysE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jVI56nH2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=PVsLbysE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jVI56nH2;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdbYV14P8z2xs1
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 00:37:33 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B15155C0175;
	Thu, 29 Sep 2022 10:37:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 29 Sep 2022 10:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1664462248; x=1664548648; bh=ZgTU/ZlfGZ
	IZoqUAu6Cr099YFcJ5po/GBlhQz9M+xGs=; b=PVsLbysEEGGP6qR1fqYXcKwFIF
	LD81NFj8iAM3V0Y3XI8quP7Ip1V4+ZHrevsL0ajm/74YEXiZnd0lmFyXWM+w+jjJ
	tOpoeNHkIyfKSB/X508rjtNVGXcn4W0zXE8nNTtQ7++MMzhtHo4cW8GYkAmitmJ5
	pKYWXb45FUiDeEGPY3KLlFSQyniJq2IwYPqC6ToFI56sEnd3ITyFr91cSj8bJnzt
	4UH853vL9kRJtVy9lgJ/BXTh+ewZVQyIQ4ILxRQ9t5+38T8pNf7PZOZyf1L8LQtu
	UgQaJMoiOgCpSgF1NLmsTHsDypyz566eWDHnaiiX7IqytX//qHKqJdxLxwfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664462248; x=
	1664548648; bh=ZgTU/ZlfGZIZoqUAu6Cr099YFcJ5po/GBlhQz9M+xGs=; b=j
	VI56nH2O0/PqMEge9ZJE+ndZgi0Ic1iu7qRjHQTVQ4m3KHQXS0cnG38WB/qTIWYO
	NbKe+n9fV43kZze2WGn73R3bk67Ud71WX1gsUCIPwPaCszRl1ss5Dn0fgT7Ow941
	u1O51pP+PhY93c2x0EbaAaboG/KUY3W4oF+IHrx0HNzuxYH8Mg3oDs6Zy2j1kHRV
	FxWTZzh/PSyfxPOFJAohhfOimtOzRT9EdSz2n4e1owfmh8LkO/zB1vit1mWl64Q6
	tvjrbv6WhbEafa2W+AAxA+txbcAU/n+1TZuQLIfeiUf/OwZk0d9RxrqYmENVU6yG
	Nj9pLmJjm3MEStv7A1v0A==
X-ME-Sender: <xms:qK01YxRQ10ZWDk1t58ecu1Rj6zfM9Y0tQesVhLs2WM_JQs66qxjvBg>
    <xme:qK01Y6wsBQ75ZCIzxRBqo2m4PkBI1emoSzn0K1jwiCJT30FpsVqdtFpgRw48ehE7j
    pvC9nLrs9FYgnmemak>
X-ME-Received: <xmr:qK01Y23lRuzaxHu2tZN7T1pYBd6UHCFJ5uCDgvc8BVy8RREdyOFTPwJKrSObZ28dJuF_xY0eRrx-SeqVn0uE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:qK01Y5AJr5ezstb8MdGG7JvVbAKEO77p9nVSidwclylO0hU1fXYprg>
    <xmx:qK01Y6g2IsXplXz1trqZQSih3wzpobTECi0VG0vbnLnynVMXICxWxw>
    <xmx:qK01Y9rRckDlClAKp2pyArzkhTmglNa4DSzWmZ9agZmW0fLmpIU35w>
    <xmx:qK01Y-a2pzGaMoBF6Gy60VcT1L9FEXV9mv4wR5rejJfKYpNT3kDRJA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 10:37:28 -0400 (EDT)
Message-ID: <2c5f9b5ec9589fe531e771e4c8c8a13f77cec977.camel@fuzziesquirrel.com>
Subject: Re: Wiwynn's updated CCLA 20220927
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>, 
	"openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Thu, 29 Sep 2022 10:37:27 -0400
In-Reply-To: <HK0PR04MB3348E51D857FFA157A24750AFA559@HK0PR04MB3348.apcprd04.prod.outlook.com>
References: 	<HK0PR04MB3348E51D857FFA157A24750AFA559@HK0PR04MB3348.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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
Cc: Aldofo Lin/WYHQ/Wiwynn <ALDOFO_LIN@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Delphine

On Tue, 2022-09-27 at 02:41 +0000, Delphine Chiu/WYHQ/Wiwynn wrote:
> Hi,
>=20
> Please find the updated schedule A from Wiwynn attached.
>=20
>=20
> Thanks,
> Delphine

I've put this in the CLA repository, but there is a "OBMC Wiwynner"
listed in Sched A.  Can you send another with that removed?

Thanks,
Brad
