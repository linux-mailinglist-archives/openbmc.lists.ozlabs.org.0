Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F45FB4C4
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 16:40:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmz3G19rVz3bht
	for <lists+openbmc@lfdr.de>; Wed, 12 Oct 2022 01:40:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.179; helo=mail-qt1-f179.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmz2p5p9Cz2xtt;
	Wed, 12 Oct 2022 01:40:02 +1100 (AEDT)
Received: by mail-qt1-f179.google.com with SMTP id f22so4381835qto.3;
        Tue, 11 Oct 2022 07:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sKcP+GTT+SWbU28Mvg7qTSCnoQqhpg8QoNv8i57vas=;
        b=twckrV/5ZyuX+hovRhZWa02+IVQYa/h5oVgM/HwqzvpoVAPfC9Tb1UeuZnXWhPioCT
         lX1bBaXrnf83BVgKHhL8Bo2vKRc10cUDOcZDAJJJQCaKidzpufwW2Fzk6EG17ok/dkJR
         JMnTk0INdoxvs7bAeEgRgeKR4GZV5TDgFlZGb1Z8X97rwsCQU0rYDClrDBpTmh9VvNTE
         8RkdUyuGinuYeZy+OIV4xhljZhPEdhStjsnpiihptTP9+hQqAQkot+hbRAQ1keATZwfn
         vOqhv48QK5q1ztWvvxY18gv4fUEmoHC2rpkwPC/XgiAktnHcPWHza9x4qDGmqDxXX/A5
         J5Ow==
X-Gm-Message-State: ACrzQf29GfacdKSA8AF1AqJinHErTs9E/iYSjWCNWdcVK2ahR98hicTu
	lGtoLBQj3K2xt4OvW5m2rZfXNf53jPz65w==
X-Google-Smtp-Source: AMsMyM5G4XXlL9/+KVoVpaHoHukMe/8WoL6AbRC682SfcHYov/ElbESbrd76TstxqTr7i85NdEZ9Iw==
X-Received: by 2002:a05:622a:14d3:b0:35c:ccc3:eb2c with SMTP id u19-20020a05622a14d300b0035cccc3eb2cmr19913806qtx.77.1665499198557;
        Tue, 11 Oct 2022 07:39:58 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id o19-20020a05620a2a1300b006cddf59a600sm13352829qkp.34.2022.10.11.07.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 07:39:58 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id t186so11200300yba.12;
        Tue, 11 Oct 2022 07:39:58 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr21857240ybb.604.1665499197788; Tue, 11
 Oct 2022 07:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol> <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com> <Y0V57gI75ik4ki3A@sol> <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
In-Reply-To: <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Oct 2022 16:39:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
Message-ID: <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Kent Gibson <warthog618@gmail.com>, linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy,

On Tue, Oct 11, 2022 at 4:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Oct 11, 2022 at 10:13:02PM +0800, Kent Gibson wrote:
> > On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
>
> ...
>
> > > > > > -#include <linux/gpio.h>
> > > > > >  #include <linux/gpio/driver.h>
> > > > > > +#include <linux/gpio.h>
> > > > > > +#include <linux/hte.h>
> > > > >
> > > > > Ok with the hte re-order.
> > > > >
> > > > > But moving the gpio subsystem header after the gpio/driver is not
> > > > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > > > to me the way it was.
> > > >
> > > > I see, I guess this is vim sort vs shell sort. Strange, they should
> > > > follow the locale settings...
> > >
> > > I have checked, the shell and vim sort gave the same result as in this patch.
> > >
> >
> > The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
> > and that still returns the same result.  That matches what I would
> > expect to see given the content of the text.
> >
> > And for me vim also gives the original order.
> >
> > Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?
>
> $ LC_COLLATE=C sort test1.txt
> #include <linux/gpio.h>
> #include <linux/gpio/driver.h>
>
> $ LC_COLLATE= sort test1.txt
> #include <linux/gpio/driver.h>
> #include <linux/gpio.h>
>
> I guess this explains the difference. Currently I have en_US.UTF-8.

Throwing my can of paint into the mix...

I think it is more logical to first include the general <linux/gpio.h>,
followed by whatever <linux/gpio-foo.h> and <linux/gpio/bar.h>,
irrespective of (language-specific or phonebook) sort order.

Yeah, it sucks that this requires some manual work after running sort...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
