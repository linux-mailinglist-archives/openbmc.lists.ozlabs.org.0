Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C34EAA09
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 11:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSNtR5Lvzz2xsm
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 20:04:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.175;
 helo=mail-qk1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSNt65XQMz2xT8;
 Tue, 29 Mar 2022 20:04:28 +1100 (AEDT)
Received: by mail-qk1-f175.google.com with SMTP id d65so10044122qke.5;
 Tue, 29 Mar 2022 02:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7LLXUdiKn5zGolda6p6nU0L90Q8R5gkNG4kyWBHOgl4=;
 b=ojjOxHoNTABGJRMfyHoeio0fxTb76wJ983pPn42WACIx32ENJFXONEUolKPYIjnEn5
 s52BArJgJqI6JX6oy2sZaRZNGjJp8Fm5/d0PutuLv2O3EUl6mPX5yIwu00/4UG7ZADXU
 QrhzvvqfTtwVUbQWgm3qbpLeKTgGMmq/jJ1aZJJ2IGm24Gc7W8IFwpkLZ0/yxM1y1CJU
 0YiAyGDbgT9nlDXXhfcWp4rvHA01tFvptou8E9R/smgsnOgKIYbuHm5aPegMVGcQY9U+
 a+bJ0aio8vc4htZR5ZB0fpyd1D9X/Kvdb6Cm4m9WYKGAcdIow/F88Rv92tYo38wUxEuD
 GcUA==
X-Gm-Message-State: AOAM531GXlRUjxJENFNRuve/FNM0qM49LhhjPkqZZJraqC42a/sdcEkb
 CxK9DuXr5x9TUmo8ie7wnZ74zC8yUvS+Kw==
X-Google-Smtp-Source: ABdhPJwWYq1gKIHIsRt9iJnUMBJ6ysXNX3ka1YiKwpAGISnih82BmjtG/Xeq++ikNruSWjHYs3JgLw==
X-Received: by 2002:a05:620a:4082:b0:67e:e53d:a68f with SMTP id
 f2-20020a05620a408200b0067ee53da68fmr19159612qko.406.1648544664639; 
 Tue, 29 Mar 2022 02:04:24 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 u62-20020a379241000000b0067ed2b0994dsm9267172qkd.54.2022.03.29.02.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 02:04:24 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2e68c95e0f9so176420197b3.0; 
 Tue, 29 Mar 2022 02:04:23 -0700 (PDT)
X-Received: by 2002:a81:24d6:0:b0:2e5:b253:f9fc with SMTP id
 k205-20020a8124d6000000b002e5b253f9fcmr30366724ywk.438.1648544663596; Tue, 29
 Mar 2022 02:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
In-Reply-To: <YkK691VG6ON/6Ysn@atomide.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Mar 2022 11:04:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
Message-ID: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Tony Lindgren <tony@atomide.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Daniel Palmer <daniel@0x0f.com>,
 linux-arm-kernel@axis.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tony,

On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
> * Daniel Palmer <daniel@0x0f.com> [220328 08:53]:
> > On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
> > > as the title say, the intention of this ""series"" is to finally categorize
> > > the ARM dts directory in subdirectory for each oem.
> >
> > While I agree with this change and think it's for the good (browsing
> > the ARM dts directory at the moment is frustrating..) I think
> > buildroot and others need to be told about this as it'll potentially
> > break their kernel build scripting for ARM and probably messes up the
> > configs they have for existing boards.
>
> Yeah.. And ideally this would be done in smaller steps as these will
> conflict with all the other pending patches.
>
> For example, I have a pile of pending omap clock clean-up dts patches
> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
> redoing or fixing up the patches with sed :)

Git merge/rebase/cherry-pick should handle renames fine?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
