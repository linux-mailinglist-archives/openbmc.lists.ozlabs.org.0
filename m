Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C22317A6
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 04:27:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGcrd34qRzDqy1
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 12:27:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gj9t+Tcb; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGcqm0scMzDqxc
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 12:26:42 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id m200so7562488ybf.10
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 19:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LABhCkWC0/D2d56CeOjpEfxF2te9J9ckum0bfOr3p5I=;
 b=gj9t+TcbVBH+QAJfJrgcGhmo7/gnSVlhCrKXx806jI8n8YOuCTe0/EWy5DBDWdkgCl
 7fBoAHoR0zNVeQlf98K1KHAC5jOalwICcIHd/e9mPl8TGeJj43pGqsweIHTiV8yYhP+Z
 aG1xKcZedtr1VLFsqC8qOW5FvjenKfpb6slxHRlLeeRXuujvX+peMlE8LA7t9lvXEtFD
 otnBD9ndYb3gmEJMoE49ZQE0Vttl0Qp3Pgblc9JU5G366vQHw+6pN9RQM2mi4YHuUpV0
 s3uOyEbfta/p7tYpI2sK9YWarrz7+fa/oLAAvG9/6UErvjkMyVUdsFNWcyILd3kwVlMJ
 ZVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LABhCkWC0/D2d56CeOjpEfxF2te9J9ckum0bfOr3p5I=;
 b=VlZQrXbHgoLDYF2XexGAcG0+99DdqXsZJ9QGjSy6eP5SO1zCAqxFrfveg7bkspBY8x
 5Ic6nTjTbJRtolSyUpx2I4hYnFhbJq2UVGQpd9E0k7vhpANDbyNJYf1y10a8nYbhoTid
 1dEpcZv8U0FhMhi4swUavU8dhEkMKoVJ7u6lKjTUHzN58KCT95gM2P3qKt0WyTC4ctRb
 Uwvu35q4QtMZP4Cgs4oE5qCTRmkwpJMQ6+HCSVXw0s38LC0JiOPlkf1pMETQe5LjU7yi
 On8o+hTFjWoIMcIIDzzfh6gaTrMSLDiWmirFUhmNSTTlwA5U5kZwpns50Udk+QAJpfuC
 N62w==
X-Gm-Message-State: AOAM5318B7Vp40wQYyVYhG9m6KHoY71NYIu69V1+BiELzqyNsA/59QIw
 N/N/UkjHzhjHvSpd/cgDU5Ese1ybTukWu0H7lKAGsA==
X-Google-Smtp-Source: ABdhPJzmdgnuK4Wy0QitUToxm21LPIoEVqaXXSJXvm8s4UW9ryJzzswb+xb8kny6hNvNjzx4TvIOgqrMBuCCbnD2kBs=
X-Received: by 2002:a25:a162:: with SMTP id z89mr49832843ybh.449.1595989599295; 
 Tue, 28 Jul 2020 19:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB3153FFBD73CC1A4F35D88886A7730@HK0PR04MB3153.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB3153FFBD73CC1A4F35D88886A7730@HK0PR04MB3153.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 28 Jul 2020 19:26:29 -0700
Message-ID: <CACWQX82P0wr22kJ2fw6WDZz9zEELzPWJqOaRu1wP-E2B81dD=w@mail.gmail.com>
Subject: Re: x86-power-control - slot AC cycle
To: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
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
Cc: Jason Bills <jason.m.bills@intel.com>,
 Kuiying Wang <kuiying.wang@intel.com>, James Feist <james.feist@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "P. Priyatharshan" <PriyatharshanP@hcl.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Kumar Thangavel <thangavel.k@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 28, 2020 at 10:11 AM Velumani T-ERS,HCLTech
<velumanit@hcl.com> wrote:
>
>
> We are using a x86-power-control for host power control in a multi host s=
ystem. We have the host as FRU and it can be plugged in to a slot. The slot=
 has an option to control slot power and this can be used for a AC cycle.
>
> We propose to add the slot power control in the x86-power-control, The sl=
ot power control can be configured in json and the same can be implemented =
reading the json config. We can ensure the existing functionality remains u=
nchnged and does not affect the other platforms.
>
>
>
> The config file can have a gpio entry with the new key =E2=80=9CSlot_Powe=
r=E2=80=9D. Only if this entry is present then the slot power will be handl=
ed, Otherwise the existing functionality remains the same. Please provide y=
our comments/suggestions for this proposed approach.

One amendment, if you're setting this up for a single chassis type,
please make this a compile time structure rather than a config file
read from disk.  It's much easier to manage in the long run, as it
pushes runtime errors to compile time, and means that we're less
likely to break it.  Also, it sends a clear message that we shouldn't
be changing the configuration at runtime.

If you're using something like entity-manager, and you do want to
support more than one chassis, you probably want to define some kind
of "backplane" entity that owns the power configuration, so you can
have multiple slot definitions configured at runtime in the same
build, which might not be a problem for your system, but can be a
problem for systems with multiple Chassis options.

Ideally you would also add a new "node" slot definition type, similar
to how we define M.2 slots and PCIe slots to make debugging easier.


>
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and in=
tended for the named recipient(s) only. E-mail transmission is not guarante=
ed to be secure or error-free as information could be intercepted, corrupte=
d, lost, destroyed, arrive late or incomplete, or may contain viruses in tr=
ansmission. The e mail and its contents (with or without referred errors) s=
hall therefore not attach any liability on the originator or HCL or its aff=
iliates. Views or opinions, if any, presented in this email are solely thos=
e of the author and may not necessarily reflect the views or opinions of HC=
L or its affiliates. Any form of reproduction, dissemination, copying, disc=
losure, modification, distribution and / or publication of this message wit=
hout the prior written consent of authorized representative of HCL is stric=
tly prohibited. If you have received this email in error please delete it a=
nd notify the sender immediately. Before opening any email and/or attachmen=
ts, please check them for viruses and other defects.


Sending "this email is confidential" to a public mailing list makes me
think i got it in error.  I'm also not a "named recipient". You might
want to consider removing it in the future, unless you really
considered this to be confidential.
