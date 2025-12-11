Return-Path: <openbmc+bounces-1002-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6045FCB5A6F
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 12:33:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRr7Q0h7tz2xQr;
	Thu, 11 Dec 2025 22:33:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765452801;
	cv=none; b=I6QrVlJKkGg0oFpYGrUz7zT8DGBJ8insFF4Mz2dyN5qX+ZlHVMe8EgZ8ttkLiVpD0fgklru4Fzp51JXj+KLdhe474I4m/RoSUl93xI0QOfRTGYpP80K4DAK/DBmtI9+3fBKM8qLrhcRgSuH/siDeJ9osv2XQexxPu54Zqp823E+rfAcDPZAhZCqvQSD8BixqcsbG4iGCIikWk9xn0VQrkCb2bFdCwn9KjKSAfr3kj2cU4O1/Prg8XUV2HBPxZ32zp90sqWQ2YZ9YF1UQNke4t5MFZYii7IVHNCTpHxCRzvxn69xHvkY/X3YHdwpnBriD30zoiWSrSTKK6KwK6Omyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765452801; c=relaxed/relaxed;
	bh=vAvAduq0/fXRtJhO0coRhdPgTbJSI1bNLnmdQnPpfuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTJ9Pm8KyoBySPXXUi29DjNvRNLKfdfYzkzpbz1vMY8f3WWd4B6Y1AcV/ciML9mXWbvF2YX6x1nY9MCE2QfdtLDbYVd04OZW2yc8HXHQLEOkwxXniCqwy/THeYUdlMS4LPcgxFz2Bp85z1r7FP804aRTe8O+SPJEIKpibFjRnxDlwvOJlTnEiIPLP/9hXELVRKcHlqkdXi4z04u5CiSMXeY9b5SYIRlzdOORszfE0sqhrcZPtxtJCn8tQNLx1DL6eBsnXZiJbbpn6p1k2J6SsG6/cW878dA4T4Zg3MraFw0OiSivwaGHNuECD+eihoXZrLclmidoD6Fg1M7ZPECZqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZjaVSZBH; dkim-atps=neutral; spf=pass (client-ip=74.125.224.47; helo=mail-yx1-f47.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZjaVSZBH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=74.125.224.47; helo=mail-yx1-f47.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRr7N2pDhz2xNk
	for <openbmc@lists.ozlabs.org>; Thu, 11 Dec 2025 22:33:19 +1100 (AEDT)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64472ea7d18so760733d50.2
        for <openbmc@lists.ozlabs.org>; Thu, 11 Dec 2025 03:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765452735; x=1766057535; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vAvAduq0/fXRtJhO0coRhdPgTbJSI1bNLnmdQnPpfuY=;
        b=ZjaVSZBHkcf6qiit7EyoUMAUWUUVsK8VaqrL5RaqXGkB2epp4msMb8XqIPdgXIsdhF
         KCWxdfqvuBk0/cAbmi8i1pd5ofcPg5g9eUEvsnH0vjXATG1mW3s67eMhuihTW3EYf2Yw
         JBC/4YyDJclM9PlKvUtEn4rpWf/7F6qfqghfilkg6fwioriWMdq7auqm2K0MkIuh8gH9
         p0gDDN7s/YqPr4PD5vggIBVayvg+Suq15xg/AggDqG7S1OF3Al3YzzqqmE6Uu8fR1/yM
         Crd3crTvOZqVroXTo7yICKd9uWPp/00pd/c+468ZvD1gYV5+3mNoplfWRMXSm/VM1Lt1
         QwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765452735; x=1766057535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAvAduq0/fXRtJhO0coRhdPgTbJSI1bNLnmdQnPpfuY=;
        b=qki8w6CcH2t+JDKCx4jpv8bPMYag+HvGHtov4eNwtWbBRV8TK5FRKsEaWx9S6+ftXP
         pPkQeR2R3Sazs8gawdPUzO/SecoY+gNkWoV2L3EzBGXvo69AouQGjrQ+lgyr4phjcKID
         HkItZhaDKy1Fhm2g/KQlMouc0In13+okW9zRWYPrWIdNGd/DCUYE8QWYpK0+kknbOGtu
         Aw4irDwRf4YolidkotHtmidPRMg9Gp2dKlIGcPJ4N/It/xWLf9uXcNlkXSRc2mS/EiLQ
         hWF99MAGU724BQK3FprM14zIQFyiQzVWydUrxbHYgiP2pRlTRk+g/tdgDrAy5Xqkgx6r
         tc8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2NFJib0Lj2zUHWTi84MTC9zKc0Iw5K49vqew3gLxmWD1+/makcSeh2/oD3aAzw0i/hJddDReI@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywqb6G3FMiIS5MQeFhdAi1wMpEu0Iaaj9dxS/NLnCRS4pw5rTuq
	07XpgMFV0zX0PVIPW8pTk4lg7MtMxu3UctFaseFyx8/+uwmT0koQup1n4o1ICaDF4Jc9cnxGB92
	v23Nt5m+nUsmgIZ9S2crRj560p80O+6VuYodwhVBrlg==
X-Gm-Gg: AY/fxX6k2XMwidKrReg03QoZEY6pODCYE7fD06WthRUVCyvUgjM1UohNZOAfY7G7K3T
	/iAyio4SvsGcgIJ4a+kZLJQPU8KADPs0vosL2cLmz2bn7aMesuMrbhd7ri2vbuVZUKwYe+Tjz6C
	cpu8D5IP1XaEUu/aSMSaoBuWrTGDys23s8hn3KkWmP788cZm36m7kPCIN8/wk9tOHGj34l5bsu7
	tckyHmLDJCDtFvM8SZRLsU0Ritq93y9OZvKfgPGw60K9BkEj9n/TVdnMvchQs13rwqzcWc+51rY
	1BEMhp8=
X-Google-Smtp-Source: AGHT+IG8bNJ7GVmxCtKmkFoNf2sieoYkv2mgOPVq2xJndKf37hgXCewb4eZsd1D0ffqnRQUAE3M4kyCHgtlEMcMmN4I=
X-Received: by 2002:a05:690e:191b:b0:640:db57:8d95 with SMTP id
 956f58d0204a3-6446eb3aa4emr5006636d50.63.1765452735377; Thu, 11 Dec 2025
 03:32:15 -0800 (PST)
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
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Dec 2025 12:31:38 +0100
X-Gm-Features: AQt7F2pSIRmWc3gz3aUnvZCl6QhFMFW_pPE_bkwFhLy-FhbClf3aqE2_J1pJY4M
Message-ID: <CAPDyKFrbS_3XRTSuexFxTpP1ydgvfFvXNv_tninnTqum7+92ZA@mail.gmail.com>
Subject: Re: [PATCH RFC 06/16] dt-bindings: mmc: Switch ref to sdhci-common.yaml
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 11 Dec 2025 at 09:47, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Enable use of common SDHCI-related properties such as sdhci-caps-mask as
> found in the AST2600 EVB DTS.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Applied for fixes and by adding a stable-tag, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 9fce8cd7b0b6..d24950ccea95 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -41,7 +41,7 @@ properties:
>  patternProperties:
>    "^sdhci@[0-9a-f]+$":
>      type: object
> -    $ref: mmc-controller.yaml
> +    $ref: sdhci-common.yaml
>      unevaluatedProperties: false
>
>      properties:
>
> --
> 2.47.3
>
>

