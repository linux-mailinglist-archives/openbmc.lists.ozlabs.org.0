Return-Path: <openbmc+bounces-410-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6EAB155DB
	for <lists+openbmc@lfdr.de>; Wed, 30 Jul 2025 01:19:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsBBD4pyYz30WT;
	Wed, 30 Jul 2025 09:19:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753770071;
	cv=none; b=f6jAG69+ieV6MiJvZMihXJhutnVnZf5OnisU/7m2imxU+jL6UJ+ll4j1svbtz8363CrCl6LMdNpfvUHxa4SKayo+BE89X+LAaYKONHp0FpNfKp9DXp5WVTWD8KBc+hMIGGrH457bR1UZ7XzfbZVxPcsEX5fjKca5CfFy9GQbZRSWyaL41ftFYw1nERBssZBCNaRWZ56AimWsDCZpMN45y2XPsKE9LdvxKlAIs/7xJLY/kzn+5awh8lHYOuGuYBxjT4RUZtH1X6BKJQq69w5/l/Q+egHlzSuAwLnSEsjcbpVUVinF089mjiWkWn45f0Xt945wR+BELQ7Br36axh4fvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753770071; c=relaxed/relaxed;
	bh=ninIN9/GUpEjrJR47C5mY2otahpGMFvoZnUq9xsx+wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGok/d/F0v89mYgW+bEPEaHrmfI7dy9/72i7KZmh3WM6TPJxQpGF4HQPZfp0h53qVwrEnOnCsEnXwAJZksP+xYqtxmi19JBPuGaXl/uFT34bgeO18EcFpC07Skwy9ILD1gJsg8oHMw9WQfsWlsbP27Dt756C4olPhZ56b0H6wEYdQkG+Tm3zxeMfA5VN8bFzGwNCFNEd0s0jQRV9EnlKN5KhQhhOrnH+Tu9g7mRGdy7mpkEqhjjLoaWgfux0cw+fsM7X2RjjSpaeFtq4KB8xQB0182sRVp9r4BXH9A2Y9CKpX1hRuCLniUEme9dI7g/vKa1JUSepO5+b3dJRm7XM3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sq3kfPDf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sq3kfPDf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brlbS2JqTz2yrT
	for <openbmc@lists.ozlabs.org>; Tue, 29 Jul 2025 16:21:06 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b7889ea74cso157506f8f.1
        for <openbmc@lists.ozlabs.org>; Mon, 28 Jul 2025 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753770062; x=1754374862; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ninIN9/GUpEjrJR47C5mY2otahpGMFvoZnUq9xsx+wE=;
        b=sq3kfPDfFMAz6skMy5Gryh4V42mRKIBNddUABDC1sDbzEv6pIJuj3RSxxqG8cahas8
         NBh4Hv+v0PpwGobC4V1KCCtoMXvC6bJYSgTGHJDGe+YMMsfnFT0NhlhOlPwauJmnaUcF
         nHE0KGpMfsQW+Y49zsrcqV5+8gm1gBuN7UgSIjU/nxdTkdPlnXFM8pferf6iP99dF1Xz
         EnVNFuytdasn0l77OtGDHZs654SGCZ76sgSb4V/PAvxAI7U9zY1J95eAkOmA5RgcgYrt
         DhBT0XBMoUaQUMJMBnoZeQz3gvmJJy5KyxJuoV1Pnj/+mYprPuALkDipU/Ftgp1gT4sn
         o3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753770062; x=1754374862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ninIN9/GUpEjrJR47C5mY2otahpGMFvoZnUq9xsx+wE=;
        b=NaZiClCcmUb5DVg0C7ZWICv6YCKHCbzyljCxNJoGz16NSrPmUJkY438xp1T6uO8k9i
         wwO5Q3WrRYDfnq2unwiRw9j+laR5REmg65FPbv9IOefOyzWea9EVswPNZEA9fj2qhcc6
         mlNuXchIE81F4MEHp45BuU2LXphMKft6VEeDQDwFvwz9KpXX7m8N1c146OAUMlcjApky
         jHwq0IgkQ/RIWIZhoxhkMHY8s1yUmCAGUXvizijTDrh+OFesnKDhX5/z3PZUVzD4MfVc
         HH/CFRKZUq7s3sq6+3viWqDbCe/9uWzM4FIGIN8FYxsMr8VAteYc0mXXY9wF1bxFGvWq
         R6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUo9i/oMMn3PplYkLbh54FDWfnXyVIM7DqgxQ7PTeGBxGJWbkwoHxywDqeu5TZJBTUiKqKiQTai@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9JRuJvpKfYxjYXeAm1sozJwC6TV6tcUT3A6LPA7e0p7Bin39W
	+CZ9UzO08ExK6Yu8kduMxbG2SZDpKlQVanFc3F87IDxozhVcdKcLZXDoDj/qVFWX6z4=
