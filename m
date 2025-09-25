Return-Path: <openbmc+bounces-686-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1566FB9DECC
	for <lists+openbmc@lfdr.de>; Thu, 25 Sep 2025 09:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXQwF5rvRz2ytg;
	Thu, 25 Sep 2025 17:54:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.166.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758786861;
	cv=none; b=hFuXtX2G7Zugrga91HGZjeqtom2PjvauKNb9SaxjtwhWhhTVOGx5UR4pHpFFyZ5ENUfMAc+mEsnLYN60eTMPmCcaHH0D9GS0N3H7npWIXIsB9u2i2y3B8psNkxRkK9JY+j3fB5H/d6KBuCNnFG6fvcjH1BqoCJ9SNs+lK67HmF9OkjCl1U97dr/TULw2fAVeSqYjNZ6Tm5uNJPtQkl+h4KUEucyeR5HH75hTsgatsMEnLxa6w8EV8Z6SROlhy4MYBtp67PS/g9P6TZRcSyBm/ZIKIflKpeUn0zd8v95S+wYAV4ojlk1LeIV6gc1QfEZfU9BlF60WJz4jPJ0IV5SUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758786861; c=relaxed/relaxed;
	bh=9fvGyyGJ8hFx3nYrMkZDfGE5Winq5taN5wWeFI0QZNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bV9iPceI8VIqAxQYFZu0LiaW+nz0MVMyGc0KaiNk2I5ReaaPw7MpGqmoBzexQH3fDqthw8vkbQaHv31xp2MyatpovUYBbp+JwP4Mdn6IXwjxpfFvGGjrSnchiBS7RBOdtlJMhkxiNrLBqU7Z7PZI5oo/nXmG8Fq+vUJAFwez60T4ExoK1k4gLeutvlPCkZ0qOkD0yaM+6bQzPmdt25UeEOMeXn+Q8qE19LAEEM34dHfmM8ZrA2b3SO8CtAhnnheQfdDoBKj5suBfCcm2QyqTQvn401W4l/wvQKX0DPzuM8EoLjyBeBsUKRG5gOmo5asybEP9RY6TasGQrcnKf+Qv1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.166.177; helo=mail-il1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.177; helo=mail-il1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXQwD32Fjz2yrP
	for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 17:54:20 +1000 (AEST)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-4248b34fc8eso6304485ab.3
        for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 00:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786857; x=1759391657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fvGyyGJ8hFx3nYrMkZDfGE5Winq5taN5wWeFI0QZNc=;
        b=D1cI0H7Q8Sby1iG7nA75aolbLHj/1fx8T/tf3D5iXqjJQ+LYrZOsshn8cav3G+MfeI
         ux5d1NpfRTVRIwd+xGqpeIe+O9yS2itWF1bPpUIe/hqs+IjpXTSRK56LVivC/3YML5Th
         VRZoHdHy/8+j9nfg2KLCuAq6Yy3lQeZsK8wo1yZCVxcaSQzSAXCHlMopUbS1zHOu8xA8
         1bXskfPSJlmZZKcKMA1kHGMIJXie6Gh6KCNT5Li/tvK92tRNpj9KWOr5U/dd7vZuicCV
         m6nW78Cv+HWl1Y+sSDliDWg177sdMoPSyf4byCJwMsdxNvPX7X4QQ6Kf//qAe4cRN4JM
         FiFw==
X-Forwarded-Encrypted: i=1; AJvYcCUBmAPZXlF5C+oI/KTBzu1qCEKQP3IO7CcFkV9zZt1bxTGxJ4MCDHNQnlnT2VFBO9ydSoISPssq@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJpxGIXTCKcr4uYi3UC2taMuDxldcj3G93zVVcERHLccSn8SZR
	2sR7VrF0a3yIRz0eF9hnpaaCTTvJTuqV3VuiCkguxJRYeP9G3l8q4bttd4xgXYYW
X-Gm-Gg: ASbGncs+xeSLLMi23My3YXRqgXpeVw3f6rdtnmQN+tJCsq8utwZJixeAJmH6SPlhPDF
	XA3vrltKiUOCtJENAvtLsSPHuE+Z66UmQ4+fF7jtyOLwECi1GF10LgNdFtIaXDjj4hKS84kKsFX
	OmlYferqJLuDJLQyZWje0+td6PL2V3RGun2yWbMI/ByQplKXzztpCxqUt86qVk26uAEjbHkgUoa
	Srn4Matdyvb8JcuIqVVvrkHrNSyS/3o9aMUpthzOcerwNTg4ucTjbFf0p6IUxlX2Tqo3aXtq+BX
	Utkh3/Smh6Svgq5MexL4g+rwuNYtZK4FgVPysLxd7MzsNp8sjvMa5IkxxYTQ4yTkmwb1OkSz9ig
	Z6jJNIaPTVMxDAcpcz+JWLIzHrNMcm98Rt1V9JChFEimHcJuH3+h2N2azVBV8
X-Google-Smtp-Source: AGHT+IEcFTTSeVeiZ7Q5kYKLwatGIfZ06LU9U8xdp0btMlbnNu5xqRk6Roi29a9yNrFHR3dAx0rSJQ==
X-Received: by 2002:a92:c70f:0:b0:425:80d0:82c6 with SMTP id e9e14a558f8ab-42595654edemr34106985ab.26.1758786857080;
        Thu, 25 Sep 2025 00:54:17 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bc685127sm6390155ab.11.2025.09.25.00.54.16
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 00:54:16 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-90926724bceso7212039f.1
        for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 00:54:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSYIJ58JzL4g5f9CWTALWOLA7Ev+Zu+0UBmeIjEM+6wUl2rYZc1G1BSMfPdZmsNpNq72fvjODp@lists.ozlabs.org
X-Received: by 2002:a05:6102:510d:b0:529:fc9e:84a0 with SMTP id
 ada2fe7eead31-5acd36bc5d5mr955558137.32.1758786509499; Thu, 25 Sep 2025
 00:48:29 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 09:48:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
X-Gm-Features: AS18NWAlEwAE5FC0AW6Wq0ip31mrrj6gmcRezsp6GMYcQa-YSc4N16xdaxhcVw8
Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bartosz,

On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.

Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
use more common syntax for compound literals") in pinctrl/for-next

> Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

Looks like you (slightly) missed your target. The correct link is:

    Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

