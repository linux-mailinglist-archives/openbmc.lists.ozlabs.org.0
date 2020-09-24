Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB855276AC9
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 09:31:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxmv32KfZzDqNp
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 17:31:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZFmPCNZ/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxmt40CbGzDqLR
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 17:30:35 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O72WsP101606; Thu, 24 Sep 2020 03:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=akF9u5B5wlDL5U76hTF/pEgqnaSJ4/qp4Jz5zGXsMVI=;
 b=ZFmPCNZ/F1VTfTnUI9xdD+u+Gx8rTxCQ3SQt5WNeKCDvCJut+DlFzBU1efWIeRFtSjSc
 iZgxRylBhTbl3PokTrzINsCKwBV/fTQj3Jj89DvoHAwm5mGxVVGx/BaTMJxyYTsxxqZx
 ckdg0eS2rtDEYWXCVvrUyEhdqTrHqjckukRuoWvHzQgYSiXxTRg4cOl3ObJXtd7iV4Fc
 Ur5ttwBBc2adVn1f+NOUtdXlXt35ZwhvCvjbywftwCap23DW2tQHbaod4Gb8fQDcuhSO
 1CEqmTbBPbO5yQ4ndEh/6FYSbs3MigBaZKvngfHMB5VQ5wcDnmOAZBlCNWf2Y2v7L6NO Lw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33rp161v2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 03:30:31 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08O7MQWl032284;
 Thu, 24 Sep 2020 07:30:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 33payubqur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 07:30:29 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08O7UPDa30998944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 07:30:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 054FFA405E;
 Thu, 24 Sep 2020 07:30:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 524E9A404D;
 Thu, 24 Sep 2020 07:30:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.81.211])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Sep 2020 07:30:25 +0000 (GMT)
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: Patrick Williams <patrick@stwcx.xyz>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
 <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
 <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
 <20200923192457.GS6152@heinlein>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <090d9568-ad4a-68f7-b5a5-74656dc984c3@linux.vnet.ibm.com>
Date: Thu, 24 Sep 2020 13:00:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200923192457.GS6152@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_02:2020-09-24,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240051
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
Cc: openbmc@lists.ozlabs.org, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/24/20 12:54 AM, Patrick Williams wrote:
> On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
>> Hi All,
>>
>> Adding one more problem here with settings infra and with some proposed
>> solutions.
>>
>> Problem Domain:
>>
>>         - With multi property update from redfish , webserver updates the
>> settings object
>>         - PLDM on bmc listens on the property update of settings object
>> and notifies to Hypervisor
>>         - As there can be multiple properties in single PATCH operation,
>> PLDM on bmc sends
>>           multiple Notifications to Hypervisor
>>         - Specifically in case of network config,  single property update
>> on phyp may lead to network inconsistency.
> The original bios config seemed to only apply settings at specific times
> (ie. when the BIOS restarts) but your problem seems to indicate that
> you're immediately sending settings up to the host whenever they change?
Yes, you are correct we are sending immediately to the host.
>
>> How can we solve this?
>>
>>    * Proposal 1: Add one more property in the settings Dbus object itself
>>      which tells that it is ready to be read, PLDM on the BMC watching on
>>      that property and read the whole network configuration and notifies
>>      Hypervisor.
>>
>>    * Proposal 2: Hypervisor runs the timer if the bios attr belongs to
>>      network configuration and once the timer expires,it reads the bios
>>      attr related to network and applies it.
>>
>>    * Proposal 3: Add one more bios attribute in the bios table which
>>      tells that Bios configuration can be read and applied by the
>>      Hypervisor for the network configuration.
> It is unfortunate that org.freedesktop.DBus.Properties doesn't have a
> way to set multiple properties as the analogous operation to 'GetAll'.
>
> In the case of networking, how do we handle this for the BMC settings?
> Don't we have a similar situation where multiple properties are changed
> via some interface and could leave the network in an unusual state?  I'm
> thinking IPMI does this.

I hope you are asking for BMC network settings where we wait for a 
certain amount of time and then apply the settings,same with IPMI.

> When all of our DBus objects were serial we likely never had this issue
> because the request to read the properties (to send to the hypervisor)
> would come behind the signal and subsequent property updates.  Now that
> we're moving towards more ASIO we likely will see this kind of issue
> more often.  I don't like it but we could certainly proposal a
> 'SetMultiple' extension to org.freedesktop or create our own interface.
>
> Proposal #2 isn't great because, well, how long do you wait?  In the
> case of hypervisor updates, delaying something on the order of a second
> is probably sufficient for Redfish/PLDM, but that doesn't really
> generally solve the problem.
>
> We could define an interface to implement something like Proposal #1,
> but we would need a new interface and not a property we tack onto
> existing interfaces.  We'd probably need to revisit a lot of our
> interface definitions and see which ones typicallly have multi-property
> updates and does an intermediate state leave us in a bad situation.
My point was to add a property through new Dbus Interface, sorry for the 
confusion.
>
> Specifically for BIOS/Hypervisor settings, I mentioned before that it
> isn't clear to me what the proposal is for applying Pending to Current.
> Again, this isn't general, but we could define an interface specific for
> BIOS/Hypervisor settings which has a way to indicate 'Pending
> transaction is complete' (set by entities like Redfish) and 'Pending
> values applied to Current' (set by entities like PLDM).  For the current
> settings-style values though, this requires external interfaces to
> somehow know that the setting is associated with the Host in order to do
> the application, since BMC-owned properties won't have or need this.
>
