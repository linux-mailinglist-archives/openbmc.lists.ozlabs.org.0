Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6671C8245
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 08:13:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HjnR0l8QzDqwB
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 16:13:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=VW4moyn1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=MXujU9Oq; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hjmf2fSZzDqvg
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 16:12:33 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6BDDC457;
 Thu,  7 May 2020 02:12:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 07 May 2020 02:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=hmqv7jKcUk6HvyaVvE+vwBCY40TaIbN
 VVvqXINUJqZA=; b=VW4moyn1FKHH3fCte47Iguk+qBNq9CD6EtLSabZQbgv9HAs
 l9etxE/L6XLZMT7wXnEsxUhenl53G/ORafPchOSJu9xHY3Qz2hCIrZKS5sBtZABy
 QEBdp+PVh4ShbV48rOWQ+IVPtXFQaaobNlKAAgEFDhQqi3PlEkJmC4ShLQZZqE+a
 xEyw+0a7ZTgnrrM5eooyxZSuPSUlkFmOsy+m+wlNk08OfUA5VT2yX5BPE0EXUSq5
 eKn2wQhBrkmcX0UtgPojgHR0uOlpEw3JWXp8NL1jZ7gTHxDYuH9mfmWKiv3RzT+H
 B4MCh/p6bULKf8IK0Mjpdq/yQER51OmeG6R4A9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hmqv7j
 KcUk6HvyaVvE+vwBCY40TaIbNVVvqXINUJqZA=; b=MXujU9OqJ29bhPik3JuyRE
 11B1nN3VZ4aWaNJCdqingv2aOCa706ZITB9qBYwfQZzADiQHDSVXenMGOvQ9Za8p
 WcSaEGao82p/0sNC9MwSIXEAJBEGzx37Aw+NaoyXljGxEjqf5t1YGci9rx5RFrvT
 RWuQ5I+8otY+h6AOqzmPY3R+sz7r2aphvo3xxtnmPl/f86Gu5KiIy4nvKk8uMjCi
 /rXgh2PXuzUXpWbX8nNi3PGOFmHh8eVmw+cX57uWAT0rlV4PTNmjvasYJcbyTt0s
 vhtP3px1DFzoraa8YLapH2XmD6Mh73xckXyJG6jf73qSNychnjbD+jOfKfprJ7dA
 ==
X-ME-Sender: <xms:zKazXlXtGRMpcfkHiY-vUwXyTfD3f3vitXlP9o-tKw4siiw-AeUNdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:zKazXkHzCg1-5ohHloBg8UoYN8kx1aNYRTw1qwpIh_giStTilDfZzg>
 <xmx:zKazXs43QKDeNrOhj0GamY6QU7Fb-O2winlcmxZMhzwUca82SENVwA>
 <xmx:zKazXidq3uWkp7-srj57280r5qWCBV0ybOvqTtO5eSdsutskNMY4LQ>
 <xmx:zaazXkwbYzXvXyCJmgJqdTVj-lSpJ8phNW91h26-1gaO0rhrjyO7Xw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0BA8CE00A9; Thu,  7 May 2020 02:12:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <a598917b-408a-4f6e-9f68-0b1d5d94a06d@www.fastmail.com>
In-Reply-To: <20200506224812.745931-1-joel@jms.id.au>
References: <20200506224812.745931-1-joel@jms.id.au>
Date: Thu, 07 May 2020 15:42:05 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 "Eddie James" <eajames@linux.ibm.com>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4]_ARM:_dts:_aspeed:_rainier:_System_ha?=
 =?UTF-8?Q?s_one_SPI_NOR?=
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



On Thu, 7 May 2020, at 08:18, Joel Stanley wrote:
> Remove the second as it doesn't exist.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
