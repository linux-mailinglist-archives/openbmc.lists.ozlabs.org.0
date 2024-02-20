Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E948A85C4E5
	for <lists+openbmc@lfdr.de>; Tue, 20 Feb 2024 20:33:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NDPEtE/0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfV2R6LbDz3cN4
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 06:33:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NDPEtE/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=tcminyard@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfV1s4c74z2xWS;
	Wed, 21 Feb 2024 06:33:19 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6e2da00185dso3199553a34.1;
        Tue, 20 Feb 2024 11:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708457596; x=1709062396; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hS/yuuA0H0X0W3262oNsyvTh2OxC1cjSVmh94D2fzDk=;
        b=NDPEtE/0RnDCT94JbM7+no5xaq7/gngGwg6jDJRdUMVR0nbFFDqZOxWtsrHVJAl3Ry
         rrBY5KJ78YdeV5L4xiDLh1o0+De9AFSDRyNNOEtN3D8YscqesSRm3+eJv6UrN8RX8Qi/
         KG/HktD9Vl8qNNk7CYe7J2aPXWJ/NIXmLmc750RQnNWGnDmiq25VyHr8bzGenMqyTUDs
         1QFZuk5bGq2vu0f1mxeKGa6r6BqZa6PwUO6M/UzS/5JbWopJ7tdZT5xcCm59riB5D7la
         btI0VCcjdrD33Zd9H8l1wNZZaj1REMJ6/5EqQFcKokdA45jLIO94oH9k9uCVB3kXkkGE
         l/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708457596; x=1709062396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hS/yuuA0H0X0W3262oNsyvTh2OxC1cjSVmh94D2fzDk=;
        b=v7T5+RZ1SL41yyl75kaZpR7mUa2SJrYKPgotQ+Ybnk9VKNJeT//BoWgb8+oAM6MxsK
         HAfIiQkmr0TItM7QWkKKERz8o5lC4C7mx4HXYg3LEEVrvp2I1KkpmGxvd73GCsJs3u0W
         swQgOgJckRsGr2LgoDEUtjcWBAQj6ep8GjOhpMdH9EhiUuFwGSbDVZ7d8WdXdD/flcVY
         K2GenG7CATXl4ZDWntJAoTBpRb5ZgX6t6yTvgFEmJHi5n7kjP3X0h2CTJcMAX+UWE0wO
         FZHwj8GJPk48j+B2q8uD5vXwq62cx4LtPNQx28lAc/4diH08oLMYJ6f6wq3ueLtdSVf4
         nCmA==
X-Forwarded-Encrypted: i=1; AJvYcCXEalvq8aUiKA58kn5ruIdYSRMPshCtM5H38roMO6VRz5oyjPmLGC3qmoNz1GhDmYhuyR37i2s6U/3ibOEP/kDNRCBF2gDhEKw4HPt++YOmBNNXtiG0O5yEDKCaljVOqMiLLQ30YGnm
X-Gm-Message-State: AOJu0YxRUZrclLlSal/aCFyINCTxYK2/GBflq+A6HW03HuObB2NZsfGd
	SCa9knhQjSMUk9OuySrFhqpr7562Evz2mkjbWsVdP39lj5SvK9Q=
X-Google-Smtp-Source: AGHT+IG0hvt7fjbOEHQV8Nc2TWDmcMMjAJb0h6TKL9fNKwRKKCsDYjVbD6Wcn8GBqzXJtVr8GhRs5Q==
X-Received: by 2002:a05:6830:3d0d:b0:6e1:43a4:c412 with SMTP id eu13-20020a0568303d0d00b006e143a4c412mr15820908otb.32.1708457596316;
        Tue, 20 Feb 2024 11:33:16 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id j19-20020a9d7d93000000b006e2e7cb1da2sm1346756otn.66.2024.02.20.11.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 11:33:15 -0800 (PST)
