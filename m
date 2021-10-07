Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41482424FB1
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:06:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ5600pCpz2yws
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 20:06:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bHul7hkl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=bHul7hkl; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ55W19sJz2yMN;
 Thu,  7 Oct 2021 20:05:49 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B54F0F6;
 Thu,  7 Oct 2021 02:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633597547;
 bh=m8q3ivL4JNCs32ZTM2MObocXXvZZ0W1tFJVUtNGkFTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bHul7hklIuebeh7G55Y6p0NYVNaTJUWiM8AusuYh/yvLMc68T/jZr57bQqtm137Qx
 TTowiEFnPLLwhTTzX6T53EhX5grk/BiRFRiPNcRwk7NruSlyTjHZz7msTpDRr47dFu
 fQA8Vvc9186bmCEsWWzYAuF+qPu9L4x1tcyk0+VE=
Date: Thu, 7 Oct 2021 02:05:41 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/9] Dynamic DT device nodes
Message-ID: <YV64ZbcsHvBObH2j@hatter.bewilderbeest.net>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <CAHp75VdYBB_FaMr-uKswdvDBdobTYZkiE6ncoALuG+YYVoMwyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75VdYBB_FaMr-uKswdvDBdobTYZkiE6ncoALuG+YYVoMwyw@mail.gmail.com>
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
 Andrey Konovalov <andreyknvl@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Andy Shevchenko <andy@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 07, 2021 at 12:04:41AM PDT, Andy Shevchenko wrote:
>On Thu, Oct 7, 2021 at 3:10 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>> This patch series is in some ways kind of a v2 for the "Dynamic
>> aspeed-smc flash chips via 'reserved' DT status" series I posted
>> previously [0], but takes a fairly different approach suggested by Rob
>> Herring [1] and doesn't actually touch the aspeed-smc driver or
>> anything in the MTD subsystem, so I haven't marked it as such.
>>
>> To recap a bit of the context from that series, in OpenBMC there's a
>> need for certain devices (described by device-tree nodes) to be able
>> to be attached and detached at runtime (for example the SPI flash for
>> the host's firmware, which is shared between the BMC and the host but
>> can only be accessed by one or the other at a time).
>
>This seems quite dangerous. Why do you need that? 

Sometimes the host needs access to the flash (it's the host's firmware, 
after all), sometimes the BMC needs access to it (e.g. to perform an 
out-of-band update to the host's firmware).  To achieve the latter, the 
flash needs to be attached to the BMC, but that requires some careful 
coordination with the host to arbitrate which one actually has access to 
it (that coordination is handled by userspace, which then tells the 
kernel explicitly when the flash should be attached and detached).

What seems dangerous?

>Why can't device tree overlays be used?

I'm hoping to stay closer to mainline.  The OpenBMC kernel has a 
documented policy strongly encouraging upstream-first development: 
https://github.com/openbmc/docs/blob/master/kernel-development.md

I doubt Joel (the OpenBMC kernel maintainer) would be eager to start 
carrying the DT overlay patches; I'd likewise strongly prefer to avoid 
carrying them myself as additional downstream patches.  Hence the 
attempt at getting a solution to the problem upstream.

>
>> To provide that
>> ability, this series adds support for a new common device-tree
>> property, a boolean "dynamic" that indicates that the device may come
>> and go at runtime.  When present on a node, the sysfs file for that
>> node's "status" property is made writable, allowing userspace to do
>> things like:
>>
>>   $ echo okay > /sys/firmware/devicetree/.../status
>>   $ echo reserved > /sys/firmware/devicetree/.../status
>>
>> to activate and deactivate a dynamic device.
>>
>> Because it leans on the OF_DYNAMIC machinery internally, this
>> functionality will only work on busses that register for OF reconfig
>> notifications and handle them appropriately (presently platform, i2c,
>> and spi).  This series does not attempt to solve the "dynamic devices
>> further down the tree" problem [2]; my hope is that handling for OF
>> reconfig notifications can be extended to other families of devices
>> (e.g. individual MTD spi-nor flash chips) in the future.
>
>What about ACPI and software nodes?

I'm afraid I don't understand the question, can you elaborate on what 
you mean?

>How will all this affect the host?

Assuming the coordination mentioned above is done properly, the host 
will be in a quiesced state whenever the BMC is accessing the flash and 
hence won't notice much of anything at all (the BMC will detach the 
flash and relinquish control of it back to the host before the host is 
reactivated).


Zev

