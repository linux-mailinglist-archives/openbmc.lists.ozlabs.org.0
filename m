Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B962D1E2
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 04:52:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCQx26hjJz3cQk
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 14:52:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pu2FcKNn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pu2FcKNn;
	dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBwQd6c9lz3bjk
	for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2022 18:58:15 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id o8so11425840qvw.5
        for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2022 23:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mgGyuenVtFXuCVHks+5NNuVlkc2b6o69ZD4m/QGfTIs=;
        b=pu2FcKNnKmYX8n8ReZH0BUxp8JnZXV8eos5dZGhtCG5CWtOBuPPD4F4nWNrYze0RR1
         6y7cMVsZPR2aVAbxBEYu37bOWJKK7bDZyoyPjcFhxubcPGAzoosnfKviwCxF/Yp5nByO
         PWMZIuqzLGPKKDkf5HCP6Qfep9jh4rpSiivrZM/B3LtEAxH2v21PwLMubC72O0CeIAwQ
         ITchSaF6Dt++GaIS/lHpqxvs9cOryvVxazw+rlgdwz/kaYWakTJBcsIWAvuBFetWDWwi
         P0bl4++dn6PY46ZevmrDf6w+wKLv8iy5qrfR+9EIBjCN0FRgWmNZClMN9NJV9nLicbCP
         auLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgGyuenVtFXuCVHks+5NNuVlkc2b6o69ZD4m/QGfTIs=;
        b=ol+b0KlwUu9iCPDiBvZevbbtu9Cy4Wm9Hqna8BIREjREd2XIUmob1BmKoA8T67peWJ
         kh7mNgpB2GEhUEuPXy+AZbV4uMOp6ro4zKj/f9bsKbtks3FOaxldq/nDB+trRM+9HX/v
         5qDdJJJtqCTH2x4qtV3wQGioDeesy1GmTZcjdWpgJXMCEK+uptoTGAFDSdMpslPHydmr
         3UVSJ2Ok+A9PpzhnprjiG0hzKz3Oj3YDw8R4znV+T/utNlgLY65ytgxKEpcCpbtFW3GO
         OzPEM42Q3rKF30vuIBHjhTK2yzL5Qrlbc5h3YaDTW7nGwlDILyo5HAjI83Hf36IMcFeP
         fvMA==
X-Gm-Message-State: ANoB5pn5zYZmCqiRfGMBjntsHCqOkQTZaKO1HrJlo3mL/TVIYNwr8hkL
	EoppXSOE1LZcfs/MQ302S4jO3iQx5xlWEkYq/FyhfLwlSYA=
X-Google-Smtp-Source: AA0mqf59/oE5htmWmVTO0J+J3GfnZeKnwkr103ntUrrNiEoJMv8reHdQpR1d8lcUI8ApFf7xkEp+4hpiffBVAiXP8rw=
X-Received: by 2002:a0c:ed34:0:b0:4bb:73a4:c1dc with SMTP id
 u20-20020a0ced34000000b004bb73a4c1dcmr20026016qvq.41.1668585491008; Tue, 15
 Nov 2022 23:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20221108092840.14945-1-JJLIU0@nuvoton.com> <20221108092840.14945-4-JJLIU0@nuvoton.com>
 <CACRpkdb+Bkwa8yCKGtRcsJ6KnJh+RUuz_gOrQV63pcYQLaHCaw@mail.gmail.com>
 <CAKUZ0+GCf_Zv=VhnY5Z=yYAfR1=_ha98BVVxRGVy8ui6so_Yrg@mail.gmail.com>
 <CACRpkdYW0P8gqtGdiRX_frP32WF2W=NVg1JTu1fVMBXxEL0-WA@mail.gmail.com>
 <CAKUZ0+Hy5suFg9VZ8-+cH7kGc5KLqUnf9hjnT+iaw+a1HF8x0A@mail.gmail.com>
 <CACRpkdYbS_syVwgc=YndkV-DpEF0K8NpH6WzP=g0AFpN+OTN8A@mail.gmail.com>
 <CAKUZ0+FD=x8s+vqUpYwsuRUw-yTHQjtTFzWDwW=d4k8X1x1LoQ@mail.gmail.com> <168ed6e6-21bf-f034-504e-6da36842f4bc@linaro.org>
In-Reply-To: <168ed6e6-21bf-f034-504e-6da36842f4bc@linaro.org>
From: Jim Liu <jim.t90615@gmail.com>
Date: Wed, 16 Nov 2022 15:57:59 +0800
Message-ID: <CAKUZ0+Hu4C9qfSZ+zw4eVtWpYF9pr5c6nBAWTt2ehmnf+-j5BA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: Add Nuvoton NPCM750 serial I/O
 expansion interface(SGPIO)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Nov 2022 14:52:26 +1100
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof

Thanks for your reply.

Our sgpio has 8  regs to control output and 8 regs to control input.
Each reg size is one byte.
and the sgpio interface has 4 pins(s_clk, d_out, d_in, LDSH).

The clock is generated by APB3, and one operation cycle includes input
and output
beginning the signal, the  LDSH is low and now will send output serial data ,
after finished output serial data the LDSH will be high and get serial
input data.

The in/out serial data size is byte * ports , and direct to update the regs.

> the driver will open the ports to use.
> ex: if  i set d_out=9   and d_in=20

The Soc is controlled by port, not by each bit.
So if users need 9 output pins, the driver needs to open two ports,
because each reg is one byte.
if users need 20 input pins ,the driver needs to open three ports.

The list has some rules for use, The first half is the output and the
second half is the input.
the example as below:
if i set d_out=8  d_in=8

root@buv-runbmc:~# gpioinfo 8
gpiochip8 - 16 lines:
        line   0:      unnamed       unused  output  active-high
        line   1:      unnamed       unused  output  active-high
        line   2:      unnamed       unused  output  active-high
        line   3:      unnamed       unused  output  active-high
        line   4:      unnamed       unused  output  active-high
        line   5:      unnamed       unused  output  active-high
        line   6:      unnamed       unused  output  active-high
        line   7:      unnamed       unused  output  active-high
        line   8:      unnamed       unused   input  active-high
        line   9:      unnamed       unused   input  active-high
        line  10:      unnamed       unused   input  active-high
        line  11:      unnamed       unused   input  active-high
        line  12:      unnamed       unused   input  active-high
        line  13:      unnamed       unused   input  active-high
        line  14:      unnamed       unused   input  active-high
        line  15:      unnamed       unused   input  active-high

the line0~line7 will map to output reg1 and line8~line15 will map to
input reg1 and so on.

and thanks again for your suggestions and information for dts naming.
So I need to modify it from sgpio1 to gpio8
am i correct?

Best regards,
Jim






On Tue, Nov 15, 2022 at 5:58 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/11/2022 10:21, Jim Liu wrote:
> > Hi Linus and Krzysztof
> >
> > Thanks for your understanding and your suggestion.
> > I will follow your suggestion to modify the yaml file.
> > -> nuvoton,input-ngpios = <...>
> > -> nuvoton,output-ngpios = <...>
> >
> > And I don't think the node name needs to use gpio.
> > because it's not a general gpio, so I reference aspeed dts and use sgpio.
> > Could I use the sgpio node name or could you provide some suggestions?
>
> Aspeed DTS has poor code readability (not following several common DT
> conventions), so using it as an example or argument is not correct
> approach. Nodes have name "gpio" for GPIO controllers or one of
> pinctrl.yaml for pin controllers.
>
> Best regards,
> Krzysztof
>
