Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57F5E007
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 10:41:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dvhX5YL5zDqPM
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 18:41:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="iLSnAFiM"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dvgl3yZrzDqP1
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 18:40:18 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id t28so1450310lje.9
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2019 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KQGKN1/JTwYz+i5tykBtO8/dfvkSTRXZ7mV96ulxlo=;
 b=iLSnAFiMtzOcyZkCnNoQdCnKRs/FrQMu9BQk1miyt08q/upQDSxsM5dd/sr+THA+cz
 Ma0puGzE/ZswYwh4FVWRnwkJAgjJiowH28UihrQ5Ew/UvWeQ1X3ci4rGe9jCtXrSXrhu
 VJcSzn2usHUy1hcueneTZAxbX0WIJ/GbSxZcQqCLs5riBu/oyqVMlrHbwbYdGATqrbN6
 XevkFpUuWujEosPpkR/Vjq9lnzSkFDPYZB9dCECqE0OpBr/Bgz2s7iUQBPkcrmFdU3Py
 +LZHudN2XD/KZduddVlkuwmpp3WdxkpwOUshIpl7p6/p7b3bfcWeCi9olwlgW6sw26ku
 wAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KQGKN1/JTwYz+i5tykBtO8/dfvkSTRXZ7mV96ulxlo=;
 b=lyeR9i7vklrW/mq6WiJU+ArZ++mr1+NdyhTDgY52eM8KZian4OORdx8Np1pgjLKPiK
 zvkPrmFgQehwY6m2ip5js63GOlEfWHOZYCIQrCMlR9wuClBxG3cfLnvEKFddEQbeWMMm
 J6Nwr83BGT6QlGfT0cH/jmq1nPK1/dqgZqcA1Xgi/gdvvy4R9UuZoSKw/CBJwP7hpp+o
 S9IDu0Gi6LL2c5jAb1RjK7p9WBYBlIM+NHYOJsR52C/M8WS2DPy4nHWB3v4EFgSRFM/b
 e/d4Ft84RlJ2m2fmm1Gv49Fiw+qYo+/IZE+sfEcsufwDqnW4Mo6riNL/0wKtksJnYVlC
 6GLw==
X-Gm-Message-State: APjAAAXRWBToTyvQYYgtfedytKXT6bSTquMepkTBRTswxUcmNed+UMxw
 K2RXFxWdiKWVZaPyV5roqBP5Wbybg6DSO9mK58+PxA==
X-Google-Smtp-Source: APXvYqwjCAdp2pYFgLkejdEEDh9nRCMtaIIni+TVcrXpKnpbZ14+0z+JW8gDE5GUfqGr6bXIV3oih+tOTO8H8yN1rZI=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr20360931ljb.28.1562143213537; 
 Wed, 03 Jul 2019 01:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190628023838.15426-1-andrew@aj.id.au>
In-Reply-To: <20190628023838.15426-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2019 10:40:02 +0200
Message-ID: <CACRpkdaxiFR3ezt4FzhRxpqc4DYYjsbBeysPUaaQH+_QgYjudw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] pinctrl: aspeed: Preparation for AST2600
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Fri, Jun 28, 2019 at 4:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello!
>
> The ASPEED AST2600 is in the pipeline, and we have enough information to start
> preparing to upstream support for it. This series lays some ground work;
> splitting the bindings and dicing the implementation up a little further to
> facilitate differences between the 2600 and previous SoC generations.
>
> v2 addresses Rob's comments on the bindings conversion patches. v1 can be found
> here:

I have applied this series, I had to strip some changes of the header
because it was based on some SPDX cleanups upstream but no
big deal I think. Check the result please.

Yours,
Linus Walleij
