Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 912C02E0218
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 22:38:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0CWQ3SC3zDqR3
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 08:38:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mme2YD4Q; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0CVV0mGqzDqNS;
 Tue, 22 Dec 2020 08:37:14 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id u19so11005375edx.2;
 Mon, 21 Dec 2020 13:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=hQggwWPPkn+WMdoPfwbk6PXTqnMay86HYcER0pUuPDU=;
 b=mme2YD4QrmilHl3rH4PtxXh4y8Phq4UwwyTKfowp7vxflfYKXuGNAwaWvgzd3Wooso
 Ut9BfVdgSAefeuATpsq7l6HYtzEx1jKyNqaI+8dIUS0oT6B/zUHDXPQSNRDYdUW8Mk2L
 D2jgh26Sgy/fLFI9ZFJaLzcy4jEo12N9HmYnoAcmlEpO3MWd6mrsjMQWonMFOBpQq4kS
 kGiuoV8gxQ/toIvEl6axAMzOWQmgD+7wmukKWe75saFipTLNyDv48dP90OspIdeFaB14
 9/lURxLTxYuKHcPnJoFA5qHKl4etjpd4OonH4l0dP4BZFitewHAYN60CIyKX0QiuSEgV
 6S0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=hQggwWPPkn+WMdoPfwbk6PXTqnMay86HYcER0pUuPDU=;
 b=UPWhDZA4nTTw2COx0k1yUgM2FC1ZGln1JILqyZnHZhqW9dLXvjNakICxloMeNTYbIN
 zT1MOyPmRRBRJ7ZJuDyZXll4ja+YEftdXRKeLmJcd+C+EiflG1SIXS2Pfdpe8N2g2BTI
 L4NPYNsuWwnY0XCg3EwvH+YwlRF0M8jUGU6PVSoRne1zPKMcqyw9kK7vNeAH6xNbUVWO
 qsLIAhiApVATWCu4otJgJ6jMweRpQPqC83ANOZEwrPASTyTR0t+5cSn/usFTNKhwyHMb
 UpWUQaP3UssuVQqHINa5oyS/CBk0Cm8BhnMeJ9ket/Nqs+sSjG6+uhCLVCDvLlnF4jaL
 xVDg==
X-Gm-Message-State: AOAM531cUO4MWOiYknxyIGfrHs2Y8GJamGAsSwMovcSEYCZHRel0BHM3
 FtO8IdJ2Krocue58tZ39a+I=
X-Google-Smtp-Source: ABdhPJyxPsg4QZqk0I6q3W047zja/4kF/0lD+UExgg5XcSg+P4YpCkZo5ten+TN3uXrk85CGMihysQ==
X-Received: by 2002:a50:8b61:: with SMTP id l88mr17968781edl.250.1608586626276; 
 Mon, 21 Dec 2020 13:37:06 -0800 (PST)
Received: from ?IPv6:2003:ea:8f06:5500:cd72:cf28:16d9:79dc?
 (p200300ea8f065500cd72cf2816d979dc.dip0.t-ipconnect.de.
 [2003:ea:8f06:5500:cd72:cf28:16d9:79dc])
 by smtp.googlemail.com with ESMTPSA id a6sm29216403edv.74.2020.12.21.13.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 13:37:05 -0800 (PST)
Subject: Re: [Aspeed, v1 1/1] net: ftgmac100: Change the order of getting MAC
 address
To: Hongwei Zhang <hongweiz@ami.com>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jakub Kicinski <kuba@kernel.org>, David S Miller <davem@davemloft.net>
References: <20201221205157.31501-1-hongweiz@ami.com>
 <20201221205157.31501-2-hongweiz@ami.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <55803a8a-7ec9-5d60-04bd-d1e163174250@gmail.com>
Date: Mon, 21 Dec 2020 22:36:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221205157.31501-2-hongweiz@ami.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Andrew Jeffery <andrew@aj.id.au>, netdev <netdev@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Am 21.12.2020 um 21:51 schrieb Hongwei Zhang:
> Change the order of reading MAC address, try to read it from MAC chip
> first, if it's not availabe, then try to read it from device tree.
> 
This commit message leaves a number of questions. It seems the change
isn't related at all to the change that it's supposed to fix.

- What is the issue that you're trying to fix?
- And what is wrong with the original change?

> Fixes: 35c54922dc97 ("ARM: dts: tacoma: Add reserved memory for ramoops")
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 65cd25372020..9be69cbdab96 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -184,14 +184,7 @@ static void ftgmac100_initial_mac(struct ftgmac100 *priv)
>  	unsigned int l;
>  	void *addr;
>  
> -	addr = device_get_mac_address(priv->dev, mac, ETH_ALEN);
> -	if (addr) {
> -		ether_addr_copy(priv->netdev->dev_addr, mac);
> -		dev_info(priv->dev, "Read MAC address %pM from device tree\n",
> -			 mac);
> -		return;
> -	}
> -
> +	/* Read from Chip if not from chip */

?!?

>  	m = ioread32(priv->base + FTGMAC100_OFFSET_MAC_MADR);
>  	l = ioread32(priv->base + FTGMAC100_OFFSET_MAC_LADR);
>  
> @@ -205,7 +198,18 @@ static void ftgmac100_initial_mac(struct ftgmac100 *priv)
>  	if (is_valid_ether_addr(mac)) {
>  		ether_addr_copy(priv->netdev->dev_addr, mac);
>  		dev_info(priv->dev, "Read MAC address %pM from chip\n", mac);
> -	} else {
> +		return;
> +	}
> +
> +	/* Read from Chip if not from device tree */

Isn't this how it works now?

> +	addr = device_get_mac_address(priv->dev, mac, ETH_ALEN);
> +	if (addr) {
> +		ether_addr_copy(priv->netdev->dev_addr, mac);
> +		dev_info(priv->dev, "Read MAC address %pM from device tree\n",
> +				mac);
> +		return;
> +	}
> +	else {
>  		eth_hw_addr_random(priv->netdev);
>  		dev_info(priv->dev, "Generated random MAC address %pM\n",
>  			 priv->netdev->dev_addr);
> 

