Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC28C30642F
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 20:36:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQv3r6F5HzDqfv
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 06:36:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rEyBa45w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQtyC4wfBzDqCD
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 06:31:31 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RJ2AAb054806
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 14:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dYGlSKZuOzs1rofuSZDuEf5yW9OkKMGKP5K1QtEV00U=;
 b=rEyBa45wT66pWaMFllCarsA87a6kOGOqd1hpDMlmoSkn7kv5STXfXvtqFwCv6GIYlw6C
 U7QMl1pz4QnGnjHB+m+qO2ecywTrR6LvU+863xIMF6LcDa/lL1PF+fdN5XxganhC6F45
 Iu9XjN5qgW4x+le8Bvo62zDUphmHWlpFXApwYOuLUGJ4ojonuwWg4b/wi9L9rClLK2sg
 Ma0MgKJ9MDacXZTY09khL7ItoyzpQoe0PCm26Ek1IxLsDh/fgmeLYj2NuA3VjMyc+nCa
 pV+K5SHUtW4DzqdNcELDbBI4JyzpdRPxStu1DE46JlDXbU0gXRJEzYLZ+o/Hnc4QOW9k FQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b1cur8uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 14:31:29 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RJQhVT026553
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 19:31:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 368be9frmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 19:31:28 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10RJVRrc41615830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 19:31:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60901AC05B
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 19:31:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0218FAC059
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 19:31:26 +0000 (GMT)
Received: from [9.80.207.30] (unknown [9.80.207.30])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 19:31:26 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 5/6] config: ast2600:
 Disable SPL ymodem support
To: openbmc@lists.ozlabs.org
References: <20210127070054.81719-1-joel@jms.id.au>
 <20210127070054.81719-6-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <b3eb6359-3f00-a34e-ed06-98fe8e608973@linux.vnet.ibm.com>
Date: Wed, 27 Jan 2021 16:31:26 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127070054.81719-6-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_06:2021-01-27,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270092
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



On 1/27/2021 4:00 AM, Joel Stanley wrote:
> This feature consumes 3656 bytes. Without it systems will need to load a
> new SPL over the UART with the AST2600's recovery feature if they flash
> a bad u-boot proper.
No objections here. Just a bit confusing since that in the introductory letter
you mention we *could* leave that enabled. So if that's not necessary, why
bundle that with this patchset (and not separate)?

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   configs/ast2600_openbmc_spl_emmc_defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> index 3f2de64e077d..c55a70c5c1c9 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -55,7 +55,6 @@ CONFIG_SPL_DM_RESET=y
>   CONFIG_SPL_RAM_SUPPORT=y
>   CONFIG_SPL_RAM_DEVICE=y
>   CONFIG_SPL_WATCHDOG_SUPPORT=y
> -CONFIG_SPL_YMODEM_SUPPORT=y
>   CONFIG_HUSH_PARSER=y
>   # CONFIG_AUTO_COMPLETE is not set
>   CONFIG_SYS_PROMPT="ast# "

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
