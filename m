Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F0F54D7CC
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:07:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNltP0LgBz3f3R
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:07:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EakJTslO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EakJTslO;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJp405Jhpz3bmk
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 01:31:57 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id z7so31682096edm.13
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PeAB4WdUupDaLbzIqQrrnRA29amPQ8PYJd3E0QmEGsE=;
        b=EakJTslO6FLE81sHxNC1bk/UhJdyWwE3LaolAbYnM/XwG1uFz5Ko+NX7UNNu3tbcoN
         K4rcFigA5wVJgxMnlO7NLPQdS3C/ggA1Vn8OzBb8vvyKZFT1e8iQCHxDYA2eB8gQtft+
         7HzbxwQvQgZY6ae+bwehfzc7RnStB3PIBUZf7baw2dZU6u3EZKK9c5vh03InUK7PI/Xs
         PjArKEXUAAVAQfrkTYYW6QeCkqxbR+gH5Pemmw+ozW5iwl6YhpAMgD9p9LlKl6lrcgHH
         VT+W3GXIoaXr5Nc/REr/+pECZOjR0CqcLiiXkWlDSxBfAIMKAiL7Nj6L+FzleyxE5OcS
         rrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PeAB4WdUupDaLbzIqQrrnRA29amPQ8PYJd3E0QmEGsE=;
        b=rlcpaE1Aq4zpWmdx6LBkzDrEhQJ0m/YtLr98nocYPO34tZLfy56eUxNfOzZXuYTFa8
         7cNWo9p+KRulBYopuq5C1XWrxcITtnS25rqMCK75MLwVr/giy//lC4NBgQEsEduS44PQ
         45PZqEeZiAEo8Aad0kxIDt6BCjuFN/9hWlyoKDRFga4U7OJaWeRyqwGhpcxApfT9tsEF
         ERQJvpKUTNlRp/TSZhHCheMgtdHV1/01fl0GVKpkC5pisRWCNoWXX2FJgzCz8F/V5p4h
         WzHpljwfrf+PoSZZq9wHEZjy033wV7rcSsFp3caNnrEVHj3O/LdupgRRcaYEArqtvA4O
         9AIQ==
X-Gm-Message-State: AOAM530/+a/BQTTw0J+Hmqd3EEs0WE5w1xD62FiY7rUj2ApC/qlR+9OI
	UK4E0apDeQchm+jO6GOMmy0bgw==
X-Google-Smtp-Source: ABdhPJwOIiJjZlxWJ8Qllh5BIHfUY6pWFLHsCbCBYUYtWh67b6d6/Fy01aSRrec+f5WJFGHljJB2KQ==
X-Received: by 2002:a05:6402:2788:b0:431:3f86:1d4e with SMTP id b8-20020a056402278800b004313f861d4emr29911904ede.238.1654788714499;
        Thu, 09 Jun 2022 08:31:54 -0700 (PDT)
Received: from [192.168.0.199] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f27-20020a17090624db00b006f3ef214dcdsm10940096ejb.51.2022.06.09.08.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 08:31:53 -0700 (PDT)
Message-ID: <6d460a14-5da3-19f8-c614-307c2e737c17@linaro.org>
Date: Thu, 9 Jun 2022 17:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 04/48] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609113911.380368-3-krzysztof.kozlowski@linaro.org>
 <YqIP1vYuLztSQR+n@latitude>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YqIP1vYuLztSQR+n@latitude>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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
Cc: devicetree@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 09/06/2022 17:20, Jonathan Neuschäfer wrote:
> On Thu, Jun 09, 2022 at 01:39:06PM +0200, Krzysztof Kozlowski wrote:
>> gpio-keys schema requires keys to have more generic name.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
>> index 47a56b83a610..4c7691c38b10 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
>> @@ -152,7 +152,7 @@ examples:
>>        pinctrl-names = "default";
>>        pinctrl-0 = <&pinctrl_uid>, <&pinmux_uid>;
>>  
>> -      uid {
>> +      switch-uid {
> 
> In this example, and more importantly the original copy in
> nuvoton-wpcm450-supermicro-x9sci-ln4f.dts, I think button-uid fits
> slightly better, because it's a momentary push button. (Still arguably a
> switch, but not one that would stay in both the on and off position.)

Sure, I'll change it to button-uid.

Thanks!


Best regards,
Krzysztof
