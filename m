Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD44293951
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 12:44:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFqy03W9rzDqXK
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 21:44:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mgANk1fm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFqxF2sppzDqS2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 21:44:00 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KAWbCK033749; Tue, 20 Oct 2020 06:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=/efPDl84KSoL19mS/uQoT+EhVcsyFtwLPusaFWWzvzU=;
 b=mgANk1fmQvNYWVG7ZtUKTtj4M9H/hesmXbNC0DUwA8t1TOI51sFf3SUHPpP0iwxOnoBv
 qkvTu1DMDXEZ+Ojcla/dKBOqRPGpFezb1ZxsblhWhdJFN54iVvm/cddCdVpqBWbFLkm1
 NEAHnVOI3ezlb0WEriOy7Dk3Gpqe/vxif146WsG8lNd7DxjmJr+91cA9w+sYfIbgEvbN
 GGs+lg7ffTLzGfs3fRNaPbL+5YBWadtfejMQr5mZL7eh/Zy2B8EL97fYNMqZI/a35ho5
 g1/gbZ0azAQjBi8zri4I2n0bYrbWufQEK5SeLUp9TglOB1nDK6mvdZpyvEXO4qrONJJi 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349wrs9bje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 06:43:56 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09KAZgSe047386;
 Tue, 20 Oct 2020 06:43:56 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349wrs9bhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 06:43:55 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09KAg0oJ015946;
 Tue, 20 Oct 2020 10:43:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 347r881kyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 10:43:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09KAhpJw35455486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Oct 2020 10:43:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C890AE05A;
 Tue, 20 Oct 2020 10:43:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11223AE053;
 Tue, 20 Oct 2020 10:43:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.28.32])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Oct 2020 10:43:49 +0000 (GMT)
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: manoj kiran <manojkiran.eda@gmail.com>, Ed Tanous <ed@tanous.net>,
 patrick@stwcx.xyz
References: <97d247f7-bd23-801d-2a5e-5820933a1282@linux.vnet.ibm.com>
 <4B316236-8010-4FAF-AF42-5B2B764247FB@getmailspring.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <b2b4c23a-0be4-8b76-20a2-dc689161490c@linux.vnet.ibm.com>
Date: Tue, 20 Oct 2020 16:13:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4B316236-8010-4FAF-AF42-5B2B764247FB@getmailspring.com>
Content-Type: multipart/alternative;
 boundary="------------696BC5CE9ACF1718D4C6A219"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-20_04:2020-10-20,
 2020-10-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010200065
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

This is a multi-part message in MIME format.
--------------696BC5CE9ACF1718D4C6A219
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ed,Pattrick

Thanks for your suggestions,

Any choice with the below two proposals?

1/

How about using the Redfish Bios schema for redfish data modeling and Bios-settings
manager as backend to make the things simpler?

https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29670
https://gerrit.openbmc-project.xyz/c/openbmc/bios-settings-mgr/+/35563

                                   *or*

2/

Redfish EthernetSchema at redfish data modelling and phosphor-settings at backend(D-bus object)
                                      +

Some code which writes the data from settings Dbus object to bios-settings as PLDM is having infra to read from the BIOS-Settings table and send the bios table to Hypervisor.

NOTE: In the later case we don't have way in redfish to show the pending values.we can only show the configured values.

Ratan


