Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8104EC0C3
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 13:52:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT4Xw0Pntz3046
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 22:52:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.45; helo=mail-qv1-f45.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT4XL17rmz300L
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 22:51:29 +1100 (AEDT)
Received: by mail-qv1-f45.google.com with SMTP id kc20so16635376qvb.3
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 04:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bec0iphyAFTcaBtQxwlj+Sc/83TcuopoiWiMOgp6Yzk=;
 b=ptwV6qOWTz3YI/HCtL38XiCanjyxFBEBhObRMjgOmusX274TDl7IpF5KgNM92SWDqF
 JF32qggL3tWPiJF8QrUepikm/R5VLr0UnjA+Ya/TRSh6LG44oXtWUk++d5/X1RaNvfZR
 2P5wjGkFb8TQDYV6bmkiGbSZl0xyNauiRdBXhFrYSvpPNSJ6dBMzu+UbCANdG3U6y7hy
 4yZyQT1z3pynkYDFpRap/SjNpkioJClJFLB4LlPkhvA03+mnAuJAN3BxACFJ5GsBPygW
 TTc0ZjvejQmX1WaeRXXsKKIGmqWkldnAuc3o8hw2DeiWmVs61Lk8ymCzF20pJkLs02gr
 Ef6Q==
X-Gm-Message-State: AOAM530O/mG9XogTEYRpQ6qw3LgzdB+ko+rhZhKJ+tFH0/SfAqBNADMy
 sGiWY+hEI/eBz04ms844MBq3Zx4Jq7sOIw==
X-Google-Smtp-Source: ABdhPJzSl/yUmsGAERR1eSGBAf1oUc7yij9gcbEY27Xw/ZJKtrmHJNO3tPjIAvnlnCSJifbci/ULtg==
X-Received: by 2002:ad4:5aef:0:b0:432:99db:2895 with SMTP id
 c15-20020ad45aef000000b0043299db2895mr30550882qvh.67.1648641086432; 
 Wed, 30 Mar 2022 04:51:26 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 az17-20020a05620a171100b00680af0db559sm9366535qkb.127.2022.03.30.04.51.25
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 04:51:26 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id f23so5905436ybj.7
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 04:51:25 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr16955433ybq.342.1648641085421; Wed, 30
 Mar 2022 04:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <f7ea35c723da72a89028da5b976ad417fbd7bf52.1648545587.git.geert@linux-m68k.org>
 <YkLgapMN2JqM+Lte@kroah.com> <YkM9CPbeARpWHMPw@heinlein>
 <342ae21e4bba6b0eccb39113fafa411aa8e93f96.camel@intel.com>
In-Reply-To: <342ae21e4bba6b0eccb39113fafa411aa8e93f96.camel@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 13:51:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2AixR0kKxT5j3uSGDs5ntf4NuzRN7PjF=-vpo1bUi_Q@mail.gmail.com>
Message-ID: <CAMuHMdU2AixR0kKxT5j3uSGDs5ntf4NuzRN7PjF=-vpo1bUi_Q@mail.gmail.com>
Subject: Re: [PATCH] peci: PECI should depend on ARCH_ASPEED
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
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
Cc: "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Iwona,

On Wed, Mar 30, 2022 at 12:37 PM Winiarska, Iwona
<iwona.winiarska@intel.com> wrote:
> On Tue, 2022-03-29 at 12:08 -0500, Patrick Williams wrote:
> > On Tue, Mar 29, 2022 at 12:33:14PM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Mar 29, 2022 at 11:21:37AM +0200, Geert Uytterhoeven wrote:
> > > > The Platform Environment Control Interface (PECI) is only available on
> > > > Baseboard Management Controllers (BMC) for Intel processors.  Currently
> > > > the only supported BMCs are ASpeed BMC SoCs.  Hence add a dependency on
> > > > ARCH_ASPEED, to prevent asking the user about the PECI subsystem when
> > > > configuring a kernel without ASpeed SoC support.
> > > >
> > > > Fixes: 6523d3b2ffa238ac ("peci: Add core infrastructure")
> > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > ---
> > > >  drivers/peci/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
> > > > index 89872ad833201510..0d3ef8ba0998d649 100644
> > > > --- a/drivers/peci/Kconfig
> > > > +++ b/drivers/peci/Kconfig
> > > > @@ -2,6 +2,7 @@
> > > >
> > > >  menuconfig PECI
> > > >         tristate "PECI support"
> > > > +       depends on ARCH_ASPEED || COMPILE_TEST
> > >
> > > I hate ARCH_ dependencies as there is nothing specific with that one
> > > platform that means that this driver subsystem will only work on that
> > > one.
> >
> > The motivation in the commit message isn't even accurate because the chips
> > under ARCH_NPCM are usually used as a BMC as well and PECI is just as important
> > for them.  HPE also has a custom chip they use as BMC and they've started the
> > process for upstreaming that support.
>
> "Currently the only supported BMCs are ASpeed BMC SoCs."
> From PECI subsystem perspective (not BMC support in general), it is technically
> true for now - but I agree with Greg and Patrick, this is just artificially
> introducing build-time dependencies where in fact there are none. And yes - we
> would then have to add the "depends on ARCH_YET_ANOTHER_ARCH" to generic
> subsystem anytime we add a new PECI controller. This belongs in the controller
> (and the ASPEED one depends on ARCH_ASPEED).

OK, let's keep it as-is.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
