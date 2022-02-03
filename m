Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E254A8A00
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 18:27:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqQbv5wspz3050
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 04:27:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QWeEd0mz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QWeEd0mz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqQbW1kvvz2xC6
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 04:27:35 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213H8nlb002585; 
 Thu, 3 Feb 2022 17:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PDKqG1Y0g3B1+CsBUOrSQIyUNg2kDx0OamBsdV/Ipmk=;
 b=QWeEd0mz8RopwhAvpmYVE5BUG3d79Zf+O0UmIlripDAZOwVrfm2NDRSDprRCIOPRi9/A
 FOxG4tgnczJq81KUJkdY41yrR/bV7ytw/XA3Hi5VvWsuMkV+tEFs2WhoasKFONvmRAOJ
 hW3wM4NqJbjYkGEptlRJyh2ZSE3DzbcfA8PP7QcOTbK0KlFRZrd43PzCwK6LN8zXYtgv
 uLPHZTCBq8KYgP/QiQRs1k5Tf1I15vWNzyEBSYidKf2jnRrFVuAgDbcWg8L7rKkgaMur
 +drD1O2qYliL7q1vsBg+P0g9oLTYJsIPUqNguquWQfH3Hx30oaJNThMmoUMdaum3uYSE 8Q== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e03fnbyn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:27:30 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213HCa1s029712;
 Thu, 3 Feb 2022 17:27:29 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3dvw7c9mt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:27:29 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213HRS9r33685866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 17:27:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FF80AC06E;
 Thu,  3 Feb 2022 17:27:28 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F4F3AC05B;
 Thu,  3 Feb 2022 17:27:28 +0000 (GMT)
Received: from [9.163.28.41] (unknown [9.163.28.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 17:27:27 +0000 (GMT)
Message-ID: <39f07099-bed8-294d-9e56-f47bf6a8c2fd@linux.ibm.com>
Date: Thu, 3 Feb 2022 11:27:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 4/6] configs: ast2600:
 Runtime control of FIT signature verification
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220131012538.73021-1-andrew@aj.id.au>
 <20220131012538.73021-5-andrew@aj.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220131012538.73021-5-andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c5o4AofZjXS4vb5Oj4kV9G-GSkoQn1iZ
X-Proofpoint-ORIG-GUID: c5o4AofZjXS4vb5Oj4kV9G-GSkoQn1iZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030103
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
> Turn on runtime control of FIT signature verification for systems using
> the ast2600_openbmc_spl_emmc_defconfig, such as IBM's Rainier platform.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   configs/ast2600_openbmc_spl_emmc_defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> index 5f50298a589c..a3d229d786b8 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -29,6 +29,7 @@ CONFIG_NR_DRAM_BANKS=1
>   CONFIG_FIT=y
>   CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
>   CONFIG_FIT_SIGNATURE=y
> +CONFIG_FIT_RUNTIME_SIGNATURE=y
>   CONFIG_SPL_FIT_SIGNATURE=y
>   CONFIG_SPL_LOAD_FIT=y
>   CONFIG_USE_BOOTARGS=y
