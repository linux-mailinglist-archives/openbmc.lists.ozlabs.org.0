Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AFC525C80
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 09:48:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L013437t8z3c9q
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 17:48:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.33.25; helo=7.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 7.mo548.mail-out.ovh.net (7.mo548.mail-out.ovh.net
 [46.105.33.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L012h5fjmz3bcl
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 17:47:37 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.219])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 58EDD21083;
 Fri, 13 May 2022 05:21:02 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 13 May
 2022 07:21:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0019f8bf5ff-9825-4171-a8ce-20720aae537a,
 7E3099CCCDBDCA9B64B55F14ACBFF9980A3F1D3F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <06c4359e-2ee7-052e-0d32-377ddd872c3a@kaod.org>
Date: Fri, 13 May 2022 07:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] hw: aspeed: Add missing UART's
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20220513040220.3657135-1-pdel@fb.com>
 <20220513040220.3657135-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220513040220.3657135-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5910d657-721b-438b-bd01-59c511cea8c3
X-Ovh-Tracer-Id: 16914957252279897010
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeekgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
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
Cc: peter.maydell@linaro.org, zev@bewilderbeest.net, andrew@aj.id.au,
 irischenlj@fb.com, openbmc@lists.ozlabs.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/13/22 06:02, Peter Delevoryas wrote:
