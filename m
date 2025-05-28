Return-Path: <openbmc+bounces-78-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6711AC74F6
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:17:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Ng2lznz2yfv;
	Thu, 29 May 2025 10:16:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748436713;
	cv=none; b=iFMVHbkiROW1sNAROgU0/kX6xxgpW9WiYlJsibR/+iIVD+2OBj7+Pqlc0H1lAYvJnvB2iPFAuHSJanZo+8IdPaf1itEQMvphZhs26dWXTu0kabTtg7xZbakSo5V/T8THRyeUVtGDq0z3c/nV19BPDM2kOxv1YwNQH3Caj92/GJCg1ENkvAYaJYi6A2YCkgZHuS8XbS8DXiEHYhPsmtKIU3gz6Ia/P+n9bHRhvCkkmnSWRbgVZr4ThXSLda+TNxoW0ZJUAg6extwFN/QH6D/ODFHS11oL9QHVkuHnU1uQCbEBzllr7RCaBMF5CZbAann3PnJs37aSLdw5A2kDG8itGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748436713; c=relaxed/relaxed;
	bh=gtxFBVmEk7OdwaX8iO3/bw0IJ4UWR9xfEnW8+jRDwF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WjmaBDgMSKs9lMZwFJcyTs7H8ZXWd6H+dGoPEyiS6s/XCTodts6Giy8UqARojOaz9FRfMntL/o+QO9+1w3Gn/zky0imvuF1ZRmOPbtiABaR0KGnf9aCLwPVR5FnRyH8TG6JZrLiHEhckjaPdL+0mAO3yO8w1f89tgkYAjGCLSNAaW0qvQaQjeAQ6kvm8T7JpNTyHV2x7Lgjxmm4qKc8BKARMUW5V8dQw46+Vn+PneZ6A/TJeM/5gQcaP9OI/0nMnYnAeUfFWvBsZDMxxBrr2WgfPAN8t5TnLbvhr+eNYHlYDkv0cXsKkZ/O/zjeu0SZfjCqEguy1d1WBvS2+kXC/Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ihptwsbz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ihptwsbz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6qBx01Wpz2xgp
	for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 22:51:52 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so85780f8f.0
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748436708; x=1749041508; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gtxFBVmEk7OdwaX8iO3/bw0IJ4UWR9xfEnW8+jRDwF4=;
        b=IhptwsbzAHKhTIosfKs7/RhbmC7m25hYjTmkN8LcXoRqJ/uDFkUW1kaly5kxV+drQR
         2DEM9l0dh90pX96FFoklzQEFsHEzJbmKoNART423x6GMYL6M+QvS0l3Xnbr2FMYWXlTZ
         vh+vJetLdEplCHqNpxIrP7/D0SdbeWbCGmFbKRTuRgftvA8uzHUWXTj0zCommJkwMHE0
         EqwOX3BR1Ot6My04EtX3dY48iOYl2yX8MuNnrlH/zPLF06UqtG2RSS4TAq7dJ7LTrHC8
         gilRrnS3Kc0VU7FmR+gNAcvCOCbVN60stHpRzvPsuX9eOXlREqXx8AJ1k6etyxmebsRB
         f5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436708; x=1749041508;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtxFBVmEk7OdwaX8iO3/bw0IJ4UWR9xfEnW8+jRDwF4=;
        b=Y0DMcPIvUq+2Y+YZhREOXIOY5KSiLpom8DTmA3I8RioI9JX6vm92hJJpEcEiP/+ren
         xaKiFa0RqIwAtJP8kLPBUkAdgAocWTBymDOqfmr6tct+2qXS9yGDOSZ6QRJMz5FrUeRF
         qZq4JYvOLdqgt7/THtzah4bpK+78xs6/Fycjo95nh3U+stEgOI4ID1i6LeN5IqQKm72W
         WM39x+mK3c74muD3n69mPIU5h5ULZaTom73z2+xx1fleQ04vMznPZ8O91T9UpU9eRueI
         wFLjAeCpos2Gq5FnXVNPZU6yDATXmcZIX9e6br/UeYsl4jnSQFGd3dvLM4E/DegAhWuw
         y3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVeUO7y0daA/zIViop2IBwzorENmZaz8tHHGQPfUHNTYgqZEkzUkyPlqHjIM8BepgKYPQXGnpYU@lists.ozlabs.org
