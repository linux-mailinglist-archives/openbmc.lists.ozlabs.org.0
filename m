Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732079A805
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 14:50:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKDPBEZZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkmlc3kw5z3bwj
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 22:50:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKDPBEZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkml005KMz2xm5
	for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 22:49:47 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BCd0Qt011434;
	Mon, 11 Sep 2023 12:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0vjEn1rk1QN9OCvx8t1Qpid0ulBT1iDeNFIutf4HCOY=;
 b=rKDPBEZZ3ihoB3BZ/I6/to0W3Br126l1osmiRGQq+lrAEGohog0eL9vq9rWZTKuyJt16
 cHOMAM4s0SghlDOhPyJ+izyludPV8EoiEBDz7m/1qYA3Y8eE1qTII1vBQfARYH++YWHh
 scJXxNFiUI6SiTkiLIsAFcCj28NAkvjbJl1dndcRmsCogmYRAHtPoeQbOWRGSSubXf8I
 HnEYWbIZdHNUiU1yBukmScsqwH+AFKzp6AEYqrS6h1AacP7aQ8hr+/PYGB/f/E1+Jayj
 ioOd/T54jAQUS/shzbzqjIo/1fhmCLigpEUpVgwKYNPtLT6kQZ+/eEgT762TLgLjpLoL hw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t21td2men-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 12:49:39 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38BBToHr002352;
	Mon, 11 Sep 2023 12:49:38 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t158jt4cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 12:49:38 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38BCnZZ725101048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Sep 2023 12:49:36 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEF5958060;
	Mon, 11 Sep 2023 12:49:35 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 884125803F;
	Mon, 11 Sep 2023 12:49:35 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 11 Sep 2023 12:49:35 +0000 (GMT)
Message-ID: <121c959c-e19c-d92b-42c0-16e5647a881d@linux.ibm.com>
Date: Mon, 11 Sep 2023 08:49:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH linux dev-6.1 0/5] Backports to support OpenBMC with IMA
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20230905131401.82232-1-stefanb@linux.ibm.com>
 <CACPK8XfECNDdDYfqsJQeUKfEWu-QYb6p2ztd7FjnK3B9rnAgeQ@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CACPK8XfECNDdDYfqsJQeUKfEWu-QYb6p2ztd7FjnK3B9rnAgeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ntb-2frCWOUyWiHErh5uYPKZRZj8NlAA
X-Proofpoint-ORIG-GUID: Ntb-2frCWOUyWiHErh5uYPKZRZj8NlAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110114
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/11/23 04:04, Joel Stanley wrote:
> On Tue, 5 Sept 2023 at 13:14, Stefan Berger <stefanb@linux.ibm.com> wrote:
>> This series of patches are backports from recent extensions to core Linux
>> filesystem code (support for STATX_CHANGE_COOKIE) and subsequent fixes
>> to IMA and overlayfs so that IMA can be used by OpenBMC configured with
>> overlayfs. Overlayfs is for example used by the p10bmc build.
>>
>> The patches in this series have been cherry-picked from upstream Linux
>> using the following commands:
>>
>> git cherry-pick 131f4fd2c25a # 3 consecutive patches of longer series
>> git cherry-pick a3bb710383cb
>> git cherry-pick a1175d6b1bda
>> git cherry-pick db1d1e8b9867 # IMA: use vfs_getattr_nosec ...
>> git cherry-pick 18b44bc5a672 # ovl: Always reevaluate ...
> This is great. My only concern with backporting a bunch of upstream
> changes is we miss out on subsequent upstream fixes that modify this
> code.
>
> The intent is to move to v6.5 shortly. Do you mind if we wait for
> that, and ensure the 6.5 tree has your changes (I assume the delta
> will be smaller)?

I can wait. 6.5.2 seems to have all these changes. (The first commit 
above seems wrong and should be c5bc1b3ff35ae321d018.)

Regards,

    Stefan

>
> Cheers,
>
> Joel
>
>> Regards,
>>     Stefan
>>
>> Eric Snowberg (1):
>>    ovl: Always reevaluate the file signature for IMA
>>
>> Jeff Layton (4):
>>    fs: uninline inode_query_iversion
>>    fs: clarify when the i_version counter must be updated
>>    vfs: plumb i_version handling into struct kstat
>>    IMA: use vfs_getattr_nosec to get the i_version
>>
>>   fs/libfs.c                        | 36 +++++++++++++++++++
>>   fs/overlayfs/super.c              |  2 +-
>>   fs/stat.c                         | 17 +++++++--
>>   include/linux/iversion.h          | 60 ++++++++++++-------------------
>>   include/linux/stat.h              |  9 +++++
>>   security/integrity/ima/ima_api.c  |  9 +++--
>>   security/integrity/ima/ima_main.c | 12 ++++---
>>   7 files changed, 97 insertions(+), 48 deletions(-)
>>
>> --
>> 2.40.1
>>
