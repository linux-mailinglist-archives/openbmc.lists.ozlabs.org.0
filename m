Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E430762AF1B
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 00:07:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBhfR5cPLz3brJ
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 10:07:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hku9bPre;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hku9bPre;
	dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBLKd2QhQz3bjk
	for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2022 20:21:55 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id c15so8354324qtw.8
        for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2022 01:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xXL/hOs12FtYk0AbtyBPhJfzSMYRFKjKvVy0h+Tw7Hc=;
        b=hku9bPre7z/rmX8trtw0laMTMJsXJZzJ5kv0wzQ63Nu4YaiyH61mtYfscjoC8J7KsT
         RmrxDzo1vKeAWi+c5jHBnUZkPtvtr8YuPQJxcXkquJOUb7vzMIsCaHjd3bC0Qcw+AgWA
         /hh1NYhyxqPdo1Am+rkxQEZbuZQ/CbNHil9h457brT9+X2GSHeusMUTtdW59BFLzFpxP
         5/Sl3x7YR+hWttbd1DI70S18O+s4rWkoOvopbocnJL/BtUdio9qY9eDVvd766lSWo376
         nXCrTbiPBIOU82PyNw41a2/iwcao2dXQ9n4BYHTFC8hr7PFtNIJJlXG0WG5i3GVfjOh6
         Ydgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXL/hOs12FtYk0AbtyBPhJfzSMYRFKjKvVy0h+Tw7Hc=;
        b=6aoZFqN3JlQ3HjcsAuD/XVn4FJlS6d91bnWifOys1dP12mxN3PsIRpjhCTQBIwg5m4
         dUGI5zZgm2a0p9tQg6o9d3eggUF/cFrikjkf29wVGlNhSq8/Zxv/XTaal+1MWY1ZdKFt
         h5gfLwTlku5ZS3DNyrIn2aEeA54s1tR2w11k6nFcnX4xaLuXPGudbtdttrpSji5C0+dq
         REu6mK7QAOqBXi4Uis2EEd0dfvv6AJMY3mHJDnyQJ0VwxfWocc3dapt4JN5flWfJcv3y
         NOfluRPHpBRymkaaHt2+Pt3pZ/QjsPjBGCK+Dq/1bu2bW6aH5VlpCKfVHEKnUVJBUslQ
         pX6Q==
X-Gm-Message-State: ANoB5pl4AIXj+m8b5MNRg66wc6Iqw56FQoxYujq9vuP8Db0bycojjJMD
	Xy7FWBq5eUX60pVxbkHPV7Pp1UczYkkgqQ+oX9w=
X-Google-Smtp-Source: AA0mqf4YJ2cL4QTriG7mNPmQbW//LTaVCPgXBbNW8Dtht0N40RPHWO3lkf6xjgCAVTJycjjexUtxYPLi7cCVtzeyES0=
X-Received: by 2002:ac8:1414:0:b0:3a5:3cb2:d849 with SMTP id
 k20-20020ac81414000000b003a53cb2d849mr15998551qtj.504.1668504110388; Tue, 15
 Nov 2022 01:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20221108092840.14945-1-JJLIU0@nuvoton.com> <20221108092840.14945-4-JJLIU0@nuvoton.com>
 <CACRpkdb+Bkwa8yCKGtRcsJ6KnJh+RUuz_gOrQV63pcYQLaHCaw@mail.gmail.com>
 <CAKUZ0+GCf_Zv=VhnY5Z=yYAfR1=_ha98BVVxRGVy8ui6so_Yrg@mail.gmail.com>
 <CACRpkdYW0P8gqtGdiRX_frP32WF2W=NVg1JTu1fVMBXxEL0-WA@mail.gmail.com>
 <CAKUZ0+Hy5suFg9VZ8-+cH7kGc5KLqUnf9hjnT+iaw+a1HF8x0A@mail.gmail.com> <CACRpkdYbS_syVwgc=YndkV-DpEF0K8NpH6WzP=g0AFpN+OTN8A@mail.gmail.com>
In-Reply-To: <CACRpkdYbS_syVwgc=YndkV-DpEF0K8NpH6WzP=g0AFpN+OTN8A@mail.gmail.com>
From: Jim Liu <jim.t90615@gmail.com>
Date: Tue, 15 Nov 2022 17:21:39 +0800
Message-ID: <CAKUZ0+FD=x8s+vqUpYwsuRUw-yTHQjtTFzWDwW=d4k8X1x1LoQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: Add Nuvoton NPCM750 serial I/O
 expansion interface(SGPIO)
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 16 Nov 2022 10:06:44 +1100
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Linus and Krzysztof

Thanks for your understanding and your suggestion.
I will follow your suggestion to modify the yaml file.
-> nuvoton,input-ngpios = <...>
-> nuvoton,output-ngpios = <...>

And I don't think the node name needs to use gpio.
because it's not a general gpio, so I reference aspeed dts and use sgpio.
Could I use the sgpio node name or could you provide some suggestions?


If you have any questions or are confused please let me know.
Your comments are most welcome.

Best regards,
Jim
On Mon, Nov 14, 2022 at 6:13 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Nov 14, 2022 at 9:38 AM Jim Liu <jim.t90615@gmail.com> wrote:
>
> > Our sgpio module has 64 pins output and 64 pins input.
> > Soc have 8 reg to control 64 output pins
> > and  8 reg to control 64 input pins.
> > so the pin is only for gpi or gpo.
> >
> > The common property ngpio can be out or in.
> > so i need to create d_out and d_in to control it.
> > customers can set the number of output or input pins to use.
> > the driver will open the ports to use.
> > ex: if  i set d_out=9   and d_in=20
> > driver will open two output ports and three input ports.
> >
> > Another method  is the driver default opens all ports , in this
> > situation the driver doesn't need d_out and d_in.
>
> Finally I get it!
>
> Some of the above should go into the binding document so that
> others understand it too.
>
> Have you considered splitting this into 2 instances with 2 DT nodes:
> one with up to 64 output-only pins and one with up to 64 input-only pins?
> That means more nodes in the DT and more compatibles. If all
> the registers are in the same place maybe this is not a good
> idea.
>
> If you feel you need to keep the two properties, create something custom
> for your hardware because this is not generally useful, e.g.
>
> nuvoton,input-ngpios = <...>
> nuvoton,output-ngpios = <...>
>
> By this nomenclature it also becomes more evident what is going on.
>
> Yours,
> Linus Walleij
