Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10F96434
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 17:23:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CZLJ3kzfzDqPn
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 01:23:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jqtEAGNM"; 
 dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CZ9S3nVWzDqT5
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 01:15:24 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id k22so4345762oiw.11
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9TuW3ZQfZdpUr5GBuHyrWfntJl1gYetnT7IZtmSVmHU=;
 b=jqtEAGNMBn+DBkxSpsYJbOq3Qm9g0dAiRi7rxxJOgSR0h+c4B/Nkr4sWwVZE4PWV/r
 3meXROFwMhpUKTl0ZbstgAuQ2cw3gnOhSE/1NtJ0xAOo2IrdFUJ1q43+R7haUFwrBJj6
 9sBGpxzzd5wbWzk8oerAylynrSPmN8Dk0jUnOoUknEe01hxYyZhur5Rxtio3pL603Vma
 50xsstcGK4LjLquV+V2Ee7KKO+NpF9AuCDqgQ/Ez4riATz/5pfTUUbkzUZoGasjx8qTD
 UgcEomYVd+tVBfkeydeLS9mUllgr7DuntATNN9A7y0pXZ6mn4XtwrhR98fOeSF+u+MtE
 gkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TuW3ZQfZdpUr5GBuHyrWfntJl1gYetnT7IZtmSVmHU=;
 b=jeBxqB41ahxZG3l9Q49iKrrXLBtRnxPmNea2PTH32RYXEtjNrGIID/VWGdf9oaoiHv
 IkDz+hE7+ijcfwdFr4Zwlgr1G/0DJaqx4vGvSl5bB0kMpzWK1nWEEJyHqD85CSNzASTu
 omWZNmH8IuHtJkWehjiOp1Wefz8RzjZgAIDrEFmXuzXq0clGfvOg2zQcPUYURREjmDMg
 /WnLIk5A1f8jNnXQbqq3u4fhnWHVNL9D+LESswig7yG87drLTU5KxBt1nHFNzqkjGtbt
 Rla8RaV2WMMpiyfOcUwxLxLi8E3hRkCuIUjrPB0i1XoA4fLkx3v9EvPqrMMMKG+3iuno
 zHOw==
X-Gm-Message-State: APjAAAUG7Lu25DUp9KcVGswRgwL0KKyQPvkQUTkUYUp1rmcxGUPFe+9W
 kF57BEcskIFHrjK1Pb+7Kn41ddytyRnSdT6Yls4RVAYr
X-Google-Smtp-Source: APXvYqwCBdJwDvvdXYRIh3TioZcHuin/p7euL2oadDDF3SCXhynNhq1P9GXCUIKZw+lvvgI4m27tQTFNil5W+D/XCVk=
X-Received: by 2002:aca:5b04:: with SMTP id p4mr369026oib.161.1566314118334;
 Tue, 20 Aug 2019 08:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=pv9GdHmv7ZJOBK+Z1wqAh4DmOzVR8ud=+KefddvEkreg@mail.gmail.com>
 <9ad991fb-13fe-42fa-b5b6-48fd069342f9@www.fastmail.com>
 <e4636a3c-82b8-0f35-ebad-6b23e304dc3d@linux.ibm.com>
 <f459cebc-ab70-08ee-7ea7-2647e41b3c04@linux.ibm.com>
 <96f668f0-9580-44a4-9bbd-ca6324494017@www.fastmail.com>
 <3645ad01-172f-be62-0531-6d0660fc211a@linux.ibm.com>
In-Reply-To: <3645ad01-172f-be62-0531-6d0660fc211a@linux.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 20 Aug 2019 10:15:02 -0500
Message-ID: <CALLMt=ppYod6utC-W4mojmefn_Yqt_K0FyUKhAKaZgYJugrUzQ@mail.gmail.com>
Subject: Re: where to store application json
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for all the good discussion. It seems like in summary the
consensus is what
Andrew Jeffery proposed:

/etc/<application name>/

There are security concerns with this but there are a lot of files in /etc/
that could cause security concerns if people get the correct access
to modify them. For my use case, the json is simply something that
tells the application when to log errors. If people find they need data
files which could have significant security concerns, they may want
to revisit the location for their config file.

Andrew

On Mon, Aug 19, 2019 at 12:15 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
>
> On 8/18/19 7:15 PM, Andrew Jeffery wrote:
> >
> > On Sat, 17 Aug 2019, at 02:24, Joseph Reynolds wrote:
> >> On 8/16/19 8:31 AM, Matt Spinler wrote:
> >>> On 8/15/2019 6:59 PM, Andrew Jeffery wrote:
> >>>> On Fri, 16 Aug 2019, at 07:01, Andrew Geissler wrote:
> >>>>> As we start moving more and more of our applications to using
> >>>>> runtime parsed
> >>>>> json files, it seems like a good time to come up with a standard
> >>>>> location to put
> >>>>> the json files. I think a requirement is they be in a writeable
> >>>>> filesystem
> >>>>> (although that may bring security concerns) so that you can edit and
> >>>>> restart
> >>>>> services that use them on the fly for bringup and debug.
> >>>>>
> >>>>> /etc seems like the right spot. But if so, where in /etc
> >>> While convenient to the developer for testing, to me it doesn't sound
> >>> like good practice to put read
> >>> only, critical files into a writeable spot?  How could we even trust
> >>> data that comes back to us from
> >>> the field when a user that can get into their BMC can just change
> >>> these?  Or accidentally
> >>> delete a file?
> >>>
> >> One security concern is that config files offer a good way for hackers
> >> to get persistent access to the system.  That is, if they are able to
> >> get root access to the BMC one time, they may be able to persist their
> >> hack across BMC reboots by modifying some config files.  IMHO, to make
> >> it harder for them, as much as possible of the file system should be
> >> read-only, and read-write config files should not offer the above
> >> mentioned service to hackers.
> > What are some concrete examples of what you're concerned about here?
>
> I was thinking about config files that specify which plugins to load,
> for example, by absolute pathname.  In this scenario, the hacker would
> write a plugin, and the first time they compromise the BMC, they copy
> the plugin to the BMC's file system, and modify the config file to
> active it.  In this way, their code re-activates even if they lose access.
>
> >
> > Are you suggesting hackers are exploiting flaws in the config file parsers?
> > Because in that case we should just fix the parsers. Or perhaps configuring
> > the system in an unsafe way?
>
> No, but that's a good point.  We can begin to address those
> vulnerabilities with static and dynamic code scans and config file
> fuzzing, and with good design and documentation about config files.
>
> >
> > Anyway, having any writable storage provides a place to drop payloads
> > and generally wreak havoc, but having an unconfigurable BMC is not a
> > direction I think we should go, it seems pretty restrictive. We do need
> > to be careful about how we treat the content though, as it can't really
> > be authenticated.
>
> Agreed.
>
> >
> > Andrew
> >
>
