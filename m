Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2F5333EA
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 01:30:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L79Qw5J32z3bn5
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 09:30:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BPxd5KCl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12a;
 helo=mail-il1-x12a.google.com; envelope-from=prashantsbemail@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BPxd5KCl; dkim-atps=neutral
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6kSc70Qwz2yp0
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 16:14:56 +1000 (AEST)
Received: by mail-il1-x12a.google.com with SMTP id z16so5040434ilp.5
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 23:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2h1BLiO1XyM/IzUQCLsg96XzMF7KmmDKYegm8QKJobM=;
 b=BPxd5KClWYAWR7b/qPZlN49wH7+NIvkCSw1Ko+cut/jTvNTteQp2dUYRkk+JrrrsBk
 qarPTx2TOyVeQL7WjleIIFiGrXSeflbaS2fbubqEPsvblFXzetD/TnnL38xaRB8A2NF0
 OyQdb3Birfv3pyEe4NgSeAjxsCXGjNecCT2NH4t1b1r6ua5+uLF7U7OHqN3BdsI6hvjp
 3P1oE9WWwiEFZde4rnWJPSYXe3hfrxq8hH1jgpfILOoH6hUo9s/JuQZRztt/iMCVVr2H
 uc8Qtv3FIjUwMEx+T07Z8VMVYliPyvqzmEQq1mo1pl1NijlsfqZXb157ZB7ZbNgdFxVA
 szEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2h1BLiO1XyM/IzUQCLsg96XzMF7KmmDKYegm8QKJobM=;
 b=WASvx0QyyYuFMmfV5tFzMX16jFbCrobUGGffyGpoiG0KB7JkdPI0jm4K0aH1+5iFhn
 xKmw6N2QzTHtF05cNhsW2lvYLeWCfSgRAVRatAvuc/UJCy0rfMCm/ty0cs1dlnWseI4j
 AyhOyJF56HFKbtxaYSNRA7yo6O2gh99qDZOxWfxno5CIfvEZPZxwjDZIRot6NrNOsP5O
 bbLGlvDNcn7L1GbHrrnLF0E2E1Q5JmngwPizF8MUukXqpM60TSOOoxokQs8CIydof4bK
 ivUWZEWi3HFNHhQ1ELyGLSQRmFYZdAoNwFsHQ3ugOYR+rirCTbSa4TxvzSY8zqvwwzbw
 bTag==
X-Gm-Message-State: AOAM5311mBACf+QudxsrF1Rjo7ksnDZP1IMzr0okqlejXmp0SnD8rRUz
 eOBCSSEqmAExcwmrhv37qcOJs0WVj0PVjnHrZSAuLalOoLY=
X-Google-Smtp-Source: ABdhPJyuXWH/7ztL09AlLKInHkTpkzQwacs5rYLr2EMf+SgbCXA286eId3G8xuh/xe3tVJfmsWM7Nuqaj+MX67fs3W0=
X-Received: by 2002:a92:ddcb:0:b0:2cf:8e55:e997 with SMTP id
 d11-20020a92ddcb000000b002cf8e55e997mr12889430ilr.8.1653372894509; Mon, 23
 May 2022 23:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAD5wtF146Axtj5XCDMFY=EEXpDUE3sGRD_76kVyBq8jJ9RQOpQ@mail.gmail.com>
In-Reply-To: <CAD5wtF146Axtj5XCDMFY=EEXpDUE3sGRD_76kVyBq8jJ9RQOpQ@mail.gmail.com>
From: Prashant Badsheshi <prashantsbemail@gmail.com>
Date: Tue, 24 May 2022 11:44:43 +0530
Message-ID: <CAD5wtF0FCAFcsNT_ivDe_-a5YKZ0W1K99zfD4a3xwHnxr3rLKw@mail.gmail.com>
Subject: Re: Need help in creating Namespace Journal logging
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000f000805dfbbe03f"
X-Mailman-Approved-At: Wed, 25 May 2022 09:28:20 +1000
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
Cc: prashant-surendra-badsheshi@hpe.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000f000805dfbbe03f
Content-Type: text/plain; charset="UTF-8"

>
>
>
> Hi,
>
> I am working on a yocto based openbmc project, I am trying to add
> namespace journal logging.
>
> Can anyone share the steps to create a namespace journal logging in the
> yocto based openbmc project.
>
> Also it would be helpful if we have any examples implemented for namespace
> journals.
>
>
>
> Thanks,
>
> Prashant
>

--0000000000000f000805dfbbe03f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><br><br><div><p class=3D"MsoNormal" sty=
le=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif">Hi,</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">I am working on a yocto based openbmc project, I am trying t=
o add
namespace journal logging.</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Can anyone share the steps to create a namespace journal
logging in the yocto based openbmc project.</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Also it would be helpful if we have any examples implemented
for namespace journals.</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Thanks,</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Prashant</p></div></div>
</blockquote></div></div>

--0000000000000f000805dfbbe03f--
