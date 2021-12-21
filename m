Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F055D47C532
	for <lists+openbmc@lfdr.de>; Tue, 21 Dec 2021 18:44:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJP3Y6Ymkz2xXg
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 04:44:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TfaGYcVb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3cblcyqckb7ejlztyvexffxcv.tfdfgvesdtczjkj.fqcrsj.fix@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=TfaGYcVb; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJP3C1Dv8z2xXg
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 04:44:21 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id
 r18-20020a25ac52000000b005c9047c420bso27022207ybd.4
 for <openbmc@lists.ozlabs.org>; Tue, 21 Dec 2021 09:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=CDuBDxOSUYlCehxXtPSC2OIzjN0BmuoKrvgmDwQyvuQ=;
 b=TfaGYcVbeJF4OeDvfFRzo2v0n3VAgiSZ3mYQT9Dxs6ECLCGrTBdlc+kWr64JHpqCR8
 rH3rwP7DYtDKLJtEcuRtG6Xiau9Wem4usMhThTsyuDqj+AcHiYOyPEUtPSQMvdv3Y5ox
 0kYuYQxzIGm39nxLk/ZGKVHHUVDhP6RUQ1v++V1m8R5Xo6/bal8jhjQ7DHJJRj29aIWm
 G9Cee5gMwrOgqiNuG4RWRaivl/BNl+Z6ii9TJOQBJ1uWshAgX1+i8HbRDlIvEHsMupZJ
 pM+5xJt07vuSvz1P6oGCwpVEURMMbNuTiQuJKVMZRPJjN9JrnB+ADawiT2newm6S6EGT
 sQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=CDuBDxOSUYlCehxXtPSC2OIzjN0BmuoKrvgmDwQyvuQ=;
 b=2pJR/q7BQU+gK2Bpbv2n7UjJVkJxYcqJqwul2V4s4CtF8RLEzXylYv52vRO2bxQopj
 s41hCtw7qvjHgAfDpUy8TPi7Is+zeaWkdESlIxCUBs4gbPTYPZkepa65con8WHIUcnlW
 lq0PsNrtOPmhZ+Mb4v5BshzqIX1QjwgJi1wOJFC8ekpszmxh+FaToq3pIWEtppHBpEO0
 nma7l1ObLpalDFJwplMLKO54EuGTZuz7UFRqooBzJ97KuUSmOXxudZq/+S9BUnyVOApX
 lqBDAI/hb9911RXes54GqHTHK7ECb4LTgnQbzLLnUYKoNtfuNsQKeVbbQTN0aczQcoAu
 TQiw==
X-Gm-Message-State: AOAM530nZud/D/DsuI+hGDwZ+tGLeUzoFlx47TQS7pWJVNi4eozdUprc
 wwOp9TqTKP8/Nhi6ik2mkze/HjFnPwmb
X-Google-Smtp-Source: ABdhPJxArDKEt7s8nvJ9hO+5aMzE0jhQdqi4ArT2F52H2Z6NTXreZ4J7/reCC5firYqFR/Hmc/uPcZyFi9bu
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:19fd:5987:f46f:7488])
 (user=suichen job=sendgmr) by 2002:a25:2f03:: with SMTP id
 v3mr6131319ybv.557.1640108656573; Tue, 21 Dec 2021 09:44:16 -0800 (PST)
Date: Tue, 21 Dec 2021 09:43:41 -0800
Message-Id: <20211221174344.1249202-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [RFC Patch v3 0/3] I2C statistics as sysfs attributes
From: Sui Chen <suichen@google.com>
To: linux-kernel@vger.kernel.org
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
Cc: benjaminfair@google.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 tali.perry1@gmail.com, krellan@google.com, linux-i2c@vger.kernel.org,
 Sui Chen <suichen@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add I2C statistics (transaction, bus error and NACK counts) as sysfs
attributes for a stable and unified API.

The motivation is monitoring large numbers of BMCs at scale.
Monitoring will be done using OpenBMC, which includes a Redfish
implementation (bmcweb) and runs on different SoCs.

OpenBMC has distribution-wide DBus C++ bindings, for which I2C
statistics will be added. For the Redfish schemas, the upcoming
Release 2021.4 will include I2C statistics too.

Since both OpenBMC and Redfish have/will have committed to stable
APIs for monitoring I2C statistics, we would like to learn the
kernel community's opinion on stable kernel APIs for I2C counters.

A more detailed explanation could be found in [1].

This version (v3) fixes format errors, potential unchecked memory
allocation, and fixes a build problem found by the Kernel Test Robot.

Thanks!

[1] https://lore.kernel.org/lkml/CAJOps0u=seskB-YGvLBsHantJohkEX7do-mt7YSZ6zChQMQxbg@mail.gmail.com/


Sui Chen (2):
  i2c debug counters as sysfs attributes
  add npcm7xx debug counters as sysfs attributes

Tali Perry (1):
  i2c: npcm7xx: add tx_complete counter

 drivers/i2c/busses/i2c-npcm7xx.c |  13 ++++
 drivers/i2c/i2c-core-base.c      |  23 ++++++
 drivers/i2c/i2c-dev.c            | 124 +++++++++++++++++++++++++++++++
 include/linux/i2c.h              |  28 +++++++
 4 files changed, 188 insertions(+)

-- 
2.34.1.307.g9b7440fafd-goog

