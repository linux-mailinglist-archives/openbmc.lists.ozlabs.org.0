Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B447650D
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 22:59:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDq032ZKbz3bhh
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 08:59:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=UTMHkvJK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=V7R38EvD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=UTMHkvJK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=V7R38EvD; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDpzV6NTYz2ynt;
 Thu, 16 Dec 2021 08:58:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 675BB3200B23;
 Wed, 15 Dec 2021 16:58:42 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Wed, 15 Dec 2021 16:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=X4Mjz1gSwctzS5BqbmLnHFsBnm1B/10
 sggy8KjqskWk=; b=UTMHkvJKfYL3boy2Zb/XROQDALb8tpmPcCzI2vckncPpz8n
 3aMD3d0cYXVMPpr1U0u7DwU2P9PrPP0GGl+ss45FDgoxCXDxW8sGC1WFgqZNivc0
 Tdto0pcAE772biGs/Qju6VB2xGGyk85zCxDbzT3jCRxT2iMK0vYwiVLxNTuF6lao
 Y16TUcx7N9giVRqjL8VuuX1H4wyZhfB+hniy6CGm4PxB8hjs/V2BwAVRh73Vckpz
 wl9yojO1tA7zMKfof+OU3oZYUXBl9/Pbrs7j11iKLBp7q09xeavrGXpVqx3VOkrK
 a2b9NH9gJGw0J6iv3OwXy/9B8urFcKl3C1FDB/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=X4Mjz1
 gSwctzS5BqbmLnHFsBnm1B/10sggy8KjqskWk=; b=V7R38EvDn/4qcJsqKbiCQt
 3TwCeujb5SbMkkNQMjQZW4lDJ82rxdcfIXHgYoxCYeukMeR/W4cJ1N79MJtCdrm4
 821BtzlH8U1UK1qjWg4ToJmfmLP3a8VMlOmzVBTqT6uhRzH3FWjyp9jWvadsDt6T
 dMcMqIo07sIx6vGuvVR2YD9eEA8pF1dQBtdyy0BqsCVY10xJW/E0UOT5f1gQcbOb
 Ji+MRi7mCtVAYdZFVXEzedxvU5ebMAmEAIxc8VMvX/8llMh/cNXnpc7utGn2KXu5
 UTfkafObVt0Xo4I4JUvDmacQbOyV9NRut80gfnyyORZGe8MAaVFJ9CikYi5H2vCQ
 ==
X-ME-Sender: <xms:EWW6Yb0prKNAE7wES0yXr--3npTfNq6LLL-KEXYNwzOb-Ps6t7aN-w>
 <xme:EWW6YaGv_wWjopLw9ItH2eJdj9o5Ob6bwdU7U9_nRBfnEyAzFfwk1HyyYoRcOoKAL
 gex70hZvLW4fW6eUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdduheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:EWW6Yb7FdMNHuD0UfUiAjvoH6yAsZDweHNtNaVsAR4nfReG2VgY9pw>
 <xmx:EWW6YQ1SbHbfNRbfKbFgXedaiclyeUlhL1HvQvBkKNAcvDM8KdGMYg>
 <xmx:EWW6YeFhFuTZFbdPG4-_hkNTt3qwh98mZxzzUBWVPiDncDZvV7lJ_Q>
 <xmx:EWW6YT54G1zO4o4wGZBnY6wqKO5nharSRNEPA3RYa16V8qnyDJc0tg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8E9C0AC03DB; Wed, 15 Dec 2021 16:58:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4524-g5e5d2efdba-fm-20211214.001-g5e5d2efd
Mime-Version: 1.0
Message-Id: <05d64453-09a3-4399-bd8c-595efd185ade@www.fastmail.com>
In-Reply-To: <20211215214022.146391-1-julianbraha@gmail.com>
References: <20211215214022.146391-1-julianbraha@gmail.com>
Date: Thu, 16 Dec 2021 08:28:21 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v1] pinctrl: aspeed: fix unmet dependencies on MFD_SYSCON
 for PINCTRL_ASPEED
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 fazilyildiran@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 16 Dec 2021, at 08:10, Julian Braha wrote:
> When PINCTRL_ASPEED_G* is selected,
> and MFD_SYSCON is not selected,
> Kbuild gives the following warnings:
>
> WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
>   Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST 
> [=y]) && OF [=y] && MFD_SYSCON [=n]
>   Selected by [y]:
>   - PINCTRL_ASPEED_G4 [=y] && PINCTRL [=y] && (MACH_ASPEED_G4 [=n] || 
> COMPILE_TEST [=y]) && OF [=y]
>
> WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
>   Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST 
> [=y]) && OF [=y] && MFD_S>
>   Selected by [y]:
>   - PINCTRL_ASPEED_G5 [=y] && PINCTRL [=y] && (MACH_ASPEED_G5 [=n] || 
> COMPILE_TEST [=y]) && O>
>
> WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
>   Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED [=n] || COMPILE_TEST 
> [=y]) && OF [=y] && MFD_S>
>   Selected by [y]:
>   - PINCTRL_ASPEED_G6 [=y] && PINCTRL [=y] && (MACH_ASPEED_G6 [=n] || 
> COMPILE_TEST [=y]) && O>
>
> This is because MACH_ASPEED_G* depend on (ARCH_ASPEED || COMPILE_TEST).
> ARCH_ASPEED enables the MFD_SYSCON dependency, but COMPILE_TEST doesn't.
>
> These unmet dependency bugs were detected by Kismet,
> a static analysis tool for Kconfig. Please advise
> if this is not the appropriate solution.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks.
