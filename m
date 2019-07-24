Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852C72F46
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:55:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45twLJ1kVXzDqMv
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 22:55:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="slQO3wQF"; 
 dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45twKP5w72zDqK9
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 22:54:30 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id s184so34910714oie.9
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NrmZ2zb1VU29nDPfbQVvVVW2pPjY329BKgB1QG7Jyy0=;
 b=slQO3wQFYGEEVmWkVx+azSIO0YtFU2OOcPEiRuG14FR01nLAf++mwhGgUo82gG+3Ui
 1aNtd/fUWgCX0wbT8iWlYD++jM5/M6qETE1h99sabnUqLF5QTuX0wGeAs+Tq1A3V4/8R
 6HHUjqd78mR5r71ixgU7laKIob8ssgYyoIOMJZMmryKfPoxZAR5PPi7RfyXVel0jC3sM
 O+4MFu3ljPuE6vcRrxKHfBM8k21FGhYJ3FXHTonZrdFbyiJGFyQAS/RGEG+0m8rGj1mr
 1lALopq/T+dnI7jKQkHk4ZL2CzCGPtxMbsysRtuaCBb3wDW1jjANRK7m4PRRKo87c9Ox
 pk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NrmZ2zb1VU29nDPfbQVvVVW2pPjY329BKgB1QG7Jyy0=;
 b=JR9CqZvlvrabnjj+M2fcJq3wW8uhZg4sU3UoQxUrorCl3BBEYQrasYdTTGpdGUu30z
 VjMYqBo5xSO+Qb4kAtXPYhFD/3VTmHWhJeOu7WRWyggPLOJWE1z0j1uHsPwdzEI196PW
 jGFdo5oLfWlE0EP7Bt7GgPoNkHqx8zk6A8fASaYAqIgKmswKvsNBLP8AbxPDXYyYxJGz
 uP+4KNS9hA5R8E3aGc4ryuQH2J6QEssCHhI+NnSrvW95dShHfhWpb5G241F01GTsj+5F
 z5brSR9GQBQ1BmGkybM78fVK5gcuQuFSPsLg3g6c55Mmdx2lkOhExZHaY054gZKmCoOT
 gjsg==
X-Gm-Message-State: APjAAAWSKyMgzswSQaxqUVNSv0ELOJC6vWY8Mxxx1G1kIcE9neDE4Hb0
 7+BiCXW4h+pN+nfDCSJc281vdJ+4eKD3v++/rHSeBWXD
X-Google-Smtp-Source: APXvYqzYMSaT0rU8bMXjdQ4v9EtCVJBDsfR0AZ8jhJQ5vviD2ND4UubeShyPIxTmkVrimUba59P42cwqUCGKHugAOFg=
X-Received: by 2002:aca:f552:: with SMTP id t79mr35936839oih.145.1563972866802; 
 Wed, 24 Jul 2019 05:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwuD2FJ2w1P2v29U1f98T6_D=rbPrmoW3_DD157PciWSw@mail.gmail.com>
In-Reply-To: <CAO=notwuD2FJ2w1P2v29U1f98T6_D=rbPrmoW3_DD157PciWSw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 24 Jul 2019 07:54:10 -0500
Message-ID: <CALLMt=q2gt9GC8hOPkf6_O8vL69km-E+PFmoFLxXmoaRApw2bA@mail.gmail.com>
Subject: Re: gerrit not syncing to github
To: Patrick Venture <venture@google.com>
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

On Tue, Jul 23, 2019 at 11:20 PM Patrick Venture <venture@google.com> wrote:
>
> I wanted to reach out and see if anyone else has experienced this,
> openbmc/phosphor-ipmi-flash stopped syncing from gerrit.  I know
> gerrit was recently updated, so I'm curious if this is a problem only
> experienced in this one repo or something in general?

That github outage a few days ago impacted gerrits ability to
replicate, even once the github issue was resolved. I restarted
gerrit yesterday afternoon and everything seemed to synch over ok.
I took a quick look at gerrit and github for phosphor-ipmi-flash and
all looks good now to me.

Andrew

>
> Patrick
