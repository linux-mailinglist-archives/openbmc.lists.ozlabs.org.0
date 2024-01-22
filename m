Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B9836D39
	for <lists+openbmc@lfdr.de>; Mon, 22 Jan 2024 18:26:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E2GNM8eb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJcbM5PD4z3btn
	for <lists+openbmc@lfdr.de>; Tue, 23 Jan 2024 04:26:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E2GNM8eb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJcZp614sz3bjK
	for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2024 04:26:26 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dc25da95c96so2353415276.0
        for <openbmc@lists.ozlabs.org>; Mon, 22 Jan 2024 09:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705944384; x=1706549184; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TLhmakZVx7P/y+xJl0pVM/baovZzW+u/LUkkxQgBmHI=;
        b=E2GNM8ebAMEwF0TelunEmZOv9bq1JColfySLzbyHH+X01eP2AqgHYZYQn8mXnKNWW7
         9L0Zs/cgNISdYzsRzZLa++UwC2BvxYciFI0CHg65490p6TRGgEvc6Pvkp6WovCIDx0Ek
         vDWbA+k5f2iiX9+y6UQx7aPeOdkp+FGzw/WBzWLHbfPRsWsLB252fUVudibbsCal16Zh
         bSfjyNvC0TVVlFt0llC1aTWamo1thIA0QbOXJr5pyf3Ny40WaVatGecIrSpJeGKgdMxC
         8jXYq4LeWKNUizyqfi3Phq+sySraa6WKSg4DyT7doicq8rBY025i0T8UMW6qnpqxX+4L
         yM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944384; x=1706549184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLhmakZVx7P/y+xJl0pVM/baovZzW+u/LUkkxQgBmHI=;
        b=G2Up2RXb8XL9kSzkxzj6U+2xaleFAKOJvD1GfbGHtP7Vw6E7f466fz72j77mRY5ifJ
         qvWq3chKaT5wGCUrfFGl5j+lPWXE6+CI8D9yv7bqU2ZR4Qmc7W/uzTJSDYNlsr8Tye1l
         7w2vk/EO7bVUOs+AhJNdU4GlShS+UE4VCow9wz4VqQDnBiysYGVlbJdUNIMv4xWAY8k0
         FzdWkANSnkOXRhlBUKl7IQnBISsOjTY66Wp20xgSZ9oZ7opM5MLRz5HFQH4XAsmIMyiM
         lBoq9vgWe2u7MCb9FOG+8cjM6NV4KMqBBMtQ6JR5BG3x3vzgRxlz5kEoXEL4QJe3MGt1
         LWiw==
X-Gm-Message-State: AOJu0YwiNBOtqAxlNKqc53ir0F2TFvb/3KRXn1f/RfAkHl/zlTg43YSJ
	37ok+xFclmIL9JeqIKR77VQx+g8tNWaNkvnsJYpWzCxfflwGJxvHLcVez/Hhlp1jTe65SL+VPko
	ap0feqzkA7ebHUyHmEfkrK3Kffg8=
X-Google-Smtp-Source: AGHT+IGlkwiyiVqqnE5ObJjEoOKvtdd41NNwjfTkam4z85lvQtQ1t00ake2EBs3cpPEEWIqpmhcM2ZqpuRipoAA5iI0=
X-Received: by 2002:a25:8211:0:b0:dc2:36b1:7586 with SMTP id
 q17-20020a258211000000b00dc236b17586mr2974030ybk.9.1705944383702; Mon, 22 Jan
 2024 09:26:23 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-7-tmaimon77@gmail.com>
 <171300da-3d49-4e1f-8969-9a454ecdd698@linaro.org> <CAP6Zq1hifi7CY=tYaDY_o82AXhbS5P9=MZBb-bqmvNCLZk3O2g@mail.gmail.com>
 <018fc173-edf3-4490-8f29-4059bd17268e@linaro.org>
In-Reply-To: <018fc173-edf3-4490-8f29-4059bd17268e@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 22 Jan 2024 19:26:12 +0200
Message-ID: <CAP6Zq1jQ9T4Q+WvwyAH4sKLK1+Mp0utcA_STgm=_Z3ywKoLoCw@mail.gmail.com>
Subject: Re: [PATCH v22 6/8] dt-bindings: clock: npcm845: replace reg with
 syscon property
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

On Tue, 16 Jan 2024 at 22:40, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/01/2024 20:37, Tomer Maimon wrote:
> > Hi Krzysztof,
> >
> > As explained in my [PATCH v22 4/8] dt-bindings: soc: nuvoton: add
> > binding for clock and reset registers mail.
> >
> > In the NPCM8XX SoC, the reset and the clock register modules are
> > scrambled in the same memory register region.
> > The NPCM8XX Clock driver is still in the upstream process (for a long
> > time) but the NPCM8XX reset driver is already upstreamed.
>
> First of all, the drivers itself don't matter here, we talk about
> bindings. I assume though they were going together, so that's why you
> mentioned driver... but just to clarify: we talk here only about drivers.
>
> If reset bindings were accepted, then why they aren't referenced?
>
> If clock bindings were not accepted, then what is this patch and this
> file about?
>
> >
> > On Wed, 10 Jan 2024 at 22:59, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 08/01/2024 14:54, Tomer Maimon wrote:
> >>> Replace reg with syscon property since the clock registers handle the
> >>> reset registers as well.
> >>>
> >>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >>> ---
> >>>  .../bindings/clock/nuvoton,npcm845-clk.yaml   | 22 +++++++++----------
> >>>  1 file changed, 10 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> >>> index 0b642bfce292..c6bf05c163b4 100644
> >>> --- a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> >>> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> >>> @@ -18,8 +18,9 @@ properties:
> >>>      enum:
> >>>        - nuvoton,npcm845-clk
> >>>
> >>> -  reg:
> >>> -    maxItems: 1
> >>> +  nuvoton,sysclk:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description: phandle to access clock registers.
> >>
> >> NAK. Not explained, not justified, not reasonable, breaking ABI.
> > Should I explain more in the commit message or/and the nuvoton,sysclk property?
>
> Let's try to explain here first. I really do not understand why do you
> change this binding. Your device did not change, so your binding should
> not. Now, if you say "but I changed drivers", then it does not matter.
> Bindings do not change because you did something in the drivers, in
> general. At least they should not.
The confusion here is because the clock binding was upstreamed but the
clock driver has not upstreamed yet.
The clock driver will use regmap and ioremap so reg property is not
needed, should I remove it? or leave it?
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
