Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3E935DF69
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 14:51:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKQTr1ml2z30HD
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 22:51:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d30+SMzL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d30+SMzL; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKQTc0MVWz2yhf
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 22:51:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DCXwQc105939; Tue, 13 Apr 2021 08:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2ad4l/JN9GS8FoSaXasTQc0nHy+IFE48Lm8HxnB2N/U=;
 b=d30+SMzL2uHlm250M+CQTm9UM2ot+GeqdVvZwZB0Qi+7JrmP+Ok7ZDjG/pSZ8qUvkQoW
 cPV6x4q9QgpvgSUPas5ES2axfAzdtkq0oCTDS4HW+QEZ3gFExv2SA4vsMyB+0tPOdljs
 uqL4yJpU9RzoNuo7q0zKWcfHbPM1ucb/rVkng68laFEY5pKVEDnBoAHRd1GoEBQUWc6y
 NblIocPHsG+k6tw1Sk7oj1iAU5t0ifadn+myh3JeHTqUVdxDcNVJ21JDXpUmyCi0ePnc
 NUu7Z9tMqtgsi/U+TVhHw1khwHcd39cc94hS51Ykk5B9w+AWy1xFt4FZNohULCZxd/3M TQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wb4f8yxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 08:51:19 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DCXtkO010913;
 Tue, 13 Apr 2021 12:51:18 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 37uhcmmw6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 12:51:18 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DCpIVi14680460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 12:51:18 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44569112063;
 Tue, 13 Apr 2021 12:51:18 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79DFD112061;
 Tue, 13 Apr 2021 12:51:17 +0000 (GMT)
