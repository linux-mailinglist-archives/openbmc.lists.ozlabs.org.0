Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D84305A2
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 02:03:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FPm64KdVzDqYk
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 10:03:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="aob4J1zx"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FPlg0hbgzDqXD
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 10:02:38 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id l3so9290457qtj.5
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 17:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yg0yx7ouO9y6tjGgAv78IHLexxvA8I8IKKAycShCul8=;
 b=aob4J1zxCccsHT83kWvADlzx4s7GiEl0bGCDLEBe4GsfgxQnN+wO52G7Py+aXA7kS4
 VXQfgzWiAihVsRaxdUTFN9Ew9l00iPfd5/PrUpP/2KmPlZG9QiqFJtSE2UB033sFJJsh
 mmFMvxqwTXAviDp6Wemp6Nr4p4vUcwHHPtEXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yg0yx7ouO9y6tjGgAv78IHLexxvA8I8IKKAycShCul8=;
 b=dLvWdqKHwu0PsFuUt4HIRY6+Ki3hf0JwUAjXGgkhGKN4G0Pz4JiA7u2D/A6CCYM78B
 nNw09TdUldU6EnXzoV2Jsfz+tulwB484VVROkH5skKayWHiRyEBbXwags3rBW+KIG0BA
 CaX2HamtgzL48hUPSSWtHv552U5LIPZvriYhxQQZVI9c/sCLRfCWWJs9QjslpWCFXE92
 Xxhdopp+5/2FkcLCH41O2sxIOsMF3hwZwgpX16zug3UylNPkPe8i1rBQAXexob8pg47u
 ppfBhujv5QkRN25me31yFAk4PSdmcRKWwoRJ/3tXTxmHJfLOtE48hW4S9ojYb5yOFZp8
 K4OA==
X-Gm-Message-State: APjAAAW80mQ+ClqeQq8jKjjD9I0nH49MGC1UU1Mqdz/UaHK4EmylG0F1
 rGF6YZFvR2Q1K+oaMGHnH6EzfkmDe6gSiwoQFLw=
X-Google-Smtp-Source: APXvYqwxS7uTlKPSIGuSXx+JtUyzi4Q5pGdqnGcQR3hIQCFeZNTlLx8trD8MvZdneJ36c+mJ15jUv9D8H5XKRg3y0/0=
X-Received: by 2002:ac8:5518:: with SMTP id j24mr6180074qtq.255.1559260954271; 
 Thu, 30 May 2019 17:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <1559243767-19773-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1559243767-19773-1-git-send-email-hongweiz@ami.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 May 2019 00:02:23 +0000
Message-ID: <CACPK8Xe7UG2HX_2XSDUGu8zBqMKRqO_FAkbY6HtGP+fzAGCRRA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.0 v1] ARM: dts: aspeed: Add SGPIO driver
To: Hongwei Zhang <hongweiz@ami.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, 30 May 2019 at 19:16, Hongwei Zhang <hongweiz@ami.com> wrote:
>
> Add SGPIO driver support for Aspeed AST2500 board.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

Thanks for the patch!

Lets get this reviewed upstream and once we've had some feedback there
we can add it to the openbmc tree.

You will need to send out three different patch sets. The first should
be pinmux, which will contain one patch to the device tree, and
another to the driver.

The second should be the sgpio driver. In addition to the C code, you
need to provide a patch with some device tree bindings in
Documentation/devicetree/bindings.

The third patchset should be the change to add sgpio to the device
tree. I suggest you hold off on sending that until the device tree
bindings have been reviewed.

Please use scripts/get_maintainers.pl to discover who to send the
patches to. If you have any questions then please ask.

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi           |  16 +
>  drivers/gpio/Kconfig                       |   8 +
>  drivers/gpio/Makefile                      |   1 +
>  drivers/gpio/sgpio-aspeed.c                | 644 +++++++++++++++++++++++++++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c |   4 +
>  5 files changed, 673 insertions(+)
>  create mode 100644 drivers/gpio/sgpio-aspeed.c

> +++ b/drivers/gpio/sgpio-aspeed.c
> @@ -0,0 +1,644 @@
> +// SPDX-License-Identifier: GPL-2.0

Put another line here with the copyright owner. For example:

// Copyright 2019 Joel's Awesome BMC Company, inc

> +
> +/*
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */

If you have the "SPDX" line above you can leave this text out.
However, there's a contradiction: the SPDX text says "GPL 2.0 only",
while this text says "GPL 2.0 or later". You need to clarify which one
you meant.
