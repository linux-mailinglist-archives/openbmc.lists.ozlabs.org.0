Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BFD38F9AA
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 06:37:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq1XW4PWSz3049
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 14:37:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=futuX7gO;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NeMLdSOv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=futuX7gO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NeMLdSOv; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq1XC6PmVz2yX3;
 Tue, 25 May 2021 14:37:31 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8DF82581068;
 Tue, 25 May 2021 00:37:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 25 May 2021 00:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=zFo1oGVlR9BWzHQX/BoXdwfOJEHWy/V
 aAoNOqIJAtPQ=; b=futuX7gOOBwrT6oJVQPSupBN1R1Ob4fVnF9YYDRvvjsQUMP
 Y5HHsGOGuTh0vmwxs9NtIMkwTGElxuuAWADC14Ujy2iOBxcZWQJ1UPAFNLaGJ+gZ
 17vy4KFu1mH1znFquCKgNEu/t4OOvKgA1o2g+ULakueirIA8UN2SOxSYDWbF0KmZ
 af2zsiYtkXjh1ruSbgtzeJdOqWhS2o2OU9Zjlx6j86EdTgGA+YeNIiFrBj0CrIqR
 ZA3LMfoQ++KK7Yddanj9/VBrqpDFJyFqtwdf6e8oh8RJ1Lb79/puVBbrAYe2ytli
 NnsjmmIewizUb5msxd0MxaQdC/8EShEAC5TAIvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zFo1oG
 VlR9BWzHQX/BoXdwfOJEHWy/VaAoNOqIJAtPQ=; b=NeMLdSOvPC0GVg8cTUC+v9
 NN0unXHXvIcxihEhFtLGFMQqiEKpqt9PHxr2fAvDhKfkmyt/Fckars9EPIy0phOd
 FA1DEGNzvET7uPlUxU6/4D4Q8QLpNwngQo+Ib7x+PLk/ocG1evLo8fXfQ59K4w7X
 ImnD5tRzFSzRJGjOme7BCzMUz/fxFJnCZgwoIo73V7P1oApyjCdnQWfpJCzH25Cl
 4Y5RxL8Gtc5fmnlrmcPw9DNogptN6F5Gdv15JQVoIbzpVVieSnjuunUcHfa+REXI
 LJfP6p5MwLnps3LF6QG9VW6VJ06rtZvw4Nzmp73wWlYFEivdnBcC17sz7F8TzPXQ
 ==
X-ME-Sender: <xms:CH-sYOD_4v8QbYfZqpFzj02pmQTjMxgoUCI9-H1D39NPv3FL-OEp_Q>
 <xme:CH-sYIhOAFAfnEUzB6_MwNLXuTItp2aKyHUO4auMoxKoclVFRBXub5hQ3MjCdBK6Q
 VZisNYOPOImxsNUQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:CH-sYBn4b6NkIap0_2dg9sPDWagHjtvUVTgnpxUQwsK0yp1i7B6uzQ>
 <xmx:CH-sYMyEgtlytQYMsItyZ4J_Lrleo2-RwgSz-EuqbrAOdJV_M4y4Gw>
 <xmx:CH-sYDSXNXCoVsCGPhXLZh5HDIBTFkI1EwVnwhiEja_o9shd-T7N4g>
 <xmx:CX-sYIJewHwr4gW-amogiccRpA1IQS5dfHR3zg0Gf5hUQHOU4Wn-XQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 76510A00079; Tue, 25 May 2021 00:37:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <7f673953-7a90-4143-a475-444a1096e55f@www.fastmail.com>
In-Reply-To: <20210525042736.10379-4-steven_lee@aspeedtech.com>
References: <20210525042736.10379-1-steven_lee@aspeedtech.com>
 <20210525042736.10379-4-steven_lee@aspeedtech.com>
Date: Tue, 25 May 2021 14:07:07 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_3/3]_pinctrl:_pinctrl-aspeed-g6:_Add_sgpio_pinct?=
 =?UTF-8?Q?rl_settings?=
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
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Hongwei Zhang <Hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 25 May 2021, at 13:57, Steven Lee wrote:
> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Current pinctrl driver only define the first sgpio master and slave
> interfaces.
> The sencond SGPIO master and slave interfaces should be added in

Typo here: 'second', 

Regardless, this looks good to me.

Thanks Steven!

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
