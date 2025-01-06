Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C4A027F6
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 15:27:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRc3645SWz3cCC
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 01:27:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736173664;
	cv=none; b=c9k0AdY2eozrj3tfeZPOP6YsuY7onhkYHd6huaW510XHeYIdTkuCDUl8PImxa25CnD/T5jWRefr6A6l7vZsfkWz1RHHEyBI6vkZIhDXK9RMTcSK6WrcPoz5C1kF7gpu/ax/YAhbWeO3fLjS1LGEc524jR+vTYs1gM6nr/TeIuBLPUXb6guyOJ0fbpU9u9YPqYt/llj/EronuSQ/w4Gb2/YlhN3yfq/Z+9Nv/LQjgeSeopjfmLGrBlfgIjNk/BpdS40F6xJF/E6xCcSAuSy/IGJEYrXdriSvC6hKRMdrWvRKZ8EBWpM7IjEu8w/K+z4ZlG/CLgcMS8zuK6vGzvsQazw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736173664; c=relaxed/relaxed;
	bh=ru6B+a9FKbOYRJhM/KO+0xHLKnqbh4bnAbcO+XCKm84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJJjkdOPB1cHwUsg/F4ZQ9kXbu0MLyNVC1sVmSzazWCWGxk2LcAgjyPSyva+uqpgVMlbYRtOWwT0rXXgMT+Gubwrhp2H0SZ5+rNXBKmyqLTPfGZFJgQSd7M8niYoGQYTO6RpW09ZI65FhS/kNwgKpvhG4ozRTh28rBhNKwJcZIN5MUVjD3oI5KW25dgA0xShTcJysuLIGEgawh33q5sCNXr6FsIiI3B0VKwjXJUzbB1hSpA+nY28Cr3di5H1XrPwrJIfOwoF1nnHt+3Ag1z8hg6nJQwfQfC4+/YLaL2q5QUe4UVQ6j9x0GKV2ePwTFzyt1xSZLmjZQMoQmUvg2Qebg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N8YBM2zn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N8YBM2zn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRc330TYdz2xGF
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 01:27:42 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5063qGQ9031405;
	Mon, 6 Jan 2025 14:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ru6B+a
	9FKbOYRJhM/KO+0xHLKnqbh4bnAbcO+XCKm84=; b=N8YBM2zn5iiswo9d4wgdVM
	egnbUYl7R17mPDonjgru8ehR8RdaRjuESaszepLpEfn4rV8y7k/P0H/Hfuaj9eBy
	nxxumIKhSUhL5j1QgwN3ILAYZnoXJQ/VJg/ixkJ4m8pNBnh5EZ9K1m+hMGlGv9My
	zanysH4qW/urOOpNhMSDUD6PFf+UAvb+XpPVydhVF/1UimYYd8BbTwqu1OcKwYiQ
	/z1Lt2CNfrRZ3WDkd7tAdmaMT/x7JTDuGVP5RXPtirPQ7Tldp10hPYb192/Hf8mw
	0Vra+6qvRtxhHoibAGu/T3mfu64t++mw+SdAS5DDMwaZnu/n/Gs5VCn3pg+hjclg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4407nbjcyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 14:27:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506E2eU0003614;
	Mon, 6 Jan 2025 14:27:36 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfasx7nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 14:27:36 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506ERZnf30409254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 14:27:35 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BB7258062;
	Mon,  6 Jan 2025 14:27:35 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A9305805C;
	Mon,  6 Jan 2025 14:27:34 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jan 2025 14:27:34 +0000 (GMT)
Message-ID: <b2314669-5462-456d-b8d5-88eaecc36ab5@linux.ibm.com>
Date: Mon, 6 Jan 2025 09:27:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Consultation on the invalidation of OpenBMC IMA/EVM function
To: Adriana Kobylak <anoo@linux.ibm.com>, fanyi@ieisystem.com
References: <056238eba5b645c180b31dfbac427c41@ieisystem.com>
 <Z2WQqlEfJHyGRDCa@heinlein>
 <92D9D801-5FB2-4F74-87FD-196389F10B1D@linux.ibm.com>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <92D9D801-5FB2-4F74-87FD-196389F10B1D@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sj8pRYWXkeQRNZRj7u0oU9aSymg03WUk
X-Proofpoint-GUID: sj8pRYWXkeQRNZRj7u0oU9aSymg03WUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 clxscore=1011
 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060124
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

FYI: Dated branches (basically I am following upstream master and rebase 
on it) of the work can also be found here:

https://github.com/stefanberger/openbmc

Last dated branch is: enable_ima_evm.20241224

On 1/3/25 4:34 PM, Adriana Kobylak wrote:
> At IBM, we're picking up Stefan's work this year to get the series merged and enable IMA on the p10bmc system (AST2600-based). Feel free to follow the updates on the series (there should be patch updates in the next few weeks), and/or try the series out on your platform.
> 
> 
>> On Dec 20, 2024, at 9:43 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>>
>> On Thu, Dec 19, 2024 at 07:52:55AM +0000, Vantler Fan (范益) wrote:
>>>
>>>       I have a problem with IMA/EVM func of OpenBMC. I enabled IMA
>>> function, but it doesn't seem to work.
>>
>> I don't know of anyone actively using IMA on OpenBMC.
>>
>> Stefan Berger @ IBM was working on a commit sequence at one point but I
>> haven't see much activity there.
>>
>>    https://gerrit.openbmc.org/c/openbmc/openbmc/+/74136/2
>>
>> -- 
>> Patrick Williams
> 

