Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D44FC2EF
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 19:11:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kcb3b4X32z3bZf
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 03:11:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VTXUTMM8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532;
 helo=mail-ed1-x532.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VTXUTMM8; dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kcb392gCdz2yNH
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 03:10:43 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id v4so5783356edl.7
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2022 10:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gXYI7jas27KXQFWzQAqCjxbvW9SNZ9FrO2KKjkUfn0k=;
 b=VTXUTMM8/MVPRxc7Dj8tuvwskdeJ2OL3vjFhCYJjaL7PT8yjgolt0IrOwBQF4CIuaV
 1QvMjeVI+WJvJ/RpGs/CnsXytir4GHRcHL6zapzw+8WocEdElNfeWnm9dwNq/qCfXAty
 ntyM2100cVWknYXIFfPG8PNxs81t4Jxe+pi2t65vgrrpUQrlGGFvMvGUam1h3QCAIRdF
 rxn1S9XmmDq7K2Y3V7IoVjLooqMxNYqYTCTcF7BHlpEaSDc0xPGiOHFW0FstDB8B+uAO
 zop20r0dXRU5zORi5/uArwPzcq9xNJPejLFvLFl09Dly+Ua/D0Q+C+10QOQQn0djfvqz
 lDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gXYI7jas27KXQFWzQAqCjxbvW9SNZ9FrO2KKjkUfn0k=;
 b=F0myN4zJkJxQZlvb55vrlQa0IplANIdQDqhGkQFoDGI5ScV4eftGoy8hLpNAdLqRje
 EGIt/j0/14Zgyx1Toch3rMWzi1T12rfjZUrcuH1kg/VvzD9htTnUgiJnAo5SOXPp3i1L
 cs/eEqvxUrRTLVvv1SUQKTw73hTTPiL/dxabKijLgg//4cCMmzxVNieNrp6yxzA3vFST
 uRr61jZa0ULWNcFZcnybPhAOwRSyxUJBaSy/AGHMkCPiXZA0z+t7TqR/uhp6j3+BeF0J
 ir4U7GmywAYM68PBqW+Aw46X0EdJd2bD0+XJjPCnp7O4S3Kxjjw4dKpGXbtolCdoaXaN
 iOUw==
X-Gm-Message-State: AOAM530kFKsNe9uJHSaKIKP4E8LB1nhK5IJ+UcHD43hN8/q3tXseqahc
 S3v+EP8y3O8TPkKPlMYejP8ZgqYB+tDWvMpwBJU=
X-Google-Smtp-Source: ABdhPJw9xLUS4WGM4zeOtEBtedr4s97anadMlmsyHgl4E+GO4fVj7RlJfDmCSp5DWYDyKqMJeEW6PPURDHgW7jz33ZU=
X-Received: by 2002:a05:6402:27d1:b0:419:1b02:4a04 with SMTP id
 c17-20020a05640227d100b004191b024a04mr34275976ede.218.1649697034913; Mon, 11
 Apr 2022 10:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220411162033.39613-1-eajames@linux.ibm.com>
In-Reply-To: <20220411162033.39613-1-eajames@linux.ibm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Apr 2022 20:06:21 +0300
Message-ID: <CAHp75VeXCMobbcpvcWPt2eeDXeHs5caB=fsAFC0xy4_0DT2miA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] leds: pca955x: Add HW blink support
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 11, 2022 at 7:20 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> This series adds support for blinking using the PCA955x chip, falling
> back to software blinking if another LED on the chip is already blinking
> at a different rate, or if the requested rate isn't representable with
> the PCA955x.
> Also included are some minor clean up and optimization changes that make
> the HW blinking a bit easier.

Don't see any big issues here, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

But please consider two things for the future improvements:
1) switching to regmap API;
2) switching to bitmap API.

You may find some code in drivers/gpio/gpio-pca953x.c. It might be
that some common code can be split to the generic bitmap/regmap
operations.

> Changes since v2:
>  - Split the cleanup patch
>  - Prettier dev_err calls
>  - Include units for blink period and use defined unit translations
>    rather than just a number.
>  - Use positive conditionals.
>
> Changes since v1:
>  - Rework the blink function to fallback to software blinking if the
>    period is out of range of the chip's capabilities or if another LED
>    on the chip is already blinking at a different rate.
>  - Add the cleanup patch
>
> Eddie James (4):
>   leds: pca955x: Refactor with helper functions and renaming
>   leds: pca955x: Use pointers to driver data rather than I2C client
>   leds: pca955x: Optimize probe led selection
>   leds: pca955x: Add HW blink support
>
>  drivers/leds/leds-pca955x.c | 341 ++++++++++++++++++++++++------------
>  1 file changed, 232 insertions(+), 109 deletions(-)
>
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
