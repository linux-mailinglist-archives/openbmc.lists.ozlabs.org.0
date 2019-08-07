Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD1083E6F
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 02:36:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463CHL20GHzDqvd
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 10:36:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TnuDr/2h"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NcXj2Y0X"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463CGZ2ZkGzDqfs;
 Wed,  7 Aug 2019 10:35:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 44A004C6;
 Tue,  6 Aug 2019 20:35:44 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 06 Aug 2019 20:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=CZQ9fy4bGaBJTciSXCw5R8GomHrVEfV
 S66D46ri1O50=; b=TnuDr/2hZoFEeTFZDsK5eI+/TF3Zr0olB70M6alI8oO6H9z
 FdL40k4b/LQeUGml1uVNSzUk1eRXkBCe9M/uXTLSYbslTJ6yMdYTUnHQy2dmUNie
 mrY0Mq3AT9SHV2unfYXodJ8JXy/u1zsL/0++aFr2XTBFSMX/15iZ5OsgOsrrnXad
 +fKpiO6/IU+67QcwnbR1ADHt0HFCNHpqLR+UlAmlQweEY93Qt41ySoLEXZKezn+D
 4XyzJ2A1GaPSqapSLW6insh0i0MbUUp5SFWK85wWzyjD9HOdkDIMZJf1+HyvZTAD
 f8rIEHW86rNXmqJlx0gE+JpikIYE7hEru1M7rtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CZQ9fy
 4bGaBJTciSXCw5R8GomHrVEfVS66D46ri1O50=; b=NcXj2Y0X3VwUuqjRP/4+z9
 YPSTYXHY0jFM2wUiwFMMYwzaOqFjLSFcp2h9rCYxnMnST7qz7nq+uS6Qyqd8y21D
 /oLvQvgc9on752SCnvPFI9VoYOC/N0e7irJe8aTpuTw41Lj9Ju8TganWV/zzdXnK
 3hvU9lDOt5kHGm0w9VJJvo4MYYqnu8YeGyTNSMTOiHgkFbe5rMJRpeSLfjFEkgMW
 hz7+zsYlzq0hHxdt9/1GMcAist1Xf26zQq1lmFRgu07QMjcNGSC6hTJbXK9ivO1T
 gE/71SD75xfRNi5DOuygvXzgLyH6kb1+2IEXK1hBclYW1zZMANQP9R9+2pHQNDbA
 ==
X-ME-Sender: <xms:3hxKXQImpMul6c42CY4tIMPcYm4J44HTpMQ1095tL-vPyfoZNI6siQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduuddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:3hxKXZFZRuRPF8Frq_zT_iscIX8zlfIzjN6kBNokq0XrZtWbJyeqUg>
 <xmx:3hxKXeDW0FfgKa1Qks8BB8DWLdSrBplsZlyO703kpmfdiBYghPpQJQ>
 <xmx:3hxKXRFwFkqHfU3wU-h0YvAIrwXW_Yb1dar4V7jXKIIHAsN6fQIWPg>
 <xmx:3xxKXdyPAINqAsQZUjaifWPOkzR80ZmlgOL4_DDtHUj2PulRsFsJCw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CE574E00A2; Tue,  6 Aug 2019 20:35:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-808-g930a1a1-fmstable-20190805v2
Mime-Version: 1.0
Message-Id: <0e4bf79c-0e35-4cf4-b375-a023aa2cd034@www.fastmail.com>
In-Reply-To: <20190807003037.48457-1-natechancellor@gmail.com>
References: <20190807003037.48457-1-natechancellor@gmail.com>
Date: Wed, 07 Aug 2019 10:06:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Nathan Chancellor" <natechancellor@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>
Subject: =?UTF-8?Q?Re:_[PATCH]_pinctrl:_aspeed:_g6:_Remove_const_specifier_from_a?=
 =?UTF-8?Q?speed=5Fg6=5Fsig=5Fexpr=5Fset's_ctx_parameter?=
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
Cc: linux-aspeed@lists.ozlabs.org, clang-built-linux@googlegroups.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 7 Aug 2019, at 10:02, Nathan Chancellor wrote:
> clang errors:
> 
> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2325:9: error: incompatible
> pointer types initializing 'int (*)(struct aspeed_pinmux_data *, const
> struct aspeed_sig_expr *, bool)' with an expression of type 'int (const
> struct aspeed_pinmux_data *, const struct aspeed_sig_expr *, bool)'
> [-Werror,-Wincompatible-pointer-types]
>         .set = aspeed_g6_sig_expr_set,
>                ^~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
> 
> Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> changed the set function pointer declaration and the g6 one wasn't
> updated (I assume because it wasn't merged yet).
> 
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/632
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

That's exactly what happened. Thanks.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
