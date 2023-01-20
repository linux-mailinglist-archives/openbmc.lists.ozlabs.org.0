Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B3674937
	for <lists+openbmc@lfdr.de>; Fri, 20 Jan 2023 03:10:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nyjdm3Q7Wz3fGP
	for <lists+openbmc@lfdr.de>; Fri, 20 Jan 2023 13:10:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=RtvdCubr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jmXdcuw1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=RtvdCubr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jmXdcuw1;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nyjd056DMz3cFD;
	Fri, 20 Jan 2023 13:10:12 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id CFAD25C0045;
	Thu, 19 Jan 2023 21:10:07 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Thu, 19 Jan 2023 21:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674180607; x=1674267007; bh=pnns9lOh0+
	GIdk6jiwVH0+nJnurmy6WQSI2jQ7YKUHE=; b=RtvdCubr/5zbN6z4f11I+/dx0h
	cE9T/jhovRak6vKBLpnbET178ecRA6JBVxpC3M1wcq0VYeOfsxlFyIysqMvNi6u7
	hi1zmb7U40dcpIeT5jRSA6x9MIA1tT/7senzJdttTEiq/7zcshqznVaB2biJdtOi
	tcALXd+hVgRzg9pSwP1q1rWtILjCYbGG3O8ArETqXjvxDxHg01hGTLpaUbKNncO0
	mbwOwrurZ2Knx2Drhwih7riU/ZF2VRNYVDJyNUA+0kmelr2RwTG/91U15P0Y4dwg
	rVavxeAn7uWpKoDRaGloi0XBCVuLerlaNe+hehRDO/G8snWWK7xkqWLP7exA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674180607; x=1674267007; bh=pnns9lOh0+GIdk6jiwVH0+nJnurm
	y6WQSI2jQ7YKUHE=; b=jmXdcuw1So6AdCt0QM5o0UMBMZ6lJVXsk1P2RqB5uWJB
	iS/q/7teKVKsxaf7ltLapeDQPQ/cm3YJPVGn/4tXwaRzeyDK2iPcH5EhKVzb8mdT
	F0avdag1JDCYjV+M5SnPdzxFS7igio/hc/0UXqZfNGR5sw5o0BykOKfKJ7KFMahh
	oveHStpsr/v8Xlvt/KksS2vjYn2Exzfd56lEUionTIryQb1tWZJlmjqbtz+P7cse
	R+o0o2nhMlYBOJW1fQaxXhEprft4GqRCNUB6odoC8wrST6ITDBR6reOUPCwVwC/F
	oNIVrcUreZUtx6hz5x6FNOo9Ya7g2wO1ZXWurXbA9Q==
X-ME-Sender: <xms:_vfJY74skrozPaNqFM06HFI83YyNE3mS7_Lu02aucCOb0mCogLRmuA>
    <xme:_vfJYw7djQ-ap10FZU1kFjeWovDgszTjU0P9h2Xc5tA85IxI-TyMn4DVYudcu_Yk8
    g5NqQJ5L9FfUl94HA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:_vfJYycLSviNEoJStpLaTBLS0fsqQDwIuKIlb6frvV1sh_UEcZ2X6A>
    <xmx:_vfJY8I1Y5wNMmb5Faq82aVsN_qVyZkZRxdDfNsk9Xq0cNt64oIReg>
    <xmx:_vfJY_Lzpb8YUiFhPmyFyVUDb82gopNuzQAM3qa8-jjF6_Y00-_PNQ>
    <xmx:__fJY389_LTzCQhSMVZ5A4831SAzl_eHHBMgIf1KVdMQ_g-QiNdvzw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DA8DC1700090; Thu, 19 Jan 2023 21:10:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <f5423719-6d12-407a-85e6-896fe97c723c@app.fastmail.com>
In-Reply-To: <202301191715319948743@zte.com.cn>
References: <202301191715319948743@zte.com.cn>
Date: Fri, 20 Jan 2023 12:39:46 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: ye.xingchen@zte.com.cn, brendan.higgins@linux.dev
Subject: Re: [PATCH] i2c: aspeed: Use devm_platform_get_and_ioremap_resource()
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 19 Jan 2023, at 19:45, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
