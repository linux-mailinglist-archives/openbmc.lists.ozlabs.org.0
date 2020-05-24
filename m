Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5A1DFDAC
	for <lists+openbmc@lfdr.de>; Sun, 24 May 2020 10:34:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VD6w0J2JzDqH5
	for <lists+openbmc@lfdr.de>; Sun, 24 May 2020 18:34:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a2OK68h4; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VD671rNbzDqCF
 for <openbmc@lists.ozlabs.org>; Sun, 24 May 2020 18:34:06 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id c11so15409983ljn.2
 for <openbmc@lists.ozlabs.org>; Sun, 24 May 2020 01:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ym2/jmTuyZ+LCBHY8uUjF46ZmpdYuv1HzG4ugP1Ee4c=;
 b=a2OK68h4qAK4dqg2rQRo8Rc37ilbBu7fedOc1eeY8wPG5npT+PP5fRrec8wXKowX96
 AYouvBDwSKKubCp3bgbXwrqmZeMdpQgvlBCEjsMvsO33DNIzkdlFQLL3N7DSF1NBSc4G
 XcLqHaiig+Cc00/JXzXObmM6xAPryWfXk9R1I/l3Wf1ic2V8QLdRAPjhVzB16InUNBgQ
 Dmumf6k5hUiUhkqRlUEYCt8vOa1E6A7O+Yn6GBL/s1gTCj0GI1GAlh/kAnoKxWTnoxgO
 eHCvEP52/Y8oahSavx4GfwLfLI/orzXNuYHUv22DwIH10YMzeTdOWssMWHJBtIChR+jc
 iRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ym2/jmTuyZ+LCBHY8uUjF46ZmpdYuv1HzG4ugP1Ee4c=;
 b=Eo3wnSjNTskPrx+zn8ppvrtqyYdXVmEaGwaqOeeei3I652CUX42J3dbRg2QvckcmYa
 iWwsOM/xK3v9UeS3LIMYEjOKXjmR6Wv7A0cRR95c9Q8RsuMAlfH1AA8C9PgRtvAuORvQ
 ZCn471Mvg/+8CwfulVjt0piATgh2WWStoQ5XtzhDUsN2rxNO9JWl2yMzlJ0cFALDTWM1
 v6OiJNOjWTbkIne0xRpVvUv4UWuUyTEhtsOZZArZ/9cInGX9hZZICfwe6PLvC+G9JzqS
 YvB1sOc0HguGF5udT6YgQKqvmrLWBd4NqEebh2pqAim1HsPOXhAs4jCVpqTf+kATX8uX
 OCuw==
X-Gm-Message-State: AOAM530cWkVzSDXwgqduIQsXm0XxkYZ7feevjlCFvnMk/NyWkkr+k9GU
 tIX6cIb1dazG791df2DgZSBikcwhtcEp+YquAxY=
X-Google-Smtp-Source: ABdhPJyBeDmLEIA6+69iUoeLVOe0EjmnE3EcoRmeGkobz8HZ7gPzhnIXQ9hDlQd64+9msfF5i7BtMZDVtdHZlpC2mTA=
X-Received: by 2002:a2e:898d:: with SMTP id c13mr9696182lji.108.1590309239942; 
 Sun, 24 May 2020 01:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200522113312.181413-1-tali.perry1@gmail.com>
 <20200522113312.181413-2-tali.perry1@gmail.com>
 <20200522224217.GA847856@bogus>
 <CAL_JsqLKaWkSs8vMB4+kBL+AzAU6A4KCVJRNFtvmYfATKR1H=w@mail.gmail.com>
In-Reply-To: <CAL_JsqLKaWkSs8vMB4+kBL+AzAU6A4KCVJRNFtvmYfATKR1H=w@mail.gmail.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 24 May 2020 11:35:20 +0300
Message-ID: <CAHb3i=ummYNiqqS4QNi1n1XAzg6bbGXyNPgmFeU_a0T+JP7xqQ@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
To: Rob Herring <robh+dt@kernel.org>
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
 Benjamin Fair <benjaminfair@google.com>, kfting@nuvoton.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Brendan Higgins <brendanhiggins@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ofer Yehielli <ofery@google.com>, Linux I2C <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Sat, May 23, 2020 at 1:47 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, May 22, 2020 at 4:42 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, 22 May 2020 14:33:10 +0300, Tali Perry wrote:
> > > Added device tree binding documentation for Nuvoton BMC
> > > NPCM I2C controller.
> > >
> > > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > > ---
> > >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 60 +++++++++++++++++++
> > >  1 file changed, 60 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > >
> >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > Error: Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts:22.28-29 syntax error
> > FATAL ERROR: Unable to parse input tree
> > scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml' failed
> > make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > Makefile:1300: recipe for target 'dt_binding_check' failed
> > make: *** [dt_binding_check] Error 2
> >
> > See https://patchwork.ozlabs.org/patch/1296162
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> >
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> >
> > Please check and re-submit.
>
> Why do you keep sending new versions with the same problem? It won't
> get reviewed until this is fixed. This isn't a free automated service
> to throw things at to see if they work. I have to review the failures.
>
> Rob

Definitely not trying to use the Bot to check my yaml. On the first
version the dt-check was not updated on my side.
On the previous version I updated according to the bot explanations.
Found an error and fixed it. Now I don't see any errors. with latest
dt-check.
I did:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master
--upgrade
make dt_binding_check

And got a clean log, no warnings or errors. Was I suppose to check
anything else?

Thanks,
Tali
