Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 775141DF253
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 00:48:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TM8f6ZcBzDr0y
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 08:48:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=JuwbAV7r; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TM7s2Jy1zDqlJ
 for <openbmc@lists.ozlabs.org>; Sat, 23 May 2020 08:47:36 +1000 (AEST)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 672F8207F7
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 22:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590187653;
 bh=5hfFawpXKpCIutTjpG9U4GCILvuIjBPoHRWtulw0l8c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JuwbAV7rthezSwZ6bubdRj8+FUWIO64x4TTlohWp7xFl/QLYqMtzV6y+BqfagCib8
 4pbFX2FRyQsWb8qmmtUEgdsAmiWs7cOJkvOrt02J+a9viVUk/kQ7QAvXJKWO74muv8
 N3ENYsEw/WqnBRjs1DK91rQaiAN+qPgPxbia76FM=
Received: by mail-oo1-f49.google.com with SMTP id c187so2495040ooc.2
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 15:47:33 -0700 (PDT)
X-Gm-Message-State: AOAM532Eqpj9QXV51jyBwKh1e1/bhRiQuyRzYdXLupFMdHsTd9wwsL82
 NHYLKvgIBmIIKi89XMEihnbmpQLkzHJk1tcdKw==
X-Google-Smtp-Source: ABdhPJxaHHJNI0SXO4KjlnRK9YfXoFEB9IMHVZp7IAtsCVAsNspsWHvXuCKHPqC0HjG6YargWTUGM/jccxuGbhpguqs=
X-Received: by 2002:a4a:3790:: with SMTP id r138mr4741311oor.81.1590187652677; 
 Fri, 22 May 2020 15:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200522113312.181413-1-tali.perry1@gmail.com>
 <20200522113312.181413-2-tali.perry1@gmail.com>
 <20200522224217.GA847856@bogus>
In-Reply-To: <20200522224217.GA847856@bogus>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 22 May 2020 16:47:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLKaWkSs8vMB4+kBL+AzAU6A4KCVJRNFtvmYfATKR1H=w@mail.gmail.com>
Message-ID: <CAL_JsqLKaWkSs8vMB4+kBL+AzAU6A4KCVJRNFtvmYfATKR1H=w@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
To: Tali Perry <tali.perry1@gmail.com>
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
Cc: devicetree@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 kfting@nuvoton.com, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Brendan Higgins <brendanhiggins@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ofer Yehielli <ofery@google.com>, Linux I2C <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 22, 2020 at 4:42 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 22 May 2020 14:33:10 +0300, Tali Perry wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM I2C controller.
> >
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Error: Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts:22.28-29 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1300: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1296162
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
>
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>
> Please check and re-submit.

Why do you keep sending new versions with the same problem? It won't
get reviewed until this is fixed. This isn't a free automated service
to throw things at to see if they work. I have to review the failures.

Rob