On 10/16/20 5:10 PM, manoj kiran wrote:
> Hi Ed/Ratan,
>
> Just bumping this thread again to see if we can get to a conclusion on
> this problem.
>
> Thanks,
> Manoj
>
> On Oct 1 2020, at 4:47 pm, Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>
>> On 9/30/20 9:26 PM, Ed Tanous wrote:
>>
>>> On Wed, Sep 30, 2020 at 8:05 AM Ratan Gupta
>>> <ratagupt@linux.vnet.ibm.com> wrote:
>>>
>>>
>>>> Thanks all for providing the suggestions
>>>>
>>>> Currently Redfish Ethernet interface is not having the concept of
>>>> pending and configured values,That means if we use the EthernetInterface
>>>> schema, User can only see the configured values, There is no way through
>>>> which user can see the pending value, We need to come up with some REST
>>>> API to show the pending values.
>>>>
>>>> To solve this problem, Redfish has bios schema whch has the pending
>>>> attributes as well as the configured attributes
>>>>
>>> Did not realize that about the Redfish schema.  Sounds like we need
>>> both then.
>> https://redfish.dmtf.org/schemas/v1/Bios.v1_1_1.json
>>
>> The Bios schema contains properties related to the BIOS attribute
>> registry. The attribute registry describes the system-specific BIOS
>> attributes and actions for changing to BIOS settings. Changes to the
>> BIOS typically require a system reset before they take effect. It is
>> likely that a client finds the `@Redfish.Settings` term in this
>> resource, and if it is found, the client makes requests to change BIOS
>> settings by modifying the resource identified by the
>> `@Redfish.Settings` term."
>>
>>
>>>
>>>> How about using the Redfish Bios schema for front end and Bios-settings
>>>> manager as backend to make the things simpler?
>>>>
>>> I'm not quite following.  Are you saying put the pending settings in
>>> the webserver?
>>>
>> No, I was mentioning that instead of using the EthernetInterface
>> schema , Can we use theBios schema for the network configuration and
>> this bios schema is backed up with bios-settings manager D-bus Repo.
>>
>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29670
>>
>> https://gerrit.openbmc-project.xyz/c/openbmc/bios-settings-mgr/+/35563
>>
>>
>>>
>>>> Ratan
>>>>
>>>> On 9/24/20 9:06 PM, Ed Tanous wrote:
>>>>
>>>>
>>>>> On Wed, Sep 23, 2020 at 2:26 PM Patrick Williams
>>>>> <patrick@stwcx.xyz> wrote:
>>>>>
>>>>>
>>>>>> On Wed, Sep 23, 2020 at 01:51:33PM -0700, Ed Tanous wrote:
>>>>>>
>>>>>>
>>>>>>> On Wed, Sep 23, 2020 at 12:24 PM Patrick Williams
>>>>>>> <patrick@stwcx.xyz> wrote:
>>>>>>>
>>>>>>>
>>>>>>>> On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
>>>>>>>>
>>>>>>>> It is unfortunate that org.freedesktop.DBus.Properties doesn't
>>>>>>>> have a
>>>>>>>> way to set multiple properties as the analogous operation to 'GetAll'.
>>>>>>>>
>>>>>>> It was proposed we (OpenBMC) add one while back.  I think it muddies
>>>>>>> the water of what it means to be a method call, and what it means to
>>>>>>> be a property, especially for the use case that it was being proposed
>>>>>>> to cover.
>>>>>>>
>>>>>> I'm not sure why it would be considered mudding the water.  All property
>>>>>> Get/Set/GetAll operations really are just a method call under the covers
>>>>>> anyhow to org.freedesktop.DBus.Properties.  I do think that
>>>>>> ideally we'd
>>>>>> get the method added directly to that interface because then the DBus
>>>>>> bindings will support it natively.
>>>>>>
>>>>> Mudding the water of when to use a property, versus when to use a
>>>>> method call (yes, properties are method calls underneath).  If there's
>>>>> a method call, the dependency between the parameters is documented in
>>>>> the interface, with a SetProperties method call, it isn't, and you
>>>>> have to rely on just knowing, or it being implementation defined.  In
>>>>> those cases, I'd much rather the itnerface make the jump straight
>>>>> to a
>>>>> method call, and skip properties entirely.
>>>>>
>>>>>
>>>>>
>>>>>> I forgot the mention this again, but another way to solve it is similar
>>>>>> to xyz.openbmc_project.Inventory.Manager where you take a fully (or
>>>>>> partially) formed object as a method parameter and the process which
>>>>>> hosts Inventory.Manager hosts the object.  Settings could be done the
>>>>>> same way.  The issue is, again, having other processes know when
>>>>>> to use
>>>>>> this new method and when to just update properties.
>>>>>>
>>>>> This tends to be the pattern we use.  My usual take on it when I
>>>>> see a
>>>>> new interface is, if the create method exists, use it.
>>>>>
>>>>>
>>>>>
>>>>>>>> When all of our DBus objects were serial we likely never had
>>>>>>>> this issue
>>>>>>>> because the request to read the properties (to send to the hypervisor)
>>>>>>>> would come behind the signal and subsequent property updates.
>>>>>>>> Now that
>>>>>>>> we're moving towards more ASIO we likely will see this kind of issue
>>>>>>>> more often.  I don't like it but we could certainly proposal a
>>>>>>>> 'SetMultiple' extension to org.freedesktop or create our own interface.
>>>>>>>>
>>>>>>> If you have properties that need to be set in lockstep with one
>>>>>>> another to be valid, I suspect that indicates that properties are not
>>>>>>> the right tool.  Redfish hits this a lot, where each resource is
>>>>>>> expected that any property is modifiable independently, and certain
>>>>>>> implementations need an atomic "unit" of update.  bmcweb doesn't want
>>>>>>> to have to cache properties that are collectively invalid right now,
>>>>>>> but might become valid in the future, so there's an impasse.  Who
>>>>>>> keeps the state while it's invalid?  Thus Far, that falls to the
>>>>>>> dbus-daemons to store.
>>>>>>>
>>>>>> Agreed.  This has also been a general statement  we've made in reviews
>>>>>> for new interfaces.  "If you need to update multiple properties, use
>>>>>> a method; if you are just updating a single property, update the property."
>>>>>>
>>>>> +1
>>>>>
>>>>>
>>>>>
>>>>>>>> We could define an interface to implement something like
>>>>>>>> Proposal #1,
>>>>>>>> but we would need a new interface and not a property we tack onto
>>>>>>>> existing interfaces.  We'd probably need to revisit a lot of our
>>>>>>>> interface definitions and see which ones typicallly have multi-property
>>>>>>>> updates and does an intermediate state leave us in a bad situation.
>>>>>>>>
>>>>>>>> Specifically for BIOS/Hypervisor settings, I mentioned before
>>>>>>>> that it
>>>>>>>> isn't clear to me what the proposal is for applying Pending to Current.
>>>>>>>> Again, this isn't general, but we could define an interface
>>>>>>>> specific for
>>>>>>>> BIOS/Hypervisor settings which has a way to indicate 'Pending
>>>>>>>> transaction is complete' (set by entities like Redfish) and 'Pending
>>>>>>>> values applied to Current' (set by entities like PLDM).  For the current
>>>>>>>> settings-style values though, this requires external interfaces to
>>>>>>>> somehow know that the setting is associated with the Host in
>>>>>>>> order to do
>>>>>>>> the application, since BMC-owned properties won't have or need this.
>>>>>>>>
>>>>>>> Dumb question: Does anyone actually need to know the "current" value?
>>>>>>> Redfish certainly would need to return  the "pending" value in all
>>>>>>> cases, as it's required so the restful API emulates ACID-like
>>>>>>> compliance to the user.  Could we just have an optional interface that
>>>>>>> indicates "values might not be loaded yet" and simplify the dbus
>>>>>>> API a
>>>>>>> little?
>>>>>>>
>>>>>> I think this is generally for humans in the case of BIOS settings.
>>>>>>     - "What is the setting my system is currently running with?"
>>>>>>     - "What will happen next time I reboot?"
>>>>>>
>>>>> I wonder if we could make a logging API for humans to use, and keep
>>>>> the "present" things off dbus.  It seems like it would simplify the
>>>>> implementation quite a bit. <thinking out loud a little>
>>>>>
>>>>>
>>>>>
>>>>>> I don't know how this is modeled in Redfish.
>>>>>>
>>>>>> --
>>>>>> Patrick Williams
>>>>>>

