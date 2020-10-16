Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B6E290438
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 13:41:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCPPB0F6dzDqSq
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 22:41:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=manojkiran.eda@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gcBoKiCT; dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCPN407mPzDqSZ
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 22:40:19 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id d20so3262992iop.10
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 04:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=GOEwtxFuYvYXgvb0C4Qq+osxR/KL5q94ap3dmrTllr4=;
 b=gcBoKiCTBj5P/JYXBhP0TNuOyNs+aYGZ5JBsD7AMkAaPLUaW8sNsqRY1TyaSAhYyaf
 06fAlPCLceCroNynIGR1YQrlsSxYto60UGqVe0p15OTLduDWlX/eyV+avpe9XvhmN/tQ
 LX5ErLm/N13tFVgMQk+ilzmJIEnM7WxP+1t5wgfbcQbNHIpRN13oLBpMMEtn35WGJTjh
 CkATK85K8sd7cY13N6ZDbXAMzA23RFQMINHed4K7gNp1fqt0Z4FEzRxcdECexNsUbOeX
 kLBSkpkr4k05jXw7XGsoteTq2IM+vZtbr3kjD/qPFAL9xa+cU3jrzG5l2NCrgEmDvJrR
 QVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=GOEwtxFuYvYXgvb0C4Qq+osxR/KL5q94ap3dmrTllr4=;
 b=G4lhZkw3O8AIaNY2u8uYR4hGiAXqGz0gXR773OrNb8DmRjC6kSiifk4ypVzK8zqJp+
 YbDu6kiGoWWvQRLXM/MbuTP4Y47u+EIZWOYeiR2HdhMFhzbJ0aNk5fP4b051RTs7CKIU
 m6gfdDQh3mqar3NChKEsOt1d7/5kmTO2c5eh+qADGgCZynaP+EpJdxe9v6F6UeyvKibY
 eNxNSOV3Wpo4sjQsj523I77AwHVqDWbypOSk7t9RFlKLOs+xEMg0dAJluZcYZUQZNdoD
 twnXjeDxQRG0oQ80S2CWbdAB2oULd0btFEcebLdBoXN6pA+KYc0w6k8kyyECTTvsvcUX
 Wgzw==
X-Gm-Message-State: AOAM530iOo9nZrG+TjSJe8zYbPFeSeomBjMEeuYqQNgQ4W3ok4B6K1bu
 xL+zLkB7j4wHNT0VpoleHZA=
X-Google-Smtp-Source: ABdhPJyigw+pVrttogeFINz2P9XSVGTF1WIC/UCp4mMBp30dF2bS5OZXxKXP5vWMSINMPEr68PT8EQ==
X-Received: by 2002:a5e:8b0b:: with SMTP id g11mr2092451iok.140.1602848415745; 
 Fri, 16 Oct 2020 04:40:15 -0700 (PDT)
Received: from juliet ([27.59.190.111])
 by smtp.gmail.com with ESMTPSA id y6sm1757004ili.36.2020.10.16.04.40.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Oct 2020 04:40:14 -0700 (PDT)
Date: Fri, 16 Oct 2020 17:10:07 +0530
From: manoj kiran <manojkiran.eda@gmail.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, Ed Tanous
 <ed@tanous.net>
Message-ID: <4B316236-8010-4FAF-AF42-5B2B764247FB@getmailspring.com>
In-Reply-To: <97d247f7-bd23-801d-2a5e-5820933a1282@linux.vnet.ibm.com>
References: <97d247f7-bd23-801d-2a5e-5820933a1282@linux.vnet.ibm.com>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

Hi Ed/Ratan, 

Just bumping this thread again to see if we can get to a conclusion on
this problem.

Thanks,
Manoj

On Oct 1 2020, at 4:47 pm, Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:

