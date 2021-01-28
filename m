Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D6D30740B
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:50:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHLy1sS5zDsMP
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 21:50:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OrJsC0uu; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHKx0ZGjzDqhn
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:49:55 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id lw17so4578742pjb.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=444KRGMyob6SFpwRKcGKmjO6I+FiMLHprBoJ6vMmSnQ=;
 b=OrJsC0uuVkzOWj+Dh8b8ZLRWlILn+KRpglwYbfoL3KDhr+0EU7EgGwV1ZM7XiiJ64X
 XIH9ZxutbH0dy7qdyGf1lb/ZVfZO2iYdATqEbz5HmlPiUd2owvQyVCkT7KubucqDxiB5
 vVzXOIfsVvxLVqXXy+KbOYEse0ROb1gX6XPvUKLom7kTAF33N6JHoxNlOHXd0SkuNl9v
 9QE0PwozSGTLMDpFwDWVOzNmPPw5fxNw4PpsRmxfyGdW4PODZ3bG8lRIZfPByuZ3dSRp
 VgbjA0DeTVr68LHOq+wNoorptDdpexhcaHbo2kYcvVv+5fCyYS4xQG8pIl7muihyhUPQ
 Aw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=444KRGMyob6SFpwRKcGKmjO6I+FiMLHprBoJ6vMmSnQ=;
 b=I+Ktf7Wb8887teSBM4FGIfNKtFgR38BMoHkXup9omyiUb4Ktx0Ji+dbXzRQcudh3hU
 vVh0I/XIrhTc0Qrx51hty+xOpDIz4fB9YQd3asxZKhHL0sV6z17wWobEtTiYVVBL0q70
 gc1BTSLWC9ThaQbSyRfCFjKT+lNskxHP9e5Z/EfavgLWGGfMH4k4DfC62wtCcsMJbz1V
 5Hg+TYPvARJb7B0dyGtz4Npw2izrkPRkl9QfSCxV3tLx8k2YiUa2wnJBrgeVua57JCrS
 n8ya1AVNjZx6ptMnys5NZY1+PsjOqK3TLYCKxre6KO91TtoddSpO3Gfw3NQr6i0nJBDL
 XHlQ==
X-Gm-Message-State: AOAM533BMVw0+BZHQ936Ooo1zWzhTdbRMr3m/axc/3Kuus1JY3QW6wSg
 TMKrfH/hC/jX+xepr9PPqiKQKstueSg=
X-Google-Smtp-Source: ABdhPJzwsQ6SG+21Gr8sD+uvTff5H0DDGl29PQkHabkjfxeWbgUsikzzxIMNIq82b+4rYIFwR7TveA==
X-Received: by 2002:a17:902:728b:b029:de:c843:1d4c with SMTP id
 d11-20020a170902728bb02900dec8431d4cmr15826559pll.84.1611830991614; 
 Thu, 28 Jan 2021 02:49:51 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id u3sm5846216pfm.144.2021.01.28.02.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:49:50 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/7] Blackport SHA512 for FIT
Date: Thu, 28 Jan 2021 21:19:35 +1030
Message-Id: <20210128104942.400674-1-joel@jms.id.au>
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

