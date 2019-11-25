Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6E1085B2
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 01:03:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LnLc6v3KzDqYW
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 11:03:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CpsQQPIh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LGOno1P+"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LnKt0tjvzDqXr
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 11:02:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7CFB15C3D;
 Sun, 24 Nov 2019 19:02:54 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 24 Nov 2019 19:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=yAnKxPZbRoo2OEW2NIbW2/4bJIIdzho
 1/YK4gE1VRSI=; b=CpsQQPIhPJ/jYdZjfnThBWlUg781MVJEU4QU+iJ6hrboGoH
 BQsmQIfd8fPnBwmdp36oTQWfl4ne2rOqyYGXRZaxw6DBTW+RxHrpQ4TeqnR7Da04
 lYHKG8nETc29H3Sqbg2tcjWiKXGA6jDKGSEXWYjV+YmwxjXox7FMo0d0K8XFy6/c
 +Tfot/aRG3tRp6M+luzjlzvTyxDTNot77hdK0Idw1dT5yHkLatejQxgeFx44waTX
 2KD2uGu1bpHNyt/0F/BproROs/moImh4jCuyJkC6s2ZqHa+N9VA54Hlv1bOQNcBv
 k5Qzt2H9cRVrCdapq4hTAWkyFOzpjhGSJZXmcpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yAnKxP
 ZbRoo2OEW2NIbW2/4bJIIdzho1/YK4gE1VRSI=; b=LGOno1P+W3b/rePYylNzoK
 bBxLTrKmyFUTwlm86ughlr1HMuV62A2DQuSVMLFgLMY2SYdzXBepH/jbrB6d+azZ
 9/F7fBp1ZzRQ9uIt1FYUViwoSYRy2ZSsckdengfnTNJWOIDwqesJGXjRgZIRqioU
 +jhN5tHyiFhurj2b2HhHQOiUrR1TNF6Uf3CVXadfrDsMSzz2lVSnA2W/rWiipQmh
 LyLJPjIu9e3sdGFJuMZjIvkJMQnZHooYsJmvt6pG2gCRGZNzi62iD+08Q2m6YOSd
 I/N8c4nSwHGDeJFvbVPeWNJ0/O2nbW+5mM0uWiHys3Alxv8yMyVV0hSlrWVsiEVw
 ==
X-ME-Sender: <xms:LRrbXWUvwxkLfpXcaYQh4THV3cG8v3qN88Yz_EoLsJIK87BcFDVPOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehledgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:LRrbXRRKtLxr4ZWaqqIOYvR1Day3I9pQjOgnBMXSL21zCHwcghRwOA>
 <xmx:LRrbXdtkdba12QZVYsGYAO-y3uHHrs5UV3A-z1MfsQoQd34ej5nMRA>
 <xmx:LRrbXaMaSzHburtqGZ2qO0hvR3WyKvrgLNBX-y1tssUWxrmtQ9mJIg>
 <xmx:LhrbXaxeNjVY1OcNxmMWetzIFofI1MOqPtBc_xvODKv-MQJ2oZGIUA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 59B21E00A3; Sun, 24 Nov 2019 19:02:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <ef65b741-baec-484d-a5f4-984452e9d4e5@www.fastmail.com>
In-Reply-To: <20191031014040.12898-1-rentao.bupt@gmail.com>
References: <20191031014040.12898-1-rentao.bupt@gmail.com>
Date: Mon, 25 Nov 2019 10:34:22 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>, "Russell King" <linux@armlinux.org.uk>, 
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Arnd Bergmann" <arnd@arndb.de>, 
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Paul Burton" <paulburton@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Mike Rapoport" <rppt@linux.ibm.com>,
 "Doug Anderson" <armlinux@m.disordat.com>,
 "Ard Biesheuvel" <ard.biesheuvel@linaro.org>,
 "Benjamin Gaignard" <benjamin.gaignard@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, arm@kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 "Tao Ren" <taoren@fb.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2]_ARM:_ASPEED:_update_default_ARCH=5FNR=5FGPIO_fo?=
 =?UTF-8?Q?r_ARCH=5FASPEED?=
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



On Thu, 31 Oct 2019, at 12:10, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Increase the max number of GPIOs from default 512 to 1024 for ASPEED
> platforms, because Facebook Yamp (AST2500) BMC platform has total 594
> GPIO pins (232 provided by ASPEED SoC, and 362 by I/O Expanders).
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Hopefully userspace is not making assumptions about sysfs gpiochip numbers.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
