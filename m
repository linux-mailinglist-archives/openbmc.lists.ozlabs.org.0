Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8610F52B
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 03:48:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RmdR3yc8zDqPW
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 13:48:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QmE3Ciqg"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Rmcf0ph5zDqNs
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 13:48:01 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id 14so2198852qtf.5
 for <openbmc@lists.ozlabs.org>; Mon, 02 Dec 2019 18:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qg1/5nklWXzXN51QkowyeT60TVZUbZHL5L2I2tqxDP0=;
 b=QmE3Ciqg7xDrpKHm0xVKAFxEijQOIyoEiVTmWIJDP2wkjsoPtL3UdEdG6SmDk72vQY
 xzh9bQMifZ8LU834bG6n8ZEEfp/m26j08Itn67aVRGGnAiwYgWWsigl9q/UZI5nMVzbS
 LSUpeQPjwNTvkuhxgWfd4+0x1waQlg/qkpOl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qg1/5nklWXzXN51QkowyeT60TVZUbZHL5L2I2tqxDP0=;
 b=SDjROOUCCTAGf+Rtg1me/0HAKeqgyDXscdi6TfDl7D2gkeKx8OqnZboqv7QR0XjPRz
 3NoM9xbw8ghHFtlTAV+EoHqBqdxBPgA9jhAy1GJEyAQZADLpVdVyxumsVQXcruwcjSjh
 512NxAHHzFn1sETwuCjJFbYdqDFBOOD98f6k0ZWgiMfvLld1k1IK0T9i0rsBNEbenZYH
 5jAKgvgrWU/9wQeeV16e0GLxFq70j2c1xopjdb+hDmAhLFFstJlnsxIR532FaBB0c2ny
 zVjWkkb+/kJqK2pUUM18vk2qyeoA1oRUCBjedzTW0sSVdJ1uSjRWATMLaI0UZBpbosMd
 qPeg==
X-Gm-Message-State: APjAAAUs3ZvcZh9tRLFSwV383NRee3+su1dtrQTJ7SBsMciq56w4ZgI5
 cGjDoFCtlGH577pkwOKv/Vghhzf+Xi64O6s/W/shnlts
X-Google-Smtp-Source: APXvYqyWp06aM17ltHiWZB6xvssKkKVFLdQbbPF7A9GW4Hkd2Cs3E7TADutPErz4JrqOGb1DUWCjfMDKWJTOPa2l+mk=
X-Received: by 2002:ac8:27a3:: with SMTP id w32mr3229359qtw.234.1575341275746; 
 Mon, 02 Dec 2019 18:47:55 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XffZqTq3YqEEcA7mm4d1k0V30o1TLE79nBOGrVcEBCjog@mail.gmail.com>
 <be709e4f-1215-3d88-9974-1989b9867e60@linux.intel.com>
 <CACPK8XcvBTj=AxaREQuLpi6=YZdU03ajW1nXKhnvud_jP8Ez_g@mail.gmail.com>
 <cb401668-703b-9745-c022-44b8bdb2c07f@linux.intel.com>
In-Reply-To: <cb401668-703b-9745-c022-44b8bdb2c07f@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 3 Dec 2019 02:47:43 +0000
Message-ID: <CACPK8XdcoYMMYGJdxnafBiHkRpQt17w4maXUwOvfMf+NqF7Njg@mail.gmail.com>
Subject: Re: Dropping PECI patches
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 3 Dec 2019 at 01:25, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> On 12/2/2019 1:54 PM, Joel Stanley wrote:
> > On Mon, 2 Dec 2019 at 18:09, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >>
> >> Hi Joel,
> >>
> >> Thanks for letting me know this. Also, thanks a lot for carrying the
> >> out-of-tree PECI patches in OpenBMC kernel tree so far.
> >>
> >> Can I submit updated PECI patches to OpenBMC upstream if I'm gonna add
> >> it back? Linux upstreaming isn't ready yet because configfs support
> >> should be implemented to address subsystem maintainer's comments but it
> >> needs at this moment in OpenBMC kernel tree to keep developing
> >> dbus-sensors support.
> >
> > This was the status back in January. I think it's time to find someone
> > to complete the work on PECI so it can be merged upstream.
> >
> > Once those patches have been posted, we can merge them into the
> > openbmc tree while we wait for them to be merged into mainline.
>
> I've made lots of update in Intel downstream PECI to address
> maintainers' comments except the configfs thing so I agree that PECI
> codes in OpenBMC kernel tree need to be updated. Can you give me a week
> for submission of new patch set into linux upstream? In the meantime,
> I'd like to keep the out-of-tree PECI patches if possible to avoid build
> breaks in dbus-sensors repo.

The build break of dbus-sensors has already held up moving to 5.4 for
a week. I think this situation is a clear demonstration of how
carrying out of tree patches for a long time slows down the
development of the entire project.

I will hold off moving to 5.4 for another week. Please keep us up to
date with your progress.

Cheers,

Joel
