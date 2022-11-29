Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF963C56F
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 17:45:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NM7Vm4HTHz3bVD
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 03:45:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JsSc9WVm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JsSc9WVm;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM7V72dkNz30hh
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 03:44:46 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id j4so22968382lfk.0
        for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QDjFWsc3ucw3ostvFNx34ed5EAV3FJBU5/wGZt6zl+k=;
        b=JsSc9WVmFjT9unOXNGX8hEhSmMEnajrb6Fn2ZjfjXkxwU7GrS7cPp+/fm/7/cIDpLH
         u6L6XQaK7MDqG1DednOXagnCiwe3x3Ajn+cAoLREfuDwYYu0rT7QcQgSA3iZgEaNRB0Y
         iAkcCTPzXyZ3DvQTznFXEE6lJ/WaCTV9YAu5Mr/DU5IfpGoNZndlwKdcKi24YMH4BzGC
         rBDN8CqeyIw52VU47n0upEs+gW4aFlWa6xDBzxdht838rzapg3ARjAPjsyuREa+XL4ah
         s3mAX3XIur9MuG9PxsGYEuouFDXnUj+NWKRJCTb39YxehdnOSwYbXm/pE9fv2ha6lHEV
         reCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDjFWsc3ucw3ostvFNx34ed5EAV3FJBU5/wGZt6zl+k=;
        b=oofgArEmdtdPKOE8ZERg433YCyucPTnW/Hb8zrPTrD5PNQa1m/2B2v8dy3AzgpPrzD
         cUwHwOmk8rMTOV+6oiDDNUJ3fMQsU0l762MHGjy0JdWtWgl9H0pc12zlgVGv9as6z39+
         OjPrJXiU241IgJdirRuW4WPV/zacp8TMhb7UAh1FviGnaB6/DCZPqn/kbbKF+JGTlR86
         ISy9v9SmUlRFnCTG7JDc0ponjUe+qeEQuQ1sRwq5ld3KilyHTyFZmfpynRFVwje32Bfs
         CL2Z5hWxA+TTZzEzKYETkfpLxBkQwc+h/SuQWj0yQU430WfAhA5btNhc0LgBG56joNag
         q5DQ==
X-Gm-Message-State: ANoB5pl/M8vfw+Y3adyVzqUKDqEpHcwGfskEfN41MMAOFethxq1/LJpk
	HRl98kyAB9yMsiP7E11Il7RmhKJyRri2U9r9/3U=
X-Google-Smtp-Source: AA0mqf4QtXRnfiyyYZOjf8Dt1CKWPHFPr+deEfd0mlEsGGtOXUksstAbNmDzprx2v1QZdaMOkGuJee454LsLiGKKvlM=
X-Received: by 2002:a19:4352:0:b0:4b5:1334:a1f8 with SMTP id
 m18-20020a194352000000b004b51334a1f8mr4072943lfj.401.1669740278843; Tue, 29
 Nov 2022 08:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20221122201232.107065-1-tmaimon77@gmail.com> <20221122201232.107065-2-tmaimon77@gmail.com>
 <cedc0013-f0c0-3180-6995-477b77b919f8@linaro.org> <CAP6Zq1iGwqOVOnhmF0ijYw=KoTRJj5CUpFv6WDouZmjVxXhQ-g@mail.gmail.com>
 <5c7a06bf-94e3-5c65-f202-105f74a41d29@linaro.org>
In-Reply-To: <5c7a06bf-94e3-5c65-f202-105f74a41d29@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 29 Nov 2022 18:44:27 +0200
Message-ID: <CAP6Zq1jdy-qDGFsk4sKcp3tx7d-nBMxOK72CRt3LLO8CrWJyKQ@mail.gmail.com>
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

hi Krzysztof,

Thanks for your comments.

On Thu, 24 Nov 2022 at 18:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/11/2022 16:38, Tomer Maimon wrote:
> > Hi Krzysztof,
> >
> > Thanks a lot for your comments.
> >
> > On Wed, 23 Nov 2022 at 12:03, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 22/11/2022 21:12, Tomer Maimon wrote:
> >>
> >> 1. Subject: drop second, redundant "documentation" (dt-bindings are
> >> documentation).
> > O.K.
> >>
> >> 2. Use subject prefixes matching the subsystem (git log --oneline -- ...).
> > this is what I did dt-binding: soc: nuvoton... do you mean dt-binding: nuvoton.
>
> You didn't run the command, did you?
I did run this command "git log --oneline
Documentation/devicetree/bindings/soc" and I got this log list
e47206d71e67 dt-binding: soc: nuvoton: Add NPCM BPC LPC documentation
121494030c53 dt-bindings: soc: add i.MX93 mediamix blk ctrl
4fed4d20c59b dt-bindings: soc: add i.MX93 SRC
c7ebd54158d3 dt-bindings: soc: imx: add i.MX8MP vpu blk ctrl
2345fc8dc2ec dt-bindings: soc: imx: add interconnect property for
i.MX8MM vpu blk ctrl
c1d9381ce430 dt-bindings: soc: imx: drop minItems for i.MX8MM vpu blk ctrl
f3894f969cf5 dt-bindings: soc: mediatek: Add display mutex support for MT6795
b2d7616e13c4 dt-bindings: soc: qcom: apr: add missing properties
301628d80501 ASoC: dt-bindings: qcom,q6adm: convert to dtschema
7b0ad4629d1f ASoC: dt-bindings: qcom,q6asm: convert to dtschema
b2496de1dfdd dt-bindings: soc: qcom: apr: correct service children

most of the subjects are similar to what I did, if it is not correct
please let me know exactly what to write (beside the word
documentation that I will remove)

>
> >>
> >>> Added device tree binding documentation for Nuvoton BMC NPCM BIOS Post
> >>> Code (BPC).
> >>>
>
>
> (...)
>
>
> >>
> >> No, only bus schemas could have it. Here additionalProperties: false.
> >>
> >> It seems there are already few LPC controllers and all are put in
> >> different places:
> >> Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> >> Documentation/devicetree/bindings/arm/hisilicon/low-pin-count.yaml
> >>
> >> Maybe Rob why this was made not really as two bindings - for bus
> >> controller and devices?
> > As mention above, next patch I will describe only the BPC device.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >
> > In general, I waiting for Arnd approval for adding the NPCM BPC driver to SoC.
> > After Arnd approval, I will send a new patch revision.
>
>
> To be clear - bindings must be accepted (Reviewed or Acked) before
> driver is.
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
