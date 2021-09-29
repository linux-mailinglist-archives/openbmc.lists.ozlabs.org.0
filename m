Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56641C896
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 17:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKLBL6gnkz2yxT
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 01:38:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UGQmqc3Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UGQmqc3Q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKL9x2jgYz2yHq
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 01:38:12 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TFIXuJ021894; 
 Wed, 29 Sep 2021 11:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ni6fW0e6udKKS09xxpVAxi6YbZN4f06i9VJgZGlNL+o=;
 b=UGQmqc3Qrujy+vHPBI9cxcojAJJSe3ADiTp0mgHqDypQ6QckY8MT0LEtqCvXTXK4HSKX
 C8KSdz5TsaR6FEP/iuDlXiFbXXCC1hKmH8Kl5Uc4aU25QvCQU4eE3klnLqezSMeV657Y
 gbPcSRNFFfbmr8zd8TW7P/WiHssO3RJLIjEFgztFac2sbbI35FbC3TdHWFHjAqfRw6L0
 A4Ic7ZZAz3nJ/IcN7AsIbAtpgwJAD32wmcFQkreOcdLDhwIK8CjHztGHEWNe5+EGC3ti
 pXNFJ/vQSA/X8rnwQeOkATORLo8unrdpkWkNpmINS4ketcjLl1ocXdAD1jR4Mo2HL2RF VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bcspg2f83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 11:38:07 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18TFJUBW025629;
 Wed, 29 Sep 2021 11:38:07 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bcspg2f7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 11:38:07 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18TFI0DU016321;
 Wed, 29 Sep 2021 15:38:06 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3b9udc6c0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 15:38:06 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18TFc5ku28115358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 15:38:05 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77637124052;
 Wed, 29 Sep 2021 15:38:05 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B45D7124058;
 Wed, 29 Sep 2021 15:38:04 +0000 (GMT)
Received: from [9.163.24.144] (unknown [9.163.24.144])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Sep 2021 15:38:04 +0000 (GMT)
Subject: Re: [PATCH v2] hwmon: (pmbus/ibm-cffps) max_power_out swap changes
To: Brandon Wyman <bjwyman@gmail.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210928205051.1222815-1-bjwyman@gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <2a3e0a3c-c256-92e6-7b1f-e80d56ee5b2c@linux.ibm.com>
Date: Wed, 29 Sep 2021 10:38:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928205051.1222815-1-bjwyman@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FJaFGjauPgaFMsF0btOQzpV-JpIOZ3N0
X-Proofpoint-GUID: j6qtbYT6SRxz1Hj-T9E5wORoo20Akb_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_06,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290092
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


On 9/28/21 3:50 PM, Brandon Wyman wrote:
> The bytes for max_power_out from the ibm-cffps devices differ in byte
> order for some power supplies.
>
> The Witherspoon power supply returns the bytes in MSB/LSB order.
>
> The Rainier power supply returns the bytes in LSB/MSB order.
>
> The Witherspoon power supply uses version cffps1. The Rainier power
> supply should use version cffps2. If version is cffps1, swap the bytes
> before output to max_power_out.


Looks fine, thanks Brandon!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Tested:
>      Witherspoon before: 3148. Witherspoon after: 3148.
>      Rainier before: 53255. Rainier after: 2000.
>
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> ---
>   drivers/hwmon/pmbus/ibm-cffps.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index df712ce4b164..79bfcd2749a6 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -171,8 +171,14 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
>   		cmd = CFFPS_SN_CMD;
>   		break;
>   	case CFFPS_DEBUGFS_MAX_POWER_OUT:
> -		rc = i2c_smbus_read_word_swapped(psu->client,
> -						 CFFPS_MAX_POWER_OUT_CMD);
> +		if (cffps1 == psu->version) {
> +			rc = i2c_smbus_read_word_swapped(psu->client,
> +					CFFPS_MAX_POWER_OUT_CMD);
> +		} else {
> +			rc = i2c_smbus_read_word_data(psu->client,
> +					CFFPS_MAX_POWER_OUT_CMD);
> +		}
> +
>   		if (rc < 0)
>   			return rc;
>   
