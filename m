Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C8385E532
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 19:09:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bS7ByvFi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg4645wMBz3dLl
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 05:09:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bS7ByvFi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com; envelope-from=tcminyard@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg45R2mlHz3cRd;
	Thu, 22 Feb 2024 05:08:25 +1100 (AEDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-59fe5b77c0cso495670eaf.0;
        Wed, 21 Feb 2024 10:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708538900; x=1709143700; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yE3xYE9b0PADKF8ltORqAx3XVvlJ9P1Y3jeB29+/qOg=;
        b=bS7ByvFi2QZvPnqOThsyxvog50jv2Biwpvfd5DvCqJSdDBzHiG3/pd51ROCPaz4si0
         NWXQ3xESeENicoGN3NaittVe2I8Fm3jJMTFMuNj7PvGgq2UQNB/ZH+z3YENNgRBtWZig
         g+aXVjQxo0MeHQ4tdMTOEozmzB0bpBnn0Pg3awJLF3lGxxtwC/8e4SeSyCLyFPC4eVBh
         RkF5/7HJvDG9nUhGp0K3E4k499hA5E7yCsFLZN/U8B95ecR/0WkbvSRB/WEecGo04nNY
         yTy2Uo39uZXpO+aMzdKELG1YQVGMB3lfni8d5GZIA8PcFRPvoBJjVOVxrEkZYUcy/xHA
         XbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708538900; x=1709143700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE3xYE9b0PADKF8ltORqAx3XVvlJ9P1Y3jeB29+/qOg=;
        b=MZ1towLG9gd3lGf32JYZ4Vgn7We/YZfykkUKyRuzAh10ucIaeRJfh/30pQRpu8QdRI
         dwTFUsm3JRwncehGZrE7m4aQrkRhB0W9ZKYXdZClAAxkGLIrYD0w+LbSiYWwp73mft6G
         pqqMv5tGGojzW7lWIZR9yFqsCqGJGHVTC9Rfl/Szr3qtiKnR3G3qbSQMaNbxlQQLVPPC
         rWF9GR6iCeixys/2eyF6YJjoezhSu5mBZj4Gjpi0IsMz+un+nzANX/jr+3smTK9Mk4g6
         X8rHcz1hX/qfqIVsJ0XkIpzJ4vnb0F0X6xbOwsXnncWZZBFkm7hGtdKFpyW8nLxzav8Z
         MBJw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Wqxqkj93H6WoeG/2EXbZMy7W4d0VdEXU1LKoTtGJ3MaWfZNyHbVSstMohv+1spKV48JUp1raT+FafC1Ma3ZCG7s6lFYNQEwL+Bx5cbEjkLImw5fhedzXKO1KZohcqLygJRCvMcUn
X-Gm-Message-State: AOJu0YxANfgKT42H2893g9GdmxyUTN8nhHHwekgWXy1I6zd6MKR4nhsN
	5d3CHG13Yu9HmVRlFus++NGxm3aN3fiMCbwqQiYsMg5yXbnbc84=
X-Google-Smtp-Source: AGHT+IE7Jl89TMdslT9Xstr1epQWCcXolp3sqaBdeNYzQrNiseiNxKWZkq7GYlWCsP8bfbZaGYK6yg==
X-Received: by 2002:a4a:d2ce:0:b0:5a0:2a9:574b with SMTP id j14-20020a4ad2ce000000b005a002a9574bmr5993289oos.9.1708538899972;
        Wed, 21 Feb 2024 10:08:19 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id g6-20020a9d6206000000b006e2df00aaa8sm1665305otj.70.2024.02.21.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 10:08:19 -0800 (PST)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1d::35])
	by serve.minyard.net (Postfix) with ESMTPSA id 412431800B8;
	Wed, 21 Feb 2024 18:08:18 +0000 (UTC)
