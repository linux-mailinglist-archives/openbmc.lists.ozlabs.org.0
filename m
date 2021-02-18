Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AB31E90C
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 12:36:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhCMm2l8rz30Q6
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 22:36:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=AxIjwBhd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=AxIjwBhd; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhCMX3Sw0z30LZ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 22:36:07 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id a7so1597690iok.12
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 03:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cil0AxjhJT4tyaNMAeDU7MxGyjnsoPR8BsnbhJvUUjA=;
 b=AxIjwBhdiRwhFBTVBN9L6uwdB6vXYVQ9IXjQLAdNHlBvuyob3npGrPt1jE2O2dPbNq
 5J5yXMuusxGNOZL50lLk8SPW93a6B/pWCt7Ww+GpcudfoNpslDo6EKP9qb6YRk7pIR79
 ZCXfJzYUFL0TagYsn9QmIjVepYhNiOmHnf+o6Pj2thKZviBa/pgt+wSQ1VDukX3Zk4wQ
 309yk1sINbmEf7nsIYD5l48R7ARz6sxoxsHNdJachrUKZQfACQNw36aPO5kjmmZfWKd5
 oMmFS8Ik6bdHaApqD82kb9yv+WA9BZKqDlRMI237Y4C15Bs/+NDYblBKUtFVeFjNTVns
 0cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cil0AxjhJT4tyaNMAeDU7MxGyjnsoPR8BsnbhJvUUjA=;
 b=gYPdSOrRB67RniacJz2C8G1QFLaHdIIZVaLfcy0QpXgStVVaFHGSEkQl0oy0f9pE7H
 UH6KtkNpJ6VRFlA8XLCg9vGvIrnrieAPRHD8GnQnHP4yO0vSfmnJIHJ9wmD6986150L+
 Gl13KDaLjZw9k3ZLFDyujym1tQBdqkM/1d3yNcf9+kMwr1nSeMxKZa94R6UVdMZcJp3H
 AiZKkghHgI+8j6hfdU9FCMu/xyB3Ldz0I6C9T/DnNevWHR9GIg0Tg/MhopTKBxkMxoQN
 EH2OCG+ihD0dauvSkZTpuH+6BcSbswdB5YtIzth70/w+nQPQbY0J2iwoqJle8gayrn7s
 22hg==
X-Gm-Message-State: AOAM531Q2ZUYlsvtjFFYZz1lJ2osqurKIBj9yV7xrCvm57Q5bHu3aPmk
 t3nF4effWiEv3Q//D3RyH89WaTVGkiVk2wCynio8U44v471Zug==
X-Google-Smtp-Source: ABdhPJzO6R16bebsUTug4lnEZRaXTHl+dURCCQLvqmUH39Xk9frzhEhWEqWhj7zSLONvLcI6TH3ASmwtxTqUjtpXRt4=
X-Received: by 2002:a02:62c6:: with SMTP id d189mr4057293jac.144.1613648164760; 
 Thu, 18 Feb 2021 03:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20210211083454.37117-1-gmouse@google.com>
 <CADVsX8-A+zc3jfwhXjOfEd3xsBQ9hvPSvAiNw62gbcf2dVozpQ@mail.gmail.com>
 <CACPK8XeMV4=XKFwLUOZX056D4oobV82ZvsxXkFV-4wvjcgvA4g@mail.gmail.com>
In-Reply-To: <CACPK8XeMV4=XKFwLUOZX056D4oobV82ZvsxXkFV-4wvjcgvA4g@mail.gmail.com>
From: Anton Kachalov <gmouse@google.com>
Date: Thu, 18 Feb 2021 12:35:53 +0100
Message-ID: <CADVsX8_4OsRxKsWRXwEx9r0qsT3pzmDkaaGEFu3h0b_bDj2Y3g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout This change satisfy
 OpenBMC requirements for flash layout.
To: Joel Stanley <joel@jms.id.au>
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

Hi, Joel.

Ok, I will resend. What do you mean with sending to mainline lists?
In MAINTAINERS the arm/nuvoton mentions this openbmc@ mailing list.

On Thu, 18 Feb 2021 at 06:13, Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 11 Feb 2021 at 16:15, Anton Kachalov <gmouse@google.com> wrote:
> >
> > Hi, Joel.
> >
> > This is the correct patch.
>
> Thanks. I didn't get this email; can you resend the patch?
>
> Please send it to the mainline lists, and use get_maintainers.pl so
> the nuvoton team can review.
>
> I will apply it to the nuvoton tree for merging next merge window, and
> to the openbmc tree.
>
> Cheers,
>
> Joel
>
> >
> > On Thu, 11 Feb 2021 at 09:34, <gmouse@google.com> wrote:
> > >
> > > From: "Anton D. Kachalov" <gmouse@google.com>
> > >
> > > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> > > ---
> > >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
> > >  1 file changed, 8 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > > index bd1eb6ee380f..741c1fee8552 100644
> > > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > > @@ -182,8 +182,8 @@ bbuboot2@80000 {
> > >                                 reg = <0x0080000 0x80000>;
> > >                                 read-only;
> > >                                 };
> > > -                       envparam@100000 {
> > > -                               label = "env-param";
> > > +                       ubootenv@100000 {
> > > +                               label = "u-boot-env";
> > >                                 reg = <0x0100000 0x40000>;
> > >                                 read-only;
> > >                                 };
> > > @@ -195,25 +195,13 @@ kernel@200000 {
> > >                                 label = "kernel";
> > >                                 reg = <0x0200000 0x400000>;
> > >                                 };
> > > -                       rootfs@600000 {
> > > -                               label = "rootfs";
> > > -                               reg = <0x0600000 0x700000>;
> > > +                       rofs@780000 {
> > > +                               label = "rofs";
> > > +                               reg = <0x0780000 0x1680000>;
> > >                                 };
> > > -                       spare1@D00000 {
> > > -                               label = "spare1";
> > > -                               reg = <0x0D00000 0x200000>;
> > > -                               };
> > > -                       spare2@0F00000 {
> > > -                               label = "spare2";
> > > -                               reg = <0x0F00000 0x200000>;
> > > -                               };
> > > -                       spare3@1100000 {
> > > -                               label = "spare3";
> > > -                               reg = <0x1100000 0x200000>;
> > > -                               };
> > > -                       spare4@1300000 {
> > > -                               label = "spare4";
> > > -                               reg = <0x1300000 0x0>;
> > > +                       rwfs@1e00000 {
> > > +                               label = "rwfs";
> > > +                               reg = <0x1e00000 0x200000>;
> > >                         };
> > >                 };
> > >         };
> > > --
> > > 2.30.0.478.g8a0d178c01-goog
> > >
