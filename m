Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B455BC43
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 00:18:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX2Dl647Gz3c8k
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 08:18:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.54; helo=mail-io1-f54.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX2DV0k5zz3bgC
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 08:18:16 +1000 (AEST)
Received: by mail-io1-f54.google.com with SMTP id y18so11123624iof.2
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 15:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YibwpeFlLUAXldT3IcMtZUEv7yVm8RZ87dZAwMJufVw=;
        b=SQfdvJ1Nv8rIgIZ2ybeiAytssCuzTkUJ9DWqOu3WG9/2INIlOu2Mwot+wcVAH0eM48
         1O8P7J9UGhMOsIq/FoQl3ELUPEQnO1quOsN1QZmfMgBJd0XYJfxP6lgAmPopEP1Lnkhd
         3ZCoiRf1aUHhficxZCENtXzRuFAkMrmwT7j9QALZ6/JnT+c7jXm7Os9jHoYVXac/PImA
         z/cdqZQIP1zdOke2bV/eo3qZJJ44fPBnhzU0wLDrmsOff9lMQ569QowH7hgqdP8L4I2l
         hIEtfeJ6tYmTkExvSnFKpUdQnhWFAgT8sjn1bpxZAY4pEWqWTE1rle+8Ex99YJlEGNgf
         hlzw==
X-Gm-Message-State: AJIora+uWtWykqRAIjp3sLeZu85bIQovV+mmh5yHZ72TjAhDWWLdNwx2
	g5nx/NsvQcuYWhcL0xCWmw==
X-Google-Smtp-Source: AGRyM1v1uMcYY0sXxp0P098New6WbDFXGNit8XNV3ZEYVn08nGYcoSP532Tx60bnDX9w8a+/DBwomQ==
X-Received: by 2002:a05:6602:13c3:b0:672:6e5b:f91d with SMTP id o3-20020a05660213c300b006726e5bf91dmr7538403iov.68.1656368294681;
        Mon, 27 Jun 2022 15:18:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z18-20020a92bf12000000b002d11c598e12sm5052398ilh.61.2022.06.27.15.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 15:18:14 -0700 (PDT)
Received: (nullmailer pid 3065966 invoked by uid 1000);
	Mon, 27 Jun 2022 22:18:12 -0000
Date: Mon, 27 Jun 2022 16:18:12 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
Message-ID: <20220627221812.GA3065912-robh@kernel.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jun 2022 17:52:57 -0700, Krzysztof Kozlowski wrote:
> gpio-keys schema requires keys to have more generic name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v2:
> 1. Name it "button-uid"
> ---
>  .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
