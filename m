Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2338F734
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 02:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpwg60bj3z300P
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 10:58:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=oHNG+JY1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qXrxRe8M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=oHNG+JY1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=qXrxRe8M; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpwfn0qkgz2xv9;
 Tue, 25 May 2021 10:57:53 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E7899580B43;
 Mon, 24 May 2021 20:57:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 24 May 2021 20:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Ez6GbgXW+KJVgqjOVVGUMOYbeCl1lm6
 ncNcaQHWbV1w=; b=oHNG+JY1pb/luEgNwCQ6JiwbJrmTRM59ry579jqlr7kz0Eu
 vvSY16Z8fu+k3waz38JEQC0qpDghrb/aoa+20WdfIsdRSvihq7RkgsNQnq0xxWK/
 9eoEMy6I5eW0t2gX3JZD7WrjJ0nSCKzcK7/7IS8QiPJdu38sWGmquQvnqhMMxeX9
 yeRWv0sIeVoniQJrNH/e86iYGOPzIx9eU2Nr4UuVi/ng31wBtCjbXgAsqug0fGhM
 /bOS9BUxG6g5sGaBbbsID65ae3Owt4oC9NBI1x5atIEm4jb/2wl/LxEQqlqSd666
 CNMgg3c4ea2vEHjGvcD3uFQ0iHCCl6Q2P6o9R2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ez6Gbg
 XW+KJVgqjOVVGUMOYbeCl1lm6ncNcaQHWbV1w=; b=qXrxRe8MihRW0X8Hh2tMma
 sX512X6XvkKSb1kmBNSwYkYarCNX/TroVBRJPNVvDIBiMuAvaQzFMEWgvazX8d7M
 HI7aQrVWEsKFcvK1ZsQoZ5sWHBfx+gBmxJxbWpPxrsJARdMuTEZJ8yeJUBOQBEpT
 ODdxJ/RqKvB5T/TCDQ23KEqRKglORyDNi6dQpti6ZkXQBpwLSLaNLG7ApahgVzHV
 YVG/dzPzHgCfenN/JOfT9O9h81rnStoq6ToEUZtLjS96L8DrHINvnFNJyVfH5kss
 a/q5RPVF2AWBaCjFxvPqBU1kyglYO2sfagE8gU00Lf+nEdV7g6FCPX0wAo1jS9vA
 ==
X-ME-Sender: <xms:jkusYGBcka0b8Ferkh7cKiiz6SjsdnVNDONZW1_7Xhs_y3gt6MBYIQ>
 <xme:jkusYAixWDChV6nf6ZaJIu7TTGUJh5Tkw7kuNfoNm6ukuywRnxeZxu7obk00vAMw4
 QpDFr_DUPfKk4sW2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:jkusYJnokF_mtMSaLRDVjoQDIFgVycT7pH5YLHvYNKiJp6iMk6_JrQ>
 <xmx:jkusYEzrm0HEqSEWTqrvouU0LOY0qqd1B4pV9CNMhFr09f2xHQM2zg>
 <xmx:jkusYLQ7HRPEMewaSqv2KVoYIZd0OZDiWOI4vsxankyf5OA0B1T6sA>
 <xmx:jkusYAIj2jKiBFtasHY2dxyaCWB_CKa-Kgz_67XXxSeRCVqab44vsg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C1662A00079; Mon, 24 May 2021 20:57:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <ae8b0c3c-c090-47f3-b776-fe756f94f361@www.fastmail.com>
In-Reply-To: <20210524111338.16049-3-steven_lee@aspeedtech.com>
References: <20210524111338.16049-1-steven_lee@aspeedtech.com>
 <20210524111338.16049-3-steven_lee@aspeedtech.com>
Date: Tue, 25 May 2021 10:27:30 +0930
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
Subject: Re: [PATCH v1 2/3] ARM: dts: aspeed-g6: Add pinctrl settings
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



On Mon, 24 May 2021, at 20:43, Steven Lee wrote:
> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Currently, only SGPIO master 1 and SGPIO slve 1 in the pinctrl dtsi.
> SGPIO master 2 and slave 2 should be added in pinctrl dtsi as well.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
