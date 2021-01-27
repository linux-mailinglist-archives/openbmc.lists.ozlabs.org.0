Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7919E3053E5
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 08:04:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQZNZ3MGMzDqpM
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:04:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hQoADuiA; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQZJb5j7jzDqcJ
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 18:01:19 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id kx7so699921pjb.2
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 23:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0OzqZ9Yu+eqWdRHtftw7X+Jv3RpCtnEi1KUqbsprzyY=;
 b=hQoADuiApPC2alLh1F6vF4/PL1i2SHkH8l4aCqHIhU1IgVaqpWyVclA6svhhoJWAj1
 SfwPCHngPOfVSYvhqeVoXw2LJUa88Ll+wYu7rotN0z6nNW1PFRoS3mMWhvdpp55vwCu/
 jSqDCEeIBl4ifC4vRYchJ7ft1PUCt8qV0kG2EbPwmAAottuFtjYzLwi1SONfIYX9Rl+I
 4Z5JfYChY368qKg54s0lK0Sw0lvdZDPFXZWcJZ94dILX0R1yfaT8i/Dd90/DJ7L3TyWq
 0X9u3GLiTF88D1QNwhyXV8OGbAKE/V8X6QGY7o4K/OBp5tjoNmwxo0nERw2ZB6BLQWEr
 yHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0OzqZ9Yu+eqWdRHtftw7X+Jv3RpCtnEi1KUqbsprzyY=;
 b=YR7AgAHn4Anu8lhOunOHqAK2WUWa5jj/oTsq7AN4ztpAWkknLq0lEP98w7dkltqKKh
 /jMOBLB8VPklOqfcPZIU1XZQr7mKPz1Ll+Dn+aVjVVeDPcSlKPCXo9ZyCtcHEh2RzW6X
 AUEtP+wRt0wyQB3CUt9JUG2raHlnxA8fLHl8r+DPFjvCa5fy9fx4/j3U9Vm3ISJyWDzO
 n8hmoFojFBWMAWF63LnYs1pwWdD0FgN7zj7AUDsDxzQwUhNlPzzxOyjxlZpBt6+0cB70
 K5yrgBTqq8yolOCoB2xw7WWqFFm5MCa6PRDCIHvzYNxPi7X4H3METBF+PG48oVA7BDEs
 aghA==
X-Gm-Message-State: AOAM531ZFFInjC+13JYIQAh5DX3GGLxY88A9gtrGOqJa5M1Tuz/wSECY
 FLILlzksATt9AKgGKirWg8YNzm9Fkwk=
X-Google-Smtp-Source: ABdhPJzA+NdxSDdMSqkuCBey2gqr86IbXqoBQyC6css9FG31cobzqXCbJXD3uciyIcSIfM7O0wILaQ==
X-Received: by 2002:a17:902:6901:b029:e0:1311:ac2c with SMTP id
 j1-20020a1709026901b02900e01311ac2cmr5905566plk.54.1611730875331; 
 Tue, 26 Jan 2021 23:01:15 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i1sm1258315pfb.54.2021.01.26.23.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:01:14 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/6] config: ast2600: Enable
 FIT signature verification
Date: Wed, 27 Jan 2021 17:30:50 +1030
Message-Id: <20210127070054.81719-3-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127070054.81719-1-joel@jms.id.au>
References: <20210127070054.81719-1-joel@jms.id.au>
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

