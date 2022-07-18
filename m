Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883257856B
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 16:30:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmkrf3lYkz3byH
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 00:30:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O6W1Zn/n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O6W1Zn/n;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmkrF3C4Zz2yw3
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 00:29:48 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id u13so19650314lfn.5
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nYPlqlfmPSur8GF0RqYSY08DVBhvxgeO+GWpvl7QarY=;
        b=O6W1Zn/nePJWHmpM9MJ5H5o0Hi8rLzd2XYj9JrC9Job3qR3iLLcHWbd39W8O1xS7K1
         +WtOVEzd4owHyN7J+e7uHHSuN5DIMOdH1e3BtMsgToI1yJK7Fa1UgqcoJVZ7g5QTQPuo
         M7FCXLyyMKVTJoUIB5z2/SeiI9jds8m8qWg7VXucYTlGdOgXBBd6GeQswW1N5oELxOf/
         wYH+zjzrxZWHQHGIooHu/3qBEHN845Jw+2o6EJK6WOespU2r7rekF0Su+28xctX1vexn
         10AR8goH4+mU5ixAh+bodnIClmZrdeCNJqPW31bDoLair1fDeEGj0gh4kUOZwTDukrZe
         HWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nYPlqlfmPSur8GF0RqYSY08DVBhvxgeO+GWpvl7QarY=;
        b=jP9Q0UftSTorFhQ67HEY2GKVNxcbtEpAE9npewrYZU2B+z5kQjzxvVQMTXuIkDw8K8
         76TGjZfZ/TQn0r4KSzaOrIM/XeSbC5+IbNuAiC5aKR64YOoMusS9WaMZ/OSoE9xY0K53
         yJtvlldE26Z0GRRjfkMQVg8V7pBmUex9+kvmDwlTq8Sl/GK97fKwQu30dUjwdya3aNGN
         naZpwBcdkhjXQpZwmDnyAjjGxXcWE9z26B3dqhATJoAMfDWDu/wf8XcV4CH53g8/mxre
         JxVVEjSzPoIVxKmNwOloJ0y7JglqNHCbzWasmXAmJwjXVN/zidi2Wz1UkSZZTSHT3wiZ
         CU8w==
X-Gm-Message-State: AJIora8iM5VKHlUTxNME9sMpveZWra5K8rcipZFzH029JHNslLHr/utN
	3J0hNVMiT6bnhUXD8jf9gxQMCr1N5trnWVNoYeg=
X-Google-Smtp-Source: AGRyM1su+O+roIcGgBfi1ZQAZ9kFAtsirLqd2tk0nDsGSCWiNaBhhwAAIkoESJDWUM8YccBK47WieVmI65WD8GHrZO0=
X-Received: by 2002:a05:6512:22d2:b0:48a:1ec7:2220 with SMTP id
 g18-20020a05651222d200b0048a1ec72220mr9287388lfu.668.1658154583941; Mon, 18
 Jul 2022 07:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220718122922.9396-1-tmaimon77@gmail.com> <20220718122922.9396-2-tmaimon77@gmail.com>
 <CAK8P3a2PM9pe5tN=N7BMdkwZZKNv9Wa+CEFCyQT_6Ur=O7P5pQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2PM9pe5tN=N7BMdkwZZKNv9Wa+CEFCyQT_6Ur=O7P5pQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 18 Jul 2022 17:29:32 +0300
Message-ID: <CAP6Zq1gFnLYspn5+dYbSSOicZibCTbF9Z8bmNV+_HDP3=nLp8A@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] usb: host: npcm7xx: remove USB EHCI host reset sequence
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Juergen Gross <jgross@suse.com>, DTML <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, USB list <linux-usb@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, gregkh <gregkh@linuxfoundation.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Thanks for your detailed explanation.

I will remove this modification in the next version.

On Mon, 18 Jul 2022 at 15:38, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jul 18, 2022 at 2:29 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> >  config USB_EHCI_HCD_NPCM7XX
> >         tristate "Support for Nuvoton NPCM7XX on-chip EHCI USB controller"
> > -       depends on (USB_EHCI_HCD && ARCH_NPCM7XX) || COMPILE_TEST
> > +       depends on (USB_EHCI_HCD && ARCH_NPCM7XX && RESET_NPCM) || COMPILE_TEST
> >         default y if (USB_EHCI_HCD && ARCH_NPCM7XX)
> >         help
> >           Enables support for the on-chip EHCI controller on
>
> I would leave out this Kconfig change, there is really no need to enforce
> this specific dependency.  It is expected that a device driver has dependencies
> on several other subsystems (irqchip, reset, pinctrl, clock, ....) and will only
> work if the required drivers are also built for the same kernel.
>
> Also, forcing the USB driver to be a loadable module when the reset driver
> is a module (rather than built-in) does not guarantee that they are initialized
> in the correct order. If only the USB driver is built-in and the reset driver is
> a module, or both are loadable modules and USB gets loaded first, then
> the probe() function should notice this and return -EPROBE_DEFER so
> it will be retried after the reset driver is successfully loaded.
>
>         Arnd

Best regards,

Tomer
