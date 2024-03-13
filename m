Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10D87A39C
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 08:31:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvhzG52Ppz3vb1
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 18:31:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvhyx0GKKz3bZ1;
	Wed, 13 Mar 2024 18:31:36 +1100 (AEDT)
Received: from [192.168.0.224] (ip5f5aedb6.dynamic.kabel-deutschland.de [95.90.237.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7839E61E5FE0A;
	Wed, 13 Mar 2024 08:30:36 +0100 (CET)
Message-ID: <173ca80c-1b27-4de9-9424-1f283e9d216b@molgen.mpg.de>
Date: Wed, 13 Mar 2024 08:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: pinctrl-aspeed-g6: Fix register offset.
To: Billy Tsai <billy_tsai@aspeedtech.com>
References: <20240313052027.1320489-1-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240313052027.1320489-1-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: BMC-SW@aspeedtech.com, Johnny Huang <johnny_huang@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, Ricky_CX_Wu@wiwynn.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, joel@jms.id.au, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Billy,


Thank you for your patch. Some formal nits, I noticed.

Could you please name the register, and remove the dot/period in the 
commit message summary/title. Maybe:

pinctrl: pinctrl-aspeed-g6: Fix register offset of GPIOR-T

Am 13.03.24 um 06:20 schrieb Billy Tsai:
> The register offset to disable the internal pull-down of GPIOR~T is 0x630
> instead of 0x620.

Please mention the source (for example datasheet name and revision), and 
a possible reason, why this has been unnoticed several years, as the 
commit introducing this is present since v5.6-rc1.


Kind regards,

Paul


PS: Just a note, that Delphine sent the same patch [1], but replied to 
review the one from Billy instead.


[1]: 
https://lore.kernel.org/all/20240313024210.31452-1-Delphine_CC_Chiu@wiwynn.com/


> Fixes: 15711ba6ff19 ("pinctrl: aspeed-g6: Add AST2600 pinconf support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 34 +++++++++++-----------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index d376fa7114d1..029efe16f8cc 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -43,7 +43,7 @@
>   #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
>   #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
>   #define SCU61C		0x61c /* Disable GPIO Internal Pull-Down #3 */
> -#define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 */
> +#define SCU630		0x630 /* Disable GPIO Internal Pull-Down #4 */
>   #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
>   #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
>   #define SCU690		0x690 /* Multi-function Pin Control #24 */
> @@ -2495,38 +2495,38 @@ static struct aspeed_pin_config aspeed_g6_configs[] = {
>   	ASPEED_PULL_DOWN_PINCONF(D14, SCU61C, 0),
>   
>   	/* GPIOS7 */
> -	ASPEED_PULL_DOWN_PINCONF(T24, SCU620, 23),
> +	ASPEED_PULL_DOWN_PINCONF(T24, SCU630, 23),
>   	/* GPIOS6 */
> -	ASPEED_PULL_DOWN_PINCONF(P23, SCU620, 22),
> +	ASPEED_PULL_DOWN_PINCONF(P23, SCU630, 22),
>   	/* GPIOS5 */
> -	ASPEED_PULL_DOWN_PINCONF(P24, SCU620, 21),
> +	ASPEED_PULL_DOWN_PINCONF(P24, SCU630, 21),
>   	/* GPIOS4 */
> -	ASPEED_PULL_DOWN_PINCONF(R26, SCU620, 20),
> +	ASPEED_PULL_DOWN_PINCONF(R26, SCU630, 20),
>   	/* GPIOS3*/
> -	ASPEED_PULL_DOWN_PINCONF(R24, SCU620, 19),
> +	ASPEED_PULL_DOWN_PINCONF(R24, SCU630, 19),
>   	/* GPIOS2 */
> -	ASPEED_PULL_DOWN_PINCONF(T26, SCU620, 18),
> +	ASPEED_PULL_DOWN_PINCONF(T26, SCU630, 18),
>   	/* GPIOS1 */
> -	ASPEED_PULL_DOWN_PINCONF(T25, SCU620, 17),
> +	ASPEED_PULL_DOWN_PINCONF(T25, SCU630, 17),
>   	/* GPIOS0 */
> -	ASPEED_PULL_DOWN_PINCONF(R23, SCU620, 16),
> +	ASPEED_PULL_DOWN_PINCONF(R23, SCU630, 16),
>   
>   	/* GPIOR7 */
> -	ASPEED_PULL_DOWN_PINCONF(U26, SCU620, 15),
> +	ASPEED_PULL_DOWN_PINCONF(U26, SCU630, 15),
>   	/* GPIOR6 */
> -	ASPEED_PULL_DOWN_PINCONF(W26, SCU620, 14),
> +	ASPEED_PULL_DOWN_PINCONF(W26, SCU630, 14),
>   	/* GPIOR5 */
> -	ASPEED_PULL_DOWN_PINCONF(T23, SCU620, 13),
> +	ASPEED_PULL_DOWN_PINCONF(T23, SCU630, 13),
>   	/* GPIOR4 */
> -	ASPEED_PULL_DOWN_PINCONF(U25, SCU620, 12),
> +	ASPEED_PULL_DOWN_PINCONF(U25, SCU630, 12),
>   	/* GPIOR3*/
> -	ASPEED_PULL_DOWN_PINCONF(V26, SCU620, 11),
> +	ASPEED_PULL_DOWN_PINCONF(V26, SCU630, 11),
>   	/* GPIOR2 */
> -	ASPEED_PULL_DOWN_PINCONF(V24, SCU620, 10),
> +	ASPEED_PULL_DOWN_PINCONF(V24, SCU630, 10),
>   	/* GPIOR1 */
> -	ASPEED_PULL_DOWN_PINCONF(U24, SCU620, 9),
> +	ASPEED_PULL_DOWN_PINCONF(U24, SCU630, 9),
>   	/* GPIOR0 */
> -	ASPEED_PULL_DOWN_PINCONF(V25, SCU620, 8),
> +	ASPEED_PULL_DOWN_PINCONF(V25, SCU630, 8),
>   
>   	/* GPIOX7 */
>   	ASPEED_PULL_DOWN_PINCONF(AB10, SCU634, 31),
