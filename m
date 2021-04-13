Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E5935D9A3
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 10:09:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJCn3pjmz2yZL
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:09:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AcTUZGp0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AcTUZGp0; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJBm261Mz30Q9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:16 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id q10so11364523pgj.2
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qFNhce6RfHZCHryGGGBFUQWY5zdSmnWli03nrCWtJa0=;
 b=AcTUZGp0IuEQQVlrLDJYTEpfn+FxYYeRhRHA2ZmMIdKCS0saefGdTqAoxIiDRwNg5x
 6mgE+Vq6Xcqa8Hjv8kz+K4fUJpPJzigQAJYeHGGMkssIwDh9GTw0TesC1meFvLNxjdg9
 VTisTVSj91zzJKs/1RGT9X0JLSQvmSzpwyJys+mQL9pDSfW1+VRlziVKtPFznItiIzF9
 2uuOvCvh3WS3dhBVIDcx/1wr9HOqzH+4AwAlaq/gp66ab3ny+NR8krJdMt59rSGths+i
 56/jKfRmScbKMf0h2B6ROa37bMBJqP5jy3k7pDhJtYthO/g1NiZkIKIwa0gMMcwrgVcT
 RChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qFNhce6RfHZCHryGGGBFUQWY5zdSmnWli03nrCWtJa0=;
 b=W9svpPK7a/90vBXi0rJ7s2hOBd3jQCGT3tWMh1lo2WPg9ubZaikY0uuvaxB4Sx99Ig
 xlzQdwzSzZpCVsKZZSmMxrOEza/aBYzdFV8ivZo+qc1NldZq3/oKAzGJ2L0fo29EiGnQ
 s4GC+IFRcWpzHdruM5ni1/y5lhc4JGoI682ylo6F0pKpjzF9sTX5JXgiDdWsxfT3p/tj
 GRP/V0Gjo6jKCtiPs1lGrHbjk7gDk3a5PEoL86MjTbyHUuRtAkSi1QzO67gm6KKfeyna
 8FesrBKDOhaa8pjNf3ARwPm9dYpbDBG/zW5Sj17kmYYaXl8QMcsBJFxvLgT3wm5sfJK0
 B3+w==
X-Gm-Message-State: AOAM531fwv7ldgHwWzwCusdKf6BC8LxQEcIgM9S8LUalO0UYsB+wpR6K
 rhQdrf6foiwDTrHAsjx4TG4SYQCixRE=
X-Google-Smtp-Source: ABdhPJwWSVfJnhaX4XDNBbb0n4UlP5Uibyy0m0Fu38m3YIPGgMVtihZMJUiUvXqgbJNg8PS3QqPGIw==
X-Received: by 2002:aa7:970a:0:b029:24e:b5e3:6fc3 with SMTP id
 a10-20020aa7970a0000b029024eb5e36fc3mr5813173pfg.81.1618301292959; 
 Tue, 13 Apr 2021 01:08:12 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 02/11] ast2600: Specify boot
 order
Date: Tue, 13 Apr 2021 17:37:46 +0930
Message-Id: <20210413080755.73572-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Try to boot from the strapped device, but fall back to the UART.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/spl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
index 54f89b0e8431..d794421b4070 100644
--- a/arch/arm/mach-aspeed/ast2600/spl.c
+++ b/arch/arm/mach-aspeed/ast2600/spl.c
@@ -51,6 +51,12 @@ u32 spl_boot_device(void)
 	return BOOT_DEVICE_NONE;
 }
 
+void board_boot_order(u32 *spl_boot_list)
+{
+	spl_boot_list[0] = spl_boot_device();
+	spl_boot_list[1] = ASPEED_BOOT_DEVICE_UART;
+}
+
 #ifdef CONFIG_SPL_OS_BOOT
 int spl_start_uboot(void)
 {
-- 
2.30.2

