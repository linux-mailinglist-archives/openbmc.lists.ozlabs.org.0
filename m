Return-Path: <openbmc+bounces-287-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D48AE7283
	for <lists+openbmc@lfdr.de>; Wed, 25 Jun 2025 00:53:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRgGK49GZz2xKh;
	Wed, 25 Jun 2025 08:53:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750750160;
	cv=none; b=Ax+BtCDPaDqpmU7qQpOXcLPIw/z8HLIElDk8jdmxviscz3NaqgnNEjXohtZkm5yc9WLo9kOZkfaOiseNOPqadJyY+CfjTaIv8jS0UO0lZI/AUViFLXzwfm/jtqkVmuaUG5gF9DRJCtA/rLRKjo1boYkHKzgHtTSwdLj2s0gN7+30vuPO/pRZz7J9NNAO51UnZRFFRIR2UN9uWStHhUEZAcpdJjm+H2SuTOWjnHVE/7dp5ButuqRqLVUdhVfKi8KYuMaEI6NgbaErne1bgbjPRXYEr4QFrnfkb06ACaKWW/d9T9P9mtjzz8pq5xnehXEJ2yCUSnTY9mhIkWVh8F3kAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750750160; c=relaxed/relaxed;
	bh=vXQvyWKGqoA++0+nLyhrIs47IOqxWVGOvjV4paCklaM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J6JsXcc86iEj2c1ckSFZXvYfoYt/vEv5Le0CYHS1sK/rM9Qr/Xcf0ND4DN5JGEBFafO6MsnXgAneF47QkrBMhy1Bczn2SsDfDZjNSi50uFUXXdCSQYAQso1O2CDcv81qkyQ4gLqcWckNPWVb2GvlLm6kP5jXRkXjwTm3cpBNwivsocSaDVm75IJnTM0SXy0vGgj+jX5ZiY08xfsydhFFSq3hOrWW6YJ0DmntN/Ggnbx7WB2m98WGB0Vx4TNR08URpcJO+fv9N6fak75V50Ofi4JjX2rSHkmLlSN4a/AdIYBUCpTkahHFKb+hD0TL3Uejm8c/V9/9pjTG8yy9RHtPBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jRxauPZ6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jRxauPZ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=neil.armstrong@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRGmH1KrVz2xRq
	for <openbmc@lists.ozlabs.org>; Tue, 24 Jun 2025 17:29:18 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-453647147c6so909365e9.2
        for <openbmc@lists.ozlabs.org>; Tue, 24 Jun 2025 00:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750750153; x=1751354953; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXQvyWKGqoA++0+nLyhrIs47IOqxWVGOvjV4paCklaM=;
        b=jRxauPZ6nSuxKSzZPfOVn/7/NkiWyo4+scsZakiZHs1cqxdQITgM7gbr1e8OHNa+Oo
         Ralb2dk2dS2xlaXi36oFAUHrDWXE14oqnmnbpPmILCQK1um06FqOHav+vwNJyo4jDINz
         mcOAALquLQ6wBOF+15nzHIhD5a9zQwWfZLenuqlzgC099fNvRt2R1PmxduADeJUcIrPB
         61rySKBWfgydAJUYm6nd6DnP5p2PrJkDJxwyUtKroJJ3dnvBb6ZcQqa3RgBV+scdAUoq
         KM7+jE1oKRhGKB7GjN7O4s7hNSRstd3qjpskmExtmCWWOJIAki6pfNzRef9nzDIVPHRb
         eLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750153; x=1751354953;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vXQvyWKGqoA++0+nLyhrIs47IOqxWVGOvjV4paCklaM=;
        b=fnOGEUGyXKta7xmIfZFHncSdZHRIiUIRtJlvpWnd4ttXqmwZSp9w/cvKReg5tW2S4x
         86S3RgQG4UbkxE4GdZcr9O103En8qp+3TOOiQyncGX+t6T2+xSzfnfORu68EMsj0xJPJ
         DY6bhBCwHY7/KpnkGncFXmroTA7FSqOUcuuthdxST1ih3UjhHt8LEsLOsClOAI1vs5N0
         6AJI9rYimwC/5siw/W/h46ZwSrJLJZP+FcdoFopqSBAX4nawVt7tXB/EAVrQIWZlxqKA
         2nks40Ce+STlcwTNg3FskxO71XAlUbDXYrkuoFGwnveISWSq85//prDhQoamPelck5F2
         B38g==
