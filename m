Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38C358308
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 14:15:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGKvw0nDSz3bTd
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 22:15:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mKGwQVrj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mKGwQVrj; dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGKvY5NFCz2yZN;
 Thu,  8 Apr 2021 22:14:48 +1000 (AEST)
Received: by mail-ot1-x332.google.com with SMTP id
 c24-20020a9d6c980000b02902662e210895so2022235otr.9; 
 Thu, 08 Apr 2021 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6XAhQ7UcLowTOFuknmiiz3l9yHn53zqLA0X1TJ7OGFM=;
 b=mKGwQVrjFhmAB1xVjWpDfDHvVCxz8zBcI9Nzk2DmvUC97kddZ6S+BZuwAQGgkLMulE
 g5QIXRlV4u8flJRfwrogbYN5VFo6RJexvfAbfIv3zOzMKr8fcoC1BPZ5vgWt8kt84jFZ
 pkfb3FnpcNMVFUVORgkVwB3rLmLV5yT1DWV1A/ybaxgRxp4LlYCOTKpD4LijQcRgtxhS
 eX8fkbH10jbMyDqtKx1jB74bCqges5HBEdRQRCqnu0wWiICKJrl/08cLLZHqIV3nMWjT
 yQQGpTg8Ke/sk1nMnFjSezraTnGt/ReG2opUmDd6jFgq44Ez5av/n91g6qLapLHSlcYs
 MjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=6XAhQ7UcLowTOFuknmiiz3l9yHn53zqLA0X1TJ7OGFM=;
 b=kWj/ui96UNtbV+oFx+y9kbm7H6osA1TWgV3qsSXVn/nyUxZnjt9EL+EaKyx/8vyVAT
 BINOJjdbfa5Wk2mt805SUPsaQsR08Obd1PUHBPaIeWYYZTozJpPlFo7F0sptXUt/Z2df
 Iz56rpfUlZdYsWxg6QFlr7UU8vZWBLQG1KOHAJjz6afqpauGPwcKE8MkaQixI9i8i+5Q
 oLxX8xeLX17JFZZFBqQVQTYE5fKwWPlvROLnm9JCcrEHuffdQttmgLHjBLmGI4pJg8k4
 AwX3X73rfhtKZYsqwsV/oSA2MmDHxCWM3MCUstWOffdVTRMmV4uwFEYiVS1SgXGIxcEu
 Y70A==
X-Gm-Message-State: AOAM530WR2uPS1h7t17pqmTPcwW84h0pwbSJnI9AL8Vh2vL1IoUH5LjM
 1f/9ncw3UHJJoq4XPGNFlA==
X-Google-Smtp-Source: ABdhPJyxCdHxEFJ2vM9wKL7LXeV6po7ehyIYkmmdKbv3giqugax0r44l+zBeui3PyxG1sSWb/xMbQA==
X-Received: by 2002:a9d:d0d:: with SMTP id 13mr7004431oti.134.1617884085495;
 Thu, 08 Apr 2021 05:14:45 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id h20sm5225748oor.8.2021.04.08.05.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 05:14:44 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:f036:ecd9:2bd0:ef09])
 by serve.minyard.net (Postfix) with ESMTPSA id C877C180053;
 Thu,  8 Apr 2021 12:14:42 +0000 (UTC)
