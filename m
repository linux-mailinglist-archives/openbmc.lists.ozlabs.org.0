Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53087248651
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 15:45:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWBxX6THTzDqcH
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 23:45:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=santosh.puranik.ibm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HB4LCYuN; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWBvf660DzDqZk
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 23:43:37 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id mt12so9431313pjb.4
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rEySPxn91jNrWHXManLEZ47x9f/j5tD+xNfCokLeaC8=;
 b=HB4LCYuNys2e7VqBnSf8celnDjWVQBgml/1Behvx8t3XitN74+wgjXMJzIvecDQ+AV
 AT6g9d+gUcOTcL8SxK4+z/9R0/kjOFjfHbYALr6ovMUJl8nrX3m5jM1xlGy/ZtGAWfNA
 rvbLTQduqn+emjvoKU9XZO69a6XCY2EtWgr59odPZWjAkYh7U4ynGwjB376o4Hos3G1p
 IfeTZ9W9c+0rTv6Vnj35B81TGX5TSHMtWbqJBdXwb+KDi2BezVgGhEcAG6/kkilmwWL6
 SP5crmQWfKQCM9l37iPZ8csntoPkPxZqeXEYdcLq6cUwJJE8jhKCC96De8HNS9s2a7s/
 B8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rEySPxn91jNrWHXManLEZ47x9f/j5tD+xNfCokLeaC8=;
 b=jKUcovULh5GFg9ABtRdFLwZPOXAXabXUD0OmBn80TUh6VihL8AhUyBSw6/A2CDKk4I
 DtsvzRFas2XnDv58E97c9mHhcDwkpV40Yd23YVxBl+PBhSbyjQy71KZgDCeqh9K7GUxU
 q/xMNCUAnvKamAg2otcFgCAL6F39Ns+08RCe9CYwKrvfdM/cGNe8tO7p+Z2uke2qcU1Y
 d1odyy7+TwNZOEbvYowEwGCERg6meXqoGq+ezX8Ux9nvzxISr+vdk3DWvq/gjU6Yn7dy
 WGiRishav4Im1WvdJSq6MTXXuZN5EXFwNr9vv+e9ieq8zBrdvNDl1QeQyPxfPeuhi86b
 0tJQ==
X-Gm-Message-State: AOAM531UUhqeC1LNaa4pBgxJ6bTcApSeHYbmwBI7u3WhBjk8RO3NCBVV
 9eNc2IQa8JwM+BjfSC/5C7THoBhfUaU=
X-Google-Smtp-Source: ABdhPJyY3rO4p6SMECVFLYWs0brj6UiGAyUthgLw0H16YtPrpPD5DceWpVZ9xs67YMy/O+012i+L5w==
X-Received: by 2002:a17:90a:2224:: with SMTP id c33mr64958pje.56.1597758213301; 
 Tue, 18 Aug 2020 06:43:33 -0700 (PDT)
Received: from [192.168.1.6] ([49.207.206.140])
 by smtp.gmail.com with ESMTPSA id w15sm53119pjk.13.2020.08.18.06.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 06:43:32 -0700 (PDT)
Subject: Re: [PATCH linux dev-5.7 v1] ARM: dts: aspeed: rainier: Add I2c buses
 for nvme use
To: Jet.Li@ibm.com
References: <20200721115942.27009-1-Jet.Le@ibm.com>
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Message-ID: <16a09d4c-7499-b75d-6bf6-3ec8a0e0d51d@gmail.com>
Date: Tue, 18 Aug 2020 19:13:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721115942.27009-1-Jet.Le@ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jet,

On 7/21/20 5:29 PM, Jet Li wrote:
> From: Jet Li <Jet.Li@ibm.com>
>
> Adding pca9552 exposes the presence detect lines for the cards
> and tca9554 exposes the presence details for the cards.
>
> Signed-off-by: Jet Li <Jet.Li@ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 105 +++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 1ae119a..76a7e82 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -248,6 +248,21 @@
>   		compatible = "atmel,24c64";
>   		reg = <0x51>;
>   	};
> +
> +	tca9554@40 {
> +		compatible = "ti,tca9554";
> +		reg = <0x40>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		smbus0 {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "smbus0";
> +		};
> +	};
> +
This looks incorrect, I don't see such a device on I2C-0 in the system 
workbook.
>   };
>   
>   &i2c1 {
> @@ -562,6 +577,96 @@
>   		compatible = "atmel,24c64";
>   		reg = <0x51>;
>   	};
> +
> +	pca1: pca9552@61 {
> +		compatible = "nxp,pca9552";
> +		reg = <0x61>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio@0 {
> +			reg = <0>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@1 {
> +			reg = <1>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@2 {
> +			reg = <2>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@3 {
> +			reg = <3>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@4 {
> +			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@5 {
> +			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@6 {
> +			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@7 {
> +			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@8 {
> +			reg = <8>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@9 {
> +			reg = <9>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@10 {
> +			reg = <10>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@11 {
> +			reg = <11>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@12 {
> +			reg = <12>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@13 {
> +			reg = <13>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@14 {
> +			reg = <14>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@15 {
> +			reg = <15>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +	};
> +
>   };
>   
>   &i2c9 {