X-Forwarded-Encrypted: i=1; AJvYcCWBVFlwwMa9KD7Br1RqBl7zc5xTTfHIw0J5GLwM7JYm79AIweo90rgm0WYrDCEzuz3iZ7qiWwVP@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMOBA9xJJDXB7f6zOEfTuCtS9e1RaaaqlblJNBQkUvHZnnXYgr
	6mZZLX7BBniy1J4GqIANM6W6wJ3SQkH0ywYyCMZJRbfO92EEgxhhrqdhWu/CN3XgqMM=
X-Gm-Gg: ASbGncsfuI2M63AQ0FOP5GsTXvdBDrf4ZkPcEQm+NGDgdUtjaYR+zovNgyc/PvtDJEa
	IJu/mt/oMligww7XRmkZnJudQ/NQi9A8bPst09p1+PX04ofzIr0wEyEDqgrrMtGJ7XWv9ELU/BE
	Gs4nmAs9WQ0sbGbXZUt2/FSRwkI1gD9O6lx9wWSF4WSMn89Q1FYwIwACj3T1l84yuCAvBI7Z+D5
	j//4zg7B2ql0dnw0W4POP77CLgXtaKICuVot3DW4AdF8p0qft2cKVKTWDNpAoTSB/zzkFA7vMHb
	uRaca9trvwE2Z7tnBPHrCHFy4Kf3cp4x6fqjF8mWPV/+F8b6vLLVWRXiJV8ZPO0z9MGcGu2ERKi
	oJbCUZgo31DdcsmsBzRncXNk50nBtG5RWFbD9j7w=
X-Google-Smtp-Source: AGHT+IFNAvVc0Ym/Nl4SzjssDYkzNoxmE/MYxf9idIfGl+W01JZ50berxeUOTRJ/Uec/VhLDWdvcjg==
X-Received: by 2002:a5d:64e6:0:b0:3a5:8d0b:600c with SMTP id ffacd0b85a97d-3a6d12bb37emr13160349f8f.3.1750750152898;
        Tue, 24 Jun 2025 00:29:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6fea:600c:ca20:f54a? ([2a01:e0a:3d9:2080:6fea:600c:ca20:f54a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f27besm1190928f8f.57.2025.06.24.00.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:29:12 -0700 (PDT)
Message-ID: <754d260c-1a31-494e-af06-49f6aae1813f@linaro.org>
Date: Tue, 24 Jun 2025 09:29:11 +0200
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: =?UTF-8?B?UmU6IOWbnuimhjogW1BBVENIIDAvN10gQWRkIEFTUEVFRCBQQ0llIFJv?=
 =?UTF-8?Q?ot_Complex_support?=
To: Jacky Chou <jacky_chou@aspeedtech.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@codeconstruct.com.au"
 <andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "elbadrym@google.com" <elbadrym@google.com>,
 "romlem@google.com" <romlem@google.com>,
 "anhphan@google.com" <anhphan@google.com>, "wak@google.com"
 <wak@google.com>, "yuxiaozhang@google.com" <yuxiaozhang@google.com>,
 BMC-SW <BMC-SW@aspeedtech.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <7178e816-4cb4-49b3-9a1e-1ecd4caa43ed@linaro.org>
 <SEYPR06MB513414A5AE38EE6749A2902C9D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
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
In-Reply-To: <SEYPR06MB513414A5AE38EE6749A2902C9D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 20/06/2025 10:20, Jacky Chou wrote:
>>> This series has been tested on AST2600/AST2700 platforms and enables
>>> PCIe device enumeration and operation.
>>>
>>> Feedback and review are welcome.
>>
>> So it seems all PCIe RC code is bundled in a single driver and there's no PCIe
>> PHY driver code, is there a reason for that ? If yes I think it should be described
>> in the cover letter.
>>
> 
> Yes, because our design includes the PCIe RC and the PCIe EPs.
> The two functions use the same PCIe PHY and are mutually exclusive.
> And there are different configurations on RC and EP.
> Therefore, we do not use a phy driver to configure our PCIe but use
> the phandle of phy syscon to set the RC and EP drivers separately.

I don't get why a PHY drive could not exist, it could be used by either
the RC or EP PCIe driver in an exclusive way.

Neil

> 
> I will add more description in next version.
> 
> Thanks,
> Jacky
> 


