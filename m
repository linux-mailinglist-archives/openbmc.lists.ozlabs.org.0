Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F6297997
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 01:24:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJ0ft09w2zDr2w
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 10:24:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=jAZy+U8F; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJ0dx3cqHzDr22
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 10:23:13 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id t9so2551518qtp.9
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 16:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=piaOHz6LhgYkRkGUsUQOxo2N1X2IQoWxBlUgySTyIfU=;
 b=jAZy+U8FVC7AbFV14mWxhdwUAVuXsGyvc9lCooDvUQ2XKanDHAzeL1Dbrxq5pOLUYW
 QiQSxh5V1VB1yn0Fv6wqdzCaFRtNU5QCFC3RqWUeG3jvaVtYR4ZyY+4CzSM8bioFFjku
 qd0HUVvLtTSn92yl3NB4PLWNjeVliD/BcKyz3NIhZXPoV6tYEmlXhBpEIG8JTvD9UCxG
 m8cVs+cWaa2CY0mYoxcbHEBty/fAuXdsL5wCT0erFNwlGKQFJ3pZULGCbaV7b2vEI7vT
 Y0sGNvgzWNLdxcIZD4r8f2rERMEcmB2A9SRHRaj+R8yrQ7m/Gbegb7if/7urjA1auqdH
 gJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=piaOHz6LhgYkRkGUsUQOxo2N1X2IQoWxBlUgySTyIfU=;
 b=PeYzDnLRR8m8JndD2/3+zeqnK4XN/cxsmVSudvyhRH0LpG/+rHRBeycrjt5++EqPUl
 6HivIgqryyJm9rEcDLd5Oj4elt/Wy1o3219aZ9V0MGaBCB4UiyVEN4mjSjztLJdhS1ym
 q7TUExMuWb0ZjX91TUszPb5Sec0rw+4dKWO/4f8Eb8jV1ank9Fo85YoJvdrnbzHmW8CF
 FJG5+zpr6L1N1nuBg77+gy1vZtEZyUDB7/Vyb7wKMvctPrA8keKbcMIscvJShWKg0Mu2
 OgzqDSdQ9/x/zM4Upk0JJVDjv9XqDczBZX9y8mgyUFwebg9KvHUH4vk2lr9XKXSapIno
 twPg==
X-Gm-Message-State: AOAM533P8wLjsr0vZ1NJQbPO3O5wxubR2P+X3oQkqMwVSgiUmD8mY/j5
 eDA5jAbCZRuRG9EiZUjhlwr/eJS8gFJiqs43PEK82X9/aMXqoA==
X-Google-Smtp-Source: ABdhPJw3jKRSyeu/6eIjxMrTkzatcer2JGhZajl2ptxI2yST4djDoJCbagPQqaO/SBjlRVme+SfTeR6npLYLsR40Now=
X-Received: by 2002:aed:2d62:: with SMTP id h89mr4890853qtd.108.1603495389108; 
 Fri, 23 Oct 2020 16:23:09 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 23 Oct 2020 16:22:58 -0700
Message-ID: <CAO=notx2=coTNs25BX1GjL-LV0fZyS8-+5D0FLpi8td2=G1jsw@mail.gmail.com>
Subject: failures in docker CI with libipmi
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jason Ling <jasonling@google.com>
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

Is anyone digging into the CI failures associated with:

mv: cannot stat 'libipmi20.so.0.0.0U': No such file or directory

My instinct is that it's related to building on pcc:
"Building remotely on builder4 (docker-ci docker-ppc64le
docker-builder docker-ci-ppc64le) in workspace
/home/jenkins-op/workspace/ci-repository"

Since I don't see these errors building the CI on my desktop (x86_64).

Patrick
