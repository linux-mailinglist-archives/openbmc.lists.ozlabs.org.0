Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9972CEAB6
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 10:20:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnRxx6fhVzDrBs
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 20:20:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HFnTZWH6; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnRwz3VM4zDrBr
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 20:19:29 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id r18so5821553ljc.2
 for <openbmc@lists.ozlabs.org>; Fri, 04 Dec 2020 01:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5d7QS+8aXm3Jo/dhQvPSPLMGlB6XfaOcQnDt/pos0Ws=;
 b=HFnTZWH6X1wkzC7QlBblqLyaQF9njYKqtCrrpWajz5RT570G7/SrSQv45Vn5VfcjQc
 B05CHty9taLOt4gHSyb5cFg48XKrJZOBNmNXFjasRAY9GJlvmEvpa17YSb1oDmvtnTox
 uOZ6bBMcYor/6pkM2ayA2O/csHCBT8kgTv9b0HwDHaatRGAMkchmiSUvNs/vcBwzzI8+
 F5vv3dwezRMPuiMFMKWY04gxUVehhymf+el4eB+e6fEvYppXeOi2nf9N1c2H0j7Jcyuf
 UgjlXVx2zFnAUiA2FrtYe+1O2RadiEX2bv+660peezhk+zcTwByWlUixsbI1MBT451a2
 gRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5d7QS+8aXm3Jo/dhQvPSPLMGlB6XfaOcQnDt/pos0Ws=;
 b=WNcEulVucT53iuIvoqvEcVrfd2Ky/Pknc6M8dY9OV7yKSbRKP1y+Cxfrgv2Zsy3CAT
 XqvJefT6DFDIsSrayBDEcX4k1w2L+0kuLW0UZS20xX4j/JKPLpeyvb9j0thaD6XSDd7s
 /m7O41CcG8b8blG3OEZa1ZvlGDloKkQdKvFUTJLMJvH4QKaA6D1Nr4A17VVUnEV5uxlG
 3wzy4SINOFwd/JuMxabnHZ651LgJiDr/Xjjtwv61kUEj86TDlU5frMQAgwOW4Z6uhiUh
 oRMs/yLzldP8pqSgmfSCLdBqa68CeitgioMdVf7YrhyvVB2lD2lM3A6LHC5fFmby8+kx
 GqTw==
X-Gm-Message-State: AOAM533kSGp9SvYJ0XlHJpo935qPuVDh4sjKrLhL14Jqz1nMPVM/88sh
 d0OWM6B77NBNSgkU//RIC6KmCfBlkN4hvBshQQP14A==
X-Google-Smtp-Source: ABdhPJyCHSQRv+nMAlK9tcmnaAQ4ep11WKxlvgFh3ha/z/I3+vuqYJ4dvzKMhQ06y79w9YwuAwbMAjz9xP74UEEWpoM=
X-Received: by 2002:a05:651c:39d:: with SMTP id
 e29mr2803768ljp.144.1607073562865; 
 Fri, 04 Dec 2020 01:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20201126063337.489927-1-andrew@aj.id.au>
In-Reply-To: <20201126063337.489927-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Dec 2020 10:19:12 +0100
Message-ID: <CACRpkdbMoLXiSipDkmRXeWA_tcyDC8R1kuxHzzvfYaeqLU5deg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPIO requests on pass-through banks
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
Cc: Sasha Levin <sashal@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 26, 2020 at 7:34 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Commit 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
> fixes access to GPIO banks T and U on the AST2600. Both banks contain
> input-only pins and the GPIO pin function is named GPITx and GPIUx
> respectively. Unfortunately the fix had a negative impact on GPIO banks
> D and E for the AST2400 and AST2500 where the GPIO pass-through
> functions take similar "GPI"-style names. The net effect on the older
> SoCs was that when the GPIO subsystem requested a pin in banks D or E be
> muxed for GPIO, they were instead muxed for pass-through mode.
> Mistakenly muxing pass-through mode e.g. breaks booting the host on
> IBM's Witherspoon (AC922) platform where GPIOE0 is used for FSI.
>
> Further exploit the names in the provided expression structure to
> differentiate pass-through from pin-specific GPIO modes.
>
> This follow-up fix gives the expected behaviour for the following tests:
>
> Witherspoon BMC (AST2500):
>
> 1. Power-on the Witherspoon host
> 2. Request GPIOD1 be muxed via /sys/class/gpio/export
> 3. Request GPIOE1 be muxed via /sys/class/gpio/export
> 4. Request the balls for GPIOs E2 and E3 be muxed as GPIO pass-through
>    ("GPIE2" mode) via a pinctrl hog in the devicetree
>
> Rainier BMC (AST2600):
>
> 5. Request GPIT0 be muxed via /sys/class/gpio/export
> 6. Request GPIU0 be muxed via /sys/class/gpio/export
>
> Together the tests demonstrate that all three pieces of functionality
> (general GPIOs via 1, 2 and 3, input-only GPIOs via 5 and 6, pass-through
> mode via 4) operate as desired across old and new SoCs.
>
> Fixes: 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied for fixes.

Yours,
Linus Walleij
