Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA025782A0
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 14:44:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmhVW6yN2z3brV
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 22:44:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.130; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir; Mon, 18 Jul 2022 22:44:06 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmhVG0GfBz2ynx
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 22:44:05 +1000 (AEST)
Received: from mail-yb1-f177.google.com ([209.85.219.177]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MC2o9-1oN5Cj2JjB-00CPMI for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022
 14:38:52 +0200
Received: by mail-yb1-f177.google.com with SMTP id i206so20506632ybc.5
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 05:38:52 -0700 (PDT)
X-Gm-Message-State: AJIora/YOEaJxWAH2jn2L1xWfT+YVzKuvWIOkBOy87rXUVi/f+2W2mDo
	F0bw9674xPk+xWixEbOwcTGT4iNrDNwqUnIr/5A=
X-Google-Smtp-Source: AGRyM1vapzEEu9ZgtaQdXwX9VGqTMMz6TeDMtqM5iGxSTzqDTPUtrnc1sKE6GzccxBqi3a9VkzSGFyDHhzu6VdFIHj4=
X-Received: by 2002:a25:73d1:0:b0:66e:aee4:feb3 with SMTP id
 o200-20020a2573d1000000b0066eaee4feb3mr27671458ybc.452.1658147931121; Mon, 18
 Jul 2022 05:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220718122922.9396-1-tmaimon77@gmail.com> <20220718122922.9396-2-tmaimon77@gmail.com>
In-Reply-To: <20220718122922.9396-2-tmaimon77@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Jul 2022 14:38:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2PM9pe5tN=N7BMdkwZZKNv9Wa+CEFCyQT_6Ur=O7P5pQ@mail.gmail.com>
Message-ID: <CAK8P3a2PM9pe5tN=N7BMdkwZZKNv9Wa+CEFCyQT_6Ur=O7P5pQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] usb: host: npcm7xx: remove USB EHCI host reset sequence
To: Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Zu8wHlFi5/NGP+J5tVZ/Mif2U4lZDkBkcui9oxXAblijuPYrT2W
 +b7lAdanBiy1R21XESoVW7DPhwLnWLLDSlTf7Uo+XavZtDSkPPAgOhE+jLecWClP7MDCfLC
 lRLkc27cy/lxmtVo7cSilg98W8elRtkth+NP62i5KQnJ8acwV8BrWYn3v/JBjUucBNcXv1Y
 g43DBmcRoPalj2ZQhmpZw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T12yiwt4APA=:YBkgz7IDm6Hi9XRdOqX0EW
 6+J7RYhl9dUPEUU85q8dF+H5rcHKi9E+YWvL0AcHKoKxhGtyWx2u417P+7pe7C+CTbXnvfzUu
 t2+MDuTDYKo8PrMPZytHCoB8+5yiKe80DH0hL21HwiOnnaeKJ11eUQdipLhdfAU4UNCil8Yc7
 pa6BISFY+rqfQjc8khbmgZXV8QIUqquwllTrfdFDXRObpe1Rh6vf0QOwEVJFvsR4HI3gDf3Xh
 xSltMyoy6GGhp62SU0L8oTJrmQtDkI1bz4KrglS6ebZKcEUg2qyjlgn4QQZXa+nEmk5XIXu/b
 eWnE7qjqjPBiKyngd4FUYzpjMcHLSJfI6X6KkTcLZv0vHXO+kCdtZ3+fQF1mz8BbIDUQVJK6d
 Y1VtMiLhnM10ypoF/NleFYB88g0U0qQYvOULbx9LSHEdvDepRgheUePGRNHA+dkbBZb7LN5Vy
 T9tllRAmzuz+GH6P82PqvJx7vN9eA2z28zK7Wi32nuwc+2WRpYen3noUixJrT7MYyoqIx+dRR
 TKDANjZ9tyDnbWqPEIIyYtDlFPPnCq6+Itj9JzpjezCY9CWTIzmh/pTKt6V/wmZC0bBoa9TMP
 1LgggKkoJWf0THfFs4Pgs6P9lI+gQwjVV40BOsTVgeSZ+7T4LZlDiXP8T3qjRZyev2osQJOpE
 yEeMnaavGDgo1tpI66pgdn3RNYWQ3c0yUWOU0b6KjD7AmQE7bMXOJF/Yp5h4mEvzxejEdo6r8
 K9OFkqymzyIxkfMtWypxlazzBPrs90VFwSCvUSNZ7lDlb3sM7v6rl+5frXdccKpUV9KBTMImg
 l1r4OdqsWOCgaJwYeugK8bis4ZfmIrQFxDeja1T54XJr/N/PvnPmpSehyFW8S1CDe308KCouy
 czxbzTHAKxHrBai5k6ptqvQNvwjOIMdC6A61oxu3U=
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
Cc: Juergen Gross <jgross@suse.com>, DTML <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, USB list <linux-usb@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, gregkh <gregkh@linuxfoundation.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 2:29 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
>  config USB_EHCI_HCD_NPCM7XX
>         tristate "Support for Nuvoton NPCM7XX on-chip EHCI USB controller"
> -       depends on (USB_EHCI_HCD && ARCH_NPCM7XX) || COMPILE_TEST
> +       depends on (USB_EHCI_HCD && ARCH_NPCM7XX && RESET_NPCM) || COMPILE_TEST
>         default y if (USB_EHCI_HCD && ARCH_NPCM7XX)
>         help
>           Enables support for the on-chip EHCI controller on

I would leave out this Kconfig change, there is really no need to enforce
this specific dependency.  It is expected that a device driver has dependencies
on several other subsystems (irqchip, reset, pinctrl, clock, ....) and will only
work if the required drivers are also built for the same kernel.

Also, forcing the USB driver to be a loadable module when the reset driver
is a module (rather than built-in) does not guarantee that they are initialized
in the correct order. If only the USB driver is built-in and the reset driver is
a module, or both are loadable modules and USB gets loaded first, then
the probe() function should notice this and return -EPROBE_DEFER so
it will be retried after the reset driver is successfully loaded.

        Arnd
