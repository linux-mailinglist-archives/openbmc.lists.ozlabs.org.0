Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3C3BDDA
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 22:53:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N52J4qW1zDqSB
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 06:53:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derekh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N4q151HyzDqQW
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 06:43:40 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5AKWKgQ074198
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 16:43:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t1v6sdfe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 16:43:37 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5AKYk4j081257
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 16:43:37 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t1v6sdfe2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2019 16:43:37 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5AKdwF1022061;
 Mon, 10 Jun 2019 20:41:32 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2t1x6s82qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2019 20:41:32 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5AKhY1C26083690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jun 2019 20:43:34 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CF246E050;
 Mon, 10 Jun 2019 20:43:34 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D3756E04E;
 Mon, 10 Jun 2019 20:43:31 +0000 (GMT)
Received: from [9.10.99.138] (unknown [9.10.99.138])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jun 2019 20:43:30 +0000 (GMT)
Subject: Re: [Design] PSU firmware update
To: Lei YU <mine260309@gmail.com>
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <20190604182635.GD46814@mauery.jf.intel.com>
 <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
 <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
 <CAARXrt=6DwO7cAxyEJ=FEUPF4+gU9npJtWmd31LuqmTpxHu98w@mail.gmail.com>
 <b20a0ffd292efcafc8e4ebad40d810bc@linux.vnet.ibm.com>
 <fdc1cbfa-d337-7219-b748-b251e6f80272@linux.ibm.com>
 <6614b24b-7552-65e7-bebb-1bc07ac62643@linux.vnet.ibm.com>
 <CAARXrt=c-w0pZeR7-zxekxqn5sHCbKYRaLR6R7x1R_uKhi_TuQ@mail.gmail.com>
From: Derek Howard <derekh@linux.vnet.ibm.com>
Message-ID: <87268092-6a52-d50e-6c89-a1ce3877ed03@linux.vnet.ibm.com>
Date: Mon, 10 Jun 2019 15:43:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAARXrt=c-w0pZeR7-zxekxqn5sHCbKYRaLR6R7x1R_uKhi_TuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906100139
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


On 6/9/2019 10:16 PM, Lei YU wrote:
>>> 3 more quick notes:
>>>
>>> 1) PSs can be hot pluggable, so when a new one is detected, the code
>>> update should run then too if the new PS needs one, assuming all other
>>> conditions are met.
>>>
>>> 2) A single system may support multiple models of PS (will definitely
>>> happen for us), so this design should be able to store multiple PS
>>> images and send the correct image to the correct model.
>>>
>>> 3) You mentioned the combined image stuff before.  We should just check
>>> the timeline for that support aligns with this one.
>>>
>>>
>> Good point Matt on the PS install.  It would probably be a good idea to
>> get the newly installed PS to the same image as the rest of the PS's in
>> the system.
> Yup, really good point.
> This implies that BMC shall keep a local copy of the PSU image for future
> updates.
>
>> We do support PS's that don't provide control supply (standby voltage)
>> when reset at the end of the update, while other PS's do.  Therefore for
>> the former case, if only 1 PS has AC attached, we cannot update/reset
>> that PS, so please let that be selectable by the user (eg vendor
>> specific tool).
> This is somehow complex, but if we could defer this to vendor specific tool,
> that's OK.
> However, if a system has multiple models of PS, I am not sure how the vendor
> specific tool will be.
> Should we defer that to vendor specfic tool, too?
Sounds fine to me, thanks.
>> Also, please provide a way to know that the updates have finished.  As
>> we don't want to update the PS's when the power is on (this is vendor
>> specific as well), we also do not want to power the system on in the
>> middle of an update.  For example, if after a BMC update the PS's are
>> being updated, we want to hold off the next system power on until the PS
>> updates have finished. Thanks.
> This is already supported by the existing interface.
Excellent!
>
>>>
>>>>> The reason I ask is because if we could get clear requirements, it
>>>>> is possible
>>>>> to simplify the design.
>> Would it be possible to support both methods?  The general use case
>> being done during/after BMC code update, but also support the more
>> manual method that could be used perhaps in the lab to test new psu
>> images or in the field if there are problems with an existing image? Thanks.
> This design doc will be updated to support both cases.
>
