Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768033409A0
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 17:07:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1X3s3VCHz3br9
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 03:07:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=IwUk/hun;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=IwUk/hun; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1X3g1zhbz30D6
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 03:07:26 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id j18so6127893wra.2
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fR+Y8I46xLRPrzube9kumla6McE8HBprEn3FNm9Koco=;
 b=IwUk/hunagaxy2B77xfJ489OWcI8PkemFVAutcankPQkkitlB3ZV0opTGEzqw/+Ww7
 At7a2w6fsDsfZ8fElKT6xM3QiDdO67dIxSJmQz0rtCe7QzZVjQO+/IdXQMzWR0fyFewb
 NcVLg8rRwX6LCEpu9CkZ2J3hMJQ9l3TMmFL2DWA3jnviJQUAb2CI9OJUSU27iQVZDxUZ
 zXPd00NDqCEi4QXZc185oxbNqUxM0kdhd4e6SVOaEx+zJ7L7aKIKidxVdQEK+GjegynL
 UnDkgm0+XfFBAfaONAmTI4g3KL7hwzCSSOSNQyxqjSTr680MlLdpN+uqId7CUgnyR9Cm
 nsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fR+Y8I46xLRPrzube9kumla6McE8HBprEn3FNm9Koco=;
 b=KT67DIi5MgWFEvBCjTY3GaQx9yfKKOdBaN48fd8KuotIbsM6tRT4+UNJ9mlUwsM4nG
 Xam37slDnloXbMVHEepWCh/DtNr3laMVZUXrd1uxOj/3CfFwmi7/kP5bHTXZeMXCj9LD
 MMaCAukjhQxVwmAK6JZSD6WCuP1kQRHr4GI3DfMbrsXraoZNNaEmqbFMoaKgFwhu6H9D
 yA3hSjoL7sJIRi9jXCli6gEW5U0DRF7WejWxqn3HbGjLEAI1RhQLft7UCg9D2w/5Hf/a
 ntiN73WW+cfPYBrUfsHN/eSFBGHkieV31Q9HLtR0ygDKL7cl/ptNlxdLklNojby4aN0r
 cA+g==
X-Gm-Message-State: AOAM533nBJ4+vU8zx7U5/BakutwF30LePUfO3X9UiHrwo+OqavAktsic
 FKMn+KH9uM5zKP49GFwRau+yx6RuJLItHrqNIaxgOG8ivi2qLg==
X-Google-Smtp-Source: ABdhPJxv1x88WFGCIAWBf7OivoiR9V/MKLyzGsExQ8P3hbNzV9P1APiSeJpq2xyhE3lZBH4JScHniJZKnZoNT9zT7Cs=
X-Received: by 2002:a05:6000:178a:: with SMTP id
 e10mr6512wrg.424.1616083639309; 
 Thu, 18 Mar 2021 09:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
 <CAH2-KxCUYzjckT7xEAtcdV4Q_2h4B7GdAcXw_TTqBA6O76Q7Ng@mail.gmail.com>
 <1cd3b4fb-a729-52cf-e03e-1cb3b4a1bbf8@os.amperecomputing.com>
In-Reply-To: <1cd3b4fb-a729-52cf-e03e-1cb3b4a1bbf8@os.amperecomputing.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 18 Mar 2021 09:07:08 -0700
Message-ID: <CAH2-KxDv8jgFP8gRQgGkKruUk-scUOr5Mja6NkTgO4ODGGnmvA@mail.gmail.com>
Subject: Re: Where to collect information for Redfish System's Processors,
 Storage, Memory data
To: Thang Nguyen <thang@os.amperecomputing.com>
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

On Thu, Mar 18, 2021 at 1:26 AM Thang Nguyen
<thang@os.amperecomputing.com> wrote:
>
>
> On 18/03/2021 02:45, Ed Tanous wrote:
> > On Tue, Mar 16, 2021 at 3:22 AM Thang Nguyen
> > <thang@os.amperecomputing.com> wrote:
> >> Hi,
> >>
> >> I am looking for how to support Redfish System schema which information
> >> from Host:
> >>
> >> - Processors: redfish/v1/Systems/system/Processors
> >>
> >> - Storage: redfish/v1/Systems/system/Storage
> >>
> >> - Memory: redfish/v1/Systems/system/Memory
> >>
> >> I looked into the bmcweb repository at redfish-core/lib/memory.hpp and
> >> redfish-core/lib/pcie.hpp but just see doGet() function to read data
> >> from dbus to report via Redfish. There is no doPost() function to post
> >> codes to Redfish.
> > Today, there's no way to do this sort of Redfish POST/PATCH for normal
> > BIOS use cases.  I'm working on a design doc for how to add this (via
> > redfish host interface) to bmcweb.  If you have any ideas here for how
> > this should work, or requirements for what you're trying to do,
> > please, share.
>
> I checked on the Redfish Schema Supplement document and saw attributes
> from the Memory, Pcie, ... schema are read-only. It means no POST/PATCH
> action is supported now.
>
> How's about suggesting on supporting POST/PATCH action with the needed
> information change to read-write? UEFI will then collect data and send
> Redfish commands via the Redfish Host Interface.


That's effectively what I'm hoping to propose.  ar ethe Memory and
PCIe schemas the only things you need?

>
> >
> >> My questions are:
> >>
> >> 1. How can Host BIOS collect information and send to BMC so that BMC can
> >> report via Redfish? via in-band Redfish?
> >>
> >> 2. If the information is not from BIOS, how can BMC collect information?
> >> What recipes/repositories are used to collect information?
> >>
> >>
> >> Thanks,
> >>
> >> Thang Q. Nguyen -
> >>
