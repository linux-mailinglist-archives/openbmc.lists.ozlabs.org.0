Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A10C5420A0
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 03:14:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHq4b0B2vz3bmD
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 11:14:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MCDZPQAJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MCDZPQAJ;
	dkim-atps=neutral
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHq475Mc6z2xm1
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 11:13:42 +1000 (AEST)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-fb6b4da1dfso7427201fac.4
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2022 18:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=kBIySTAJjbizEz0lOsKHr+uK6tOPrCBwD+VayVTxzQ4=;
        b=MCDZPQAJ1bc7E7TWI/TddSwSc40DI04iu6X924AaRYf5W/F3LaTHb1YGDUMVwF6jLB
         ZKf7oqSVm2WMQF7YCqd4Tmnr8/v/LpJCj+LwdLJJlNlDBGf/lJC7lawn8zW+zza1/tts
         W4tY98XaiC6q/vJVCmP8Qu/a7kW9qWM5kPgTUdlsdXIvKtkSzDFJmf/+wvBS3NNCsIZn
         YYkjG27Bl3tXJM9E/ZzFX9oTppKe6efxyqGhPEUod94Z/ySYv4MWzA57ttEcscvjMwin
         cOsDCijtZo+aW1NE1ZF6DDFO31qv5M7LQZwMAg3kjWj84R1xyLHfLJr+IvVphiVIt12f
         Kj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=kBIySTAJjbizEz0lOsKHr+uK6tOPrCBwD+VayVTxzQ4=;
        b=m7tk1m4BR5tbYHazZ56SJk1epIA3RvcDwrIgQCv2oQNBlrlZjpvoRDi9Ql76UnKgtU
         NOz97PU85YA41A+PugDMq/7fC6jUsiuohvbKzPJIHg8Rp0Ecl2kn8/XDl0dpbKxkVgjn
         O5ojgxMQM6LwcUaLKjsdThcxUS5aJg2jHbd70zQGBA3OjqaANQKxX9N37g/h4BGv/nik
         8PHcEiw1uhTgAtpRlht6wMKIj2Sivdy8BuSqU40pDxi6owIWxP9NEQ4GAADEcxi6HPeo
         ASu61RDElcFa/l506iuMe4S7vzDKEz+EHdq/qAZFt+3BoGfeMAXj2ghla4lX9RdGo3NV
         MlDQ==
X-Gm-Message-State: AOAM532LBY1lUuU9VRY062hjPeVflXv+PrcX24fbZ0vsaNC2xoCpW7m6
	AYRpxz71vo86RX29jWB4q/k=
X-Google-Smtp-Source: ABdhPJxdWG4xXsD6AUUk8HYb3a1sp2KVyaroExaee8tgvUl2jx/z7X5ur0NHy3KnHqe+lWN8b8BGAw==
X-Received: by 2002:a05:6870:f2a9:b0:f2:c0bc:411d with SMTP id u41-20020a056870f2a900b000f2c0bc411dmr990648oap.239.1654650814848;
        Tue, 07 Jun 2022 18:13:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m8-20020a0568080f0800b00325cda1ff94sm11165785oiw.19.2022.06.07.18.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 18:13:34 -0700 (PDT)
Message-ID: <cf1a2ff9-59b3-fb2d-62fd-bdeac57bb9c0@roeck-us.net>
Date: Tue, 7 Jun 2022 18:13:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Jim Wright <wrightj@linux.ibm.com>, linux-hwmon@vger.kernel.org,
 joel@jms.id.au, openbmc@lists.ozlabs.org
References: <20220607205306.145636-1-wrightj@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (ucd9000) Add voltage monitor types
In-Reply-To: <20220607205306.145636-1-wrightj@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/7/22 13:53, Jim Wright wrote:
> The UCD90240 and UCD90320 devices support monitor types "Input Voltage",
> "Voltage With AVS", and "Input Voltage With AVS", add support to driver
> to recognize these types as voltage monitors.
> 
> Signed-off-by: Jim Wright <wrightj@linux.ibm.com>
> ---
>   drivers/hwmon/pmbus/ucd9000.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index 75fc770c9e40..28cc214d4d6b 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -45,6 +45,9 @@ enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
>   #define UCD9000_MON_TEMPERATURE	2
>   #define UCD9000_MON_CURRENT	3
>   #define UCD9000_MON_VOLTAGE_HW	4
> +#define UCD9000_MON_INPUT_VOLTAGE	5
> +#define UCD9000_MON_VOLTAGE_AVS	6
> +#define UCD9000_MON_INPUT_VOLTAGE_AVS	7
>   
>   #define UCD9000_NUM_FAN		4
>   
> @@ -566,6 +569,9 @@ static int ucd9000_probe(struct i2c_client *client)
>   		switch (UCD9000_MON_TYPE(block_buffer[i])) {
>   		case UCD9000_MON_VOLTAGE:
>   		case UCD9000_MON_VOLTAGE_HW:
> +		case UCD9000_MON_INPUT_VOLTAGE:
> +		case UCD9000_MON_VOLTAGE_AVS:
> +		case UCD9000_MON_INPUT_VOLTAGE_AVS:
>   			info->func[page] |= PMBUS_HAVE_VOUT
>   			  | PMBUS_HAVE_STATUS_VOUT;
>   			break;

I don't think it makes sense to claim VOUT support if the chip is
configured to monitor input voltages. This should probably be something
like

...
 > +		case UCD9000_MON_VOLTAGE_AVS:
 >   			info->func[page] |= PMBUS_HAVE_VOUT
 >   			  | PMBUS_HAVE_STATUS_VOUT;
 >   			break;
		case UCD9000_MON_INPUT_VOLTAGE:
		case UCD9000_MON_INPUT_VOLTAGE_AVS:
			info->func[page] |= PMBUS_HAVE_VIN;
  			break;

with appropriate mapping code to map the READ_VIN command for the
affected pages to READ_VOUT. Question is if the limit registers on
those pages are also reporting the limits using the vout limit
commands; if so, those should be mapped as well.

Guenter
