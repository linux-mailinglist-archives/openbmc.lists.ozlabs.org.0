Return-Path: <openbmc+bounces-187-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57738AD7EB3
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 01:01:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJJ195Ltwz2yMw;
	Fri, 13 Jun 2025 09:01:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.154.197.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749697725;
	cv=none; b=V+H0Sr1oP5jkvoxdVJpjrBcfHd5dsgMMfbBNOmk4gCXh5CcAOj3e2vfdPS80+M5mAIx16BRmLRUSGExjL2G12YnawOfSSnyzocec8joSrVTQzYGCD7GodpCpHgOo61eq/Ko4y/VnjyVTnwk1FMD+GCv7T9hl1Phvige0Rh6uQWkKo1hBcqtbdihPbix/E2HmVlAp1QxzxdBkM1T9AuLfUiSZmo1hh2zS3VOj39OxwKkkg5QE/sgceaJnUWY33al8xI8s4774abilLq4SNAwWW94WG776FeiU8iUW0ek7DxmA/p/KrH00G2RKyFMtVVI1ku+69WKuKEe1FCQOuvS2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749697725; c=relaxed/relaxed;
	bh=8wu8wKYmVXyp9b0/2rupkUxVhOmixYJXHEOoxsejcNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgW2/AMBidtdnYMbK/3AY5L5XwAuTLNMp+t2MY7wviElmKfznu3x8rZ5SSkqE0bbijyt/nW1w9cG2AMVjOGbe1B/U/jeNox4Um1xNkZUY6GFjcYySeKhVL1eZv0nV5nYrhlkxZKx28dTDpS1ATORSUYmpLXaYR4IeGwFhS6BwDaI6+nTrWp4oHxVi1uOYWQ33UolFAHssXVyMDhEHpNBDKHKPFsQiBJsEXEQ1LJUrWLJ+u0ouuiedCyHn7GLyvjuunhkXqrR/3OnMI6HDXKsvRVHRKqWQSja2y4nB/nOChvcX9l5em50AaSgKNLfw1Bo9ttQ/n7OYKPv1TpivtTZVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=linux.starfivetech.com; spf=none (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=hal.feng@linux.starfivetech.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.starfivetech.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=linux.starfivetech.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.starfivetech.com (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=hal.feng@linux.starfivetech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 453 seconds by postgrey-1.37 at boromir; Thu, 12 Jun 2025 13:08:43 AEST
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHnY74Hb4z2xGw;
	Thu, 12 Jun 2025 13:08:43 +1000 (AEST)
X-QQ-mid: esmtpgz14t1749697213t65c22161
X-QQ-Originating-IP: IF1P/oCMu5+Z6gtoOhY0chVmlDO4Lfc/wt6ay8GGmZA=
Received: from [192.168.125.115] ( [113.104.142.205])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Jun 2025 11:00:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7120148681061884487
Message-ID: <E9D57DC946595F4F+762b7c45-ba5f-4bba-86d3-4eeea7643157@linux.starfivetech.com>
Date: Thu, 12 Jun 2025 11:00:09 +0800
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
Subject: Re: [PATCH v2 16/17] pinctrl: Constify static 'pinctrl_desc'
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
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: NAeO0+xU6W76gNbKsV9iaUk/e76/x2UL0YNwMIWRA9ZI56qvKoC6m7wA
	DvyIJPwt8pkIgpOx83pdDBBlQS5hn1RcZjcJv0+o+Rb6pV0ok6HnIsHTPLg0ADT9X98lXfR
	KCNttai5JBlV5JWTUEtaeBKe1sfIi0uKnprfmr++Tm9+IPIKbruA1uoNR4icwJsXBeGepin
	ZA4fexPiJI17BoTOY7c3aLF97iC9oS3MaPwDvT3DVLw1mofDbnIBPXBajO2RC/POyhV9I7/
	gCzettuqfIv/yyPkeGJPopaFPPnGOZhkDjFUxGOHvG4CNs9tPaMgJI+xJGjoJKz9Mf9/cwq
	28FudyKnQqqZL79EgaRQUR9qMXowH9N0dPb1DKobuNX/pL+JGtwxvsStaH3R1jNbWVKDR3M
	/E64qz4wciar/7Q0fNKLfl+LnjCgtiQAswHymlu6kPOppWuX07TJOnjo2LoRFRkkrWYNQ1w
	kGjJMcLoSoi/nhp5r9UMhuS6SwLd8yhnrW/dTg85geLDH4prgwx4NIB/v7BBob44xJ3UzUR
	e7ZXxJTt+7DgX3MOKTm7hHmOwYIEVc8fqDn+rzPfircUVUB+nGQsTsR7eAWWVsZmmsQT6V0
	T5ScBGH7MvuKGmTq3YiA4WLXOZfPcD3ApG2HLLQ/trfq2aa98tFdltP2ydEc5Xne/BPUjJN
	7b8Vo9N/bDd/E0dLYXm+3XN9rzITDL3Svuw/96JbvZUm9AYcrXkJGTgvMUpDIwvuRjBKm8A
	Exp4vW98QnSRycEiZ/8M8mVR0l8ROQgO3HHNlimR70QzPivh67GXwWzKqsPIKbfvqymavf5
	WkcBdApEWEqKqQzGTMmfZg4SOutxdR0/YQLqwtzrgThqayTnUOleotatWdv3nhSmMAkyQQt
	aJO63fNG1wHGysv+6iTjN6k1uWSDvYgW2H2Qx3kMRKRa85awKSiz1CrN+hGWCeWtS9G5wRv
	eExuQNQPsEMbQ41+CZg+Inl40Kyc5r7B4cZOTjJguB7Y+Wpqj6nnFQrNy
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=1.6 required=5.0 tests=FORGED_MUA_MOZILLA,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 6/11/2025 2:13 PM, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/berlin/berlin.c                    | 2 +-
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>  drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>  drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>  drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>  drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-
>  drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>  drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>  drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
> 
...
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 27f99183d994dccb92aac81ca42228bdb9225e87..aeaa0ded7c1e5ee7f9c5e4113bfd208fb844ba7d 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -898,7 +898,7 @@ static const struct pinconf_ops starfive_pinconf_ops = {
>  	.is_generic = true,
>  };
>  
> -static struct pinctrl_desc starfive_desc = {
> +static const struct pinctrl_desc starfive_desc = {
>  	.name = DRIVER_NAME,
>  	.pins = starfive_pins,
>  	.npins = ARRAY_SIZE(starfive_pins),
> 

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal


