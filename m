Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85D3DEC7D
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 13:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfCg73yXyz30FS
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 21:43:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=HGcNQF7v;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=n8ZWmvhe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=HGcNQF7v; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=n8ZWmvhe; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfCfn51Fcz2yYd
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 21:42:56 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 0AF1C3200907;
 Tue,  3 Aug 2021 07:42:52 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 03 Aug 2021 07:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=XUiRw
 JMFY/QZs3l0M0PNontFvLyl4whFW8FvaHG6aus=; b=HGcNQF7vG6Ii7eO3VT17e
 t/GDWFngdcmjpYFAlV+K95HOxIaYH7bXmVU0MKcZSdb1BC0+uAJTNeT6u2apX+qB
 aZVAdUxMw8a2EfcQ8o5//Z92G3GFqsUihdf2ll8rc7eujF6Txtt8xuvZRW9czllv
 SUb96Rm8zk+BSXV+9VYzY+9Yz/l4iQs+qnsbJvOQ9NbhLLuKmtmksNHNOPALaiZR
 H7tiBOrGgia3WocHdjUGg/qQp4h7EeLiYlfM4cJAu7Rld8/Q2AY52uDHabt+O1Nq
 9iAl8cWZvHWD4Wo+QKlq9fQeL8pLQKyK2FTbKAdiwt9AdY/fWpum7l6QcGjIW5Ib
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=XUiRwJMFY/QZs3l0M0PNontFvLyl4whFW8FvaHG6a
 us=; b=n8ZWmvheapq72oETcTyvEMxwTxr2UkZ0hLA/g8pluO04qnTMgJUybT5Fe
 CIbTvVkedbpEwnUyi4KWI25mF3nnQl2QAMxL2hBWzfU63suWHi7/CDuxRLehChZg
 C6p5TtAgE7qW+pQj0dcr428qBt7k2UhmFiXtAOQ5FE8a073JOgUKM4wec+HlRMnC
 0U/aaV77YZtn5CnWB0FtZB7FDiMI3HLrsqOSKemDZWnB5VS2a6ykCTv+LRBSMFaV
 2r2o1HVCQcPF28O2wqcoejEy1Ak93DTwvY/Qg0vQraJetg3o/geLLJx41ek2Vedu
 AWk9DGNeOlCDkpQ4fohGZigqk2XoQ==
X-ME-Sender: <xms:uysJYVfXR4ViKzjjE2A8PsvVOcd3ZQJXbWmFP9dANjw-sFlDd9r8Bg>
 <xme:uysJYTP2OIlR5NvUL83v2G5WP88P66IBqCmGSwrCrh0OLafFkJSs6Ey9S5xQYJvg8
 42DfY_4GAOOHhncgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpedvgeekheegfedvhfethefhud
 etteegueeggfeiieegueehkedugedtkefglefgheenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:uysJYej91sJCJsKpIygMvt-dNL87ZECBCh6P2BwMPi8ifeKugWKzfQ>
 <xmx:uysJYe_3a6R0v1DhNgFQ_lH66Yq8VCG0RO-cBoNsMuYiNTa8JRBeHQ>
 <xmx:uysJYRsPURHq_AgJZCKTR-TCp8Mt2FRROm5RL1v2eI2yRaAR6WC-CA>
 <xmx:vCsJYW6cZMMjI02j4QcgDPFrexaLsm_VSZjyTG4TTJPFV3DtkGIlww>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D921BAC0DD0; Tue,  3 Aug 2021 07:42:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-548-g3a0b1fef7b-fm-20210802.001-g3a0b1fef
Mime-Version: 1.0
Message-Id: <8bb488fe-a2a0-4fca-b751-ab20db1f4578@www.fastmail.com>
In-Reply-To: <C552EA2E-A750-4E7C-A3ED-8C1B05B7228C@gmail.com>
References: <E8EC142E-B62A-432D-AAAA-661528534DAC@gmail.com>
 <C552EA2E-A750-4E7C-A3ED-8C1B05B7228C@gmail.com>
Date: Tue, 03 Aug 2021 21:12:31 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=E5=90=B3=E7=A7=89=E6=98=8C?= <wh800805@gmail.com>,
 openbmc@lists.ozlabs.org
Subject: Re: Module develop issue
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Mon, 2 Aug 2021, at 19:31, =E5=90=B3=E7=A7=89=E6=98=8C wrote:
> Hi teams
>=20
> Today, I try to install SDK, I can build and run "hello world=E2=80=9D=
, but I=20
> still can=E2=80=99t build the hello-mod module.
> Please give me some suggestions. Many thanks!

I'm not aware of anyone else in the OpenBMC community developing kernel=20=

modules this way, which might be why you haven't got many responses.

My approach is just to work on the kernel directly (i.e. clone the=20
kernel sources and add your code to the appropriate locations). Is this=20=

something that you can try?

Andrew
