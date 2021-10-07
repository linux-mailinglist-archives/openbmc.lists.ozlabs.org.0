Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 709E4424DAE
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 09:05:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ2R22ltdz2yw2
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 18:05:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RsVEUBYz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RsVEUBYz; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ2QZ6dsRz2xrN;
 Thu,  7 Oct 2021 18:05:25 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id l7so19449940edq.3;
 Thu, 07 Oct 2021 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wqn76qJv9uCeYt3ifw4xiTG7bBEeRW82kssbj6n+DwY=;
 b=RsVEUBYzV53Sc1xDUhgr1kigVQ2UynziPlwvqxOGOwF+jgUdvUkWnbruoXhSvRKMJg
 0QA9GY1NV+mIbTZijJ9AXKm3D4hXoSHCIAQ8UM3pItoquHvYpk/I6BTz/cDF2SHByl7a
 T2dq6M3/pK5HNcABomX3fWoGtHdUhai5lJvh1d57VZ341hUL7d8/+wye9F895myruAHF
 GSDSRZfpeKnR168UpQ/S3Uz0U3t+C2zqCgU56NH5g7Z4IZR4QkWJYqIHO5KIA+0s/qqc
 W6+YscUOwDuAJrdfb1989oa8KRYnCvN+ZbzFR9J8NCYFuzYj+qXi7/GVSgdUx33Cd136
 oZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wqn76qJv9uCeYt3ifw4xiTG7bBEeRW82kssbj6n+DwY=;
 b=JNeH7cboZULSrTCmPmRK9NnvINVVFzC3xIY7Gn35vSMuzqhcdDH4lTRqObWrIb3lU5
 zAvSTq+iu9ypK1zNWiLRsvoVvGxlATTr0LyWhZlIVZn7gO9Z+jc4nqGy9yaZVMpGUDkH
 2fP3F+0sidt2XY0argCBOM41xk78hfzntC4KBG09clbJre5PXl454o5aZZCXZnNyyywh
 vwsAzPXSSxywuH5/NELU9EgTle2A07iyXECV+HyDQEVCbyDNwuO7MC/bHp6HOGL01Pb1
 GPUxDyIiBiakLcuA/ypLbJx+cQvxCxaLh2Vu4z6P8O25K8TOuHQ9DvkYu1mgxzhN3vC2
 AFSA==
X-Gm-Message-State: AOAM5300yKMGbiM7BLBnSa0j59bFHpu7dxLym85n9xLXRpjtOozKCfzY
 VI74zWHl1Vmv1iQFWlfA31UKYrz2drgRW7HSY5g=
X-Google-Smtp-Source: ABdhPJzUE8HsjY7/kyV6PcjePjU7eLH4cPaRxilurRHokYB77t73wLTNt9Effos7MxcrBay+PColQjOUnAP/0TynxlM=
X-Received: by 2002:a17:907:62a2:: with SMTP id
 nd34mr3454447ejc.356.1633590318049; 
 Thu, 07 Oct 2021 00:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211007000954.30621-1-zev@bewilderbeest.net>
In-Reply-To: <20211007000954.30621-1-zev@bewilderbeest.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 7 Oct 2021 10:04:41 +0300
Message-ID: <CAHp75VdYBB_FaMr-uKswdvDBdobTYZkiE6ncoALuG+YYVoMwyw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Dynamic DT device nodes
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
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

On Thu, Oct 7, 2021 at 3:10 AM Zev Weiss <zev@bewilderbeest.net> wrote:
> This patch series is in some ways kind of a v2 for the "Dynamic
> aspeed-smc flash chips via 'reserved' DT status" series I posted
> previously [0], but takes a fairly different approach suggested by Rob
> Herring [1] and doesn't actually touch the aspeed-smc driver or
> anything in the MTD subsystem, so I haven't marked it as such.
>
> To recap a bit of the context from that series, in OpenBMC there's a
> need for certain devices (described by device-tree nodes) to be able
> to be attached and detached at runtime (for example the SPI flash for
> the host's firmware, which is shared between the BMC and the host but
> can only be accessed by one or the other at a time).

This seems quite dangerous. Why do you need that? Why can't device
tree overlays be used?

> To provide that
> ability, this series adds support for a new common device-tree
> property, a boolean "dynamic" that indicates that the device may come
> and go at runtime.  When present on a node, the sysfs file for that
> node's "status" property is made writable, allowing userspace to do
> things like:
>
>   $ echo okay > /sys/firmware/devicetree/.../status
>   $ echo reserved > /sys/firmware/devicetree/.../status
>
> to activate and deactivate a dynamic device.
>
> Because it leans on the OF_DYNAMIC machinery internally, this
> functionality will only work on busses that register for OF reconfig
> notifications and handle them appropriately (presently platform, i2c,
> and spi).  This series does not attempt to solve the "dynamic devices
> further down the tree" problem [2]; my hope is that handling for OF
> reconfig notifications can be extended to other families of devices
> (e.g. individual MTD spi-nor flash chips) in the future.

What about ACPI and software nodes?
How will all this affect the host?

> [0] https://lore.kernel.org/openbmc/20210929115409.21254-1-zev@bewilderbeest.net/
> [1] https://lore.kernel.org/openbmc/CAL_JsqJH+b5oFuSP+KBLBsN5QTA6xASuqXJWXUaDkHhugXPpnQ@mail.gmail.com/
> [2] https://lore.kernel.org/openbmc/20210929220038.GS17315@packtop/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=6663ae07d995f5fbe2988a19858b2f87e68cf929


-- 
With Best Regards,
Andy Shevchenko
