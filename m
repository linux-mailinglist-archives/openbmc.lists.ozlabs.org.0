Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73531D9EA
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 14:03:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgdLh65qKz3cW6
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 00:03:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=KewIi/LC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KewIi/LC; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgdLT22Hrz3cPs
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 00:03:10 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id a7so2447061iok.12
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 05:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9T8dfk3KwVwENRD0wC1bGsRA8JwWjMd2I1KyKq3Oxlo=;
 b=KewIi/LCMPydkFs+gEkadN21QytgmrbzykEY+PSIFJeKwTjcwVYzhA4o3M2WIh3mwJ
 IqUo0iRUOOCDHeQtg240whjYLNDMtR30A8nJlQh2pa7CtXxCjL3mQMo9aAbaD1corDKk
 Ib1QN/AX4aoBBUZkdgTaXqrMYJyvNcd3IALVnKEjI8QarSTyImnWcm7OKLqJdV3QF6WV
 /lvBtO0jIbL84ROCsuBOMV8V2bbeMcoM/w3bM0SoI/NH1b36LwNuUOgkBIqzxsV8WnJj
 pBfYEKCsNMXddzqo38lTqM7oFqZjS5kSldPuco9g+Tl3MZ1GhaHiqRJHyV0G2ns1jljA
 M4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9T8dfk3KwVwENRD0wC1bGsRA8JwWjMd2I1KyKq3Oxlo=;
 b=Maph1SpjgjMSLEyQolFUiO2AkOkI5peO/Ejh5AMGpMDCKrTpFsuia1MCK646JzYE8P
 3tYgIzpP5Lj4I0Lk1GdLqmyi7MHTeFT/ShibdNbUnqU4GD08v/cZKi7DlROwa4a6Y7Y6
 7Xu3Lk/RlI5MkOCju4k8zsyejGooQV+ToVv/g7Xsma7aw6Rduojy5BWPumCk0d3q8CTa
 cV8EFfU6U+DWe3QpioiGO9zaFvqACaFl8YRS7NIzutLxvb7wKTM84eZno15Zd/SU4/xP
 ud6zx1345oRtx0TxSBG83TST+witQiPRS9hsTQoENrBadnJHG4V0Ge0gxrlU2psnzYzw
 qN1w==
X-Gm-Message-State: AOAM532vgtlqVZhuiopWFvrdKh0P96G4yP67w7SA24q4L28x2Py18IC+
 KcgiP+T3I6baUrRmtz7GJaU3Tm/hxbbLNQMC/efdzEs/Zf0=
X-Google-Smtp-Source: ABdhPJzVWgj2ZyxUDpgzP0RfZhmfDwMGeKtpF9+HZG1hOKUmA2K8Zdk94g3ClZN8jpUy4vK3iDMJkGULnDKaqoLOslM=
X-Received: by 2002:a5d:8490:: with SMTP id t16mr20427765iom.91.1613566985436; 
 Wed, 17 Feb 2021 05:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20210211083454.37117-1-gmouse@google.com>
 <CADVsX8-A+zc3jfwhXjOfEd3xsBQ9hvPSvAiNw62gbcf2dVozpQ@mail.gmail.com>
In-Reply-To: <CADVsX8-A+zc3jfwhXjOfEd3xsBQ9hvPSvAiNw62gbcf2dVozpQ@mail.gmail.com>
From: Anton Kachalov <gmouse@google.com>
Date: Wed, 17 Feb 2021 14:02:53 +0100
Message-ID: <CADVsX88GRvve4uy2USUjB6PvMrE8=JJsWU7eLo5RDm5UQz3cyA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout This change satisfy
 OpenBMC requirements for flash layout.
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Gently ping.

On Thu, 11 Feb 2021 at 17:15, Anton Kachalov <gmouse@google.com> wrote:
>
> Hi, Joel.
>
> This is the correct patch.
>
> On Thu, 11 Feb 2021 at 09:34, <gmouse@google.com> wrote:
> >
> > From: "Anton D. Kachalov" <gmouse@google.com>
> >
> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> > ---
> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
> >  1 file changed, 8 insertions(+), 20 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > index bd1eb6ee380f..741c1fee8552 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
> >                                 reg = <0x0080000 0x80000>;
> >                                 read-only;
> >                                 };
> > -                       envparam@100000 {
> > -                               label = "env-param";
> > +                       ubootenv@100000 {
> > +                               label = "u-boot-env";
> >                                 reg = <0x0100000 0x40000>;
> >                                 read-only;
> >                                 };
> > @@ -195,25 +195,13 @@ kernel@200000 {
> >                                 label = "kernel";
> >                                 reg = <0x0200000 0x400000>;
> >                                 };
> > -                       rootfs@600000 {
> > -                               label = "rootfs";
> > -                               reg = <0x0600000 0x700000>;
> > +                       rofs@780000 {
> > +                               label = "rofs";
> > +                               reg = <0x0780000 0x1680000>;
> >                                 };
> > -                       spare1@D00000 {
> > -                               label = "spare1";
> > -                               reg = <0x0D00000 0x200000>;
> > -                               };
> > -                       spare2@0F00000 {
> > -                               label = "spare2";
> > -                               reg = <0x0F00000 0x200000>;
> > -                               };
> > -                       spare3@1100000 {
> > -                               label = "spare3";
> > -                               reg = <0x1100000 0x200000>;
> > -                               };
> > -                       spare4@1300000 {
> > -                               label = "spare4";
> > -                               reg = <0x1300000 0x0>;
> > +                       rwfs@1e00000 {
> > +                               label = "rwfs";
> > +                               reg = <0x1e00000 0x200000>;
> >                         };
> >                 };
> >         };
> > --
> > 2.30.0.478.g8a0d178c01-goog
> >
