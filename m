Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F8F889D6
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 10:13:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465FHl2Jf0zDr85
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 18:13:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="VnJxbftI"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465FH14H9KzDr5n
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 18:13:14 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id z17so5683597ljz.0
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oqsU2heLXHHBs96Q5jI1j5tMoKsUDIBVmfyGumKZ6LM=;
 b=VnJxbftIzPrqH4FoIz+w63T9HvLAwPyuIAzFqmtEtWAsLj/01rK86PGFGuGpSqWYv+
 EOc3pJBX5N72NrROGYfkzRIEBM/NZHAtlunaj25jmAa22WMIK6W8WaeA6NQrcRQ890ve
 gTKEzqoNeorIPkcAkbULvIA82MectHdfWgQVc2tti+zAedXKseEDZCsXl4IK+jsWOZyk
 R7BDcza0vJn1D+S49B4cTvaTLZpzO5Zji8UHdpqukz0sSpuhB6HNFG8n8zxgS0EkyZrb
 5PC++TGzLIxcQd3/xU9h8T2WbaloLuBlyrUH/bwdms17HdBtBey1e6TEAlNNF3mOqFH5
 GZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oqsU2heLXHHBs96Q5jI1j5tMoKsUDIBVmfyGumKZ6LM=;
 b=ZEBQhHeCDP6chfdqJIo617FbBJ5x4o6Oow+/Ca+BxaROhyQyduSPtiFGXk+aU2Koqm
 /9rm6dkhjWbmQdLnuDEE40BGq4TVFwLciuJIk9sm33aXu51qQi++5geIHqVVnjxHerqm
 Mylt7NVk81+zuU8KqjdTV5aF5jmxiLa51+TxDtBYhhXbXYzZ8iS4Ybua/VsHc24jzTLF
 C9V3GrVu/hOtTAbKFniV7UTQHOGJcELo5XTPc53wNeA/TBC6nFaohqKJbFCUbqUmYNeU
 altq0z/OcyreHQR5ZHzamZmHBqyC0JXfQPhaJkyM43Oua4HszsOqCgh2M8zHYJFSlo34
 lzDA==
X-Gm-Message-State: APjAAAWXdKJSE9pcHZ0RM21n5VsPcFcv6OL7NXPxf6PoowSUWq/xUE09
 2skJsyj7iHG5xISG7QaH21GCrIu8QeiF+Dx2461fNw==
X-Google-Smtp-Source: APXvYqw5IJDtu+KvWNV5b+0f7BnCDMIkmE9siMLHoOIDt6M7/m7Z1qUizRn9O0DLYl+XLv2UlhKWmwCr8OjDx7Cm5k0=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr13818205ljj.108.1565424790000; 
 Sat, 10 Aug 2019 01:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190807003037.48457-1-natechancellor@gmail.com>
In-Reply-To: <20190807003037.48457-1-natechancellor@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 10 Aug 2019 10:12:57 +0200
Message-ID: <CACRpkdbDgOQXfxgM4dEyzBRhtske3=V+858B7J8jGExnJE5fJQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: g6: Remove const specifier from
 aspeed_g6_sig_expr_set's ctx parameter
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 clang-built-linux@googlegroups.com, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 7, 2019 at 2:32 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> clang errors:
>
> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2325:9: error: incompatible
> pointer types initializing 'int (*)(struct aspeed_pinmux_data *, const
> struct aspeed_sig_expr *, bool)' with an expression of type 'int (const
> struct aspeed_pinmux_data *, const struct aspeed_sig_expr *, bool)'
> [-Werror,-Wincompatible-pointer-types]
>         .set = aspeed_g6_sig_expr_set,
>                ^~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>
> Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> changed the set function pointer declaration and the g6 one wasn't
> updated (I assume because it wasn't merged yet).
>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/632
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Patch applied with Andrew's ACK.

Yours,
Linus Walleij
