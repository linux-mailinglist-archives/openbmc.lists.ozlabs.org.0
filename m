Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5011D2588
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 05:44:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49My8m5zGYzDqlV
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 13:44:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49My825xHJzDqjT
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 13:44:01 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E3ZrrJ192753; Wed, 13 May 2020 23:43:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310uaym760-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 23:43:56 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04E3c7so014023;
 Wed, 13 May 2020 23:43:55 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310uaym75j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 23:43:55 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04E3drcs021480;
 Thu, 14 May 2020 03:43:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3100ub2s7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 03:43:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04E3hoKv57868370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 May 2020 03:43:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1B684C046;
 Thu, 14 May 2020 03:43:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 768FF4C040;
 Thu, 14 May 2020 03:43:49 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.240.174])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 May 2020 03:43:48 +0000 (GMT)
Subject: Re: Storing host data on the BMC
To: Patrick Williams <patrick@stwcx.xyz>,
 Sunitha Harish <sunithaharish04@gmail.com>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
 <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
 <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
 <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
 <20200511120719.GA10214@heinlein>
 <0000b55c-29a9-b0fa-b72f-c4f19d4c7d12@gmail.com>
 <8db810a0-6bc4-5ad5-0f54-f739fe6dde81@gmail.com>
 <20200513211857.GA1166713@heinlein>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <10275d64-bebd-cb33-0a16-21299b7b1880@linux.vnet.ibm.com>
Date: Thu, 14 May 2020 09:13:47 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513211857.GA1166713@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_09:2020-05-13,
 2020-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 cotscore=-2147483648
 mlxlogscore=999 bulkscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005140030
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
Cc: openbmc <openbmc@lists.ozlabs.org>, dkodihal@in.ibm.com,
 suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14/05/20 2:48 am, Patrick Williams wrote:
> On Wed, May 13, 2020 at 08:37:32PM +0530, Sunitha Harish wrote:
>> My scenario is :
>> 1. Redfish client sets the host interface parameters for the IPv4
>> address. These user settable values are stored in the DBus.
> 
> Ignoring which process "stores" this data, we have two mechanisms over
> DBus to store this kind of data.  I can't tell fully from your
> explaination which is more appropriate for this data.
> 
> 1. Data we want to split out into well-formed, existing dbus objects.
> 
>      * We already have interfaces to store networking information under
>        xyz/openbmc_project/Network.
> 
> 2. Data which is generic / opaque to the BMC and we're just using the
>     BMC as a "storage location".
> 
>     * This would be the proposed BIOS attributes interface.
> 
> So the question to you is, do you want the BMC to actively interact with
> and manage this data, like we do for our own data, or do you want the
> BMC to just be a dumb passthru of this data?
> 
>> 2. When the system is powered on , the pldm reads these DBus values ,
>> and sets the BIOS attributes.
>> 3. The hypervisor reads this BIOS attributes for the interfaces and sets
>> them.
> 
> It doesn't seem like two steps matter with respect to the 1/2 above.
> Where the data is obtained in this regard can be self-contained in your
> PLDM provider, correct?
> 
>> 4. Now the hypervisor sends an indication to the pldm that the IP
>> address is active at its interface and its Origin is Static ( ie : user
>> configured) OR it is DHCP ( ie: not user configured, if its DHCP enabled)
>> 5. The pldm should store this Origin value "somewhere".
> 
> This description makes it seem like you want it to be more "managed"
> data than "opaque", if I'm reading this correctly.
> 
>> Redfish client would need this value to interpret where the IP address
>> has been Originated from. So we need a DBus property to save it. But ,
>> this is actually an attribute which is set by the hypervisor/host - a
>> pldm sensor. Its not suitable to be fit into the BIOS table. My
>> question&proposal is about how/where to store this value?
> 
> I think we need to be careful about being hung up on the name "BIOS
> table".  For opaque data that is more OS-centric,  we could  make the
> proposed "BIOS Attributes" interface more generic to store different
> levels of host-owned data: BIOS, Hypervisor, OS.  This might be a good
> comment to make on the interface code review.

I think the current proposal from Surya enables this already. Do you 
just mean the design doc should explicitly state this isn't restricted 
to the "BIOS" firmware.

As far as Sunitha's question goes, my point is that not all host 
firmware generated data is a BIOS attribute. For eg if the host tells me 
about the presence of certain FRUs, or their functional states, I 
wouldn't want to store those in the BIOS attributes backend, I'd rather 
associates those with the existing D-Bus interfaces for the FRU 
inventory. I think the same applies to the Origin property that has been 
described - associate with the networking D-Bus backend.

> If you are wanting the data to be managed, utilizing existing DBus
> interfaces we have around networking, doesn't phosphor-settingsd cover
> that from an implementation perspective?

I don't think the 'Origin' property is a setting.

Regards,
Deepak

