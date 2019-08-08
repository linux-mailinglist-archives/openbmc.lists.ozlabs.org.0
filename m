Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4486425
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 16:15:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4649PF42CWzDqnc
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 00:14:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ERPVmc/7"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4649N15qhvzDqYk
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 00:13:53 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id r7so44185714pfl.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2019 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cp1i3+0DEmZNwBIERzqlGf/Xkabog066G60lOMCkiCQ=;
 b=ERPVmc/7SUnJQbK1FF76nM2T9Kw5xkZDz3u3Y5VCdonTwR1kv4QfGNQ+GYt2VkJxCe
 5N8sFwFr+jVO7+ZVnQfJ2K7hSgMoe5e8iQ1n/Tfgy3DR0ZS+pAHrixgiNWo3ZhGetEno
 VCcoF//yE9dmgBUTx2H3BfLJrd+5fmck9RZzLA/awoQicocqsNzYxp9FYMCsH9sB+BkZ
 Qp0p+H5KU7eCyI/UJW/+xnYhrqPjjc9zzsh0ViHMC+WPTTQMa3SMBkiyp67KBjJDR3l9
 1hU9V/mbiEmBrZwzd33kDV8FCwK3Rd84MGIGGchqzn8aK/5Dyabfg6y0ktQAROvxHMJe
 lIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Cp1i3+0DEmZNwBIERzqlGf/Xkabog066G60lOMCkiCQ=;
 b=Ko3xII8M8wusa2nWYifXiu8X9b68nYE+QaCwZzlPu5k4h5BE+b1yuw3CoaGWbsDg+5
 6Xb9ceDBP2rlPgB6z328x8CfUMaGkOZ9KTlEctjm3CCQmFXtq0ZcM5seg+L5QefO6iVn
 +IcgdiF0uSHYrErd0EP1S2K9EV+/wrTxzFz6YTmuTeIyloGNJnd4hiQ1CyieM6gJxZby
 qEYsNJ70dtBvRszd9rownUieCjzc6aJyW2nLnlk6xua3EKOMvSW9MUK4UTvQw3KTvBl/
 avLwwiBiRo/2GEB+e1UieFOqLnp+2qkMvFcRSw/0OG3blIyNkrt0exF3AFJMkR4rdbM/
 Rk/g==
X-Gm-Message-State: APjAAAUtWzv9w/jyGX662nOAmylM0idSdGZwCKs+3K2s4sjRiU3/eSJF
 DS1WrSReFXV2tqsEzboFMzNA4u2j
X-Google-Smtp-Source: APXvYqzNaR88P5gPtnOomikOAFv6TWv1UsqzbNobPe3mCLwYjMygS+7I3Ix8zDpNF+hvRe30lABH0g==
X-Received: by 2002:a63:1f03:: with SMTP id f3mr12716220pgf.249.1565273629262; 
 Thu, 08 Aug 2019 07:13:49 -0700 (PDT)
Received: from voyager.iht.com.au (210-10-229-158.cust.static-ipl.aapt.com.au.
 [210.10.229.158])
 by smtp.gmail.com with ESMTPSA id v185sm106416782pfb.14.2019.08.08.07.13.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 07:13:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 0/2] i2c: aspeed: Disable buffer mode
Date: Thu,  8 Aug 2019 23:43:35 +0930
Message-Id: <20190808141337.27355-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series does two things:

 - moves the OpenBMC to RFC v3 of Jae's i2c series

 - disables the use of buffer mode by reverting the device tree patch

Buffer mode is not supported in Qemu, leading to a crash. As OpenBMC
changes are gated on a successful boot in Qemu, we cannot merge kernel
changes that break booting.

In the future the Qemu i2c model will be enhanced so we can support
buffer mode, at which time the device tree revert can be reverted.

Joel Stanley (2):
  i2c: aspeed: Update to v3 of buffer and dma support
  Revert "ARM: dts: aspeed: add I2C buffer mode support"

 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 14 ++--
 arch/arm/boot/dts/aspeed-g4.dtsi              | 61 ++++++-----------
 arch/arm/boot/dts/aspeed-g5.dtsi              | 61 ++++++-----------
 drivers/i2c/busses/i2c-aspeed.c               | 67 ++++++++++---------
 4 files changed, 80 insertions(+), 123 deletions(-)

-- 
2.20.1

