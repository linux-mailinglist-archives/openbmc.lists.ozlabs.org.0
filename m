Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB3627BCB3
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 08:01:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0pg16Nh7zDqNT
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 16:01:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=iS4Ok1qL; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0pfH5CR3zDqKf
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 16:00:55 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id i1so5035824edv.2
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 23:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PbEyIPeR18cJ++iRYw6W/dgq+4ZMbMbnHDEqG9bsjlE=;
 b=iS4Ok1qLbq2Viun6uyU86Vx3kYlI1x1xOq9ZcTNDlYJGbCvFaYjEZ/e+c2jDAdbuob
 5jikFhiGL5+FvNIG9x+ERepo8A+UECF8HlVNpvsbyE0L4tv99jkeECuqe0GLFbllAhf8
 jOI1jMBwSNDR63O8TSIfoJBaAhJcV2iU66nSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PbEyIPeR18cJ++iRYw6W/dgq+4ZMbMbnHDEqG9bsjlE=;
 b=kHmm94XlBHoDau+WJs6TRBLESN2/cRv10ieqNWDVccqk8/t7Mss7mHgRyNYMOSHVL2
 r4a2G57+Dt3pi/nfe7egMHQij1MimeqiGoARByZOaz+keeEew2UGqDxznodoYE/NYhCS
 rHnuoAh/HatEPtHuTrzgbV4q1IFYtyn/0X5QZCq5pio5bHv3BuuOc/cE65XJUajzvpQr
 OM9TctY9DaOsmVz9rubypasMogSqeMWV7etAHYLih70EvMuM2Wd5TuZWh5Jf3OsYGHLw
 hhY7kdvwBzspn2VeeHwrRiLMphqr7jomMZYLfKvatgBULEe60m2is3vSHcR/38eYF3ZO
 CHDQ==
X-Gm-Message-State: AOAM5307wD3wJA+ssmv/pRObsOvoYa0xMDIaU0vrZLZg6dPr4tqwkjYp
 k2By6R/d/v5ceawK04y5qjv0+E/Hxv0QGzTQLzQ=
X-Google-Smtp-Source: ABdhPJycVOdt3MbNbL0r9PSE7ROdN0InqtZewfk3fnckmMFaoY0sIOQrYsqYvl2vu8I7FiIBSKFmqZJWjaXdLatIvmk=
X-Received: by 2002:a05:6402:17b6:: with SMTP id
 j22mr1385648edy.377.1601359250981; 
 Mon, 28 Sep 2020 23:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-3-zev@bewilderbeest.net>
 <51512c43-ee82-17b5-71c4-35849b1f0922@linux.intel.com>
 <20200928195423.3kftebgltdmpronq@hatter.bewilderbeest.net>
 <28b289f1-0ef0-2432-f71b-0ca4420a39e2@linux.intel.com>
 <20200928210917.idrpngkpduwxe2rf@hatter.bewilderbeest.net>
 <b79f8dfb-8257-943b-3c2b-062840aa2515@linux.intel.com>
 <20200928220124.k47kocdvi2ahgtc6@hatter.bewilderbeest.net>
In-Reply-To: <20200928220124.k47kocdvi2ahgtc6@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 Sep 2020 06:00:37 +0000
Message-ID: <CACPK8XdzjEhxKHbajMXbMpktOAhm_xFqUW7rY67WdmQ4p8PXPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] peci-cputemp: label CPU cores from zero instead of one
To: Zev Weiss <zev@bewilderbeest.net>
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
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 28 Sep 2020 at 22:02, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Mon, Sep 28, 2020 at 04:32:31PM CDT, Jae Hyun Yoo wrote:
> >>Oh I see -- I had thought you were referring to other existing hwmon
> >>drivers in the kernel.
> >>
> >>As far as I can tell, all those instances appear to be numbering CPU
> >>*sockets* though -- which as Jason mentioned in a call earlier today
> >>I gather is done to line up with motherboard silkscreen labeling.
> >>But in the code in question here we're labeling *cores* within a
> >>given socket, which I don't see arising anywhere in any existing
> >>entity-manager configs.  So I'm still unclear on why we want to use
> >>one-based indexing here instead of zero-based -- I'd think we'd want
> >>the PECI driver to match the PECI spec?
> >
> >PECI driver uses zero-based index for PECI command handling but label is
> >user facing stuff which shouldn't make confusion to users. We can modify
> >driver like you did in this patch and previous driver also used
> >zero-based indexing but I changed it to natural number based indexing
> >to avoid confusion between driver labels and dbus-sensors names.
> >Any specific reason for the zero-based indexing? Any benefit?
> >
>
> [Re-adding CCs...]

Thanks. Please keep the discussion on the list.

>
> Well, as I see it basically just consistency with a larger set of
> things.  Most other related numbering schemes I'm aware of are
> zero-based -- userspace tools like 'taskset' and 'lscpu', system APIs
> like the <sched.h> CPU_SET() routines, and the kernel's own numbering
> (e.g. what's shown in /proc/cpuinfo) all number processors starting from
> zero, so dbus-sensors seems kind of like the odd one out there.
> (Personally I'd be fully in support of changing it to be zero-based as
> well, though I have no idea offhand about how distruptive a change that
> would be.)
>
> It also seems pretty OpenBMC-specific, whereas I'd expect we want to aim
> for greater generality in things going into mainline.

Agreed. The hwmon numbering varies; some attributes are zero indexed
and some start at 1. More commonly we start counting from zero in the
kernel, so I would expect PECI to do the same.

If there's some userspace that depends on the behaviour of these out
of tree PECI patches, then that userspace will need to change. This
reminds us why the project prefers patches exposing userspace ABI are
merged to mainline first.

Cheers,

Joel
