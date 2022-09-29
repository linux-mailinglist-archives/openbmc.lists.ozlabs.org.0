Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 356FF5EFED1
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 22:43:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdlgK11vCz3brh
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 06:43:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FnPTaF2/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FnPTaF2/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mdlft46q4z3bSX
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 06:42:46 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TKQtCk016220;
	Thu, 29 Sep 2022 20:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0LooiAJLXAE2kprFJptm7Y21WrdQncsUSbwmgprNmx4=;
 b=FnPTaF2/1uwesGTTErg4JbNFrRnvJgqzVSrbuxir7N6rq8JDKNxiD590Vj/sxlJz2oHT
 FfEs9/OHFMeC5BWzW/E72Y/7nHfl+lHttVLbyvmLtCAkE8J+fE9sR9gnGmjcGKu8Wtss
 3VPoTXA0Ash9MkCZnuO6KaNTlM4eTicL3hCbOffMKstVYtsJxteUb1fwaHewUZSSCVGB
 ZOIgzUPiB7S+KzD4uJYrLpj6B8FMMmvNQ/cIhxJ4mh2o/Tc7RigR6WeoicjhR2wcf3UV
 Z8kFUWmiYJxedPcrt2wYBoSqnxP6QJyP3YSRvjwn+XT7Oex7jP1dKre1Me6yoB3Ixt0v 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwjdk0juu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 20:42:41 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28TKSXeI026016;
	Thu, 29 Sep 2022 20:42:40 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwjdk0juc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 20:42:40 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28TKaVkb027847;
	Thu, 29 Sep 2022 20:42:40 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma04dal.us.ibm.com with ESMTP id 3jsshbdh14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 20:42:40 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28TKgc4d6357682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Sep 2022 20:42:39 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 991BD58062;
	Thu, 29 Sep 2022 20:42:38 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2315E58055;
	Thu, 29 Sep 2022 20:42:38 +0000 (GMT)
Received: from [9.77.146.111] (unknown [9.77.146.111])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Sep 2022 20:42:37 +0000 (GMT)
Message-ID: <38531b37-adb4-f77d-e40b-b2e703a5943d@linux.ibm.com>
Date: Thu, 29 Sep 2022 15:40:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH linux dev-5.15 1/1] leds: pca955x: fix return value
 checking of smbus block read
Content-Language: en-US
To: Potin Lai <potin.lai.pt@gmail.com>, openbmc@lists.ozlabs.org,
        joel@jms.id.au
References: <20220928085701.1822967-1-potin.lai.pt@gmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220928085701.1822967-1-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fa5hw_BNXkIEme-2HZMWfTFyuUHF2OnN
X-Proofpoint-GUID: cUM-WQS3CDmSpzKdG21SLgZT1EJkAoCu
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_11,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/28/22 03:57, Potin Lai wrote:
> In i2c_smbus_read_i2c_block_data(), it returns negtive value for error
> code, otherwise returns data length of reading.
> Change the if statement to "if (err < 0)" to indicate the real error
> returned by i2c_smbus_read_i2c_block_data().


Thanks! My mistake here.

Reviewed-by: Eddie James <eajames@linux.ibm.com>

Tested-by: Eddie James <eajames@linux.ibm.com>


>
> LORE Link: https://lore.kernel.org/all/20220928084709.1822312-1-potin.lai.pt@gmail.com/
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>   drivers/leds/leds-pca955x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index cf0a9fe20086a..cba9876b11872 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -689,7 +689,7 @@ static int pca955x_probe(struct i2c_client *client)
>   	err = i2c_smbus_read_i2c_block_data(client,
>   					    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
>   					    ls1);
> -	if (err)
> +	if (err < 0)
>   		return err;
>   
>   	for (i = 0; i < nls; ++i)
