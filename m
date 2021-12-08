Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224046DBC2
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 20:01:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8RNh6Npmz3bYD
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 06:01:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YLb5QJ2k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::929;
 helo=mail-ua1-x929.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=YLb5QJ2k; dkim-atps=neutral
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8RNG1KBqz2yZx
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 06:01:31 +1100 (AEDT)
Received: by mail-ua1-x929.google.com with SMTP id p37so6455088uae.8
 for <openbmc@lists.ozlabs.org>; Wed, 08 Dec 2021 11:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=B85WHsGNUyxlIniBajf7245gvVg6FfXco3AFJvtYzPE=;
 b=YLb5QJ2kPicOfle4DFLOAXmM7aXdJMe5aqveU3HL9omG+YGRjCUrbv6UxBEF2moFxV
 kMwKfcWfaqdIdxERA0d65dESTdUSxkWsY3N5NShvx9IBtcMatTMJ8AwPz6Em2gkRf4NH
 bC0SFIW+sMOPeSH+mXfX3Jjdf3Sj39Hsgki/Wt8N+4bVonzXN26Af4oT05bOBzu1NEZi
 Wg2yfpvhJy+qkyK/U2uyUK+bHKcYHRvqx63Mgthj3KGK/KsRRGH60ZUX12LCvz5BOtaU
 HqiBZJwUkKpWg14YPs5bUOmVv6KyB7BgMXWclCXd5y9cVG03C2mPfHJ5jXyKddZZcqSS
 tIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=B85WHsGNUyxlIniBajf7245gvVg6FfXco3AFJvtYzPE=;
 b=fo8qigMBFIK/B5VyltbIQdhPjNRtgide757j6AynVKF1yJRNzAx2ejSTCjyDSxg4W9
 xJdh8DJivZgiXjZvnoDzOwg3iZ3dMxiVj4F1IeRRTXKZphLjANl8/NMdT+Pqtu5M2bR1
 QBnBms4aINoOFfs9KHji4J3YH+X/OsdhbZxc+GzJFj9u4CRpx3BoOeKOwK82ujjEF/CQ
 xH1Vn4Ei3XK0B27IScPllWVyLyiXn+0kY4YGqK7S5lNsKDIQWsLILyWXfWQqSFg7j9DY
 g0uSaS2SAjLydmfxvNqziTIr+lsUuB/mzrQoGogAXznPwMinu6Id1KNxHLRw15zKdi58
 ECyA==
X-Gm-Message-State: AOAM5330ecwKZecKv83X3+TeiEcihoVL59F4pm+uxZFIjJvByP6i1IRL
 cBpgvYtYZZrm693WUgXIyE6ZOgbHS4UIL+2Aq4m/FmLhzk0=
X-Google-Smtp-Source: ABdhPJy98dIU/E/NmwQTU9DD519tLOZ4GH8ao8Yar56+UvMsyJPeINbIZQPD5hHZFJl6KT8B2nd/Pm+1z58C3TSroZY=
X-Received: by 2002:a67:fa12:: with SMTP id i18mr628616vsq.49.1638990087402;
 Wed, 08 Dec 2021 11:01:27 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 8 Dec 2021 11:01:15 -0800
Message-ID: <CAO=notyNtux_jNWFsrYex_vkKxt_JEE=ATU-RrL=o7vmsEdEBA@mail.gmail.com>
Subject: i3c on Qemu
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000f3918905d2a71d68"
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
Cc: Hao Wu <wuhaotsh@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f3918905d2a71d68
Content-Type: text/plain; charset="UTF-8"

Hi all;

With ast2600 and the nuvoton 8xx, we're seeing the introduction of i3c and
I was curious if anyone on this list was already working on it for Aspeed
or Qemu in general.

Patrick

--000000000000f3918905d2a71d68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all;<div><br></div><div>With ast2600 and the nuvoton 8x=
x, we&#39;re seeing the introduction of i3c and I was curious if anyone on =
this list was already working on it for Aspeed or Qemu in general.</div><di=
v><br></div><div>Patrick</div></div>

--000000000000f3918905d2a71d68--