> On 9/30/20 9:26 PM, Ed Tanous wrote:
> 
>> On Wed, Sep 30, 2020 at 8:05 AM Ratan Gupta
>> <ratagupt@linux.vnet.ibm.com> wrote:
>> 
>> 
>>> Thanks all for providing the suggestions
>>> 
>>> Currently Redfish Ethernet interface is not having the concept of
>>> pending and configured values,That means if we use the EthernetInterface
>>> schema, User can only see the configured values, There is no way through
>>> which user can see the pending value, We need to come up with some REST
>>> API to show the pending values.
>>> 
>>> To solve this problem, Redfish has bios schema whch has the pending
>>> attributes as well as the configured attributes
>>> 
>> Did not realize that about the Redfish schema.  Sounds like we need
>> both then.
> https://redfish.dmtf.org/schemas/v1/Bios.v1_1_1.json
> 
> The Bios schema contains properties related to the BIOS attribute
> registry. The attribute registry describes the system-specific BIOS
> attributes and actions for changing to BIOS settings. Changes to the
> BIOS typically require a system reset before they take effect. It is
> likely that a client finds the `@Redfish.Settings` term in this
> resource, and if it is found, the client makes requests to change BIOS
> settings by modifying the resource identified by the
> `@Redfish.Settings` term."
> 
> 
>> 
>> 
>>> How about using the Redfish Bios schema for front end and Bios-settings
>>> manager as backend to make the things simpler?
>>> 
>> I'm not quite following.  Are you saying put the pending settings in
>> the webserver?
>> 
> No, I was mentioning that instead of using the EthernetInterface
> schema , Can we use theBios schema for the network configuration and
> this bios schema is backed up with bios-settings manager D-bus Repo.
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29670
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/bios-settings-mgr/+/35563
> 
> 
>> 
>> 
>>> Ratan
>>> 
>>> On 9/24/20 9:06 PM, Ed Tanous wrote:
>>> 
>>> 
>>>> On Wed, Sep 23, 2020 at 2:26 PM Patrick Williams
>>>> <patrick@stwcx.xyz> wrote:
>>>> 
>>>> 
>>>>> On Wed, Sep 23, 2020 at 01:51:33PM -0700, Ed Tanous wrote:
>>>>> 
>>>>> 
>>>>>> On Wed, Sep 23, 2020 at 12:24 PM Patrick Williams
>>>>>> <patrick@stwcx.xyz> wrote:
>>>>>> 
>>>>>> 
>>>>>>> On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
>>>>>>> 
>>>>>>> It is unfortunate that org.freedesktop.DBus.Properties doesn't
>>>>>>> have a
>>>>>>> way to set multiple properties as the analogous operation to 'GetAll'.
>>>>>>> 
>>>>>> It was proposed we (OpenBMC) add one while back.  I think it muddies
>>>>>> the water of what it means to be a method call, and what it means to
>>>>>> be a property, especially for the use case that it was being proposed
>>>>>> to cover.
>>>>>> 
>>>>> I'm not sure why it would be considered mudding the water.  All property
>>>>> Get/Set/GetAll operations really are just a method call under the covers
>>>>> anyhow to org.freedesktop.DBus.Properties.  I do think that
>>>>> ideally we'd
>>>>> get the method added directly to that interface because then the DBus
>>>>> bindings will support it natively.
>>>>> 
>>>> Mudding the water of when to use a property, versus when to use a
>>>> method call (yes, properties are method calls underneath).  If there's
>>>> a method call, the dependency between the parameters is documented in
>>>> the interface, with a SetProperties method call, it isn't, and you
>>>> have to rely on just knowing, or it being implementation defined.  In
>>>> those cases, I'd much rather the itnerface make the jump straight
>>>> to a
>>>> method call, and skip properties entirely.
>>>> 
>>>> 
>>>> 
>>>>> I forgot the mention this again, but another way to solve it is similar
>>>>> to xyz.openbmc_project.Inventory.Manager where you take a fully (or
>>>>> partially) formed object as a method parameter and the process which
>>>>> hosts Inventory.Manager hosts the object.  Settings could be done the
>>>>> same way.  The issue is, again, having other processes know when
>>>>> to use
>>>>> this new method and when to just update properties.
>>>>> 
>>>> This tends to be the pattern we use.  My usual take on it when I
>>>> see a
>>>> new interface is, if the create method exists, use it.
>>>> 
>>>> 
>>>> 
>>>>> 
>>>>>> 
>>>>>>> When all of our DBus objects were serial we likely never had
>>>>>>> this issue
>>>>>>> because the request to read the properties (to send to the hypervisor)
>>>>>>> would come behind the signal and subsequent property updates. 
>>>>>>> Now that
>>>>>>> we're moving towards more ASIO we likely will see this kind of issue
>>>>>>> more often.  I don't like it but we could certainly proposal a
>>>>>>> 'SetMultiple' extension to org.freedesktop or create our own interface.
>>>>>>> 
>>>>>> If you have properties that need to be set in lockstep with one
>>>>>> another to be valid, I suspect that indicates that properties are not
>>>>>> the right tool.  Redfish hits this a lot, where each resource is
>>>>>> expected that any property is modifiable independently, and certain
>>>>>> implementations need an atomic "unit" of update.  bmcweb doesn't want
>>>>>> to have to cache properties that are collectively invalid right now,
>>>>>> but might become valid in the future, so there's an impasse.  Who
>>>>>> keeps the state while it's invalid?  Thus Far, that falls to the
>>>>>> dbus-daemons to store.
>>>>>> 
>>>>> Agreed.  This has also been a general statement  we've made in reviews
>>>>> for new interfaces.  "If you need to update multiple properties, use
>>>>> a method; if you are just updating a single property, update the property."
>>>>> 
>>>> +1
>>>> 
>>>> 
>>>> 
>>>>> 
>>>>>> 
>>>>>>> We could define an interface to implement something like
>>>>>>> Proposal #1,
>>>>>>> but we would need a new interface and not a property we tack onto
>>>>>>> existing interfaces.  We'd probably need to revisit a lot of our
>>>>>>> interface definitions and see which ones typicallly have multi-property
>>>>>>> updates and does an intermediate state leave us in a bad situation.
>>>>>>> 
>>>>>>> Specifically for BIOS/Hypervisor settings, I mentioned before
>>>>>>> that it
>>>>>>> isn't clear to me what the proposal is for applying Pending to Current.
>>>>>>> Again, this isn't general, but we could define an interface
>>>>>>> specific for
>>>>>>> BIOS/Hypervisor settings which has a way to indicate 'Pending
>>>>>>> transaction is complete' (set by entities like Redfish) and 'Pending
>>>>>>> values applied to Current' (set by entities like PLDM).  For the current
>>>>>>> settings-style values though, this requires external interfaces to
>>>>>>> somehow know that the setting is associated with the Host in
>>>>>>> order to do
>>>>>>> the application, since BMC-owned properties won't have or need this.
>>>>>>> 
>>>>>> Dumb question: Does anyone actually need to know the "current" value?
>>>>>> Redfish certainly would need to return  the "pending" value in all
>>>>>> cases, as it's required so the restful API emulates ACID-like
>>>>>> compliance to the user.  Could we just have an optional interface that
>>>>>> indicates "values might not be loaded yet" and simplify the dbus
>>>>>> API a
>>>>>> little?
>>>>>> 
>>>>> I think this is generally for humans in the case of BIOS settings.
>>>>>    - "What is the setting my system is currently running with?"
>>>>>    - "What will happen next time I reboot?"
>>>>> 
>>>> I wonder if we could make a logging API for humans to use, and keep
>>>> the "present" things off dbus.  It seems like it would simplify the
>>>> implementation quite a bit. <thinking out loud a little>
>>>> 
>>>> 
>>>> 
>>>>> I don't know how this is modeled in Redfish.
>>>>> 
>>>>> --
>>>>> Patrick Williams
>>>>> 
