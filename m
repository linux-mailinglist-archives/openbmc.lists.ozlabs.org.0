Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96A532904
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 13:30:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sT5598hz3fZ7
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 21:30:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=bvtw0WEa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=bvtw0WEa; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6sCH3XtFz3fN1
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 21:18:50 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id er5so22568226edb.12
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 04:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hdBXC8xZnYJ6R+JztCH/OwQPymxeb4yJg01zGc7n6bM=;
 b=bvtw0WEa0UBZasyQ3eHF1qWSUfXl4H/BP1f5bphEHKC+xNzwIu1fgsbQjtX4hZwkjT
 z4OZgKPpWvOlKHSVbffoKdn7OhG/6h82mW1kgKRLHga2zXcKDfKPw+TdSd7utfxD0lal
 G/6k3S+9u8QitjYTRrYrI/0HD/gFdLVNgpqCwTjB0Op6VRldLsM9E6dDKDXzzp6/egLM
 NMV+573swEPkBZBJzYGf0zMshSHKd4UyCsid1mnoPT62DaEew6A2g/5XW+NyhfCTOI08
 n0I0ZnEUMcd5Fjx6cvp+NWhr73pNo/K1uGAfCMxC6wyQ9xVZFRgANEnRg3dL2geMd2+9
 jP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hdBXC8xZnYJ6R+JztCH/OwQPymxeb4yJg01zGc7n6bM=;
 b=tu1indjMUqhlgiQR/IJK6pj7WmrAASUo+FanophkDTgLrO78SYwdPSDwfr0RxEuxif
 7mAsEFKJchW8xDzXxTtP3ybU34XX7KNgxa+dB8c/ig+13WwQ0TPNUDSKWIrkBX6rS6Rb
 baaOz0Wb+AxgjU9m0+2zumTKzyNWSOMy0hawlIu/1SBR/lQBEggnYrk1Dq3WSmQ4oNLp
 0oPb0oRRrKkMirwaZPmWB8VrW2x6I2xUMqwNXtf/lh2l+h2gfsbine26jW+2uzIQJIwP
 9ojN8Kjx2JCnwhy2pBLK5lPPPTLBxoS9OPiUgs/JTnioCa15L5+/Q31/wg3mxtnpVMb4
 y95w==
X-Gm-Message-State: AOAM530PgfbPIG2JqmwGDHkhIgWniVPznWA47VJZozBUkzO7ML69lGl6
 3hqg0nQBf2YO3P6Znan7gf0KxA==
X-Google-Smtp-Source: ABdhPJz6X0w5P8p17WguN0KiF+a4PTL/bSVm2AehyJkX6KtC9DxziuZjaM/z+qJJ2GE53KHbqrS1Bw==
X-Received: by 2002:aa7:cd70:0:b0:42a:f084:5fba with SMTP id
 ca16-20020aa7cd70000000b0042af0845fbamr28557551edb.351.1653391125247; 
 Tue, 24 May 2022 04:18:45 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 y20-20020aa7c254000000b0042ac4089dabsm9181607edo.17.2022.05.24.04.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 04:18:44 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v5 0/2] Add support for IBM
 Genesis3
Date: Tue, 24 May 2022 13:18:39 +0200
Message-Id: <20220524111841.627400-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>, zev@bewilderbeest.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v5:
  - Rename Kconfig and don't depend on ASPEED_ALLOW_DANGEROUS_BACKDOORS

v4:
  - Rebase on upstream
  - Drop defconfig and add it on openbmc instead
  - Rename Kconfig for debug uart

v3:
  - Drop FIRMWARE_2ND_BOOT patch
  - Include reference board DTS instead of copying it
  - Rename DTS to ast2500-<boardname>
  - Describe defconfig changes in commit message

v2:
  - Fix whitespace and compatible in DTS
  - Remove board stub
  - Improve commit message
  - Rewrite FIRMWARE_2ND_BOOT support
  - Update defconfig

Patrick Rudolph (2):
  arm/dts: Add IBM Genesis3 board
  arm/mach-aspeed: Add support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1

 arch/arm/dts/Makefile                   |  1 +
 arch/arm/dts/ast2500-genesis3.dts       | 28 +++++++++++++++++++++++++
 arch/arm/mach-aspeed/Kconfig            |  6 ++++++
 arch/arm/mach-aspeed/ast2500/platform.S |  2 +-
 4 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2500-genesis3.dts

-- 
2.35.3

