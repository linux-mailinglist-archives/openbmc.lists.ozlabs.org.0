Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C5326E984
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 01:37:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bstfp1qFWzDqfK
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 09:37:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=LxOp4eNm; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bstdn3GFtzDqbm
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 09:36:25 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id y74so4438490iof.12
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 16:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oeS9Drs3nbmcJxlwm/F6BbAO52SYud0SPmQhM21L4Sw=;
 b=LxOp4eNmhtYijKcs0NY1I5lZjjFAj2pNoHt2NJ4HyGPRd9hzNMyQIP+8rItsUu3XK5
 Lr3vR2fANRLPDCx2luKir2ZI3rVoxCEAIrHMCFsKucUNUHBbrf7qk3UrkB85988VBqDy
 Okbl0SxBqqBxPQ9uIYuR2SqoxY0nPUSptcYeg5kfPLD71La6oNNdY+FDj9+Lsq9bmuD2
 85Bg1HyzwR8GYysXczlwUSgsHkR+YarOZrZIrjxdeThbsCXNZZngipWI2tmFSxzcR/8f
 yBeIbUX66brxpbyxDQDGpvA/Pmd2gxW5m8fT/8dEcw43y+ljOAV+N9jyG7G5jQYyck8R
 xNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oeS9Drs3nbmcJxlwm/F6BbAO52SYud0SPmQhM21L4Sw=;
 b=WrwV5CCHd74V+5emJN6UOsgxAMOjmvMaTg4auJGcSEsmjM3J65G5270YYL/h4TRWn3
 mFXFyM7Mvn+oBQU1cpnjJnBia7atqAWdhAzQuIrRbzSuiBvk003cQa3lsxPKE8pSivO1
 Uyz0LJ8DhcpgkADMMgayUsYW3c/rc+goE9Ivj4IRSmPWMSq9yJAw6Gcq1d/u4xbzTIh/
 hLpmKeBkMiFvd94E8adiBNzw0RZwo1NLuTDNcwXdf0beNfpOPI1Uj5bntZp6gKA6ffYw
 BUHuy/f0AVgK4dRhMqTZG04GKuol61QdQgWhlG46+fOjl145dHD+ggEiY5U1zD5R4NcD
 eNTg==
X-Gm-Message-State: AOAM531u+1giCG21Shk0bRQJzKJTInQeWoNxzLhBO74DDegUP9P0ulKA
 4jHCOhCK1VNBSKu3yQyySO/r1pzhpnMFltYFSyTt0w==
X-Google-Smtp-Source: ABdhPJwki6l6EWR30gvfF9dJP0yvP5/BSR6oKyH6JLJYhB3TZX/cc4CkAg79P6eFy8Jh4MiuCt/M8Ykf0hDXl5UAkrU=
X-Received: by 2002:a02:ce46:: with SMTP id y6mr27569487jar.102.1600385781734; 
 Thu, 17 Sep 2020 16:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
 <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
 <CANPkJS_p9iTJJCue_cSePsgsJ71ztv06XEvEpqe1Y294ne5UYQ@mail.gmail.com>
 <20200917152912.GG6152@heinlein>
In-Reply-To: <20200917152912.GG6152@heinlein>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 17 Sep 2020 16:35:44 -0700
Message-ID: <CADKL2t5npwwBs6ecKAqscJ8=BoakpwDNMjuSiZOSXTkCNcLryA@mail.gmail.com>
Subject: Re: Quanta requests to create a repo in OpenBMC github
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Josh Lehan <krellan@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Sep 2020 at 08:29, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Would someone mind giving a 1-2 sentence explaination of what "sensor
> margin values" are?  I'm certainly not a thermal control expert.

This daemon is intended to be used in combination with
phosphor-pid-control. You define a configuration file with two
sections: sensors and zones.

Sensors have a D-Bus path to read from along with a target temperature
and some other parameters. The daemon subtracks the current
temperature from the target temperature to get the "margin". A smaller
margin means the temperature is closer to the limit.

Zones group sensors together and look for the worst (lowest) margin
value within that group. This value is then exported for use in
phosphor-pid-control.

>
> I don't care if there are multiple implementations of similar
> functionality, but there is also work going on for a repository called
> 'phosphor-virtual-sensors'.  What little I could understand of
> read-margin-temp's role seems to somewhat overlap with that effort.

It may be possible to implement this using the functionality provided
by phosphor-virtual-sensors, but the resulting configuration would
likely be complicated and difficult to maintain. Margin calculation is
a common enough use case that I think it's worth having a dedicated
service.

>
> On Wed, Sep 16, 2020 at 10:37:14PM -0700, Josh Lehan wrote:
> > Yay, this is great to see. I have some bug fixes to read-margin-temp an=
d
> > was just wondering how to contribute them. I'm really hoping this makes=
 it
> > into OpenBMC. It's the perfect preprocessor for phosphor-pid-control, I
> > have found.
> >
> > Josh
> >
> > Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
> >
> >
> >
> > On Wed, Sep 16, 2020 at 7:15 PM Benjamin Fair <benjaminfair@google.com>
> > wrote:
> >
> > > On Wed, 16 Sep 2020 at 06:31, Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) =
<Fran.Hsu@quantatw.com>
> > > wrote:
> > > >
> > > > Hi Brad,
> > > >         This is Fran from Quanta Computer.
> > > > Quanta OpenBMC team would like to share some useful tools to the Op=
enBMC
> > > community.
> > > > Such as the read-margin-temp daemon (
> > > https://github.com/quanta-bmc/read-margin-temp), we are using this da=
emon
> > > to fill sensor margin value to PID to do fan control.
> > >
> > > read-margin-temp seems useful and widely applicable enough that I
> > > think it's worth having a dedicated repo for it.
> > >
> > > The quanta-misc repo could possibly be used for smaller, more
> > > Quanta-specific things.
> > >
> > > >
> > > > We would like to have a repo named "quanta-misc" under the OpenBMC
> > > github.
> > > >
> > > > Here is the maintainer list:
> > > > M:  Benjamin Fair <benjaminfair@google.com> <benjaminfair!>
> > > > M:  Brandon Kim <brandonkim@google.com> <brandonk!>
> > > > M:  Fran Hsu <fran.hsu@quantatw.com> <franhsu!>
> > > > M:  George Hung <george.hung@quantatw.com> <ghung!>
> > > > M:  Buddy Huang <buddy.huang@quantatw.com> <buddyhunag!>
> > > >
> > > > Thank you.
> > > > Fran Hsu
> > > > E-Mail : Fran.Hsu@QuantaTW.com
> > > > Tel: +886-3-327-2345 Ext: 16935 <+886%203%20327%202345>
> > > >
> > > >
> > >
>
> --
> Patrick Williams
