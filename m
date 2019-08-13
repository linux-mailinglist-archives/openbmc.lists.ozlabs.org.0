Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1D8C25F
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 22:56:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Q3v0NmJzDqXC
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 06:56:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PiCN+SjE"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Q2P1WsZzDqXt
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 06:54:52 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id m12so11143612plt.5
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 13:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U3rJsGWF+qqQw9V+IkJmvZXKHJWPzMM+YZuGZfANsNk=;
 b=PiCN+SjE0VVuGwFSLN2SHmP50IIlMnuXR3BDTUQQK91x3/BE6f8ar44sGGYpUntTm6
 hZpkVQQdThGWAq2dUONmaB0Y6tdvznZ9jAIca6NxOz5c5AhxzmxNUuhPTc/7aV8iyPnl
 t1BfWTMJnodqe1aPTEo1rF1wgksF2BOqf6NDCDg6O7rteadvlrMkje3SryhVG+D6iF50
 Trl4lQ4MWYviHS/8QFN8YvuuO2uOtAV1wHchzv3k0CKl4fEB1aq0Fl0BI0P9dHSGiSqg
 BZeGG7rrtWxry5fbaqT0eEYzUroy2wC7GFEiE+9QAdlOuKl6Izm2PmMv4SzysSTLhSHA
 TtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U3rJsGWF+qqQw9V+IkJmvZXKHJWPzMM+YZuGZfANsNk=;
 b=h+QRfILRtYw4OxSZSbAKn24sQh2BnP/YjSBeVRdbVGEe4Ze94roobQp5NSxvVoVZ0M
 ahB2kPB+lq/f9aVNazWRdRTMT+bexAFl/MZ6Wuh2V0ZQOoQ9Rm+s2OuNNnQ0EXGtukmj
 j7lw4JM3iRDfrYaSLpicT0YOeJ7wv2TWeabti6bqmCeh53jCs0pY2TpVL+/as1nH6Hp3
 Bvp6q5CL2dk9zTXDFz1it8XgzgFzZepjDXy1T4jg4vsTh1xpM15eq002HOow5RqAWXR+
 bRVwUIXQkwklw5wKG5c0WpDOj8edY31Gd5LQ+CetjAAQwRhFuSJtoYDLTrJFZ5nrj7M8
 zJZQ==
X-Gm-Message-State: APjAAAXjiwi7ngWAAsNVgsfapHgpUHmkbDbgK1IHDQ9vYZBYf2MVmCMv
 dtTYNekmR/4uXbz8QY+zdoZUPK8a4b1kJmtjVJCouTUmvwVTVA==
X-Google-Smtp-Source: APXvYqw8U4T8nOVZ3c2OL3KOewnOzvenjFIGErIRf3Lt7Lm1MwxMPzcPX2LShB3G2uT5Xssws7hIuMYMuWikAdiTra0=
X-Received: by 2002:a17:902:a9c3:: with SMTP id
 b3mr8404787plr.179.1565729689334; 
 Tue, 13 Aug 2019 13:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <8c0e07bacc89478996cca5f6718fe715@lenovo.com>
 <CAO=notzwOqKnmhB8Rn+0wAGua6OzpjjNDF=Va4Wyt7p2z9ES8g@mail.gmail.com>
 <6c7100c2019942dc9d5efad6475038ab@lenovo.com>
 <CAO=notwDt+KHOih1JFxOeuU1N6aDTK6qqhOzMJ0nFzRvF9EYdQ@mail.gmail.com>
In-Reply-To: <CAO=notwDt+KHOih1JFxOeuU1N6aDTK6qqhOzMJ0nFzRvF9EYdQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Aug 2019 13:54:37 -0700
Message-ID: <CAO=notwMVACreG5JnxUFLLuY6_rQ4yms9dErrRwg=kXapS3gNQ@mail.gmail.com>
Subject: Re: [External] Re: Clarify some questions about host tool
 (burn_my_bmc)
To: Andrew MS1 Peng <pengms1@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 13, 2019 at 8:49 AM Patrick Venture <venture@google.com> wrote:
>
> On Tue, Aug 13, 2019 at 8:15 AM Andrew MS1 Peng <pengms1@lenovo.com> wrot=
e:
> >
> >
> >
> > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Patrick Venture <venture@google.com>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B48=E6=9C=8813=E6=97=
=A5 22:34
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>
> > =E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org
> > =E4=B8=BB=E9=A2=98: [External] Re: Clarify some questions about host to=
ol (burn_my_bmc)
> >
> > On Mon, Aug 12, 2019 at 2:43 AM Andrew MS1 Peng <pengms1@lenovo.com> wr=
ote:
> > >
> > > Hi Patrick,
> > >
> > >
> > >
> > > 1.      It took about 4 minutes and 30 seconds for BIOS update with 6=
4MB rom image. Could we extension the pollstatus time from 100 sec to 300 s=
ec to get the final status?
> >
> > I'm curious why it's harmful to check more frequently?
> >
> >                 I showed some source code of helper.cpp as below, the c=
hecking status total time was 100 sec (5*20) but it was not enough for bios=
 update and therefore I would like to extension the time from 100 sec to 30=
0 sec.
> >
> >                                         static constexpr auto verificat=
ionSleep =3D 5s;
> >                                 ipmi_flash::ActionStatus result =3D ipm=
i_flash::ActionStatus::unknown;
> >
> >                                         try
> >                                 {
> >                                         static constexpr int commandAtt=
empts =3D 20;
> >                                          int attempts =3D 0;
> >                                                 .......................=
.....................
>
> So you're not asking to check it less frequently, you're asking it to
> allow for a longer period before timing out.
>
> >
> > >
> > > 2.      If user can choose to preserve BMC configuration (rw area) or=
 BIOS configuration when upgrade firmware, do you have any suggestions with=
 regards to preserve configuration implementation or could the host tool su=
pport to send a parameter to support it?

Today I'm submitting https://gerrit.openbmc-project.xyz/24402 for
review to just lengthen the wait.  I'll submit a patch parameterizing
it later.

> >
> > Since one of the design goals was to keep the interface from the host s=
imple, and mostly agonistic to what was taking place, consideration wasn't =
given for a mechanism for adding extra parameters.  We're in a similar boat=
 where we want a mechanism for changing the level of upgrade, so I'll go ov=
er the design today at some point and see whether we can do it agnostically=
.

For this, I think it could make sense to just have multiple targets
for BMC updates.  You can define multiple in a single json (by the
way), so you could have multiple /flash/image, /flash/factory or
something and choosing one would have a different behavior because it
would start a different update service.

> >
> > >
> > >
> > >
> > > Regards,
> > >
> > > Andrew
> > >
> > >
