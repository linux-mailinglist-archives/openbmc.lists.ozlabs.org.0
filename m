Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F69655FA2
	for <lists+openbmc@lfdr.de>; Mon, 26 Dec 2022 04:51:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NgP3h6rpyz3bZj
	for <lists+openbmc@lfdr.de>; Mon, 26 Dec 2022 14:51:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MblcnAWS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MblcnAWS;
	dkim-atps=neutral
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NgP342hMTz2xGH
	for <openbmc@lists.ozlabs.org>; Mon, 26 Dec 2022 14:51:11 +1100 (AEDT)
Received: by mail-vs1-xe30.google.com with SMTP id a66so9435057vsa.6
        for <openbmc@lists.ozlabs.org>; Sun, 25 Dec 2022 19:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ebdzjNZkPM5tKxMYiRS8XjnRbsm2WIJ55zWlFIDdo/M=;
        b=MblcnAWS481tElFFCtcHLHp/1bPzKgl42LGIunOJDMq/cyFIfuNEH4PhXP5wO3p+h1
         AA7U0R2Rcur3i3kidhnOFtdTL2uSlKc8bG9PN/K620uCQBIvm1Trli0lvc45dK3+lxCF
         tXD1RLPlndPfgZw6EkuDBl9UGPQYaFpDCb+tU6MVaOxefhdxRaDbIf2q7xs0bL9xYveH
         i+3iJD1NSDavycLLPvi3FG8BMIxkT2gmb0zRI8LMQjah1vomnCt5G0wuDTffveUvFMJp
         GurW/p8kYzEka0SE8Q8XWG0aKG/wlaknT5iaONCXk/MDLJET8P56lKvhSq4R0v6dvX5Z
         EBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebdzjNZkPM5tKxMYiRS8XjnRbsm2WIJ55zWlFIDdo/M=;
        b=uVx90GYS+ao9f5HBATBpBeW89rePCytYd/ZfKunoM1ySj4oKGMVyfsSBnxgFDpbWhY
         IJZPKzFKyJJFO6bVz5WS2KRQ4ztGXS9o5SbidlYFD2dMjYdoHNLEfbbOstxDYrRKm/dK
         LwMn1uvNTvYUn1YvVXDj+2OLhaSDUVHBZWatsJ3yRldy4F87nUI8P/42+MmDu73Sw5QV
         ghO8N17UYNPx/ryRGS5r2Js+xvqFrfH9+ptUUMcGtGu1UxPAJtKurywQJL2xUO50ksqc
         X9XS5mmG2QIUfJaZGg5KpH6gz2iN0N3W0CbdOIMZGHf5ynXzObWcNZpYtIgqGmokNDXz
         DNIw==
X-Gm-Message-State: AFqh2kqu6k7WWKk/1b5lEDe2a8MlBW2ds0jhenIri7wfHaal/KCcDgyv
	iO2/DEnu//Mbzuo19qDlMJYr1SecM/F1SoFtSXM=
X-Google-Smtp-Source: AMrXdXv7O/NhidrnpBGzUMwPNfsTKnYtgU/aAn85pdY6ULJakn7iPm/W42Lju4MTmpWQuMZLKSjjRpip2rnB5HnPrGA=
X-Received: by 2002:a05:6102:e94:b0:3b1:3231:ac9e with SMTP id
 l20-20020a0561020e9400b003b13231ac9emr1815373vst.50.1672026666154; Sun, 25
 Dec 2022 19:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20221223032859.3055638-1-milkfafa@gmail.com> <20221223032859.3055638-4-milkfafa@gmail.com>
 <Y6WniKjA6BHLknP6@zn.tnic>
In-Reply-To: <Y6WniKjA6BHLknP6@zn.tnic>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Mon, 26 Dec 2022 11:50:54 +0800
Message-ID: <CADnNmFqQ5_OQ-FiqdSZAtXFdG2X=qociXBykqL0TqtMw9r_=_A@mail.gmail.com>
Subject: Re: [PATCH v17 3/3] EDAC/npcm: Add NPCM memory controller driver
To: Borislav Petkov <bp@alien8.de>
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, linux-edac@vger.kernel.org, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, james.morse@arm.com, ctcchien@nuvoton.com, YSCHU@nuvoton.com, mchehab@kernel.org, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Boris,

Thanks for the review.

