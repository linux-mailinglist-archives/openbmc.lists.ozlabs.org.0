Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70B38F73E
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 03:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpwk225Kpz3021
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 11:00:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=LorQqEfF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EiWSMMf/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=LorQqEfF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EiWSMMf/; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpwjk31l2z2xgF;
 Tue, 25 May 2021 11:00:26 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3760C580B59;
 Mon, 24 May 2021 21:00:24 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 24 May 2021 21:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=MuuXmIqjs2b9Wql+ivIaAaXhuLI9xH3
 VV1Cqz+QjxZs=; b=LorQqEfF7U396gS162c09TdyeNqdizOd6xeH/vNcBbyROHg
 J/rvox01HTmL0jc9JsOt/vfWVXKOLiF8F36nnN7AcrG7vhRA/liF7PLsFpCsMdyr
 KpFcnt3Fmem2gak6MKB+qcVZ8Y8oJNAZKBr6c9Sb0NP0Eb4G8QjlC/NGri3iKt0J
 cU3ICrNfe+Wcv05d4d0X03U9H6im5dN45TT18GK6LVKxPobbLB0l7ooeocSw4gNu
 UVz/J/MP8zKzCRofVUGlKIyUZjrZZA3Yl7qsEdcqm1U8j0em/NfAkVEejWpf0il1
 1Cj3fEqU11N207Ux0ksiZm0rHKsYOkFgRmFh4KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MuuXmI
 qjs2b9Wql+ivIaAaXhuLI9xH3VV1Cqz+QjxZs=; b=EiWSMMf/E4LAR9llQaNh+d
 kDFyDuFh7nbbOYr+s758MyQhrnIE6KkWLflZlJYefI9GLL50m/lwWMXMgNFHZ5fq
 5Uy/ayzVKLRj35ddWMu03G75EJMJG5v4KFTXpxhrTiFEX+VexABUp4+R2Ow0MSU9
 xZJxgnHCkWNtUiCme32H1XQqeCewAL2kFmpVG/H0DllNIkeVjULFs69b0SNDj9hs
 KUNoGtNhSV29XPZaBm2wtSdeYEODX2yGaM2UxrrId81re1BIMhD3ZaHSIsJm+ho9
 9O5KWm1JEGg3Aq7GJKdbWq80BkxmF9JcD0Tg6Cp4yA3x34GwOCd7oXGsu1xmPITg
 ==
X-ME-Sender: <xms:JkysYD7VveHzst7SikTrfhAk1N1oIVYzNMMsY8nH7Few6CpOZQ-tcg>
 <xme:JkysYI6bh0zzqNdyCP36eLTrILmeD_H-9NDCWoKdNYxTG4Tvv3ZgsihUS6B4kAznp
 gBDmuy7FeQlFwxnHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:JkysYKcnx-2Fx7u0ClcsPOOGOLS-Cyi2bgrJATWsZn8IU1fQCZEo6Q>
 <xmx:JkysYEJYQ9DxTgDevycBMeAnRWYPaqZ2SeyHXihKiAedy-xmpPNdOA>
 <xmx:JkysYHKkEwOjefxvQhvIrajJM97BudoR3o8a4wha3GNoyIx9R9t5sw>
 <xmx:KEysYJwO_XcoVHP6N8odCGVRBGr2k0FiTRDxNzRrvv_rsuG5sDMHLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AFDC7A00079; Mon, 24 May 2021 21:00:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <5c4988d5-1928-449e-8eaa-e16448f820fe@www.fastmail.com>
In-Reply-To: <20210524073308.9328-2-steven_lee@aspeedtech.com>
References: <20210524073308.9328-1-steven_lee@aspeedtech.com>
 <20210524073308.9328-2-steven_lee@aspeedtech.com>
Date: Tue, 25 May 2021 10:30:02 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v5_1/4]_ARM:_dts:_aspeed:_ast2600evb:_Add_sdhci_nod?=
 =?UTF-8?Q?e_and_gpio_regulator_for_A2_evb.?=
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
> AST2600 A2(or newer) EVB has gpio regulators for toggling signal voltage
> between 3.3v and 1.8v, the patch adds sdhci node and gpio regulator in the
> dts file and adds comment for describing the reference design.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
