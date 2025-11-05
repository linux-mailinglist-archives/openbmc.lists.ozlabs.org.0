Return-Path: <openbmc+bounces-845-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D24C36163
	for <lists+openbmc@lfdr.de>; Wed, 05 Nov 2025 15:37:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1nw75DTXz2yrT;
	Thu,  6 Nov 2025 01:37:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762353431;
	cv=none; b=jnKFbHKGlSo7yaK15Djol32MJW8DFVxDPGb+G7MZqQVHkbZnTaihOHQEYHMFmTQNTVkhIPI8elI986GJos0rCN6TR6Hw6C6vm4ZlyA9Jm6jT7UYkzqqrIyVID5X4ioOLrLPckdQdJeJyZvEQ9fu9rNao/4sqDrlIQWn4TAKGcA9JQPT4NpZ914BRririg2jQJufxcMr41ZxUkRu55D3xsYTT0v1JVcW7iCjlI4DzxB246AUzOIt0a00NZC5zdBlsVkR/RM5PnibaW+A2V3F5dIt9E46asuYOK53ZRNUjuzKFB7Ph/f/PXxRLUt+tdxYR4CeMY+8AHG1KXF+WxZLF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762353431; c=relaxed/relaxed;
	bh=+kmAojFdIUJpFGapFWiBax+VVcI+4s+MhNSaHcmofNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HViXCRGEn8ShtMoWz1G02MxTfB1S3OH6aeQpw411oEb5F6rSeRJtNGz1QXcWHxwvb1V+e9jPCjhfufpTSbJ2/VQ4y3p4yCTNrBDRh2v3YUR9/oiMVLzn7d/wCvVrLrUMimhEEMA9uAKFEIZQ/ZiKFPLGL3hdhPP8iJSiWQN6DXgXEq8MhKOoOSikTrBvbBg+aU9Euw4Qm+YKQUubVyEqPy6LUZj+BCTfvQ9ph3trMsFYqlCpAiZxnclHMgu0FnIZI2H9dcUpqfPbAnyyQQW38qwUFgjLdefxyfF+vQASy61Hb6XE1MLyt//gpXjmhIP5YZp/nfYIXiUO0PrmomRZUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1nw62N30z2yjp;
	Thu,  6 Nov 2025 01:37:08 +1100 (AEDT)
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5B22461E6484C;
	Wed, 05 Nov 2025 15:35:23 +0100 (CET)
Message-ID: <e16c3bd4-38c4-4c77-aa61-0affb40b0be2@molgen.mpg.de>
Date: Wed, 5 Nov 2025 15:35:22 +0100
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
Subject: Re: [PATCH] spi: aspeed: Use devm_iounmap() to unmap devm_ioremap()
 memory
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, clg@kaod.org,
 broonie@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lkp@intel.com
References: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear Chin-Ting,


Thank you for your patch.

Am 05.11.25 um 09:49 schrieb Chin-Ting Kuo:
> The AHB IO memory for each chip select is mapped using
> devm_ioremap(), so it should be unmapped using devm_iounmap()
> to ensure proper device-managed resource cleanup.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510292356.JnTUBxCl-lkp@intel.com/
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>   drivers/spi/spi-aspeed-smc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index e8bd8fe6c4e7..179c47ffbfeb 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -396,7 +396,7 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
>   
>   	for (cs = 0; cs < aspi->data->max_cs; cs++) {
>   		if (aspi->chips[cs].ahb_base) {
> -			iounmap(aspi->chips[cs].ahb_base);
> +			devm_iounmap(dev, aspi->chips[cs].ahb_base);
>   			aspi->chips[cs].ahb_base = NULL;
>   		}
>   	}

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

