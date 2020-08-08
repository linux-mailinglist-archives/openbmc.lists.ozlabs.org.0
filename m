Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A13923F714
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 11:30:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNxmD2QHdzDqn1
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 19:30:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HwuYmhC9; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNxlS3V1szDqld
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 19:29:55 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id u10so2362190plr.7
 for <openbmc@lists.ozlabs.org>; Sat, 08 Aug 2020 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UPo4tAvEeAGhMSjDzHsFzAggymIxRyJhqUv9yelUlJw=;
 b=HwuYmhC9HWe3n4bA6nG7yK4HDN6QGP7kS/aQkTyUiLOs+fviRNAiIm89uvmAhlSu0U
 7J0vHRznwpRHz3HPWhhIGZSp888Hn13AVjKPV21txu9VXi4+jh90F0/wQEY/i4kPaWpK
 WSP1kH91Vn0KWzWEjdqtBPXT604CYyZxd2p6y8StrYFa1KsbSrsdJL0VAF0aQsuT5ZpE
 HVxeokksAwFYTvE498aCyDyl3gCUROnaCt740Zz0a2AbB1mPW9yWjxu2e2xLW4ZS3rO/
 yFdpX9WxvSDk7GPcynXkhBCFBio3UIcGgh3XObRzX33pWMODtE1PEEKzRKp5vuzekbE7
 7A+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UPo4tAvEeAGhMSjDzHsFzAggymIxRyJhqUv9yelUlJw=;
 b=lds07Aj9RWWLBjtrdXNLHxdyR+RIQfaqU127tG8Vp5OV39Bg1n6GmddMMLSmydiv5m
 GVRBlzHYI4mlD+6C3aPKVF0OOsjN4bVbulhxyH01px02yVwXqfgRyZLwT33Zs7aUpebS
 uT/oPpIHj5mbpMkR8XaIvXBTIRvLw5ZkwTXO3ZK2xFaZ4BnLYynM12Kmx80VhDO1gTjM
 WMmFpXJCbpFu+bjFb2p6lDGt0lMwf+QFv+zqNYaZqAvMrELLkDWVwhOkGS4eetABtKS3
 yIiBfyo8tQ9kK3N7WmkKoSdbWxmdRFE2hnbfjIlf7giZZiKfTPf6eGCf5krGRN2DDV0b
 LgWg==
X-Gm-Message-State: AOAM533EjQ8LzeHeMyCiIaNqej5DKYsljQfIjTUWSuT8zJBmWNl171if
 9hrlfNDWcoPj4JG52BRjrw++X3S7
X-Google-Smtp-Source: ABdhPJxi+EGHaddJwXnyKzGWM/Fdnk/9sBdPDDZgiFAzfaYXyxRc+mdkzxagGfoPC50hFA8X1xwQFA==
X-Received: by 2002:a17:90a:e990:: with SMTP id
 v16mr18047477pjy.194.1596878991901; 
 Sat, 08 Aug 2020 02:29:51 -0700 (PDT)
Received: from cnn ([2402:3a80:40d:b96b:fd32:3d58:60e9:6e38])
 by smtp.gmail.com with ESMTPSA id a16sm14741909pgj.27.2020.08.08.02.29.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Aug 2020 02:29:51 -0700 (PDT)