Date: Thu, 8 Apr 2021 07:14:41 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
Message-ID: <20210408121441.GG7166@minyard.net>
References: <20210319061952.145040-1-andrew@aj.id.au>
 <2db77e16-3f44-4c02-a7ba-a4fac8141ae3@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2db77e16-3f44-4c02-a7ba-a4fac8141ae3@www.fastmail.com>
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
Cc: devicetree@vger.kernel.org, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 08, 2021 at 10:27:46AM +0930, Andrew Jeffery wrote:
> Hi Corey,
> 
> On Fri, 19 Mar 2021, at 16:49, Andrew Jeffery wrote:
> > Hello,
> > 
> > This series is a bit of a mix of things, but its primary purpose is to
> > expose BMC KCS IPMI devices to userspace in a way that enables userspace
> > to talk to host firmware using protocols that are not IPMI.
> > 
> > v1 can be found here:
> > 
> > https://lore.kernel.org/openbmc/20210219142523.3464540-1-andrew@aj.id.au/
> > 
> > Changes in v2 include:
> > 
> > * A rebase onto v5.12-rc2
> > * Incorporation of off-list feedback on SerIRQ configuration from
> >   Chiawei
> > * Further validation on hardware for ASPEED KCS devices 2, 3 and 4
> > * Lifting the existing single-open constraint of the IPMI chardev
> > * Fixes addressing Rob's feedback on the conversion of the ASPEED KCS
> >   binding to dt-schema
> > * Fixes addressing Rob's feedback on the new aspeed,lpc-interrupts
> >   property definition for the ASPEED KCS binding
> > 
> > A new chardev device is added whose implementation exposes the Input
> > Data Register (IDR), Output Data Register (ODR) and Status Register
> > (STR) via read() and write(), and implements poll() for event
> > monitoring.
> > 
> > The existing /dev/ipmi-kcs* chardev interface exposes the KCS devices in
> > a way which encoded the IPMI protocol in its behaviour. However, as
> > LPC[0] KCS devices give us bi-directional interrupts between the host
> > and a BMC with both a data and status byte, they are useful for purposes
> > beyond IPMI.
> > 
> > As a concrete example, libmctp[1] implements a vendor-defined MCTP[2]
> > binding using a combination of LPC Firmware cycles for bulk data
> > transfer and a KCS device via LPC IO cycles for out-of-band protocol
> > control messages[3]. This gives a throughput improvement over the
> > standard KCS binding[4] while continuing to exploit the ease of setup of
> > the LPC bus for early boot firmware on the host processor.
> > 
> > The series takes a bit of a winding path to achieve its aim:
> > 
> > 1. It begins with patches 1-5 put together by Chia-Wei, which I've
> > rebased on v5.12-rc2. These fix the ASPEED LPC bindings and other
> > non-KCS LPC-related ASPEED device drivers in a way that enables the
> > SerIRQ patches at the end of the series. With Joel's review I'm hoping
> > these 5 can go through the aspeed tree, and that the rest can go through
> > the IPMI tree.
> > 
> > 2. Next, patches 6-13 fairly heavily refactor the KCS support in the
> > IPMI part of the tree, re-architecting things such that it's possible to
> > support multiple chardev implementations sitting on top of the ASPEED
> > and Nuvoton device drivers. However, the KCS code didn't really have
> > great separation of concerns as it stood, so even if we disregard the
> > multiple-chardev support I think the cleanups are worthwhile.
> > 
> > 3. Patch 14 adds some interrupt management capabilities to the KCS
> > device drivers in preparation for patch 16, which introduces the new
> > "raw" KCS device interface. I'm not stoked about the device name/path,
> > so if people are looking to bikeshed something then feel free to lay
> > into that.
> > 
> > 4. The remaining patches switch the ASPEED KCS devicetree binding to
> > dt-schema, add a new interrupt property to describe the SerIRQ behaviour
> > of the device and finally clean up Serial IRQ support in the ASPEED KCS
> > driver.
> > 
> > Rob: The dt-binding patches still come before the relevant driver
> > changes, I tried to keep the two close together in the series, hence the
> > bindings changes not being patches 1 and 2.
> > 
> > I've exercised the series under qemu with the rainier-bmc machine plus
> > additional patches for KCS support[5]. I've also substituted this series in
> > place of a hacky out-of-tree driver that we've been using for the
> > libmctp stack and successfully booted the host processor under our
> > internal full-platform simulation tools for a Rainier system.
> > 
> > Note that this work touches the Nuvoton driver as well as ASPEED's, but
> > I don't have the capability to test those changes or the IPMI chardev
> > path. Tested-by tags would be much appreciated if you can exercise one
> > or both.
> > 
> > Please review!
> 
> Unfortunately the cover letter got detached from the rest of the series.
> 
> Any chance you can take a look at the patches?

There were some minor concerns that were unanswered, and there really
was no review by others for many of the patches.

I would like this patch set, it makes some good cleanups.  But I would
like some more review and testing by others, if possible.  I'm fairly
sure it has already been done, it just needs to be documented.

-corey

> 
> https://lore.kernel.org/linux-arm-kernel/20210319062752.145730-1-andrew@aj.id.au/
> 
> Cheers,
> 
> Andrew
