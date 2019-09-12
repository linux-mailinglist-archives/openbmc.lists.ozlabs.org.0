Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E79B0A3A
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 10:25:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TWzH5ThCzF3HX
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 18:24:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="r+RtCQ+Q"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TWyR1RNxzF485
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 18:24:13 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id 7so22702447ljw.7
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w49o6bLlxe70T8dk8RcKOKQ6ege87Mzu24iLNFJSi6U=;
 b=r+RtCQ+QSzYgod49oCaqYCkPTh5kZ0t0Sd0c4Z0+s2eYFento9RBH+cJ6oV9udoLxV
 UAOH78eysBB4GLzpWHG+n3DdyMpTG7bjHG3OJeNy+YTbh7rBITWWJ8UHrdYbqbOvjhKU
 wBTdN/oCGKDqPSMGUinbCLXh34ir+lHen6smdbyfGfv6TgiY+CpSyJIftKzl59psWfws
 otcFJcFnELrgNmLbcSAaY3WNMrDE3O2jMbPXOMUIuJikgcaKm6OPJYCvJZrtz4War3NN
 ajFA0ei1LXIJFhOzIOd53cSYdpBzThBf/siT6WVcfCVmFGAVjjLSKvEWboTgzARw8sLQ
 cIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w49o6bLlxe70T8dk8RcKOKQ6ege87Mzu24iLNFJSi6U=;
 b=Y1N+MeoHJsYyJoI1mJkkIIo4x7PPvXri6/IyVUD5bR63rzr+G5ZbdujQaayJ1OFvyX
 OSppEjb2zF6pkLdBoiomHlpUBdg7sn3jVEuE+Wkw6YEv+G8UEpSGtBdkhoaU5Vnbigw3
 KvK11ptSC9zY7CHCaocCM8CHhgnrHnEv7ZqF/dVdgKSfc9euhEfoSrfWhLQvfsK4kPWc
 FGFP4n7RwtzkR2DJEunS+TZovKwwVg9KCNUnhrwgm07+BG9GS6pMwuOb6j0BH3WGMJXk
 ZeJFeC4wpQUkFKXpln2B41hLEiiZxNFiAXPAQqcwqFnRKO56JGSI8cqoUuJvO9GojiKE
 Tg8w==
X-Gm-Message-State: APjAAAWOu3vaOeCYyNrE/9kZJ+M3eHxnhEHDBD89syc5q1COGRZU31uv
 76/iLJsFUaDxbDksxE7+wslIOuLPCLyYaNkcquU3eA==
X-Google-Smtp-Source: APXvYqxJDL4FyhE3BXAv2E4B/4JEGQGPdbnrnZxx+n3oo9L0E7CyQ/g/GKuusfARHUSvwKnun6uC2HwM7AK4drFXwyc=
X-Received: by 2002:a05:651c:1108:: with SMTP id
 d8mr17993431ljo.180.1568276647071; 
 Thu, 12 Sep 2019 01:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190829071738.2523-1-andrew@aj.id.au>
In-Reply-To: <20190829071738.2523-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Sep 2019 09:23:55 +0100
Message-ID: <CACRpkdYW_PX7npB+b1YJ4pfFQNLVOsMx2hpKtntBeHg=C1j-Cg@mail.gmail.com>
Subject: Re: [PATCH pinctrl/fixes] pinctrl: aspeed: Fix spurious mux failures
 on the AST2500
To: Andrew Jeffery <andrew@aj.id.au>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 John Wang <wangzqbj@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 8:17 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> was determined to be a partial fix to the problem of acquiring the LPC
> Host Controller and GFX regmaps: The AST2500 pin controller may need to
> fetch syscon regmaps during expression evaluation as well as when
> setting mux state. For example, this case is hit by attempting to export
> pins exposing the LPC Host Controller as GPIOs.
>
> An optional eval() hook is added to the Aspeed pinmux operation struct
> and called from aspeed_sig_expr_eval() if the pointer is set by the
> SoC-specific driver. This enables the AST2500 to perform the custom
> action of acquiring its regmap dependencies as required.
>
> John Wang tested the fix on an Inspur FP5280G2 machine (AST2500-based)
> where the issue was found, and I've booted the fix on Witherspoon
> (AST2500) and Palmetto (AST2400) machines, and poked at relevant pins
> under QEMU by forcing mux configurations via devmem before exporting
> GPIOs to exercise the driver.
>
> Fixes: 7d29ed88acbb ("pinctrl: aspeed: Read and write bits in LPC and GFX controllers")
> Fixes: 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> Reported-by: John Wang <wangzqbj@inspur.com>
> Tested-by: John Wang <wangzqbj@inspur.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied for fixes already yesterday!

Yours,
Linus Walleij
