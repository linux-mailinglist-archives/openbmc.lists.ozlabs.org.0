Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C52771E7
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 15:12:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxwSY5TCLzDqYC
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 23:12:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RHuHP4BE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxwNf75fGzDqfv
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 23:09:06 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08OD2VEu178126; Thu, 24 Sep 2020 09:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+vgfsYX/JhwPyyk0oDTiZwQKlgztguyNF4XA1MnRvjc=;
 b=RHuHP4BERq6UF1e8G87fvEMTOv79ILrDEKEy6+KE7Sy7h67pn8/ooKwH00x4HsiUtW6s
 ekVItn2FKUS/cXcLufm4PGUlDPiyivC1abVtnelSrenQsheiteP/qQLxVb2XqKknRTRj
 0GvIwiKUqzl2EGkjbc3gT9xTjMH4jQqHFiiQrBccJDAbPxaqCe+0KN46hJtUt6m03cRX
 ncjjXBycT3UuHyCTua+cs7kZ7PFdpayN2cRgzHV29i4KTxUOF+PfuoujOQlcpzdfyOGN
 TTYtDBR/dnJsay5pBuFfthx2VuC99/7oEOUvvzhqOYJP2wdsLZB9yFxhpoLjEyRARXzH Ew== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33rusagrbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 09:09:03 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08OCqpLB030771;
 Thu, 24 Sep 2020 13:09:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 33n9m8d8gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 13:09:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08OD8x3S30212380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 13:08:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43748A4054;
 Thu, 24 Sep 2020 13:08:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30F04A405C;
 Thu, 24 Sep 2020 13:08:58 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.233.221])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Sep 2020 13:08:57 +0000 (GMT)
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: Patrick Williams <patrick@stwcx.xyz>, Ed Tanous <ed@tanous.net>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
 <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
 <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
 <20200923192457.GS6152@heinlein>
 <CACWQX83TAW8TfAUaNSkO7UA0VrYKjut8uFnd6pF3RgcJm_EDrA@mail.gmail.com>
 <20200923212645.GU6152@heinlein>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <1f293bec-c4c8-d41b-8ce3-8274f0495e85@linux.vnet.ibm.com>
Date: Thu, 24 Sep 2020 18:38:57 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923212645.GU6152@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_08:2020-09-24,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240097
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24/09/20 2:56 am, Patrick Williams wrote:
> On Wed, Sep 23, 2020 at 01:51:33PM -0700, Ed Tanous wrote:
>> On Wed, Sep 23, 2020 at 12:24 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>>>
>>> On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
>>>
>>> It is unfortunate that org.freedesktop.DBus.Properties doesn't have a
>>> way to set multiple properties as the analogous operation to 'GetAll'.
>>
>> It was proposed we (OpenBMC) add one while back.  I think it muddies
>> the water of what it means to be a method call, and what it means to
>> be a property, especially for the use case that it was being proposed
>> to cover.
> 
> I'm not sure why it would be considered mudding the water.  All property
> Get/Set/GetAll operations really are just a method call under the covers
> anyhow to org.freedesktop.DBus.Properties.  I do think that ideally we'd
> get the method added directly to that interface because then the DBus
> bindings will support it natively.

I had proposed 
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/12861/ 
a while back but there were concerns expressed in the review.

> I forgot the mention this again, but another way to solve it is similar
> to xyz.openbmc_project.Inventory.Manager where you take a fully (or
> partially) formed object as a method parameter and the process which
> hosts Inventory.Manager hosts the object.  Settings could be done the
> same way.  The issue is, again, having other processes know when to use
> this new method and when to just update properties.
> 
>>> When all of our DBus objects were serial we likely never had this issue
>>> because the request to read the properties (to send to the hypervisor)
>>> would come behind the signal and subsequent property updates.  Now that
>>> we're moving towards more ASIO we likely will see this kind of issue
>>> more often.  I don't like it but we could certainly proposal a
>>> 'SetMultiple' extension to org.freedesktop or create our own interface.
>>
>> If you have properties that need to be set in lockstep with one
>> another to be valid, I suspect that indicates that properties are not
>> the right tool.  Redfish hits this a lot, where each resource is
>> expected that any property is modifiable independently, and certain
>> implementations need an atomic "unit" of update.  bmcweb doesn't want
>> to have to cache properties that are collectively invalid right now,
>> but might become valid in the future, so there's an impasse.  Who
>> keeps the state while it's invalid?  Thus Far, that falls to the
>> dbus-daemons to store.
> 
> Agreed.  This has also been a general statement  we've made in reviews
> for new interfaces.  "If you need to update multiple properties, use
> a method; if you are just updating a single property, update the property."

Can we add a method to 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yaml 
to update multiple properties? Also, how does one ensure these updates 
via the method result in a single PropertiesChanged event on D-Bus. Is 
that implicit D-Bus behavior, or does the binding need to enable this?

>>> We could define an interface to implement something like Proposal #1,
>>> but we would need a new interface and not a property we tack onto
>>> existing interfaces.  We'd probably need to revisit a lot of our
>>> interface definitions and see which ones typicallly have multi-property
>>> updates and does an intermediate state leave us in a bad situation.
>>>
>>> Specifically for BIOS/Hypervisor settings, I mentioned before that it
>>> isn't clear to me what the proposal is for applying Pending to Current.
>>> Again, this isn't general, but we could define an interface specific for
>>> BIOS/Hypervisor settings which has a way to indicate 'Pending
>>> transaction is complete' (set by entities like Redfish) and 'Pending
>>> values applied to Current' (set by entities like PLDM).  For the current
>>> settings-style values though, this requires external interfaces to
>>> somehow know that the setting is associated with the Host in order to do
>>> the application, since BMC-owned properties won't have or need this.
>>
>> Dumb question: Does anyone actually need to know the "current" value?
>> Redfish certainly would need to return  the "pending" value in all
>> cases, as it's required so the restful API emulates ACID-like
>> compliance to the user.  Could we just have an optional interface that
>> indicates "values might not be loaded yet" and simplify the dbus API a
>> little?
> 
> I think this is generally for humans in the case of BIOS settings.
>     - "What is the setting my system is currently running with?"
>     - "What will happen next time I reboot?"
> 
> I don't know how this is modeled in Redfish.

I believe there is a Bios.Attributes for currently applied BIOS settings 
and Bios.Settings for what will be applied post a system reset.


