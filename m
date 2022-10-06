Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ADC5F695D
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 16:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjtdG4xKcz3ds2
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 01:10:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B/MELwvx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B/MELwvx;
	dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjtcZ5KVBz30F7;
	Fri,  7 Oct 2022 01:10:05 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id g2so1073216qkk.1;
        Thu, 06 Oct 2022 07:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntnmdCz7v5r64kcnWi8DSkoYbZLsQCVuJJM9qyrDCnw=;
        b=B/MELwvxGHOUB9n/4IZqtXNP45/GUA/qzSkuclVSpXk/hHNETuFosn1BksqfdAO6YC
         Uk7s0kBfRcQno51w58ZZeR1JRQ1FTx0KFzVowH5ahSpQFM00sjiLAqu/8a/6V2kjdyFE
         BOaF5+dyP6N9n6rqssedaIY+lIsodO8jDsqxqQBbqPohnWSKRIraCSTiiKRhNJUswxrA
         4OuQOHS8dxZNaz8aBi+/Q0+h81aVB2UEnUYx43vpmtGk6gpAbkgxX8X/+FJPS0zlByMk
         QEl/foNsH27xCm2+Aj2r75obbZHv8GOoPql58jPWQ960t+qDJUHVZ0NHmJQhg+RSFZuv
         gUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntnmdCz7v5r64kcnWi8DSkoYbZLsQCVuJJM9qyrDCnw=;
        b=2lrg2pcHTs6uMvDj1+QRhUr9dxXZ5VLC+SvGf2+6SdZ317PM1IzjT6DXfoaOCOkf7s
         ZPvMBtd+clTN1SIFUX2vzmcEdFOA+ZxJfmhEgUQkVsM3TTe3K8vscrdbIaENIzmC9yXy
         +gx0H90sYjn25NBTklvoDyYEZOy2ywsnx/iwdQB9sSl9ehaKOl0wrZTBrM5mZ7N1BP1v
         9x/+nfh6+OfCQ/bPoD8/BI5CrjK4v/EsvKYhCr+0dJ+khZHDgFa3Zdu18nLsxCdNrGFw
         HeaOs4lL7T7E2o0IC4WU9HE5/iOFmj+IDJlHlqssrXr2P6JjIM9j7afuFaX3HR16iH1C
         q4Kg==
X-Gm-Message-State: ACrzQf2PD77kW7nFOWi7b4ahpJz8QgsRJZIUUWkY6hXUwBXOAAYSbT3C
	twCB2DJJ+TuInMmzV6CtMg==
X-Google-Smtp-Source: AMsMyM73nX69TZE1+MgUVtlQx7xVnxr/lUPIFB2FR88zpn3YmI15D7PxjegZ0vi/YooQMgojpkOXKQ==
X-Received: by 2002:a37:9302:0:b0:6ce:3765:eb95 with SMTP id v2-20020a379302000000b006ce3765eb95mr130459qkd.177.1665065401988;
        Thu, 06 Oct 2022 07:10:01 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.126])
        by smtp.gmail.com with ESMTPSA id o18-20020a05620a111200b006b98315c6fbsm3686391qkk.1.2022.10.06.07.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:10:01 -0700 (PDT)
Received: from dell1.minyard.net (unknown [IPv6:2001:470:b8f6:1d::35])
	by serve.minyard.net (Postfix) with ESMTPSA id 8D0D2180015;
	Thu,  6 Oct 2022 14:09:59 +0000 (UTC)
