Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421F38CC49
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 19:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmv151RXyz30C1
	for <lists+openbmc@lfdr.de>; Sat, 22 May 2021 03:36:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CTE2dQFp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2f;
 helo=mail-oo1-xc2f.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CTE2dQFp; dkim-atps=neutral
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmv0n4CBmz2xv1;
 Sat, 22 May 2021 03:36:22 +1000 (AEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 s24-20020a4aead80000b02901fec6deb28aso4745188ooh.11; 
 Fri, 21 May 2021 10:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=xsZwyz8bU4yD245jhx9rPS0/zoGZWsugEiI8VeaXwz4=;
 b=CTE2dQFpKlqhV9xA3GSGL8nDvpghVK9LimwK1q3I8P0dnbBZqSYYbFz55efe5eyVDt
 Qit5eNZ2mo8/DdfUIQtWsHmKZWItaKl9jpUZUxi5un1GFMYhTc7fb9BRsYpHaF8a1A7F
 gdnOzm3Vo8MRhsJtXus9p2hh6CGz1j/jQWGHew+EzO1DuP9nVxvKY2CQh99vvyU/uOwM
 yQlHV3e74CVYPd+P2IJrQbwbH8bynY9hHkGTlrHQ4ghvd9aZpKvOXlOvq8YGwb/LG7gM
 1EB5cyNm7AsaN15riAgXWNW/RJ4KC9uZHXb0KFLpfCw7Xm/mOA0LPg8vck01Yv4JoowH
 pNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=xsZwyz8bU4yD245jhx9rPS0/zoGZWsugEiI8VeaXwz4=;
 b=MI+Ea1GIPqwodYeYEyl55cxTKHItSaz9Wy5C0Bww8omKT+kfl2ewqqxtfA8K3e9aFb
 em3dH7IZ1YGB4viAastKntSPGkRO5f3+EYo4qhMq5YyRnTWLK48D4n9GbqEFSsM0h9+f
 INVJi3IhFm6bEMkEPYLMY/8aUgwADXEcl0pGID1vspDOUWjeQ11/J7rLzU7GqyTXtUmp
 gFdEM4sKVC7Ukuh5gHKC7KrR+FMW0gQqtDH4LRYggOkHSH4bllLMDEuRtgoAyBPXI7w6
 /uutWMBbl6Z+wqHs77qazD715FB/R43FR8fj3cGA9GCYdGX2mkqRORCE4Cg2mWesZhO/
 dDKQ==
X-Gm-Message-State: AOAM532EvlPxrO2zNKD2x2gbNmK34vCEhljlIWXKTZ29dkRHWpkV82/U
 4FHVeb/HYYkQ24iQ6W3Bog==
X-Google-Smtp-Source: ABdhPJzbCHFdLAdHPLmr/dH91nFshv8QRe7ey6knMySKTHguizVh3ISRUyFZezmXrFL/yp5yhV0qcQ==
X-Received: by 2002:a4a:c88f:: with SMTP id t15mr9071550ooq.84.1621618579446; 
 Fri, 21 May 2021 10:36:19 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id f2sm1373733otp.77.2021.05.21.10.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:36:18 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9c8f:21cb:3961:b550])
 by serve.minyard.net (Postfix) with ESMTPSA id 95ABE180105;
 Fri, 21 May 2021 17:36:17 +0000 (UTC)
Date: Fri, 21 May 2021 12:36:16 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 00/16] ipmi: Allow raw access to KCS devices
Message-ID: <20210521173616.GK2921206@minyard.net>
References: <20210510054213.1610760-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510054213.1610760-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 robh+dt@kernel.org, arnd@arndb.de, openipmi-developer@lists.sourceforge.net,
 zweiss@equinix.com, chiawei_wang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 03:11:57PM +0930, Andrew Jeffery wrote:
> Hello,
> 
> This is the 3rd spin of the series refactoring the keyboard-controller-style
> device drivers in the IPMI subsystem.

This is a nice set of cleanups outside of just allowing raw access.
I'll let you handle Zev's comments and a few of mine.

I almost hate to ask this, but would there be value in allowing the BT
driver to use this abstract interface?  Or maybe it would be just too
hard to get a common abstraction, more work than it's worth.  It's
surprising that more people don't want BT as it's vastly superior to
KCS.  Just a thought for now.  I guess there's SMIC, but hopefully
nobody wants that.

