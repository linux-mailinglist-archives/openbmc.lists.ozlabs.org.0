Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 316F94EA9E8
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 10:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSNjm0tX5z2xWm
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 19:57:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=WMyukLMM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2001:4860:4864:20::2c;
 helo=mail-oa1-x2c.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=WMyukLMM; dkim-atps=neutral
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSNjN3x4yz2xKS
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 19:56:55 +1100 (AEDT)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-d39f741ba0so17998098fac.13
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 01:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7GU/CWU3ldlkgNvB/ts1vMDc+aQq/OyhSROxI8GQtg=;
 b=WMyukLMMZflYxV+b2e0nDLvzM9nJopOoXt5P2Npk8uJd70f8ybisUqNpLo838+74Oo
 Wk3dwi/viWdmyyO7kssftcNY+Gp+D72llpaMBjuoHsT1EpRl/JKHtbiNghEOQycaMQTd
 iyaMSo49b/xNaN4ucKVRwSB+t3pvUD8aADZ4kDJ9AAq2jM2RjCiBhsMnNk5Yci1ToS0S
 VRIjUpZkxw1CXREP/2JFR0ti2oHkfhKuhz4ojR4YWem4QFA1sUHF2Vk4pvlUB6n7km7E
 wX4mfn5gtZT3cmJsR3G1Lr7DOltvqSGBHfTS1MIVgljE9lhH5BgKRbAhFaGQ0jSFR/cR
 SeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7GU/CWU3ldlkgNvB/ts1vMDc+aQq/OyhSROxI8GQtg=;
 b=03dc4VC08u/6PA28kTndh/ohEypKVAutU6tVo+B8NUHHB6IJt+MNPSrihLtbRConAF
 Ur2zfJnLszGYSChBPYAZqlXhJeMLDxJdMv3hfWp+tYdgyMgN172B/AlCro8LtJLHYTNs
 /d/uVSu1xNjHASyGCAIw/0B/w/uf8hG5YDaMCZYykiBpfh0u+9rrJtwGabDUGuihhifO
 oQPRsO/GtzWPNjYNUk/O7oK8JuinMrnZmKF5XerJZy5RCd5M4J7LZ9+QlNS4LlGoQWAk
 MaBdbsPtmJV+tNaTYMzP8FY5BfS3IKW6HLlaAuyOOBhvkjQdFB2CcTe04SLa+NatcrmB
 hbXQ==
X-Gm-Message-State: AOAM531JkC7h0xRGOzBWim0S0spoCVCyMQ2BjjcNpL28ZC1gcQ21Ggjn
 M0qXhZzZnB0HpFA7aUcC/bczYV2KPlO44W3jj+NnaCjuGcIccg==
X-Google-Smtp-Source: ABdhPJwe8u5sBA6X3kmv9zCf2D1EnxNHAsy+4BJXyJH5HAem6cut0DoTF8qOTkbBxsmHfoqNlWU1NexLaJ1GxTgjdmM=
X-Received: by 2002:a05:6870:5b93:b0:dd:c65c:a2c with SMTP id
 em19-20020a0568705b9300b000ddc65c0a2cmr1620635oab.8.1648544211896; Tue, 29
 Mar 2022 01:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UHMED4Np0MThLfp4H-i8R24o8pCns2-6MEzy1Me-9XJmA@mail.gmail.com>
 <ED8098DE-8D59-437E-8088-FE7062CDEE15@linux.ibm.com>
 <SJ0PR15MB4203E9DBC4747F99D019A2E2E81D9@SJ0PR15MB4203.namprd15.prod.outlook.com>
 <CAGm54UFkd=mOQRtzEbDU2v6748QN3fYavwxgq_5JSXTu=NraJA@mail.gmail.com>
In-Reply-To: <CAGm54UFkd=mOQRtzEbDU2v6748QN3fYavwxgq_5JSXTu=NraJA@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 29 Mar 2022 16:57:00 +0800
Message-ID: <CAGm54UHcnniKsN_5AyeTn6NGNGXTSv28UmpDYQ+rjug_MFSyrw@mail.gmail.com>
Subject: Re: Missed interfacesRemoved signal callbacks in object-mapper
 results in invalidated DBus objects
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
Cc: Shantappa Teekappanavar <shantappa.teekappanavar@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 29, 2022 at 2:20 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> Additional information:
>
> I tried to use `dbus-monitor --system
> "type='signal',interface='org.freedesktop.DBus.ObjectManager',member='InterfacesRemoved'"
> | tee /tmp/interfacesRemoved.log` to capture the signals when deleting
> logging log entries.
> It does show that some missing signals, e.g. below link shows that it
> dose not get the interfacesRemoved signal for
> /xyz/openbmc_project/logging/entry/1
>
> https://pastebin.com/EgFpeLxK
>
> So this looks like a dbus (or dbus-broker) issue instead of sdbusplus issue.