--------------696BC5CE9ACF1718D4C6A219
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Ed,Pattrick</pre>
    <pre>Thanks for your suggestions,</pre>
    <pre>Any choice with the below two proposals?
</pre>
    <pre class="moz-quote-pre" wrap="">1/ 

How about using the Redfish Bios schema for redfish data modeling and Bios-settings
manager as backend to make the things simpler?

<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29670">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29670</a>
<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/bios-settings-mgr/+/35563">https://gerrit.openbmc-project.xyz/c/openbmc/bios-settings-mgr/+/35563</a>

                                  <b> or</b>

2/

Redfish EthernetSchema at redfish data modelling and phosphor-settings at backend(D-bus object) 
                                     +

Some code which writes the data from settings Dbus object to bios-settings as PLDM is having infra to read from the BIOS-Settings table and send the bios table to Hypervisor.

NOTE: In the later case we don't have way in redfish to show the pending values.we can only show the configured values.

Ratan


</pre>
    <div class="moz-cite-prefix">On 10/16/20 5:10 PM, manoj kiran wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4B316236-8010-4FAF-AF42-5B2B764247FB@getmailspring.com">
      <pre class="moz-quote-pre" wrap="">Hi Ed/Ratan, 

Just bumping this thread again to see if we can get to a conclusion on
this problem.

