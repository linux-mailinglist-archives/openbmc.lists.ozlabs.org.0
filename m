Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FB836CB8
	for <lists+openbmc@lfdr.de>; Mon, 22 Jan 2024 18:15:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PtyNZi5K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJcLD12cWz3c5t
	for <lists+openbmc@lfdr.de>; Tue, 23 Jan 2024 04:15:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PtyNZi5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJcKT56W5z3bjK
	for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2024 04:14:51 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5ff7ec8772dso25922407b3.0
        for <openbmc@lists.ozlabs.org>; Mon, 22 Jan 2024 09:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705943687; x=1706548487; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cflqha/SxEPyMnPT+Q4Hubu1jS63TFZEbLnYKZIjN1I=;
        b=PtyNZi5KJ19fsZDkgbb6lNfh30u+YHhILpxMEqNMvFMlwhWBXXQVIs4r3KYEphyqwN
         vPHEeTsrLtzvW5JopFeSfChnScIvpFAeMrNRk6ZXgVwDAD1XTfgVtALf93VFOLJWg5su
         JXtbCYxjXzn9z6XAvDiQ6gwsEi+JYBCSnBIg5EJJGILkf6Soh+AsVJ0mWSv6RFnKzKVS
         800iAJW9jP3RIlZu8yPPQl6aArf/IAos2t1CO2yqLzoYD00H5IFNb/TEbH9ZHnMvU+KE
         ZCZ/3VOMFCPFHBl+xyDNHN5YGnAOj7TBKLV8UAy0jC4HMcgewcKR/BnL/CCFUFlk8ghU
         5FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705943687; x=1706548487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cflqha/SxEPyMnPT+Q4Hubu1jS63TFZEbLnYKZIjN1I=;
        b=RNOoHcIPfCSDpu1dMpb/espOwszLQdKe9AdJCEPHJwqjwzeiVc94N8UDjRZTN04e7V
         7X8S97AsmzaS7imTc9cl1xeUbGWaWzM18gSfaNIsYkgyikeU+hQWgYvZ8fcGBBDH6Itc
         xdbgFoWamr0lpnwp6FWm0UMtbNevxURcRxVHNJQnlBMNYiA/g0PvUl6fQ49vNAcMOMcr
         TzgeoF054HRAvGlti+nkdyabo/LJqKyyLIr4/iIsRCqsqtTFXVOpVPLt56+xmQ4RDEhd
         2edXZBbUN1RKMTDe3qcnVbYhMW0yxHXZxBRnsJGiw9WjIqN636jkuMzZAS2AyjOdWI4/
         GPVA==
X-Gm-Message-State: AOJu0Yz31nh1hUmFd2Ub7RIGvv2gxhiduqJ4W/QE4jENVLiveUwTXpE5
	lQa2qPGxxaeYI9BvOpsbkxVsWdAWEGYhAlvru+YGniYGhkaLXEJ0h/4w5mB6eFZVe11nvus7+cY
	7XaN8rYAjEtY+ZetbLbpS4oJDZlQ=
X-Google-Smtp-Source: AGHT+IF5NVFrNO6XBBa/fWapOIYEHp61pOwT0oqQvijNOqGM13277tCT3QBZf7IkvDgcu3OUPajb4ZUc2wUvffM5CCc=
X-Received: by 2002:a81:9144:0:b0:5fa:e85a:9519 with SMTP id
 i65-20020a819144000000b005fae85a9519mr3420034ywg.75.1705943686758; Mon, 22
 Jan 2024 09:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-5-tmaimon77@gmail.com>
 <98eaac00-1e3d-4c27-89f5-0b6ec0fcb710@linaro.org> <CAP6Zq1hxTgJWtem4Y4_4Hv1ojy5edzGXeBGhh_gzyM4Kewsbeg@mail.gmail.com>
 <64a35c38-38e4-486f-8a07-4aee1d14e05a@linaro.org>
In-Reply-To: <64a35c38-38e4-486f-8a07-4aee1d14e05a@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 22 Jan 2024 19:14:35 +0200
Message-ID: <CAP6Zq1jhy0GUtoO3=m-PHD3WCertSvAg+G7iygiRkWvjzfwSpQ@mail.gmail.com>
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

Thanks for your comment

