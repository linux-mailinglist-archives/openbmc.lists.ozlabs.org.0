Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDEB7B9C95
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 12:46:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bue4tZFj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1St41lgdz3vlD
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 21:46:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bue4tZFj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1SsS1s5Mz3cgJ
	for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2023 21:46:18 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c2bcd25178so9909881fa.1
        for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2023 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696502774; x=1697107574; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tD4m0iMVb4bl/p6r/AX6bYY/PolPxwjEJ+dZDSZwBHQ=;
        b=bue4tZFj3ncscO6KJnznxBuERMjTIO3ap0xULdrw7SQ3NnlLpOOwQUczxuhW6qtM9+
         3gMI42JZv2oSYYySkEmlNAGHPvsp3A2qfFH2nnc0+Uq/i/F5vlwsDhZi/FjAOFy3Xa6y
         rBjO7boln68sKAoxo4DVZKr4hR7ymkGyR0nc2QD3J6dO+e/mt5uTiVifHMo7rpkKv4pE
         Rh0Sv2SAfPYe0u6Fek6FCjfvWEAEJNORFcBSBllenJdGs5ZLKxPZgs8MvyUw3cl4fAHL
         JI9O8rpX7UN8AB79Nx1J8YflrDp/WK/P6PlGTBMH92rT6Kjulo/pKO6YZhErbpnRdiYZ
         9LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696502774; x=1697107574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tD4m0iMVb4bl/p6r/AX6bYY/PolPxwjEJ+dZDSZwBHQ=;
        b=UNnmR5ZADQpCnbdUiKkP95r/+liJeiFsNL6KfO+iAYLkQEgMOoOf31WfWvBXdYHNwJ
         G/L0gnZhi6RzKjrVDqYMiLxYUb4t75SFrVQmMd+cknKw0mxg8SFL3FyPZoL0bAJI5k8L
         gUl4KmZ7uxPu4uCf0UWD3/V60f8qmnYiyCwMDYUB59qyVyUV0MpCwrz00sedS/2ESv7K
         RP0t91BgxugeN8uS+mcT2b5gm9wQ85Yf0HpsxFE+Hvd01KQ2OIOF+IxvvuWAHYY6SuML
         Ta7jB5lckcnU4l9eCDFwCi1AcsbRQXDisCny/ADrS/Fn8ru2tUqEAI6HHBy8hqwXh7rB
         x6Og==
X-Gm-Message-State: AOJu0YzyhUAUW73MnM7D4LR78L2rEFI8448fBhnD6eMLnzu9Rf5zkN2R
	CJK1GbdtRDFzXqB3RtsChsWO++xLguiyJP9+nMM=
X-Google-Smtp-Source: AGHT+IEStT65q1wnfYcU7aKZf01nOo1p1LQWPYHAgwHMmL8hEGmDyGD/+zh/g1iKp/Mz0aAqs1/CD+KqWZXYU8bZAMM=
X-Received: by 2002:a2e:9794:0:b0:2b9:e1dd:5756 with SMTP id
 y20-20020a2e9794000000b002b9e1dd5756mr4574929lji.45.1696502773682; Thu, 05
 Oct 2023 03:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231003110130.229711-1-tmaimon77@gmail.com> <20231003110130.229711-3-tmaimon77@gmail.com>
 <25e8c953-8bf1-4107-9531-263d68c41128@linaro.org>
In-Reply-To: <25e8c953-8bf1-4107-9531-263d68c41128@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 5 Oct 2023 13:46:02 +0300
Message-ID: <CAP6Zq1gwbYfE4xg0-TCC+Wfoo_1omdsWukupJqpZekMem0xeMA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: ci-hdrc-usb2: add npcm750 and
 npcm845 compatible
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
Cc: devicetree@vger.kernel.org, peng.fan@nxp.com, linux-usb@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, gregkh@linuxfoundation.org, peter.chen@kernel.org, xu.yang_2@nxp.com, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your comment

On Wed, 4 Oct 2023 at 11:03, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/10/2023 13:01, Tomer Maimon wrote:
> > Add a compatible string for Nuvoton BMC NPCM750 and Nuvoton BMC NPCM845.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > index 1394557517b1..a9e173432002 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > @@ -16,6 +16,8 @@ properties:
> >        - enum:
> >            - chipidea,usb2
> >            - lsi,zevio-usb
> > +          - nuvoton,npcm750-udc
> > +          - nuvoton,npcm845-udc
>
> Your driver clearly suggests these are compatible. If they are not, why
> commit msg does no explain anything here?
Do you mean to add nuvoton,npcmxxx-udc as described below to the end
of the compatible property?
      - items:
          - enum:
              - nuvoton,npcm845-udc
          - const: nuvoton,npcm750-udc
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
