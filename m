Return-Path: <openbmc+bounces-408-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5885B14E41
	for <lists+openbmc@lfdr.de>; Tue, 29 Jul 2025 15:16:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brwpz6gzBz2yrT;
	Tue, 29 Jul 2025 23:16:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753795003;
	cv=none; b=LyjE1cs6V27NKkotOQSVVhz4GDZznVOvUXR6o1YwOfhtqijdFRe2ykOXdTZCIUj3S8K/4Am9uh3rC1hS5XFKhGIy3XZEtZinHVjcqKQrXUHSBSGvAMtM7ixpk2+/1kFtlKKUCLSq0YjV6sCJ5dENwoCdIJhQB5UI4S3RzuTvbzF/TwYH1JA7+J+hjjDeRfenc7V09NgCcgCysmy10wWg1oVWc+swDUZa7k/HuHLFuaeFyvcNyL5VK2LT2dqBH3Jz/EdU9nhsJeiGdCJS34ZHARST6w6T5OXv41empxlwP1hTvCzaWw5nJ7Da/cs/UNMHHtNmsmaqYB6L6PINc+zhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753795003; c=relaxed/relaxed;
	bh=/lfTifbzeJtDBdptx2/mM5xq8Rur7Nj3CsrchIJIonA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3nNgVyP6e8ZU/97KIhEy/TeK1JgyfqBn8/lrLp1xKySDCgF4B63JP+uDrWG49IZjFlFunr74UFTlzO0iucinqsf1x4fxd6q4quCodm0AvBVllgmfnj2DEGZJQHezRLX+mQGs4r06sml3jV1CDUHpE6R+dii8klNGHZwypNGqZf1seO9tI4+WQ1kculf4nF46SOj4HQtTRqwtWf/6kRFPpDJy+0BiA6HioFM02oDKf9XQs3npfovfC8B8HuXfc52bz+4kX8/QjpyFxnx1Wd4n8SauJapYsLaUjWfJi4ORLsKtzg28dzzaHRSKlQAIZcIKEgn8Y1HshLRu374yinDYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aR5gnExp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aR5gnExp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brwpy2zrgz2xRt
	for <openbmc@lists.ozlabs.org>; Tue, 29 Jul 2025 23:16:41 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-71a2dab7acaso17060457b3.0
        for <openbmc@lists.ozlabs.org>; Tue, 29 Jul 2025 06:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753794998; x=1754399798; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/lfTifbzeJtDBdptx2/mM5xq8Rur7Nj3CsrchIJIonA=;
        b=aR5gnExpqJ5U8VrnP14+WdjkZjlfTl0uPlN0Fxmtc/K1dfz77ZGxJ3HIbUewsDJ5qU
         xex+YPyUYF6ynNC2p8coDQaReawvrFyQHjEa8BVgXriqypjxWM3/uc4hzzTUQN/ew4If
         SYI3vwWsdy95z5v3M/IirogZof5fV/fXOy7b+fSz9QoP+8+f4M64IJgX24UvQOD321bL
         RK37oWz3NsL+6J3yfzsTHq26tVHnWHDi6SRBwzL0AOJ+HPfDN7uKMdmDQIZK2mWGU6F3
         NIqlGh/ZklLmaYeQ3g58MaflayHfz3F2wb8XpJZYK45NQIPwni2OUoAD9q1NK8d6/d5X
         Xd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753794998; x=1754399798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lfTifbzeJtDBdptx2/mM5xq8Rur7Nj3CsrchIJIonA=;
        b=Lz1JolROYtYYvukRRdfwQ2MbZDgze9UUX3J3m86zs4pXGob2QlMpo0XwYWS7hMWPTG
         UAZCIiiaLUnaUur+ziX/VRywx89ZrjEvc3JlzBnHvpXzTVTvlu8/IusRZg7slF84k7lQ
         pdxSKh385/jIDUGFflA9o8Ot+VPFlqhdrBl5HYzE509+N0HuEt0TgpJsLZncqqIfx5MA
         w8UDL6/pv/sYtSBcLF75UbByQQI7lSMeRG2s7JmHqb2Sc8kVwCG8ckd8XGl2V/nHqX18
         evW5q1N/s+lHs1FwgUucXzp7lDq83DgE+XfHf7ejHryYU7K+MofFzXroaD6pXeFyf3UZ
         848A==
