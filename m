Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF638D4C
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 16:36:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45L4q73DkHzDqxq
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2019 00:36:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45L4np2ncszDqxW
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jun 2019 00:35:41 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x57EP03Y088296
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jun 2019 10:35:36 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sypsu91hn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jun 2019 10:35:35 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Fri, 7 Jun 2019 15:35:34 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Jun 2019 15:35:31 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x57EZUge22937956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 14:35:30 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2E866A051;
 Fri,  7 Jun 2019 14:35:30 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E34A6A04D;
 Fri,  7 Jun 2019 14:35:30 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 14:35:30 +0000 (GMT)
Subject: Re: [Design] PSU firmware update
To: Adriana Kobylak <anoo@linux.ibm.com>, Lei YU <mine260309@gmail.com>
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <20190604182635.GD46814@mauery.jf.intel.com>
 <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
 <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
 <CAARXrt=6DwO7cAxyEJ=FEUPF4+gU9npJtWmd31LuqmTpxHu98w@mail.gmail.com>
 <b20a0ffd292efcafc8e4ebad40d810bc@linux.vnet.ibm.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Date: Fri, 7 Jun 2019 09:35:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b20a0ffd292efcafc8e4ebad40d810bc@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19060714-8235-0000-0000-00000EA50B6A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011228; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214563; UDB=6.00638456; IPR=6.00995648; 
 MB=3.00027222; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-07 14:35:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060714-8236-0000-0000-000045EA70D6
Message-Id: <fdc1cbfa-d337-7219-b748-b251e6f80272@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070102
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 6/6/2019 3:31 PM, Adriana Kobylak wrote:
> On 2019-06-05 22:31, Lei YU wrote:
>> On Wed, Jun 5, 2019 at 10:25 PM Matt Spinler <mspinler@linux.ibm.com> 
>> wrote:
>>>
>>>
>>> On 6/5/2019 1:18 AM, Lei YU wrote:
>>> >>> The PSU firmware code update will re-use the current interfaces 
>>> to upload,
>>> >>> verify, and activate the image.
>>> >> We would like the option to be able to ship the PSU firmware as 
>>> part of
>>> >> the BMC image (in the root filesystem). This means that it is 
>>> already
>>> >> present and authenticated when the BMC boots. In this way, we 
>>> know that
>>> >> the current BMC firmware plays well with the PSU firmware and 
>>> have fewer
>>> >> variables to test for when making a release.
>>> > Because the PSU firmware is part of BMC image, this seems a 
>>> completely
>>> > different approach, and more like part of BMC image update, is it?
>>> > I would expect this should not be part of this design, what do you 
>>> think?
>>>
>>> FYI, I am 99% sure this is how IBM needs its systems to work as well.
>>> That being the case,
>>>
>>> will you also be handling this design?
>>
>> Good to know.
>>
>> Then a question comes up:
>> In which cases PSU firmware update shall be done?
>> 1. It is updated together with BMC firmware update as described by 
>> Vernon
>>    Mauery;
>> 2. It is updated independently with APIs, as described in this design 
>> doc.
>>
>> Will 1 and 2 both be valid, or only 1 is the real case and we do not 
>> need to
>> support 2?
>>
>
> I see it as having a single tarball file that has the required files 
> to update the
> BMC and the PSU. When this tarball is uploaded, then a new Version 
> with a Purpose
> of System or some other name is created. When this Version is 
> activated, this
> triggers the BMC updater (existing) and the PSU updater (new) to check 
> if all
> the necessary files to perform the update of their component exist. If 
> yes, each
> updater updates their piece and if any one fails it'd mark the Version 
> as Failed
> (TBD on synchronizing the updaters to mark the Version as Active or 
> Failed).
> So the PSU would be updated at the same time as the BMC, but done by 
> its own
> updater application.
>
> Thoughts?

3 more quick notes:

1) PSs can be hot pluggable, so when a new one is detected, the code
update should run then too if the new PS needs one, assuming all other
conditions are met.

2) A single system may support multiple models of PS (will definitely
happen for us), so this design should be able to store multiple PS
images and send the correct image to the correct model.

3) You mentioned the combined image stuff before.  We should just check
the timeline for that support aligns with this one.






>
>> The reason I ask is because if we could get clear requirements, it is 
>> possible
>> to simplify the design.

