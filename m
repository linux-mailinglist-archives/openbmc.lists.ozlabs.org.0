Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827833D1101
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 16:17:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVHj61zRBz3bNr
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 00:17:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=TCG+rAiO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TCG+rAiO; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVHhr4CTHz2yRT
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 00:17:14 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id l7so2377493wrv.7
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=syG5zAZQlFHU3ezPvPm138s/Pjs0050NC54oU3uUdCU=;
 b=TCG+rAiOykMzvhHHScnzmVwf6uLbOTA7xdCJR3epZfUNf8ypjTp+JE3R7wiJYF3/19
 E/iHzj8O2B1Lo63hFMBfES7gawNbPT6/ztfExB9bNUKJfYSRgq2oH0bGBy7HVpizHgBc
 HsRPSdTr+cgVFcjqjsDyTnrQMSSLEOtsfs6oSMXfL8y9zFjOf6K+O95dCZAGk26HOLQM
 oSrt+qtvy5YXs/Mb1lOgGp9SSqONsZVka2a/1iv13/fkHY6oDJKb/OmRv1vWlwbob+EM
 7YFNxPLnH7524TRg6PIHAjJYoUoK7aNw9L80/VXuqa6psZtz9Cagr2PKWxf6WylTfs6X
 Rizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=syG5zAZQlFHU3ezPvPm138s/Pjs0050NC54oU3uUdCU=;
 b=Qu2KfsyNHn0mnY70gRIJM9tEVtEuUUU6mr/EzMcEvNCNr+yb0VaRKWp/HEyVZnImvO
 OB30nzHZclcI6Em45ex3cqN2YOeIpEthmH2x6TEvmskQqGh15opGCj+UWQ27uwQ+AiL/
 pNWJD5WryNlyi46UtCEOrGBvtbeJfHXCxh2o17bjvB8N6CZurwL8/4+q20OISL0qB23o
 6NB8rz/CoBgc81F00cbMMMz9HXkhh9bkg06g2YylkLZ7b2TLKU7tn1jLIZ004ifF/xq4
 iLL/CIAfej8veyDw3WrMoljSEH1Roca3PvVqHDW4miMNSN2vTP1oLrt8OtiWIMk6cqzr
 ZSNQ==
X-Gm-Message-State: AOAM5309/PeKslcAXYKR8cAIXgxhs/QFRyJQWRzkE4JFqjmOIDcEzmwb
 QsXlY978pIKBtSxDjmeHyUUj86h7GxiY2uhdC1bW/g==
X-Google-Smtp-Source: ABdhPJyeIhZNnV/vWOehZEFteEWJtNC5PZgwJE0duPla5B0bKOxekHn1H3HygwCGeYP4YiL3FOx1Bb/6r4HhPnZPvx4=
X-Received: by 2002:adf:e902:: with SMTP id f2mr42782352wrm.424.1626877028319; 
 Wed, 21 Jul 2021 07:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
 <DF4PR8401MB063429AA13146432E80B43DB8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <DF4PR8401MB063429AA13146432E80B43DB8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 21 Jul 2021 07:16:56 -0700
Message-ID: <CAH2-KxCRnJOaQ=7ry5Sg2B8E4UyePckA4=1Q+-eFP8htnVor5A@mail.gmail.com>
Subject: Re: RDE Enablement
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 10, 2021 at 1:59 PM Garrett, Mike (HPE Server Firmware)
<mike.garrett@hpe.com> wrote:
>
> Great!  We are interested in RDE becoming ubiquitous on adapter cards so =
that Redfish configuration of storage and networking doesn't have to includ=
e adapter specific code.  A good success metric would be the ability to cre=
ate a storage logical volume using nothing but standard Redfish operations.=
  In pursuit of this, a solid open source OpenBMC implementation seems like=
 a good way to put RDE on the right footing.
>
> My initial thoughts would be to build an RDE systemd service on top of th=
e existing pldmd service and have an upper interface into the standard dbus=
 interfaces for inventory, status, and configuration.

Way late here:

This is one part that I've wondered about quite a bit:  How do we keep
the existing PLDM things viable, without duplicating all of the
Redfish code between them?  What component owns the "source of truth"
for the Redfish tree?  In addition, how do we shuttle redfish-specific
data between the various applications that now need them?  Going
through dbus would imply that we either write a redfish specific
interface, kind of like we did for IPMI/IPMB, or we have 1:1 with dbus
interfaces to redfish interface, which seems unlikely.

>  However, I suspect there's some additional dbus work needed to join RDE =
to bmcweb because there will be a need to dynamically change the Redfish mo=
del and support things like Actions.

Yep, this would likely involve some changes to make the router
modifiable at runtime to add and remove the appropriate routes as
devices are detected.


>  A requirement for this to work would be the ability to discover PLDM dev=
ices and assign IDs (MCTP EID) in order to interrogate them for RDE capabil=
ities.  It is unclear to me that the current PLDM and MCTP code handles dis=
covery or if it assumes devices.
>
> Happy to hear from folks about the best way to get this started.
>
> Mike
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+mike.garrett=3Dhpe.com@lists.ozlabs.org> O=
n Behalf Of Ed Tanous
> Sent: Thursday, June 10, 2021 3:32 PM
> To: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: RDE Enablement
>
> On Thu, Jun 10, 2021 at 1:26 PM Garrett, Mike (HPE Server Firmware) <mike=
.garrett@hpe.com> wrote:
> >
> > Greetings,
> >
> > I'm am interested to know if there has been any organized discussion or=
 development on Redfish Device Enablement (RDE - DMTF DSP0218) for moving e=
ncoded Redfish data across PLDM/MCTP interfaces.  We are interested in prom=
oting this standard and are willing to lead a reference implementation for =
OpenBMC if there is not yet something in progress.  If there is something i=
n progress, can you point me at the work because I would love to see it.
>
> We are interested in this as well, although we are in the early stages of=
 looking into it.  Ideally we'd like to have OpenBMC support add in cards (=
NICs, Accelerators, ect) that supported this functionality, and make that d=
ata available to the normal OpenBMC channels (Redfish/ipmi/ect).
>
> >
> > What is the normal sequence for proposing, debating and finalizing majo=
r new features?
>
> The mailing list tends to be a good choice for the very early discussions=
.  https://github.com/openbmc/docs/blob/master/designs/design-template.md
> tends to be a more formal process if that's what you're looking for.
>
> >  Would I submit something in Gerrit for review (e.g. a markdown file fo=
r the docs/designs repo?)   We could probably get something started fairly =
soon.
> >
> > Thanks.
> >
> > Mike
