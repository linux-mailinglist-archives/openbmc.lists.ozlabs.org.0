Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3BF111D8
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 05:25:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vgdP6mgszDqS0
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 13:25:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="W5HwPouS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jw4E2UKA"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vgcQ1BXBzDqNt
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 13:24:53 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B7C96222F3;
 Wed,  1 May 2019 23:24:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 01 May 2019 23:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=6BaI375c92oUAAupXp9bZst8OQ7efGw
 nv0hCWfZR9SE=; b=W5HwPouSTji26hmukklW6IudTZr3NrxyMnYqH3a+5MhYF7k
 gOg17Iz0I/zZeXJP6afWQdlA5/5yTJYI1pWJJFfjO2Bu9iVaIGn+5A2Jz9MI+5GF
 7lL/zMgX3e5d20AyiIAHSJimHiczSE1DtHP/4KSZsSzW3IKU5FPwiRRgZz47hw6Q
 E1NVyIqlYqtDSbHILpYIWqdRyfRaHYCuOwhMEZokj3GpgWVQ2eAnLZ5gwz0w5BhE
 vRW6mdkZU20zAol+QwwD7zQSYHijxBMygUtTJOdDmtQC7Mr9pdRbFbnHeOFsWezP
 dndnsqNowWcyf1KxcVHT/iafQusMbmF0jD6Xv2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6BaI37
 5c92oUAAupXp9bZst8OQ7efGwnv0hCWfZR9SE=; b=jw4E2UKAUh5ONbG7264jc4
 +mfmLivopxe1lJVu0xhbU3AtW56gaNh1gNTUiY2L5HqnJFX2Ii7fsZcQ8keyl0J1
 5g3dlgkvizJZ2scv+BQar3rDCvthn/7HmaCL6z667Rx4HaEyUX4CU6gG1n0hGdPx
 YPpv7jjLBCirIvvhAWe09tGbpKlhdz10vhgYrVjrv0RgS6+3GTBZ86esA4VdJqkl
 KF/2Z54pLn6zbAa/1NMaNpz+fdCO5prnvJui1sMoMYK2v8avHHwYbKEDOz9AhJeN
 ETjQe9ZjRqcsHEj6TvYo2YMZp/GYOv1TQadz50e1+kvbz5fSxOPmmNHUiwFTByFg
 ==
X-ME-Sender: <xms:AWPKXJPQMKpIZaKF-lzDML1QRtJ1ul5hfcilSDXz9wk88xrh8ebYeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:AWPKXBsp_UYq1QnMS3FLeeA-nW487J2MLIa38x452hLC6lEKDhftpg>
 <xmx:AWPKXGURoNeKvkZCldeSD2XR1i8-wqpxR2ojofzKHgrOid8XyNpQEw>
 <xmx:AWPKXAQN-EaK6J0V0I1Rq3Qmpk-GdoWYXw9-AFkZOgHwD4vwUlKyzw>
 <xmx:AmPKXNkh6DQBoLZxxoVgUMIu_Ux5AQ8GDBwlh3Ou1zqm0XTGjWErVg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4828C7C6D9; Wed,  1 May 2019 23:24:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <35f3df7a-153a-4ae5-acfc-033d36191b51@www.fastmail.com>
In-Reply-To: <20190501213750.28751-5-jae.hyun.yoo@linux.intel.com>
References: <20190501213750.28751-1-jae.hyun.yoo@linux.intel.com>
 <20190501213750.28751-5-jae.hyun.yoo@linux.intel.com>
Date: Wed, 01 May 2019 23:24:48 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Eddie James" <eajames@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_dev-5.0_4/4]_media:_aspeed:_refine_interrupt_han?=
 =?UTF-8?Q?dling_logic?=
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



On Thu, 2 May 2019, at 07:12, Jae Hyun Yoo wrote:
> There are cases that interrupt bits are cleared by a 500ms delayed
> work which causes unnecessary irq calls. Also, the current
> interrupt handler returns IRQ_HANDLED always but it should return
> IRQ_NONE if there is any unhandled interrupt. So this commit
> refines the interrupt handling logic to fix these issues.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> Changes since v1:
>  * Moved bits clearing point to aspeed_video_off().
>  * Made irq handler return IRQ_NONE when there is any remaining bit.
> 
>  drivers/media/platform/aspeed-video.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c 
> b/drivers/media/platform/aspeed-video.c
> index 77c209a472ca..1bb863b32836 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -488,6 +488,7 @@ static void aspeed_video_off(struct aspeed_video 
> *video)
>  
>  	/* Disable interrupts */
>  	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
> +	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>  
>  	/* Turn off the relevant clocks */
>  	clk_disable(video->vclk);
> @@ -556,7 +557,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  					    VE_INTERRUPT_MODE_DETECT, 0);
>  			aspeed_video_write(video, VE_INTERRUPT_STATUS,
>  					   VE_INTERRUPT_MODE_DETECT);
> -
> +			sts &= ~VE_INTERRUPT_MODE_DETECT;
>  			set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
>  			wake_up_interruptible_all(&video->wait);
>  		} else {
> @@ -601,12 +602,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  				    VE_INTERRUPT_COMP_COMPLETE, 0);
>  		aspeed_video_write(video, VE_INTERRUPT_STATUS,
>  				   VE_INTERRUPT_COMP_COMPLETE);
> -
> +		sts &= ~VE_INTERRUPT_COMP_COMPLETE;
>  		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>  			aspeed_video_start_frame(video);
>  	}
>  
> -	return IRQ_HANDLED;
> +	return sts ? IRQ_NONE : IRQ_HANDLED;
>  }
>  
>  static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
> -- 
> 2.21.0
> 
>
