Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C165E5B42
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 08:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY4tt2wq6z306m
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 16:21:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JhubN6vA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JhubN6vA;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY4tQ131hz301m
	for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2022 16:21:31 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id e5so8314998pfl.2
        for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 23:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Z+PID1IguXrR32Sm0xAPoaOjuHf2SYVeP9iLGNhXLxI=;
        b=JhubN6vArKJKTP6jo+i5TWRlA22D7tOJ6Otcl01icAOGlUleLHoiy6QIkAP3YymeMb
         30sG7ozA6x0B4QeBkAgRxu2fDPXDX/ERF4sVWiKIK71K4bil+ZNZOHZ4n0wGZ6kN1b6j
         nrJNAPFvtX0OwkHfP2ZJylzlWiqnDIXbOaOyitqIAgObjB4jskFcoNBtn0N9YvKMZDCR
         x9HPIo0TQTbj/kVLpUI4iktTj1gfHfP2LBdXoJvL77/KmRucAFf7zkcwKaUM+RN7qpuo
         VVCD6SM9rgU63lDIeYcfuVEFmHm5Ge5PJaSWQvYr8fIcDOsxvjStXIcEhPeo0tJj6JIR
         yVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Z+PID1IguXrR32Sm0xAPoaOjuHf2SYVeP9iLGNhXLxI=;
        b=GiXZpgi9L2GL4Qtck5EzBQv4NoNbrsKBdkK494zaF8VT18m+ZpAcUGVZWvPtWvDePR
         I+0EPvfD5xrtju6eccY42xC7ecHupdo4T4OUe0eU8G6Bj+Lv9kOB1P0cNFDHqr86j6o2
         yEj8+Rt9eitZc31gx81wSMW2VvzTdu5MMRYuLz38yS4n1qxJAyGjS+IrZSdd9gLaULcO
         94Tilh230AeQYW+fFEMqugp9Gr208T9kB/K0jBQijyrNNeKZS6HAJnOaGfm/RmezvoLW
         kXrnSlqA0NynCttX+nFdh+nFh+E9iZEexyi5Zd8hJo7ZINhLnIkv4ct3Pa8VfrycYAGT
         L04Q==
X-Gm-Message-State: ACrzQf0OQi9v6DXJ/yPNojB1djaHhcr7k+zdPMrY1IHmvqTEhvQuKegG
	LM5pTBWUc807lRzfB+ZuzRM=
X-Google-Smtp-Source: AMsMyM5kbef0GcWlkq6yDhy++nJd3NxzEkdlWLLaTuY/I4H8KBrWRnmp7sb1WEkAtKg6cdczqc+4Rg==
X-Received: by 2002:aa7:80d0:0:b0:52d:f9c6:bb14 with SMTP id a16-20020aa780d0000000b0052df9c6bb14mr1848558pfn.57.1663827688933;
        Wed, 21 Sep 2022 23:21:28 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4 ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id e16-20020a056a0000d000b0053b208b55d1sm3386398pfj.85.2022.09.21.23.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 23:21:28 -0700 (PDT)
Date: Wed, 21 Sep 2022 23:21:24 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Wedge400 (AST2520) OpenBMC stuck at reboot
Message-ID: <Yyv+5GCp0A5WNE89@taoren-fedora-PC23YAB4>
References: <YyuLaigEAyiYpl+B@taoren-fedora-PC23YAB4>
 <CAGm54UHu3wFdXTwd=cpe7bn3WVBf5rPA3Fi8mAtc4pJADOU5TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm54UHu3wFdXTwd=cpe7bn3WVBf5rPA3Fi8mAtc4pJADOU5TQ@mail.gmail.com>
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
Cc: taoren@fb.com, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lei,

Thank you for the quick response! The symptom is quite similar to my
Wedge400 problem, but CONFIG_VIDEO_ASPEED is not enabled in my kconfig,
so it might be caused by different component(s) in my environment..


Cheers,

Tao

On Thu, Sep 22, 2022 at 10:10:01AM +0800, Lei Yu wrote:
> We hit a similar but different issue about BMC stuck.
> It occurs when running host DC cycle test, and when the issue occurs:
> 1. The BMC hangs, and the aspeed's heartbeat is off
> 2. If the wdt2 is enabled, the wdt2 will fire and aspeed chip will
> reset and reboot into the seconds flash.
> 3. If the wdt2 is disabled, the BMC just hangs and we have to power
> cycle the chassis.
> 
> We could not find the root cause, but it's likely related to a patch:
> https://lore.kernel.org/openbmc/20201221223225.14723-2-jae.hyun.yoo@linux.intel.com/
> If we revert the patch, the issue could not be reproduced anymore.
> 
> On Thu, Sep 22, 2022 at 6:09 AM Tao Ren <rentao.bupt@gmail.com> wrote:
> >
> > Hi there,
> >
> > Recently I noticed a few Wedge400 (AST2520A2) units stuck after "reboot"
> > command. It's hard to reproduce (affecting ~1 out of 1,000 units), but
> > once it happens, I have to power cycle the chassis to recover OpenBMC.
> >
> > I checked aspeed_wdt.c and manually played with watchdog registers, but
> > everything looks normal to me. Did anyone hit the similar error before?
> > Any suggestions which area I should look into?
> >
> > Below are the last few lines of logs before OpenBMC hangs:
> >
> > bmc-oob login:
> > INIT: Sending processes configured via /etc/inittab the TERM signal
> > Stopping OpenBSD Secure Shell server: sshdstopped /usr/sbin/sshd (pid 7397 1189)
> > Stopping ntpd: done
> > stopping rsyslogd ... done
> > Stopping random number generator daemon.
> > Deconfiguring network interfaces... done.
> > Sending all processes the TERM signal...
> > rackmond[1747]: Got request exit[  528.383133] watchdog: watchdog0: watchdog did not stop!
> > Sending all processes the KILL signal...
> > Unmounting remote filesystems...
> > Deactivating swap...
> > Unmounting local filesystems...
> > Rebooting... [  529.725009] reboot: Restarting system
> >
> >
> > Cheers,
> >
> > Tao
> 
> 
> 
> -- 
> BRs,
> Lei YU
