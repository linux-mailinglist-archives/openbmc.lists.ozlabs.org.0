Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 507F83FD484
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 09:37:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gzwqz1bJqz2yPj
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 17:37:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lE49Hq2Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lE49Hq2Q; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzwqR2FGJz2xYP;
 Wed,  1 Sep 2021 17:36:50 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id a10so2028667qka.12;
 Wed, 01 Sep 2021 00:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6GGQMLeJpx/q02LlQGr7UraUXBopkzTRg5QpBvPD4L8=;
 b=lE49Hq2QkYzVFGuK/+R0xtGWn9lbFkW4/Rzhg3EL41Ny1ZXklmrU18GjV9OjGHjwen
 LsLmJ86eWxpR9xC8Xg84m5+SUTQmZRoRJ9qEVpeYscuvw3pp5RmyaVN9ztVd2UEJmfVz
 uQAF7O7Ksh0jvkPXBiLyur3dzD7Fb+Kpq9ZlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6GGQMLeJpx/q02LlQGr7UraUXBopkzTRg5QpBvPD4L8=;
 b=SP0rOKfDbifahFOXEclY3xB2x1y51QGsn3BwvRwpMuYoEEDlNSg2JvkN+jiwmHyUtb
 GzEAa5x5JnmdF4KaX5TNqi4vTP5rdy2z+DBtcjPUAv0c7Bw7LnIcIFnlmP21miP07itR
 R+BtWsVsumpMj3lu5l+FcAU5r7bQZyCUuc/EPQ58H8VQ53uYagtmPDP+8FBWzbbUnkgH
 ZyIEFomomE+TzK7JgSedj8Y9WpeELDIXdSCV+DpW9L3RhkcilRJelTF4Jp8rti2sxjLH
 nWb/1kabxKNLUQr8qH8E9MF6YWoZgxVyUz092JH1Es/j5ZdebOjsEKFVpqF8kc+MGuu1
 IpTg==
X-Gm-Message-State: AOAM530iEo1OOdy42q+d6QjQltlTw2BjqVGRpvlB4rWmWsqbaMPFwXBf
 /aJb0nW33yf4b03TJ0ZOGMdVDxcwHoCshH/PQwc=
X-Google-Smtp-Source: ABdhPJyie0xJcmHZwAATJEwixM4E0x2KE6vf4jVw8Dxi71j6J0IuXKVe12GaBx+AhgdDePvt65e1tE4ewfpXEwT4nF0=
X-Received: by 2002:a05:620a:4092:: with SMTP id
 f18mr6853416qko.91.1630481806719; 
 Wed, 01 Sep 2021 00:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210901062216.32675-1-chiawei_wang@aspeedtech.com>
 <20210901062216.32675-2-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210901062216.32675-2-chiawei_wang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Sep 2021 07:36:34 +0000
Message-ID: <CACPK8XerokBaLMZ3J=9rcRLD5eFqmNOSsXYGgf_Ze01=X6NwPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: aspeed: Add LPC UART routing support
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 1 Sept 2021 at 06:22, Chia-Wei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> Add driver support for the LPC UART routing control. Users can perform

As we discussed, remove the "LPC" part of the name.

> runtime configuration of the RX muxes among the UART controllers and the
> UART TXD/RXD IO pins. This is achieved through the exported sysfs interface.
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

It would be good to have some example of how to use it, and the output
from sysfs.

You should also add a patch to document the sysfs files in Documentation/ABI.

> +++ b/drivers/soc/aspeed/aspeed-lpc-uart-routing.c
> @@ -0,0 +1,621 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2018 Google LLC
> + * Copyright (c) 2021 Aspeed Technology Inc.
> + */
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>

You can drop this one.