X-Gm-Message-State: AOJu0YywBbvUPPKrWrP54p9pmF9PZ56Zrpcnjm8CHI/65+NjBjJ5z2/+
	yhWztIkWtbCR8+T/M6puV8ydJsctbFwvLluJ8Q8alUnRwL64NIlGSoWCov4pswXsNSI=
X-Gm-Gg: ASbGnctj2WouqsUwtwX7lcEgMhADPzU6y60+Jif967EXlXMXiZ4sLhMGh/gj6E/fzfb
	oG3JX+PK2NukkNkWyfecsRvenPIFgM7xRLdzF3CEEg+KNKd1PKBTuFLkVB8iMjFAEPl3AZrufZm
	Fwz5Dwt9HA1z77Sm3m/L08SpT0LPoE60KDySwGGXOz0LqPLNYmnopCrsN9Sxie+PQ+KVrDH8v/d
	aOOgKcHmBfahQ5zbk71vECIgBsKNFlCQ1eOyQ+iXtIPhUWsu2BgWJjKCKf3TcJMPPRbq8nMp/qi
	Iq11mwTfs3agHVv906BowzkeVsicLAuNpNyo+LJ5HLiUJ3Z843DlVlgQrvalq7babfCu0aQ=
X-Google-Smtp-Source: AGHT+IHZRUnH5Rp4aCZ1f9KHXVlEFS+hqrw/ulDU4vW45oSOCS0VZWSjD+ROhW/0PEAj5L3PAac3+A==
X-Received: by 2002:a05:6000:4210:b0:3a4:e0e1:8dc8 with SMTP id ffacd0b85a97d-3a4e0e18ffamr1983903f8f.9.1748436707566;
        Wed, 28 May 2025 05:51:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac7e0c8sm1423525f8f.30.2025.05.28.05.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:51:46 -0700 (PDT)
Message-ID: <4a2a8504-310d-4b65-ba52-1854f461b604@linaro.org>
Date: Wed, 28 May 2025 14:51:43 +0200
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
Subject: Re: [PATCH 01/17] pinctrl: starfive: Allow compile testing on other
 platforms
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
 <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 28/05/2025 14:36, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> Always descent to drivers/pinctrl/starfive/ because limiting it with
>> SOC_STARFIVE is redundant since all of its Kconfig entries are already
> 
> ... since its Makefile doesn't build anything if no Starfive-specific
> pin control Kconfig options are enabled?

Yes, that's better. Thank you.

> 
>> have "depends on SOC_STARFIVE".  This allows compile testing on other
>> architectures with allyesconfig.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/pinctrl/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
>> index ac27e88677d14f1c697e0d0be9f295c746556f4d..dcede70b25660833a158c298d1269d6ecea9dd8b 100644
>> --- a/drivers/pinctrl/Makefile
>> +++ b/drivers/pinctrl/Makefile
>> @@ -82,7 +82,7 @@ obj-y                         += sophgo/
>>  obj-y                          += spacemit/
>>  obj-$(CONFIG_PINCTRL_SPEAR)    += spear/
>>  obj-y                          += sprd/
>> -obj-$(CONFIG_SOC_STARFIVE)     += starfive/
>> +obj-y                          += starfive/
>>  obj-$(CONFIG_PINCTRL_STM32)    += stm32/
>>  obj-y                          += sunplus/
>>  obj-$(CONFIG_PINCTRL_SUNXI)    += sunxi/
> 
> The actual change LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
Ack

Best regards,
Krzysztof

