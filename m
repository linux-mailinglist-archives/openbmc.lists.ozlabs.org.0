Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6538330218B
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 06:02:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPHmn3wGHzDqRG
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 16:02:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kY+cGcYD; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPHhZ2zLmzDqk8
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2021 15:59:10 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id e9so6869768plh.3
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jan 2021 20:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0OzqZ9Yu+eqWdRHtftw7X+Jv3RpCtnEi1KUqbsprzyY=;
 b=kY+cGcYDjuDpPHDHzHbeTjnXrWQcNj//oo2apWzzmLdyoQ8f5egmbCd3jWucQXYsSV
 UMdXAZSdNcVVmHs7S/fkPP6EsxyStq6LE3HnBT0/MI/dYC4wSGTGF4bxxhusUpgc/8Z5
 STQs+sEDyRoiB/z2/VQlSbfwqzMUoYpCojZwc4S6vYaqki5MNyv0ZPe/DhXnSIibGM1d
 kl06WHFWsDdO7wlBWkSXAS19lLM9bmCh8s8+/CTgVTw4LuCmXThetNphBwS/vl3NCwjI
 TAE7lzMfcE4sbHPw9Ck3eJWlFs+aMkc4HqZDcftxTm+azIHvUBTeQVPdtAcPjB9u9WZ0
 cENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0OzqZ9Yu+eqWdRHtftw7X+Jv3RpCtnEi1KUqbsprzyY=;
 b=aviYK8DlIrwRiy4VfsNLw2eSm2qDfpk9kEq3q+LWVGIIERUOF4OYHdnmAQ9A+VVG5c
 8Sxa6gWt7pv+Kz48NvQPxqbugRv6rrgqyu967gx2/i8u0NW4iNBSyeWF3JptL2hfkePt
 ObuEwtHGTxJLSyCo9nuxOZKML90QjSvWltGkH5d1skgSGAtJiCDZGYGmCKK8ZYlW+dkz
 d7I3UFbbBRmP6oZeMqWahrj45dbidC86zId9j2RTUybrnNaP+6fn7h+e5zR3DoTaA5Ms
 jgmp3H9/+Eu8gcBZt95JEXsbIw1ZOF8Vht2lIZHq+kVeuGfSKWkpUWslH+EMhmULu/v2
 AnUg==
X-Gm-Message-State: AOAM533YMDPAirAMSEzbKIzn27FL3/k7MCf3yMwPIQngarbmg/csWQcZ
 RY0bBoaju4a0Rmrq9ddw/f/5d0pw8IA=
X-Google-Smtp-Source: ABdhPJxakYUQo47FRDN7bo/UHATWGlEfbHON/fwSoxZrFns60LfixMc54bAoqXLAyHqtWm43RIJAdw==
X-Received: by 2002:a17:90a:df84:: with SMTP id
 p4mr19597865pjv.81.1611550747434; 
 Sun, 24 Jan 2021 20:59:07 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id gx21sm17525048pjb.31.2021.01.24.20.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 20:59:06 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] config: ast2600: Enable
 FIT signature verification
Date: Mon, 25 Jan 2021 15:28:46 +1030
Message-Id: <20210125045846.448399-3-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125045846.448399-1-joel@jms.id.au>
References: <20210125045846.448399-1-joel@jms.id.au>
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

This turns on FIT signature verification for the OpenBMC SPL
configuration, for both the SPL and u-boot.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 68d18652c980..20f2e7019cb3 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -35,6 +35,9 @@ CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 CONFIG_ARMV7_PSCI_NR_CPUS=2
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
+CONFIG_FIT_SIGNATURE=y
+CONFIG_SPL_FIT_SIGNATURE=y
+CONFIG_SPL_LOAD_FIT=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
 CONFIG_USE_BOOTCOMMAND=y
-- 
2.29.2