Date: Thu, 6 Oct 2022 09:09:57 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] ipmi: kcs: Poll OBF briefly to reduce OBE latency
Message-ID: <Yz7htdRvb+IhU060@dell1.minyard.net>
References: <20220812144741.240315-1-andrew@aj.id.au>
 <CACPK8XdnFPXZuzAaSMOUnV6ng9y2_ZMcAff12q8Zxvr2HJZy-w@mail.gmail.com>
 <f6a85e5e-a3b1-4e5c-9db6-1222dcabd780@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6a85e5e-a3b1-4e5c-9db6-1222dcabd780@app.fastmail.com>
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
Reply-To: minyard@acm.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 06, 2022 at 01:36:51PM +1030, Andrew Jeffery wrote:
> 
> 
> On Thu, 6 Oct 2022, at 10:20, Joel Stanley wrote:
> > On Fri, 12 Aug 2022 at 14:48, Andrew Jeffery <andrew@aj.id.au> wrote:
> >>
> >> The ASPEED KCS devices don't provide a BMC-side interrupt for the host
> >> reading the output data register (ODR). The act of the host reading ODR
> >> clears the output buffer full (OBF) flag in the status register (STR),
> >> informing the BMC it can transmit a subsequent byte.
> >>
> >> On the BMC side the KCS client must enable the OBE event *and* perform a
> >> subsequent read of STR anyway to avoid races - the polling provides a
> >> window for the host to read ODR if data was freshly written while
> >> minimising BMC-side latency.
> >>
> >
> > Fixes...?
> 
> Is it a fix though? It's definitely an *improvement* in behaviour, but 
> the existing behaviour also wasn't *incorrect*, just kinda unfortunate 
> under certain timings? Dunno. I'm probably splitting hairs.
> 
> In any case, if we do want a fixes line:
> 
> Fixes: 28651e6c4237 ("ipmi: kcs_bmc: Allow clients to control KCS IRQ state")

I added the Fixes and Joel's review.

Thanks,

-corey

> 
> >
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Thanks!
> 
> >
> >> ---
> >>  drivers/char/ipmi/kcs_bmc_aspeed.c | 24 +++++++++++++++++++++---
> >>  1 file changed, 21 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> >> index cdc88cde1e9a..417e5a3ccfae 100644
> >> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> >> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> >> @@ -399,13 +399,31 @@ static void aspeed_kcs_check_obe(struct timer_list *timer)
> >>  static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 state)
> >>  {
> >>         struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
> >> +       int rc;
> >> +       u8 str;
> >
> > str is status, it would be good to spell that out in full.
> 
> I guess if it trips enough people up we can rename it later.
> 
> >
> >>
> >>         /* We don't have an OBE IRQ, emulate it */
> >>         if (mask & KCS_BMC_EVENT_TYPE_OBE) {
> >> -               if (KCS_BMC_EVENT_TYPE_OBE & state)
> >> -                       mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
> >> -               else
> >> +               if (KCS_BMC_EVENT_TYPE_OBE & state) {
> >> +                       /*
> >> +                        * Given we don't have an OBE IRQ, delay by polling briefly to see if we can
> >> +                        * observe such an event before returning to the caller. This is not
> >> +                        * incorrect because OBF may have already become clear before enabling the
> >> +                        * IRQ if we had one, under which circumstance no event will be propagated
> >> +                        * anyway.
> >> +                        *
> >> +                        * The onus is on the client to perform a race-free check that it hasn't
> >> +                        * missed the event.
> >> +                        */
> >> +                       rc = read_poll_timeout_atomic(aspeed_kcs_inb, str,
> >> +                                                     !(str & KCS_BMC_STR_OBF), 1, 100, false,
> >> +                                                     &priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
> >> +                       /* Time for the slow path? */
> >
> > The mod_timer is the slow path? The question mark threw me.
> 
> Yeah, mod_timer() is the slow path; read_poll_timeout_atomic() is the 
> fast path and we've exhausted the time we're willing to wait there if 
> we get -ETIMEDOUT.
> 
> The comment was intended as a description for the question posed by the 
> condition. It made sense in my head but maybe it's confusing more than 
> it is enlightening?
> 
> Andrew
> 
> >
> >> +                       if (rc == -ETIMEDOUT)
> >> +                               mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
> >> +               } else {
> >>                         del_timer(&priv->obe.timer);
> >> +               }
> >>         }
> >>
> >>         if (mask & KCS_BMC_EVENT_TYPE_IBF) {
> >> --
> >> 2.34.1
> >>