Date: Wed, 21 Feb 2024 12:08:16 -0600
From: Corey Minyard <minyard@acm.org>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: [PATCH] ipmi: kcs: Update OBF poll timeout to reduce latency
Message-ID: <ZdY8EDfeePse3c1s@mail.minyard.net>
References: <20240220123615.963916-1-geissonator@gmail.com>
 <a9169894-6972-49c0-a1d4-d80863f5b511@molgen.mpg.de>
 <ZdT+eThnYqb3iawF@mail.minyard.net>
 <9680ad7d7a48fc36a0572dc2286a1229a29341fe.camel@codeconstruct.com.au>
 <527F52AB-0070-43EA-BE82-945280CA2AEE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <527F52AB-0070-43EA-BE82-945280CA2AEE@gmail.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, openbmc@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, openipmi-developer@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 21, 2024 at 10:57:38AM -0600, Andrew Geissler wrote:
> 
> 
> > On Feb 20, 2024, at 4:36 PM, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
> > 
> > On Tue, 2024-02-20 at 13:33 -0600, Corey Minyard wrote:
> >> On Tue, Feb 20, 2024 at 04:51:21PM +0100, Paul Menzel wrote:
> >>> Dear Andrew,
> >> 
> >> It's because increasing that number causes it to poll longer for the
> >> event, the host takes longer than 100us to generate the event, and if
> >> the event is missed the time when it is checked again is very long.
> >> 
> >> Polling for 100us is already pretty extreme. 200us is really too long.
> >> 
> >> The real problem is that there is no interrupt for this.  I'd also guess
> >> there is no interrupt on the host side, because that would solve this
> >> problem, too, as it would certainly get around to handling the interupt
> >> in 100us.  I'm assuming the host driver is not the Linux driver, as it
> >> should also handle this in a timely manner, even when polling.
> > 
> > I expect the issues Andrew G is observing are with the Power10 boot
> > firmware. The boot firmware only polls. The runtime firmware enables
> > interrupts.
> 
> Yep, this is with the low level host boot firmware.
> Also, further testing over night showed that 200us wasn’t enough for
> our larger Everest P10 machines, I needed to go to 300us. As we
> were struggling to allow 200us, I assume 300us is going to be a no-go.

It seems odd to me that firmware polling would be an issue.  Usually,
with firmware, you have it just spinning waiting for something.  At
least in the firmware I worked with.

I'm not familiar with this firmware, though, maybe it has timers and
such and parallel execution.  Can this be fixed on the firmware side?

> 
> >> 
> > 
> >> 
> >> The right way to fix this is probably to do the same thing the host side
> >> Linux driver does.  It has a kernel thread that is kicked off to do
> >> this.  Unfortunately, that's more complicated to implement, but it
> >> avoids polling in this location (which causes latency issues on the BMC
> >> side) and lets you poll longer without causing issues.
> > 
> > In Andrew G's case he's talking MCTP over KCS using a vendor-defined
> > transport binding (that also leverages LPC FWH cycles for bulk data
> > transfers)[1]. I think it could have taken more inspiration from the
> > IPMI KCS protocol: It might be worth an experiment to write the dummy
> > command value to IDR from the host side after each ODR read to signal
> > the host's clearing of OBF (no interrupt for the BMC) with an IBF
> > (which does interrupt the BMC). And doing the obverse for the BMC. Some
> > brief thought suggests that if the dummy value is read there's no need
> > to send a dummy value in reply (as it's an indicator to read the status
> > register). With that the need for the spin here (or on the host side)
> > is reduced at the cost of some constant protocol overhead.
> > 
> 
> Thanks for the quick reviews and ideas.
> I’ll see if I can find someone on the team to help out with Andrew J’s
> thoughts and if that doesn’t work, look into the kernel thread idea.

I don't really understand Andrew J's ideas very well, but hopefully they
help.  The kernel thread idea is fairly complicated to implement, and
there has been an impetus in the kernel to not create new kernel
threads.  But there just has to be a good reason, and this probably is
one.  We worked on it a lot in the IPMI host driver to tune it and got
it to a point where it provided decent performance without causing power
management issues.  When I first read the title I was worried it was
talking about this code; I'm lothe to touch it for fear of breaking
things.

-corey