Thanks,
Manoj

On Oct 1 2020, at 4:47 pm, Ratan Gupta <a class="moz-txt-link-rfc2396E" href="mailto:ratagupt@linux.vnet.ibm.com">&lt;ratagupt@linux.vnet.ibm.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 9/30/20 9:26 PM, Ed Tanous wrote:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, Sep 30, 2020 at 8:05 AM Ratan Gupta
<a class="moz-txt-link-rfc2396E" href="mailto:ratagupt@linux.vnet.ibm.com">&lt;ratagupt@linux.vnet.ibm.com&gt;</a> wrote:


</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Thanks all for providing the suggestions

Currently Redfish Ethernet interface is not having the concept of
pending and configured values,That means if we use the EthernetInterface
schema, User can only see the configured values, There is no way through
which user can see the pending value, We need to come up with some REST
API to show the pending values.

To solve this problem, Redfish has bios schema whch has the pending
attributes as well as the configured attributes

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Did not realize that about the Redfish schema.  Sounds like we need
both then.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap=""><a class="moz-txt-link-freetext" href="https://redfish.dmtf.org/schemas/v1/Bios.v1_1_1.json">https://redfish.dmtf.org/schemas/v1/Bios.v1_1_1.json</a>

The Bios schema contains properties related to the BIOS attribute
registry. The attribute registry describes the system-specific BIOS
attributes and actions for changing to BIOS settings. Changes to the
BIOS typically require a system reset before they take effect. It is
likely that a client finds the `@Redfish.Settings` term in this
resource, and if it is found, the client makes requests to change BIOS
settings by modifying the resource identified by the
`@Redfish.Settings` term."


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">How about using the Redfish Bios schema for front end and Bios-settings
manager as backend to make the things simpler?

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I'm not quite following.  Are you saying put the pending settings in
the webserver?

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">No, I was mentioning that instead of using the EthernetInterface
schema , Can we use theBios schema for the network configuration and
this bios schema is backed up with bios-settings manager D-bus Repo.

<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29670">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29670</a>

<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/bios-settings-mgr/+/35563">https://gerrit.openbmc-project.xyz/c/openbmc/bios-settings-mgr/+/35563</a>


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Ratan

On 9/24/20 9:06 PM, Ed Tanous wrote:


</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Wed, Sep 23, 2020 at 2:26 PM Patrick Williams
<a class="moz-txt-link-rfc2396E" href="mailto:patrick@stwcx.xyz">&lt;patrick@stwcx.xyz&gt;</a> wrote:


</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On Wed, Sep 23, 2020 at 01:51:33PM -0700, Ed Tanous wrote:


</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">On Wed, Sep 23, 2020 at 12:24 PM Patrick Williams
<a class="moz-txt-link-rfc2396E" href="mailto:patrick@stwcx.xyz">&lt;patrick@stwcx.xyz&gt;</a> wrote:


