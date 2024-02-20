Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEBD85C03E
	for <lists+openbmc@lfdr.de>; Tue, 20 Feb 2024 16:43:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DiuZabsn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfNx06RHPz3cGD
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 02:43:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DiuZabsn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfNwJ5dxNz3bs2;
	Wed, 21 Feb 2024 02:43:11 +1100 (AEDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-59fb0b5b47eso1454095eaf.3;
        Tue, 20 Feb 2024 07:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708443786; x=1709048586; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba+FZT/y8DAA+ic+9F75Kom97L71NReEfdPzSuOXjjQ=;
        b=DiuZabsnLTH4YxtiCwbx9+AkhPbb1evXjmd0ItdROOanxi5a5feK3fbEw16BJK89wj
         vzZIEyaEhw9xu4O3q/9sS8cYTcag4iaT8UVuRqRnS4JXxsdtf4s7VCRM8boXG1EUdWNx
         WGyx2Iw3xjiw86Zti/bw1MH/dKe4JseMauIoRY6PHlvdB2LT5ClPzpOoUZkNuYXtoKUy
         QWhMZMeSFH47WPeY4kHC4E8paaP3w5yKd0eSFGUjieONOYz8VLdN/yMO9EvI1jfVRTpk
         JaXzQR/NQL001kbJnlhePxYm5SVorXhQOQHCSkL1LnS3qXCpQpirGZa5FRfR3OcEY6DZ
         93aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708443786; x=1709048586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ba+FZT/y8DAA+ic+9F75Kom97L71NReEfdPzSuOXjjQ=;
        b=l6C87WqQt9PZIyMy4tAYisPravBYQIK3VpMgBXbNWdjDB6BpgGYBXcarL9SiYldNdR
         Z2yicOhViu1rV1pD4L91N2tTvwbGyBFhNWqbfqqQ9Uez69x/o0skqyU86DAHQJY30fQ4
         j9yrBZw4+7UPxhGKfBD6kB+sEfbp1jfrmtLslH87iZJ/T9G7L+l/uY4hgS6De4Yci6Y+
         s46hXdn0BVN/TOHnQRhzrox8TmP7yWWg2ycj7zHcqFnpvDW+CyedaWKa91PKn9pACGbS
         M4vIIndIMdKa47l8IbItpnrTs1ZvZeAozth5z2Omr9EQRI4PR8+Xja603CP5XHXPb0iC
         e7dg==
X-Forwarded-Encrypted: i=1; AJvYcCV/dwBOt204ZKbwQ5yFVdKBX5ibGQzoH3nMpSmoGG1KD0e7G+U9dEoxsiXzMwmQ+jbS+7A+A/GsgrUyjaxzZmUDonsrDZZBchVrCJ3+luFERxQ1J5ojAujlUbw3DWe8kMQMjoJfjUZM
X-Gm-Message-State: AOJu0YySWxDsPkeGzyVgLKMsY3TGyKlMGJ8jvQ6PVft/gt6YorIsmLUa
	o6S+P1N0d4GHcykMLEmPXGv8CkLIaV4dO+lHQjl+9SZWtJ83dyP+
X-Google-Smtp-Source: AGHT+IGMh9C/THGjJ9L9lzGt8mkv2YzHJOx4qROhpehEf2GFdHrOOe/Lsm/J+pCmlIYkFTF5PQZHdg==
X-Received: by 2002:a4a:355a:0:b0:59f:fc30:d3aa with SMTP id w26-20020a4a355a000000b0059ffc30d3aamr2191859oog.3.1708443786272;
        Tue, 20 Feb 2024 07:43:06 -0800 (PST)
Received: from localhost.localdomain ([129.41.86.2])
        by smtp.gmail.com with ESMTPSA id p3-20020a4adfc3000000b0059aaa2bebb6sm1388768ood.48.2024.02.20.07.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 07:43:05 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
To: minyard@acm.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	openipmi-developer@lists.sourceforge.net,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ipmi: kcs: Update OBF poll timeout to reduce latency
Date: Tue, 20 Feb 2024 06:36:15 -0600
Message-Id: <20240220123615.963916-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: openbmc@lists.ozlabs.org, Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Geissler <geissonator@yahoo.com>

Commit f90bc0f97f2b ("ipmi: kcs: Poll OBF briefly to reduce OBE
latency") introduced an optimization to poll when the host has
read the output data register (ODR). Testing has shown that the 100us
timeout was not always enough. When we miss that 100us window, it
results in 10x the time to get the next message from the BMC to the
host. When you're sending 100's of messages between the BMC and Host,
this results in a server boot taking 50% longer for IBM P10 machines.

Started with 1000 and worked it down until the issue started to reoccur.
200 was the sweet spot in my testing. 150 showed the issue
intermittently.
Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 72640da55380..af1eae6153f6 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -422,7 +422,7 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
 			 * missed the event.
 			 */
 			rc = read_poll_timeout_atomic(aspeed_kcs_inb, str,
-						      !(str & KCS_BMC_STR_OBF), 1, 100, false,
+						      !(str & KCS_BMC_STR_OBF), 1, 200, false,
 						      &priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
 			/* Time for the slow path? */
 			if (rc == -ETIMEDOUT)
-- 
2.39.2

