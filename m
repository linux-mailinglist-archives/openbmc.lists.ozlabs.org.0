Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1C19A795
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 10:41:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sfmZ5h5lzDqwT
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 19:41:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=g42cBUjK; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sflj4pPSzDqg8
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 19:40:17 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id p60so12408561qva.5
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 01:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SQ7Gzij8TuAIo+pXsuvX4bOzT73YBorYk0fg8JAd9e8=;
 b=g42cBUjKEm0ss5I5eYEbYkxeTkaSVX4qPl0637qVj4iWCDCbfqNSu0obmscT8pBAv3
 Wy/4wT1VtzdOCNOiHh0fMo0gXrr2/UO6D5Wns4mB6eIvm8i0or27H/NCyCncmGE+l2qH
 psB7AQCWVgBAP+GTboPZprLHlQe1md/D8nCNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SQ7Gzij8TuAIo+pXsuvX4bOzT73YBorYk0fg8JAd9e8=;
 b=k7YVb+On9JDfShh1twtlWNXqZkKpMI0zx5EN16xkZ+pr9CuEgnip/NzQnuraqvAMGu
 YK+HjUKF0jYO2kSAqxyDaNK1OfJwfs5dZa52LHTzODxdOpR5Pk5Y3a6tbu9gFdqAJ8Lx
 OqpxZ/GsVL4+BuOnTOwKEz38U3mwV+CC0ywKLExqt0ZmSmNsb8jBccCJh9nosl3tJWqk
 MVnYqt79EL491fxMBr6deUQg3mWzU+B+otQuY6LnabJY7KXErVDZA+WS94SDD7Bj324S
 m+crSJCR3+fRkG+FJIN47F+QNGSrZr2S4KpvJW3POjrPOSeSC2XaBqQCSpRsPKgYjcsW
 pn9A==
X-Gm-Message-State: ANhLgQ2T7S+8e2eIZljwxwYFuwVxrvMSGqFFltNUu1bVltjl2bu2xxjS
 WuN9kWC/ECzdtjIhUBzxJpxiczhUamxEJ+3jT47GRuSFZwU=
X-Google-Smtp-Source: ADFU+vuZfs2urJKO0EKOTAjqjlSCCBeVrhIQlYg/X7oPk/cHV7RNOxHldfIbNDQfSl6z9YNw9yBanlqsbjnG3R5zexg=
X-Received: by 2002:a0c:fc03:: with SMTP id z3mr19274229qvo.210.1585730413847; 
 Wed, 01 Apr 2020 01:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200331215600.5507-1-eajames@linux.ibm.com>
In-Reply-To: <20200331215600.5507-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2020 08:40:01 +0000
Message-ID: <CACPK8Xfit8NNDjMkfqyjgjkhJ=bKGzqfeNpK2ksA7igYwsTCtQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4] soc: aspeed: xdma: Fix command buffer
 overrun
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 31 Mar 2020 at 21:56, Eddie James <eajames@linux.ibm.com> wrote:
>
> In the case of an operation requiring two commands, it was possible to
> copy the second command into the user's memory space, which also
> prevents the command from completing since the first doesn't trigger an
> interrupt. Test for this special case and prevent it.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/soc/aspeed/aspeed-xdma.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
> index 5d97919d38cf..d0a56a5a81ae 100644
> --- a/drivers/soc/aspeed/aspeed-xdma.c
> +++ b/drivers/soc/aspeed/aspeed-xdma.c
> @@ -436,6 +436,13 @@ static void aspeed_xdma_start(struct aspeed_xdma *ctx,
>
>         mutex_lock(&ctx->start_lock);
>
> +       if ((rc == 2) && (ctx->cmd_idx == (XDMA_NUM_CMDS - 1))) {

I don't understand what's going on here, so I'm going to explain what
I read and you can correct me.

rc in this case is the command number? so this operation is attempting
to queue up the second of our "two commands" you mention in the commit
message?

We're saying if the second command is the last cmd_idx, we reset the
write pointer back to zero.

We don't reset the pointer back to zero anywhere else in the driver.
Why do we special case this case?

> +               aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_readp,
> +                                  XDMA_BMC_CMDQ_READP_RESET);
> +               aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_writep, 0);
> +               ctx->cmd_idx = 0;
> +       }
> +
>         memcpy(&ctx->cmdq[ctx->cmd_idx], cmds,
>                rc * sizeof(struct aspeed_xdma_cmd));
>         ctx->cmd_idx = (ctx->cmd_idx + rc) % XDMA_NUM_CMDS;
> --
> 2.24.0
>