On Tue, 16 Jan 2024 at 22:37, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/01/2024 20:02, Tomer Maimon wrote:
> > Hi Krzysztof,
> >
> > Thanks for your comments.
> >
> > Sorry for the long explanation but I think it is necessary.
> >
> > In the NPCM8XX SoC, the reset and the clock register modules are
> > scrambled in the same memory register region.
> > The NPCM8XX Clock driver is still in the upstream process (for a long
> > time) but the NPCM8XX reset driver is already upstreamed.
> >
> > One of the main comments in the NPCM8XX Clock driver upstream process
> > is that the clock register is mixed with the reset register and
> > therefore we can't map (ioremap) the clock register
> > region because is already mapped by the reset module, therefore we
> > decided to use an external syscon to handle the clock and the reset
> > registers driver.
> >
> >  I highly appreciate your guidance on this topic.
>
> Linux deals with it easily, that's why we have regmaps. What's the
> problem exactly?
This is exactly what is done in the submitted clock driver.
>
> >
> > On Wed, 10 Jan 2024 at 22:59, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 08/01/2024 14:54, Tomer Maimon wrote:
> >>> A nuvoton,*-clk-rst node is present in nuvoton-common-npcm7xx.dtsi and
> >>> will be added to nuvoton-common-npcm8xx.dtsi. It is necessary for the
> >>> NPCM7xx and NPCM8xx clock and reset drivers, and may later be used to
> >>> retrieve SoC model and version information.
> >>>
> >>
> >> A nit, subject: drop second/last, redundant "bindings". The
> >> "dt-bindings" prefix is already stating that these are bindings.
> >> See also:
> >> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> >>
> >>> This patch adds a binding to describe this node.
> >>
> >> Please do not use "This commit/patch/change", but imperative mood. See
> >> longer explanation here:
> >> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> >>
> >>>
> >>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >>> ---
> >>
> >> How possibly could it be v22 if there is:
> >> 1. No changelog
> >> 2. No previous submissions
> >> ?
> > Should the dt-binding and dts patches be a part of the clock patch set
> > (this is why it's V22) or should I open a new patch set?
>
> You should explain what is happening here. That's why you have changelog
> for.
Will explain it better in the cover letter in the change log.
>
> >>
> >> NAK, it's something completely new without any explanation.
> >>
> >> Limited review follows.
> >>
> >>
> >>>  .../soc/nuvoton/nuvoton,npcm-clk-rst.yaml     | 40 +++++++++++++++++++
> >>>  1 file changed, 40 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-clk-rst.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-clk-rst.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-clk-rst.yaml
> >>> new file mode 100644
> >>> index 000000000000..dfec64a8eb26
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-clk-rst.yaml
> >>> @@ -0,0 +1,40 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-clk-rst.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Clock and reset registers block in Nuvoton SoCs
> >>
> >> This is vague. Any block? All blocks? Your SoC has only one block? I
> >> doubt, although possible.
> >>
> >> Anyway, clocks go to clock directory, not to soc! We've been here and
> >> you already received that feedback.
> > Since one region handles the reset and the clock registers shouldn't I
> > add the dt-binding to the SoC like the GCR and not to the clock
>
> No, soc is not a dumping ground..
Maybe I do not need to add dt binding document for the clock and reset
syscon but handle the registers as follows in the dtsi.

                sysctrl: system-controller@f0801000 {
                        compatible = "syscon", "simple-mfd";
                        reg = <0x0 0xf0801000 0x0 0x1000>;

                        rstc: reset-controller {
                                compatible = "nuvoton,npcm845-reset";
                                #reset-cells = <2>;
                                nuvoton,sysgcr = <&gcr>;
                        };

                        clk: clock-controller {
                                compatible = "nuvoton,npcm845-clk";
                                #clock-cells = <1>;
                                clocks = <&refclk>;
                                clock-names = "refclk";
                        };
                };

is it acceptable?
>
> > directory?
> > https://elixir.bootlin.com/linux/v6.7/source/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml
>
> Choose the main feature of the block - either clock controller or reset
> controller - and put it there.
>
> >>
> >>
> >>> +
> >>> +maintainers:
> >>> +  - Tomer Maimon <tmaimon77@gmail.com>
> >>> +
> >>> +description:
> >>> +  The clock and reset registers are a registers block in Nuvoton SoCs that
> >>> +  handle both reset and clock functionality.
> >>
> >> That's still vague. Say something useful.
> > Will describe more
> >>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - nuvoton,npcm750-clk-rst
> >>> +          - nuvoton,npcm845-clk-rst
> >>> +      - const: syscon
> >>> +      - const: simple-mfd
> >>
> >> No, it's not a syscon and not a simple-mfd. You just said it is clock
> > Yes, I understand the syscon node represents a register region
> > containing a set of miscellaneous registers, but as explain above it
> > is quite the case here.
>
> Nothing in this patch was telling this.
>
> > I will remove the simple-mfd.
> >> provider and reset controller. Thus missing clock cells and reset cells.
> > The reset cell and clock cell found at the clock and reset dt-binding,
> > is it enough?
>
> This is the reset and clock binding, isn't it? You called it (your title):
> "Clock and reset registers block in Nuvoton SoCs"
>
>
>
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
