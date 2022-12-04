Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43955641CA2
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 12:29:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQ4FT0Tfbz3bbh
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 22:29:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=moPrFkOZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=moPrFkOZ;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQ4Dv6R8wz2xl2
	for <openbmc@lists.ozlabs.org>; Sun,  4 Dec 2022 22:28:29 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id a7so10407289ljq.12
        for <openbmc@lists.ozlabs.org>; Sun, 04 Dec 2022 03:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dlASmsVVlIAawOyrYJeITNTPMdDfsPV+VZ2ZrkYJC7Y=;
        b=moPrFkOZYf5LNJBN0/oMqqx4uPpfxMyZw/cl1PiKjfMGljcjqM1c4A0Q10ksxLtO0j
         D8IiGe792U06UA85nItW/E7ItcjQ1/1eBLEvmvEGF7cWElkJZ2tTr8c5eCkm42h79CwJ
         +QaTDchUKzBWtGjmCoYTKgQZnbKe41TKBZ1vzL7Y+hBUuZK7lOHI9osS+l8XLwF6lSoF
         vaOg91FjxV0C4iBDbLZpZpQZJFJuKWhIzfNkFtgs4h9H+rKzTgXfOZY5vjjLsZKsZF30
         cGv5PoRvkSfSpcX0l537JA9r5GekerLZPO11IpErdr6I9lJBlrBi3PewbBEHSfHFyaE2
         q+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlASmsVVlIAawOyrYJeITNTPMdDfsPV+VZ2ZrkYJC7Y=;
        b=cp3OLYegqGDCe6tZ1cUCdgrN9VOmVrnjqxOrkcfbrKoz9YwAc6SYX/y05QlcwEHK/z
         gB0GLwaYpX8NNGtbrqkd15LTwqo4CmgVQZ8pqydR5TPbMnHLiEBb/CP0IeyGhYgIv0RL
         zYxhnhiWR+ivrmZ2QZJEeihEHk+RfGADAg9SyyQkvBh9CsTNxzn35SRH8bhgwBj/AIa2
         q7urrLpJAqVdflKab0qAEJ1lp+bRBHv/GRbfgjfk4bvKHWZKREt3LoA/eDTBabhkObsx
         QxkLz5hztUTsIPBL8AgclQaW1qM3YtdF56P/2814LVGl2UT/brmJKdEARquq5bBylb+d
         lAiw==
X-Gm-Message-State: ANoB5pkcVo3xAQ6/6cM0GEXnZJKkKhx9twywOtTTGk+BLKqkOe4/uK7P
	xumoIsFH7lpu/Cr89lWDYEGeghuIAsg/rS2ExUM=
X-Google-Smtp-Source: AA0mqf67qlul+nzl9WXyoO+z3yIXlr8GwaC1mMyospYAePxhQLm8xslW6KkAghrvhrumIJLs/opwZfWejis3GQtmL9o=
X-Received: by 2002:a2e:a37c:0:b0:26e:93:980d with SMTP id i28-20020a2ea37c000000b0026e0093980dmr26277436ljn.488.1670153305285;
 Sun, 04 Dec 2022 03:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20221130150857.67113-1-tmaimon77@gmail.com> <20221130150857.67113-2-tmaimon77@gmail.com>
 <20221201234954.GA1704219-robh@kernel.org>
In-Reply-To: <20221201234954.GA1704219-robh@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 4 Dec 2022 13:28:14 +0200
Message-ID: <CAP6Zq1iou=ViB_N+wE_3O6HO7FNEArhebpcbXuBsz4oRxdqXVQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mmc: npcm,sdhci: Document NPCM SDHCI controller
To: Rob Herring <robh@kernel.org>
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
Cc: andy.shevchenko@gmail.com, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, devicetree@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for your comments.

Your comments will be addressed next version.

On Fri, 2 Dec 2022 at 01:49, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Nov 30, 2022 at 05:08:56PM +0200, Tomer Maimon wrote:
> > Add binding for Nuvoton NPCM SDHCI controller.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/npcm,sdhci.yaml   | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml b/Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
> > new file mode 100644
> > index 000000000000..38409272807a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mmc/npcm,sdhci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NPCM SDHCI Controller
> > +
> > +maintainers:
> > +  - Tomer Maimon <tmaimon77@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,npcm750-sdhci
> > +      - nuvoton,npcm845-sdhci
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^sdhci@[0-9a-f]+$":
> > +    type: object
>
> sdhci is a child node of the nuvoton,npcm750-sdhci node?
No, will be removed
>
> > +    $ref: mmc-controller.yaml
>
> I think you want:
>
> allOf:
>   - $ref: mmc-controller.yaml#
>
> And then you will have some errors in the example to fix.
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    sdhci0: sdhci@f0840000 {
>
> Drop unused labels.
>
> Node name should be 'mmc'
>
> > +      compatible = "nuvoton,npcm750-sdhci";
>
> Indent by 4 spaces.
>
> > +      reg = <0xf0840000 0x200>;
> > +      interrupts = <0 27 4>;
> > +      clocks = <&clk 4>;
> > +    };
> > --
> > 2.33.0
> >
> >

Best regards,

Tomer
