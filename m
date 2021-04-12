Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8437F35D407
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 01:38:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK4tY3QHmz3bTw
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 09:38:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=fTQA1ulm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=U/QkrDg5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=fTQA1ulm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=U/QkrDg5; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FK4tH1dQSz2ydJ;
 Tue, 13 Apr 2021 09:38:15 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 11E6E1A1E;
 Mon, 12 Apr 2021 19:38:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 12 Apr 2021 19:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=rs+CMVSq1IMzDicnOc3HJ7GexWkfQde
 TZ0h6vZF00Ao=; b=fTQA1ulm96fXRCSUmZQn345kH1+ACTCX1Hqu6PWZ9Et8srw
 Nyen9qCbo0adg/nc/0dXsYY7tCe6KSGdowg1XVr6Ycxs0JDHg1JsZ5oVOHAUbLIy
 99mc3I6QyCGRsBPFoMxJwxMQEIGinOYeKKMzdJI5LsjDoqgdmYGqa1dRn+dYQCIP
 2nUm2rTcqyFAJ+KWcdcxeIVJ6fISwAIp7EgiQ/mfAhs/aWFFlgpGvYnLyjxKkB4+
 B5nGpvmUBPGY9RWctdEnYrrPvHZSQbnxrFPOCkaptWkahh0qWpaV4eyqAus7WZe7
 +6ZtM9U80KfaQOfiyJ6H8kak+01ZTTXpv8mVCJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rs+CMV
 Sq1IMzDicnOc3HJ7GexWkfQdeTZ0h6vZF00Ao=; b=U/QkrDg5yoPsJwNtMq2gjj
 GCSJA2zr2DdcrY1lcB4y/EaBaPVThhB85nXrwFXgiLSAhbbhFCOhVZv/iaeM3e+G
 WbQ474kaWLCJO6xGXS1e5PY6EGUDFvoq+IhWjzvFE+QgOEjkLMMeBLwDEC1cHxhT
 HiFSyNF2r9Uvn9j2X+i5movGiD/WqESnJOu2iDdZPRIcAW6QSGySiAPVG36WT7F+
 XVXhFM26GqQ01L+OtmFRCOXsQPWaSJ/8fUrYqXlZcRYj13C1HwlzWkfxt3SutQLX
 b4zckSzJt2i8rrgsoJRso9m2RGzHiwZBo+x34y+TvKMtjj/Td6F2uMBp7zTiOW6Q
 ==
X-ME-Sender: <xms:4Nl0YNedyTglQvPF84v975xVpzrmWdp5isVR3lQm907dL2KEIjxocA>
 <xme:4Nl0YLN60Y38isv8zfNPcqCZI9RA5n5DXrWfmfId5DnO17RlkHOjyDqBpU_tsgwck
 nOAvFmpQUt63OJ_PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekkedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:4Nl0YGho0uT6g_SSlWZCEIWvB6dvwf0jnC0riQM0JDz6G3SGXw8fiA>
 <xmx:4Nl0YG9QJyyTIKLve8NNZTb6BC16beRe8Qm4rCi7xm58JIRifxWe-w>
 <xmx:4Nl0YJu9mMMPV46-dIaQkKAC0egCLyGDLQ-foJ8F1OOat1hptaqufw>
 <xmx:4tl0YNgmRs8fTvXp7cI9sHzomD62GXywWFVnV1m-5_UVWuR0aWa5jA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BD9A2A00492; Mon, 12 Apr 2021 19:38:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <85b5abef-7c7a-4157-a13e-6ba85f463703@www.fastmail.com>
In-Reply-To: <20210412034712.16778-4-zev@bewilderbeest.net>
References: <20210412034712.16778-1-zev@bewilderbeest.net>
 <20210412034712.16778-4-zev@bewilderbeest.net>
Date: Tue, 13 Apr 2021 09:07:48 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v6_3/4]_serial:_8250=5Faspeed=5Fvuart:_add_aspeed, l?=
 =?UTF-8?Q?pc-io-reg_and_aspeed,lpc-interrupts_DT_properties?=
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
Cc: linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 12 Apr 2021, at 13:17, Zev Weiss wrote:
> These allow describing all the Aspeed VUART attributes currently
> available via sysfs.  aspeed,lpc-interrupts provides a replacement for
> the deprecated aspeed,sirq-polarity-sense property.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
