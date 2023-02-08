Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 814BB68E59E
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 02:53:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBNMQ2tYHz3bVJ
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 12:53:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Z+o+KJ87;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=jebr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Z+o+KJ87;
	dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBNLr16bYz2xl6
	for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2023 12:53:23 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id o5so17697598ljj.1
        for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2023 17:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mAkGP5/yRitrz50M8dWzW9h3ndAvG1UqqQ/otG6vpSo=;
        b=Z+o+KJ87X/K8OsiAIXC7dRhPgru12hx2GJoE58/lsunbzwhuFLvU3e29tvm8izKMay
         A1D3y5oLjVDHjkVTUib6hlBJ5iomM6a3eZ+uOl79fj3SNC6AXwQs5v3lS8enKyQM+gB1
         hz9PPTqRIDY+FXapL16TP9cjt1ugsLig15Xew//OZxythbc5NgM0o+yCmxLQdxraOPoM
         zsdBZ42cPBXRFxZ6j9tXsiYUnJzQ+sfB13uQ5RC1XS0NFoFs3f9bJyCvGh1C1fvKmh3D
         z3195aIyoqvIv8GsDB6rdV2kkqlOwXe2LTNhSIZJVINqYiLL8YXokx+pQV304CwxUVZ9
         LlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAkGP5/yRitrz50M8dWzW9h3ndAvG1UqqQ/otG6vpSo=;
        b=WfpH9MKjbbWarQGbMsdGnrUmjIKq3ZfmltjkNxtke3dkXCkMWCXxEKD/7/n20ktMUf
         BSHanrHSlsBLlaVytvwkRqlHxTDz5Pc7X3z9+MJsubSpvp8+0mDWh59SAMfm1neqvvSt
         gs2SAtOsnklxjFD/AbX6Dd7+xBBLRASQnfL8s0d5Skp17eRW4fpcyFnR8ZrXSkynGKvV
         wzol5h3KPorK5lH1Q/dL8kfcoY6pSr/d68Ex4JFlj8fzwxOSHZKvNlEO/l2UsPSFnePA
         cAyorAj57ebvyWbuLK0tXOFv/0fpnw7AauuVel/PTT3t8oVqTjy+nxSR3ELfz4Rx4T4x
         JHNg==
X-Gm-Message-State: AO0yUKWnXzAdMFKuVcQ0G+fv3z8jAT8XHKUwAZbRhh9qiwbvacik1Tjb
	4srEydX522BIId+jjQj5SwJTrphEjGqy1JH9Jv8yyVXfNbcKqn5mr/g=
X-Google-Smtp-Source: AK7set+cxk2CSBO7SdF6+f1z/qZiQ38iN6r9uAYRaF3eGdrUXR7gN7eaBs+pTMOIgc3jE2DlKegM3VT8JHvD2VFsjNw=
X-Received: by 2002:a05:651c:171c:b0:290:6278:7806 with SMTP id
 be28-20020a05651c171c00b0029062787806mr890318ljb.100.1675821195803; Tue, 07
 Feb 2023 17:53:15 -0800 (PST)
MIME-Version: 1.0
From: John Broadbent <jebr@google.com>
Date: Tue, 7 Feb 2023 17:53:03 -0800
Message-ID: <CAPw1Ef9GhcYJXdBs6pGPi5rjxs0+HE2ROV6HT1SVMEmknvVH=A@mail.gmail.com>
Subject: request for a repository
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000015d95805f42687ad"
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

--00000000000015d95805f42687ad
Content-Type: text/plain; charset="UTF-8"

Hello,

We would like a new repository where we can share our upstream daemon that
interfaces with our Root of Trust (rot). Ideally having a repository on
openbmc would be a nice place to keep our source of truth for this daemon.


Thank you
John Broadbent

--00000000000015d95805f42687ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>We would like a new repository w=
here we can share our upstream=C2=A0daemon that interfaces with our Root of=
 Trust (rot). Ideally having a repository=C2=A0on openbmc would be a nice p=
lace to keep our source of truth for this daemon.</div><div><br></div><div>=
<br></div><div>Thank you</div><div>John Broadbent</div><div><br></div><div>=
<br></div></div>

--00000000000015d95805f42687ad--
