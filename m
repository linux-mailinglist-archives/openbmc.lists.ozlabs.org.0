Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CEE179639
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 18:03:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XgFH02jBzDqcG
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 04:03:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XabP4KAA; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XgDX2b4LzDqX2
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 04:02:50 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id g12so1274896plo.3
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 09:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N9lOtVrft0/qB707n6HjzkBxcOjRFvTGY92Y8JzpDCQ=;
 b=XabP4KAApP77XUAYcTnaIzXQeuabw9MkJ0yRu6X8zGBT+xeGPMG7bwJf1sX53KoR/p
 L09+g2GDYU1oTPBxZAvl+zxP0lcii67bfIpL6/nQJTIdkXFaWJEdavS1VUGZ/VwKnUOT
 bbLmQoiMta+UPN0T53/2FLS90bd6d9OJtJ6pU/j02DKVv+ZDWKa7AX42mxClYzILIzTD
 4A/3xllTeQN8PUVk3EMmJZdmJ9Mfr9/5alqR6qNLy43X+ZMwsq4J1HsRP1DSrJ44hHHP
 AAtwRewPBGHDO2IJrF0XyerLMkRwCAY++ypMhtVqCpBslhW5+bB6nH+lKA6NbZ6NRkvB
 YEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=N9lOtVrft0/qB707n6HjzkBxcOjRFvTGY92Y8JzpDCQ=;
 b=fSpbFSa3I0G8zEVlDbcWj84s1jOIqmnfJS5yFabBbYfDxBMGeUnINFJ89d9HMqlfBv
 FklMmXeQAoH0DdMu5Ah+XUaS8UNvteprXomX82iLdneBYq6Bo7C9sMX3M5tCPz2SL6KN
 4gOHZs3UNXWhXUSIVRXSQAsZMHg0RcFL46mThP+vA2Ub2xjjOblLbXmGP5dozS1RvfM5
 Uo/A4lF0dZdFc3j5j5NsV0otmGNj/33BraT4vfubrn9qPS6vxbNc3py3Z89Zcoq2Iet+
 rpT4sZKmdLL5AkZDHdMAgjO7ppmnMnu+8K3iDQSaf0Y7ZW5nUxOb4xWLvZ35zqOINans
 2tdg==
X-Gm-Message-State: ANhLgQ2Wf05r5f6698eLdgq/GxqPYD4octr0TGMza3mVE/HZQQCMpTWT
 X/2lfD+HFyO8K+8EGq0DPMI=
X-Google-Smtp-Source: ADFU+vuHh3uIaECJkr38nrkoc1tUd41kATobscfYurPIlrK7EFpgGljUrjyHqxOx5ZtQW8+RyFGOTw==
X-Received: by 2002:a17:902:b085:: with SMTP id
 p5mr3882183plr.218.1583341367729; 
 Wed, 04 Mar 2020 09:02:47 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b184sm15647035pfb.89.2020.03.04.09.02.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Mar 2020 09:02:46 -0800 (PST)
Date: Wed, 4 Mar 2020 09:02:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 3/3] watchdog: npcm: remove whitespaces
Message-ID: <20200304170245.GA22851@roeck-us.net>
References: <20200303100114.87786-1-tmaimon77@gmail.com>
 <20200303100114.87786-4-tmaimon77@gmail.com>
 <20200303212512.GA20448@roeck-us.net>
 <CAP6Zq1gW53NEH7vD9C9GK2sg1pOxeZinA5uMJQQmbntrf=2ySA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1gW53NEH7vD9C9GK2sg1pOxeZinA5uMJQQmbntrf=2ySA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 04, 2020 at 10:18:12AM +0200, Tomer Maimon wrote:
