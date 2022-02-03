Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 311924A8A05
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 18:29:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqQfB67wXz3bNC
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 04:29:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I1ShNfZ3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=I1ShNfZ3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqQdW1t2Qz3bTH
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 04:29:18 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213Ghcpx007659; 
 Thu, 3 Feb 2022 17:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9INVHh5l9HVthfF34qc1hekZ6DnqvhUt5ZvnNHqmcS4=;
 b=I1ShNfZ3PmmrdZtc/X+uBuDG5OGC5+9rii2ojpPLePjTJP/8cbgPOH6GauhsUH4Swuar
 YQT+O1NDkpQVBrPWr7OzR6uNnOkRbRihUQKBzlUaSWfTVrncsLkVhKLu6KVhKBXG4VZk
 zaJn1Cc9aM2yW9hXlfNFJZfkzM8nJe2qPiXCPgIM1/GU1sk1nOIsDuDjA8PYQsQzZIDy
 42qRswHWOxAlYky2HWTBF1DhqGa/PgaP39ihfWUi5m4hKNCm0biaCnJpd5jAmGv7fnoC
 AFLiqkyKgKjNoeyu9Oq/6TUJOG+iJOnWxF5hYthOnmWmVAVcXC/8UiF0m7RN6PwGUb8v GQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e04m6a943-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:29:14 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213HCkX3012351;
 Thu, 3 Feb 2022 17:29:13 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3dvw7chk1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:29:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213HTCbf35914022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 17:29:12 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABBCCAC060;
 Thu,  3 Feb 2022 17:29:12 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68E5CAC05B;
 Thu,  3 Feb 2022 17:29:12 +0000 (GMT)
Received: from [9.163.28.41] (unknown [9.163.28.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 17:29:12 +0000 (GMT)
Message-ID: <1beb962d-a99f-9e47-3756-e689434fc701@linux.ibm.com>
Date: Thu, 3 Feb 2022 11:29:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 6/6] image: Fix indentation
 of macros
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220131012538.73021-1-andrew@aj.id.au>
 <20220131012538.73021-7-andrew@aj.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220131012538.73021-7-andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lGjBecFxGWvsXVOnjOGdhsAZ-Jubecnn
X-Proofpoint-GUID: lGjBecFxGWvsXVOnjOGdhsAZ-Jubecnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202030103
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


On 1/30/22 19:25, Andrew Jeffery wrote:
> Make it clear which level of nesting they belong to.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   include/image.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/image.h b/include/image.h
> index 19ea743af08f..9bccf00bb5cb 100644
> --- a/include/image.h
> +++ b/include/image.h
> @@ -1093,8 +1093,8 @@ int calculate_hash(const void *data, int data_len, const char *algo,
>   # ifdef USE_HOSTCC
>   #  define IMAGE_ENABLE_SIGN	1
>   #  define IMAGE_ENABLE_VERIFY	1
> -# include  <openssl/evp.h>
> -#else
> +#  include  <openssl/evp.h>
> +# else
>   #  define IMAGE_ENABLE_SIGN	0
>   #  define IMAGE_ENABLE_VERIFY	1
>   # endif
