Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B092FCA2D
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 06:02:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLD1D1wdFzDqgV
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 16:02:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=P24yY3z1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=mWT3KX8g; 
 dkim-atps=neutral
X-Greylist: delayed 237 seconds by postgrey-1.36 at bilbo;
 Wed, 20 Jan 2021 16:02:06 AEDT
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLD0G6NhmzDqW7;
 Wed, 20 Jan 2021 16:02:06 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 81FAC5804C4;
 Wed, 20 Jan 2021 00:02:04 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 20 Jan 2021 00:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=Xzm1/rS4H5PuGurLJPLZvaUpqeI5TgR
 jZU293uiw6+I=; b=P24yY3z15/L4B7lxaydItYA4CLoWr6VA726Wz1eKfo/tgN4
 dTAwH9XMR9zVWUsf9F60+BazxWYMNZe5GdJf+MQwRX6zNXt98c1Kj89e/VGvScvn
 lOhXmqdRA8osmB6XKVP5cVH0bGwPL408+Dtyux5ZcyNW0ZAtXDCFK2rfigJpqgU1
 pSLzqV4ZEcN54lj0YmGEvdLgzWrp++UzwQYCYX8bqYfxvsKBzarpkUEB2HWXFlyJ
 mWONS+9cecOvSby+mxkv1fk152uyQgxo3lfS00Pjl0RGxw+WEyF9XECT3iFV7wPk
 DcRlz/uvnGHczYuO6BFuunBvjFxB9TKT9Hiox4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Xzm1/r
 S4H5PuGurLJPLZvaUpqeI5TgRjZU293uiw6+I=; b=mWT3KX8groTC8G4KBtzThz
 g5yDxRt/vpcgvBEDLkZY6f9igVJ8kFp2NunCaS//O1LWgUB2jjHKdZde8AuXmnnR
 TOLAG55xn6P33BzQ+7rEk5gZaZ6ckPEYI23X7NirttLyHVEUeucqsGDWleEF/zKj
 kScbzCvM5Qv/7+l6lh/MOjl57I/DzL7LVQ5v8WhVhFvmDW6Azhi9evmh5tjAnLdc
 F8Xn1rhdu5aA1ET9MjoRwqOSGZztYU2s3gsHrdTbkIEeLbdX2HtsXJkUeREqYZVJ
 f1XxjgL/Qv5+GEe+FTi+8bdU39dClxJDAWBJjN1XFOAkKfyUaqQu+JGWgKfgsSnQ
 ==
X-ME-Sender: <xms:S7kHYEA4ECdFeuWvMr4TvXzwAMslB6Tr2AQoRHKamDZhHzWvrfywIA>
 <xme:S7kHYGiPZ9fyrb4eEERpZ7_rnG7TujMC1amHOEA-JwMlUTVC8rvEYtrUdTMK2AH0Q
 yJHUedoObNQudz9CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:S7kHYHnXLx0PgA5r0vp-LmUai24JFpe4gy_C1lC95bxDjtHVPdTK4w>
 <xmx:S7kHYKzgZD9eSyItcnj1r176R9Ns1rWw-Ms6CfZ3nW2NfYvyKuMT4g>
 <xmx:S7kHYJT1oSJzwEAGbyfkIfepWEKCzKPIabbdyol1U8ij7spess0P0Q>
 <xmx:TLkHYIIfSc1hSOcFh96O2laG_ylipwlZ5t7S8FdrxkWcj6JQqlbr9A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0AAC7A0005D; Wed, 20 Jan 2021 00:02:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <c05a7bca-df80-4c26-b6dd-802696c9ddab@www.fastmail.com>
In-Reply-To: <20210114131622.8951-3-chiawei_wang@aspeedtech.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-3-chiawei_wang@aspeedtech.com>
Date: Wed, 20 Jan 2021 15:31:41 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Lee Jones" <lee.jones@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Corey Minyard" <minyard@acm.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] ARM: dts: Remove LPC BMC and Host partitions
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
Cc: BMC-SW@aspeedtech.com, Cyril Bur <cyrilbur@gmail.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> The LPC controller has no concept of the BMC and the Host partitions.
> 
> A concrete instance is that the HICRB[5:4] are for the I/O port address
> configurtaion of KCS channel 1/2. However, the KCS driver cannot access
> HICRB for channel 1/2 initialization via syscon regmap interface due to
> the parition boundary. (i.e. offset 80h)
> 
> In addition, for the HW design backward compatibility, a newly added HW
> control bit could be located at any reserved one over the LPC addressing
> space. Thereby, this patch removes the lpc-bmc and lpc-host child node
> and thus the LPC partitioning.
> 
> Note that this change requires the synchronization between device tree
> change and the driver change. To prevent the misuse of old devicetrees
> with new drivers, or vice versa, the v2 compatible strings are adopted
> for the LPC device as listed:
> 
> 	"aspeed,ast2400-lpc-v2"
> 	"aspeed,ast2500-lpc-v2"
> 	"aspeed,ast2600-lpc-v2"
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
