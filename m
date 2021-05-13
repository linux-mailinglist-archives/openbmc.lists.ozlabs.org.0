Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0137F0E6
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 03:22:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgYmF2GYwz303P
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 11:22:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=YlpKlfQ8;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=X4TahsqJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=YlpKlfQ8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=X4TahsqJ; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgYlv3T3yz2yXN;
 Thu, 13 May 2021 11:21:46 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 09D7D33E;
 Wed, 12 May 2021 21:21:42 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 12 May 2021 21:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=LJMBBhe/zWnSoQmdd8FrIcwa5mli+J+
 /2kpGJdDlKyM=; b=YlpKlfQ8Z7b/EAlOKqNPnRyUpYDOaRjvdNu6e/Z1SO1+DE7
 kv2Zsj7Lk+XK6Bn9zaUto3AxXx17FUmv19YxYeNgGuuysQUwFgZpHD1n+te1K8kD
 KBIw1yMVpBtneVwmK7bVb3q3NRi+QPg+Uo7BswTZzVL2neg6JiQOfl1hf/ChJFGX
 DRy8GENqT98fLaeKtbiX4ASQGmx1ggaYcAuf+S8UfVz6LwQTUqRvQi9SV3cq5w5s
 WHTSGwTleikD+l4j6YBXbpRkXuFcz8e//0T7fV1SZ+HdE+VoL8x6vX9KKhJ0MT1f
 xm4+r//F7sPZcSyO7dasGT22GRkDIFYuEn2wyNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LJMBBh
 e/zWnSoQmdd8FrIcwa5mli+J+/2kpGJdDlKyM=; b=X4TahsqJdPc1vgMqeEavXh
 Kr4ZwWNGnb80ReXiGlX5HuVvKu0XXB65abj9azzpHWxPlVbpM+alyOpzYYc/x/V8
 TQTrMNRIS37U2XD8jiHuJZS/hdu+cS1hRSZCi6PwvszmxHeWD/LJ20gfVbQjFztG
 Dzob5ZEXOjtkhHZQJ9ICS5hDfZ9ur4+EB3VOit1ILLkQECVLIoHR7D4ObP0u8GZJ
 dixM3gJSCKfom3gxI9IkY/l4eBowSkKT660COyI/rgWWsrBGMLifPSEsjRvUTLnb
 4jU+bTJtFuCsApofhELlVrm5Fpm3OTOt0R8osffmBoTLron5MG26o5c1PNYCxETA
 ==
X-ME-Sender: <xms:JX-cYPa92C0dVyIBnN9b7Immm2wwzXMFL9CE24byqOFjeOaP-uuY4Q>
 <xme:JX-cYOYBsvoGXFC4X-9oNg3y6MLZEcK3-wvWglJ7C83b9m99sIgQ65vIKiXzr1y4Q
 8vCIp_3W3eqBZuWTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehfedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:JX-cYB_L59YOZXJZsC5ffHczu50thD6OTOSOZWZ2k2JGArbcSf4qjQ>
 <xmx:JX-cYFrCpigqJKtUj2ygAT-lzoXp0xQZrx1VzOA2hFQwwGxBOASUmA>
 <xmx:JX-cYKpg2ZRp0BkbmcQwAInKpmyALkIGMN5B1TAalvOIlqFMV-759Q>
 <xmx:Jn-cYKLR1xkgOdcZjHJ4Uvm_abGQ5kcATKVbw-a_RD6ko5kzEYYDhw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5D47EA00079; Wed, 12 May 2021 21:21:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <a8ebfb09-e2d8-4c23-b479-860a116cdb49@www.fastmail.com>
In-Reply-To: <20210510014231.647-2-zev@bewilderbeest.net>
References: <20210510014231.647-1-zev@bewilderbeest.net>
 <20210510014231.647-2-zev@bewilderbeest.net>
Date: Thu, 13 May 2021 10:51:20 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: =?UTF-8?Q?Re:_[PATCH_1/3]_serial:_8250=5Faspeed=5Fvuart:_factor_out_aspe?=
 =?UTF-8?Q?ed=5Fvuart=5F{read,_write}b()_helper_functions?=
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
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 10 May 2021, at 11:12, Zev Weiss wrote:
> This is a small prepatory step for changing the way this driver does
> its I/O accesses.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
