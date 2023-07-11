Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3876C74F884
	for <lists+openbmc@lfdr.de>; Tue, 11 Jul 2023 21:46:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=A6qtKSvB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0rwd0n70z3c01
	for <lists+openbmc@lfdr.de>; Wed, 12 Jul 2023 05:46:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=A6qtKSvB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0rvz5CLWz2y9d
	for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2023 05:46:06 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-579de633419so67413527b3.3
        for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689104762; x=1691696762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Vbgm71YcKlV+YwM9EntZJb3Xj8SWJ9W9vOrlGUOSBzc=;
        b=A6qtKSvB/9gZX9OW2mjIz4SJhhtmErMvXPNYWQwDrtRLwW+lNP+W7vVdrgX+FfAv5d
         iKNIb1UC6oWO5dxM5vLnPmE5dzPjR43cOJOBKFyNWY7AlF6eLUJWp0hDqMuR9/cCZei7
         4q+tdVDauiBjXl9N9G6IwCechUfmG6atpiJMl7kIcRQ20Azf3Dzye1gdaEAD/aY3xyYw
         PqpRQCN4zYeCk8OrgrY2d+rfaq65uIFZY1z8Q1XnB9hqBVu2Yh+MJaYu7GiX98hY8smI
         i6c3MdO6OR9kcCxzMyHvXZQYp0nnaj4IcQZpkBTFW4m5kCQdqqFf+Xo2oZT+H7nfi3jo
         6SHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689104762; x=1691696762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vbgm71YcKlV+YwM9EntZJb3Xj8SWJ9W9vOrlGUOSBzc=;
        b=Tppsp8Br1Od9mE02Us3Msyo+LpuYHUDXxiNjDd0urp75CAhPr01jdcDR/BJMFR0BIF
         SMcXZz5Qtc5FE+FCZ7+ZrpfXI2vwCfM3jp5f6qycpOmDBD97Fh2Ozf8oDDutG7zj5nSH
         fHdQL0awzyiZ67ACMoYhUFn2n1y8DjGcl/4RTL2VL+TxiqrBqX1ynEvhWqk8EBxY+W3S
         Dki0rHnUNzv7xW+8K0cWV9ZnoVIL1gTDsn8AAreV4l7t1v3fEvf4mN5mRREmCa5vFEsL
         6finStU+Gh/U27y7JZqI06q/FaA9WPuuDO38lWbVcCeOT2YmYto2Np0mWZRL1va58TAB
         aFAQ==
X-Gm-Message-State: ABy/qLaHsQ0zLi6y1Zpu6isoo3qvxHqxxxU14kBwuBnNZOBK1+XOTSuR
	zYAQFY01Tmau8Ovhi0VxwPQ=
X-Google-Smtp-Source: APBJJlFWE1ggzUUM93UXB866EFOMNtcYY422yc1ghyjfHPxS+R2NG4Spv2ULbXsNOWRfYCDb4knbMQ==
X-Received: by 2002:a0d:de06:0:b0:56d:de2:94d1 with SMTP id h6-20020a0dde06000000b0056d0de294d1mr16935452ywe.24.1689104761836;
        Tue, 11 Jul 2023 12:46:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m67-20020a0dfc46000000b00579e8c7e478sm750195ywf.43.2023.07.11.12.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 12:46:01 -0700 (PDT)
Message-ID: <36752432-52e7-22e1-a2de-332749aa15a1@roeck-us.net>
Date: Tue, 11 Jul 2023 12:45:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] peci: Add Intel Sapphire Rapids support
Content-Language: en-US
To: Naresh Solanki <naresh.solanki@9elements.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 iwona.winiarska@intel.com, jdelvare@suse.com
References: <20230711160452.818914-1-Naresh.Solanki@9elements.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230711160452.818914-1-Naresh.Solanki@9elements.com>
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
Cc: openbmc@lists.ozlabs.org, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/11/23 09:04, Naresh Solanki wrote:
> Add support for detection of Intel Sapphire Rapids processor based on
> CPU family & model.
> 
> Sapphire Rapids Xeon processors with the family set to 6 and the
> model set to INTEL_FAM6_SAPPHIRERAPIDS_X. The data field for this entry
> is "spr".
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>

Please version your patches and provide change logs.

Guenter

> ---
>   drivers/peci/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
> index de4a7b3e5966..3668a908d259 100644
> --- a/drivers/peci/cpu.c
> +++ b/drivers/peci/cpu.c
> @@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
>   		.model	= INTEL_FAM6_ICELAKE_X,
>   		.data	= "icx",
>   	},
> +	{ /* Sapphire Rapids Xeon */
> +		.family	= 6,
> +		.model	= INTEL_FAM6_SAPPHIRERAPIDS_X,
> +		.data	= "spr",
> +	},
>   	{ /* Icelake Xeon D */
>   		.family	= 6,
>   		.model	= INTEL_FAM6_ICELAKE_D,
> 
> base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b

