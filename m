Return-Path: <openbmc+bounces-212-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B087AAD9922
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB26t0gz30KY;
	Sat, 14 Jun 2025 10:41:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749806303;
	cv=none; b=fEcD3h0Y3TCS5aRuuLmjVgovl48v5Z+c3IV3v5l8KE/cdJq74gIglEMqPqBSOdFYV2lHpXET1RPFkSHJL1OEJqj7DXVShvBScn/qz8aCI4/ci6xX1FgAsPIlCwogO31IkVFnxrwcJFubSQKYjCbzXWrKXqnozMra9v/aItyssRMIo+q3f83r6kTvZTQWgPBjPKvYrPm2SzwcdrqBevkqmJ4i0sIf/ion4+a7lPUy8GfyENAc7rQ+09W6CBm9lPwvGMTkqojs3YL/bGO9ss3ax0Q+5ADKlasrjunXBSKKJCWHNRt9KlMC+psGMJCFRVX7c9ftaRWtQhVhUL20JokwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749806303; c=relaxed/relaxed;
	bh=EZezB8dUdKZQC1klqpxG0ZCPkOkCrr9wOd6SwONA76E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=N81znZnq045m/DumI+ibJ8UGc7EKaTweXK+NJ13tzTmPFCLlMezrbsCF3RYG/csL2Mfy+F8CGKmCuP9z0d94ENPr0a9B7Qnx16wIaXjnRiWtYz0hyia0cySTscfn3NCPP5RgVIr66aAkXJJdp6W5fClrDoEQPPPnHciGogKm9mHtDwABLBkuzoduL7iuf2jFVUKtlMpu7TEDjXNx0bYd2cAiKLij8xJPq0BNOb9GvJ8GgdmnBK4x8ojAkC2TNkhN3tJXGeQH8eauvkXGaON89xdbZwVfPTj48r29+XIQVSlCGh0WoEP36SndCvM2Yqxfusl6PRpUBo/xqGZZUwQDHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Faa+TSo4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Faa+TSo4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJYjB1PhXz30PF
	for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 19:18:21 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso6553045e9.3
        for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806299; x=1750411099; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZezB8dUdKZQC1klqpxG0ZCPkOkCrr9wOd6SwONA76E=;
        b=Faa+TSo47vYIAarhvYuwRSR4eFWZYfVB9RliKJirNKPVAM5RnA8QVcMb7eMNx039ip
         5VR/Y2gVYZLVrzexwgpGZLnE/gSF0UX3Mnz093XDRR15XGZ0JuUFxAy+ZjaUtHinUVpn
         qJldyvHJNmC9lzmNfp2okVUjBra8HFGRvIxKODN7xc4RnVQ4p+UwcQqrTYCWjB2MYbeY
         UagxE9qTbxYyCDVgVTnJSiUk8UkJmxj6Rml/O5MqMAu6DRVsrBH6uvDcYpp1t4j4QDbv
         PbI+n4s/HbFAbM9E4rnyohQjO+/K/d6milNkew2bhNt7nciZaVJKLIxyB8Ya7HT5Jtm/
         HZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806299; x=1750411099;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EZezB8dUdKZQC1klqpxG0ZCPkOkCrr9wOd6SwONA76E=;
        b=QJRhKt6w2pAGuPzgvYRo3ruV3YppuwhllzcyYwJ6/8bR96rm6S6J242KUxIuK01vsN
         KW+Ug09ztUMc3FHMVmCdx3kZizsfR6tgQo7U9VgxoTZmjmei6AEPPsIUgTCjAmdkXuar
         wuVv6uigRkXOpLyCdnacXYDFm4Q9TYX6vbjSfjup+EImbDxdLo6IonhL0dZmyXaFQUME
         S30bE9jHv+YfG6zfePwGMiwlpWOCSaOWBtcgJ/u6ybyDkcEgiTjAWD1sJR3KlUIi/L0j
         WMspPuMJ2BjlTGm1i3jy7ptYrkOJ3rbVmkp2XZ347iIBWx2FVPMjw2vvIGNvlg03YYnw
         E80A==
