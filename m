Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4C536397
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 15:53:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8mTz1tTYz3blx
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 23:53:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eUNEBUEq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eUNEBUEq;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8mTW12Jtz307C
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 23:52:46 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RDEIYi013857;
	Fri, 27 May 2022 13:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NUsYHCGLNghKQiCvsoruLe8bXpe1hma6wmBB6c+6ot0=;
 b=eUNEBUEqU0i6nQCpGiC3oXaGpJweESSGrxNthDSy0fq/VtVNcwrBQCpVQwP51aQj/VgJ
 dWBsu7ZhLRTOADPgR0bjVroJS5r48pTg0BhMbvcAQXwtD0aV3zb0Jmv4KLiZUKzkqghw
 N4sNUxVnk9oYaDP9jmxbxPb4PYsjPWHZ8YOOm+Zp2LmnjrwSk5HRNFdWdbjUU/kEQS7Z
 Z8Xx0ahsMBXwvYsSQZsg3Hd758Px8VDm+TeMcz7Pi++9cvW4KHpgHsw1OB3UvlN+gw5l
 SxNq/FBfYpht8EG2sga4kOyeBHblRX1pctKRQ7SdoaD8wHUjJRvQEZ/cZILe3Bg1Z/P8 tg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gaybm0qn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 13:52:42 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RDKr7k008929;
	Fri, 27 May 2022 13:52:41 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma02wdc.us.ibm.com with ESMTP id 3gagpkvxbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 13:52:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24RDqfON28246468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 May 2022 13:52:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D422AC05F;
	Fri, 27 May 2022 13:52:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAB7FAC05B;
	Fri, 27 May 2022 13:52:40 +0000 (GMT)
Received: from [9.211.47.118] (unknown [9.211.47.118])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 27 May 2022 13:52:40 +0000 (GMT)
Message-ID: <c2032e60-b730-edd5-bd4a-da57018951a3@linux.ibm.com>
Date: Fri, 27 May 2022 08:52:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH linux dev-5.15] iio: si7020: Revert "Remove reset in
 probe"
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220527072236.271404-1-joel@jms.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220527072236.271404-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EEqJtPlKnwPKVrtn2KEuGJK_mnISR6nD
X-Proofpoint-GUID: EEqJtPlKnwPKVrtn2KEuGJK_mnISR6nD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_04,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 phishscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205270064
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 5/27/22 02:22, Joel Stanley wrote:
> This reverts commit 9f2084b7eb3d8bc99e700b01208be586006a9e42.
>
> Eddie reports this made things even worse.


Thanks!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/iio/humidity/si7020.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
> index f0e86bcb7970..ab6537f136ba 100644
> --- a/drivers/iio/humidity/si7020.c
> +++ b/drivers/iio/humidity/si7020.c
> @@ -108,12 +108,20 @@ static int si7020_probe(struct i2c_client *client,
>   {
>   	struct iio_dev *indio_dev;
>   	struct i2c_client **data;
> +	int ret;
>   
>   	if (!i2c_check_functionality(client->adapter,
>   				     I2C_FUNC_SMBUS_WRITE_BYTE |
>   				     I2C_FUNC_SMBUS_READ_WORD_DATA))
>   		return -EOPNOTSUPP;
>   
> +	/* Reset device, loads default settings. */
> +	ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
> +	if (ret < 0)
> +		return ret;
> +	/* Wait the maximum power-up time after software reset. */
> +	msleep(15);
> +
>   	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
>   	if (!indio_dev)
>   		return -ENOMEM;
