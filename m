Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11443D310
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 22:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfgcb6BV3z301B
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 07:42:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=thP61YYV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=thP61YYV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfgc75WTcz2xY9
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:42:31 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RKM05v000570; 
 Wed, 27 Oct 2021 20:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9s0UeD5X3TpF19ABKli4Qf30dyXry65MOTBTNyMZqHk=;
 b=thP61YYVi55jyi2bCpRNMuU1XgHkUnSO4ZWZFU80hQabWjGTSCG96+btFlfYD5ZpJNgx
 5c4XR1yAB9pw1IJHoLvlDJZ/sjNjtnobZAeEinpM80uPU4dTyzQJwpiSA5nviaX3E1Go
 VY69Wz+o+prl0v7lTPsMb3kHHCzMw40G+hxude3LbtHDHyowS3IsyqBCvtIaE8wKCr9d
 UL02Pa2aRFxhyza7BtvGIeR3TsG9XGy0pzBmSQlKCvMb1zHtyFouFf8IPM+lVH3wdEKH
 Dn+Il44QAPmsWSdpdAsKe9YSDCY/lystHMFRw6UYALEsyvtEHIBhR2ox0qoW15N7gN3v jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bybjhu26c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 20:42:26 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19RKVn9B028605;
 Wed, 27 Oct 2021 20:42:25 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bybjhu266-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 20:42:25 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19RKXmMP025442;
 Wed, 27 Oct 2021 20:42:25 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3bx4f0tspv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 20:42:25 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19RKgN7s30605632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 20:42:24 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D76A06A067;
 Wed, 27 Oct 2021 20:42:23 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF47E6A047;
 Wed, 27 Oct 2021 20:42:23 +0000 (GMT)
Received: from [9.211.155.60] (unknown [9.211.155.60])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Oct 2021 20:42:23 +0000 (GMT)
Message-ID: <923ece8a-0cbf-c1b0-5a98-7b4fac9e99cb@linux.vnet.ibm.com>
Date: Wed, 27 Oct 2021 14:42:22 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: bmcweb non-standard OEM integration
Content-Language: en-US
To: Ed Tanous <edtanous@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20211027043751.GB1786414@mauery.jf.intel.com>
 <CAH2-KxDa=vPjOxpq9fnC85azUTmdre1TaxEtb8m7isaTU0Fhpw@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
In-Reply-To: <CAH2-KxDa=vPjOxpq9fnC85azUTmdre1TaxEtb8m7isaTU0Fhpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4F_CaQBbQvcgQ3HuHCCb2Y9n61oil1j3
X-Proofpoint-GUID: sD9awzOb1mUPtNRxSBSiWs8EZXBuM_kL
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_06,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2110270116
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
Cc: Development list for OpenBMC <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/27/2021 10:22 AM, Ed Tanous wrote:
> On Tue, Oct 26, 2021 at 9:37 PM Vernon Mauery
> <vernon.mauery@linux.intel.com> wrote:
>>
>> I can't imagine that Intel is the only company on this project that has
>> a set of patches against bmcweb. 

IBM has a growing number of patches against bmcweb as well.


>> Some of these are for features that
>> have not yet been released. Some of these are for OEM things that don't
>> fit any of the Redfish-OEM schemas. Some are for features that are
>> long-standing upstream reviews that have not yet been merged for
>> whatever reason.

Are OEM things a majority of these patches? Would allowing "OEM 
customization" make much difference in the number of patches against 
bmcweb? I know for us only a small percentage of patches against bmcweb 
are adding Redfish OEM.

>>
>> We want to move away from patches.
> 
> 
> As an attempt to make this more concrete, I tried to look at Intel-BMC
> to figure out what you're talking about.  The only OEM schema I see is
> 0001-Firmware-update-configuration-changes.patch, which adds support
> for defaulting the setup on a firmware update.  DMTF has been
> discussing this idea of defaulting a setup very recently (I think we
> talked about it last week), so that will hopefully be in the standard
> soon, and if you're interested in particular properties of it, you
> might want to participate there
I briefly looked too at Intel-BMC, saw several patches that look to be 
implementing standard Redfish. Things that are already in Redfish. In 
some cases, I didn't see an upstream review. Is there a reason why these 
can't be upstream? What things can we do to help?

> 
> That's the only OEM patch I see;  Is there more?

+1. I would like to understand what Redfish OEM features you are trying 
to add.

> 
>> We want to be able to share our
>> changes with the community. Right now, there is not a way for this sort
>> of OEM changes getting into bmcweb.
> 
> I'm not sure why you think this, but the current policy is definitely
> not "no way". 

OpenBMC has 5 OEM schemas today.
There is also an IBM and Google Rest API. Although I don't think I would 
recommend this approach.

Have you read the doc on this?
> https://github.com/openbmc/bmcweb/blob/master/OEM_SCHEMAS.md
> 
> To paraphrase, the above doesn't say "no OEM schemas in
> upstream".  It says "OEM schema features need to be discussed in the
> relevant communities".  This policy as written was attempting to be
> similar to our policy on systemd, linux, ect.

IBM has had quite a bit of success adding additional features to 
Redfish. Anyone can post to https://redfishforum.com/ and Redfish member 
companies can open issues, attend meetings, and submit PRs.

After adding to Redfish, the bmcweb code is a lot more straightforward. 
For example, we got IdlePowerSave added to the 2021.2 Redfish release, 
the bmcweb commit then doesn't involve much schema discussion and can 
move faster https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/47776

Thanks,
Gunnar

