Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6E390A6
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 17:54:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45L6X81hNpzDqyb
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2019 01:54:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derekh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45L6Vv35QDzDqx2
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jun 2019 01:52:53 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x57FhYTl010360
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jun 2019 11:52:49 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2syt053349-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jun 2019 11:52:49 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <derekh@linux.vnet.ibm.com>;
 Fri, 7 Jun 2019 16:52:49 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Jun 2019 16:52:47 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x57Fqkff33030590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jun 2019 15:52:46 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DDFE28065
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jun 2019 15:52:46 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 306EE2805A
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jun 2019 15:52:46 +0000 (GMT)
Received: from [9.10.99.138] (unknown [9.10.99.138])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jun 2019 15:52:46 +0000 (GMT)
Subject: Re: [Design] PSU firmware update
To: openbmc@lists.ozlabs.org
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <20190604182635.GD46814@mauery.jf.intel.com>
 <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
 <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
 <CAARXrt=6DwO7cAxyEJ=FEUPF4+gU9npJtWmd31LuqmTpxHu98w@mail.gmail.com>
 <b20a0ffd292efcafc8e4ebad40d810bc@linux.vnet.ibm.com>
 <fdc1cbfa-d337-7219-b748-b251e6f80272@linux.ibm.com>
From: Derek Howard <derekh@linux.vnet.ibm.com>
Date: Fri, 7 Jun 2019 10:52:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <fdc1cbfa-d337-7219-b748-b251e6f80272@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19060715-0064-0000-0000-000003EB3BFE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011228; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214589; UDB=6.00638471; IPR=6.00995674; 
 MB=3.00027223; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-07 15:52:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060715-0065-0000-0000-00003DCB234C
Message-Id: <6614b24b-7552-65e7-bebb-1bc07ac62643@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070108
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


On 6/7/2019 9:35 AM, Matt Spinler wrote:
>
> On 6/6/2019 3:31 PM, Adriana Kobylak wrote:
>> On 2019-06-05 22:31, Lei YU wrote:
>>> On Wed, Jun 5, 2019 at 10:25 PM Matt Spinler 
>>> <mspinler@linux.ibm.com> wrote:
>>>>
>>>>
>>>> On 6/5/2019 1:18 AM, Lei YU wrote:
>>>> >>> The PSU firmware code update will re-use the current interfaces 
>>>> to upload,
>>>> >>> verify, and activate the image.
>>>> >> We would like the option to be able to ship the PSU firmware as 
>>>> part of
>>>> >> the BMC image (in the root filesystem). This means that it is 
>>>> already
>>>> >> present and authenticated when the BMC boots. In this way, we 
>>>> know that
>>>> >> the current BMC firmware plays well with the PSU firmware and 
>>>> have fewer
>>>> >> variables to test for when making a release.
>>>> > Because the PSU firmware is part of BMC image, this seems a 
>>>> completely
>>>> > different approach, and more like part of BMC image update, is it?
>>>> > I would expect this should not be part of this design, what do 
>>>> you think?
>>>>
>>>> FYI, I am 99% sure this is how IBM needs its systems to work as well.
>>>> That being the case,
>>>>
>>>> will you also be handling this design?
>>>
>>> Good to know.
>>>
>>> Then a question comes up:
>>> In which cases PSU firmware update shall be done?
>>> 1. It is updated together with BMC firmware update as described by 
>>> Vernon
>>>    Mauery;
>>> 2. It is updated independently with APIs, as described in this 
>>> design doc.
>>>
>>> Will 1 and 2 both be valid, or only 1 is the real case and we do not 
>>> need to
>>> support 2?
>>>
>>
>> I see it as having a single tarball file that has the required files 
>> to update the
>> BMC and the PSU. When this tarball is uploaded, then a new Version 
>> with a Purpose
>> of System or some other name is created. When this Version is 
>> activated, this
>> triggers the BMC updater (existing) and the PSU updater (new) to 
>> check if all
>> the necessary files to perform the update of their component exist. 
>> If yes, each
>> updater updates their piece and if any one fails it'd mark the 
>> Version as Failed
>> (TBD on synchronizing the updaters to mark the Version as Active or 
>> Failed).
>> So the PSU would be updated at the same time as the BMC, but done by 
>> its own
>> updater application.
>>
>> Thoughts?
>
> 3 more quick notes:
>
> 1) PSs can be hot pluggable, so when a new one is detected, the code
> update should run then too if the new PS needs one, assuming all other
> conditions are met.
>
> 2) A single system may support multiple models of PS (will definitely
> happen for us), so this design should be able to store multiple PS
> images and send the correct image to the correct model.
>
> 3) You mentioned the combined image stuff before.  We should just check
> the timeline for that support aligns with this one.
>
>
Good point Matt on the PS install.  It would probably be a good idea to 
get the newly installed PS to the same image as the rest of the PS's in 
the system.

We do support PS's that don't provide control supply (standby voltage) 
when reset at the end of the update, while other PS's do.  Therefore for 
the former case, if only 1 PS has AC attached, we cannot update/reset 
that PS, so please let that be selectable by the user (eg vendor 
specific tool).

Also, please provide a way to know that the updates have finished.  As 
we don't want to update the PS's when the power is on (this is vendor 
specific as well), we also do not want to power the system on in the 
middle of an update.  For example, if after a BMC update the PS's are 
being updated, we want to hold off the next system power on until the PS 
updates have finished. Thanks.

>
>
>>
>>> The reason I ask is because if we could get clear requirements, it 
>>> is possible
>>> to simplify the design.
>
Would it be possible to support both methods?  The general use case 
being done during/after BMC code update, but also support the more 
manual method that could be used perhaps in the lab to test new psu 
images or in the field if there are problems with an existing image? Thanks.


