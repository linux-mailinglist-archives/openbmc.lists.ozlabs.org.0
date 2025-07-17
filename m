Return-Path: <openbmc+bounces-379-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE56B09880
	for <lists+openbmc@lfdr.de>; Fri, 18 Jul 2025 01:46:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjqLb6Xghz3bmy;
	Fri, 18 Jul 2025 09:45:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762320;
	cv=none; b=FHSDp9+hb9TJW3mn+vbGiIbJLhyb297fpJhoqvxEIJGaKpJpbHUorjBvCE27wRJa4UZPMMy8mPTeSQar/y8F6TYiz1YnYMWYNNKYvglOKhMhG0258gEy+QG++Ldr3FGqPCbZo9lNC0sQ+cyryR622n77S6UvGpBVbzEuNrn8Ps1ASQx4bBnS2hHYqeZgJ0V4NpjbEis1CWACkBI6qnQKDtQh4It3+UD9bLW2JvuPY2YvHtFNb7eIemXrv55P2bUWjeK/4BndjpmjVTAYvsKWFxONzZDhkCO0txAKoYW8vz+r9AyMAaw6rHNQmVd/2TaCel5J+48Zj8PN7TJpPvpYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762320; c=relaxed/relaxed;
	bh=kcPKCx6U2j08wQqR+g9+65BeCrumHiVo5POjSnvFUqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBxz9ToIRVDcKNzKuESO89Wtz1Z+7x077ubY3vZUAlA0SEjYPjCSf7L5vgUdOPc+jSvhOEVbiivQOQEVe5wTGBlr1+Ox53tSGzIW8F2SaUFFIrPTbTanI6KHfn8Ic4bGhC7KofPeI6WnhfD+JMe+pibRGBTo4HaXuvnbDsfYGuqLNO8kv4jAQvufecLrXInEJVWcECQr1fY1mT+zhbRb/GuIu8ZNFWKmrmoC2hTRMFsE+SHgFCARLoTHPyC41PiDzid/M6U5zfUOhwqMT0UGWrOG5QqppuiIAQjeNOJfQM5ujy6slI9cK6Fd2IhjyVKFbNSO/9NyzgrXLPxTIvCsAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O4K5mEeA; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O4K5mEeA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZvg56j1z2yPd
	for <openbmc@lists.ozlabs.org>; Fri, 18 Jul 2025 00:25:19 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0b98ccc57so15731166b.0
        for <openbmc@lists.ozlabs.org>; Thu, 17 Jul 2025 07:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752762316; x=1753367116; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kcPKCx6U2j08wQqR+g9+65BeCrumHiVo5POjSnvFUqk=;
        b=O4K5mEeA+hmc4DI1qYm94R/pTUU7d6xXFbSrpUFcUwdMGiIJkb3Ult+WmvCoMA/QDb
         HvFAjYDR/JJ44XsaCYGeswZhQbiMKpuyqbNDq3fkzddH0EOVKbPveelOZob29r3g/gCz
         zH5duQCkZJsogBGztOLj+2RqTYLl70fgDlMVTNPd78pijWHrOfpB5sGXkG6L5rwywVar
         cMUw6umtzucS71KBJV3say5MfgkDInEICQdujpVh6rmDqMGV29p15jlwJstBGrr/lFGy
         4NwL3xt3bp6MWAozUH9eFXgnEfvPPNdq4GdCNEMNWDmcvCkuSmxS9UyqagaP0cQrhbrt
         1eDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762316; x=1753367116;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcPKCx6U2j08wQqR+g9+65BeCrumHiVo5POjSnvFUqk=;
        b=j/PmNq9r/dMSPN5HZyEVGl4vawDtIlOWj8qcoBZIYGXn5TVgRHJhKeDJPO1cjxjs8F
         jUIdev+4OdK7km3SzznEpPvgYnZgVfWcMv83nubSMixDzLYp3xy8iup58kNaDj0h60eu
         662mfnkJkNbQdtBQIPvAFKs/4dSgGaRoF7FZ6hQ40nMYOXkQ7Lj0ogCpfUpH5oFzLOSO
         +tT6FC6OqjTrEQyMmhP3WAekUs2mWwVIYwO447nvx2oAWoPH2eqi1JnzmhVtYUUAIACi
         MhRYi5otlduLrYmtm3e+SwstYJSA7t1vufEEcpdyhw6oTV5btCE2Fcz6eEp7i7bqt1yK
         PTJw==
X-Gm-Message-State: AOJu0YwJGg71MAP6XrTmi3OX9JSlybodtUHY9XYhxuNSDwlUb8gCx7Mc
	bkybfGFhGYA9TxhmHLr14tZvfWkgEgLmWxMg3UYqQob6hYDWYOpzFpPwaMG4DwcuFoc=
