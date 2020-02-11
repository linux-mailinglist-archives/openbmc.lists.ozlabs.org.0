Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8A158B7F
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 09:53:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GxPf71lYzDqMG
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 19:53:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GxP26RN4zDqMC
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 19:52:38 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01B8nU2Q140889
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 03:52:35 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1uck1u48-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 03:52:35 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Tue, 11 Feb 2020 08:52:33 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Feb 2020 08:52:31 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01B8pZId48234968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Feb 2020 08:51:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08F6A11C054;
 Tue, 11 Feb 2020 08:52:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F19A11C04A;
 Tue, 11 Feb 2020 08:52:26 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.85.87.239])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 Feb 2020 08:52:26 +0000 (GMT)
Subject: Re: FW: Exposing BIOS attributes to a remote management console
To: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>,
 openbmc@lists.ozlabs.org,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
References: <7622d97a-13f2-8c38-6ae8-9325923c3c83@linux.vnet.ibm.com>
 <48777ea3-0af2-4725-9304-64ae4edb71d9@email.android.com>
 <1504A9E7C77EF44697F386AD61B16260152FEBA5@BGSMSX105.gar.corp.intel.com>
 <a54b4da5-b7a9-423e-a01e-720808ae748c@linux.intel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Tue, 11 Feb 2020 14:22:24 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <a54b4da5-b7a9-423e-a01e-720808ae748c@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20021108-0008-0000-0000-00000351C4B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021108-0009-0000-0000-00004A726523
Message-Id: <a5fbffed-c3c9-9c41-a066-bf2f65cc648a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_02:2020-02-10,
 2020-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110065
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

On 10/02/20 4:19 pm, Sekar, Suryakanth wrote:
> Hi Deepak,
> 
> OOB BIOS high level config design doc is in progress. I will send for 
> review soon.


Hi Surya,

Thanks for responding. I'm glad that we have the same understanding on 
this topic.

I'll look out for the design doc from you. Can you share now what 
aspects that document would cover - redfish/in-band/D-Bus implementation 
- all of this? Is Intel planning on writing code for these areas soon? 
We're planning on implementing the PLDM BIOS spec for the same purpose. 
Some PLDM BIOS code's out there on openbmc/pldm already.

> Yes, we need to support all interface -IPMI/ MCTP/ Redfish Host interface.
> 
> If BIOS is not booted at all. BMC wont have any attribute info. It will 
> be empty in BMC side.
> 
> BIOS must provide BIOS OOB capability via KCS interface in early boot stage.
> Like supported proprietary BIOS attribute file format or PLDM support 
> via MCTP  or
> Redfish BIOS attribute registry format to the BMC.
> 
> BIOS must send the master BIOS attributes file(Intel properitary - XML 
> type 0)
> via KCS interface or all attributes details via Bios configuration PLDM 
> via MCTP or
> Redfish host interface during first boot.
> 
> BIOS must collect the new attribute values from BMC and update the same 
> in BIOS
> 
> BIOS must send the updated master attributes file to the BMC and once 
> its updated in BIOS
> 
> and reset the system to reflect the BIOS configuration.
> 
> OOB daemon in BMC  must maintain and collect the  attribute registry 
> file from MCTP/ IPMI/ Redfish interface.

All this sounds good to me.

> Convert the proprietary XML format/ PLDM data  into BIOS attribute 
> Registry format &
> must support the below following dbus method.
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242
> 
> Validate the BIOS input data or User attribute value.
> 
> MCTP / Redfish host interface / IPMI must communicate with OOB daemon in 
> BMC via D bus

Are you targeting specific implementation areas here? By knowing that, 
we can collaborate better.


> Thanks
> 
> Suryakanth.S

Regards,
Deepak

> 
> 
>> ---------- Forwarded message ----------
>> From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com 
>> <mailto:dkodihal@linux.vnet.ibm.com>>
>> Date: Feb 8, 2020 1:59 PM
>> Subject: Exposing BIOS attributes to a remote management console
>> To: openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>> Cc:
>>
>> Hi,
>>
>> To enable remote updates (via a remote management console that talks to
>> the BMC) to the host firmware's BIOS settings table on IBM systems,
>> we're thinking of the following flow:
>>
>> a) The host firmware sends down a BIOS settings table to the BMC using
>> PLDM [1].
>> b) The BMC uses phosphor-settingsd [2] as the backend to store BIOS
>> attributes on D-Bus.
>> c) Bmcweb implements the Redfish BIOS schema [3] to enable remote
>> reads/writes on the BIOS attributes.
>>
>> However, c) is a problem because one needs to write YAML files [4] for
>> the BMC to determine what D-Bus objects to make corresponding to the
>> BIOS attributes. This requires a unique D-Bus interface *per* BIOS
>> attribute. This means the BMC must have prior knowledge about the BIOS
>> attributes.
>>
>> I don't think that's the right way to go about this for two reasons. One
>> - this creates a lockstep dependency on the host firmware when the BIOS
>> settings table needs to be updated, and two - I think the OpenBMC
>> implementation of this must be able to receive (via PLDM/IPMI/other
>> standard in-band means) a set of BIOS attributes from different BIOS
>> firmware stacks dynamically and expose them for out of band updates,
>> without having prior/build-time knowledge of those attributes. So I
>> think this calls for a different kind of D-Bus interface/infrastructure
>> than what the phosphor-settingsd app relies on. Something that enables
>> the BMC to add to D-Bus a BIOS attribute dynamically, knowing it's name,
>> type and default value.
>>
>> Any thoughts on this flow? I'm also curious to know if the Redfish BIOS
>> schema/attribute registry model requires the BMC to have prior knowledge
>> about the system BIOS attributes to update the registry. This wasn't
>> obvious to me from a quick read of the schema.
>>
>> Thanks,
>> Deepak
>>
>> [1]
>> https://www.dmtf.org/sites/default/files/standards/documents/DSP0247_1.0.0.pdf
>> [2] https://github.com/openbmc/phosphor-settingsd
>> [3] https://redfish.dmtf.org/schemas/v1/Bios.v1_1_0.json
>> [4]
>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/defaults.yaml
>>

