Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D52A1F017
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 07:51:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tVy32d1NzDqRn
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 15:51:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JVKfBUnL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="B/sO/d9N"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tVx30Qn8zDq7k
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 15:50:14 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 93708209;
 Tue, 30 Apr 2019 01:50:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 30 Apr 2019 01:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=JkJuFpBNuLwJsDa0LzhdPuxZk0WZE0m
 5TMcxVY+oTxk=; b=JVKfBUnLs6/DWPYh5xXCkE+Tlye75RcpfdkPPGIXOxMo5fH
 fi90s1UglVUI9m0qtOWVVptW0Spt7l/jYxrnnlp6dBWlJ70PG182jprjdOYhPh1v
 Nk1PFjwCYqaWvOy2EZxCLwBYAJlkeGD8FonTrOQ9a505lGHv6CCFc1PAKRflovJo
 UeaO6M2HuB8Xukm0CmrWfey8jED6FXXozODz4p++8Ekqh4ekEzGkMWG5REQdMJDv
 r8aNgI4LNEzejZuiPjU8b0b0xOO5bC7CYf7vPgrfyDJYNGiblu3ZIkpvAx/yBMjM
 kTs079MZhB/zERfxfe9wl9pYz1eBe7gTHspKe6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JkJuFp
 BNuLwJsDa0LzhdPuxZk0WZE0m5TMcxVY+oTxk=; b=B/sO/d9NLNoh3UQA8hJKty
 g2IY77iiQC9whBMqcIrfTCy8ORHnzC7jZiXvQbb8dJxsKccEUDwY43aG0auTbSdn
 1aIgQPRHHYmbo2DWqEBBUQW51vk5XllIcMZtcfsOskyMLaA/LDZfXI9fV1Q3Xs+W
 nRXm8xYJFex7OpiY0f4nZVjCPNHC+P78pq3NL8/owAjhBWFyWgQimazcTY1lGzyu
 QWtbj0cMyAUnRHmEyEc/hHAeZDRQ9lKDV3yVgMFexIjk++5KfOI0wwkPMwMPnHjg
 X7cM2RqNnyT2ronwgxB9Ba19XM1ktRcs1RayRRS0NDPRHDMb810ST60e7F5p5SXg
 ==
X-ME-Sender: <xms:EOLHXGUw4nXMFcQoqoC5r9JzSaenNTndmVwFcsaeuSBEn0TdZ7ssAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieefgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:EeLHXLjWq4Uuadn4zYiRmCTAk_DRel0WYOGPP0romG9TgYae9MIYxg>
 <xmx:EeLHXMWnS2wbAXNDaUI8P8u4J0wpdnMOgI46o7TtFamqOpmvos-mVA>
 <xmx:EeLHXKMfInDeNLG-4tKjrcCKnr5LPdSP1X_pTL_-B6X_1vGvXBBz_Q>
 <xmx:EuLHXKRlE-8LeQihewYEdCAGzI5XVOyQKxe4_5TENqkkwde-VXIKTg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D35CE7C58C; Tue, 30 Apr 2019 01:50:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-448-g5cc1c91-fmstable-20190429v1
Mime-Version: 1.0
Message-Id: <1ffe0e08-c7fd-4ba1-9ac7-bb17c1ae0b7b@www.fastmail.com>
In-Reply-To: <20190425222040.2413-4-jae.hyun.yoo@linux.intel.com>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-4-jae.hyun.yoo@linux.intel.com>
Date: Tue, 30 Apr 2019 01:50:08 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Eddie James" <eajames@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_3/4]_media:_aspeed:_remove_checking_of_VE=5F?=
 =?UTF-8?Q?INTERRUPT=5FCAPTURE=5FCOMPLETE?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 26 Apr 2019, at 07:50, Jae Hyun Yoo wrote:
> VE_INTERRUPT_CAPTURE_COMPLETE and VE_INTERRUPT_COMP_COMPLETE are
> not set at the same time but the current interrupt handling
> mechanism of this driver doesn't clear the interrupt flag until
> both two are set, and this behavior causes unnecessary interrupt
> handler calls. In fact, this driver provides JPEG format only so
> taking care of the VE_INTERRUPT_COMP_COMPLETE is enough for getting
> compressed image frame so this commit gets rid of the
> VE_INTERRUPT_CAPTURE_COMPLETE checking logic to simplfy the logic.

Typo: s/simplfy/simplify/

It wouldn't have been too difficult to just split the IRQ handling and maintain
some state to track whether we've completed both pieces. That wouldn't
have hobbled supporting non-JPEG captures in the future, but at the same
time it's not like it's hard to add back and someone would have to patch the
driver to make non-JPEG modes work anyway.

I don't really have a dog in the race though, so I'm fine with the patch as it
stands.

Andrew

> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/media/platform/aspeed-video.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c 
> b/drivers/media/platform/aspeed-video.c
> index 429f676f9dea..77c209a472ca 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -463,8 +463,7 @@ static int aspeed_video_start_frame(struct 
> aspeed_video *video)
>  	aspeed_video_write(video, VE_COMP_ADDR, addr);
>  
>  	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
> -			    VE_INTERRUPT_COMP_COMPLETE |
> -			    VE_INTERRUPT_CAPTURE_COMPLETE);
> +			    VE_INTERRUPT_COMP_COMPLETE);
>  
>  	aspeed_video_update(video, VE_SEQ_CTRL, 0,
>  			    VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP);
> @@ -570,8 +569,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  		}
>  	}
>  
> -	if ((sts & VE_INTERRUPT_COMP_COMPLETE) &&
> -	    (sts & VE_INTERRUPT_CAPTURE_COMPLETE)) {
> +	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>  		struct aspeed_video_buffer *buf;
>  		u32 frame_size = aspeed_video_read(video,
>  						   VE_OFFSET_COMP_STREAM);
> @@ -600,11 +598,9 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  				    VE_SEQ_CTRL_FORCE_IDLE |
>  				    VE_SEQ_CTRL_TRIG_COMP, 0);
>  		aspeed_video_update(video, VE_INTERRUPT_CTRL,
> -				    VE_INTERRUPT_COMP_COMPLETE |
> -				    VE_INTERRUPT_CAPTURE_COMPLETE, 0);
> +				    VE_INTERRUPT_COMP_COMPLETE, 0);
>  		aspeed_video_write(video, VE_INTERRUPT_STATUS,
> -				   VE_INTERRUPT_COMP_COMPLETE |
> -				   VE_INTERRUPT_CAPTURE_COMPLETE);
> +				   VE_INTERRUPT_COMP_COMPLETE);
>  
>  		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>  			aspeed_video_start_frame(video);
> -- 
> 2.21.0
> 
>
