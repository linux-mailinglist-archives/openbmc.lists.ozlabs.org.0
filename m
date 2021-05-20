Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43A538B019
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 15:34:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm9gV69Znz307t
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 23:33:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oGzkT0Zm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oGzkT0Zm; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm9g93Q02z2yxq;
 Thu, 20 May 2021 23:33:40 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so14855511otg.2; 
 Thu, 20 May 2021 06:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ripHwk91l8LSQFM8vArK3vjCpqN/bvdKWF2j1HC8u6c=;
 b=oGzkT0ZmY2x/MysH0+yDGwQ6i3nB+q8OwVdNbavdjXd94rxmVyemCwy2Z8Mq5/yuYD
 B59b1TRGuVH5ecwvRHcA1WN1U5fGWRweQQAaB99PUHhma/s1ZVf0Tmi+dfpAYxZwfTKl
 cUKJ8eVJYIvNZzA+JlkbIGtvOzlkF3rR1JlTCtJ4rozr4qAcFWCJhb8nY3oNUZ7K1Zyi
 EZ3hnEbxPqR3Ki8O8A1JequprYOi+wj+bgEGVde5cnfNGC0Iuq9NLRRasKIjbLyN148C
 8/4FftsY+2L/BPAUq3E3LHIA1ljBXhbvr1+3IESlDuRR2dBwfiHVwEB4msdvaqApqfFL
 SxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=ripHwk91l8LSQFM8vArK3vjCpqN/bvdKWF2j1HC8u6c=;
 b=XDHju+Yk4nqTKWmOvANMg2sfKlh/B2Vumg9sc2yUi61y//r7X1PzPpaV3PCtYV/T+C
 8pU4pFVcSQi3HFwxnM8vQYBAKsU8gExZV/dKTCQd/i531rWAZxeu1OHAr9eE3ZxVtePx
 qV340sPfqx3WuhHCDU0Uz23o/N8z90mZKLQalMMXvU3l8FC8az2E6YDTHBL5fADssBeU
 rgJQ9QkDW+qJEXOkTopGbkLFNYkW+/0Ys0a9keKso3XtHGXHG1W8Bw6BY6LZGxhUDFAQ
 wYg7Z9Yl8O2vE32FIzCdfeszZzdL/CRQK9wQuhMCEFo0dX7yWPYEJnT8vtmtaW3TACZf
 ppzQ==
X-Gm-Message-State: AOAM533fHCCMNu0qmUIdugHzEAw4AqDg87mbSV4tTGZRitZywpeBhr7R
 NfgfS62t+SJfYtwHKXwcaA==
X-Google-Smtp-Source: ABdhPJwfdwmkwhxDmYQejkca84wENbYKz2nnMhRT8WLsQz8j3ij+A7Lt8Pum8A1B1aE5/0U4a7HSuQ==
X-Received: by 2002:a9d:855:: with SMTP id 79mr3754200oty.36.1621517616633;
 Thu, 20 May 2021 06:33:36 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id j16sm616665otn.55.2021.05.20.06.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 06:33:35 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:ecd2:e60e:d7a6:d643])
 by serve.minyard.net (Postfix) with ESMTPSA id 7EFFC18000C;
 Thu, 20 May 2021 13:33:34 +0000 (UTC)
Date: Thu, 20 May 2021 08:33:33 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 00/16] ipmi: Allow raw access to KCS devices
Message-ID: <20210520133333.GH2921206@minyard.net>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <5b549fee-63b1-4c05-a1d6-f6a13e235e1e@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b549fee-63b1-4c05-a1d6-f6a13e235e1e@www.fastmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 openipmi-developer@lists.sourceforge.net, Zev Weiss <zweiss@equinix.com>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 04:21:31PM +0930, Andrew Jeffery wrote:
> Hi Corey,
> 
> On Mon, 10 May 2021, at 15:11, Andrew Jeffery wrote:
> > Hello,
> > 
> > This is the 3rd spin of the series refactoring the keyboard-controller-style
> > device drivers in the IPMI subsystem.
> > 
> > v2 can be found (in two parts because yay patch workflow mistakes) at:
> > 
> > Cover letter:
> > https://lore.kernel.org/linux-arm-kernel/20210319061952.145040-1-andrew@aj.id.au/
> > 
> > Patches:
> > https://lore.kernel.org/linux-arm-kernel/20210319062752.145730-1-andrew@aj.id.au/
> > 
> > Several significant changes in v3:
> > 
> > 1. The series is rebased onto v5.13-rc1
> > 
> > 2. v5.13-rc1 includes Chiawei's patches reworking the LPC devicetree bindings,
> >    so they're no-longer required in the series.
> > 
> > 3. After some discussion with Arnd[1] and investigating the serio subsystem,
> >    I've replaced the "raw" KCS driver (patch 16/21 in v2) with a serio adaptor
> >    (patch 11/16 in this series). The adaptor allows us to take advantage of the
> >    existing chardevs provided by serio.
> > 
> > [1] 
> > https://lore.kernel.org/linux-arm-kernel/37e75b07-a5c6-422f-84b3-54f2bea0b917@www.fastmail.com/
> > 
> > Finally, I've also addressed Zev Weiss' review comments where I thought it was
> > required. These comments covered a lot of minor issues across (almost) all the
> > patches, so it's best to review from a clean slate rather than attempt to review
> > the differences between spins.
> 
> I backported this series for OpenBMC and posting those patches provoked
> some feedback:
> 
> * A bug identified in patch 9/18 for the Nuvoton driver where we enable
>   the OBE interrupt:
> 
> https://lore.kernel.org/openbmc/HK2PR03MB4371F006185ADBBF812A5892AE509@HK2PR03MB4371.apcprd03.prod.outlook.com/
> 
> * A discussion on patch 10/18 about lifting the single-open constraint
> 
> https://lore.kernel.org/openbmc/CAPnigKku-EjOnV9gsmnXzH=XZxSU78iLeccNbsK8k2_4b4UwSg@mail.gmail.com/
> 
> I need to do a v4 to fix the bug in the Nuvoton driver. Did you have any
> feedback for the remaining patches or thoughts on the discussions linked
> above?  I'd like to incorporate whatever I can into the series before
> respinning.

This will take a little while to review, but I'll try to get to it
today.

Thanks,

-corey

> 
> Cheers,
> 
> Andrew
