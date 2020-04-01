Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D3219B8E5
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 01:20:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t2HN6d57zDr2J
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 10:20:32 +1100 (AEDT)
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
 header.s=fm2 header.b=Y7YjHwQv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=x/WSwKWM; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t2Gc3dk3zDrDJ
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 10:19:52 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0456F5C00D9;
 Wed,  1 Apr 2020 19:19:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 01 Apr 2020 19:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=SVJuJbykKBXtbVFZMud+v3reI6yjLp3
 3J4UCGxoewpY=; b=Y7YjHwQvlGguJmvDXu1Uk2vZnJL3CvGIBkwAD54ijKC9gPG
 tynWmbn5qFgGq3mbb1uagyYiDplIKZ5OUNFScW8KjE1gwiXnn4S7pLYgfOIt8I5J
 Nnk6pm7Aml1ddHA/C/IAfoQafFB1wKvsGmuXlIVV8fE/l31GDBg7uVxsdyYyvAYP
 b6C/ZHmNbi7ifoDZPdZASmWnLKfqnbk180AChWqVpn/wwJQ5Z2W4TJELzQKr/KOo
 nT2UlY5U4HpN+bMvK8Fcv8GtW0cDOaCupamukE76U65yZJBSTlC3O1qejWBovUuE
 Z3zB4lCHYmYV5GuidP354RLhv8Ron3iU8W5JUnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SVJuJb
 ykKBXtbVFZMud+v3reI6yjLp33J4UCGxoewpY=; b=x/WSwKWMBgV5tmjNhgghjR
 2O8M7JIsvegMlNuD2POn+nHiTaosN/2XfstL/YEjNQH/dkJm6oYVpFeNTRqYBrDX
 s+xanOnYd1MEGQnwpv20mU0gq44CZLSjwP22RZN0J3rrR9qSn6xltuNw7XotnVzf
 Y3ZxRxLDYy/IjsPErjL6szFDvakMbcUhpRAUMWEDNwecEkmAmvHNoW2cG+Com39d
 wkNiMt2l5QUtK4HYEh4+hLH9EeYRfWuRwtRLJC+ykcf0scs8E6lwpR8GXtfM46bl
 cW0QKag0V6wQFM5ySV7RoVrQsDLjr/9Jh3ksDB7YWG7SJx/zUVtJD+DGWr8M4ilQ
 ==
X-ME-Sender: <xms:lSGFXrM4zU7WHMZl-Fk2BlZyRQ3JigtRUK4qXPCWSos0DoUZaAndvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdefgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:lSGFXtoM91_syTy0KJB6FD2KZB7qV5qvQwOQ7kZ-bzY8eBTQUfI5hg>
 <xmx:lSGFXsdkYhlDxQ049UoK0BvWJP5ONSNGhzyAHWwDUQHjUeZj1Fa1rA>
 <xmx:lSGFXuY3jXd8z8HZnTujGbEwMJ7L46sAHYUq7suH34U7tn0JzUG8Tg>
 <xmx:lSGFXoL_lZcrdTtJ1-KAeeaZmFHioSLki54QOZyAi8QxF_AHjGd8bw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5FF65E0105; Wed,  1 Apr 2020 19:19:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1021-g152deaf-fmstable-20200319v1
Mime-Version: 1.0
Message-Id: <5946f131-ae13-4f31-bd13-e0d4e0daba65@www.fastmail.com>
In-Reply-To: <20200401163117.16921-1-eajames@linux.ibm.com>
References: <20200401163117.16921-1-eajames@linux.ibm.com>
Date: Thu, 02 Apr 2020 09:50:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_v2]_soc:_aspeed:_xdma:_Fix_command_bu?=
 =?UTF-8?Q?ffer_overrun?=
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



On Thu, 2 Apr 2020, at 03:01, Eddie James wrote:
> In the case of an operation requiring two commands, the edge case at
> the top of the command buffer was not handled, resulting in buffer
> overrun. Fix this by using a loop to copy the commands into the buffer
> and increment and modulo after each one.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/soc/aspeed/aspeed-xdma.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
> index 5d97919d38cf..7baeb20280b6 100644
> --- a/drivers/soc/aspeed/aspeed-xdma.c
> +++ b/drivers/soc/aspeed/aspeed-xdma.c
> @@ -430,15 +430,19 @@ static void aspeed_xdma_start(struct aspeed_xdma *ctx,
>  			      struct aspeed_xdma_op *op, u32 bmc_addr,
>  			      struct aspeed_xdma_client *client)
>  {
> +	unsigned int i;
>  	unsigned long flags;
>  	struct aspeed_xdma_cmd cmds[2];
>  	unsigned int rc = ctx->chip->set_cmd(ctx, cmds, op, bmc_addr);
>  
>  	mutex_lock(&ctx->start_lock);
>  
> -	memcpy(&ctx->cmdq[ctx->cmd_idx], cmds,
> -	       rc * sizeof(struct aspeed_xdma_cmd));
> -	ctx->cmd_idx = (ctx->cmd_idx + rc) % XDMA_NUM_CMDS;
> +	for (i = 0; i < rc; ++i) {
> +		memcpy(&ctx->cmdq[ctx->cmd_idx], &cmds[i],
> +		       sizeof(struct aspeed_xdma_cmd));

Bit of a nit, but it would be more obviously correct to me to do
`sizeof(ctx->cmdq[ctx->cmd_idx])`. However this wasn't something you changed as
part of this patch, so maybe it's a future enhancement.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +		ctx->cmd_idx = (ctx->cmd_idx + 1) % XDMA_NUM_CMDS;
> +	}
> +
>  	ctx->upstream = !!op->direction;
>  
>  	spin_lock_irqsave(&ctx->client_lock, flags);
> -- 
> 2.24.0
> 
>
