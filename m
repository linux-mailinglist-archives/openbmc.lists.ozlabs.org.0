Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F42278EDB7
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 16:06:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Sst3JhGzDq9V
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 00:06:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fAwP7UCl"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Sm64jRczDr4C
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 00:01:09 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id gn20so1115522plb.2
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UzYmm4gLOc/GeUEYYJN6+OgsalNB87+UH3V9CvzgGwk=;
 b=fAwP7UCl19q9zQ9Xiw/ARrcbtOVer8JMznPZ1d+Rh9T3ys4E44dva46sODdPy6F7hy
 rUybWdNcwOFDcYJjL9vPMfZJPvPCi1EtyUF9Y6JekzRTR59PW/6AYud2jTyJY+iP+O0Y
 9To5u0fbyfp4cUE4F6Xb6CRwHtMkvu90Ut+FHra6j1a8d/fzI2auo8Rhi7uNpXETNryE
 +s5SEMaRhwMQm2wEFKCBJw9ez+9XEdKPxueI9QpMf8KDuaitLpDHMeqgKNdg1H7x2cbX
 DxRwhAizj+D5nWM8o8IOm6Fhip1qreW6adOToUzev28Lj//5AA7Lb757aSnbIMaTL28X
 HkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UzYmm4gLOc/GeUEYYJN6+OgsalNB87+UH3V9CvzgGwk=;
 b=J2gCDkezO9MN3FpozTNeG8gL0GxQEAB9L8Nv1TyRqB5EJGI+4OAnKcygXrmQEWpU/I
 gaewn3t1SpfQ2hbiZ3Sf2w8kKyRQnV4S2woKuUe2+dUOVmpLHC6K6u4JmZtoHtWiq9su
 /erB2L9Qt2lRikTZh/xF95FBn3wi2Ri7i5zz8g6tUR3GxcOk/EBGnGNbe7w1ftv8/nVT
 5pSZhCJqT9Z+/ix6mbRgBCFgVQRlc6o28bQK6SXJ/gjVn0O6+Ib2Orxin7abBU1F5ZuA
 DymfNPpAZNKuouQFdwdDhhlIGHI4Ku9GDNNJv2hC9nP+ClsVIAqgtduDO3kYgQes2OV3
 Qneg==
X-Gm-Message-State: APjAAAUR3uDafoW5+muD3YWGIq1MbytaiFmy/if46C9YbEMPhB1mJ4s1
 k4nxX0GVQOlJh/Y9pUWv4eUK2QIAP2GihNcaC0FNzw==
X-Google-Smtp-Source: APXvYqzBdGgd1M4h9J6jy+Adp25D966T5AN2xDLbjMfja3es1Hmi7VO81k7jBXdi9kz6W5n56MuB+4I3BTrDaY9EyU8=
X-Received: by 2002:a17:902:848c:: with SMTP id
 c12mr2462129plo.47.1565877665837; 
 Thu, 15 Aug 2019 07:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <8c0e07bacc89478996cca5f6718fe715@lenovo.com>
 <CAO=notzwOqKnmhB8Rn+0wAGua6OzpjjNDF=Va4Wyt7p2z9ES8g@mail.gmail.com>
 <6c7100c2019942dc9d5efad6475038ab@lenovo.com>
 <CAO=notwDt+KHOih1JFxOeuU1N6aDTK6qqhOzMJ0nFzRvF9EYdQ@mail.gmail.com>
 <CAO=notwMVACreG5JnxUFLLuY6_rQ4yms9dErrRwg=kXapS3gNQ@mail.gmail.com>
 <916df189468a4716b9cabc5652d1cf47@lenovo.com>
In-Reply-To: <916df189468a4716b9cabc5652d1cf47@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 15 Aug 2019 07:00:54 -0700
Message-ID: <CAO=notx9RRWmTEK0uaxqxLJXpTzNADg5Pugozd7P8H8ZWj06zQ@mail.gmail.com>
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

