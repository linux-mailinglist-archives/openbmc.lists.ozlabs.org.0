Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C78163E9640
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 18:43:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFxS54pWz3g0s
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 02:43:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EMNjTrPR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EMNjTrPR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlFJ65B4wz3fJf
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 02:14:14 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BG7rgO051905; Wed, 11 Aug 2021 12:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XLd3Omx12xKM71lvLLvrfANtad/zqBJLjf1sneazQ8Q=;
 b=EMNjTrPRxLwxa5yWTY5b9jwZPkTdCW/8AFvZlwdR0wTSIlGxGL4C4PR+2nA7MIgqgcUC
 jdKpAVDsrNZljYv2mfaJWkravbdERdrWlvC7CMCSYKWl2fLWun+7jV+6+xvwz9XE4URS
 ETinuuP6tJKOLvhWNClV4C8grEA1Ex056BO42/1YD+GSfyJX4rE+zb7bnnrzQchziFjv
 Lno7UdSW7lcKrgX2gkASnfBSKzzHuYQCcs1yxvv8lOaLEMd+T68VsS3CbLZsQeyhrAiD
 /c9L1/NMZKXmjA77RERnHfXasLiCFlvoeoBHnaQv/VNZKe7rvBWGcqyzo6Sex/IwZCq3 0Q== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abvteq67n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 12:14:09 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BGDcd1024016;
 Wed, 11 Aug 2021 16:14:07 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3a9htdfrsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 16:14:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BGE73H38339002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 16:14:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10B6BAC068;
 Wed, 11 Aug 2021 16:14:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83947AC05F;
 Wed, 11 Aug 2021 16:14:06 +0000 (GMT)
Received: from [9.65.107.65] (unknown [9.65.107.65])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 16:14:06 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.10 07/14] pmbus: (max31785) Retry enabling
 fans after writing MFR_FAN_CONFIG
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20210811154232.12649-1-eajames@linux.ibm.com>
 <20210811154232.12649-8-eajames@linux.ibm.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <05567b62-89f2-b743-1f6a-500a99275cfb@linux.ibm.com>
Date: Wed, 11 Aug 2021 11:14:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811154232.12649-8-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vZF3dFdZ99oTTplK_3y5MemNaRDhVfp9
X-Proofpoint-ORIG-GUID: vZF3dFdZ99oTTplK_3y5MemNaRDhVfp9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110108
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/11/21 10:42 AM, Eddie James wrote:
> From: Andrew Jeffery <andrew@aj.id.au>
>
> It has been observed across large fleets of systems that a small subset
> of those systems occasionally loose control of some number of fans
> across a BMC reboot (their hwmon fan attributes are missing from sysfs).
>
> >From extensive testing and tracing it was discovered that writes
> enabling a fan in FAN_CONFIG_1_2 failed to stick on the system under
> test with a frequency of about 1 in 1000 re-binds of the driver.
>
> The MAX31785 datasheet recommends in the documentation for
> MFR_FAN_CONFIG that the asssociated fan(s) be disabled before updating
> the register. The sequence in question implements this suggestion, and
> the observed loss-of-fans symptom occurs when the write to re-enable the
> fan in FAN_CONFIG_1_2 fails to stick.
>
> The trace data suggests a one-shot retry is enough to successfully
> update FAN_CONFIG_1_2. With the workaround, no loss of fans was observed
> in over 20,000 consecutive rebinds of the driver.
>
> OpenBMC-Staging-Count: 1
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Matthew Barth <msbarth@linux.ibm.com>
> ---
>  drivers/hwmon/pmbus/max31785.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 7518fff356f9..b37da2ec1ce4 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -398,6 +398,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
>  	u32 page;
>  	u32 uval;
>  	int ret;
> +	int i;
>  
>  	if (!of_device_is_compatible(child, "pmbus-fan"))
>  		return 0;
> @@ -574,10 +575,24 @@ static int max31785_of_fan_config(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
> -						 pb_cfg);
> -	if (ret < 0)
> -		return ret;
> +	for (i = 0; i < 2; i++) {
> +		ret = max31785_i2c_smbus_write_byte_data(client,
> +							 PMBUS_FAN_CONFIG_12,
> +							 pb_cfg);
> +		if (ret < 0)
> +			continue;
> +
> +		ret = max31785_i2c_smbus_read_byte_data(client,
> +							PMBUS_FAN_CONFIG_12);
> +		if (ret < 0)
> +			continue;
> +
> +		if (ret == pb_cfg)
> +			break;
> +	}
> +
> +	if (i == 2)
> +		return -EIO;
>  
>  	/*
>  	 * Fans are on pages 0 - 5. If the page property of a fan node is
