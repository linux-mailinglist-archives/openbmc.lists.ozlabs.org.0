Return-Path: <openbmc+bounces-95-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8E3AC750B
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:20:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76Nt3VPzz301G;
	Thu, 29 May 2025 10:16:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748450769;
	cv=none; b=co5uWVpxf9NMEtH+8k30bmhjdHS/tBCTIPu0wyARwZkTgbYYgbLXYJK3GdzPrF/KbSYALKxtez1P0YvlyaMEyouPdfPZQ2yogqwTDKDvhXP+KA6aEe95K3VjSfxQ5/ClhoT5evH6fMTJJ/GAhk8klkTe3Uhx0MhzA3uH/NICpMWFUveS0nSu4q5RUx4InBbgUUg9+ep0c3KdTFUtwWsPK8HeStELpyfb6sdA666CQdAQWx7jfzsaaw2ZrehyMipUUVycZJVefc/dTI/6wzU8EPwGm1XJDY03ftx+y2H+HdvHZPMZmACboAS44juXNrbuEcoVNUbETTTt6Mbq7MqWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748450769; c=relaxed/relaxed;
	bh=1SRpD7poP71J0Z5qeEtY8RTEWey1In+xs4H1dHguqyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mc04xfle55pD22/AFipLUo4gRa7FqsTNpvHLhjAneoXZ3nG98/bnFHs/5E5u2nPB39MEzsQyyGooMk0yaTN5+MG2EUDkgQOcUuI2IErLMtYa0wJnXr3cewT62h85fVWTi4XbilvMgj6f1i7KLq9xBzIiAvWdNrNu2do6NYWabdnElImRxQyY3LTuuzmhVbWTES7jdL27/m9TS1DPQZIBi7ZivahXyLtpop6Xct9mj+vebkhSGS7IEMVe+NOM4z3yRO9c2DjKWn3TK37ZpmZ1U+BtTf0kHopbBR6g9ZMhvsBfOvFnbLbK4/eEmHe1Uuk6QhoClkUhVuk52NFnplQMbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VPqKp2Ks; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org) smtp.mailfrom=broadcom.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VPqKp2Ks;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=broadcom.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6wP821mTz2xCW
	for <openbmc@lists.ozlabs.org>; Thu, 29 May 2025 02:46:02 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22c336fcdaaso982735ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748450761; x=1749055561; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1SRpD7poP71J0Z5qeEtY8RTEWey1In+xs4H1dHguqyI=;
        b=VPqKp2KsmGMrXGHQJErocO84SiZg1r+xjhiK4lE9G3DoOzlL0549zPBx70cd4xbUA/
         5mMtvvus4LOxFS4itEKcS1w+MzFGbCXQkHY0hSGSdQcIUprWE0DwPSixIel4hkWQx9Ox
         SvGCyMmlpa7NTvTT63Gc8+LAvsZFCn8Ywr5co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748450761; x=1749055561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SRpD7poP71J0Z5qeEtY8RTEWey1In+xs4H1dHguqyI=;
        b=YDkCmRVy8tW7zAmYnd49sNZqtk+fS7PTlfcvuBpR8jLB6kFKVXRb/GbYoABbnSYOQY
         WFBbDr5cWAmIh5ICXWwp1BDEE7zuKEnenkkKPMdWQP/CK6qDqXS4hEb5pBDTwYUMmmyy
         mS1vbbnyt0g0hD2kbOSaPXtb1K8xKCSCuzDI5tzssM8c9CYhddQJs6HkK39oB6xoA9gF
         83bf34VnoiN3ZOiyoqbeWvLCxHKy04tNYlKxcx9YYpGXczDrXNbsVN6rN7MWp69u4SgA
         BE3fJfB/xbJHvGtBL6kZ1ETRjlMsXOmnfrwfIo2kd84pFB/jqGgHO/LLdUOtqhZhE95m
         KMQw==
X-Forwarded-Encrypted: i=1; AJvYcCXIu9/glwcUKtrV2Mw6y4mBA8+LCQvYi7Uf5IB0q/FXdCGFwAdZy8Z8Bo6jZw322kXA3Q2YQjly@lists.ozlabs.org
X-Gm-Message-State: AOJu0YziilvN8l0F5yyFs4tcVnyhcxsy7quTvCWzylxIZ2jNtUtfOYjb
	U86kdxSTXjcqVbTe03mqd8xnjloyfGyLislajhrOBolLzGZPFg/2anf1eaqIixkhSw==
X-Gm-Gg: ASbGncsmOP7dvKpCnHKGWkzbDT2tMpNAHd8pNhfNso++cq271YEXzq9f8g1vVYFmOCH
	Dwh5xyUiomgOncd/usV8D4vNiRNAHxHb6YFaEpPUI6pa+G+NCmCJ1SznpF5wJAiY1qBcYOLJvye
	8nfa/FVDvaSTwfDxiWZ1RDOye7WCrSHR1UuTEQEeLdiF+bpkbcHEXrSq9lZhMCQoASeZElVvG9b
	8SEcvNnho6taP0WUD9ZqGdFOv3RwXzZP2YKoX3Nx6bartxX2AjdFMlAl7p3SsI2pc/ZNRqxdW9N
	eiTPfE92OdpBve0RTd0hgyOdPCCav5cV2TDx5ulDwlzrB9DrqXKRxGBSUkKenA9rI20PTYsURRn
	jqZtGcPON3e2uIb8=
X-Google-Smtp-Source: AGHT+IFDqqRyt96nyrm1smBWGPbaIUUGA60gdUbEGZQYCr4hXTXZ7qx/vOTbUl93u1wjePXxrv/QGQ==
X-Received: by 2002:a17:902:d50b:b0:234:a734:4ac2 with SMTP id d9443c01a7336-234a7344be1mr87356785ad.9.1748450760577;
        Wed, 28 May 2025 09:46:00 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fd22besm14180885ad.40.2025.05.28.09.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:45:59 -0700 (PDT)
Message-ID: <4474875f-bfd7-4f98-836c-0624f75c0f27@broadcom.com>
Date: Wed, 28 May 2025 09:45:49 -0700
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
Subject: Re: [PATCH 07/17] pinctrl: bcm: Constify static 'pinctrl_desc'
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
 <20250528-pinctrl-const-desc-v1-7-76fe97899945@linaro.org>
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
In-Reply-To: <20250528-pinctrl-const-desc-v1-7-76fe97899945@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 5/28/25 03:41, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