> This adds the missing UART memory and IRQ mappings for the AST2400, AST2500,
> AST2600, and AST1030.
> 
> This also includes the new UART interfaces added in the AST2600 and AST1030
> from UART6 to UART13. The addresses and interrupt numbers for these two
> later chips are identical.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   hw/arm/aspeed_ast10x0.c     | 24 ++++++++++++++++++++++++
>   hw/arm/aspeed_ast2600.c     | 19 +++++++++++++++++++
>   hw/arm/aspeed_soc.c         |  6 ++++++
>   include/hw/arm/aspeed_soc.h |  8 ++++++++
>   4 files changed, 57 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 4271549282..f65dc139da 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -33,14 +33,38 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
>       [ASPEED_DEV_SBC]       = 0x7E6F2000,
>       [ASPEED_DEV_GPIO]      = 0x7E780000,
>       [ASPEED_DEV_TIMER1]    = 0x7E782000,
> +    [ASPEED_DEV_UART1]     = 0x7E783000,
> +    [ASPEED_DEV_UART2]     = 0x7E78D000,
> +    [ASPEED_DEV_UART3]     = 0x7E78E000,
> +    [ASPEED_DEV_UART4]     = 0x7E78F000,
>       [ASPEED_DEV_UART5]     = 0x7E784000,
> +    [ASPEED_DEV_UART6]     = 0x7E790000,
> +    [ASPEED_DEV_UART7]     = 0x7E790100,
> +    [ASPEED_DEV_UART8]     = 0x7E790200,
> +    [ASPEED_DEV_UART9]     = 0x7E790300,
> +    [ASPEED_DEV_UART10]    = 0x7E790400,
> +    [ASPEED_DEV_UART11]    = 0x7E790500,
> +    [ASPEED_DEV_UART12]    = 0x7E790600,
> +    [ASPEED_DEV_UART13]    = 0x7E790700,
>       [ASPEED_DEV_WDT]       = 0x7E785000,
>       [ASPEED_DEV_LPC]       = 0x7E789000,
>       [ASPEED_DEV_I2C]       = 0x7E7B0000,
>   };
>   
>   static const int aspeed_soc_ast1030_irqmap[] = {
> +    [ASPEED_DEV_UART1]     = 47,
> +    [ASPEED_DEV_UART2]     = 48,
> +    [ASPEED_DEV_UART3]     = 49,
> +    [ASPEED_DEV_UART4]     = 50,
>       [ASPEED_DEV_UART5]     = 8,
> +    [ASPEED_DEV_UART6]     = 57,
> +    [ASPEED_DEV_UART7]     = 58,
> +    [ASPEED_DEV_UART8]     = 59,
> +    [ASPEED_DEV_UART9]     = 60,
> +    [ASPEED_DEV_UART10]    = 61,
> +    [ASPEED_DEV_UART11]    = 62,
> +    [ASPEED_DEV_UART12]    = 63,
> +    [ASPEED_DEV_UART13]    = 64,
>       [ASPEED_DEV_GPIO]      = 11,
>       [ASPEED_DEV_TIMER1]    = 16,
>       [ASPEED_DEV_TIMER2]    = 17,
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index eedda7badc..1b72800682 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -61,7 +61,18 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_IBT]       = 0x1E789140,
>       [ASPEED_DEV_I2C]       = 0x1E78A000,
>       [ASPEED_DEV_UART1]     = 0x1E783000,
> +    [ASPEED_DEV_UART2]     = 0x1E78D000,
> +    [ASPEED_DEV_UART3]     = 0x1E78E000,
> +    [ASPEED_DEV_UART4]     = 0x1E78F000,
>       [ASPEED_DEV_UART5]     = 0x1E784000,
> +    [ASPEED_DEV_UART6]     = 0x1E790000,
> +    [ASPEED_DEV_UART7]     = 0x1E790100,
> +    [ASPEED_DEV_UART8]     = 0x1E790200,
> +    [ASPEED_DEV_UART9]     = 0x1E790300,
> +    [ASPEED_DEV_UART10]    = 0x1E790400,
> +    [ASPEED_DEV_UART11]    = 0x1E790500,
> +    [ASPEED_DEV_UART12]    = 0x1E790600,
> +    [ASPEED_DEV_UART13]    = 0x1E790700,
>       [ASPEED_DEV_VUART]     = 0x1E787000,
>       [ASPEED_DEV_I3C]       = 0x1E7A0000,
>       [ASPEED_DEV_SDRAM]     = 0x80000000,
> @@ -78,6 +89,14 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_UART3]     = 49,
>       [ASPEED_DEV_UART4]     = 50,
>       [ASPEED_DEV_UART5]     = 8,
> +    [ASPEED_DEV_UART6]     = 57,
> +    [ASPEED_DEV_UART7]     = 58,
> +    [ASPEED_DEV_UART8]     = 59,
> +    [ASPEED_DEV_UART9]     = 60,
> +    [ASPEED_DEV_UART10]    = 61,
> +    [ASPEED_DEV_UART11]    = 62,
> +    [ASPEED_DEV_UART12]    = 63,
> +    [ASPEED_DEV_UART13]    = 64,
>       [ASPEED_DEV_VUART]     = 8,
>       [ASPEED_DEV_FMC]       = 39,
>       [ASPEED_DEV_SDMC]      = 0,
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 58714cb2a0..2cd03d49da 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -48,6 +48,9 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
>       [ASPEED_DEV_ETH1]   = 0x1E660000,
>       [ASPEED_DEV_ETH2]   = 0x1E680000,
>       [ASPEED_DEV_UART1]  = 0x1E783000,
> +    [ASPEED_DEV_UART2]  = 0x1E78D000,
> +    [ASPEED_DEV_UART3]  = 0x1E78E000,
> +    [ASPEED_DEV_UART4]  = 0x1E78F000,
>       [ASPEED_DEV_UART5]  = 0x1E784000,
>       [ASPEED_DEV_VUART]  = 0x1E787000,
>       [ASPEED_DEV_SDRAM]  = 0x40000000,
> @@ -80,6 +83,9 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
>       [ASPEED_DEV_ETH1]   = 0x1E660000,
>       [ASPEED_DEV_ETH2]   = 0x1E680000,
>       [ASPEED_DEV_UART1]  = 0x1E783000,
> +    [ASPEED_DEV_UART2]  = 0x1E78D000,
> +    [ASPEED_DEV_UART3]  = 0x1E78E000,
> +    [ASPEED_DEV_UART4]  = 0x1E78F000,
>       [ASPEED_DEV_UART5]  = 0x1E784000,
>       [ASPEED_DEV_VUART]  = 0x1E787000,
>       [ASPEED_DEV_SDRAM]  = 0x80000000,
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index e13af374b9..3f7f815275 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -104,6 +104,14 @@ enum {
>       ASPEED_DEV_UART3,
>       ASPEED_DEV_UART4,
>       ASPEED_DEV_UART5,
> +    ASPEED_DEV_UART6,
> +    ASPEED_DEV_UART7,
> +    ASPEED_DEV_UART8,
> +    ASPEED_DEV_UART9,
> +    ASPEED_DEV_UART10,
> +    ASPEED_DEV_UART11,
> +    ASPEED_DEV_UART12,
> +    ASPEED_DEV_UART13,
>       ASPEED_DEV_VUART,
>       ASPEED_DEV_FMC,
>       ASPEED_DEV_SPI1,

