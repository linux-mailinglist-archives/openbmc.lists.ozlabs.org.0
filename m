Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1D26CFF3
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 02:28:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsHrM1nFHzDqCD
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 10:28:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=209.85.219.193; helo=mail-yb1-f193.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsHh81x6nzDqDC
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 10:21:27 +1000 (AEST)
Received: by mail-yb1-f193.google.com with SMTP id h206so336227ybc.11
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ExeMWxMToPjXrgh7JVVF1bdyTTIC1fhWbDg0yItiLJU=;
 b=RRca4YYm8Oq0et9kUCe6euEECrjfO8S8p+6I6NaO8Xa1cMBsAv6YXKT+OisxGWtWha
 wHGNfCC72hIhBuffeW0oXIXkoQFexN8K9OZqPt5RZ7roWR0YxbHxusQU6rZFD7GHeiDj
 XW/eBQVIC9+mSSI4Mp1OH5hodYU1ZPz9QMvM6ZqZTpzf+KiDh3TWZk2/tZBHLj1ChaOY
 kdWLtwZAIksm6IzFfzUR1sMReaSvwWVgOxrjD60Xuil4WLG25GVPZDWvbUpPb84KSKMS
 IWO+3tRcYqtnd2N24dy2CYhXBveS5WdQ41izvFZLc3guNjIfLUH98E8NbZ1ytSNXmwzW
 dShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ExeMWxMToPjXrgh7JVVF1bdyTTIC1fhWbDg0yItiLJU=;
 b=HgUxqMB8QUWQnJnjBbqpNfRTrxIsHLeernTlmla+OR8zIXL8Uxtv2MoMRnVDjADRkP
 JNBVLrW36z62YnFbiy2S4mGLtAIsT7FcLfXXyTG0fhum05dQfXxrW2wa9zOV3BniNaDV
 GnC9a/aU6/xrARvFymWEpGGE8qr5c8OzGoOwqRwK8kd/haqOtuFE+xSGukJvlZ6W1Oti
 DoZdht4XUSzVMUvki6CtzEMrwBlP/rUFNZPP90lWgf0iPQ6i2APm4yJNwREanOhEiivu
 ujQMApf0jOXDZJDrlqAZV/UnLIMZ5OFfAqswkkr6URPpXYUwNDYvIGuSW5LzMRZppTrD
 n8bw==
X-Gm-Message-State: AOAM530g4M8NmVNurCmOx7ZhhsVmJzNf7kv7Nifui89xuIJs8LB3kP70
 IVp7ediAYflGO49oXuUC9vrYm0g4K437sMws6MaYc8fjZgFClwcw
X-Google-Smtp-Source: ABdhPJzh8aHA2rjiesxsPZRwQw/kYre6iIv9QhdUR39fA2OpZE9R5qAHvyFOm4E/4VEYIDP0WHIgzJqnVjvbcQdv4q4=
X-Received: by 2002:a25:14c4:: with SMTP id 187mr38755968ybu.449.1600276807271; 
 Wed, 16 Sep 2020 10:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
 <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
 <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
 <20200916170811.GC6152@heinlein>
In-Reply-To: <20200916170811.GC6152@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 16 Sep 2020 10:19:56 -0700
Message-ID: <CACWQX83XPm4DmjgvtjD9L688m+XodRbCZdwDkNmf9n2B_047fg@mail.gmail.com>
Subject: Re: dbus-sensors: Unit property for xyz.openbmc_project.Sensor.Value
 interface
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Andrei Kartashev <a.kartashev@yadro.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 10:08 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> I would prefer we implement Units in dbus-sensors.  Reasons below.
>
> On Wed, Sep 16, 2020 at 09:24:19AM -0700, Ed Tanous wrote:
> > On Wed, Sep 16, 2020 at 8:23 AM James Feist <james.feist@linux.intel.com> wrote:
> > >
> > > On 9/16/2020 6:28 AM, Andrei Kartashev wrote:
> > > > Hi,
> > > >
> > > > We noticed that dbus-sensors doesn't fully implement
> > > > xyz.openbmc_project.Sensor.Value interface: there is no Unit property
> > > > for all the sensors, defined by dbus-sensors.
> > > > I believe it was intentionally, but I still wondering what was the
> > > > reason?
> > >
> > > It was originally as the information seemed redundant. If the
> > > information is needed I'm fine with someone adding it, it just hasn't
> > > seemed to be a high priority.
> >
> > Considering we've gone this long with no impact (considering the path
> > can be used to lookup the unit) I wonder if we should consider
> > removing unit from the sensor Value API?  It doesn't seem used.
>
> The redundancy comes about from this list: [1].  I don't really recall
> why we went with that approach where sensors were required to be in a
> particular place in the object hierarchy.
>
> I think we only "got away" with "no impact" from the lack of
> implementation because the particular implementations that work well
> with dbus-sensors also didn't implement it because dbus-sensors didn't
> provide it.  That's kind of circular logic as a reason to eliminate it.

Are there any implementations that people use that rely on Units?

>
> >
> > >
> > > > I noticed that in intel-ipmi-oem units are determined based on object
> > > > paths, but that looks ugly since there is well-defined natural
> > > > interface for units in dbus.
> > > > Lack of the "Unit" property in the interface breaks some existing
> > > > logic.
> > > >
> >
> > Technically the way the interfaces define it, both are valid to use to
> > determine the Units, and both would need to be lookup tables.  Is
> > using the path any more ugly than using the property?
>
> There isn't really a programatic way to define and enforce object paths
> presently.  There is a programatic way to define and enforce
> enum values.  The enums don't actually need a lookup table, if you're
> using the sdbusplus generated headers and bindings.

The lookup table I was referring to was enum-value -> IPMI value.  I
don't think sdbusplus has the ability to generate that for you.

>
> If I were to guess which of the requirements would be more likely to be
> changed it would be the object path.  There are very few other places
> where we have such strict requirements on object paths (though we do
> have places where the object path has meaning).  The current definition
> is a bit ambiguous by what is meant by "the correct hierarchy within the
> sensors namespace[2]", but the current implementations seem to take this
> to mean `/xyz/openbmc_project/sensors/...`[3].  I don't know that this is
> particular convenient for a multi-host system or any case where a BMC
> is aggregating sensors from other BMCs.

I'd be fine with this solution too.  The question I should've asked is
"is there a way to get rid of the redundant information".

>
> Unless we get some stronger definition on what is meant by [2], the only
> completely correct code is to look for the type at all the various
> segments of the object path (ex. "fan_tach" could be found at
> /xyz/openbmc_project/sensors/fan_tach/node2/fan0 or
> /node2/xyz/openbmc_project/sensors/fan_tach/fan0).  Using the enum value
> is far easier in this case.

Fair point.  To be clear, I'm fine with adding Units it to
dbus-sensors;  I was just looking if this was an opportunity to
simplify.  It sounds like the answer is no, and there are important
uses for this.  If we did anything we would probably remove the type
in the path, and that seems far more intrusive.

>
> 1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml#L37
> 2. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml#L3
> 3. https://github.com/openbmc/bmcweb/blob/cb13a39253848ece442971301ade9c09d98bf08e/redfish-core/lib/sensors.hpp#L56
>
> --
> Patrick Williams