On Thu, Aug 15, 2019 at 12:16 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote=
:
>
>
>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Patrick Venture <venture@google.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B48=E6=9C=8814=E6=97=A5 =
4:55
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>
> =E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org
> =E4=B8=BB=E9=A2=98: Re: [External] Re: Clarify some questions about host =
tool (burn_my_bmc)
>
> On Tue, Aug 13, 2019 at 8:49 AM Patrick Venture <venture@google.com> wrot=
e:
> >
> > On Tue, Aug 13, 2019 at 8:15 AM Andrew MS1 Peng <pengms1@lenovo.com> wr=
ote:
> > >
> > >
> > >
> > > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > > =E5=8F=91=E4=BB=B6=E4=BA=BA: Patrick Venture <venture@google.com>
> > > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B48=E6=9C=8813=E6=97=
=A5 22:34
> > > =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>
> > > =E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org
> > > =E4=B8=BB=E9=A2=98: [External] Re: Clarify some questions about host =
tool
> > > (burn_my_bmc)
> > >
> > > On Mon, Aug 12, 2019 at 2:43 AM Andrew MS1 Peng <pengms1@lenovo.com> =
wrote:
> > > >
> > > > Hi Patrick,
> > > >
> > > >
> > > >
> > > > 1.      It took about 4 minutes and 30 seconds for BIOS update with=
 64MB rom image. Could we extension the pollstatus time from 100 sec to 300=
 sec to get the final status?
> > >
> > > I'm curious why it's harmful to check more frequently?
> > >
> > >                 I showed some source code of helper.cpp as below, the=
 checking status total time was 100 sec (5*20) but it was not enough for bi=
os update and therefore I would like to extension the time from 100 sec to =
300 sec.
> > >
> > >                                         static constexpr auto verific=
ationSleep =3D 5s;
> > >                                 ipmi_flash::ActionStatus result =3D
> > > ipmi_flash::ActionStatus::unknown;
> > >
> > >                                         try
> > >                                 {
> > >                                         static constexpr int commandA=
ttempts =3D 20;
> > >                                          int attempts =3D 0;
> > >                                                 .....................=
.......................
> >
> > So you're not asking to check it less frequently, you're asking it to
> > allow for a longer period before timing out.
> >
> > >
> > > >
> > > > 2.      If user can choose to preserve BMC configuration (rw area) =
or BIOS configuration when upgrade firmware, do you have any suggestions wi=
th regards to preserve configuration implementation or could the host tool =
support to send a parameter to support it?
>
> Today I'm submitting https://gerrit.openbmc-project.xyz/24402 for review =
to just lengthen the wait.  I'll submit a patch parameterizing it later.
>
> > >
> > > Since one of the design goals was to keep the interface from the host=
 simple, and mostly agonistic to what was taking place, consideration wasn'=
t given for a mechanism for adding extra parameters.  We're in a similar bo=
at where we want a mechanism for changing the level of upgrade, so I'll go =
over the design today at some point and see whether we can do it agnostical=
ly.
>
> For this, I think it could make sense to just have multiple targets for B=
MC updates.  You can define multiple in a single json (by the way), so you =
could have multiple /flash/image, /flash/factory or something and choosing =
one would have a different behavior because it would start a different upda=
te service.
>                 I added two object in single json file, the configuration=
 could be loaded as below and it seems to work well. Do you have any plans =
to support flexible blob-id in host flash tool or we need to modify it by o=
urselves?

I'll have that patch up today.  And update the README to require that
the blob id starts with "/flash/."

>                         Aug 12 20:54:22 hr630 ipmid[778]: config loaded: =
/flash/bios
>                         Aug 12 20:54:22 hr630 ipmid[778]: config loaded: =
/flash/bios1
>                         Aug 12 20:54:22 hr630 ipmid[778]: config loaded: =
/flash/image
>
> > >
> > > >
> > > >
> > > >
> > > > Regards,
> > > >
> > > > Andrew
> > > >
> > > >
