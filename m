Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE4511671
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 13:54:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpHGQ2plVz3bcl
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 21:54:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PICN4L/b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e;
 helo=mail-oa1-x2e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PICN4L/b; dkim-atps=neutral
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpHG21L4nz2x9X
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 21:53:43 +1000 (AEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e93ff05b23so1637494fac.9
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 04:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lDcZaNu3s46BCfyK8AGIWunVVLL0K103UCBfoUiQuSg=;
 b=PICN4L/bpRW0Ywnxp6EKdRxBPCzwU7brnkiRpdkxe9lXWNaE4lTzPUkUshVAWLTe/N
 oNxKJ15ESYMJ1IWAQj7eAPSMVvhEvW+ZsVAuaZmliL1pg9Jnx9eacqGVfOzvPrUSGWnZ
 UWLb0os8sSiInNnyHiHdtt7bXjtVue/jhqp9gJqzj+wVDBNcExTnCjmpS2i1gW3+DoE5
 nXM6WltKKK1Km8+3wWS1x0YzzPWfDV4y6WWt7BGN2jCv0tjPfkciRgRc1U8l4P3HbEKv
 8auJ3vFVfpc2iLwnPF1l6lZ4znNqDqASmphwBOE9hCmVPRMTMb8uea5nYIYN9Yx0FBae
 pDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=lDcZaNu3s46BCfyK8AGIWunVVLL0K103UCBfoUiQuSg=;
 b=2Wh1vO2lgQwv+X7TOUR1F7zociC4tdRlq1nzLbYwchJafhlE0PNZugJ5RDP4Dq65Uv
 WjxcCUkJb0Q+mr5zZnyUJVERal1HlvnHUuy8qp1WxdsUjiJhtJCGSSJN3w2mEbcnLsyi
 ozbM5VgD8RNgGzHHeGpqmjubMBS87KIvDC/PLd4+4NevNSu9mFD3O5Tc18CppkdwgX6v
 3JMgSwIwZ9luwEbXoeSrX72VU6ynfInpcIqzUiebIEH/xe8nDWtdjKbNffN1pfoCMKoG
 vF4WsRxM+0SG+KGVftc3VkYfwQD4Irc6SMYR74VcGFQz1vN93kK3J7kAOEyLqxNBKq9R
 +6jA==
X-Gm-Message-State: AOAM531hVB/x/Z9NVOy8sLqiymwy2p/WISEeNUY1MDu1eWBHdQ0sXxNd
 xaUV6DXA1m5BIlRGvzfEnCM=
X-Google-Smtp-Source: ABdhPJxqdW1u4b+HYMVRCPgoviFhCC1pBVd4W3nXiChpfznNK9sGQAYLA/Qj8VRLsCahCdXVQ3ARfw==
X-Received: by 2002:a05:6870:6324:b0:e9:16de:4053 with SMTP id
 s36-20020a056870632400b000e916de4053mr8701723oao.164.1651060417408; 
 Wed, 27 Apr 2022 04:53:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a9d73d6000000b006028f49a6fcsm5779329otk.4.2022.04.27.04.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:53:35 -0700 (PDT)
Date: Wed, 27 Apr 2022 04:53:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] hwmon: (pmbus) delta-ahe50dc-fan: work around hardware
 quirk
Message-ID: <20220427115333.GA2686708@roeck-us.net>
References: <20220427035109.3819-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427035109.3819-1-zev@bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 26, 2022 at 08:51:09PM -0700, Zev Weiss wrote:
> CLEAR_FAULTS commands can apparently sometimes trigger catastrophic
> power output glitches on the ahe-50dc, so block them from being sent
> at all.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Cc: stable@vger.kernel.org

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/delta-ahe50dc-fan.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
> index 40dffd9c4cbf..f546f0c12497 100644
> --- a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
> +++ b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
> @@ -14,6 +14,21 @@
>  
>  #define AHE50DC_PMBUS_READ_TEMP4 0xd0
>  
> +static int ahe50dc_fan_write_byte(struct i2c_client *client, int page, u8 value)
> +{
> +	/*
> +	 * The CLEAR_FAULTS operation seems to sometimes (unpredictably, perhaps
> +	 * 5% of the time or so) trigger a problematic phenomenon in which the
> +	 * fan speeds surge momentarily and at least some (perhaps all?) of the
> +	 * system's power outputs experience a glitch.
> +	 *
> +	 * However, according to Delta it should be OK to simply not send any
> +	 * CLEAR_FAULTS commands (the device doesn't seem to be capable of
> +	 * reporting any faults anyway), so just blackhole them unconditionally.
> +	 */
> +	return value == PMBUS_CLEAR_FAULTS ? -EOPNOTSUPP : -ENODATA;
> +}
> +
>  static int ahe50dc_fan_read_word_data(struct i2c_client *client, int page, int phase, int reg)
>  {
>  	/* temp1 in (virtual) page 1 is remapped to mfr-specific temp4 */
> @@ -68,6 +83,7 @@ static struct pmbus_driver_info ahe50dc_fan_info = {
>  		PMBUS_HAVE_VIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_FAN34 |
>  		PMBUS_HAVE_STATUS_FAN12 | PMBUS_HAVE_STATUS_FAN34 | PMBUS_PAGE_VIRTUAL,
>  	.func[1] = PMBUS_HAVE_TEMP | PMBUS_PAGE_VIRTUAL,
> +	.write_byte = ahe50dc_fan_write_byte,
>  	.read_word_data = ahe50dc_fan_read_word_data,
>  };
>  
