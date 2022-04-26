Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB3D50F271
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 09:30:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnYT24Z4pz2yXM
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 17:30:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UEBPau26;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=shakeebbk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UEBPau26; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnYSg5Zftz2xBV
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 17:30:27 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id a21so9011664edb.1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 00:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=3Hi2HvuxaxoIsc4W0Cl3ieeV0L5X4ZstnZdOYkbx/qg=;
 b=UEBPau26lZYNaLeAQMwxeP1yKvN2AItpF5yBxandSKncbBmml6XcTdZpgmlB7eLB34
 tLZa9vxL/HT8UKmhHldK723ZC6yQtXru4Wtj4UOFTOWdcj1fiAtXUj9UiUns+q4fAwX7
 xTSRMh7KxIu0wDxghD+IrwOoydvUbctNteCh7gFtIF5e+wh4K96Y0WDYYVBeTQn2yoOd
 D7erXmMxbfnHiHt8kWvWZjIjuBwN6udetuQjLbD37wdZ+gOif+wJThDEAfugMXmcuhqy
 OKeYg0PSHxg7Li/6kFnwxlG4vGcuf+oZ3SgZoyqSqWNuYreXbo9nFZwHw4KuxzD3y7vp
 SFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=3Hi2HvuxaxoIsc4W0Cl3ieeV0L5X4ZstnZdOYkbx/qg=;
 b=MwE61NOvwaLJmHyqc64ioukO7+tN2p4LMSwGsR+hbPEsHa7GB9ZzhZX5eX0eCvS9po
 sUK5TB30on6J+shbpIg37Xe9q3m+wNY2aaucjXytmniTtVW1t1Q00orKrTaw2T+jViYd
 o02rwIrp7mGFTNcq66rnURdB+V/DanRb2D3K+Tn2SEzMBTTwnguchNhBF92pxr0FUgmJ
 tvI56LMegDs3Q4A1tYyGEgzPr+zz0sKMsQeUT5+vjXEi/iai3Hh7zWkRzcaKzK7U6lT1
 wkf8JOmvvH9lzJCQxPSbPAPVV/AHwoWrf6TsCeoqXT3o+0QsjNpIXQvuSDup9/MBwzp6
 2zXA==
X-Gm-Message-State: AOAM532cMadJm21pFz59gXol66uKSSivdIn7GVUIHFTPibFbYMR1Buve
 B4k6W9fii+1KuMFCyK67AO+PD9/Yp/Syz0/DOAgGHFKS
X-Google-Smtp-Source: ABdhPJyCE8ma8iHjvuPSARTJBxZsIz1SMaJnKYAq00r2stquaqU6HpMIrsfbdjZmAJeSMN1y6lqllGDyAx3zTjDGbDc=
X-Received: by 2002:a05:6402:54:b0:419:9b58:e305 with SMTP id
 f20-20020a056402005400b004199b58e305mr22849987edu.158.1650958222961; Tue, 26
 Apr 2022 00:30:22 -0700 (PDT)
MIME-Version: 1.0
From: Shakeeb B K <shakeebbk@gmail.com>
Date: Tue, 26 Apr 2022 13:00:10 +0530
Message-ID: <CABYu0WiSgkoxSgnUBphPdXCjOLjdJwMaU9oDJzq6Qo26hRY2sw@mail.gmail.com>
Subject: Spurious interrupts and PCIE_PME
To: openbmc@lists.ozlabs.org
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
Cc: sushilkdubey@gmail.com, saiallforums@gmail.com,
 deepak.kodihalli.83@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello All,

We have a system with a pcie interface between BMC(ast2600) as RC and
an FPGA as EP.
And by design we use IntX legacy interrupt for signalling as part of
the communication protocol.

On OpenBMC, we have an user space application using vfio_pci drivers
for the device access
and we make use of vfio interrupts for the IntX.
We also notice that pcie_pme drivers are sharing the IntX line for pme
events as well.

In this case, we are hitting a peculiar use case where - if the user
space application terminates abruptly(e.g. SIGKILL),
without the cleanup - we leave the protocol in such a state that the
EP keeps sending IntX while the vfio handler is dead.
Now, since pcie_pme is also sharing the same interrupt line, it keeps
getting these spurious interrupts while nobody handles the interrupt.
These spurious interrupts eventually hog the pcie_pme handler and lead
to soft lock up and kernel panics.

Though we understand we could handle vfio device in a better and more
robust way,
we would like to learn from past experiences - if anybody has hit such
issues before?
What's been the experience with pcie_pme sharing IntX with any other
application?
Any inputs woud be greatly appreciated.

Thanks,
Shakeeb
