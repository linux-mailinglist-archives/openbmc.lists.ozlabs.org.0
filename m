Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1E36BCE9
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 03:17:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTkQm19kVz2yyL
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 11:17:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=t67BWMxB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jov++051;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=t67BWMxB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jov++051; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTkQQ1Wt9z2xYl;
 Tue, 27 Apr 2021 11:17:33 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 23BC75C019F;
 Mon, 26 Apr 2021 21:17:30 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 26 Apr 2021 21:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=EqlXC5QCJVyxuYSkaKuNoI5/S7ZixI8
 WET/kD4zMQE4=; b=t67BWMxBZ017WFGgFfktYcx8B7O3DWtPM/56AW+b1bGd5pw
 DqWs6NObelbDErvGiu3zSwLhp6Qz4CNnQNSzTE0Y/Ds+IjCg6JQ2y0FhH3aC9Gng
 8gCXF+FSCoTblmZ5FTReBJTpxfys0bubU5u2Sp/nMXAz9xgh9Q/SrJC3V3g+p4Yv
 xTzr5UQa9OihhGz3EtYYKsYleYuNbF9BKWrRMtY6UsF+Cy+AbqAnG15InBg1J89a
 DkXsC2XrNCemgv+XKexDLVyyWLPygkYezyG263QbPalc0WwYufm6AAcAFPMX0auh
 NC9VcTSvrgP2H3BnSDr76b1egBJexusxLovXDMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EqlXC5
 QCJVyxuYSkaKuNoI5/S7ZixI8WET/kD4zMQE4=; b=jov++051zpecKsRF+8iRbE
 Uq2IQ9hZ7LKJ42RakyYDE2XxH8pivmDVPWZNZPkhEHkHdgA9uG//MDAeXPO3N0Yd
 5glFu6E6ftzt6Ks31ofV4H9/JfZBQTjv3/Lr7lYkHrIiI8IokocmH9CRzncFGM4P
 aDIlH0UR9JJBfKfLb90bZd99zU3CYQQm5W+tNERwS5ZjrUlQ2+nglU0M5lQ399Wa
 H2or/VqRkXYamzeNPSguiX9HOvhNH5cKBoErFNfBokFcyzmVOv7jgJYjElHTaspo
 vwezyUkU2BNereIwif52uXwrGkinbasmu4yfV1oRypsE240bqZaR+8YPuxzeweBg
 ==
X-ME-Sender: <xms:KWaHYGfeHH6dLgi9rDU1YggPko1zFQLTnLQRh4VnPFuAf6GksPSJ2A>
 <xme:KWaHYANYBUOvE9mOg4pm1beDhujfwO5e9QUU8SRuEnin9_zO1Ol1dyVX7iwJcR-L_
 UNAp63Zk6Ae93vn9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduledgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:KWaHYHiDfQrZvxWOqR0rfIkENTlzx5N91sTXn8rvlUVlfte79WHvWg>
 <xmx:KWaHYD82EsPVpynUiGR45s0UjrIJQjxP8bMXSLXo_Uu2EPb78LEshg>
 <xmx:KWaHYCt31Ushe1kXvbPdZ6Yj5UxR6jmMA_oAaPZeMXr2gxBvMptHBQ>
 <xmx:KmaHYGirKlGQujUPf47_1n5CNkjLlnmdNBvOv2EyfbYJrvvf1ar8bQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 57E85A00079; Mon, 26 Apr 2021 21:17:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <3cb5cc18-fc03-46d7-be3d-3d132b42c82b@www.fastmail.com>
In-Reply-To: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
References: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
Date: Tue, 27 Apr 2021 10:47:09 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Souptick Joarder" <jrdr.linux@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: Fix minor documentation error
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
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sun, 25 Apr 2021, at 21:56, Souptick Joarder wrote:
> Kernel test robot throws below warning ->
> 
> drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c:2705: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2614: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:111: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> drivers/pinctrl/aspeed/pinmux-aspeed.c:24: warning: This comment starts
> with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> 
> Fix minor documentation error.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
