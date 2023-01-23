Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC046773CF
	for <lists+openbmc@lfdr.de>; Mon, 23 Jan 2023 02:34:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0Xh05DJPz3cDh
	for <lists+openbmc@lfdr.de>; Mon, 23 Jan 2023 12:34:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ojJBNaZW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XKurNj5F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ojJBNaZW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XKurNj5F;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0XgJ1kXkz3bZj;
	Mon, 23 Jan 2023 12:33:32 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id D52733200754;
	Sun, 22 Jan 2023 20:33:29 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Sun, 22 Jan 2023 20:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674437609; x=1674524009; bh=35grlo2z9N
	30qc3ElVDcZUxXHnQY7Qlw7Nb+IzCCOgs=; b=ojJBNaZWhwSLdqrT7hpU7vKsCR
	q78lUuclXWRqKbHo41BfFbRoc8E9ikrghYvu5DyI0ls3UY8x8x5MwfPm3kpLzbnJ
	CkakVUjrjK0VEr6daug4c6zqsZSvnNxv+TSeg3vrE0MDr2Jl5hGeVQ1sm4P1coHI
	95/7QdyGVehG0X1oiyrSP/WulzbxvlNRDjX2XNeMqRl6r/icGPU1f3Cq2uIHFZ5S
	CFE7Du4M62DvwdGJM8Uf443ydhaV8s+EWApb0/3orsM3KANG5P2q+24OfUqiX7CN
	s3QqP/RilDvM4+ik187A9cn2tMuKjpPQQ+EZICjOJs0Hf/ncUC4xpsUnLdJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674437609; x=1674524009; bh=35grlo2z9N30qc3ElVDcZUxXHnQY
	7Qlw7Nb+IzCCOgs=; b=XKurNj5F8DgSwWneLtXNh9DttU9kc6KWVEFbiwDDKqo7
	7GZ1BzTdesJFYSOEy8qMAz/KP+vOOn9vU276HAILLaknkP42cF8W+utZ9nb6LQAN
	sjIhlGAqn/M9ReQ0LrQ16C4znHUP+r1nieIeR6QJJ4mSmU3IViDdM+pCAR8s3Okn
	+CWZLyf36/fO05Fafnavj02+BStFBZ84nsAvIA/xBhlaj81dx/OQsFvq61Yidt6f
	5wggsW6O39Qfn7cvDQzpY9DAgRyKT2+VmLGNN5wRPzzJTkFV3bM2m9+NYhfRu+kX
	EAF0LdiDhbjOecMSqm2r+O/ZbbLvT67NhBjCjtbVPw==
X-ME-Sender: <xms:6ePNY5VTn-ouyGnVPxoELyW4UKml1Ts0ftlH4UBc69-FQlySHOhc2g>
    <xme:6ePNY5mQQJZoxouk1aza-rjM1ZTS0YHmc3Q5MNEpGVTYHvEo86EZE3PUaTGsJFo_4
    R4669TlmdJsNhP12g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddujedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:6ePNY1Zf0-3OX9MxyU4F8bQXUYOqptHSNU0dcUIRk--pP-XKuHkWFA>
    <xmx:6ePNY8VH0uY7i0k7MX4VseQTKHki_27lsPucXLiURrh_aoH8ilLo9Q>
    <xmx:6ePNYzlR428BagHVBcd3jDTZSOud_xaPHfnOVdZmo_MhQNeJjWluLw>
    <xmx:6ePNY8COvcVHfRtPEi-4j3589sloeQk5vx0WMepj4LJvdiY3XMY8cQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1F3881700089; Sun, 22 Jan 2023 20:33:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <3b11d987-180d-4b99-949a-b854b1d6d39b@app.fastmail.com>
In-Reply-To: <20230103093702.2613574-3-ryan_chen@aspeedtech.com>
References: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
 <20230103093702.2613574-3-ryan_chen@aspeedtech.com>
Date: Mon, 23 Jan 2023 12:03:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Linus Walleij" <linus.walleij@linaro.org>,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 2/2] dtsi:aspeed: add miss pinctrl in pinctrl dtsi
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

Hi Ryan,

On Tue, 3 Jan 2023, at 20:07, ryan_chen wrote:
> add miss pcie rc, secure i2c, i3c, 8bit emmc, uart ncts..

Please make sure that any new functions and groups are documented in 
the devicetree bindings. Also, updates to the binding documentation 
should be in their own patch, separate to the changes to the devicetree 
itself.

Cheers,

Andrew