X-Gm-Gg: ASbGnct+z1Yd9pts8iYNztfqhtCtpqaHdpYJqozCBQ2oMVNUuQFHHJlzhPyPNG+dbQg
	3ZB7Y/CTkHeAQVIcyj3Je19tHD1gt5a92mN0sVO0LoJGDLG3dB8xCU5IuXaKEFC+T5P5mVZxr0f
	816kMuar+kZKO//1Zm1gSaDt6TEb0X/JD6FYRDc2U96Ds+VSk+aOBS59ALwRyw9DHrKMeS055nE
	qrhRFqN87Pz4Nzo/8gpWmUX5qSInbkXT4eRUMUO0UT36LdANuep1AajVNzvXQUPHsx9V4uiWrOC
	tompv6jTz/o10eigGb2krf/xgVykR2Kel9/Ts9Vid4U/sgSXWRit+5JZ2S+PuGnzZ5LfASdCmam
	lVUvCaSLt4RPu4J+rb4Rw3tB0BTLYZxZQCnwBilAFnSg=
X-Google-Smtp-Source: AGHT+IEmKgcMvWIj0DsMoQ5/CtMwQTTbMBLGZBD8mnAWI3sb3Z5QkzBevaGkajMpCZ6Wol0R62Yn8A==
X-Received: by 2002:a05:600c:45cc:b0:455:fa91:3f9b with SMTP id 5b1f17b1804b1-458766a2e3cmr48395025e9.6.1753770062566;
        Mon, 28 Jul 2025 23:21:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705c4fdasm188933305e9.28.2025.07.28.23.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 23:21:01 -0700 (PDT)
Message-ID: <c661130c-3d18-4e6c-9c63-ac4c10c415de@linaro.org>
Date: Tue, 29 Jul 2025 08:21:00 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: nuvoton: npcm845-evb: Add peripheral
 nodes
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com,
 joel@jms.id.au, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250717135336.3974758-1-tmaimon77@gmail.com>
 <20250717135336.3974758-3-tmaimon77@gmail.com>
 <91119587-789e-485d-9cf1-da2c500f241c@linaro.org>
 <CAP6Zq1gN28y-6_OwnzMbJ+EiubtABVw+FUqbmAo5bvBW-5tDdw@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAP6Zq1gN28y-6_OwnzMbJ+EiubtABVw+FUqbmAo5bvBW-5tDdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 28/07/2025 14:12, Tomer Maimon wrote:
>>> +
>>> +     mdio0: mdio@0 {
>>
>> Huh... this should fail checks. It's not MMIO node, is it?
> No, it's MDIO node,
> https://elixir.bootlin.com/linux/v6.16-rc7/source/Documentation/devicetree/bindings/net/mdio-gpio.yaml#L48
> Should I modify the node name? If yes, which node name should I use?
>>
>>
>>> +             compatible = "virtual,mdio-gpio";
>>
>> where is the reg?
> It does not include reg in the mother node, but only in the child.

You put the unit address...

>>
>> Please confirm that you introduced no new dtbs_check W=1 warnings.

I need you to answer this.



Best regards,
Krzysztof