X-Gm-Gg: ASbGncuutgMj4+5jHwkC4BE+1cjzdjwx3YYF5VY5YF1EfyfoJpEcIguuBBv8/x6Tnsf
	M78sG4IiFXfs1Whjilox2UAzzXrh0iV4eP5fm2WsohicAWhPt8bWA16vgNpEqhAlS+cn10zkJOF
	ppxgURKPEIOQ2NoG0ms8jSrJ2FhHniNkn5KkX0ynMmrmbBippuLNLS+ZpMwxUNphHN7Pmjo31d5
	txu3fBoGERNHrw5I38DSE0ztwMZQaLKYrjEzB1LA5ZYPWCc/4QX3ii5UeQX2aUVG/n1diDgvAkD
	GNnMltWXvNcDmrnUKRECnot9E4IrI4uW/Qo8WyF7qzfLxeDRboJN/V8NxjbXSD/x+gbdLaJfgzu
	Ei1KjINBctcHqpYq2tWpyD6Bt+KeqmOMcJm8T6nd9bQ==
X-Google-Smtp-Source: AGHT+IGnEhjZd5PUWnDVX+u3kr6aYmJfzuYUVYEsPsiOM/eNdUns/gMU6r+tG+GvFgak91xowoPYvw==
X-Received: by 2002:a17:907:7255:b0:ad8:971a:dbbc with SMTP id a640c23a62f3a-ae9c9b0e226mr284827566b.11.1752762316502;
        Thu, 17 Jul 2025 07:25:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91cc0sm1349481066b.26.2025.07.17.07.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 07:25:15 -0700 (PDT)
Message-ID: <91119587-789e-485d-9cf1-da2c500f241c@linaro.org>
Date: Thu, 17 Jul 2025 16:25:14 +0200
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
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
 venture@google.com, yuenn@google.com, benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250717135336.3974758-1-tmaimon77@gmail.com>
 <20250717135336.3974758-3-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250717135336.3974758-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/07/2025 15:53, Tomer Maimon wrote:
> Enable peripheral support for the Nuvoton NPCM845 Evaluation Board by
> adding device nodes for Ethernet controllers, MMC controller, SPI
> controllers, USB device controllers, random number generator, ADC,
> PWM-FAN controller, I2C controllers, and PECI interface.
> Include MDIO nodes for Ethernet PHYs, reserved memory for TIP, and
> aliases for device access.
> This patch enhances functionality for NPCM845-EVB platform.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 445 ++++++++++++++++++
>  1 file changed, 445 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> index 2638ee1c3846..46d5bd1c2129 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> @@ -10,6 +10,42 @@ / {
>  
>  	aliases {
>  		serial0 = &serial0;
> +		ethernet1 = &gmac1;
> +		ethernet2 = &gmac2;
> +		ethernet3 = &gmac3;
> +		mdio-gpio0 = &mdio0;
> +		mdio-gpio1 = &mdio1;
> +		fiu0 = &fiu0;
> +		fiu1 = &fiu3;
> +		fiu2 = &fiux;
> +		fiu3 = &fiu1;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
> +		i2c8 = &i2c8;
> +		i2c9 = &i2c9;
> +		i2c10 = &i2c10;
> +		i2c11 = &i2c11;
> +		i2c12 = &i2c12;
> +		i2c13 = &i2c13;
> +		i2c14 = &i2c14;
> +		i2c15 = &i2c15;
> +		i2c16 = &i2c16;
> +		i2c17 = &i2c17;
> +		i2c18 = &i2c18;
> +		i2c19 = &i2c19;
> +		i2c20 = &i2c20;
> +		i2c21 = &i2c21;
> +		i2c22 = &i2c22;
> +		i2c23 = &i2c23;
> +		i2c24 = &i2c24;
> +		i2c25 = &i2c25;
> +		i2c26 = &i2c26;
>  	};
>  
>  	chosen {
> @@ -25,12 +61,421 @@ refclk: refclk-25mhz {
>  		clock-frequency = <25000000>;
>  		#clock-cells = <0>;
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		tip_reserved: tip@0 {
> +			reg = <0x0 0x0 0x0 0x6200000>;
> +		};
> +	};
> +
> +	mdio0: mdio@0 {

Huh... this should fail checks. It's not MMIO node, is it?


> +		compatible = "virtual,mdio-gpio";

where is the reg?

Please confirm that you introduced no new dtbs_check W=1 warnings.

> +		gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>,
> +			<&gpio1 26 GPIO_ACTIVE_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		phy0: ethernet-phy@1 {
> +		};
> +	};
> +

...

> +		reg = <0x05>;
> +		fan-tach-ch = /bits/ 8 <0x0A 0x0B>;
> +		cooling-levels = /bits/ 8 <127 255>;
> +	};
> +	fan@6 {
> +		reg = <0x06>;
> +		fan-tach-ch = /bits/ 8 <0x0C 0x0D>;
> +		cooling-levels = /bits/ 8 <127 255>;
> +	};
> +	fan@7 {
> +		reg = <0x07>;
> +		fan-tach-ch = /bits/ 8 <0x0E 0x0F>;
> +		cooling-levels = /bits/ 8 <127 255>;
> +	};
> +};
> +
> +&pspi {
> +	cs-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +	Flash@0 {

DTS coding style, naming...



Best regards,
Krzysztof

