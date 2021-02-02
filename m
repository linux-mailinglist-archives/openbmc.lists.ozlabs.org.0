Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902030B44B
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 01:50:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV5p84WtSzDr30
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 11:50:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UcXkLHGw; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV5nC06STzDqdM
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 11:49:46 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id r2so1219271ybk.11
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2021 16:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/jX3JUwpzyqUqYkZHUPTE1CVOLJXaa1VapUJqt/VxhA=;
 b=UcXkLHGwl4nsQjXm7Bb3CpdmpSmXHbatmksYeXM8gNIbCmdL0OWSlUyofWAgKqU7dC
 OD4qmcygEM2tc9otjFXsYa7JFlTr6Rxddb2PbEV77X23OJorUOPx7NTMvDm6oFh/B+4T
 0xS+tz5V2yydBAbcf5wwwx4Zncbn5DZjtwVHXzaOs32vr3jZm7Uo0NlLwhtk+VzycY07
 A27GGsrhru/iSCEfyrI3HknOHeMXGlXzx1OWvan1BHuizLuRpeJQpiUFH8WcgOALN5qS
 1MXOMtGEXc2WUi4zkrUv4qEathbSLMoNxacKzeFpWU+lI61x+2xyWUCRn9+oHB8WQ1qF
 uDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jX3JUwpzyqUqYkZHUPTE1CVOLJXaa1VapUJqt/VxhA=;
 b=os5qFqvE5w8sEDlG+3a4OJaxxqyFEA/jaILRpfN/oUC+D1EMCxIJ5uQRemrzY9fweg
 q/70+S+6QheyNzQOTBYz3FgTB30hruBut6d2JDtZ15oe25lb9kaEckXdd5D4TxSD+CZe
 8KsvSsv9C+/qjrItXUsbhZ4VE6K/xFgM4ZEZ2f9Yv7JRlitdfCE/n1mp+FhebqMbPpSc
 X0MwiwZX2Ee0sh77QEyyxyqAiT9wCt1vC/sM5cMC40l/GuxvhFngXR+8Fdt94rNsOBC8
 LkRoKs36XQYLVZigp+rzYnGfK/i+3/pcFMTSnH12elxP90DLOkfgsoAc1+BNZbaOjKHP
 WbhA==
X-Gm-Message-State: AOAM5319A5FMCSAy46hZ1q4y35EIG+bzb9/V7L8G4B0gEVqxlHqXWqAQ
 BBYGfCy2ddaEY4+KKY30d2Um1SwrJro1Dpy3cpKB6g==
X-Google-Smtp-Source: ABdhPJxl97t/oMV0y3G0Ur2QA/YUFQHTJ3afEZbzThjmmvJ0d4ASIGzozlN1E15jtHUIlyhVaOjPP+mXhBVLrycLXCI=
X-Received: by 2002:a25:c407:: with SMTP id u7mr28573012ybf.449.1612226982957; 
 Mon, 01 Feb 2021 16:49:42 -0800 (PST)
MIME-Version: 1.0
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com> <YArmnhlS33TpVo63@heinlein>
 <20210128010526.wice3o5qznh4lglw@thinkpad.fuzziesquirrel.com>
 <YBVtvlsJJJ4faFpt@heinlein>
 <20210202002139.jsjkl4icge5bf5cb@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210202002139.jsjkl4icge5bf5cb@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 1 Feb 2021 16:49:31 -0800
Message-ID: <CACWQX82G3wbD-Q+RVoT1xx7eru+Y7zk5AdAQT9iQoiR=-xdfRA@mail.gmail.com>
Subject: Re: Progress Codes in BMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: kunyi731@gmail.com, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 gmills@linux.ibm.com, vishwa@linux.ibm.com,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 1, 2021 at 4:21 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Sat, Jan 30, 2021 at 08:31:26AM -0600, Patrick Williams wrote:
> >On Wed, Jan 27, 2021 at 08:05:26PM -0500, Brad Bishop wrote:
> >>
> >> There are multiple sources of the codes - on Power the power sequencing
> >> is done on the BMC and that is considered part of the server boot so we
> >> have both those applications indicating their progress along with the
> >> more traditional progress flowing down from system firmware.
> >
> >The `xyz.openbmc_project.State.Boot.Raw` is the interface to use here.
> >You just write the `Value` property.
>
> Ok.  Do I have it right - on any application that wants to post a
> "progress code" you would just implement this interface on a single
> (arbitrary?) path and continually write to the Value property?
>
> >> Our progress codes are much larger than 64 bits.  More like 64 bytes.
> >> Does that still seem acceptable?
> >
> >Maybe we could change Value from a uint64 to a vector<uint64>?
>
> Works for me.  Does anyone have a problem with this?  Hoping the
> existing users of this interface will speak up - I've CCed them...
>
> >> I'd also like to sort out the external facing interfaces for these codes
> >> though.  My straw-man proposal would be that these are just another log
> >> service with yet another additionaldatauri attachment in the log
> >> entries.  Is this a terrible idea?
> >
> >I think you're asking about Redfish now?  I have no opinion on that.
>
> Yes I'm asking about Redfish.  If any of the bmcweb maintainers could
> speak up on whether or not a LogService is the right path to take here
> _before_ we get too far down the design path that would be fantastic.

Considering that bmcweb already has an LogService implementation to
access post codes, yeah, log service seems reasonable to represent
post codes.  I don't see how you're going to fit the vector<uint64_t>
thing into a log entry, as that's not really what log entries are, and
the way that Redfish defines them, you're effectively limited to a
uint64_t for a numeric argument anyway, even though json supports
arbitrary precision, so I'd be interested to see what the proposed log
entries look like.  I was hoping to look into exactly how the existing
one worked so I could give a better technical answer, but a pointer to
the code is as good as I can do for the moment.
https://github.com/openbmc/bmcweb/blob/88b3dd12851cd7bdd4b5c065ba99f40feafb775e/redfish-core/lib/log_services.hpp#L2984

if you're hoping to get human readable post codes, and not just raw
values, there's probably a discussion that needs to be had about how
the message registry would work between systems, considering that
every system implements different post codes, we'd have to switch
registries dependent on the processor present, and there are likely
multiple processors in the system, possibly with different post code
definitions, so the needed configurability explodes a little bit.  If
you could avoid that, I would.

>
> thx - brad
