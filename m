Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3142507AE
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 20:32:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb12Y2HzgzDqMW
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 04:32:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o3GSUT29; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb0zR3QbjzDqMw;
 Tue, 25 Aug 2020 04:30:11 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id ds1so4748493pjb.1;
 Mon, 24 Aug 2020 11:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=VTtbXipo5H4nLyDYTKcE4hPeblvL2h4pyUGSarWbxLM=;
 b=o3GSUT295NtYp3jigtP9n+oJuGGEDYcCd9nKF7XsOCafmopwVHslYgT8JtqzfUkFWw
 qemKksjqv0lEhagptQm3nOPucQPLLHoguebYNAJiN/QvL11c35czr7PQsgAMPHNb2BS6
 KMKUE0oim8iK06hUnSsAE1wCR96oMbbsQ9ZH1YTlQhah6NfZddP/YN61XjkzSMbDY14d
 q8WDFjFEFS0hP0KaNF22+Zz573quj/SBNIs00unVpUN1QqgTfhvAiLN/Tcubopq523/b
 oLVs1BmWncBewmKuOGfzP4veLDuCHMGlzcrT2kC5XQz5a//doi3TWYYjosbJRJFDV8kM
 0ImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VTtbXipo5H4nLyDYTKcE4hPeblvL2h4pyUGSarWbxLM=;
 b=aX3k/BpEl0w3HW8V5q1A8ooeA+EHXssrP2hSjC9oIJ4iMhFKfWn9zqe2Vz0qSTNo7D
 qSi+FV+TAWdmESa4fzcacJghK1zbFwa0yTGblQoPmS8I0v9Hb4dnhw76oHaN9j9K5IvN
 lsNCA78nEJv/HBKDK4GwOcmXVtizHd7eMby/5tDCTDD6a0swSEvjBMglrXU8Rujv9/Qz
 b/+5xD4IQzndJEzsjSgUNyzoefhZ5aqVvt6NoTlPUiLz0+n44eK00CN4x9vhRtsrL0VT
 kKaPf/1a72w2ZEFlRdfQnt5Smrp/1XTH+XmVEJaO/ptS6nA7jKG9glcT23LUW7usw75z
 SDzw==
X-Gm-Message-State: AOAM532THmZdq+4VJ9O7gDs0IcTv+IL2UBM0uhhkp7J240eNaINVANRL
 NV28VROALyZoOeKIgg0XmZw=
X-Google-Smtp-Source: ABdhPJxQxip8b858OIV+lcoHjahNusQHsiE27qrNi7x4jNKo1SHhplSUttfpEhb7Kh7iTeXIfpQ0lQ==
X-Received: by 2002:a17:90a:5a01:: with SMTP id b1mr429154pjd.27.1598293807069; 
 Mon, 24 Aug 2020 11:30:07 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id a66sm3920460pfa.176.2020.08.24.11.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:30:06 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 0/2] ARM: dts: aspeed: wedge40: fix a few nits
Date: Mon, 24 Aug 2020 11:29:53 -0700
Message-Id: <20200824182955.7988-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

This patch series fixes a few nits in wedge40 device tree.

Patch #1 updates FMC flash label so it's consistent with other Facebook
OpenBMC platforms.

Patch #2 updates UART4 pin settings for the purpose of RS485 software
emulation.

Tao Ren (2):
  ARM: dts: aspeed: wedge40: Update FMC flash0 label
  ARM: dts: aspeed: wedge40: Update UART4 pin settings

 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.17.1

