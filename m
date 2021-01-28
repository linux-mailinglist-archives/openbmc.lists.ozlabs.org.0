Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77104307426
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:54:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHQb5VQczDr9y
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 21:53:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EI0asoY5; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHPm1W9jzDq83
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:53:15 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d4so3109939plh.5
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=444KRGMyob6SFpwRKcGKmjO6I+FiMLHprBoJ6vMmSnQ=;
 b=EI0asoY5dUQRu5JWgkKAHap9oRpG3aFIfXuSosxTTQy+2OVVCo7i+msqxV06nibPB+
 da1vQbqSMQkqvs3aD3MsvD2I3SsLAqTtB7M9mOV1EUcDgYq4JzxFJ1SnT0Xf/dm2u4z/
 vCrQO3poZlzvL08YRKgGhV2WqA+raaLR+yYAUsROfRfxDeO5ykJzF++yQ5kIKpf0kHqo
 Ak0bEt+DBe06AZ8RIWUHJn+XG7OEdye/l7pKZZmLwXx4n67q2cbRypT5nklSosOVLDqA
 9obLtbn2VFO5L4KahZZYe7Eb8rwuVJ6B/+iOGylQsN8DCDU0wD1UbPj0D0AFTaQjYDOI
 qVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=444KRGMyob6SFpwRKcGKmjO6I+FiMLHprBoJ6vMmSnQ=;
 b=Mx063Sa/iPyQ/uIomjbI3TMnb7RQ4ICjCDQbidR9/be5cQ0Pp+84irYWu7mx2w/hLP
 BVXT3009NfPL3hFfwY3XI5XhzX4zHYjUa5Odd94vq+Cz3qRRUbgWQ5dUbxIIDt1ibLvo
 G1vqrnssAphwrfXNeKaGCvX1p48PsdN2bs9ZDzKZJYfgA+QH1Q7smlWiV6GjqJQdMzsh
 Zd5KGPDMhb7VCowMDijEXQAfYmj/3gBpD8wILlgBMt5jcBcTbYxW/u7Sm5WV3hYuWlQS
 eGei+JvVhQKFpkXglC7meeVt5W5j8d0+oT5Gw2cYjRXd+DCRV2uOg/pAZ1ziI+G8PRg1
 xVGg==
X-Gm-Message-State: AOAM530KcQpkc/amIHOylNd9G2m8nY6H/frXXp8JgmedRNFAKkriOesB
 KBn2k02Fm9FawHgf16rIi6M=
X-Google-Smtp-Source: ABdhPJwikcqt7UVWFdPV2NpNs2sWhaBhWwlEjZd6PQjgjYycPmMLrg8E3Xt1ehQFMhak/ss8jt9uaQ==
X-Received: by 2002:a17:90a:4598:: with SMTP id
 v24mr10342219pjg.135.1611831192006; 
 Thu, 28 Jan 2021 02:53:12 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q197sm5102748pfc.155.2021.01.28.02.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:53:11 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/7] Blackport SHA512 for FIT
Date: Thu, 28 Jan 2021 21:22:57 +1030
Message-Id: <20210128105304.401058-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

These patches bring SHA512 support to the FIT in u-boot, SPL and
mkimage. The majority of the feature comes in with "Add support for
SHA384 and SHA512", while the rest are relevant bugfixes that have been
made to master since v2019.04.

There is not yet a change to the configuration to enable the new
algorithm and therefore only a minor image size change (an increase of
247 bytes due to "image: Check hash-nodes when checking configurations").

Harald Seiler (1):
  common: hash: Remove a debug printf statement

Heinrich Schuchardt (1):
  image-fit: fit_check_format check for valid FDT

Patrick Doyle (1):
  rsa: reject images with unknown padding

Reuben Dowle (1):
  Add support for SHA384 and SHA512

Simon Glass (3):
  image: Be a little more verbose when checking signatures
  image: Return an error message from fit_config_verify_sig()
  image: Check hash-nodes when checking configurations

 Kconfig                       |  26 ++-
 common/hash.c                 |  83 +++++++-
 common/image-fit.c            |  17 +-
 common/image-sig.c            |  69 +++++-
 common/spl/Kconfig            |  34 ++-
 include/hash.h                |   4 +
 include/image.h               |  18 ++
 include/u-boot/rsa-checksum.h |   1 +
 include/u-boot/sha512.h       |  38 ++++
 lib/Kconfig                   |  23 ++
 lib/Makefile                  |   1 +
 lib/sha512.c                  | 383 ++++++++++++++++++++++++++++++++++
 tools/Makefile                |   2 +
 tools/image-host.c            |   3 +-
 14 files changed, 677 insertions(+), 25 deletions(-)
 create mode 100644 include/u-boot/sha512.h
 create mode 100644 lib/sha512.c

-- 
2.29.2

