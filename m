Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B862741D3
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 14:09:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwg9F18ZfzDqkG
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 22:09:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KA8/b3kY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwg7t3HP4zDqFL
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 22:08:41 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MC1mKi094826; Tue, 22 Sep 2020 08:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : cc : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BawNM42dtPdp2OOq8cvHJWtrBTWKhsP/29DSr+zqZnA=;
 b=KA8/b3kYHO3x7k8wOC2CwS6O9W640w0b/LGOBbMDRlKYZIlrECKLJ0uWWBUkb1UgJkzb
 MtM4mWX9B26zeLdgYZYLn5Fxl+yEH3VNEC5eLkwR3gHPGPOrRtYGoZFrywMiBfrWsHR8
 lTbjx/q6a/CuyBti0lUEe9WQIOsPJuwAZMB0cGQTJRCu8SDA8f5BZw3CE6LZiru9bAIo
 wIFkapjg1l2IsD/Hm/SG/Lg4D48wv+RU2K/TgKoKzu9z24Qi7H4B7dx5ooyR7ZW+ospq
 uhM8E/3mr8/u3iAEgurY68Qmd/ikfG1/FeGOML5PNORYM8BOXPY53a8282/484pHTo0I jg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33qfxuj1gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 08:08:39 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08MC8bHb005201;
 Tue, 22 Sep 2020 12:08:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 33payu9srv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 12:08:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08MC8ZWd29753780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Sep 2020 12:08:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46A0BA4066;
 Tue, 22 Sep 2020 12:08:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A52E0A405C;
 Tue, 22 Sep 2020 12:08:33 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.255.180])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Sep 2020 12:08:33 +0000 (GMT)
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>, Ed Tanous <ed@tanous.net>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
 <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
 <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <08d2b666-91cf-d60a-1f2b-028e6ca6eaa5@linux.vnet.ibm.com>
Date: Tue, 22 Sep 2020 17:38:32 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_09:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220094
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

On 22/09/20 2:39 pm, Ratan Gupta wrote:
> Hi All,
> 
> Adding one more problem here with settings infra and with some proposed 
> solutions.

Hi Ratan,

Thanks for bringing this problem out!

> Problem Domain:
> 
>        - With multi property update from redfish , webserver updates the 
> settings object
>        - PLDM on bmc listens on the property update of settings object 
> and notifies to Hypervisor

To add to this, from a PLDM perspective, we plan to send up the 
hypervisor network config properties to the host as BIOS attributes. 
There isn't a PLDM network config schema. The PLDM daemon talks to the 
new bios-settings-mgr app to find BIOS properties that have been updated 
out of band. The Redfish schema we plan to use here is EthernetInterface 
though, and not the Redfish BIOS schema. All this is causing a need for 
some conversion layers.

My initial thought was bmcweb can update the BIOS backend store that's 
implemented by the bios-settings-mgr, but it looks like Patrick and Ed 
have concerns with that approach. I think I agree their reasoning, but 
at the same time I don't think there should be special code in the PLDM 
daemon (timers/special knowledge about a set of BIOS attributes/special 
BIOS attribute which indicates other BIOS attributes have been 
updated/etc) for this, and this should be processed like any other BIOS 
attribute that the PLDM daemon deals with. This implies these attributes 
should also make it to the store that bios-settings-mgr owns (that 
likely means an additional D-Bus hop). So, another option (proposal 4) 
could be an intermediate app that accumulates (for eg by means of 
watching the 'Enabled' property that's in the Object.Enable interface; 
the hypervisor settings object would have to additionally implement this 
interface) the hypervisor network config property updates, and then 
provides these as key-value pairs to the bios-settings-mgr app.

>        - As there can be multiple properties in single PATCH operation, 
> PLDM on bmc sends
>          multiple Notifications to Hypervisor
>        - Specifically in case of network config,  single property update 
> on phyp may lead to network inconsistency.
> 
> How can we solve this?
> 
>   * Proposal 1: Add one more property in the settings Dbus object itself
>     which tells that it is ready to be read, PLDM on the BMC watching on
>     that property and read the whole network configuration and notifies
>     Hypervisor.
> 
>   * Proposal 2: Hypervisor runs the timer if the bios attr belongs to
>     network configuration and once the timer expires,it reads the bios
>     attr related to network and applies it.
> 
>   * Proposal 3: Add one more bios attribute in the bios table which
>     tells that Bios configuration can be read and applied by the
>     Hypervisor for the network configuration.
> 
> 
>    Looking for suggestion what could be the best way here?
> 
> Ratan
> 
> On 9/19/20 11:11 AM, Ratan Gupta wrote:
>>
>> On 9/17/20 9:06 PM, Patrick Williams wrote:
>>> On Thu, Sep 17, 2020 at 01:10:06PM +0530, Ratan Gupta wrote:
>>>> We need to address the below two concerns with the existing settings 
>>>> infra.
>>> Both of these seem like missing features based on our now greater
>>> understanding of the problem domain from where we were 3-4 years ago
>>> when phosphor-settings-manager was originally written, right? That
>>> doesn't seem like a good reason to entirely throw out the approach.
>>>
>>>>    * Pending v/s configured value: Currently settings have single Dbus
>>>>      Object, Some properties which is for host firmware we need to have
>>>>      two placeholders one for Pending values and one for Configured
>>>>      values. Bios settings have this concept.
>>>>        o Should we add two Dbus objects in settings infra?
>>> This was going to be my suggestion, yes.  You could have two sets of the
>>> objects: current and pending.  'current' objects may not be written by
>>> dbus-clients.  These are the same terms used by the BIOSConfig proposal.
>> Thanks Patrick, seems reasonable to have two D-bus objects.
>>>
>>> What I am not seeing in BIOSConfig and is equally applicable here is
>>> _when_ pending is applied to current.  You will need some interface that
>>> IPMI / PLDM can call to apply those settings?  Or, do you monitor host
>>> state signals automatically?
>>>
>>>>    * Dynamic Dbus objects: Currently settings infrastructure is only 
>>>> for
>>>>      static objects, Objects which gets added on runtime, settings 
>>>> infra
>>>>      doesn't support that.
>>>>        o Eg: IP address on ethernet interface is dynamic in nature, An
>>>>          ethernet interface can have multiple IP address on it.
>>>>          considering if SLAAC is enabled(ipV6).
>>>>        o Seems this problem is common for both(settings v/s 
>>>> bios-settings)
>>> I assume these would be requested for creation by IPMI / PLDM? We could
>>> use a similar model to xyz.openbmc_project.Inventory.Manager where
>>> objects are requested for creation dynamically through a method.
>> We don't have this requirement now but in near future it is going to
>> be there, we can improve the settings infra to support this.
>>>

