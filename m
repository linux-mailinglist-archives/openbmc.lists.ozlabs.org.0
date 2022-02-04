Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B04A9472
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 08:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqn6C1QPpz30jZ
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 18:21:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=cqL02SoB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SRpH/wsw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=cqL02SoB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=SRpH/wsw; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqn5j4cpfz2xvW
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 18:21:28 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5E9F73201F1D;
 Fri,  4 Feb 2022 02:21:24 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Fri, 04 Feb 2022 02:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=PfC7rpcxkqdDvDDMzb0aR+oH1DO56wR2liUoqD
 TDQ18=; b=cqL02SoBC+OfcCYoUUJtWipLJudkaJpnn/E0DoWMUyqe0gO7osKe2p
 N8v+YWw4Ike8VSLgd/A2wgmwHR/xPprBVXmhBFzij5HK2Hip7RoOEEolQ2Zjq5Qz
 7Lz68mVkdM0NE7j474IrXX+mlel55f9ecFr1/gDikZ05TBF2xRjpnn6ZlgxEh61X
 94Bu8cJPKrHejsTGrJNfis1qC5ZhjGzbtz9BHE8QtGNZHi3tF6ZBMcNRZe1FAGmQ
 ovF4+2HKsUw9p3aUGbubMaDGt83jIqE79ywir+psYi1HtPntRBNEnGHEWwlcMwI9
 MiMr+hpeMr6opQYwpgLlBvZh3v84TuHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PfC7rpcxkqdDvDDMz
 b0aR+oH1DO56wR2liUoqDTDQ18=; b=SRpH/wswZ2zhFBLN+M9AuK5ygnnmymMNc
 9eLGM/yrefm914Lqv1ui62HiVHql2Snm+spR1t5TEG0WogvtSUiXVI4KnapzEd85
 li75gaj2u0JuUczIemcIQY690NwdVgWqEH1uPnmmgci3TTed7MJadf93JsQP4Ze5
 KduI86HMpZAYi9L6CdnCv/ql32kGt1LVHObSIqq+D/zq11yn9VCgftDrU5ne+I8L
 2jLIXXg6q4paNTwuUHm3FS0Qnli+BdeTemBlC6aKR/9uWN5AOLItB6LSEcNcgibJ
 MF/bx8TRUfnhKn2H1GxAd1kDn8PiUEO5VMgutqK8OHHsEmdJNA+fw==
X-ME-Sender: <xms:89P8YSyXEKCJ8mWnwgRKwjqT2JC4Gd7wKPCHXq5vatidsmzVnRPk6g>
 <xme:89P8YeQBaNv3bprxpUD9DG7rsWmMEtflpDDNynaEnDplhTO1y17G6P0w81BXnp23t
 Gi8OJG-kCv_N7MeYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeekgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeelkefgffekteejhfdtfffgve
 ejvedvvdevgeduudffuddukefhhfekvefgiedtffenucffohhmrghinhepghhithhhuhgs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:89P8YUX-i0rBOm3kl17pu20YOGFqUyoKudf0CiSk9tdhBIdVTl1Y5w>
 <xmx:89P8YYitjAb6AWU7C_000gp53DWf_4gN7_b3GDiaDHoCSq38_nBdog>
 <xmx:89P8YUDXcVPxrGcv_tlO-W4of0MNMppGZjbPfDhVRq5NZvejA1dusw>
 <xmx:89P8YT8NTTNEMmhfbdOtaMcn04q-5-sOtFs7IpRd4gw7iQv_Vz8UZg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8CEA0AC0E99; Fri,  4 Feb 2022 02:21:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4586-g104bd556f9-fm-20220203.002-g104bd556
Mime-Version: 1.0
Message-Id: <819fc231-cb0e-41d1-ad46-d7957a4c48e4@beta.fastmail.com>
In-Reply-To: <231809.1643915597@dooku>
References: <5516f17c-5fb4-875f-fae1-00d86923bdae@linux.ibm.com>
 <de58b515-0f0b-4e49-4955-f9144896d313@linux.ibm.com>
 <231809.1643915597@dooku>
Date: Fri, 04 Feb 2022 17:51:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Michael Richardson" <mcr@sandelman.ca>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday February 2
Content-Type: text/plain
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



On Fri, 4 Feb 2022, at 05:43, Michael Richardson wrote:
> Thanks for the great notes!
>

You might also be interested in chapters 9 and 10 of https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.00/SDK_User_Guide_v08.00.pdf :)

Andrew
