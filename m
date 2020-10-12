Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 236D428B773
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 15:43:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C90JK05z6zDqQy
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 00:43:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lMFM/v9v; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C907s71x2zDqcK
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 00:36:25 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CDYInX069326; Mon, 12 Oct 2020 09:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yKkCz0IuNFhDwLbm2RiRKoZRAv86xshHfX1UNxuGd9o=;
 b=lMFM/v9vJSZ0X5xEUOvKxH5EzioAcQD+RQbuHhUNgEPEf3dqLqV0NYHPBf7Na6iqEXcV
 hg/AXlOeUYIAt+biyUWRnWQ5lsnaXrqruRJYlSv9GAaI5J9j93W8pVhMg4N4BercgT07
 jdnNSQCC++BUt2/TDvjHPWuHZVTHq5cMWTiOS2hE0dEJcvbXEjCC9TDG6R21gnwoPKPP
 4N2YpzX2aFqmJ8Cx4HhOtrsR0MeIia4kiII77LeC58hQ8qB4bz9rF290OP0CE9roV1qU
 FsW71dZdkM9ucl2f/HN94oKurOmsb9QGB4bZlI4afSJMhZBY5vXjAtuaG3WvOQZoXoMw yg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 344r3cg4e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 09:36:20 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CDXVSH007079;
 Mon, 12 Oct 2020 13:36:20 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 3434k97ym2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 13:36:19 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09CDaJOr14025324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 13:36:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85867AC05F;
 Mon, 12 Oct 2020 13:36:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 514CCAC05E;
 Mon, 12 Oct 2020 13:36:19 +0000 (GMT)
Received: from [9.85.207.95] (unknown [9.85.207.95])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 13:36:19 +0000 (GMT)
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 3/3] configs: Add AST2600
 SPL eMMC configuration
To: Joel Stanley <joel@jms.id.au>
References: <20200928202753.58351-1-eajames@linux.ibm.com>
 <20200928202753.58351-4-eajames@linux.ibm.com>
 <CACPK8XcfK-KbuQOpL--jpzMuTaWrXNVHj-Z=fkSUaBFFPK81mg@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <348a64cf-91a2-8852-d2c4-3f4a37d5569b@linux.ibm.com>
Date: Mon, 12 Oct 2020 08:36:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XcfK-KbuQOpL--jpzMuTaWrXNVHj-Z=fkSUaBFFPK81mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_09:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120104
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/8/20 10:44 PM, Joel Stanley wrote:
> On Mon, 28 Sep 2020 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
>
>> diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
>> index 4c83035d3c..876958735b 100755
>> --- a/include/configs/aspeed-common.h
>> +++ b/include/configs/aspeed-common.h
>> @@ -41,6 +41,12 @@
>>   #define CONFIG_SYS_BOOTMAPSZ           (256 * 1024 * 1024)
>>   #define CONFIG_SYS_MALLOC_LEN          (32 << 20)
>>
>> +#ifdef CONFIG_ENV_IS_IN_MMC
>> +#define CONFIG_SYS_MMC_ENV_DEV         0
>> +#define CONFIG_SYS_MMC_ENV_PART                0
>> +#define CONFIG_ENV_OFFSET_REDUND       0x15000
> 84KB? How was this chosen?


The env is at 0x5000 in the user partition, and is sized at 0x10000. The 
redundant follows it immediately...

Thanks,

Eddie


