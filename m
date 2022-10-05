Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DDC5F5D51
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 01:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjWYc4TJBz3bkP
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 10:51:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=io90ztoS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=io90ztoS;
	dkim-atps=neutral
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjWXy3hX9z30hw;
	Thu,  6 Oct 2022 10:50:41 +1100 (AEDT)
Received: by mail-vs1-xe30.google.com with SMTP id 3so482463vsh.5;
        Wed, 05 Oct 2022 16:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=kx6Wx0sJJqPpK7EB8zBcafQgWESIq3D1YHYnV5vi9x0=;
        b=io90ztoSpWXGa/05vz6ORJe05OOi3DmM8vp/dS83rcWW5B/NGjl2WcvuYsrJLoTmev
         yKK1yYlbhgLpe09k623rUOkoNJ1SPCaFL/udfsA/B71y+b1TtUU35l/jYj473jB99OU4
         xtPje/p9kNXw26pyTG4xsgOz1woFVzkrsGfIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kx6Wx0sJJqPpK7EB8zBcafQgWESIq3D1YHYnV5vi9x0=;
        b=45s6eex+PhGlfZ7J4vM0yV6eiEHbxybt86OJ31g4uu5TGrSPAuoO/4BssynaRS9ew9
         0r4zLeGJIvtQSDzKjUTrEFAkinUM4RtA0kdn1KvqY6gT5eJwB3vyR+igOKnvCAIIESfG
         TNvUOI/Jlo3aQYYaV1QlI8wS3U3G1egDCkVAcjUxVUochyT5+8IHyzcpx2KmdslbsJ/H
         nswiW34xV0tpEofHPxW/TwKp9UuIzQPzgSVDbfyY/WNujv6nzT7IiV0Ha9rqxmjCqJGA
         wsAGfS9M5mgEWG0EaWimcTNeIZ5D1PgHyS4E3Aq+Ee2yAsHYxTsSlhPjuNTaXslq3rTz
         qASg==
X-Gm-Message-State: ACrzQf1xw1w0+2hIzw/Pd9O/E0P4p+gs/N91EQ2Mkq3A05pGIyxSX5Ml
	tqEXG1+7TGrDz3bbApaSp8ouegNn8Tj0DhmiaK0=
X-Google-Smtp-Source: AMsMyM6WWdu+CA2L45dPSLzn51m5FH4S206qrxUtWl7qkLJM4GqsLMX6Y1pSTYkWsq2xKn7c0rz2sYFnqeU/hnvdGTM=
X-Received: by 2002:a05:6102:3d05:b0:398:7dce:8492 with SMTP id
 i5-20020a0561023d0500b003987dce8492mr1008369vsv.43.1665013836642; Wed, 05 Oct
 2022 16:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220812144741.240315-1-andrew@aj.id.au>
In-Reply-To: <20220812144741.240315-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Oct 2022 23:50:23 +0000
Message-ID: <CACPK8XdnFPXZuzAaSMOUnV6ng9y2_ZMcAff12q8Zxvr2HJZy-w@mail.gmail.com>
Subject: Re: [PATCH] ipmi: kcs: Poll OBF briefly to reduce OBE latency
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: minyard@acm.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 12 Aug 2022 at 14:48, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The ASPEED KCS devices don't provide a BMC-side interrupt for the host
> reading the output data register (ODR). The act of the host reading ODR
> clears the output buffer full (OBF) flag in the status register (STR),
> informing the BMC it can transmit a subsequent byte.
>
> On the BMC side the KCS client must enable the OBE event *and* perform a
> subsequent read of STR anyway to avoid races - the polling provides a
> window for the host to read ODR if data was freshly written while
> minimising BMC-side latency.
>

Fixes...?

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index cdc88cde1e9a..417e5a3ccfae 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -399,13 +399,31 @@ static void aspeed_kcs_check_obe(struct timer_list *timer)
>  static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 state)
>  {
>         struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
> +       int rc;
> +       u8 str;

str is status, it would be good to spell that out in full.

>
>         /* We don't have an OBE IRQ, emulate it */
>         if (mask & KCS_BMC_EVENT_TYPE_OBE) {
> -               if (KCS_BMC_EVENT_TYPE_OBE & state)
> -                       mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
> -               else
> +               if (KCS_BMC_EVENT_TYPE_OBE & state) {
> +                       /*
> +                        * Given we don't have an OBE IRQ, delay by polling briefly to see if we can
> +                        * observe such an event before returning to the caller. This is not
> +                        * incorrect because OBF may have already become clear before enabling the
> +                        * IRQ if we had one, under which circumstance no event will be propagated
> +                        * anyway.
> +                        *
> +                        * The onus is on the client to perform a race-free check that it hasn't
> +                        * missed the event.
> +                        */
> +                       rc = read_poll_timeout_atomic(aspeed_kcs_inb, str,
> +                                                     !(str & KCS_BMC_STR_OBF), 1, 100, false,
> +                                                     &priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
> +                       /* Time for the slow path? */

The mod_timer is the slow path? The question mark threw me.

> +                       if (rc == -ETIMEDOUT)
> +                               mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
> +               } else {
>                         del_timer(&priv->obe.timer);
> +               }
>         }
>
>         if (mask & KCS_BMC_EVENT_TYPE_IBF) {
> --
> 2.34.1
>
