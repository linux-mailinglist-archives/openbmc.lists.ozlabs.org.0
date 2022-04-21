Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEC050EE7C
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:07:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQJ10SKGz2yQK
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:07:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=f43vrjSt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=f43vrjSt; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkW473xNWz2xt3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 18:32:05 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id bv16so5556504wrb.9
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0v2Qt4WopicI22zlf+q429toQeboAO+1FzDp7Kl674=;
 b=f43vrjStEN+bLzyiB9nCn4UxjLQwH7t/JaEq+YzzSY9iLS/PiD42xJz2Oi22lsj0E2
 U7+c7D6Au5wUYr6IJBZS5BSEafmgbaqZEejQxmW5AyafyEJjwrVH4YS46bV1PnYE6t/q
 GwU3ZzF9rNqfn2C0OQiLjDLprZU+JqQ+JJ1x6Nd/1glT+3ps9Wqha2O/zq9ncYUXQ5sk
 ugKh5Cth2DAWwjIIBiEe5EKUjkNDu75/3/2W+f7Gb9JqyIiBT8Xg9oXS0yqZcb/DGa78
 PqTz5T7l/STjaUDzGqaNoWqc3l7RN5P9XyACo4UBYRDE90dUWBLtl4AG79npfqO0M+/Y
 s+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0v2Qt4WopicI22zlf+q429toQeboAO+1FzDp7Kl674=;
 b=DWonE2Cx5JLZJwGfBrPp3KmQTTSsfKJY0EzD1qwcU/hGRXFXfhNJHZ4XlcAAEEQuks
 M6HbH2d5+4D+CzbMoVVenK7hYoisey+aobXVKwZF24h6FDmubNizom39m9pYIza4vw5X
 QV5PhxG/s9V77a0pcRVxSScQHFCECa6xp8TfGrWI4Sz+4UZVxV+ukCDQ6QPMP0K5y4og
 9QPudotBrYVFN+Jdk/etNl8qJbiyqng7UX/Ak34iI8nQtGuzcAzBhVzzdOVUpuR0xZpL
 pDnFcWqlINaQTLEdpQAMs/a1cbh/KKBhf3nByUpzeujlYqRf/36JjIC5B/Tn5rqD2xxV
 7s/w==
X-Gm-Message-State: AOAM531dTE+TwwSzi5wIbNb72fjs/rThbElXnhpGdBfyzbOh+9iDed0P
 UaBgfgrna8BhkCGbGXDg0YuWOQ==
X-Google-Smtp-Source: ABdhPJwl1GjMcV1DAW2cGpL/qTY+X+xcFZERaWfbjirJQT4u/WYypx/S0K1ntFSXrUYKIp4cagqOkA==
X-Received: by 2002:a5d:5942:0:b0:207:9abd:792a with SMTP id
 e2-20020a5d5942000000b002079abd792amr18514932wri.118.1650529918579; 
 Thu, 21 Apr 2022 01:31:58 -0700 (PDT)
Received: from fedora.lab.9e.network
 (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm1537238wmb.48.2022.04.21.01.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 01:31:58 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	zweiss@equinix.com
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/4] Add support for IBM
 Genesis3
Date: Thu, 21 Apr 2022 10:31:47 +0200
Message-Id: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v2:
  - Fix whitespace and compatible in DTS
  - Remove board stub
  - Improve commit message
  - Rewrite FIRMWARE_2ND_BOOT support
  - Update defconfig

Patrick Rudolph (4):
  arm/dts: Add Genesis3 board
  arm/mach-aspeed: Add support for CONFIG_DRAM_UART_TO_UART1
  arm/mach-aspeed: Allow to disable WDT2
  configs: Add IBM Genesis3 defconfig

 arch/arm/dts/Makefile                   |  1 +
 arch/arm/dts/ibm-genesis3.dts           | 83 +++++++++++++++++++++++++
 arch/arm/mach-aspeed/ast2500/Kconfig    | 16 +++++
 arch/arm/mach-aspeed/ast2500/platform.S |  6 +-
 configs/ibm_genesis3_defconfig          | 73 ++++++++++++++++++++++
 5 files changed, 175 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/dts/ibm-genesis3.dts
 create mode 100644 configs/ibm_genesis3_defconfig

-- 
2.35.1

