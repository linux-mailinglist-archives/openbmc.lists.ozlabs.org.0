Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2D663D376
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 11:31:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMb9N3hjjz3bb6
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 21:31:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FRon3T2g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FRon3T2g;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMb8l6nCdz2y84
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 21:31:18 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id be13so26256301lfb.4
        for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 02:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv3Wp1f+QTDnSN5uykjtcq/j71xlTKfFkgX9bxQuGXc=;
        b=FRon3T2gVgOfoIGVXXk6Eres5nbKkb2IdBbrzgBFjsJNW4nD0SRIrwsjWFQ7AOX/sK
         cI6IPeg8l2hzOuHsXUzbkYiq2Kbvqxt89KzzrpdE53ab9AlVxsL/eMmcJUjf7JrimUir
         SSwWAdp/l7uVEqu0yDoKCgukZyx2SP/iJB/63Guv7Mt3f5W388hjRP9Ah1nzcYtQMPYm
         uQjWn7+q5VTQ3NG6Tw6NjWsbmxnKiNkUZLOE4EDsS83gN+V4ussGRVzOxslhFOwNi7QW
         Xad9318ZBrURj0IZews21eq/LDMAVJrT4uKSePY44qagIwXGbc8W+PZFJhSQXl4bnRG1
         hi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fv3Wp1f+QTDnSN5uykjtcq/j71xlTKfFkgX9bxQuGXc=;
        b=OJwecjl7bwH1BKtF+VfVq61lB2ddn6fvoycukx42dJ26zvEDwexXzurG0G+Q1eQT+D
         g5R2yYJa6uDxbaUF3FO5so128PBEL4RvP/MfM9OjtAwzC+i2GLPfQVt5Khv4fDFyS2uw
         /6ckZ1bJPL4g87PMbF3+3gU6qk2w4MKVZdhIgN3tzD7RTYudhMMABAAOWSs3eYIKG2Yz
         ZBCxrcQd/aFaT2uP+moPpxwfuWmTDJrgX3B2QSYNFtPqD9ZJiAOhGB9C0KWy6FxQEqSl
         9vy+80QbO8JJVOtKyzs5tRK4p0hUUaPle8ncbPtsfK1ihsJQZzgF0xlb8e68nNwmvLrd
         J4Eg==
X-Gm-Message-State: ANoB5pm4zDZQEva79i68YFWMFM9I62NO4iolaXDqGQQSOnbhTP6wHaH3
	EFvzCzE2Du4qBcJbAi4UKM+bKlXgO7ptPlrmb+A=
X-Google-Smtp-Source: AA0mqf6nHQyoRCEMLjI55WiSFRP0VDvbS2r/qwG4xRgS7G8nmlGVgO/ru9udgXyFtS/ASOMtB6DZl5ZOC8G5fnKjL20=
X-Received: by 2002:a19:4352:0:b0:4b5:1334:a1f8 with SMTP id
 m18-20020a194352000000b004b51334a1f8mr4992189lfj.401.1669804273470; Wed, 30
 Nov 2022 02:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20221122201232.107065-1-tmaimon77@gmail.com> <20221122201232.107065-2-tmaimon77@gmail.com>
 <cedc0013-f0c0-3180-6995-477b77b919f8@linaro.org> <CAP6Zq1iGwqOVOnhmF0ijYw=KoTRJj5CUpFv6WDouZmjVxXhQ-g@mail.gmail.com>
 <5c7a06bf-94e3-5c65-f202-105f74a41d29@linaro.org> <CAP6Zq1jdy-qDGFsk4sKcp3tx7d-nBMxOK72CRt3LLO8CrWJyKQ@mail.gmail.com>
 <7661de74-f68c-6617-6a4e-3b0eb76a2a2e@linaro.org>
In-Reply-To: <7661de74-f68c-6617-6a4e-3b0eb76a2a2e@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 30 Nov 2022 12:31:02 +0200
Message-ID: <CAP6Zq1jQ7r4N5bc2yS0kuQrFqBvDD3mXxaASc=KkVt-fjBELuw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: soc: nuvoton: Add NPCM BPC LPC documentation
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
Cc: hasegawa-hitomi@fujitsu.com, devicetree@vger.kernel.org, briannorris@chromium.org, benjaminfair@google.com, arnd@arndb.de, sven@svenpeter.dev, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, marcan@marcan.st, nicolas.ferre@microchip.com, tali.perry1@gmail.com, conor.dooley@microchip.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, heiko@sntech.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for your clarification

On Wed, 30 Nov 2022 at 10:27, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/11/2022 17:44, Tomer Maimon wrote:
> > hi Krzysztof,
> >
> > Thanks for your comments.
> >
> > On Thu, 24 Nov 2022 at 18:18, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 24/11/2022 16:38, Tomer Maimon wrote:
> >>> Hi Krzysztof,
> >>>
> >>> Thanks a lot for your comments.
> >>>
> >>> On Wed, 23 Nov 2022 at 12:03, Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 22/11/2022 21:12, Tomer Maimon wrote:
> >>>>
> >>>> 1. Subject: drop second, redundant "documentation" (dt-bindings are
> >>>> documentation).
> >>> O.K.
> >>>>
> >>>> 2. Use subject prefixes matching the subsystem (git log --oneline -- ...).
> >>> this is what I did dt-binding: soc: nuvoton... do you mean dt-binding: nuvoton.
> >>
> >> You didn't run the command, did you?
> > I did run this command "git log --oneline
> > Documentation/devicetree/bindings/soc" and I got this log list
> > e47206d71e67 dt-binding: soc: nuvoton: Add NPCM BPC LPC documentation
> > 121494030c53 dt-bindings: soc: add i.MX93 mediamix blk ctrl
> > 4fed4d20c59b dt-bindings: soc: add i.MX93 SRC
> > c7ebd54158d3 dt-bindings: soc: imx: add i.MX8MP vpu blk ctrl
> > 2345fc8dc2ec dt-bindings: soc: imx: add interconnect property for
> > i.MX8MM vpu blk ctrl
> > c1d9381ce430 dt-bindings: soc: imx: drop minItems for i.MX8MM vpu blk ctrl
> > f3894f969cf5 dt-bindings: soc: mediatek: Add display mutex support for MT6795
> > b2d7616e13c4 dt-bindings: soc: qcom: apr: add missing properties
> > 301628d80501 ASoC: dt-bindings: qcom,q6adm: convert to dtschema
> > 7b0ad4629d1f ASoC: dt-bindings: qcom,q6asm: convert to dtschema
> > b2496de1dfdd dt-bindings: soc: qcom: apr: correct service children
> >
> > most of the subjects are similar to what I did, if it is not correct
> > please let me know exactly what to write (beside the word
> > documentation that I will remove)
>
> None of them have "dt-binding", so fix that part.
>
> Best regards,
> Krzysztof
>
