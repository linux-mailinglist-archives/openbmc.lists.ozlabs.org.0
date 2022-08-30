Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A58E5A6B32
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 19:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHFFn54JWz3bnV
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 03:50:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PodPOTaF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PodPOTaF;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHFFK3mhvz3bNj
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 03:49:56 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UGmvNH009978
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 17:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=OjIf3cNPX74bTUoi7V6czRd4BrrLLW4H3Ct5THClg1w=;
 b=PodPOTaF7fI4EcAa7tawbBWZa9y9WlJ4nUeU3qwL8lumOGXnTiciXmpVVD43qzgsQOh9
 xbDxdBVXjujvqSGGg6ztRtU+Cxnxv7Fh7oqVi2R+CiLXbnmAGXCadM7mHeApZ9JhTM6H
 JQmePewy4ylxQpIsVj1ziw5MbFvcRQcyQgksBHFkONg0nP2I5uobzNyfcX8VM19ehb7I
 ZImnFVcF+VTa7a2t2nWYElb8w9a3wYQcXGxKC1tOqLBTsaPpjL0IzZL4ws+QSW2G4qYq
 4LDbeG153bIVldXR2BghBQg7SwFjLm0khyDf5fe6re9K/x7J0zAKzWnreWhdIUVLUiVM IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9n0e4udn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 17:49:52 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27UHjI6U022371
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 17:49:51 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9n0e4ud2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Aug 2022 17:49:51 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27UHZLaR007543;
	Tue, 30 Aug 2022 17:49:51 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma04wdc.us.ibm.com with ESMTP id 3j7aw9nbjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Aug 2022 17:49:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27UHnoMK57344340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Aug 2022 17:49:50 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D229AE062;
	Tue, 30 Aug 2022 17:49:50 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E22CAE05C;
	Tue, 30 Aug 2022 17:49:50 +0000 (GMT)
Received: from [9.160.73.194] (unknown [9.160.73.194])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
	Tue, 30 Aug 2022 17:49:50 +0000 (GMT)
Message-ID: <a688990f-d0ff-e0f6-43c4-7435e5223e8e@linux.ibm.com>
Date: Tue, 30 Aug 2022 12:49:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: Read CPU memory from BMC.
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        AKASH G J <akashgj91@gmail.com>
References: <CAE33tLF5KTW8-gCq9bn_AsKmfaMUrV9faERzWQzL6s38F2O-DA@mail.gmail.com>
 <328645f5-9bd7-99d0-8b1c-511175d3d94f@linux.ibm.com>
 <Ywx8MZ/vih+W+ujY@probook>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <Ywx8MZ/vih+W+ujY@probook>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I-GrFEBAh6GNC0wft7xfOyJywlho7WcA
X-Proofpoint-ORIG-GUID: ESgwA2_B0imIB0A6cEUtg6tB091zM_v1
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_10,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 spamscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300081
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/29/22 3:43 AM, Jonathan Neuschäfer wrote:
> On Sun, Aug 28, 2022 at 08:30:54PM -0500, Joseph Reynolds wrote:
>> On 8/26/22 11:42 AM, AKASH G J wrote:
>>> Hello Team,
>>>
>>> Is it possible to read CPU memory space from the BMC?
>>> If PCIe connection is available from BMC to the chipset, can we do DMA
>>> from BMC ?
>> Akash,
>>
>> I hope not.  I assume you are asking about how to read the host's memory
>> from the BMC.
> Hello Akash and Joseph,
>
> At least HP iLO BMC hardware has this feature (as documented by Airbus
> security lab[1]).
>
> In other case, the reverse is possible: Reading/writing BMC memory from
> the host[2].
>
>
> In any case, before OpenBMC can support reading/writing host memory, the
> hardware has to support it. Which BMC hardware platform are you working with?

Thanks.  I should clarify... I was wearing my security hat when I wrote 
that the BMC and host should not be allowed to reach into each other's 
memory.  It would be bad to allow the BMC to read secrets out of host 
memory, and vice-versa.  There are some use cases, such a for device 
driver using memory windows, but a general capability to access the 
other device's memory is not present.

The IBM Power and OpenPOWER systems use the AST2500 and AST2600 BMC 
hardware.  These systems resolved CVE-2019-6260 by shutting down the 
affected BMC interfaces.

I am aware the AST2x00 can open a memory window.  This allows BMC device 
drivers to allows host elements to write directly into the BMC memory 
window.  I understand this use case can be secure because access outside 
the memory window is not allowed.  Please note this topic is at the 
limit of my knowledge, so if you are asking for more details here, that 
is not me.

I am not aware of any use cases where the BMC writes directly to host 
memory.

Can you point to existing OpenBMC applications?  Are you trying to solve 
a particular problem you can share with the community?

Joseph

>
>
> Greetings,
> Jonathan
>
>
> [1]: https://airbus-seclab.github.io/ilo/RECONBRX2018-Slides-Subverting_your_server_through_its_BMC_the_HPE_iLO4_case-perigaud-gazet-czarny.pdf
> [2]: https://www.flamingspork.com/blog/2019/01/23/cve-2019-6260:-gaining-control-of-bmc-from-the-host-processor/

