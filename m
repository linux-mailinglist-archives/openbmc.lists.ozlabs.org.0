Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6B114AE31
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 03:38:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4869lf6PXdzDqGM
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 13:38:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=emilyshaffer@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BJt9Jxoh; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4869kh06PpzDqFG
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 13:37:28 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id w15so10195516qkf.6
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 18:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Rcq/tfVUuce/2Je3OiaDcbl6iKhNM7oF1CmSaXk2awQ=;
 b=BJt9Jxohjgu2ncy5yFkTX4rAjql3Ic73EEdzkkBOuS6JGJKDSqLzKF3dX4lRRN+QWa
 UIgV7xwabmRIt1bZ84rGKXjZfkpAlgxqAZBH0fDUMkjhL5dUNKA/+6ikfSjaJMH+qBKx
 8PS/dJiTcKiARlqenyiqMJ/j8Jbr3ZgianrhWZlJESeBbkdWoxcGbaTGMH3CZ7zr6KyE
 2sdQuuSh+0/icD7ouzdPv74rIN46XdJBaddkll1RKHpYfWK0FR9PfVqCdzyAL38XRX5c
 L1EDXS6uzS6u42y5YfJfHemB7pc6Ff2BoE9VE5ZyP816ULMg7haEvXswJRbrRRj+Bl4q
 q5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Rcq/tfVUuce/2Je3OiaDcbl6iKhNM7oF1CmSaXk2awQ=;
 b=erzoaC/szsgVyF+K9a2jF8v4ZHshNH+JABqpSVMQ4NQZIqn1jo4arpq4sVfbsF11Eb
 +/lL7vHd3wlV6QihW5FN13ye5PO0LCFlUgTH+VRIeZkU1sc4La1tmX+6ge+lal9l6Q2y
 9snnchK8Lslx/Zf7bH/AtcNwTu40q9QjYDULgC7XfECEnBQy7TyV3mxWK4uiZdMg3jSJ
 +J4Ap2qjrFsiteZhAm1MHci/j+RdZru3q4La3GSnaqqpZHFbVWfH/RMLchjH44b3bs53
 QMTF9as/EUjykw9ZW8yrenvwciRh5ow6BmR0M1ay2FHheSoRMUY9t3oWrt4rqZHGAoWw
 qCsA==
X-Gm-Message-State: APjAAAVHx1FeH70ikENwN//sA34asfzQDFOgqVOnaYgVWpb3wer/Po3H
 SdSOPo5Yg2vMvnSlac0qHjh8mHmcQpSfHSMr0q8f/1Hx
X-Google-Smtp-Source: APXvYqz/zt/RYw6Pp0+7ZCH8FotdraAK0c0Za+oM7qqjUBtdBEKzyUQjJN632N+zUxe5g9Hng5ROOqCt1AUxhPjd95s=
X-Received: by 2002:a37:2e47:: with SMTP id u68mr19583475qkh.485.1580179044691; 
 Mon, 27 Jan 2020 18:37:24 -0800 (PST)
MIME-Version: 1.0
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 27 Jan 2020 18:37:13 -0800
Message-ID: <CAJoAoZm41PYLana6j99ZvBgzkB+T-Ww4_gJC24=esecA48HV3Q@mail.gmail.com>
Subject: Farewell & Best Wishes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a47492059d2a1a75"
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

--000000000000a47492059d2a1a75
Content-Type: text/plain; charset="UTF-8"

All,

While I've very much enjoyed my time working with this community, it's time
for me to step down as comaintainer on the various IPMI projects. I'll be
fully devoting my time to hacking Git, these days. :)

Sometime this week I'll be sending changes to remove me from the
appropriate MAINTAINERS files. If there is something that you still need
from me - a review, an opinion, whatever - please let me know and I can
take care of it. I'll continue to peek into my review queue this week and
next week; after that, I won't be gone forever, but I won't be able to
grant approvals on Gerrit.

I expect I'll still be reachable all the usual ways - this email, Freenode,
LinkedIn, whatever - I won't be disappearing or changing employers, just
focusing my time elsewhere.

Thank you all very much for the extraordinary learning experience I've had
working with this project and incredible group of people. I wish everyone
success in the future and look forward to OpenBMC as the norm in
datacenters and home workstations.

Yours,
Emily

--000000000000a47492059d2a1a75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All,<div><br></div><div>While I&#39;ve very much enjoyed m=
y time working with this community, it&#39;s time for me to step down as co=
maintainer on the various IPMI projects. I&#39;ll be fully devoting my time=
 to hacking Git, these days. :)<br><br>Sometime this week I&#39;ll be sendi=
ng changes to remove me from the appropriate MAINTAINERS files. If there is=
 something that you still need from me - a review, an opinion, whatever - p=
lease let me know and I can take care of it. I&#39;ll continue to peek into=
 my review queue this week and next week; after that, I won&#39;t be gone f=
orever, but I won&#39;t be able to grant approvals on Gerrit.</div><div><br=
></div><div>I expect I&#39;ll still be reachable all the usual ways - this =
email, Freenode, LinkedIn, whatever - I won&#39;t be disappearing or changi=
ng employers, just focusing my time elsewhere.</div><div><br></div><div>Tha=
nk you all very much for the extraordinary learning experience I&#39;ve had=
 working with this project and incredible group of people. I wish everyone =
success in the future and look forward to OpenBMC as the norm in datacenter=
s and home workstations.</div><div><br></div><div>Yours,<br clear=3D"all"><=
div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature">Emily</div></div></div></div>

--000000000000a47492059d2a1a75--