Received: from mail.minyard.net (unknown [172.59.123.64])
	by serve.minyard.net (Postfix) with ESMTPSA id A27C61800BF;
	Tue, 20 Feb 2024 19:33:14 +0000 (UTC)
Date: Tue, 20 Feb 2024 13:33:13 -0600
From: Corey Minyard <minyard@acm.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH] ipmi: kcs: Update OBF poll timeout to reduce latency
Message-ID: <ZdT+eThnYqb3iawF@mail.minyard.net>
References: <20240220123615.963916-1-geissonator@gmail.com>
 <a9169894-6972-49c0-a1d4-d80863f5b511@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9169894-6972-49c0-a1d4-d80863f5b511@molgen.mpg.de>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openipmi-developer@lists.sourceforge.net, Andrew Geissler <geissonator@yahoo.com>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 20, 2024 at 04:51:21PM +0100, Paul Menzel wrote:
> Dear Andrew,
> 
> 
> Thank you for your patch. Some style suggestions.
> 
> Am 20.02.24 um 13:36 schrieb Andrew Geissler:
> > From: Andrew Geissler <geissonator@yahoo.com>
> 
> (Oh no, Yahoo. (ignore))
> 
> You could be more specific in the git commit message by using *Double*:
> 
> > ipmi: kcs: Double OBF poll timeout to reduce latency
> 
> > ipmi: kcs: Double OBF poll timeout to 200 us to reduce latency
> 
> > Commit f90bc0f97f2b ("ipmi: kcs: Poll OBF briefly to reduce OBE
> > latency") introduced an optimization to poll when the host has

I assume that removing that patch doesn't fix the issue, it would only
make it worse, right?

> > read the output data register (ODR). Testing has shown that the 100us
> > timeout was not always enough. When we miss that 100us window, it
> > results in 10x the time to get the next message from the BMC to the
> > host. When you're sending 100's of messages between the BMC and Host,
> 
> I do not understand, how this poll timeout can result in such an increase,
> and why a quite big timeout hurts, but I do not know the implementation.

It's because increasing that number causes it to poll longer for the
event, the host takes longer than 100us to generate the event, and if
the event is missed the time when it is checked again is very long.

Polling for 100us is already pretty extreme. 200us is really too long.

The real problem is that there is no interrupt for this.  I'd also guess
there is no interrupt on the host side, because that would solve this
problem, too, as it would certainly get around to handling the interupt
in 100us.  I'm assuming the host driver is not the Linux driver, as it
should also handle this in a timely manner, even when polling.

If people want hardware to perform well, they ought to design it and not
expect software to fix all the problems.

The right way to fix this is probably to do the same thing the host side
Linux driver does.  It has a kernel thread that is kicked off to do
this.  Unfortunately, that's more complicated to implement, but it
avoids polling in this location (which causes latency issues on the BMC
side) and lets you poll longer without causing issues.

I'll let the people who maintain that code comment.

-corey

> 
> > this results in a server boot taking 50% longer for IBM P10 machines.
> > 
> > Started with 1000 and worked it down until the issue started to reoccur.
> > 200 was the sweet spot in my testing. 150 showed the issue
> > intermittently.
> 
> I’d add a blank line here.
> 
> > Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
> > ---
> >   drivers/char/ipmi/kcs_bmc_aspeed.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> > index 72640da55380..af1eae6153f6 100644
> > --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> > +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> > @@ -422,7 +422,7 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
> >   			 * missed the event.
> >   			 */
> >   			rc = read_poll_timeout_atomic(aspeed_kcs_inb, str,
> > -						      !(str & KCS_BMC_STR_OBF), 1, 100, false,
> > +						      !(str & KCS_BMC_STR_OBF), 1, 200, false,
> >   						      &priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
> >   			/* Time for the slow path? */
> >   			if (rc == -ETIMEDOUT)
> 
> 
> Kind regards,
> 
> Paul
