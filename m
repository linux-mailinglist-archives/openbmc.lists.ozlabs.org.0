Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C2369C7C
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 00:23:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRpj46XcVz301s
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 08:23:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=BlED9KAD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BlED9KAD; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRphr0zgdz2xMw
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 08:23:21 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id p202so13713152ybg.8
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 15:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=OVTI0NPd2n9VJENoPUi5VkDEe25hRggyzjGiMoqy26M=;
 b=BlED9KADVWwZVN9/HbuTg5VkWNDSGtGjLMDwEePY/BM0/PzotHmq+UAM1aJg5Xz1HW
 jumqoFh6iWsoRG2Jy8q34tsHauH0jSCfgb0gxNBDdBYWilXdrVLg4GA5n79I7K+tiNd3
 Dr18QV+ziWi3dxcNzg947yOSmFcokzH8cXTebYJvlA+8TBQBGUqcrZaN2XCn57xMoIfd
 OCDXRKoVBwdnjj/bsvOYEiERJvc7GxdaevJZo0K7eaULhOJa1LW3i2URk1++/8V/pOzw
 uAfWYW+uW6I/XfNBhHHAJP1bA1yhvX1NjhvjHdBxH5TrNSgWHFp0c8tHbuOC6QFgLhQt
 1QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OVTI0NPd2n9VJENoPUi5VkDEe25hRggyzjGiMoqy26M=;
 b=iQNX+qVKt1kzN4vlRjW2BCo7oL6QaIpqfwj68jPXhNpeS32PfIjh0PWjo/qK+WCRyS
 uVRiTkSYfkb+2f+nQ6H59o2DXtkcfD3gXwAsvqzqrFXXo0oswK/Z6qXGo1mWMthFPhuY
 kudQrO71d29dberj9/kE0g2EMBy0lHCLCbgVI3Y9yVLBBW/nszB2bp+XLVMa0/E305OQ
 2XXnmdNrpcSU9InqNTWhRZIuCrlJf0Nbeorup4UwSoWOMM1ISmhpJIwyLmguUpDIqMPT
 l+bFAn2RJpfWXDm4CVfG9Cgo+FsRUIFoWWesk4rkFTqatmn194KBLLeA7sEWu2Rn4Vjw
 G4WA==
X-Gm-Message-State: AOAM530H2NuEH8mbsVC8v2wgMFidNEG29Wo+MvqLrw5HheSsjrR8xYpr
 0lDx2LvjFwKNBMVvSHttXmqaDRqEeIJn9QLw6NdIYF/EoDI=
X-Google-Smtp-Source: ABdhPJzUy74dzQHFLQkKhPtwV2f24bWxIzI9gTe7horfWQuZO5mKokmtCk5VuuK382QKga+K9lSTjL3mdhNyfbvm33k=
X-Received: by 2002:a5b:7c5:: with SMTP id t5mr8633186ybq.190.1619216595468;
 Fri, 23 Apr 2021 15:23:15 -0700 (PDT)
MIME-Version: 1.0
From: Jason Ling <jasonling@google.com>
Date: Fri, 23 Apr 2021 15:22:35 -0700
Message-ID: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
Subject: [pmbusplus] userspace i2c, pmbus interactions
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000fd1b5c05c0ab3d39"
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

--000000000000fd1b5c05c0ab3d39
Content-Type: text/plain; charset="UTF-8"

Hi all,

What started as an attempt to create a simple command line tool to perform
pmbus device upgrades over i2c has turned into the start of a user-space
i2c library (with some pmbus support).

I've already reused this library in some other obmc applications and it's
been fairly well unit-tested. It also comes with all the public interfaces
mocked (so you can unit test your own code).

The idea is that more and more classes get added that will support
different pmbus devices.
General idea is that each device that gets support can expose methods to
allow device upgrade, black box retrieval, etc..

Anyways, wanted to gauge community interest in this so I can determine how
motivated I should be to upstream it.

--000000000000fd1b5c05c0ab3d39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>What started as an attempt to c=
reate a simple command line tool to perform pmbus device upgrades over i2c =
has turned into the start of a user-space i2c library (with some pmbus supp=
ort).</div><div><br></div><div>I&#39;ve already reused this library in some=
 other obmc applications and it&#39;s been fairly well unit-tested. It also=
 comes with all the public interfaces mocked (so you can unit test your own=
 code).</div><div><br></div><div>The idea is that more and more classes get=
 added that will support different pmbus devices.=C2=A0<br>General idea is =
that each device that gets support can expose methods to allow device upgra=
de, black box retrieval, etc..</div><div><br></div><div>Anyways, wanted to =
gauge community interest in this so I can determine how motivated I should =
be to upstream it.</div><div><br></div></div>

--000000000000fd1b5c05c0ab3d39--
