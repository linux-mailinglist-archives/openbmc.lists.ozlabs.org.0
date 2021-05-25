Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4EF38F746
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 03:01:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpwkb5nPXz2yx2
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 11:01:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=R/1FkW2V;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=phbkoArz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=R/1FkW2V; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=phbkoArz; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpwkK2kwqz2xv9;
 Tue, 25 May 2021 11:00:57 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 184C0580BB0;
 Mon, 24 May 2021 21:00:55 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 24 May 2021 21:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=tlB8sHBuc7CQYQENRayo67UvAf5MKb5
 vqQRfVuG6jiI=; b=R/1FkW2V+NKHe8te4eCipQVg6piGfwgKsztRoBqdIXRFHlY
 0dXTDvdypKPuhYy7YYFVr08VQef5snpSWLwwJyKZmaKLAGXse/pGlvgeaW+lv51P
 kMaP4c2ZIzUsbvfHv+Ao0VQI/35S2kvJ/BU5V4AXzIASdFMb9F9aVmEDX0lSnrUb
 gGcBr0nhOTgV7FJMVjO5oY13OshoTr9PFQNTJMAIVyJQKuJypqaYufhNZANzIuKB
 xAwzRAbFhwaeUqehg51kSM325i0h1c9t63hwcSXJT3o3dzIg7p2azRqkDuBbVpLG
 2L+yxnykZDCJza6geyPG6q8ousURONJAzJvWgeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tlB8sH
 Buc7CQYQENRayo67UvAf5MKb5vqQRfVuG6jiI=; b=phbkoArzqHT9HgvvYzGaX9
 JLjUZt6j+RUO/AUamNyoosZ4Jo2rbb24nsVrgkkaX30+JddifmoXqVspAO20xYvi
 hIsdRl1HvlkO+DV469e1oS3jQfKSeyb5cJX2ej6nEiOKR4UeGBZQ0zjufL73YcnY
 3T3h+eBiDcV41Ald7bZNZgZJu5LswAi7S8dZvx2+s/5X3dBQt5c/aP1SA/rlQejn
 PGUtQb+d7faR7M9KY6YHZ2aOuPTZ/6ZDjNwMffk/+PSXffuLyoIRDuwAWhB1nRp0
 thpSSxatFlBIdPJWH3cgg64FYra7hVbyAUy+79c23BNMkR6oZ/dUoxU50V1OT3pQ
 ==
X-ME-Sender: <xms:RkysYNX7DHbu0U10dEWYl33E8Hu38019Zykfx2tTxN9hm8uSXnsj0A>
 <xme:RkysYNmzGhS9yoGW3ztgqf6hCZRc5MSfVtFtHnZO7zs4mJCh0lQBr8YeakBKzMU2h
 L0R9EyrIurVOtYCuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:RkysYJbhX37IBM65XUHbxpIYIv4U0IiiOVRvUqkYCWC-vsrXJa67IQ>
 <xmx:RkysYAU9q0KHaTIXmXotI-itEM1lnjdgZ_9h_zJhBTOelH8RvLwTYg>
 <xmx:RkysYHk9mw5uhE9hHYtPB3rSvHxs84nEJw1dVDY_jCawWe5bQsvMEQ>
 <xmx:R0ysYFf1ZaLXBv1K821xFX8xVTdVe04Oefqp2QyES3rNUwk_jlmrpg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id ED515A00079; Mon, 24 May 2021 21:00:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <db2ccd4f-03cd-42f2-b66b-e96f0dfbb596@www.fastmail.com>
In-Reply-To: <20210524073308.9328-4-steven_lee@aspeedtech.com>
References: <20210524073308.9328-1-steven_lee@aspeedtech.com>
 <20210524073308.9328-4-steven_lee@aspeedtech.com>
Date: Tue, 25 May 2021 10:30:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v5_3/4]_ARM:_dts:_aspeed:_ast2600evb:_Add_dts_file_?=
 =?UTF-8?Q?for_A1_and_A0.?=
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Hongwei Zhang <Hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 24 May 2021, at 17:02, Steven Lee wrote:
> aspeed-ast2600-evb.dts was modified for supporting A2 evb.
> Since A1/A0 evbs don't have GPIO regulators and SD clock frequency(SCU210)
> is different to A2 as well. Adding a new dts that removes new nodes
> created in aspeed-ast2600-evb.dts is necessary.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
