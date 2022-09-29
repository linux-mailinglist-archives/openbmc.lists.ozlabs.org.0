Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A85EFEB7
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 22:37:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdlXq113Mz3c2q
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 06:37:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZMi6SwK8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZMi6SwK8;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdlXN0200z2yT0
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 06:37:07 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TKVkXh001283;
	Thu, 29 Sep 2022 20:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=t/KRCAiNWGphrGWAEqwN29srVxoZRf3ojozpikldDls=;
 b=ZMi6SwK8aH+t06ftNKmfr3O6ZtEL9GHPv+/nOY7GAYANl9wPTPYxhdCNdQ0hr0Ya5itR
 g7gDcWrYeCPm7T8JWtZl2GVhbiC/3vVo/3uRViGp+6KyTUTeus4ysVab6IwR4He4pDdJ
 WhTg8nlI1JG8fMArYZY9H4aBr+pAxQFnUR0xQMVD3xsqt8hiN9Mt++QDvfIP9wD11iOm
 0OZ67phV7Kg8CEfF157JD6CUZc0Iozh/eiwfybz+ojEopvVsgRvdkg7VUgh9W24OGdIa
 Q8GY/KgkBrZyIajc+BUpJY0nwkMo3tb2nf5f6ZH1IFy7NXdG5RKurahhJ2CA7PBTHJA1 Hw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwjfsg67b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 20:36:58 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28TKaZoo010482;
	Thu, 29 Sep 2022 20:36:57 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma04wdc.us.ibm.com with ESMTP id 3jssh9vegh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 20:36:57 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28TKatt444237134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Sep 2022 20:36:56 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5923C58058;
	Thu, 29 Sep 2022 20:36:56 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E88FD58057;
	Thu, 29 Sep 2022 20:36:55 +0000 (GMT)
Received: from [9.77.146.111] (unknown [9.77.146.111])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Sep 2022 20:36:55 +0000 (GMT)
Message-ID: <affe95f4-1313-db61-23f9-e01b4a9842a7@linux.ibm.com>
Date: Thu, 29 Sep 2022 15:36:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH linux dev-5.15] leds: pca955x: Fix
 i2c_smbus_read_i2c_block_data return code check
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <20220929191848.247164-1-eajames@linux.ibm.com>
 <YzYA9MoKr8BwSpJx@heinlein>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <YzYA9MoKr8BwSpJx@heinlein>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: C9idPXXP88u_10JGNmA4hlLFxHUpYCbQ
X-Proofpoint-ORIG-GUID: C9idPXXP88u_10JGNmA4hlLFxHUpYCbQ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_11,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290129
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


On 9/29/22 15:32, Patrick Williams wrote:
> On Thu, Sep 29, 2022 at 02:18:48PM -0500, Eddie James wrote:
>> The function returns either a negative errno or the number of bytes
>> successfully read. So, only return for a negative return code.
>>
>> Fixes: c9fb275212da ("leds: pca955x: Add HW blink support")
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/leds/leds-pca955x.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>> index cf0a9fe20086..cba9876b1187 100644
>> --- a/drivers/leds/leds-pca955x.c
>> +++ b/drivers/leds/leds-pca955x.c
>> @@ -689,7 +689,7 @@ static int pca955x_probe(struct i2c_client *client)
>>   	err = i2c_smbus_read_i2c_block_data(client,
>>   					    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
>>   					    ls1);
>> -	if (err)
>> +	if (err < 0)
>>   		return err;
>>   
>>   	for (i = 0; i < nls; ++i)
>> -- 
>> 2.31.1
>>
> I think Potin sent this same patch 2 days ago:
>      https://lore.kernel.org/openbmc/20220928085701.1822967-1-potin.lai.pt@gmail.com/
>
> Would you mind sending a Reviewed-By / Tested-By for his patch?


Ah, thanks. Missed that. Will do.


Eddie


>