Date: Sat, 8 Aug 2020 14:59:46 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: openbmc@lists.ozlabs.org, zkxz@hotmail.com
Subject: Re: openbmc Digest, Vol 60, Issue 27
Message-ID: <20200808092850.GA9539@cnn>
References: <mailman.5.1596852004.22402.openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mailman.5.1596852004.22402.openbmc@lists.ozlabs.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: manikandan.e@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Aug 08, 2020 at 12:00:04PM +1000, openbmc-request@lists.ozlabs.org wrote:
> Send openbmc mailing list submissions to
> 	openbmc@lists.ozlabs.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.ozlabs.org/listinfo/openbmc
> or, via email, send a message with subject or body 'help' to
> 	openbmc-request@lists.ozlabs.org
> 
> You can reach the person managing the list at
> 	openbmc-owner@lists.ozlabs.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of openbmc digest..."
> 
> 
> Today's Topics:
> 
>    1. Re: Inconsistent performance of dbus call GetManagedObjects
>       to PSUSensor in dbus-sensors (Ed Tanous)
>    2. RE: system power control (Zhao Kun)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Fri, 7 Aug 2020 16:17:20 -0700
> From: Ed Tanous <ed@tanous.net>
> To: Alex Qiu <xqiu@google.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, James Feist
> 	<james.feist@linux.intel.com>,  Peter Lundgren
> 	<peterlundgren@google.com>, Josh Lehan <krellan@google.com>,  Jason
> 	Ling <jasonling@google.com>, Sui Chen <suichen@google.com>, Jie Yang
> 	<jjy@google.com>, Drew Macrae <drewmacrae@google.com>
> Subject: Re: Inconsistent performance of dbus call GetManagedObjects
> 	to PSUSensor in dbus-sensors
> Message-ID:
> 	<CACWQX82Or8bnTA8WDqrogpp16vEff7PoEB4ZK4b3tFwYKWSQZQ@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
> 
> This is great!  Thank you for taking the time to type this up.
> 
> On Fri, Aug 7, 2020 at 3:42 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > The setup has a total of 249 IPMI sensors, and among these, dbus-sensors reports 59 objects from HwmonTempSensor and 195 objects from PSUSensor, and we've already decreased the polling rate of PSUSensor to every 10 seconds to mitigate the issue. As the intel-ipmi-oem does, we measure the time of calling GetManagedObjects with commands:
> 
> This isn't the biggest sensor usage I've ever seen, but it certainly
> is the biggest usage of PSUsensor I've seen sofar.  It's not
> surprising you're finding performance issues other people haven't.
> PSUSensor was originally supposed to be for physical pmbus power
> supplies, but got abstracted a little at some point to be more
> generic.
> 
> >
> > time busctl call xyz.openbmc_project.HwmonTempSensor / org.freedesktop.DBus.ObjectManager GetManagedObjects
> > time busctl call xyz.openbmc_project.PSUSensor / org.freedesktop.DBus.ObjectManager GetManagedObjects
> >
> > The first command for HwmonTempSensor constantly finishes in about 60 ms. However, the run time of the second command for PSUSensor is very inconsistent. Out of 50 continuous runs, most of them finish in about 150 ms, but 2 or 3 of them will take as long as about 6 seconds to return. This results in long time to scan the SDR and inconsistent performance polling IPMI sensors.
> >
> 
> I don't have a system handy that uses PSUSensor, but based on what
> you're saying, I'm going to guess that there's a blocking
> io/wait/sleep call that snuck in somewhere in the PSUsensor, and it's
> stopping the main reactor for some amount of time.  This is probably
> exacerbated by how loaded your system is, which is causing the really
> bad tail latencies.
> 
> If I were in your shoes, the first thing I would do is to recompile
> PSUSensor with IO handler tracking enabled:
> https://www.boost.org/doc/libs/1_73_0/doc/html/boost_asio/overview/core/handler_tracking.html
> 
> to do that, go here:
> https://github.com/openbmc/dbus-sensors/blob/master/CMakeLists.txt#L194
> 
> add add a line line like
> target_compile_definitions(psusensor PUBLIC
> -DBOOST_ASIO_ENABLE_HANDLER_TRACKING)
> 
> and recompile.
> 
> That's going to print loads of debug info to the console when it runs.
> Be prepared.  Rerun your test with the flag enabled.  When your
> getmanagedobjects command gets stuck, dump the log and try to find the
> spot where io seems to stop for a bit.  Hopefully you'll find one
> async operation is taking a looooong time to run.  Most operations
> should be in the order of micro/milliseconds for runtime.  Once you
> know what the spot is, we can probably triage further.  Each
> individual callback is pretty simple, and only does a couple things,
> so it should be pretty easy to sort out what's blocking within a given
> callback.
> 
> 
> My second theory is that because of the async nature of psusensor, if
> you get unlucky, 195 concurrent IO completion operations are getting
> scheduled right ahead of your GetManagedObjects call.  Right now the
> IO scheduling is pretty dumb, and doesn't attempt to add jitter to
> randomize the call starts, under the assumption that the reactor will
> never be more than 10 or so handles at a given time.  Given the number
> of sensors you've got, we might want to rethink that, and try to
> spread them out in time a little.  If we wanted to verify this, we
> could instrument io_context with a little run_for() magic that breaks
> every N milliseconds and prints the size of the queue.  That could
> verify that we're running it too large.
> 
> Technically I think this is the embedded version of the thundering
> herd problem.  There are ways to solve it that should be relatively
> easy (if that's what it turns out to be).
> 
> 
> ------------------------------
> 
> Message: 2
> Date: Sat, 8 Aug 2020 01:19:03 +0000
> From: Zhao Kun <zkxz@hotmail.com>
> To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
> 	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> Subject: RE: system power control
> Message-ID:
> 	<BYAPR14MB23424B7B0D6A450C52235EC2CF490@BYAPR14MB2342.namprd14.prod.outlook.com>
> 	
> Content-Type: text/plain; charset="windows-1252"
> 
> Thank you, Jason. Could you share with me any example of defining those GPIOs in device tree for x86-power-control? I can?t find any in aspeed-bmc-intel-s2600wf.dts.
>
   Please refer the below Facebook Tiogapass gpio device entry for x86-power-control.
     https://github.com/openbmc/linux/blob/dev-5.7/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts#L135
> 
> 
> Thanks.
> 
> Best regards,
> 
> Kun Zhao
> /*
>   zkxz@hotmail.com<mailto:zkxz@hotmail.com>
> */
> 
> From: Bills, Jason M<mailto:jason.m.bills@linux.intel.com>
> Sent: Friday, August 7, 2020 10:12 AM
> To: openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>
> Subject: Re: system power control
> 
> 
> 
> On 8/6/2020 11:43 PM, Zhao Kun wrote:
> > Hi,
> >
> > I?m new to learn how to make OpenBMC work on a X86 based system.
> > Currently I met a problem of mapping the GPIOs about power
> > on/off/reset/status into OpenBMC logic. I understand when user issue a
> > power on request through any user interfaces like RESTful, IPMI, etc.,
> > some service (phosphor-state-manager?) will be triggered to check
> > current status and roll out corresponding systemd services to do the
> > job. (please correct me if I?m wrong)
> >
> > But I?m just confused on how those services actually toggle or check the
> > GPIOs, there seems be many choices,
> >
> >  1. Device tree?
> >  2. Using Workbook gpio_defs.json?
> >  3. Create some services calling platform specific scripts to operate
> >     GPIO or I2C devices?
> >  4. Using x86-power-control?
> >
> > So what?s the most recommended way to do it? Really appreciated If
> > anyone can share some lights.
> On Intel reference platforms, we use x86-power-control and configure the
> GPIO names using device tree.
> 
> >
> > I thought there must be a mechanism to consume some kind of
> > configuration file as the hardware abstraction layer. So I guess it
> > might be gpio_defs.json or device tree.
> >
> > Thanks.
> >
> > Best regards,
> >
> > Kun Zhao
> >
> > /*
> >
> > zkxz@hotmail.com <mailto:zkxz@hotmail.com>
> >
> > */
> >
> 
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20200808/0244c0ef/attachment-0001.htm>
> 
> End of openbmc Digest, Vol 60, Issue 27
> ***************************************
