Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B142861A
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 07:06:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSRb23gHZz2ybL
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 16:06:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C+zkVLwQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=C+zkVLwQ; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQyGj0fwjz301s
 for <openbmc@lists.ozlabs.org>; Sat,  9 Oct 2021 06:01:48 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id b16so10461860qtt.7
 for <openbmc@lists.ozlabs.org>; Fri, 08 Oct 2021 12:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xew2Cqp055SEboMYSD4xaomAE75lVTjIUs6xXR179/0=;
 b=C+zkVLwQ561jKCx3zhQEnbk8TmUmArvKZwuTu4o6hFVYBf50l6nH4eFXzxeT6ckUFG
 iCT7GRokfADm3mNb1neAQNsX8B+bhJQe3zQAv/kVlJe6lq/GOCY/0zCqZMG/JLnZx84+
 QTJGxJARW6YfYHxWtL1p6VQgRNDqyww+1GGeqigEy+zt+NntIzIhypf3jsCXtUyhCXQY
 JXRo/4T++xB6+pLKViUSF1mz7D37WsgOLsf2/WFzq51e8PYFd32ltlPrTQ3Fq4ORQ8zk
 DiSu2vcdV9MIj6pwSf2XDvgtd7/eGnvA34XGuLQxsdeFv8D7XsXVRwNAysOAKAMTr0+8
 WhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xew2Cqp055SEboMYSD4xaomAE75lVTjIUs6xXR179/0=;
 b=FHRvBiFuIHnRCGRczaJShHL2u+zwFeTq/xCuQr/nzhCfBGzzshylh6SbyX+D8TGzea
 hzzXImYpjtYKE5amt+FxQ5MboXLCn1UKAY0/iKPsafk3G0AWl2+9A2TFxCjbxvrF7BHW
 QcS6mcLJMfCLxJjUY10S1HiK4D757exT1yM6qTzSWmkutYNo2WjN8pPnpiB1+pB7volv
 moSwmtIZJAKCfb2Oc/CFB9uec+JROaltqo+s+APQFjcXvZZWgmUVwvMmGGU8WVywUYKN
 Iuahx6rASSJ2U4Ny1VHA1vVNfg0YtiaWbCxGuAUK53eOfrhqBfRnBiKZ42BRUqKuR0QT
 FqJw==
X-Gm-Message-State: AOAM5338rBN4JIdKZjEQwlUSHUNHXnYtvZnYsoDEY6uyGFCXYkFxqAS+
 sLuqjl9Eia0lS/SEh1ihikU=
X-Google-Smtp-Source: ABdhPJwzquROKMLegjco20qGn59bJ5syteqkBCE5kUqtvcwMyaDc2geIlDVH3Sdsrj2dMslo6mBkrQ==
X-Received: by 2002:ac8:5e51:: with SMTP id i17mr19299qtx.339.1633719704376;
 Fri, 08 Oct 2021 12:01:44 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net.
 [67.187.90.124])
 by smtp.gmail.com with ESMTPSA id f15sm101193qtf.66.2021.10.08.12.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 12:01:44 -0700 (PDT)
Subject: Re: [PATCH 7/9] of: make OF_DYNAMIC selectable independently of
 OF_UNITTEST
To: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <20211007000954.30621-8-zev@bewilderbeest.net>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <288e4900-c23c-56ee-5c23-9a51cd3f315e@gmail.com>
Date: Fri, 8 Oct 2021 14:01:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007000954.30621-8-zev@bewilderbeest.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 11 Oct 2021 16:05:05 +1100
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/6/21 7:09 PM, Zev Weiss wrote:
> The writable status sysfs file enabled by the 'dynamic' DT property
> requires CONFIG_OF_DYNAMIC to be useful, but that shouldn't require
> dragging in CONFIG_OF_UNITTEST as well.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/of/Kconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 3dfeae8912df..8e0ba87db030 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -55,12 +55,14 @@ config OF_KOBJ
>  # Hardly any platforms need this.  It is safe to select, but only do so if you
>  # need it.
>  config OF_DYNAMIC
> -	bool "Support for dynamic device trees" if OF_UNITTEST
> +	bool "Support for dynamic device trees"
>  	select OF_KOBJ
>  	help
>  	  On some platforms, the device tree can be manipulated at runtime.
> -	  While this option is selected automatically on such platforms, you
> -	  can enable it manually to improve device tree unit test coverage.
> +	  With this option enabled, device tree nodes that are marked with
> +	  the "dynamic" property can have their status toggled between
> +	  "okay" and "reserved" via sysfs.  This can also be enabled to
> +	  increase test coverage with CONFIG_OF_UNITTEST if desired.
>  
>  config OF_ADDRESS
>  	def_bool y
> 

The help message should be extended to explain the impact of enabling
OF_DYNAMIC manually (as opposed to auto selected) - it will be to
allow writes to a node's "status" property in sysfs if the node contains
a true value for the "dynamic" property.
