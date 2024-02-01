Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B746F8452F5
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 09:42:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQXTx5FBpz3cTh
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 19:42:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 556 seconds by postgrey-1.37 at boromir; Thu, 01 Feb 2024 19:42:28 AEDT
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQXTc0S4jz3bpN
	for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2024 19:42:27 +1100 (AEDT)
Received: from [192.168.0.6] (ip5f5af685.dynamic.kabel-deutschland.de [95.90.246.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A49C361E5FE01;
	Thu,  1 Feb 2024 09:32:54 +0100 (CET)
Message-ID: <bdb25a54-11c8-4925-9169-cb1a2ac18d93@molgen.mpg.de>
Date: Thu, 1 Feb 2024 09:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: iio: pressure: dps310: Fix failure to read
 negative numbers
Content-Language: en-US
To: George Liu <liuxiwei1013@gmail.com>
References: <20240201082519.192861-1-liuxiwei@ieisystem.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240201082519.192861-1-liuxiwei@ieisystem.com>
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear George,


Thank you for your patch.


Am 01.02.24 um 09:25 schrieb George Liu:
> The dps310 chip driver fails to read the temperature when the
> temperature reaches below zero.

Stating, how you fixed this would also be nice.

How did you test this?

> Signed-off-by: George Liu <liuxiwei@ieisystem.com>
> ---
>   drivers/iio/pressure/dps310.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
> index 1ff091b2f764..fcbfdc5e85b7 100644
> --- a/drivers/iio/pressure/dps310.c
> +++ b/drivers/iio/pressure/dps310.c
> @@ -730,7 +730,7 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
>   	}
>   }
>   
> -static int dps310_calculate_temp(struct dps310_data *data)
> +static int dps310_calculate_temp(struct dps310_data *data, int *val)
>   {
>   	s64 c0;
>   	s64 t;
> @@ -746,7 +746,9 @@ static int dps310_calculate_temp(struct dps310_data *data)
>   	t = c0 + ((s64)data->temp_raw * (s64)data->c1);
>   
>   	/* Convert to milliCelsius and scale the temperature */
> -	return (int)div_s64(t * 1000LL, kt);
> +	*val = (int)div_s64(t * 1000LL, kt);
> +
> +	return 0;
>   }

This works, because `dps310_get_temp_k` returns the temperature in 
Kelvin which cannot be negative?

     static int dps310_get_temp_k(struct dps310_data *data)
     {
             int rc = dps310_get_temp_precision(data);

             if (rc < 0)
                     return rc;

             return scale_factors[ilog2(rc)];
     }


Kind regards,

Paul

>   static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
> @@ -768,11 +770,10 @@ static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
>   		if (rc)
>   			return rc;
>   
> -		rc = dps310_calculate_temp(data);
> +		rc = dps310_calculate_temp(data, val);
>   		if (rc < 0)
>   			return rc;
>   
> -		*val = rc;
>   		return IIO_VAL_INT;
>   
>   	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