Now it's figured out how to reproduce the issue:
1. Generate several logging entries
2. Reboot BMC
3. Call logging service's DeleteAll

And the issue occurs, the log entries exist before BMC boot will not
get interfacesRemoved signal.

It turns out that the issue is in phosphor-logging, that when it
restore the log entries from the filesystem it does not call
`emit_object_added()` and thus dbus will not generate
interfacesAdded/Removed signals.

A patch is sent to
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/52445
for review.

> On Tue, Mar 29, 2022 at 5:51 AM Shantappa Teekappanavar
> <Shantappa.Teekappanavar@ibm.com> wrote:
> >
> > Hi Lei,
> >
> >
> >
> > I've hit this same exact issue on few of our platforms. Like as you said, I agree it is not 100% reproducible . But once the issue is hit, it is kind of persistent on that system.
> >
> >
> >
> > I tried adding entries, deleting one at a time or Delete All, with the hope of flushing out the paths. But so far no success.
> >
> >
> >
> > I agree that there is some sort of fundamental issue...
> >
> >
> >
> > -Teeks
> >
> >
> >
> > From: Adriana Kobylak <anoo@linux.ibm.com>
> > Sent: Monday, March 28, 2022 2:42 PM
> > To: Shantappa Teekappanavar <Shantappa.Teekappanavar@ibm.com>
> > Subject: Fwd: Missed interfacesRemoved signal callbacks in object-mapper results in invalidated DBus objects
> >
> >
> >
> >
> >
> >
> >
> > Begin forwarded message:
> >
> >
> >
> > From: Lei Yu <yulei.sh@bytedance.com>
> >
> > Subject: Missed interfacesRemoved signal callbacks in object-mapper results in invalidated DBus objects
> >
> > Date: March 28, 2022 at 8:19:40 AM CDT
> >
> > To: openbmc <openbmc@lists.ozlabs.org>
> >
> >
> >
> > An issue that is related to missed match callbacks is noticed and it
> > causes the inconsistency between object-mapper and the dbus objects.
> >
> > Steps to reproduce on g220a QEMU (it is not 100% reproducible and when
> > it occurs it likely occurs on the first try when BMC boots)
> >
> > 1. Generate several logging entries
> > 2. Call logging service's DeleteAll
> > 3. Check the objects of logging service, all entries are deleted
> > ```
> > # busctl tree xyz.openbmc_project.Logging
> > `-/xyz
> >   `-/xyz/openbmc_project
> >     `-/xyz/openbmc_project/logging
> >       `-/xyz/openbmc_project/logging/internal
> >         `-/xyz/openbmc_project/logging/internal/manager
> > ```
> > 4. Check the entries via object-mapper, it gets the entries
> > ```
> > # busctl call xyz.openbmc_project.ObjectMapper
> > /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
> > GetObject sas /xyz/openbmc_project/logging/entry/1 0
> > a{sas} 1 "xyz.openbmc_project.Logging" 8
> > "org.freedesktop.DBus.Introspectable" "org.freedesktop.DBus.Peer"
> > "org.freedesktop.DBus.Properties"
> > "xyz.openbmc_project.Association.Definitions" "xyz.open
> > bmc_project.Common.FilePath" "xyz.openbmc_project.Logging.Entry"
> > "xyz.openbmc_project.Object.Delete"
> > "xyz.openbmc_project.Software.Version"
> > ```
> > 5. I could verify that the DBus object does not really exist:
> > ```
> > # busctl introspect "xyz.openbmc_project.Logging"
> > /xyz/openbmc_project/logging/entry/1
> > Failed to introspect object /xyz/openbmc_project/logging/entry/1 of
> > service xyz.openbmc_project.Logging: Unknown object
> > '/xyz/openbmc_project/logging/entry/1'.
> > ```
> >
> > I also added some logs in my service to get callbacks of the
> > interfacesRemoved signal, and it shows that I really do not get the
> > callbacks for some objects.
> > For example, in one test I have 41 logging entries, and my service
> > only gets `interfacesRemoved` callback for entry 18~41, this causes
> > the object-mapper to show the remaining 1~17 entries while they do not
> > really exist on DBus.
> >
> > This looks like some fundamental issue in dbus-broker or sdbusplus.
> > Is there anyone who hits the similar issue?
> >
> > --
> > BRs,
> > Lei YU
> >
> >
>
>
>
> --
> BRs,
> Lei YU



-- 
BRs,
Lei YU
