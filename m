Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 164CA19B85A
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 00:20:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0yN3ClyzDqPC
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:20:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OPkecaHA; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t0pf1bJvzDrJl
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 09:14:01 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id 22so708712pfa.9
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 15:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EWePZwayQAdSdNHLnkgVAsyAhmFZBbk+akcr+z7OMNY=;
 b=OPkecaHAu1KdP7+Nn2cHZ0LbP750n/zo6uft0kkhOrVsGN8K8DB+Yp8ft4Motrx7Uy
 /HdkfxrJxBCoF9blE3GjCZJw/gKNkLxRIHvNbo8Ouz2yCvPpnTBzAVaCBTeDBJ/qv3v0
 D9tsOLa0+ObCAzsXpu9F+4iLfOs+BmSlt2KW0hmmlyt4NMDRsMX0EstPlgGga1JqcOgv
 wfTqtx1gITvSnJCK6zUA5ghTfoVj57dwRUsEv1EBcdw8G8lflrLT1vsGbdv3d/snNF81
 RRaXXW1K/sja1l+Qre87+cy6lN/WnDnn02J0WOZPB2bEHdjrOnBQbnRIc/Afu5H/TMjL
 2L1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EWePZwayQAdSdNHLnkgVAsyAhmFZBbk+akcr+z7OMNY=;
 b=W70ThwXhZH8/+H5klEKf0iQLtkBdJ/peGpC4xiHCSPpg4JPWSHl0LRb/9uGi30G8zH
 z/IID5pp+LCbdc+1HLWypjNvUi6AQZ4le1MQeI8oD/E6Xe3vh/oJB8CDpEVnadMt2sv9
 LlYE9gE1JIqPReVr3QGfm/WwwO0YDoRyQazjoiGClmBWxh02qVLB5e8MA3Diye673fty
 eQZXQykGWSyx7sp5G28E4MSr4BP/3pQNr5nWAliIiGZOfkT985AEzgDHv4rU4+L3oehM
 SsRQSW6HXz1XrRbQQ+AhcWH0KcX+2sF7G/aAwpcCZ5+okn+9ymp2D9zgSyOKu8S9+v+I
 SxNw==
X-Gm-Message-State: AGi0PuYBpXCwQ9cUInvEYzSORu9NlgxBt0GnFdOZpiTQ8eylZtIHgQXl
 VwqRGUZQOv0wTh+l5hIVKaE=
X-Google-Smtp-Source: APiQypLhgQ6eba9bOhjlQT0/+wgKusuaoCL/UgKu+Ex2gSaUwHye4ZF8Q+tYFtDTNrWZni1rCcSXWg==
X-Received: by 2002:a63:be09:: with SMTP id l9mr312154pgf.439.1585779237098;
 Wed, 01 Apr 2020 15:13:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u3sm2356033pfb.36.2020.04.01.15.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2020 15:13:56 -0700 (PDT)
Subject: Re: [PATCH linux dev-5.4 1/2] hwmon: (pmbus/ibm-cffps) Add another
 PSU CCIN to version detection
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20200401220339.2006-1-eajames@linux.ibm.com>
 <20200401220339.2006-2-eajames@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <fc05a492-f04b-b80d-51a0-52cb793e5c9d@roeck-us.net>
Date: Wed, 1 Apr 2020 15:13:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200401220339.2006-2-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: bjwyman@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/1/20 3:03 PM, Eddie James wrote:
> There is an additional CCIN for the IBM CFFPS that may be classifed as
> either version one or version two, based upon the rest of the bits of
> the CCIN. Add support for it in the version detection.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Link: https://lore.kernel.org/r/1583948590-17220-1-git-send-email-eajames@linux.ibm.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Those e-mails are confusing. Can you drop me from cc:, please ?

Guenter

> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index 27593b723d74..7d3720665ad4 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -33,9 +33,12 @@
>  #define CFFPS_INPUT_HISTORY_CMD			0xD6
>  #define CFFPS_INPUT_HISTORY_SIZE		100
>  
> +#define CFFPS_CCIN_REVISION			GENMASK(7, 0)
> +#define  CFFPS_CCIN_REVISION_LEGACY		 0xde
>  #define CFFPS_CCIN_VERSION			GENMASK(15, 8)
>  #define CFFPS_CCIN_VERSION_1			 0x2b
>  #define CFFPS_CCIN_VERSION_2			 0x2e
> +#define CFFPS_CCIN_VERSION_3			 0x51
>  
>  /* STATUS_MFR_SPECIFIC bits */
>  #define CFFPS_MFR_FAN_FAULT			BIT(0)
> @@ -489,11 +492,14 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  		vs = (enum versions)id->driver_data;
>  
>  	if (vs == cffps_unknown) {
> +		u16 ccin_revision = 0;
>  		u16 ccin_version = CFFPS_CCIN_VERSION_1;
>  		int ccin = i2c_smbus_read_word_swapped(client, CFFPS_CCIN_CMD);
>  
> -		if (ccin > 0)
> +		if (ccin > 0) {
> +			ccin_revision = FIELD_GET(CFFPS_CCIN_REVISION, ccin);
>  			ccin_version = FIELD_GET(CFFPS_CCIN_VERSION, ccin);
> +		}
>  
>  		switch (ccin_version) {
>  		default:
> @@ -503,6 +509,12 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  		case CFFPS_CCIN_VERSION_2:
>  			vs = cffps2;
>  			break;
> +		case CFFPS_CCIN_VERSION_3:
> +			if (ccin_revision == CFFPS_CCIN_REVISION_LEGACY)
> +				vs = cffps1;
> +			else
> +				vs = cffps2;
> +			break;
>  		}
>  
>  		/* Set the client name to include the version number. */
> 