> +#include <linux/of_platform.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/platform_device.h>
> +
> +/* register offsets */
> +#define HICR9  0x98
> +#define HICRA  0x9c
> +
> +/* attributes options */
> +#define UART_ROUTING_IO1       "io1"
> +#define UART_ROUTING_IO2       "io2"
> +#define UART_ROUTING_IO3       "io3"
> +#define UART_ROUTING_IO4       "io4"
> +#define UART_ROUTING_IO5       "io5"
> +#define UART_ROUTING_IO6       "io6"
> +#define UART_ROUTING_IO10      "io10"
> +#define UART_ROUTING_UART1     "uart1"
> +#define UART_ROUTING_UART2     "uart2"
> +#define UART_ROUTING_UART3     "uart3"
> +#define UART_ROUTING_UART4     "uart4"
> +#define UART_ROUTING_UART5     "uart5"
> +#define UART_ROUTING_UART6     "uart6"
> +#define UART_ROUTING_UART10    "uart10"
> +#define UART_ROUTING_RES       "reserved"
> +
> +struct aspeed_uart_routing {
> +       struct regmap *map;
> +       spinlock_t lock;
> +       struct attribute_group const *attr_grp;
> +};
> +
> +struct aspeed_uart_routing_selector {
> +       struct device_attribute dev_attr;
> +       uint32_t reg;
> +       uint32_t mask;
> +       uint32_t shift;

These can be u8.

> +static ssize_t aspeed_uart_routing_show(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       char *buf)
> +{
> +       struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
> +       struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
> +       int val, pos, len;
> +
> +       regmap_read(uart_routing->map, sel->reg, &val);
> +       val = (val >> sel->shift) & sel->mask;
> +
> +       len = 0;
> +       for (pos = 0; sel->options[pos] != NULL; ++pos) {
> +               if (pos == val) {
> +                       len += snprintf(buf + len, PAGE_SIZE - 1 - len,
> +                                       "[%s] ", sel->options[pos]);
> +               } else {
> +                       len += snprintf(buf + len, PAGE_SIZE - 1 - len,
> +                                       "%s ", sel->options[pos]);

The kernel prefers sysfs_emit and sysfs_emit_at insteading of using
snprintf directly.

> +               }
> +       }
> +
> +       if (val >= pos) {
> +               len += snprintf(buf + len, PAGE_SIZE - 1 - len,
> +                               "[unknown(%d)]", val);
> +       }
> +
> +       len += snprintf(buf + len, PAGE_SIZE - 1 - len, "\n");
> +
> +       return len;
> +}
> +
> +static ssize_t aspeed_uart_routing_store(struct device *dev,
> +                                        struct device_attribute *attr,
> +                                        const char *buf, size_t count)
> +{
> +       unsigned long flags;
> +       struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
> +       struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
> +       int val;
> +
> +       val = match_string(sel->options, -1, buf);
> +       if (val < 0) {
> +               dev_err(dev, "invalid value \"%s\"\n", buf);
> +               return -EINVAL;
> +       }
> +
> +       spin_lock_irqsave(&uart_routing->lock, flags);

I can't see why you would need a spinlock here. The regmap has it's
own locking so it will protect against concurrent updates to the
registers.

> +
> +       regmap_update_bits(uart_routing->map, sel->reg,
> +                       (sel->mask << sel->shift),
> +                       (val & sel->mask) << sel->shift);
> +
> +       spin_unlock_irqrestore(&uart_routing->lock, flags);
> +
> +       return count;
> +}
> +
> +static int aspeed_uart_routing_probe(struct platform_device *pdev)
> +{
> +       int rc;
> +       struct device *dev = &pdev->dev;
> +       struct aspeed_uart_routing *uart_routing;
> +
> +       uart_routing = devm_kzalloc(&pdev->dev,
> +                                   sizeof(*uart_routing),
> +                                   GFP_KERNEL);

You can reformat this file to have longer lines; the kernel is ok with
up to 100 columsn these days.

> +       if (!uart_routing) {
> +               dev_err(dev, "cannot allocate memory\n");

I'd drop this error message.

> +               return -ENOMEM;
> +       }
> +
> +       uart_routing->map = syscon_node_to_regmap(dev->parent->of_node);
> +       if (IS_ERR(uart_routing->map)) {
> +               dev_err(dev, "cannot get regmap\n");
> +               return PTR_ERR(uart_routing->map);
> +       }
> +
> +       uart_routing->attr_grp = of_device_get_match_data(dev);
> +
> +       spin_lock_init(&uart_routing->lock);

I don't think you need the lock at all.

Cheers,

Joel
