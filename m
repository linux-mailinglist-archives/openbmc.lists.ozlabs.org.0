Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83138F72D
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 02:57:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpwfG3cJTz2yxl
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 10:57:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=O5h4eUlc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RS/GobZI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=O5h4eUlc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RS/GobZI; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpwdz6J2gz2xtk;
 Tue, 25 May 2021 10:57:11 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id ACB26580B3A;
 Mon, 24 May 2021 20:57:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 24 May 2021 20:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=DRCx3gvpKzrkcfOBIF31kbut6buaISo
 YXBZyw7SWnec=; b=O5h4eUlcu2PzsIy06z94jNoRp8DAfhih7cRj88w+XlUXn1W
 5cHLVic9/NmOVhEn/RRUKaGnAJlmjeEiY4T/nOf6Df8OrjKoEtv1wbp/xgtD8PYf
 mfLPS1rixsQsdfaF7xHS3CmmWHQpDAFFfetmMPje+I0RebDq3eg1+SxVLFQ7CSkh
 kIEMkOu7BROCDjoVpiG52HOZv0cfh0i8lQvSvpqxFsynofXRGg5f8bUt/mslYPyd
 frB7dPU0OWJTgXMHU0bmsXREwMo9b2QrKe5akWquZuy0X9EaRwXY9tKutO3kha85
 Fy2nJ82fd1szGi/WLe23+zFznob7OC7e/IzrVcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DRCx3g
 vpKzrkcfOBIF31kbut6buaISoYXBZyw7SWnec=; b=RS/GobZIdEiJLkJE6U6JQn
 056Wzn4jq7L62zM0M44faUuETwuhXmHInzmhzyc5WKVq8uI52qsUhwVgHjgflzKI
 2mQqCSwWcvtuFD5VcFhYeQRVPYi311VrcTCU0N41Cb/Cd9O5lg55iQOOeUXkBKuE
 K9fxF1bZPSSmSGIikY2T+QfEH1UBbFYpoAddoQTqof8RVJh7dTfI8WXpfilX6BCR
 YcOLFd73nldSZ6N213fmG5wKkdHYX51R9N/datuOxFzuWPKFNI2fjES/0mQvCpcY
 cS42fS3HrsBHf4V9tKccRYd284Jae2JoKE6h6yhJRZBz+NOHoeiQAtk4Vy2hfqJw
 ==
X-ME-Sender: <xms:ZEusYFEC3xYMiwCwbvVEMrzXnqbqKRnTgABqDcqPG_E9lTX6r9GjsA>
 <xme:ZEusYKXeqsHK_btHipjbyVgyLUsAndCCxMACGPWIp02F0qWtOrYjrhmQgk98m8tvU
 C0egMqauSv4wCEx0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ZEusYHJiRUddHWp1vLgOfRy8k4mxvn9H0uJFqnjgxTDZfeRuTwBfYQ>
 <xmx:ZEusYLHC-JBU38zG5snUO3CmoMXeDC62OsAKVNMw_zQi_vCNHYC5xw>
 <xmx:ZEusYLWvRW7l2B8zDgXfPLsAYFYPLESfSVD4ZFKS-X3g0K0k9boviA>
 <xmx:ZUusYEOZe5nkD8xV8BZ4oqaZnzqWwvRkxooNJRA8pMdYYhNWmxMvOw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 76C91A00079; Mon, 24 May 2021 20:57:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <17519567-2623-4a47-8e4a-be8f630d5013@www.fastmail.com>
In-Reply-To: <20210524111338.16049-2-steven_lee@aspeedtech.com>
References: <20210524111338.16049-1-steven_lee@aspeedtech.com>
 <20210524111338.16049-2-steven_lee@aspeedtech.com>
Date: Tue, 25 May 2021 10:26:47 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v1_1/3]_dt-bindings:_pinctrl:_Update_enum_for_addin?=
 =?UTF-8?Q?g_SGPM2_and_SGPS2?=
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
> AST2600 has 2 SGPIO master interfaces one with 128 pins and another one
> has 80 pins. It also supports 2 SGPIO slave interfaces.
> In the current bindings, there are only SGPM1 and SGPS1 defined in enum,
> SGPM2 and SGPS2 should also be added in the bindings.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
