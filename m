Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 907E0354391
	for <lists+openbmc@lfdr.de>; Mon,  5 Apr 2021 17:48:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDZnv44H7z303S
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 01:48:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=OveSRoab;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12f;
 helo=mail-il1-x12f.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=OveSRoab; dkim-atps=neutral
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDZnh04lWz2yjY
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 01:48:37 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id 6so819929ilt.9
 for <openbmc@lists.ozlabs.org>; Mon, 05 Apr 2021 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0VnzT4im2CcuK/myUzvJY7fU2v7oyD9nGuEqBJxgbDc=;
 b=OveSRoabD9ACvHpPDrvPgTW2L+J9nScaugsRW444eirpW5EmCutfoL5FcG5DaJfVxI
 vjynI4Ixmuq9TklFpxfOAUeXfst+38JK8yPmPZU5ii4Era2zrV4SA1oWBaaJbDTPKfC/
 OtiApEqQODHENdDyg1Xs/d77xwY9CwJr74XX7HTxvQNC10sB7f7BNKNnyR8ca1VnBUEG
 dfazIMBXRQRdvaCcv0jJVBidIJatsznkCGgnnNxU7rC2zbo6P6bBkqVEUEhkj39BcoNa
 ECza0qBGAqhACg8pmtVLqZu62um9QyStEdjyId6OCF5IoJOLq9pr2EC9ryDblKgBofJE
 7QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0VnzT4im2CcuK/myUzvJY7fU2v7oyD9nGuEqBJxgbDc=;
 b=qg8DFkSYatfWqBJG2qfBfHV4uX88NsFnwucnYaqO7XwFowHvUr50H+2+VE3GrHDy86
 Ft84u8K083nbo8cAB06Szdq2gAl/EDqCjPaqG4TIiRhTMFjCNNJVo28fGWOlwj4lqF9D
 X6VEC17Z4OraANHTunxAxKnF6hZEnjTyay5pAUyKRtdAEeoT+qpm9qGKRl/Ku+wNAnyI
 H9jj3LGt3e63s/amuDEQKoueJaW21+dKeaiL7P7zI/N9Vqi2AvgHbg70BMR3zEmnhv6I
 bHrA969ofkV2F4looh1I6EQwd0hr1qTivI2fqMwlTgQX6HXU25xt3SUZBkkj+OaY7l6i
 rLJw==
X-Gm-Message-State: AOAM530rdIeMNohjzkcW2lgn6wk2Rg9TFbwnWM/rtEsRZTD296m6Gmqn
 x+YwIADMtYqH2MB1IgMZQDAlZ4nLQGnjfuZiRI//RX5YjCqaAg==
X-Google-Smtp-Source: ABdhPJzIkxZVpipwGL3UkHIquM34RL1S7kt5HKhGZvkhJj1QE2oONSBxorUjWPRm+VClhakX2dh0hzpA/Xgla5tQ45Q=
X-Received: by 2002:a92:730a:: with SMTP id o10mr20297831ilc.160.1617637713906; 
 Mon, 05 Apr 2021 08:48:33 -0700 (PDT)
MIME-Version: 1.0
From: Anton Kachalov <rnouse@google.com>
Date: Mon, 5 Apr 2021 17:48:23 +0200
Message-ID: <CADVsX8-pPS6F22WUt_6NRk1raSQ6pr0M6vZfz0SKCH0zvwoU2g@mail.gmail.com>
Subject: OS-level privilege separation work
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Follow-up after last week's Security Working group meeting.

The idea is that changes' reviews might be slowed down because the
changes don't have instant impact and can not be tested "here and
now".

A while ago there was a discussion in Discord:

https://discord.com/channels/775381525260664832/775694761775464468/803832183260184576

> Brad Bishop:
> A couple reasons I had for putting the systemd units and udev rules in the application repositories were:
> 1 - I looked at a couple other ubiquitous projects and that is what they were doing
> 2 - putting them in bitbake makes it easy for everyone to do one-off hacks in their specific machine layer, so was trying to discourage that a bit.

That encourages to move systemd unit files & other configs (e.g.
busconfig ACLs) into individual repos whenever possible.

We have to modify individual repos three times:
1. Refactor openbmc meta & individual repo to move configs as per
above suggestion.
2. Change service one by one to run services as non-root that implies
intermediate busconfig ACLs change to include both: root and non-root
ACLs.
3. Once we have all applicable services run as non-root, drop
root-related ACLs from the configs.

First step affects both openbmc meta and individual repo. The change
will be complex because of refactoring and introducing new features at
the same time. Changes to individual repo, once merged, will block
other changes for this repo until openbmc's meta-related change is
merged due to incompatibility between individual repo head and current
openbmc meta.

To reduce complexity and speedup review process for the busconfig ACLs
introduction I would like to suggest to proceed with one bigger change
to openbmc meta that doesn't refactor how configs are being supplied,
keeping the changes to several services in top-level meta simple &
similar, easy to review. This approach also will have instant impact:
once merged we will have enforced ACLs for D-Bus.

Roughly the change will looks like this (it's a bit outdated):

   https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/37844

The final change would exclude refactoring for systemd to make changes
scoped & simplified. I've checked those changes on a number of targets
that can be run under QEMU.

Beforehand we have to review the following changes:

 - certificate-manager:
   https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41430
   https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-certificate-manager/+/41166/
   https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/41429

 - phosphor-logging:
   https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/41835
   https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41834

 - phosphor-hwmon:
   https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/40277
   https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/40214
   https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40359

To move towards OS-level privilege separation we need to review this
blocking changes:

   https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/36965
   https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41432
   https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41471
