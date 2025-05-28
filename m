Return-Path: <openbmc+bounces-85-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D0CAC7500
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:18:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nm3Wzxz2yr3;
	Thu, 29 May 2025 10:16:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748450798;
	cv=none; b=EQIoXnfgzMJU9u2cSeOAVrxtycQmnAZC6u7dHgziFoIoGZoYmnVK8i3PFha5zc+JpSvJNIGcRwBso9KtpeHDwaNjlMOYgVRa+Ng7Ip9kdyLsojvxNso3NtTyOAffvRIA3FLqPAhiMpgvJYxLeORC9c5bJ0ksQ9WGNrW0TDu/e0FvC34joPfVT3Fh+93lcAnPCS+TtpF8+W5cnLPB0mcL6f3pJhLDIpHd+rQ/2JiOwmSUjb07k+CvF023zOTg0lJ/RAks7AhdF9UsNHtVCmN/btLjtgsLCFdWR3KrJuQ4PawQrk1FevEMmuTj6LIqC1bllziHhZQklvPHqx/8cp+vhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748450798; c=relaxed/relaxed;
	bh=bTrLQar6gjTjFnrAkyn0kezzixoXN+IjT1tsTT4veX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShVblmaA/GvsBecj6GbDx2SQWOmGfKbJ04knvio1zUy6+w48M1mT2jWnw8gz2EOV9ASopmfeuxHy+DRN9ZcIKofazVjEIMRUwPPmPzU9aIN6MX9Tj/RvZm2gK2ngAMOdrFt/sQb7iOITbNJBJTisz5mWEfltlszzRCRrFvv53Cu5Ujac6v2NSEKPvRj1jbjYz0V6Tn/qjrSzoR2IB2vzhKjvw7UMYwB1LIF8vFzuWEzplasyLbmmGca0m7Rfnx2wuL3TycZjw6ClMrotIMZzxiZAWgCB26YjRj84m/ywUoCvTgPdvxQMkSnQYWvT1mYKteP6ktrtkpFEauBve12Otw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gg5Lu2bZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org) smtp.mailfrom=broadcom.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gg5Lu2bZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=broadcom.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6wPn6rbqz2xCW
	for <openbmc@lists.ozlabs.org>; Thu, 29 May 2025 02:46:37 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-234bfe37cccso1457895ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748450796; x=1749055596; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bTrLQar6gjTjFnrAkyn0kezzixoXN+IjT1tsTT4veX4=;
        b=gg5Lu2bZZ2eYeyqHSDGCVbxBY90d+V9l3f1cLC+1F1F3jKCxENhJ5wj3ysh6LlbfIx
         2iH1iT3gs/WmQnTDF3l9TUvzsScqmy87gdcQ81Q7xoI3JzOD/h6tIUDiXhhMpKnR6oIe
         OMH3S19FIORy1q7rp6M9wSZyFO2b4VXJ20T+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748450796; x=1749055596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTrLQar6gjTjFnrAkyn0kezzixoXN+IjT1tsTT4veX4=;
        b=UnjZtSf4WQUQTPhXNSRX2IDEEDooJsVm/+fdfbq/dKATJTdUaSTzQs37+R3fiJa8cm
         gBbbDzvciA5pLrggMD8g+LNuRl36bm5NLmrt9NDNbbZidGZ3RUmkZPjqCnK7nWdJNgSC
         Z8ShCuR9aDfoacwKC6Yzylz62Q/4rk3L+FJxmoGppW9msmrdhK0USvp2FKH3fsXDs51b
         xXuXZJeQaN7l7magnCpOzTQQPMlQe1ATOFyCKgancF62tjsdaRYkbJnobL+nmJkBCjMy
         lQJvEiXDEUZ+bt5NGaCcpI4wFIJ1AKi62ddg1ce44HpL9rCjITlDQQEbKFTsS7StLvoH
         46GA==
X-Forwarded-Encrypted: i=1; AJvYcCXef5Ti0CoxnrCr0+yQX4otu2DWw86w8SiGBpSr5OaUsoW7jxlu9r1sRMO++xrrxBSO0pK4YC/Y@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDRySdMYLgA/xelV3YPldpdqj46oHj/tlzoNQwPPu8bzeSvLw7
	w3O8Vgt3plwUk4aMtGqiyE75yqVpsoONUwCvACJR1HmtntsZJagVlK1+2JBbpYcv6Q==
X-Gm-Gg: ASbGnctQqd60jGX8R7Qj1iNY3zdi5mMQ+1gU3fEpUttkInXNOQ0PL9w+gsPn79hkpPp
	KBeRfNDzDtbKq0PfyGUju898qAlODnzVME0HMYKnyt9MruvAbZd9/yT/Fr+cSjneIPP4essBbQK
	U4KqwS1Zfr5VmUIP9SQerisg4UZR7TYkxYWX0CbleeB9+emKgy/HffOiPHtiwhH063yNc+4/LL7
	Lh8nZxQemF7NRJQPFKmIIzRYd33lOSeF/WieKjYlcbia2g89WOvxoe1zeN3yaLlNXCysIAPWcEE
	rrgPYLaiktGFhJFUXtGK4omRL6gpy5aYGJwwT3lZlNHmZrV86fpz0Mgdf02CZPpWiHAYrw1ZVEM
	8JxsZi8dRZcL617U=
X-Google-Smtp-Source: AGHT+IFZp5UK5jGx1R+UdIJR5to06T9Np6rNPVYDOR8PPYv1Mujf2unJbIiknwRlJEbu8Z7S2Ap77w==
X-Received: by 2002:a17:902:e848:b0:234:8ac5:754 with SMTP id d9443c01a7336-2348ac50844mr145646295ad.4.1748450796372;
        Wed, 28 May 2025 09:46:36 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fe1854sm14097295ad.66.2025.05.28.09.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:46:35 -0700 (PDT)
Message-ID: <0df6f879-f819-492b-b9c5-f91d544203ad@broadcom.com>
Date: Wed, 28 May 2025 09:46:26 -0700
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
Subject: Re: [PATCH 08/17] pinctrl: bcm: cygnus-mux: Move fixed assignments to
 'pinctrl_desc' definition
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
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
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-8-76fe97899945@linaro.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250528-pinctrl-const-desc-v1-8-76fe97899945@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 5/28/25 03:41, Krzysztof Kozlowski wrote:
> Assign 'struct pinctrl_desc' .npins member in definition to make clear
> that number of pins is fixed and have less code in the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

