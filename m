Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5F228582E
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 07:40:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5jpr5dyWzDqN6
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 16:40:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=deGgsi55; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5jp61KhpzDqMT
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 16:39:38 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id 19so713604qtp.1
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 22:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4h2e8q7kzJs7W2jisAwXwY3bk/4bjiYGeaykMr1P4xI=;
 b=deGgsi55ah9dh6JM+RxJf2qP8hz2ROw/WEhhKODgGl9Nt1oPO8v07gcIalJzz7QL1G
 w8hZQEvkEx5HabRDBweQ0EzaV9g3tJh8u9Ypafm6WIgbEN4tUs222eDnbM6WNeMMm93J
 DbNc2HSRgWOOYhO+OzXi7uVtCxO9FvJwvj6/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4h2e8q7kzJs7W2jisAwXwY3bk/4bjiYGeaykMr1P4xI=;
 b=a8HiQQGi+/ybF9S59FZRP0clHuYFA89+kMkfwDLWIuk12jMh7NYCOlcPYjhFi2dugp
 zJrPd4yEOthDE5Y9pX6+oXZQIqjnvu0LhPej/sPDuqdTuKE3wb0+X2JeeMa/iFLRNYZd
 e6A+v0GTcECX9IJVdR0DKmySVYIZfj98xYmzcO+sUKHood2pf3JbmyD6jc9H6D2BB7Ul
 yRXS4nVjevkOTiGSewin/qMUu8qfzuo+iXQOfDwnpJKXGmUMLDl9mICrPLBodNYgBwMy
 heUrvYh11ZLivYNi4WDkn1llQcEMHZ0J1u5gjEMMYSeSmZCVyWTCiPsO1Fi6VmVr48QK
 BJhA==
X-Gm-Message-State: AOAM532Mvhq6j3vNhkJFRipJyjD3MQUwuu4NtPpja4c0CW7fq3shwbzO
 B9zyzNTcaY9jJuHJ41YsYc0rzVKRvwJV1xW0Nr0eKxND
X-Google-Smtp-Source: ABdhPJzzJAGO8SCzgkEgnW4CSkeUd9k4hv/74ziMC146cWX+lX4kptgSws0nvysdwfzdcA5MJODqpXX2C6lVMIHELMU=
X-Received: by 2002:ac8:48ca:: with SMTP id l10mr1607085qtr.385.1602049174200; 
 Tue, 06 Oct 2020 22:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-3-zev@bewilderbeest.net>
 <51512c43-ee82-17b5-71c4-35849b1f0922@linux.intel.com>
 <20200928195423.3kftebgltdmpronq@hatter.bewilderbeest.net>
 <28b289f1-0ef0-2432-f71b-0ca4420a39e2@linux.intel.com>
 <20200928210917.idrpngkpduwxe2rf@hatter.bewilderbeest.net>
 <b79f8dfb-8257-943b-3c2b-062840aa2515@linux.intel.com>
 <20200928220124.k47kocdvi2ahgtc6@hatter.bewilderbeest.net>
 <CACPK8XdzjEhxKHbajMXbMpktOAhm_xFqUW7rY67WdmQ4p8PXPg@mail.gmail.com>
 <f4185310-6695-75ee-df3b-41b89b0baac3@linux.intel.com>
In-Reply-To: <f4185310-6695-75ee-df3b-41b89b0baac3@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 05:39:21 +0000
Message-ID: <CACPK8XdbFmAZqwezOJRFffdVmCK9PHaXSTgYZfTTSU=t2RnYoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] peci-cputemp: label CPU cores from zero instead of one
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Jason M Biils <jason.m.bills@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Zev Weiss <zev@bewilderbeest.net>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 6 Oct 2020 at 18:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Zev,
>
> On 9/28/2020 11:00 PM, Joel Stanley wrote:
> > On Mon, 28 Sep 2020 at 22:02, Zev Weiss <zev@bewilderbeest.net> wrote:
> >>
> >> On Mon, Sep 28, 2020 at 04:32:31PM CDT, Jae Hyun Yoo wrote:
> >>>> Oh I see -- I had thought you were referring to other existing hwmon
> >>>> drivers in the kernel.
> >>>>
> >>>> As far as I can tell, all those instances appear to be numbering CPU
> >>>> *sockets* though -- which as Jason mentioned in a call earlier today
> >>>> I gather is done to line up with motherboard silkscreen labeling.
> >>>> But in the code in question here we're labeling *cores* within a
> >>>> given socket, which I don't see arising anywhere in any existing
> >>>> entity-manager configs.  So I'm still unclear on why we want to use
> >>>> one-based indexing here instead of zero-based -- I'd think we'd want
> >>>> the PECI driver to match the PECI spec?
> >>>
> >>> PECI driver uses zero-based index for PECI command handling but label is
> >>> user facing stuff which shouldn't make confusion to users. We can modify
> >>> driver like you did in this patch and previous driver also used
> >>> zero-based indexing but I changed it to natural number based indexing
> >>> to avoid confusion between driver labels and dbus-sensors names.
> >>> Any specific reason for the zero-based indexing? Any benefit?
> >>>
> >>
> >> [Re-adding CCs...]
> >
> > Thanks. Please keep the discussion on the list.
> >
> >>
> >> Well, as I see it basically just consistency with a larger set of
> >> things.  Most other related numbering schemes I'm aware of are
> >> zero-based -- userspace tools like 'taskset' and 'lscpu', system APIs
> >> like the <sched.h> CPU_SET() routines, and the kernel's own numbering
> >> (e.g. what's shown in /proc/cpuinfo) all number processors starting from
> >> zero, so dbus-sensors seems kind of like the odd one out there.
> >> (Personally I'd be fully in support of changing it to be zero-based as
> >> well, though I have no idea offhand about how distruptive a change that
> >> would be.)
> >>
> >> It also seems pretty OpenBMC-specific, whereas I'd expect we want to aim
> >> for greater generality in things going into mainline.
> >
> > Agreed. The hwmon numbering varies; some attributes are zero indexed
> > and some start at 1. More commonly we start counting from zero in the
> > kernel, so I would expect PECI to do the same.
> >
> > If there's some userspace that depends on the behaviour of these out
> > of tree PECI patches, then that userspace will need to change. This
> > reminds us why the project prefers patches exposing userspace ABI are
> > merged to mainline first.
>
> Okay. Not a big deal. The coretemp module for local CPU also uses zero
> starting label index for core numbers so better match up. Thanks for
> your patch.
>
> Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Applied to dev-5.8.

Cheers,

Joel