-corey

> 
> v2 can be found (in two parts because yay patch workflow mistakes) at:
> 
> Cover letter:
> https://lore.kernel.org/linux-arm-kernel/20210319061952.145040-1-andrew@aj.id.au/
> 
> Patches:
> https://lore.kernel.org/linux-arm-kernel/20210319062752.145730-1-andrew@aj.id.au/
> 
> Several significant changes in v3:
> 
> 1. The series is rebased onto v5.13-rc1
> 
> 2. v5.13-rc1 includes Chiawei's patches reworking the LPC devicetree bindings,
>    so they're no-longer required in the series.
> 
> 3. After some discussion with Arnd[1] and investigating the serio subsystem,
>    I've replaced the "raw" KCS driver (patch 16/21 in v2) with a serio adaptor
>    (patch 11/16 in this series). The adaptor allows us to take advantage of the
>    existing chardevs provided by serio.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/37e75b07-a5c6-422f-84b3-54f2bea0b917@www.fastmail.com/
> 
> Finally, I've also addressed Zev Weiss' review comments where I thought it was
> required. These comments covered a lot of minor issues across (almost) all the
> patches, so it's best to review from a clean slate rather than attempt to review
> the differences between spins.
> 
> Previously:
> 
> Changes in v2 include:
> 
> * A rebase onto v5.12-rc2
> * Incorporation of off-list feedback on SerIRQ configuration from
>   Chiawei
> * Further validation on hardware for ASPEED KCS devices 2, 3 and 4
> * Lifting the existing single-open constraint of the IPMI chardev
> * Fixes addressing Rob's feedback on the conversion of the ASPEED KCS
>   binding to dt-schema
> * Fixes addressing Rob's feedback on the new aspeed,lpc-interrupts
>   property definition for the ASPEED KCS binding
> 
> Please test and review!
> 
> Andrew
> 
> Andrew Jeffery (16):
>   ipmi: kcs_bmc_aspeed: Use of match data to extract KCS properties
>   ipmi: kcs_bmc: Make status update atomic
>   ipmi: kcs_bmc: Rename {read,write}_{status,data}() functions
>   ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
>   ipmi: kcs_bmc: Turn the driver data-structures inside-out
>   ipmi: kcs_bmc: Split headers into device and client
>   ipmi: kcs_bmc: Strip private client data from struct kcs_bmc
>   ipmi: kcs_bmc: Decouple the IPMI chardev from the core
>   ipmi: kcs_bmc: Allow clients to control KCS IRQ state
>   ipmi: kcs_bmc: Don't enforce single-open policy in the kernel
>   ipmi: kcs_bmc: Add serio adaptor
>   dt-bindings: ipmi: Convert ASPEED KCS binding to schema
>   dt-bindings: ipmi: Add optional SerIRQ property to ASPEED KCS devices
>   ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration
>   ipmi: kcs_bmc_aspeed: Fix IBFIE typo from datasheet
>   ipmi: kcs_bmc_aspeed: Optionally apply status address
> 
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 106 +++
>  .../bindings/ipmi/aspeed-kcs-bmc.txt          |  33 -
>  drivers/char/ipmi/Kconfig                     |  27 +
>  drivers/char/ipmi/Makefile                    |   2 +
>  drivers/char/ipmi/kcs_bmc.c                   | 526 ++++-----------
>  drivers/char/ipmi/kcs_bmc.h                   |  92 +--
>  drivers/char/ipmi/kcs_bmc_aspeed.c            | 635 +++++++++++++-----
>  drivers/char/ipmi/kcs_bmc_cdev_ipmi.c         | 568 ++++++++++++++++
>  drivers/char/ipmi/kcs_bmc_client.h            |  48 ++
>  drivers/char/ipmi/kcs_bmc_device.h            |  22 +
>  drivers/char/ipmi/kcs_bmc_npcm7xx.c           |  94 ++-
>  drivers/char/ipmi/kcs_bmc_serio.c             | 151 +++++
>  12 files changed, 1582 insertions(+), 722 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
>  create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>  create mode 100644 drivers/char/ipmi/kcs_bmc_client.h
>  create mode 100644 drivers/char/ipmi/kcs_bmc_device.h
>  create mode 100644 drivers/char/ipmi/kcs_bmc_serio.c
> 
> -- 
> 2.27.0
> 
