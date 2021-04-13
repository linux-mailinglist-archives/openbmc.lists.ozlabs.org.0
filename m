Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5935DF0A
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 14:39:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKQCH3t3Tz30Gv
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 22:39:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lg8NA7r6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Lg8NA7r6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKQC36blcz2yQw
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 22:38:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DCYMDs032918; Tue, 13 Apr 2021 08:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+xYNvmL0yss3ddBftowLPv/pvYfrexhWTkM8sqkc+KM=;
 b=Lg8NA7r6+r0Y+PGLs29+NH6wOYVSdzEWrKwVNbdSqKqpDsL/yL9kUIbmw+idV6uv6eMb
 zYRNB4pGtq/bgy2KJyIBD9D4W43Rh87i2WgZX+4veoUTjs8mxu4d/P/7N+G9515cJHPD
 U2HLpbAPA75tYOa/cAu7ispCmY87XuWVnhlYEwHR3eoD4AuahIXF0dxqhIYDH0hix2uL
 90esoNM3XGPReSdOnFkOj2rnfgVcH438GOSGCQMZ/4PdYZiz2b8Vcd0TFnBDMCYZwrpn
 APK48J761izZ4jyhgdhPTnVlnT61IDjMYXL7svQvKG2GeI71d7oFYfL7tELAXI/h59iM 8g== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vt7g8s4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 08:38:43 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DCWHCb000722;
 Tue, 13 Apr 2021 12:38:41 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 37u3n98jea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 12:38:41 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DCcfJb32309546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 12:38:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80AFB112063;
 Tue, 13 Apr 2021 12:38:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0DB0112061;
 Tue, 13 Apr 2021 12:38:40 +0000 (GMT)
Received: from [9.85.206.162] (unknown [9.85.206.162])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 12:38:40 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 06/11] image-fit: use
 hashing infra
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-7-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <614d2b33-087d-2dcd-c345-6a831bbc06f1@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 09:38:39 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413080755.73572-7-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kqpnW6zLItoRlYmrUvZ8ellXPyFMsOQY
X-Proofpoint-ORIG-GUID: kqpnW6zLItoRlYmrUvZ8ellXPyFMsOQY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_04:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130086
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 4/13/2021 5:07 AM, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   common/image-fit.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/common/image-fit.c b/common/image-fit.c
> index e64949dfa73d..b9c3d79b83e1 100644
> --- a/common/image-fit.c
> +++ b/common/image-fit.c
> @@ -1135,9 +1135,22 @@ int fit_set_timestamp(void *fit, int noffset, time_t timestamp)
>    *     0, on success
>    *    -1, when algo is unsupported
>    */
> -int calculate_hash(const void *data, int data_len, const char *algo,
> +int calculate_hash(const void *data, int data_len, const char *algo_name,
>   			uint8_t *value, int *value_len)
Is the API changing here, or you just needed the 'algo' variable name for something else?
Are all callers OK with that?

>   {
> +	struct hash_algo *algo;
> +
> +	if (hash_lookup_algo(algo_name, &algo)) {
> +		debug("Unsupported hash alogrithm\n");
> +		return -1;
> +	}
> +
> +	algo->hash_func_ws(data, data_len, value, algo->chunk_size);
> +	*value_len = algo->digest_size;
> +
> +	return 0;
> +
> +#if 0

Can you expand the rationale behind keeping this dead code around?

>   	if (IMAGE_ENABLE_CRC32 && strcmp(algo, "crc32") == 0) {
>   		*((uint32_t *)value) = crc32_wd(0, data, data_len,
>   							CHUNKSZ_CRC32);
> @@ -1167,6 +1180,7 @@ int calculate_hash(const void *data, int data_len, const char *algo,
>   		return -1;
>   	}
>   	return 0;
> +#endif
>   }
> 
>   static int fit_image_check_hash(const void *fit, int noffset, const void *data,
> 

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
