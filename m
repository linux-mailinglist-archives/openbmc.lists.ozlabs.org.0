Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A7682F4E5
	for <lists+openbmc@lfdr.de>; Tue, 16 Jan 2024 20:03:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DEjbC4VL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDz1L2WkZz3cSn
	for <lists+openbmc@lfdr.de>; Wed, 17 Jan 2024 06:03:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DEjbC4VL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDz0h5Xdtz3cPp
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2024 06:02:44 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dc2281ee81fso932488276.2
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2024 11:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705431758; x=1706036558; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=37BvvneH+DlLoR6euXvYtraItFx+5QgIxfiDUnEo3GE=;
        b=DEjbC4VLrWqb1EZLiU+Qrp9aWRwgTKn3pF+HnFbmDLr4orOJ3HHr8BIb6C4i7uuFuM
         qPm5KsC5qLME/zEd20T7CDI32LMaJSKA5F7rIZyq0BRjanLCFd/h2zeiuDLIix6qN53L
         DW1jM/h+wiZ916PNUc1RNvaAVygXbdhnooSjYXk5Fz0I5W9CGZgmh7moL/IEs1UrBwpf
         CfyMkmvOhVicprSNfknIYH2sO2/X9EBjimbDYw1/aMRD8wGEFsfGUUD/oORpkG9mBJzS
         ScFHlW8wthedBwjbGr1ghV8dTWe7lBggZMQCOlwvYL/w8K6EI26Ccm0n4E+h4+KToTnB
         EI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705431758; x=1706036558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37BvvneH+DlLoR6euXvYtraItFx+5QgIxfiDUnEo3GE=;
        b=DuKHPbCpqbry/4SwHmIGj0oQXOAL1N4+KAYDOpInzgQqv10kNBShF4bs2YqMi4u9Zo
         7GVdJ7A26HJEQp8wcIkkgTrAVBsQHQSyTjnivsgP0t1LlkqdNTYpzojDlvAhqEMwKR+Y
         WYPD63tW0YAGEByfnbwWUejQQH2wMPe/5KqaaFEU/uILhXi26frKBWSzC3CaRVdM0twL
         8pn5L6UZAVo5VcpVXR9YigQqNAsURLaMVmhNQY0dkggrE4Gf5js5W3y4YfSYeHFlIZPg
         IkQGgRSjH51uKCapU86UNwicgBUG658ylutGNMbV2ziimyHrz/XoHqWJ05teFSgjU3X8
         nJAQ==
X-Gm-Message-State: AOJu0Yyvbceg8S8DK2hZE4NMWwnqq7lUkDLe3RrCVRx9gwJBBJMrDFwC
	8OiVGVLn+0oxp3A8Lh7DKsqiU/gVYekcETPhbEA=
X-Google-Smtp-Source: AGHT+IF0aqNvzRI/TFPNIdSK5alOC8kbE6Zw7zw8xF650MhjRhQkjA0VEk6REdgO7WZuhmD2VIeoUxHhurXZEoeur8E=
X-Received: by 2002:a25:938d:0:b0:db5:5020:518a with SMTP id
 a13-20020a25938d000000b00db55020518amr4061693ybm.4.1705431757056; Tue, 16 Jan
 2024 11:02:37 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-5-tmaimon77@gmail.com>
 <98eaac00-1e3d-4c27-89f5-0b6ec0fcb710@linaro.org>
In-Reply-To: <98eaac00-1e3d-4c27-89f5-0b6ec0fcb710@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jan 2024 21:02:25 +0200
Message-ID: <CAP6Zq1hxTgJWtem4Y4_4Hv1ojy5edzGXeBGhh_gzyM4Kewsbeg@mail.gmail.com>
Subject: Re: [PATCH v22 4/8] dt-bindings: soc: nuvoton: add binding for clock
 and reset registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your comments.

Sorry for the long explanation but I think it is necessary.

In the NPCM8XX SoC, the reset and the clock register modules are
scrambled in the same memory register region.
The NPCM8XX Clock driver is still in the upstream process (for a long
time) but the NPCM8XX reset driver is already upstreamed.

One of the main comments in the NPCM8XX Clock driver upstream process
is that the clock register is mixed with the reset register and
therefore we can't map (ioremap) the clock register
region because is already mapped by the reset module, therefore we
decided to use an external syscon to handle the clock and the reset
registers driver.

 I highly appreciate your guidance on this topic.

On Wed, 10 Jan 2024 at 22:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/01/2024 14:54, Tomer Maimon wrote:
> > A nuvoton,*-clk-rst node is present in nuvoton-common-npcm7xx.dtsi and
> > will be added to nuvoton-common-npcm8xx.dtsi. It is necessary for the
> > NPCM7xx and NPCM8xx clock and reset drivers, and may later be used to
> > retrieve SoC model and version information.
> >
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
> > This patch adds a binding to describe this node.
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
>
> How possibly could it be v22 if there is:
> 1. No changelog
> 2. No previous submissions
> ?
Should the dt-binding and dts patches be a part of the clock patch set
(this is why it's V22) or should I open a new patch set?
>
> NAK, it's something completely new without any explanation.
>
> Limited review follows.
>
>
> >  .../soc/nuvoton/nuvoton,npcm-clk-rst.yaml     | 40 +++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-clk-rst.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-clk-rst.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-clk-rst.yaml
> > new file mode 100644
> > index 000000000000..dfec64a8eb26
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-clk-rst.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-clk-rst.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Clock and reset registers block in Nuvoton SoCs
>
> This is vague. Any block? All blocks? Your SoC has only one block? I
> doubt, although possible.
>
> Anyway, clocks go to clock directory, not to soc! We've been here and
> you already received that feedback.
Since one region handles the reset and the clock registers shouldn't I
add the dt-binding to the SoC like the GCR and not to the clock
directory?
https://elixir.bootlin.com/linux/v6.7/source/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml
>
>
> > +
> > +maintainers:
> > +  - Tomer Maimon <tmaimon77@gmail.com>
> > +
> > +description:
> > +  The clock and reset registers are a registers block in Nuvoton SoCs that
> > +  handle both reset and clock functionality.
>
> That's still vague. Say something useful.
Will describe more
>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nuvoton,npcm750-clk-rst
> > +          - nuvoton,npcm845-clk-rst
> > +      - const: syscon
> > +      - const: simple-mfd
>
> No, it's not a syscon and not a simple-mfd. You just said it is clock
Yes, I understand the syscon node represents a register region
containing a set of miscellaneous registers, but as explain above it
is quite the case here.
I will remove the simple-mfd.
> provider and reset controller. Thus missing clock cells and reset cells.
The reset cell and clock cell found at the clock and reset dt-binding,
is it enough?
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties:
> > +  type: object
>
> No, instead:
> additionalProperties: false
O.K.
>
> > +
> > +examples:
> > +  - |
> > +    clk_rst: syscon@801000 {
I should use syscon no? if no what should I use?
>
> Suddenly a syscon?
>
> Drop unused label.
>
> > +      compatible = "nuvoton,npcm750-clk-rst", "syscon", "simple-mfd";
> > +      reg = <0x801000 0x6C>;
>
> Only lowercase hex.
>
> You just sent some v22 of something new, making all the mistakes from
> the past submissions for which you received feedback.
> > +    };
>
> Best regards,
> Krzysztof
>

Thanks a lot!

Tomer