</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:

It is unfortunate that org.freedesktop.DBus.Properties doesn't
have a
way to set multiple properties as the analogous operation to 'GetAll'.

</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">It was proposed we (OpenBMC) add one while back.  I think it muddies
the water of what it means to be a method call, and what it means to
be a property, especially for the use case that it was being proposed
to cover.

</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I'm not sure why it would be considered mudding the water.  All property
Get/Set/GetAll operations really are just a method call under the covers
anyhow to org.freedesktop.DBus.Properties.  I do think that
ideally we'd
get the method added directly to that interface because then the DBus
bindings will support it natively.

</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Mudding the water of when to use a property, versus when to use a
method call (yes, properties are method calls underneath).  If there's
a method call, the dependency between the parameters is documented in
the interface, with a SetProperties method call, it isn't, and you
have to rely on just knowing, or it being implementation defined.  In
those cases, I'd much rather the itnerface make the jump straight
to a
method call, and skip properties entirely.



</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">I forgot the mention this again, but another way to solve it is similar
to xyz.openbmc_project.Inventory.Manager where you take a fully (or
partially) formed object as a method parameter and the process which
hosts Inventory.Manager hosts the object.  Settings could be done the
same way.  The issue is, again, having other processes know when
to use
this new method and when to just update properties.

</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">This tends to be the pattern we use.  My usual take on it when I
see a
new interface is, if the create method exists, use it.



</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">When all of our DBus objects were serial we likely never had
this issue
because the request to read the properties (to send to the hypervisor)
would come behind the signal and subsequent property updates. 
Now that
we're moving towards more ASIO we likely will see this kind of issue
more often.  I don't like it but we could certainly proposal a
'SetMultiple' extension to org.freedesktop or create our own interface.

</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">If you have properties that need to be set in lockstep with one
another to be valid, I suspect that indicates that properties are not
the right tool.  Redfish hits this a lot, where each resource is
expected that any property is modifiable independently, and certain
implementations need an atomic "unit" of update.  bmcweb doesn't want
to have to cache properties that are collectively invalid right now,
but might become valid in the future, so there's an impasse.  Who
keeps the state while it's invalid?  Thus Far, that falls to the
dbus-daemons to store.

</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Agreed.  This has also been a general statement  we've made in reviews
for new interfaces.  "If you need to update multiple properties, use
a method; if you are just updating a single property, update the property."

</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">+1



</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">We could define an interface to implement something like
Proposal #1,
but we would need a new interface and not a property we tack onto
existing interfaces.  We'd probably need to revisit a lot of our
interface definitions and see which ones typicallly have multi-property
updates and does an intermediate state leave us in a bad situation.

Specifically for BIOS/Hypervisor settings, I mentioned before
that it
isn't clear to me what the proposal is for applying Pending to Current.
Again, this isn't general, but we could define an interface
specific for
BIOS/Hypervisor settings which has a way to indicate 'Pending
transaction is complete' (set by entities like Redfish) and 'Pending
values applied to Current' (set by entities like PLDM).  For the current
settings-style values though, this requires external interfaces to
somehow know that the setting is associated with the Host in
order to do
the application, since BMC-owned properties won't have or need this.

</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">Dumb question: Does anyone actually need to know the "current" value?
Redfish certainly would need to return  the "pending" value in all
cases, as it's required so the restful API emulates ACID-like
compliance to the user.  Could we just have an optional interface that
indicates "values might not be loaded yet" and simplify the dbus
API a
little?

</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I think this is generally for humans in the case of BIOS settings.
   - "What is the setting my system is currently running with?"
   - "What will happen next time I reboot?"

</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I wonder if we could make a logging API for humans to use, and keep
the "present" things off dbus.  It seems like it would simplify the
implementation quite a bit. &lt;thinking out loud a little&gt;



</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">I don't know how this is modeled in Redfish.

--
Patrick Williams

</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------696BC5CE9ACF1718D4C6A219--

