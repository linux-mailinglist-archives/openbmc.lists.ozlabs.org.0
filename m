Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6978F2C363D
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 02:31:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgjyl38xpzDqWh
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 12:31:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sxDho5Lp; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgjxq2px6zDqWR
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 12:30:18 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id q22so1596376qkq.6
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 17:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=mqCgPJhFcU3RCQh2YBCYKNOFFV+XSZP1KATpOOoq5aI=;
 b=sxDho5LpQDyTzLOM+wseh89L3TVY9lJ3nSopGQ011kp8Px0nbmqFuJbXPADvefNMYQ
 GNQMpYfqNv/8O6n/sj5nDS21n6ONogOg8xq91fZ7vZQIjWBO93t6pyadBlCcHgZytlvz
 Ch0oTs/sRstsWFvvhtcDq8xVfBgNVW+/hJ10YotLpLZaZ9ddc84K6NfZC8P7s2flChgK
 /o2XcJKvDnrT4+W1cjitDgyG4QDi/jwEYf5kkn/rCRvGhdj49Ml7NvLfThcpooRaq5ZT
 YvQMFJxVspp3jxb96slWt3fybn4YWvhTBEy6v6wDArjYnhFm+mRugWZn2D1sUL7P7B/f
 Ys0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mqCgPJhFcU3RCQh2YBCYKNOFFV+XSZP1KATpOOoq5aI=;
 b=ajdHun9anWqhrSzQsAfW+ZW0VFwJOU9xkkrOzuZPGYs74ycLb0tvcLBGnIX0GJsqtz
 j9xyhn28XyPh1TQx7JpSJTgPZ6QIity1rih7T9F0PPWkFiLyF4/tr+eCiFS8NNMwkSAN
 Wa+bavv0MOTP+TIwPZPtRGj6Tr6xA2zyJbbfOX683b9rY6h6ak13buAwsBlFcCA+els2
 JkUjIYJ+oXgsXmHrGeQNTClxxIBCjkgUm+wz4cULn5OQKTm/pe0OzXidMVzdnCi6xPPM
 U2qxMT50BwlgrHITczATrljWsXCF77BOiWvi1cBSVZgNSZLKnzqwwf1KFHicLk1kfBKZ
 8cDg==
X-Gm-Message-State: AOAM5310njVAXRx1vtuExs9/Go7//hq6QaKedXnN0UjkKyDM4ovjDkpj
 7836/NATrwyD4HpYNip9HOOzVBzwRD2cAg==
X-Google-Smtp-Source: ABdhPJy7rMOimB9S3Bj52fV8SRDSNGIx1l9efz6/dZqcRd8DWpq2c3vKKgH5As8egZpPMb4lB7aYcw==
X-Received: by 2002:a05:620a:15db:: with SMTP id
 o27mr1127866qkm.21.1606267814661; 
 Tue, 24 Nov 2020 17:30:14 -0800 (PST)
Received: from [192.168.4.31] (199-48-94-80.rochmnaa.metronetinc.net.
 [199.48.94.80])
 by smtp.gmail.com with ESMTPSA id t63sm968763qka.128.2020.11.24.17.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 17:30:13 -0800 (PST)
Subject: Re: [PATCH linux dev-5.8] ARM: dts: aspeed: rainier: Add
 gpio-keys-polled for fans
To: Matthew Barth <msbarth@linux.ibm.com>, eajames@linux.ibm.com,
 openbmc@lists.ozlabs.org, joel@jms.id.au
References: <20201125011640.2346086-1-msbarth@linux.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <84bbd720-610c-2e29-fe53-6490708b9d6c@gmail.com>
Date: Tue, 24 Nov 2020 19:30:12 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125011640.2346086-1-msbarth@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2020-11-24 19:16, Matthew Barth wrote:
> Add a gpio-keys-polled section for the fan presence signals from the
> PCA9552 on i2c bus 7.
Reviewed-by: Brandon Wyman <bjwyman@gmail.com>
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 43 ++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 4692c5e8f919..e83355b8e13a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -96,6 +96,49 @@ ps3-presence {
>   		};
>   	};
>   
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <1000>;
> +
> +		fan0-presence {
> +			label = "fan0-presence";
> +			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <6>;
> +		};
> +
> +		fan1-presence {
> +			label = "fan1-presence";
> +			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <7>;
> +		};
> +
> +		fan2-presence {
> +			label = "fan2-presence";
> +			gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
> +			linux,code = <8>;
> +		};
> +
> +		fan3-presence {
> +			label = "fan3-presence";
> +			gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
> +			linux,code = <9>;
> +		};
> +
> +		fan4-presence {
> +			label = "fan4-presence";
> +			gpios = <&pca0 10 GPIO_ACTIVE_LOW>;
> +			linux,code = <10>;
> +		};
> +
> +		fan5-presence {
> +			label = "fan5-presence";
> +			gpios = <&pca0 11 GPIO_ACTIVE_LOW>;
> +			linux,code = <11>;
> +		};
> +	};
> +
>   	i2c2mux: i2cmux {
>   		compatible = "i2c-mux-gpio";
>   		#address-cells = <1>;
