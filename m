Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABED31E7B25
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 13:04:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YMC70K94zDqgp
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 21:04:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YMBT4yJTzDqf0
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 21:03:44 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04TB2IRb073799; Fri, 29 May 2020 07:03:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31as1b5cbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 07:03:41 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04TB2Krg074039;
 Fri, 29 May 2020 07:03:40 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31as1b5can-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 07:03:40 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04TAxe0F001302;
 Fri, 29 May 2020 11:03:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 316uf93t5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 11:03:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04TB3ans59441252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 11:03:36 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1E9A5204F;
 Fri, 29 May 2020 11:03:35 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.241.132])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AD3AE5207D;
 Fri, 29 May 2020 11:03:34 +0000 (GMT)
Subject: Re: Storing host data on the BMC
To: Sunitha Harish <sunithaharish04@gmail.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
 <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
 <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
 <20200511120719.GA10214@heinlein>
 <0000b55c-29a9-b0fa-b72f-c4f19d4c7d12@gmail.com>
 <8db810a0-6bc4-5ad5-0f54-f739fe6dde81@gmail.com>
 <20200513211857.GA1166713@heinlein>
 <10275d64-bebd-cb33-0a16-21299b7b1880@linux.vnet.ibm.com>
 <20200514123350.GB1166713@heinlein>
 <7a159b9d-ec82-fed9-a9e1-23ffdf1c62e5@gmail.com>
 <534fbbca-ffe2-450d-b5e3-ef664c2a3729@gmail.com>
 <9de48a92-bb18-7c0f-0a68-68e9808a46d3@linux.vnet.ibm.com>
 <fb32d35b-2a58-3eea-38df-ab9f7bf641f8@gmail.com>
 <c9e6ab3e-e9f3-a58c-69c1-d830da6e5cf0@gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <42df1dd1-1c53-cdf1-a0cf-9cada6b5faff@linux.vnet.ibm.com>
Date: Fri, 29 May 2020 16:33:33 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <c9e6ab3e-e9f3-a58c-69c1-d830da6e5cf0@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_06:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 cotscore=-2147483648 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290084
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/05/20 4:27 pm, Sunitha Harish wrote:
> 
> On 22-05-2020 09:29, Sunitha Harish wrote:
>>
>> On 21-05-2020 10:46, Deepak Kodihalli wrote:
>>> On 21/05/20 10:42 am, Sunitha Harish wrote:
>>>> Hi,
>>>>
>>>> Any inputs?
>>>>
>>>> Thanks & regards,
>>>> Sunitha
>>>
>>> Hi Sunitha,
>>>
>>> I believe you had got a direction based on the discussion below.
>>>
>>>>>>> As far as Sunitha's question goes, my point is that not all host
>>>>>>> firmware generated data is a BIOS attribute. For eg if the host 
>>>>>>> tells me
>>>>>>> about the presence of certain FRUs, or their functional states, I
>>>>>>> wouldn't want to store those in the BIOS attributes backend, I'd 
>>>>>>> rather
>>>>>>> associates those with the existing D-Bus interfaces for the FRU
>>>>>>> inventory. I think the same applies to the Origin property that 
>>>>>>> has been
>>>>>>> described - associate with the networking D-Bus backend.
>>>>>> I think we're in agreement here.  Data which is interesting to 
>>>>>> represent
>>>>>> on the BMC, for which we already have a defined-interface, use 
>>>>>> it.  For
>>>>>> data which isn't interesting the to BMC, use the generic BIOS 
>>>>>> attribute
>>>>>> table.
>>>
>>> ^^ You use existing (or come up with new) D-Bus interfaces to 
>>> represent your data. Those D-Bus interfaces can be implemented by 
>>> settingsd or networkd or something else.
>>
>> If i am getting it correctly , the current changes which were made to 
>> the phosphor-settings-manager should be good enough to handle all the 
>> scenarios.
>>
>> In my last email i mentioned that ===>>
>> -------------------------------------------------------------------------------------------------------------------------- 
>>
>> When the Ethernet interface set to be DHCP enabled ( by setting the 
>> Bios attribute DHCPEnabled = true via redfish), the IPAddress, 
>> SubnetMask and Gateway along with the Origin property will not be Bios 
>> settings. Here the user setting is the DHCPEnabled property of ?
>>
>> However in the case of Static IP configuration(IPAddress, SubnetMask 
>> and Gateway) they will become bios setting.
>> --------------------------------------------------------------------------------------------------------------------------- 
>>
>> Currently we are using the xyz.openbmc_project.Network.IP and this 
>> interface is being implemented by settings object - 
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30424/
>> Do you see any issue here?
> 
> Hi , any feedback ?

Sorry I forgot to respond to this. If your question is whether the 
Origin property (and the interface it lies in) can be implemented by 
phosphor-settingsd, then I think the answer is yes. We did say that we 
can look at phosphor-settingsd as an arbitrary data holder (not limited 
to user settings).

> Thanks & regards,
> Sunitha
>>
>>> Thanks,
>>> Deepak
>>>

