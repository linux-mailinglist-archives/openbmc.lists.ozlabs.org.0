Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95839111D9
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 05:26:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vgf86gkgzDqPM
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 13:26:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Lpn4k3ZO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IneFxlY/"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vgdG1crjzDqPn
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 13:25:38 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E889E222F3;
 Wed,  1 May 2019 23:25:35 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 01 May 2019 23:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Pj8rgjQzBI6Et/cgI8AKC1xB2nrM6Rr
 DoSoqWFlBdd0=; b=Lpn4k3ZOEHW+cB4+BNyb9Ze76KYQbRu7vsUJi4WKXUUq2KY
 STxkcnCGXZ6w59rVTOaHnaZ2JKj1i/LoPWwtpRRoK8m6KQFsfdTdnlCwpjsxFZhB
 Q1va2o84lcoIOfG/YAfmIpBPfjnyj0fxWr7+vIEl0a0H1mP94cDyxIjpL3RhPYgC
 ECu4nUvrnMyEL4nA+YvhMYW+5egEvRL4xmvU+ymbCsUDHYGDGIXipP6qAbH4hQoZ
 pZSB44y8wH/qPBR6GCmgVI/fE0KRnINfHhNyqO5ClkeKuOHQWjse4eY+84zrbP2I
 QKPhXbfIHcxI0rNeZKAnTI0VE/2Nf/rlj0p367Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Pj8rgj
 QzBI6Et/cgI8AKC1xB2nrM6RrDoSoqWFlBdd0=; b=IneFxlY/RrcWSjG4gfZCDt
 VFhK2eBuLsazftXtKhj04b1Zs51adkDTSB5DDtO9c8+j1HgFRX2y1Km0KxWRfbCA
 lkRJSlwElrRfT9UF8IZ+kGLlmfIVHgvBbbbgLBDektlQ0cIOWbfUZS8j8qNcsleN
 lrLEV8Ru7fPbEopMj/6wH47/Vwz/QZm6n0p4k4Rei7k2WVN4LcwGVZEkUI2OqfCF
 jRMjBo8E9So16PGdTZ46tXAH544rB9pSB77SE5jXDcCwmTfuvW902JBhh7ZVQ/wI
 zAdJLVF1ux1mxdL5KVbim7KLPddB94Kg+A4XjiMRTzijQKD8Hjv/WvLSwXDJtfXg
 ==
X-ME-Sender: <xms:L2PKXK8nA7qg_ufDMkYUFgfBG3AgqWZ6R-xr-kP9QkpecqLlapTOog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedu
X-ME-Proxy: <xmx:L2PKXJeENrR7CApJSm9QuNwAmD-q18zh8wGSMpMJA3edDHld4eTBxQ>
 <xmx:L2PKXEkVCjrRTmLDVs4kaKEzvMhw4UbL0eP9XhVLwwaeKy7imZ2vfQ>
 <xmx:L2PKXOiamIdG4WfdgBjoCmkpRup3fM4OjXUfZ_wnGnax3s2RmArr5g>
 <xmx:L2PKXMJTSi8nq0loWEVKrCVpcu0W1Fbf4I-D_VGt1oIifcCpFSomnw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9D7727C6D9; Wed,  1 May 2019 23:25:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <9c8610ed-4505-4aef-a461-682d1dd06094@www.fastmail.com>
In-Reply-To: <20190501213750.28751-4-jae.hyun.yoo@linux.intel.com>
References: <20190501213750.28751-1-jae.hyun.yoo@linux.intel.com>
 <20190501213750.28751-4-jae.hyun.yoo@linux.intel.com>
Date: Wed, 01 May 2019 23:25:35 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Eddie James" <eajames@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_dev-5.0_3/4]_media:_aspeed:_remove_checking_of_V?=
 =?UTF-8?Q?E=5FINTERRUPT=5FCAPTURE=5FCOMPLETE?=
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
> VE_INTERRUPT_CAPTURE_COMPLETE and VE_INTERRUPT_COMP_COMPLETE are
> not set at the same time but the current interrupt handling
> mechanism of this driver doesn't clear the interrupt flag until
> both two are set, and this behavior causes unnecessary interrupt
> handler calls. In fact, this driver provides JPEG format only so
> taking care of the VE_INTERRUPT_COMP_COMPLETE is enough for getting
> compressed image frame so this commit gets rid of the
> VE_INTERRUPT_CAPTURE_COMPLETE checking logic to simplify the logic.
> Handling of VE_INTERRUPT_CAPTURE_COMPLETE could be added back later
> when it's actually needed.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> Changes since v1:
>  None
> 
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
