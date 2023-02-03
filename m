Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C4689E4D
	for <lists+openbmc@lfdr.de>; Fri,  3 Feb 2023 16:28:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7fgV5gqDz3f5b
	for <lists+openbmc@lfdr.de>; Sat,  4 Feb 2023 02:28:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WHEPVmCa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WHEPVmCa;
	dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7ffp6Jdmz3cF8
	for <openbmc@lists.ozlabs.org>; Sat,  4 Feb 2023 02:27:46 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id dt8so4459898oib.0
        for <openbmc@lists.ozlabs.org>; Fri, 03 Feb 2023 07:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXm+hpllSIQNMkNep4ye09yixlp//tAbb+UJfitnNNg=;
        b=WHEPVmCa00Gnj8C4TL8UOv0RbMq+SQukXE8AFuLrLoiFaNOcG0RoH7w0I7chjUm/jV
         26P5Z4ZLpx4pw9b4AEsd5ZyqucNhzVVVPhtBd6WZL5OHbDVWB6/uXMyhsy0lfmj5GJ98
         pwiOAQis2lBF1vx1Yw4SOmzadti+Zt/XAfqVCYA7+tYAzkaG/3+Vo+5nwmzgbN+g2s93
         DqUyAIV8Hsw9oE8aKw67WwViXf5ycf+I90dSlAtnypm/VWhZQ26XQ/kfgXIw2pJrz5SQ
         VUffvHfMJjpGUejKAqUral44kQcHXGKXLa0O/qNf7coFsLQjg5655mhvyqQDIbMBMkgS
         rhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXm+hpllSIQNMkNep4ye09yixlp//tAbb+UJfitnNNg=;
        b=yhWqcSpmvno2SIWyX2C9YQ5haZVYWRazPdQGt9bop1Feu2hCRvVimIJ4jzusvOIPf/
         huezvT0cUeKKFyHZOhfsKh9o7LxnLSb9TZT7ljr+dyTKgBlu1fznjTlbGv5qi80dehCn
         eSxKhx4X6DY96xDI7L44rrF6AIjjdsinkoHr5CKgk62T4Ny3etGOC1z7FfudTtFk0jCp
         1Jr4SvxRZpYaiWasOoUlr6cn6LM3JoD1ZZTRUGjEsSSHGWrLC12QQvvxkPygDJetoD5T
         wPVAc+34WzhJwEvBkihgp8PlLhdi5cg1uO5azW913DS5Bv+0FkmY/41IBe+nCLpw64YW
         DMWQ==
X-Gm-Message-State: AO0yUKVWNhBcCspIgFHV8XZ6MBNQD7wnHmhjaG2DC34fx98vt5g9Bvgh
	44GzndoHHz/jPCuG2stRoO4=
X-Google-Smtp-Source: AK7set8BTQlNl8LupUMlwDcJzmGeNjwThXz0aB9feck/TbWf5mkUKD/M56jKy/7EDzlvp9EP6KFqhg==
X-Received: by 2002:a54:478a:0:b0:37a:2bf0:501b with SMTP id o10-20020a54478a000000b0037a2bf0501bmr2218331oic.9.1675438061155;
        Fri, 03 Feb 2023 07:27:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c187-20020aca35c4000000b003780403286fsm900169oia.26.2023.02.03.07.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 07:27:40 -0800 (PST)
Date: Fri, 3 Feb 2023 07:27:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] hwmon: (peci/cputemp) Fix off-by-one in coretemp_label
 allocation
Message-ID: <20230203152739.GA2507173@roeck-us.net>
References: <20230202021825.21486-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202021825.21486-1-zev@bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jean Delvare <jdelvare@suse.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, linux-kernel@vger.kernel.org, stable@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 01, 2023 at 06:18:25PM -0800, Zev Weiss wrote:
> The find_last_bit() call produces the index of the highest-numbered
> core in core_mask; because cores are numbered from zero, the number of
> elements we need to allocate is one more than that.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Cc: stable@kernel.org # v5.18
> Fixes: bf3608f338e9 ("hwmon: peci: Add cputemp driver")
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/peci/cputemp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index ec9851daf2e8..f13cc4170f58 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -431,7 +431,7 @@ static int create_temp_label(struct peci_cputemp *priv)
>  	unsigned long core_max = find_last_bit(priv->core_mask, CORE_NUMS_MAX);
>  	int i;
>  
> -	priv->coretemp_label = devm_kzalloc(priv->dev, core_max * sizeof(char *), GFP_KERNEL);
> +	priv->coretemp_label = devm_kzalloc(priv->dev, (core_max + 1) * sizeof(char *), GFP_KERNEL);
>  	if (!priv->coretemp_label)
>  		return -ENOMEM;
>  
