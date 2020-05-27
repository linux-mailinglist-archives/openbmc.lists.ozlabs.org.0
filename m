Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5540D1E4625
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 16:38:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XD3M1bSRzDqTd
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 00:38:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=js7oESqa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XD1D3KSCzDqTN
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 00:36:47 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04REaC2D094533; Wed, 27 May 2020 10:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=9F/502rJf7YNy2j5SUkMAFpu98GrFPb26zVft36btr8=;
 b=js7oESqaZRvvS0zrLiLUO92bdoAfIgU+uo2ZU3d9zwsGFG1QTUAyqcJ1jOrJiqax/s6q
 RaadCIkrZpvI+VfcZ4ldey/zmwVuMnMMzej3vNGd4EZRs2V9+A7HiWYqpUyxnRjzF0jW
 MwDulL3OlwOxIKHatIRSGxiVHxt6qwtL/Jpbez3jTJQJvp4mNq5nD+ac7Y4dD3nR9z9/
 NTH6IbKC6fgLnKOKV5TVoqICaHnPOXgx+vR+emchMdbkMY19FaBB5QMPDybKKy5yXMfI
 72xdfZYj/KtKc5BgQ3h3HtJfwixQuYhapm03b21eLKdSQF4IyZSzKRSWjiQrxxG77JBg 9A== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 319sv1rc2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 May 2020 10:36:40 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04RETSHx009758;
 Wed, 27 May 2020 14:36:39 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 316ufammdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 May 2020 14:36:39 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04REacMd51905010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 May 2020 14:36:38 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFA89B2067;
 Wed, 27 May 2020 14:36:38 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47574B205F;
 Wed, 27 May 2020 14:36:38 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 May 2020 14:36:38 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 27 May 2020 09:36:37 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "Bodireddy, Vikram" <vikram.bodireddy@linux.intel.com>,
 openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au
Subject: Re: openBMC eMMC image support
In-Reply-To: <b13a0e82-4f88-f35b-0d3f-8f7d6a91351b@linux.intel.com>
References: <c2d7ecb8-b0b8-c5a3-12e7-7201fbd86b1a@linux.intel.com>
 <b13a0e82-4f88-f35b-0d3f-8f7d6a91351b@linux.intel.com>
Message-ID: <b8407f3ebaa1e5d24750551f4ad4f3aa@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-27_03:2020-05-27,
 2020-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 suspectscore=0 cotscore=-2147483648 impostorscore=0
 malwarescore=0 mlxlogscore=704 mlxscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270107
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
Cc: richard.marian.thomaiyar@linux.intel.com, suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vikram,

On 2020-05-27 09:03, Bodireddy, Vikram wrote:
> +Richard
> 
> On 25-05-2020 15:29, Bodireddy, Vikram wrote:
>> Hi Andriana,
>> 
>> We are working on enabling OpenBMC eMMC support for Intel platforms.
>> 
>> I see that you had started on it, and enabling it for ibm platforms.
>> 
>> We would like to co-work with you to get to know eMMC support status 
>> and  to contribute further to complete it.

Great!

>> 
>> Can you please help with the current status of OpenBMC eMMC support?

For code update support, I’ll be pushing changes to gerrit for 
phosphor-bmc-code-mgmt today/tomorrow to support eMMC.
On the build side, there are a few WIP changes that I’ll be refreshing 
this week as well, will tag them as ‘mmc’ on gerrit to be able to 
find them, some previous commits have the topic ‘wic’ and ‘mmc’ 
already but are in Abandoned or WIP, will be cleaning them up this week.
Updates to the emmc doc: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28443

>> 
>> Also can you let us know your availability this week for a sync 
>> meeting on the same?

Ping me on IRC, any time during the day CST time, or if it's later at 
night like 8/9pm CST time we can have Joel/Andrew J join us as well.

>> 
>> Thanks
>> 
>> Vikram
>> 
