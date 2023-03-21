Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED95B6C348E
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 15:43:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgvTx4q1jz3ccg
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 01:43:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P14fjCC8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P14fjCC8;
	dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgvTN4Xqbz3cD2
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 01:42:30 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id y85so981286iof.13
        for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679409746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mPHZAJ/4f0K+ZrgW1eaRgvJAnV5woW5J9CiZAelkEY=;
        b=P14fjCC8K0ZFXG1N71qzuKysqhqk2D1T4ohhzGYNupPn5JlcVbouPXVpZVHGW9LmoK
         QY51Dyk7sDTbnnULZT4+m4OeZJkjVHy4nBpZb0sESfSNN+s77TP2bJrfM6011w+7KHzh
         EJBBWpIm6iMx5LsBMRhVxh33ermcGREAJuLTxPm4aOxxXzAABqJFOD0A518OXgaGZdpG
         +3DCBtb7CCWvH2gkamobNaYXqJzm+8S1Grm4PyxjUyZApyAd0IqxJ8rIZbFERkpOWwnY
         9IRk25V2+uyhB3AFmObiZcKF5ozcuXJnbFsyBbQMvP2laBeaq4UC0mT8DXXV0h3WlyG0
         pbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679409746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mPHZAJ/4f0K+ZrgW1eaRgvJAnV5woW5J9CiZAelkEY=;
        b=ZW/93YlzH2kR2K/ZLNLp/XPGkKCqOo0Afj8ZbSrEERzIIA0aCon3lCJ0T3FIGr41kJ
         rwC13FDwPNdLdjJQhc7FKeOoWzYK2gGy39WZUeLTWYheYRq/j59L2Y1ZOuBL+Jdga40Y
         JPjpNlyACWWhUg2Pzn+uuc6bGNNhvsETM5klhd+TY875DLbDVZHT/bP1AuVV4d3zIHGj
         Cm0/7R862WQmnJFaxz/wGOjKJvqE4E85+D2cqiYunvX4Qhf1XsNMjt/gTDJ/LeIk3o3E
         U8hOmogXg7bRy0n3ALJw+tTpk/vmlRtgzBUJ2QuV8HU2ryJvpIR3MAAXwPNJb4lda/xv
         P3Ew==
X-Gm-Message-State: AO0yUKXODxP7dCvFwY+O+H4ASi3OP+tUNb5Xs5IJ0P9roxmj6EZJ9PWW
	Hhw6sqzdYPla6jmtbcN1FjY=
X-Google-Smtp-Source: AK7set8NNKp5yKnKnglKuRwfSaTDCAz9jQ2kweLIW2szz/T8DYHrBJehsD3eLsAHBfa+gLUD5CqpWQ==
X-Received: by 2002:a5d:8550:0:b0:74c:da4b:c4e4 with SMTP id b16-20020a5d8550000000b0074cda4bc4e4mr1807054ios.3.1679409746016;
        Tue, 21 Mar 2023 07:42:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p15-20020a056638216f00b00403089c2a1dsm4246541jak.108.2023.03.21.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:42:25 -0700 (PDT)
Date: Tue, 21 Mar 2023 07:42:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH] hwmon: (peci/cputemp) Fix miscalculated DTS for SKX
Message-ID: <d30ea7f5-7b47-474f-8208-a87d0b2e1394@roeck-us.net>
References: <20230321090410.866766-1-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321090410.866766-1-iwona.winiarska@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Paul Fertser <fercerpav@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 21, 2023 at 10:04:10AM +0100, Iwona Winiarska wrote:
> For Skylake, DTS temperature of the CPU is reported in S10.6 format
> instead of S8.8.
> 
> Reported-by: Paul Fertser <fercerpav@gmail.com>
> Link: https://lore.kernel.org/lkml/ZBhHS7v+98NK56is@home.paul.comp/
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/peci/cputemp.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index 30850a479f61..87d56f0fc888 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -537,6 +537,12 @@ static const struct cpu_info cpu_hsx = {
>  	.thermal_margin_to_millidegree = &dts_eight_dot_eight_to_millidegree,
>  };
>  
> +static const struct cpu_info cpu_skx = {
> +	.reg		= &resolved_cores_reg_hsx,
> +	.min_peci_revision = 0x33,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
> +
>  static const struct cpu_info cpu_icx = {
>  	.reg		= &resolved_cores_reg_icx,
>  	.min_peci_revision = 0x40,
> @@ -558,7 +564,7 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
>  	},
>  	{
>  		.name = "peci_cpu.cputemp.skx",
> -		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +		.driver_data = (kernel_ulong_t)&cpu_skx,
>  	},
>  	{
>  		.name = "peci_cpu.cputemp.icx",
