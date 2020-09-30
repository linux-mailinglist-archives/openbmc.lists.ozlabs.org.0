Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD7527E0E4
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 08:12:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1Qsc5sNpzDqTw
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 16:12:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=HFKL2AIN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=bls+tThF; 
 dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1Qrm09FJzDqQD;
 Wed, 30 Sep 2020 16:12:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 84FB5E89;
 Wed, 30 Sep 2020 02:12:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 30 Sep 2020 02:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=T6meKLBdgHnSi7cnfX0bFbEcbbDs7L2
 SA1qc5xApdl0=; b=HFKL2AINwPy0keGvI+uk5fG4akN2h0jNqzfWclKI8u6+biO
 V5Uph8OJXp4xhMe/yhnYTg2X16wmkNMcG1uwxYUWaCy5U1dbHqnnuWnHNkhVR0tn
 9hqwjQy7XeGoZ+Fsc+8Wm/GxyAFs/Qo6yCPZS14PeAu6C9G81XitaLKfDSj3qDxl
 twwgPmHc8jlk/jUTaSRqCBAzRWO9lnPWUR3wDbMDZp0k7Ya0AbnjIy6ytL/WNoZ/
 bcT4UBQFZMc4rB83EDrdD0BV6TUhxVG3MofnY0mV7Tp4U+vIqdar5fFBaYv/BEzn
 oAsxF0PkBcUGSV9lFFqvuRjQkC+tQN9ERJ6zo5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=T6meKL
 BdgHnSi7cnfX0bFbEcbbDs7L2SA1qc5xApdl0=; b=bls+tThF56jpLjZROL4XAy
 a8s3QfavxGKPQr1lm8KTz1erZjZ3h7HPLzX1i6kem42cCCZmQjoN8xDPDQSbgE3S
 Lwd8INGT6c8xvf3pgGrChin1wMZJUXroU9iFF/On1w1abeG9SiaH4BwpHj1KiEHl
 S/R6GBUzTNlYYN6rxYM8JMNeWITq/LC1mM2Acp6+UjsSXTxvqs4Tl44ojLSfk8fG
 YD5ajUYxVoUBvzF6xwss3n4wrbpNfYHVSOhF2at9Qc6EIAO1gy0aDlO+KtzgTBVr
 TnjmvuI0TFWOEcQO/kWvyPKEhAIhbugN1D1uNHXPtIsHfHYMNMnOLVIv1sNAriKg
 ==
X-ME-Sender: <xms:sSF0Xw9aiWB0TkXs5NoawmpRtYTxKQIFxBkO9fAgVbmkK6Qk_4f44A>
 <xme:sSF0X4vuLtFazVRdaQEq5lvpIqZ59BL7pbnyytxnN9Sux0jzZi2eRAZNoSU008oJD
 xLwwj2aDc22WmTsVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedtgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:sSF0X2DL0KSNdm1aUK_PFwxMLcU2oyW49LvvYB-t0mctII5cJTZ9TQ>
 <xmx:sSF0XwdEAsVz_R5t_LPMyo9KpM4-HvRpAHC8A9IJkoSH7_uwXu9b1Q>
 <xmx:sSF0X1MFze867YKvXvNurb1jzcnfSGm4Z8S7zbtipxIwWqLa58BYpA>
 <xmx:syF0X2GSG5eyirPCtSDinBrYWu80RCmg-kE2Vg5r71i33_pvVaRZoBNjoXo>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 38A07E011E; Wed, 30 Sep 2020 02:12:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <485ec282-568f-458c-a91e-14c89415b8e5@www.fastmail.com>
In-Reply-To: <HK0PR06MB33800F282095AA96884B2FC0F2350@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20200911034631.8473-1-chiawei_wang@aspeedtech.com>
 <CACPK8XcYvUj3W-CPzXKugp3wx7rcLEJ_8f2-Bi6V7QHZpopBbA@mail.gmail.com>
 <551926fc-7bd4-4a0e-8fcf-4675dcdba22b@www.fastmail.com>
 <HK0PR06MB37796D91EC7290A69F2655E491240@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <HK0PR06MB33800F282095AA96884B2FC0F2350@HK0PR06MB3380.apcprd06.prod.outlook.com>
Date: Wed, 30 Sep 2020 15:41:41 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 0/4] Remove LPC register partitioning
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Corey Minyard <minyard@acm.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Cyril Bur <cyrilbur@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 28 Sep 2020, at 17:13, Ryan Chen wrote:
> Hello Joel & Andrew,
> 	Those patches are more organize for ASPEED SOC LPC register layout. 
> 	Does those patches have any feedback?

I support getting the problem fixed. However, the series also needs to fix the 
LPC devicetree binding at
 
Documentation/devicetree/bindings/mfd/aspeed-lpc.txt

What's proposed isn't backwards compatible. We need to agree that a breaking 
change is the way we want to go and get Rob's buy-in. Given the impact of the 
change I'd prefer we don't try to maintain backwards compatibility. All known 
users of the binding ship the dtb with the kernel.

Can we get a v2 with the binding documentation fixed? That will probably need
some review.

Andrew
