Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3724256CD
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 17:41:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQFtL5NlWz3022
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 02:41:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=osSImv0n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=osSImv0n; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQFst3rLJz2ynN;
 Fri,  8 Oct 2021 02:41:21 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5595F3F9;
 Thu,  7 Oct 2021 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633621278;
 bh=Sp4De8iMtZ/6e2Np59FI+yTdsoee6zx033jfHJqL1Pc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=osSImv0naSv90iNaTrO7E06s7W++x6zvCTTPMROOgiTfywg5ODLiD6boZlkAh0jBO
 18YZTarxBxjDUQESB9+wTQfy6L5oZsNKFCJbzgM+oiUnN4rG+5myF5vXMEijHzTa3t
 9QLrBQncRbV0hoNa2Cqc/4rjtV5K6xRl0Uz4ksQU=
Date: Thu, 7 Oct 2021 08:41:13 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/9] Dynamic DT device nodes
Message-ID: <YV8VGeMreR6NJad4@hatter.bewilderbeest.net>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <CAHp75VdYBB_FaMr-uKswdvDBdobTYZkiE6ncoALuG+YYVoMwyw@mail.gmail.com>
 <YV64ZbcsHvBObH2j@hatter.bewilderbeest.net>
 <YV7Miz9RMMx/17A0@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YV7Miz9RMMx/17A0@kroah.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Frank Rowand <frowand.list@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Andy Shevchenko <andy@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 07, 2021 at 03:31:39AM PDT, Greg Kroah-Hartman wrote:
>On Thu, Oct 07, 2021 at 02:05:41AM -0700, Zev Weiss wrote:
>> On Thu, Oct 07, 2021 at 12:04:41AM PDT, Andy Shevchenko wrote:
>> > On Thu, Oct 7, 2021 at 3:10 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>> > > This patch series is in some ways kind of a v2 for the "Dynamic
>> > > aspeed-smc flash chips via 'reserved' DT status" series I posted
>> > > previously [0], but takes a fairly different approach suggested by Rob
>> > > Herring [1] and doesn't actually touch the aspeed-smc driver or
>> > > anything in the MTD subsystem, so I haven't marked it as such.
>> > >
>> > > To recap a bit of the context from that series, in OpenBMC there's a
>> > > need for certain devices (described by device-tree nodes) to be able
>> > > to be attached and detached at runtime (for example the SPI flash for
>> > > the host's firmware, which is shared between the BMC and the host but
>> > > can only be accessed by one or the other at a time).
>> >
>> > This seems quite dangerous. Why do you need that?
>>
>> Sometimes the host needs access to the flash (it's the host's firmware,
>> after all), sometimes the BMC needs access to it (e.g. to perform an
>> out-of-band update to the host's firmware).  To achieve the latter, the
>> flash needs to be attached to the BMC, but that requires some careful
>> coordination with the host to arbitrate which one actually has access to it
>> (that coordination is handled by userspace, which then tells the kernel
>> explicitly when the flash should be attached and detached).
>>
>> What seems dangerous?
>>
>> > Why can't device tree overlays be used?
>>
>> I'm hoping to stay closer to mainline.  The OpenBMC kernel has a documented
>> policy strongly encouraging upstream-first development:
>> https://github.com/openbmc/docs/blob/master/kernel-development.md
>>
>> I doubt Joel (the OpenBMC kernel maintainer) would be eager to start
>> carrying the DT overlay patches; I'd likewise strongly prefer to avoid
>> carrying them myself as additional downstream patches.  Hence the attempt at
>> getting a solution to the problem upstream.
>
>Then why not work to get device tree overlays to be merged properly?
>Don't work on a half-of-a-solution when the real solution is already
>here.
>

I had been under the impression that the overlay patches had very dim 
prospects of ever being accepted and that this might be a more tractable 
alternative, but apparently was mistaken -- I'll look into what the 
outstanding issues were with that and perhaps take a stab at addressing 
them.


Zev

