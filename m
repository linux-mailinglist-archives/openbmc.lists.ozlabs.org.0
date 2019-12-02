Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F9410F26E
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 22:55:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Rf6n3f38zDqPC
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 08:55:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ADsYZ5S3"; 
 dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Rf5x5888zDqBK
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 08:54:26 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id y8so572706qvk.6
 for <openbmc@lists.ozlabs.org>; Mon, 02 Dec 2019 13:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y0RniO2YxLSftDojbFMiapUprW0ftsjZBRsP/6JKHko=;
 b=ADsYZ5S3eGTN2nAmvKn67g++iYMxWK2ZNtcYmK35qHaQCulFAVId2OlNJKvA3zbNol
 bxPAhcc3sTydwH0Oh+B5yQurJnv7AxphC00jivgPD5ULbFVQ6mhWW0VeOi7nCvdI1/CU
 tTSICH/M4dLUkwBUQ/e0IZdpCY0mzrOXjvzCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y0RniO2YxLSftDojbFMiapUprW0ftsjZBRsP/6JKHko=;
 b=MTypWycb1td7k6Uh46sxKDSreNxxQJLxYKh7ojqdE6YDAsS3A2eu3BL0PZcOsXSRRw
 2GWGxUJayiaROBG6cpKXy3OdYjzopSMJfQ/rfUfPvgHfZ1/s40MvX+Cl2TRBYwem+vtU
 liDze9ErJwT52gokZ8OZKGKkLpyM3fV7P7EI/i01KUduUssO74y89VwQ5CTGeiSzW4MX
 0wftoQBPXdy4Rr8vfedsInwzXsFx9C5UavlNK9hsvz5NI4vzlOUHwrHN46WXYD5YU2xK
 RH9r+lgmM5J5+awZ/GypReuCx+0YrchlSQUxzbSk+bQvhBX/DJ5DTIsWnXDx2eN/q13u
 tuxg==
X-Gm-Message-State: APjAAAWFRyLw80gjFz5GRRsFYXiiVGY8gwuihyFD0aQ0sNPBstwpcJOs
 Oo7PZFSop3fJ6hCPCvfPZg6xLr9gd9WXpBgNIWm8UUrX
X-Google-Smtp-Source: APXvYqwCnVwnm+54pnrDb5L1LnS6Iusk19qW6csm8Gs2KbOw+8iyuojVtdIgVodPyYB/NWaybMFKOUAXWLHgn+RVWDw=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr1585572qvo.20.1575323662687; 
 Mon, 02 Dec 2019 13:54:22 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XffZqTq3YqEEcA7mm4d1k0V30o1TLE79nBOGrVcEBCjog@mail.gmail.com>
 <be709e4f-1215-3d88-9974-1989b9867e60@linux.intel.com>
In-Reply-To: <be709e4f-1215-3d88-9974-1989b9867e60@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 Dec 2019 21:54:10 +0000
Message-ID: <CACPK8XcvBTj=AxaREQuLpi6=YZdU03ajW1nXKhnvud_jP8Ez_g@mail.gmail.com>
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

On Mon, 2 Dec 2019 at 18:09, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Joel,
>
> Thanks for letting me know this. Also, thanks a lot for carrying the
> out-of-tree PECI patches in OpenBMC kernel tree so far.
>
> Can I submit updated PECI patches to OpenBMC upstream if I'm gonna add
> it back? Linux upstreaming isn't ready yet because configfs support
> should be implemented to address subsystem maintainer's comments but it
> needs at this moment in OpenBMC kernel tree to keep developing
> dbus-sensors support.

This was the status back in January. I think it's time to find someone
to complete the work on PECI so it can be merged upstream.

Once those patches have been posted, we can merge them into the
openbmc tree while we wait for them to be merged into mainline.

>
> Thanks,
> Jae
>
> On 12/1/2019 8:35 PM, Joel Stanley wrote:
> > Hi Jae,
> >
> > As I have not seen an upstream submission of PECI for a number of
> > release cycles (since January, over 10 months ago) it will be dropped
> > from the OpenBMC kernel tree.
> >
> > If you still want this code in the kernel you will need to make a new
> > upstream submission.
> >
> > This aligns with the OpenBMC kernel development process, where a patch
> > is carried to assist developers who are actively working to get their
> > drivers merged upstream
> >
> > Cheers,
> >
> > Joel
> >