> Hi Guenter,
> 
> I still see the whitespaces warning in v5.6-rc4
> 
> https://github.com/torvalds/linux/blob/master/drivers/watchdog/npcm_wdt.c#L106
> 
You are corerct, sorry. No idea what I looked at yesterday.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> bash-4.2$ ./scripts/checkpatch.pl --strict --file
> drivers/watchdog/npcm_wdt.c
> CHECK: Please don't use multiple blank lines
> #106: FILE: drivers/watchdog/npcm_wdt.c:106:
> +
> +
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #112: FILE: drivers/watchdog/npcm_wdt.c:112:
> + else if (timeout < 3)
> +      wdd->timeout = 2;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #114: FILE: drivers/watchdog/npcm_wdt.c:114:
> + else if (timeout < 6)
> +      wdd->timeout = 5;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #116: FILE: drivers/watchdog/npcm_wdt.c:116:
> + else if (timeout < 11)
> +      wdd->timeout = 10;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #118: FILE: drivers/watchdog/npcm_wdt.c:118:
> + else if (timeout < 22)
> +      wdd->timeout = 21;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #120: FILE: drivers/watchdog/npcm_wdt.c:120:
> + else if (timeout < 44)
> +      wdd->timeout = 43;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #122: FILE: drivers/watchdog/npcm_wdt.c:122:
> + else if (timeout < 87)
> +      wdd->timeout = 86;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #124: FILE: drivers/watchdog/npcm_wdt.c:124:
> + else if (timeout < 173)
> +      wdd->timeout = 172;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #126: FILE: drivers/watchdog/npcm_wdt.c:126:
> + else if (timeout < 688)
> +      wdd->timeout = 687;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #128: FILE: drivers/watchdog/npcm_wdt.c:128:
> + else
> +      wdd->timeout = 2750;
> 
> Thanks,
> 
> Tomer
> 
> On Tue, 3 Mar 2020 at 23:25, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > On Tue, Mar 03, 2020 at 12:01:14PM +0200, Tomer Maimon wrote:
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >
> > Turns out this problem does not actually exist in the upstream driver
> > (as of v5.6-rc4). You might want to align your code with the upstream
> > kernel.
> >
> > Guenter
> >
> > > ---
> > >  drivers/watchdog/npcm_wdt.c | 19 +++++++++----------
> > >  1 file changed, 9 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> > > index 84a728af6664..bd38bf1ee6a1 100644
> > > --- a/drivers/watchdog/npcm_wdt.c
> > > +++ b/drivers/watchdog/npcm_wdt.c
> > > @@ -123,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device
> > *wdd)
> > >       return 0;
> > >  }
> > >
> > > -
> > >  static int npcm_wdt_set_timeout(struct watchdog_device *wdd,
> > >                               unsigned int timeout)
> > >  {
> > >       if (timeout < 2)
> > >               wdd->timeout = 1;
> > >       else if (timeout < 3)
> > > -           wdd->timeout = 2;
> > > +             wdd->timeout = 2;
> > >       else if (timeout < 6)
> > > -           wdd->timeout = 5;
> > > +             wdd->timeout = 5;
> > >       else if (timeout < 11)
> > > -           wdd->timeout = 10;
> > > +             wdd->timeout = 10;
> > >       else if (timeout < 22)
> > > -           wdd->timeout = 21;
> > > +             wdd->timeout = 21;
> > >       else if (timeout < 44)
> > > -           wdd->timeout = 43;
> > > +             wdd->timeout = 43;
> > >       else if (timeout < 87)
> > > -           wdd->timeout = 86;
> > > +             wdd->timeout = 86;
> > >       else if (timeout < 173)
> > > -           wdd->timeout = 172;
> > > +             wdd->timeout = 172;
> > >       else if (timeout < 688)
> > > -           wdd->timeout = 687;
> > > +             wdd->timeout = 687;
> > >       else
> > > -           wdd->timeout = 2750;
> > > +             wdd->timeout = 2750;
> > >
> > >       if (watchdog_active(wdd))
> > >               npcm_wdt_start(wdd);
> >