X-Forwarded-Encrypted: i=1; AJvYcCVXDyamz6kNbhM0WcaYT2lQJNFx4humdC7fWRD3AMOY67LmIuHawPnGNS9W68s/PLgG1sHZd5bt@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6P9oriftQziBluzyIr/0Mm+b1wwaTyAI4ufJQAp7ssUWUVF8u
	4q1Byd8t+dkvfSdYNg4NPda/U9RqZe8agVGtfGPp25yadIo6wSW3U0BBk/+Khrho+jQ=
X-Gm-Gg: ASbGnctxxaJpIFYvlpTGmbo1r0DtVNbsqg3mSxwXk2BvElJrFO0NwPMtz0FRGnc3OOY
	ynSBKxJwTWdguxg52Qt6c4hRE/GhS87GpgSM8GUD/WajSF7sFrJjTaaBV9HsgrilYl7C6hkTjfh
	AQhKEA10ssKmAhBlwa5EIx0bmNXrVdRrX1zO6q/H1Aghnhxr/O7nNAjltbT4MQsRJTFsMjhmJIZ
	nUnVeQsmsQ+Ir7U4DGMM8nBWE2aXplWDtrALgI0OvfH0teMthB/a/8WkJjY9mGpWyWM7SBQCCw4
	tt7rFPq3k8wVhmqbBG3HkqWEN3O0fTqLXH04uMQBPCrEnwTfM/NU0k2eklYHQh7r6z+wwXhJWdX
	t71sChmNJj/sDUIX+uNAhlIqNWyFAdxVAwgFIBynigETCJAtUTg==
X-Google-Smtp-Source: AGHT+IEUrossJxJVwWBU+vfj+xukJOxxn0Gc50ke7zrjhbK13v9zCYmZziSm3yGa9wtgXShwZmF+uA==
X-Received: by 2002:a05:600c:468f:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-45334b07460mr22803915e9.13.1749806298856;
        Fri, 13 Jun 2025 02:18:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532063ebf6sm56506385e9.3.2025.06.13.02.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:18:18 -0700 (PDT)
Message-ID: <7178e816-4cb4-49b3-9a1e-1ecd4caa43ed@linaro.org>
Date: Fri, 13 Jun 2025 11:18:17 +0200
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
Subject: Re: [PATCH 0/7] Add ASPEED PCIe Root Complex support
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
In-Reply-To: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13/06/2025 05:29, Jacky Chou wrote:
> This patch series adds support for the ASPEED PCIe Root Complex,
> including device tree bindings, pinctrl support, and the PCIe host controller
> driver. The patches introduce the necessary device tree nodes, pinmux groups,
> and driver implementation to enable PCIe functionality on ASPEED platforms.
> 
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY, PCIe Config, and PCIe RC
> - Update MAINTAINERS for new bindings and driver
> - Add PCIe RC node and PERST control pin to aspeed-g6 device tree
> - Add PCIe RC PERST pin group to aspeed-g6 pinctrl
> - Implement ASPEED PCIe Root Complex host controller driver
> 
> This series has been tested on AST2600/AST2700 platforms and enables PCIe device
> enumeration and operation.
> 
> Feedback and review are welcome.

So it seems all PCIe RC code is bundled in a single driver and there's no
PCIe PHY driver code, is there a reason for that ? If yes I think it should
be described in the cover letter.

Thanks,
Neil

> 
> Jacky Chou (7):
>    dt-bindings: phy: Add document for ASPEED PCIe PHY
>    dt-bindings: pci: Add document for ASPEED PCIe Config
>    dt-bindings: pci: Add document for ASPEED PCIe RC
>    ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST ctrl pin
>    ARM: dts: aspeed-g6: Add PCIe RC node
>    pinctrl: aspeed-g6: Add PCIe RC PERST pin group
>    pci: aspeed: Add ASPEED PCIe host controller driver
> 
>   .../bindings/pci/aspeed-pcie-cfg.yaml         |   41 +
>   .../devicetree/bindings/pci/aspeed-pcie.yaml  |  159 +++
>   .../bindings/phy/aspeed-pcie-phy.yaml         |   38 +
>   MAINTAINERS                                   |   10 +
>   .../boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
>   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   53 +
>   drivers/pci/controller/Kconfig                |   13 +
>   drivers/pci/controller/Makefile               |    1 +
>   drivers/pci/controller/pcie-aspeed.c          | 1039 +++++++++++++++++
>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    |   12 +-
>   10 files changed, 1370 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
>   create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
>   create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
>   create mode 100644 drivers/pci/controller/pcie-aspeed.c
> 


