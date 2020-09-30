Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C3827EBD9
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 17:09:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1fmY0FMFzDqVS
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 01:09:17 +1000 (AEST)
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
 header.s=pp1 header.b=adDKk/hV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1fhV4DN8zDqLP
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 01:05:44 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UF2nAT104953; Wed, 30 Sep 2020 11:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Xw8qBrSLImuAIi+EFCp4zLrJZMBczW/jHsIUDfa1/SY=;
 b=adDKk/hVS3Dbz69YqRqW/0MiPaVxJZTZV34krvJvBirs91ofhu7oxbQQ/h5T2zuqNBA1
 wv9oUxPM9HIzukwADvh/elz2FNGlDJUbNzb4riwE2FcyAHGx3X4DYLZmXdFgnAlwFeCE
 2sQZtMlqFq1PSmB7raMHinVsl2LbCAZX5Bamofyy6nKx8w3SSD32jfkgx3lQ3SLvI/iz
 Y0VExzr/TRiRkQgeZvDRldYO6i21LdtFphpHB9V5H6TQ55mNHTA645G2hiWwAnoB3Jyr
 sYWDAxAwqNTvAsAr/uAA6LHaQ6cLPB60+6uTNFRQKxQKGBkQVBLLQIYahNMbhyeCK7F8 iA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33vq8nkfaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 11:05:41 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08UF2hQl007727;
 Wed, 30 Sep 2020 15:05:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 33t16k2a48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 15:05:39 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08UF5bNu28836198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 15:05:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93E9452059;
 Wed, 30 Sep 2020 15:05:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.55.190])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EF7275205A;
 Wed, 30 Sep 2020 15:05:35 +0000 (GMT)
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: openbmc@lists.ozlabs.org, Ed Tanous <ed@tanous.net>,
 Patrick Williams <patrick@stwcx.xyz>
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
 <CACWQX81RBhQUPyU3KpL+4AGCob9me0HLf6QJ0qgUphzJdxRu7w@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <da763cca-6054-dcc7-6ce4-19ae58ff051b@linux.vnet.ibm.com>
Date: Wed, 30 Sep 2020 20:35:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACWQX81RBhQUPyU3KpL+4AGCob9me0HLf6QJ0qgUphzJdxRu7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_08:2020-09-30,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009300121
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

Thanks all for providing the suggestions

Currently Redfish Ethernet interface is not having the concept of 
pending and configured values,That means if we use the EthernetInterface 
schema, User can only see the configured values, There is no way through 
which user can see the pending value, We need to come up with some REST 
API to show the pending values.

To solve this problem, Redfish has bios schema whch has the pending 
attributes as well as the configured attributes

How about using the Redfish Bios schema for front end and Bios-settings 
manager as backend to make the things simpler?

Ratan

On 9/24/20 9:06 PM, Ed Tanous wrote:
> On Wed, Sep 23, 2020 at 2:26 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Wed, Sep 23, 2020 at 01:51:33PM -0700, Ed Tanous wrote:
>>> On Wed, Sep 23, 2020 at 12:24 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>>>> On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
>>>>
>>>> It is unfortunate that org.freedesktop.DBus.Properties doesn't have a
>>>> way to set multiple properties as the analogous operation to 'GetAll'.
>>> It was proposed we (OpenBMC) add one while back.  I think it muddies
>>> the water of what it means to be a method call, and what it means to
>>> be a property, especially for the use case that it was being proposed
>>> to cover.
>> I'm not sure why it would be considered mudding the water.  All property
>> Get/Set/GetAll operations really are just a method call under the covers
>> anyhow to org.freedesktop.DBus.Properties.  I do think that ideally we'd
>> get the method added directly to that interface because then the DBus
>> bindings will support it natively.
> Mudding the water of when to use a property, versus when to use a
> method call (yes, properties are method calls underneath).  If there's
> a method call, the dependency between the parameters is documented in
> the interface, with a SetProperties method call, it isn't, and you
> have to rely on just knowing, or it being implementation defined.  In
> those cases, I'd much rather the itnerface make the jump straight to a
> method call, and skip properties entirely.
>
>> I forgot the mention this again, but another way to solve it is similar
>> to xyz.openbmc_project.Inventory.Manager where you take a fully (or
>> partially) formed object as a method parameter and the process which
>> hosts Inventory.Manager hosts the object.  Settings could be done the
>> same way.  The issue is, again, having other processes know when to use
>> this new method and when to just update properties.
> This tends to be the pattern we use.  My usual take on it when I see a
> new interface is, if the create method exists, use it.
>
>>>> When all of our DBus objects were serial we likely never had this issue
>>>> because the request to read the properties (to send to the hypervisor)
>>>> would come behind the signal and subsequent property updates.  Now that
>>>> we're moving towards more ASIO we likely will see this kind of issue
>>>> more often.  I don't like it but we could certainly proposal a
>>>> 'SetMultiple' extension to org.freedesktop or create our own interface.
>>> If you have properties that need to be set in lockstep with one
>>> another to be valid, I suspect that indicates that properties are not
>>> the right tool.  Redfish hits this a lot, where each resource is
>>> expected that any property is modifiable independently, and certain
>>> implementations need an atomic "unit" of update.  bmcweb doesn't want
>>> to have to cache properties that are collectively invalid right now,
>>> but might become valid in the future, so there's an impasse.  Who
>>> keeps the state while it's invalid?  Thus Far, that falls to the
>>> dbus-daemons to store.
>> Agreed.  This has also been a general statement  we've made in reviews
>> for new interfaces.  "If you need to update multiple properties, use
>> a method; if you are just updating a single property, update the property."
> +1
>
>>>> We could define an interface to implement something like Proposal #1,
>>>> but we would need a new interface and not a property we tack onto
>>>> existing interfaces.  We'd probably need to revisit a lot of our
>>>> interface definitions and see which ones typicallly have multi-property
>>>> updates and does an intermediate state leave us in a bad situation.
>>>>
>>>> Specifically for BIOS/Hypervisor settings, I mentioned before that it
>>>> isn't clear to me what the proposal is for applying Pending to Current.
>>>> Again, this isn't general, but we could define an interface specific for
>>>> BIOS/Hypervisor settings which has a way to indicate 'Pending
>>>> transaction is complete' (set by entities like Redfish) and 'Pending
>>>> values applied to Current' (set by entities like PLDM).  For the current
>>>> settings-style values though, this requires external interfaces to
>>>> somehow know that the setting is associated with the Host in order to do
>>>> the application, since BMC-owned properties won't have or need this.
>>> Dumb question: Does anyone actually need to know the "current" value?
>>> Redfish certainly would need to return  the "pending" value in all
>>> cases, as it's required so the restful API emulates ACID-like
>>> compliance to the user.  Could we just have an optional interface that
>>> indicates "values might not be loaded yet" and simplify the dbus API a
>>> little?
>> I think this is generally for humans in the case of BIOS settings.
>>     - "What is the setting my system is currently running with?"
>>     - "What will happen next time I reboot?"
> I wonder if we could make a logging API for humans to use, and keep
> the "present" things off dbus.  It seems like it would simplify the
> implementation quite a bit. <thinking out loud a little>
>
>> I don't know how this is modeled in Redfish.
>>
>> --
>> Patrick Williams
