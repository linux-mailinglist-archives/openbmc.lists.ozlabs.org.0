Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B16432F5590
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 01:28:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGQCm6L2LzDqQS
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 11:28:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=A+n0WcIo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=RiHIcnZN; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGQBg6zs7zDqL0;
 Thu, 14 Jan 2021 11:27:54 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 843DE5C00F7;
 Wed, 13 Jan 2021 19:27:50 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 13 Jan 2021 19:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=ryfvk2k2wQcDt6+nGId872DiRJw7DhY
 PHXP5E70CfEg=; b=A+n0WcIoUsUZSSwJUDKSbWQjSV7hDEsBdKGPqEMOSbD1aes
 P3BMm4GcyKY5AK9gUv52XevM83JAHapiK1DMgw4zfFNfrqCLJHzZ/Xr8Q1cvGQnf
 diKmIp7Cime5HAlcEETnADT1n5kOvctuR+N73ASsnq0Ha6Fzk7sUNLFQuCOsywFq
 GgLXWUcGYTwqKydEekggjJ/fbyTMSqIUJ3ueNSMJthizOp2raeg2+qtAUnFRLVda
 8bC6IMlp9nQ+ZfHSIrMxtZF2GpOUcloIKsh9QB2VC6KeqSZZI5Lk2kAHqRvhoKfW
 W/x5vhCgWvyBHX6cm1mJdL4GUiIIVsxyo8bo4dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ryfvk2
 k2wQcDt6+nGId872DiRJw7DhYPHXP5E70CfEg=; b=RiHIcnZNDLtKSJfO8saxuB
 DpiQGP/R2rvSnHDSmOEp+fvNUObV143TtRu4+59Rq7uTz+iDmuj+6dcTrTx5s2Xw
 JZijcKbhJPYqLBNXmp+YwHnRZVaOwY0LCBCHuWbyoVT+Z4qL3Pn5Pw3iRDQwoM7h
 oujOIsCjnyfZS4B0m8GEB6BWO8oI9xj3M/lsGawrJ+fF+bcIzcpYKqDG0QwzN53r
 o1W/X9njVgtZ01tr/qp0uhYIjEKqJRcxpzACWQDB4M03kIQPjwdyo8GW/s10UNgq
 rEKiNdAavpYE/SxBhQ2qwfW1NfGcXJYYHnMzPuAPhTVR/qSOYbBOn2Ys6dZT+BHQ
 ==
X-ME-Sender: <xms:BZD_X7RtUYaQz6-LoWQbxRXbaTf2BAutei71F7-kjApGRU8V5gl3XQ>
 <xme:BZD_X8yJIdv1xt-BwbmV87_iutieNA_I5Pc3AkQwzSlD0PVUfrPTI6JmUNp_rDzLj
 2U9mBFIEyjHddnZTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:BZD_Xw1MhVYhL264TpIwMA7sI5eqWEac-LoUJ9M0vCknH1-gAgkFvQ>
 <xmx:BZD_X7B79D8DU7PMiwMBtOLQ7w1kv74ihVbtLYPp4DdaHf5Ab5BF0g>
 <xmx:BZD_X0iOvMQ9qIsssRY-0CrJbl9ZauOsgr9AK0WbUzCK84kqnh8xAQ>
 <xmx:BpD_X_WnhZ7DjubPmiT3g9ToPhwrDuZ-pPV-V55xjxZvP6Y7aL31MQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 943F9E00C9; Wed, 13 Jan 2021 19:27:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <775b31f0-c74c-4ebe-9588-bca3ee423383@www.fastmail.com>
In-Reply-To: <20210113223808.31626-2-hongweiz@ami.com>
References: <20210113223808.31626-1-hongweiz@ami.com>
 <20210113223808.31626-2-hongweiz@ami.com>
Date: Thu, 14 Jan 2021 10:57:13 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Hongwei Zhang" <hongweiz@ami.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Joel Stanley" <joel@jms.id.au>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH, v1 1/1] gpio: aspeed: Add gpio base address reading
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

Hello,

On Thu, 14 Jan 2021, at 09:08, Hongwei Zhang wrote:
> Add gpio base address reading in the driver; in old code, it just
> returns -1 to gpio->chip.base.

Why do you want to do this? It feels hacky. The base address only affects the 
legacy sysfs number-space, and even then if you're using the sysfs interface 
you can discover the base address for a specific gpiochip via the associated 
attribute. For example:

# cat /sys/bus/platform/devices/1e780000.gpio/gpio/gpiochip*/base
816

I feel that you should instead be changing your userspace not to assume a fixed 
value.

Finally, the base value is a linux-specific thing and doesn't belong in the 
devicetree, and if it did, you would also need to update the devicetree binding 
in Documentation/.

Cheers,

Andrew