> > +     u64 addr = 0;
> > +     u64 data = 0;
> > +     u32 val_h = 0;
> > +     u32 val_l, id, synd;
>
>         u32 val_h = 0, val_l, id, synd;
>         u64 addr = 0, data = 0;
>
> Also, for all your functions:
>
> The EDAC tree preferred ordering of variable declarations at the
> beginning of a function is reverse fir tree order::
>
>         struct long_struct_name *descriptive_name;
>         unsigned long foo, bar;
>         unsigned int tmp;
>         int ret;
>
> The above is faster to parse than the reverse ordering::
>
>         int ret;
>         unsigned int tmp;
>         unsigned long foo, bar;
>         struct long_struct_name *descriptive_name;
>
> And even more so than random ordering::
>
>         unsigned long foo, bar;
>         int ret;
>         struct long_struct_name *descriptive_name;
>         unsigned int tmp;

I'll check all functions and follow this order.

> > +     edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1, addr >> PAGE_SHIFT,
> > +                          addr & ~PAGE_MASK, synd, 0, 0, -1, priv->message,
>
> No need for that linebreak with the trailing piece.
>
> > +                          "");

> > +     u64 addr = 0;
> > +     u64 data = 0;
> > +     u32 val_h = 0;
> > +     u32 val_l, id, synd;
>
> As above.

Check.

> > +     regmap_read(npcm_regmap, pdata->ctl_int_status, &status);
> > +     if (status & pdata->int_status_ce_mask) {
> > +             handle_ce(mci);
> > +
> > +             /* acknowledge the CE interrupt */
> > +             regmap_write(npcm_regmap, pdata->ctl_int_ack,
> > +                          pdata->int_ack_ce_mask);
> > +             return IRQ_HANDLED;
> > +     } else if (status & pdata->int_status_ue_mask) {
> > +             handle_ue(mci);
> > +
> > +             /* acknowledge the UE interrupt */
> > +             regmap_write(npcm_regmap, pdata->ctl_int_ack,
> > +                          pdata->int_ack_ue_mask);
> > +             return IRQ_HANDLED;
> > +     }
>
>         WARN_ON_ONCE(1);
>
> to catch weird cases.

OK.

> > +     /* write syndrome to XOR_CHECK_BITS */
> > +     if (priv->error_type == 0) {
>
>         if (priv->error_type == ERROR_TYPE_CORRECTABLE
>
> Use defines. Below too.
>
> > +             if (priv->location == 0 && priv->bit > 63) {

Will add defines.

> > +                     edac_printk(KERN_INFO, EDAC_MOD_NAME,
> > +                                 "data bit should not exceed 63\n");
>
>                                 "data bit should not exceed 63 (%d)\n", priv->bit...)
>
> Below too.
>
> > +                     return count;
> > +             }
> > +
> > +             if (priv->location == 1 && priv->bit > 7) {
> > +                     edac_printk(KERN_INFO, EDAC_MOD_NAME,
> > +                                 "checkcode bit should not exceed 7\n");

OK.

> > +             syndrome = priv->location ? 1 << priv->bit :
> > +                        data_synd[priv->bit];
>
>                 syndrome = priv->location ? 1 << priv->bit
>                                           : data_synd[priv->bit];

Just to confirm the indentation, is it right as follows?

syndrome = priv->location ? 1 << priv->bit
                                           : data_synd[priv->bit];

And I was wondering if I should just remove the line break and let it stick out?

> I'd find it helpful if there were a short recipe in a comment here
> explaining how the injection should be done...
>
> > +static void setup_debugfs(struct mem_ctl_info *mci)
> > +{

OK, will add some injection examples here.

> > +     regmap_update_bits(npcm_regmap, pdata->ctl_ecc_en, pdata->ecc_en_mask,
> > +                        0);
>
> You have a bunch of those things: the 80 cols rule is not a rigid and a
> static one - you should rather apply common sense. As in:
>
> Does it make sense to have this ugly linebreak with only the 0 argument there?
>
>         regmap_update_bits(npcm_regmap, pdata->ctl_ecc_en, pdata->ecc_en_mask,
>                            0);
>
> or should I simply let it stick out:
>
>         regmap_update_bits(npcm_regmap, pdata->ctl_ecc_en, pdata->ecc_en_mask, 0);
>
> and have much more readable code?
>
> Please apply common sense to all your linebreaks above.

Thanks for the guide.

> > +     edac_mc_del_mc(&pdev->dev);
> > +     edac_mc_free(mci);
>
> <--- What happens if someone tries to inject errors right at this
> moment, when you've freed the mci?
>
> Hint: you should destroy resources in the opposite order you've
> allocated them.

Understand. I'll correct the destroy order.

Regards,
Marvin
