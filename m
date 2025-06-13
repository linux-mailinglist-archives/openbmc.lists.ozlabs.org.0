Return-Path: <openbmc+bounces-215-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D231AD9927
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:42:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB35z3Mz30VV;
	Sat, 14 Jun 2025 10:41:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749806076;
	cv=none; b=XUyCMB6RE2WvuoXU00KA4Qcegpa2DTx3KMr6QhWxvYllR3gpEOTgB4EzZVi0fFrMLiFghitMzrivZ9Zp90mMTSe4IYtA1s8LEJjxIp1CJiaGXl6VKcJXWcg6L3hxSon7x6BeUulX//Rt6okqY2A7hJCroWhHVlHgUjzvetKBBQlSBLq1HQaY1jLxAU9zboFa/gL0pXz03nVPIY0mpVxWSXcJgjvUNW0Xvl4B8Sp1tTB6KYvRwSTLOdusFRUSKWl1T1F3tN1wkYMtrVMI2jxoz9x0YIDDCTXlP18DnPRpVtYRd+62SxIfRAr43Zg0RpQF4XQ40N2oLDBO99m2TKuuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749806076; c=relaxed/relaxed;
	bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YcTWRe9WvZpXf6s587RhOL1gJnlAaWtuu6SfP/M74MdjQuAD/xJ8Tyib5+EzVR8wPSNKSNlPeSnqm/pqeEkxqSz6GAEohIE0Ce4o9K3W+CKyYrRJfHEgAwuGCfKK6qxp1ENksF/7lGREOiWa9UkECyE5L37y96LM2ImebwNOP9EnLL6DbDB6N9D1juSwRTlteykKWpKIRJ0k0KWXZUlSnwq/zR9on5j0lrjmnuymHOmTIOstBIDhA3EF3xutMekcimJtZ4XKzL11y6qWWSSt124iOGTItHiNrENP0tAG7Fme9s11rkK7P9BglgvCnT6TIwSUjDXvB+D4RClx9sPn6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yx85df/9; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yx85df/9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJYcp1MyDz30MZ
	for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 19:14:33 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1217851f8f.2
        for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806068; x=1750410868; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=;
        b=yx85df/929c9boTqn0hvEnn9ClMPOgPjLRDHSEWyrKmWP8tZKeeRPh87ztHWNlcEuh
         QOrRDTbbS4C2k/9IF8fCBcj7aRzML/hFW0lOEe5OsQJZ9YrnshW+tO5QzINBPXh1u/Mn
         wL2oAJTSk/nWaNUlf7wLx5bCzDKjrQs7rDlbFicWpthHozl20rxRMjQEwNbj4MeBWWkt
         coe0fFd2j3mn/8UB1FDv5q5sp0TaGCpAe7L5c5yBbAhLlCpL0elwnKD/Junuvq8d6iEj
         bDCDf5o3Kmy04Fljo4Kl/Ri/peIlZ1rAzkFZeyHOog5JvvkVovf0clNNr/BUjzg6KhbC
         /bNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806068; x=1750410868;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=;
        b=khhC3SkaD8HLq4T6MaQSbJIHfqiwsU5fY9FSVkXKgOwsvpieaZfJdvW8SElEH5A8Q3
         dfCcbkEncEBZbueFq/WwcNBDi4knxT1O/YjU4VqYK1fSeLukZ7/AJodzPWg/GIcFtNRv
         QXOtB6tR1bw7yS/xJ5l9hGXQMvk9jLtizBzRP95kMcBzPltFdh5JdEKOepHAL0wxNcNc
         SKfQgjD0/uh+ufhGuZoG6qPePOl7zM2Vp6G2PxOEJ/k1WMgwiFWwPOVNFmfpHdSotI24
         NJw2t3VskEF8qyBUDDoG8RZSLxs4ZnkcQLSM9lm+JWTT9pchxmbnAzfFBMcSp+EqjM1z
         5/RA==
X-Forwarded-Encrypted: i=1; AJvYcCU2QArvA5U36E5LtD+6nsPzov4tx0xXQHhb6k8XMYyjCZi8Vg9l98ly0m1EIlExCXwcAbHGEj0J@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJtJ8yMxyubYltOSSPkeaOpizzwe34wKANDzop7Y72F3VvUbyy
	k85gdFKHSNqgx5jRfwo/EVeqIrFqNutmMvj8JoKrWpw1HEqk2nunKRmZys6Dyr/GIus=
X-Gm-Gg: ASbGncskAWyWXW3vd4Thq1GfTCvaqs6UCH+DKGCXL0Tf5hnRf3C/VTrU25mtb5S2mT4
	SMvp83guRh7SaUjKs//r+T9OEPB+gJNrRBUBQgiwbbPquBKdbCMQ1BZrpyI8fXUUf04kYpPdLL/
	59KzDy+OEBiVYD55IafwXeRxRk3B7ggewrH3X4yBwr0yqCFMobjnalH6ZMGK5figf5Zc3aT1hef
	1IKo0trWfCaU9FU6595I+H0ytMwVZRRxna3D0LbKfhR3j3wN+Ms5WWFh9aM3+sqWgd//Ew8GcLy
	kAA1jzG1EarSMUVzqHuyS7vAwHl3UB38IM1nBrxZ5it7vOCidv/OztxgHeyPkUYu49bD02wJKbl
	RQR1I13VaLvtroPe8CUzaSxmmKXJgBbM6h+yHOoY=
X-Google-Smtp-Source: AGHT+IGQOFD/EY7S2QDUIKx6X5WFj8qb8/qrnjFsfEXjcL1hzrA6uPRMdM2o+qwKrI1AezZg1EjOrA==
X-Received: by 2002:a05:6000:1445:b0:3a5:52cc:346e with SMTP id ffacd0b85a97d-3a568655fe0mr1850481f8f.6.1749806068043;
        Fri, 13 Jun 2025 02:14:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a36sm1781165f8f.15.2025.06.13.02.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:14:27 -0700 (PDT)
Message-ID: <5d624bce-a46f-4b75-b785-56def0c7f108@linaro.org>
Date: Fri, 13 Jun 2025 11:14:26 +0200
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: phy: Add document for ASPEED PCIe PHY
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, vkoul@kernel.org, kishon@kernel.org,
 linus.walleij@linaro.org, p.zabel@pengutronix.de,
 linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Cc: elbadrym@google.com, romlem@google.com, anhphan@google.com,
 wak@google.com, yuxiaozhang@google.com, BMC-SW@aspeedtech.com
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13/06/2025 05:29, Jacky Chou wrote:
> Add device tree binding YAML documentation for the ASPEED PCIe PHY.
> This schema describes the required properties for the PCIe PHY node,
> including compatible strings and register space, and provides an
> example for reference.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>   .../bindings/phy/aspeed-pcie-phy.yaml         | 38 +++++++++++++++++++
>   MAINTAINERS                                   | 10 +++++
>   2 files changed, 48 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
> 

<snip>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5a650812c16..68115443607d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3696,6 +3696,16 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>   F:	drivers/media/platform/aspeed/
>   
> +ASPEED PCIE CONTROLLER DRIVER
> +M:	Jacky Chou <jacky_chou@aspeedtech.com>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +L:	linux-pci@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
> +F:	Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> +F:	Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
> +F:	drivers/pci/controller/pcie-aspeed.c
> +
>   ASUS EC HARDWARE MONITOR DRIVER
>   M:	Eugene Shalygin <eugene.shalygin@gmail.com>
>   L:	linux-hwmon@vger.kernel.org

Please move the MAINTAINERS change in a separate patch.

Thanks,
Neil