Received: from [9.85.206.162] (unknown [9.85.206.162])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 12:51:17 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 07/11] hash: Allow for
 SHA512 hardware implementations
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-8-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <38594b05-ae35-5df5-7503-70e6d717d91c@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 09:51:16 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413080755.73572-8-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PoJDDIg8cY2KABBFe94m6_y7NMkrX21I
X-Proofpoint-GUID: PoJDDIg8cY2KABBFe94m6_y7NMkrX21I
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_07:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130088
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
> Similar to support for SHA1 and SHA256, allow the use of hardware hashing
> engine by enabling the algorithm and setting  CONFIG_SHA_HW_ACCEL /
> CONFIG_SHA_PROG_HW_ACCEL.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   common/hash.c    | 24 ++++++++++++++++++++++--
>   include/hw_sha.h | 26 ++++++++++++++++++++++++++
>   lib/Kconfig      | 15 +++++++--------
>   3 files changed, 55 insertions(+), 10 deletions(-)
> 
> diff --git a/common/hash.c b/common/hash.c
> index c00ec4d36c41..a19cba07d779 100644
> --- a/common/hash.c
> +++ b/common/hash.c
> @@ -86,7 +86,7 @@ static int hash_finish_sha256(struct hash_algo *algo, void *ctx, void
>   }
>   #endif
> 
> -#if defined(CONFIG_SHA384)
> +#if defined(CONFIG_SHA384) && !defined(CONFIG_SHA_PROG_HW_ACCEL)
>   static int hash_init_sha384(struct hash_algo *algo, void **ctxp)
>   {
>   	sha512_context *ctx = malloc(sizeof(sha512_context));
> @@ -114,7 +114,7 @@ static int hash_finish_sha384(struct hash_algo *algo, void *ctx, void
>   }
>   #endif
> 
> -#if defined(CONFIG_SHA512)
> +#if defined(CONFIG_SHA512) && !defined(CONFIG_SHA_PROG_HW_ACCEL)
>   static int hash_init_sha512(struct hash_algo *algo, void **ctxp)
>   {
>   	sha512_context *ctx = malloc(sizeof(sha512_context));
> @@ -249,10 +249,20 @@ static struct hash_algo hash_algo[] = {
>   		.name		= "sha384",
>   		.digest_size	= SHA384_SUM_LEN,
>   		.chunk_size	= CHUNKSZ_SHA384,
> +#ifdef CONFIG_SHA_HW_ACCEL
> +		.hash_func_ws	= hw_sha384,
> +#else
>   		.hash_func_ws	= sha384_csum_wd,
> +#endif
> +#ifdef CONFIG_SHA_PROG_HW_ACCEL
> +		.hash_init	= hw_sha_init,
> +		.hash_update	= hw_sha_update,
> +		.hash_finish	= hw_sha_finish,
> +#else
>   		.hash_init	= hash_init_sha384,
>   		.hash_update	= hash_update_sha384,
>   		.hash_finish	= hash_finish_sha384,
> +#endif
>   	},
>   #endif
>   #ifdef CONFIG_SHA512
> @@ -260,10 +270,20 @@ static struct hash_algo hash_algo[] = {
>   		.name		= "sha512",
>   		.digest_size	= SHA512_SUM_LEN,
>   		.chunk_size	= CHUNKSZ_SHA512,
> +#ifdef CONFIG_SHA_HW_ACCEL
> +		.hash_func_ws	= hw_sha512,
> +#else
>   		.hash_func_ws	= sha512_csum_wd,
> +#endif
> +#ifdef CONFIG_SHA_PROG_HW_ACCEL
> +		.hash_init	= hw_sha_init,
> +		.hash_update	= hw_sha_update,
> +		.hash_finish	= hw_sha_finish,
> +#else
>   		.hash_init	= hash_init_sha512,
>   		.hash_update	= hash_update_sha512,
>   		.hash_finish	= hash_finish_sha512,
> +#endif
>   	},
>   #endif
>   	{
> diff --git a/include/hw_sha.h b/include/hw_sha.h
> index 991e496a3cb2..8cdf821218a0 100644
> --- a/include/hw_sha.h
> +++ b/include/hw_sha.h
> @@ -8,6 +8,32 @@
>   #define __HW_SHA_H
>   #include <hash.h>
> 
> +/**
> + * Computes hash value of input pbuf using h/w acceleration
> + *
> + * @param in_addr	A pointer to the input buffer
> + * @param bufleni	Byte length of input buffer
> + * @param out_addr	A pointer to the output buffer. When complete
> + *			64 bytes are copied to pout[0]...pout[63]. Thus, a user
> + *			should allocate at least 64 bytes at pOut in advance.
> + * @param chunk_size	chunk size for sha512
> + */
> +void hw_sha512(const uchar * in_addr, uint buflen,
> +			uchar * out_addr, uint chunk_size);
> +
> +/**
> + * Computes hash value of input pbuf using h/w acceleration
> + *
> + * @param in_addr	A pointer to the input buffer
> + * @param bufleni	Byte length of input buffer
> + * @param out_addr	A pointer to the output buffer. When complete
> + *			48 bytes are copied to pout[0]...pout[47]. Thus, a user
> + *			should allocate at least 48 bytes at pOut in advance.
> + * @param chunk_size	chunk size for sha384
> + */
> +void hw_sha384(const uchar * in_addr, uint buflen,
> +			uchar * out_addr, uint chunk_size);
> +
>   /**
>    * Computes hash value of input pbuf using h/w acceleration
>    *
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 984a783fd16f..f77272d0a94a 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -273,19 +273,18 @@ config SHA384
>   config SHA_HW_ACCEL
>   	bool "Enable hashing using hardware"
>   	help
> -	  This option enables hardware acceleration
> -	  for SHA1/SHA256 hashing.
> -	  This affects the 'hash' command and also the
> -	  hash_lookup_algo() function.
> +	  This option enables hardware acceleration for SHA hashing.
> +	  This affects the 'hash' command and also the hash_lookup_algo()
> +	  function.
> 
>   config SHA_PROG_HW_ACCEL
>   	bool "Enable Progressive hashing support using hardware"
>   	depends on SHA_HW_ACCEL
>   	help
> -	  This option enables hardware-acceleration for
> -	  SHA1/SHA256 progressive hashing.
> -	  Data can be streamed in a block at a time and the hashing
> -	  is performed in hardware.
> +	  This option enables hardware-acceleration for SHA progressive
> +	  hashing.
> +	  Data can be streamed in a block at a time and the hashing is
> +	  performed in hardware.
> 
>   config MD5
>   	bool
> 

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