X-Forwarded-Encrypted: i=1; AJvYcCUGlqucsqil3bYWbR6DptwgULxrRGHxvEMQgbM8Xj38GqT3wruMbabQbj4oa+udD6qafPXsLz5f@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6lRZTm2Ir1wPH/M9GtpLtaHlVhRa6tg7Xdc4QmOqyXylgw0EP
	aCKY+X9YKEgMzoQxvKFJcuIgRY8py0nOAy/M+lc3acxFk26BmVK0DfWxUX4rbt4cPnQGX1D/Ycm
	rgZ0YPp6J3OJWjCm5ALHvdYKEQvLB2EU=
X-Gm-Gg: ASbGncvmCPNOguCmXHbTiOPkdMcoXb8VwJJ+LlGGxKSpoGtzsPHl4xzyZuqYFZE/XUS
	s/4yIIawadCRc11OwboaUkIOPhkUyqHUJc7nzez49SPUcB7QXsceQEC5NasX0UhbtwXrZC+GlD3
	TnvHzp0NQhyRcXLlCSifyaiYWibUqx3g6WR3F1DlRJGLMgnCzQsA0MwRo7qNF1CIjzmHUJpCL7X
	Bx9O+SX
X-Google-Smtp-Source: AGHT+IEVae635NG5Lnt4HLDioDmt7SEj8cMo8l/+8dWgrcypmmqoDPY8G7XnLkcZ+fTaIcEF50pQVxzPBwWh8wy3V2o=
X-Received: by 2002:a05:690c:f87:b0:71a:18fb:7386 with SMTP id
 00721157ae682-71a18fb79admr125380267b3.2.1753794998174; Tue, 29 Jul 2025
 06:16:38 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250717135336.3974758-1-tmaimon77@gmail.com> <20250717135336.3974758-3-tmaimon77@gmail.com>
 <91119587-789e-485d-9cf1-da2c500f241c@linaro.org> <CAP6Zq1gN28y-6_OwnzMbJ+EiubtABVw+FUqbmAo5bvBW-5tDdw@mail.gmail.com>
 <c661130c-3d18-4e6c-9c63-ac4c10c415de@linaro.org>
In-Reply-To: <c661130c-3d18-4e6c-9c63-ac4c10c415de@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 29 Jul 2025 16:16:27 +0300
X-Gm-Features: Ac12FXxH-ZuZJCzUxfuM_gJnXAtYQn_WVuODI9WBIPAGyW5P6swnPSsLiOyEMH8
Message-ID: <CAP6Zq1jxysc+Uy0U_2dczyLDb5mwKBEafaJJ9+ouJMfipjBoYw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Krzysztof

On Tue, 29 Jul 2025 at 09:21, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/07/2025 14:12, Tomer Maimon wrote:
> >>> +
> >>> +     mdio0: mdio@0 {
> >>
> >> Huh... this should fail checks. It's not MMIO node, is it?
> > No, it's MDIO node,
> > https://elixir.bootlin.com/linux/v6.16-rc7/source/Documentation/devicetree/bindings/net/mdio-gpio.yaml#L48
> > Should I modify the node name? If yes, which node name should I use?
> >>
> >>
> >>> +             compatible = "virtual,mdio-gpio";
> >>
> >> where is the reg?
> > It does not include reg in the mother node, but only in the child.
>
> You put the unit address...
OK
>
> >>
> >> Please confirm that you introduced no new dtbs_check W=1 warnings.
>
> I need you to answer this.
I didn't run dtbs_check with W=1 and the mdio-gpio document. I will
make sure to run dtbs_check W=1 before submitting the next version
>
>
>
> Best regards,
> Krzysztof

Best regards,

Tomer

