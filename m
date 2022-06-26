Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A64DC55B8BA
	for <lists+openbmc@lfdr.de>; Mon, 27 Jun 2022 10:48:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWhGF4MFKz3c1g
	for <lists+openbmc@lfdr.de>; Mon, 27 Jun 2022 18:48:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J9tW/hh8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J9tW/hh8;
	dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LW6Xd4ns7z3bk0
	for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2022 20:29:03 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id sb34so13246976ejc.11
        for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2022 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UryUvcXWPpBXfvIflu4cxT9Q9H+kMYtJGeIQndtNQSc=;
        b=J9tW/hh8Vxxadht/p2/HAMoeJuD8BWvbcQU5buW1oPKBF4wwnwGo/ZM3n8OW6CQXuD
         5mjg0BBbRFeYvbBBswoKiH8Nbz81NRywcdfXpQYOxtZLI1dT8LzI4cFstgjEiZJhz8VM
         driBZpRUvCocFX4X+8w8SS5DlKb/V8wHXD+128Tu9R8bCYuJ8Z/BPKyw8gv//AwYV9/G
         PPhsFg1QKpoAYqdaJVlzvI0T3S9gfR4fwWSd5Us7/0luZ357gQTHlBtZFBOJ7J8YJ+Dr
         fL3wNWwKTak0D+5iZ9XIr1LkoaOR8IHORl3UPQy5QiDc4PoVTaMiT3IuhuLbBuZOnbvF
         6m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UryUvcXWPpBXfvIflu4cxT9Q9H+kMYtJGeIQndtNQSc=;
        b=ELR56dLGMrosXl3P2dXuvsI2rhGEM7AQVlRuldMABAwaom8pOtVbK+40904nneZc2r
         l2J/KN6l4BDmii/OdclRWVQOf0zxUYJaD1/hO/8R+1grjNiMCbmTQilR1sCPQRIM33Jh
         /fyXBpTHLlDRZfhh7zfCgTP7hj5M9PzchieNqQ4p9K5zKS64oyrQ5UqTO+ul14i6tYe7
         36ZQscMWGpChpqUDwkgIc0GFpN3cqWsFZCJdB6Lc2CErlzp4jxQDyrObXkLPEYqKvwow
         Ky0sXwgxNMLkS0fHzyH+cRyGeIkLriiH0/Tf4yyNpipeWtws6+er6G60rtDipwLA4tgO
         x0RQ==
X-Gm-Message-State: AJIora/nIBDVgNtXZdlbySHNWOukf1aCuKECygqUVC0dIfAj8uHHLZMP
	MixM6F+IngB8fanD2D7VMFq6dQ==
X-Google-Smtp-Source: AGRyM1sblJgmEXbxMeGf+RD2dHMi4zVazxPkN9rudj8RaT/bHUJavjCmx8LIYG68F1Q3UPK3+2Rsgg==
X-Received: by 2002:a17:906:7303:b0:722:f008:2970 with SMTP id di3-20020a170906730300b00722f0082970mr7234670ejc.491.1656239337624;
        Sun, 26 Jun 2022 03:28:57 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00705cd37fd5asm3637815eje.72.2022.06.26.03.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:28:57 -0700 (PDT)
Message-ID: <ec660b83-998e-3a53-ce17-8f7d9d8728cc@linaro.org>
Date: Sun, 26 Jun 2022 12:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
 <CACRpkdYVPeEtKKA9xdiSAP6oJrX5eAKoOVaLnrELTv_ZQOEMUw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdYVPeEtKKA9xdiSAP6oJrX5eAKoOVaLnrELTv_ZQOEMUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 27 Jun 2022 18:47:13 +1000
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
Cc: devicetree@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/06/2022 01:28, Linus Walleij wrote:
> On Thu, Jun 16, 2022 at 2:54 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> gpio-keys schema requires keys to have more generic name.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> OK, do you want me to apply this one patch to the pinctrl tree or
> will you collect a series?

I would prefer if you picked it up. I am not aware of any conflicts.

I am picking up only some left-overs and in general better if the
subsystem maintainer takes these.


Best regards,
Krzysztof
