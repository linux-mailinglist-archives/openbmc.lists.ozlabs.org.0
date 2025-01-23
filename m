Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C8A1A41A
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 13:21:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf0Qs60d1z3bcX
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 23:20:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737634850;
	cv=none; b=XWC/UYNOrpcT3LYPg5d7E/z90dIIeKBIgn7HzxqZt6Y4cmYyWxXu9UwNlJtMbfp5uD2LvC+Bl176wAdPvVg30JBxZ67tZb3lT8O/fFs32oKZNnG2gTwC/h7+dkeMxbrXyM8h6tK/P0p4MC741h3XHfRTQLz/dGiZOq2dK6YOl/KffKSJigXBd95DDi/fej1Po2vO+zhLOPPqMJUUmll9TrWa1msPqEe1h+jmIg6bcdltZZjdlU0casM6KCXpUUJyQsdHqSpp1+4nSDr/FBXk1uMzyS+Svco6qNZNee9rFrOctrVWI3pCtdfqgPzHjW1p1jQZSbE+uUbkWCzBdAhmaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737634850; c=relaxed/relaxed;
	bh=4qYFQg17lPWWI/P3x77cxigTrSYOa7HHPOEIY0DqiMU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Me7PTbap3lzONg4lC9hu5DCcXEiSAEY/B/xv5+MQ7awhqqBFiQIErpz+dKmAZmcka1Ky5oCS21x6RgIbA7BkJ6p9cE/1kPcPzFOFKDznI9YTR0HhuSzeXsHIPwhZCVOTIQG/TKinfABjBl0P5Eoe/KFvzHSw4WbqzkOoSSMUcTNFuc8nCAW9zKyJ5V91L1NotTQzdxZVQilr4JWx8bwdW9AZtVh/NtaiQeAQBicOYAw6rK+N4+rGlf+Nbsj9M3Vth8Uue7glZzF7EgaNzbi0uy5mmqZZSWDM8VDt7jBu4cynkzhBf8IC8HBQU+cEk/mIyWdIcFIZZDOp9YNW4REMZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PPKFYIzT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PPKFYIzT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf0Qn1SdSz305v
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2025 23:20:48 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401be44b58so991159e87.0
        for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2025 04:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737634843; x=1738239643; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qYFQg17lPWWI/P3x77cxigTrSYOa7HHPOEIY0DqiMU=;
        b=PPKFYIzTAhyvCLAEgM8FDLKceKQWANf9qi3PaLk38SmI/yVx6lzZ4rOLavBAr2vy8B
         Pc3BgUWa+OXfQocmRIkQM9GMvLyGINMe1ba976stBhECG+rA2kPobcUt87RAgpGc15W2
         tl8Pw/7iujvB2h1bBsXPWWPr6jNea3lY5m/1e9z6S/DMOD27+TIJFq6y8dpPogy2lVX/
         Et4m7UtGH8Mx0dlaQ1qLfn920sxbJhuFp8iZpDftm2rAKV4+tEFbATz5VBKq/SJQgANH
         izsFqiuVvoD9m0EfriKBF26XC+NZU0Ky9R00qP78rBmPLekBZOMPHQsWdlgv/bBoHtSd
         Dj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634843; x=1738239643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qYFQg17lPWWI/P3x77cxigTrSYOa7HHPOEIY0DqiMU=;
        b=q9ZwMXOdCoOUOO7YwAkmqeSi7Upk3UlntevR/oe4lQw66XUu4gQJzrbgWpi3CdB2xQ
         eFA6Vr0/YCSZ2y9AUPhFi3GC//yQ+j7oUNoqfd3GycISV3ln8SaO5O52JKQ6Gn5ujRIc
         kjZVpoAaIzAShgD3n83pgy1G6Mpe+s/nmHz1zMv1mKiz1QvYj15yM3MtdJwlkgkp56/P
         qdyWKxpeqXfrGv3XPRhevjVfgdFCvQPA/avJJ8DdlOMS1xPQ3ERe1UYZvBfDjfwzYTa+
         ORn7uRnm6vAn/TqDqptqQiwYFuqUmRgF9sbF/QgWURmy8f0yCiD/6/TtZymVUr85Tnc+
         Myfg==
X-Forwarded-Encrypted: i=1; AJvYcCXWEJ1jpMVAi2yRRScLD7Y0dk+VzPni5znjgoggVwH2Yp2rCjNKw+SGZy79pwGXpss1vC7kugAV@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxt18brfgoGEH0ddbaISSvXx641crpHKWGY5AtwfQ8ygGT9Mjb8
	Pmq2Tm/QkylEin0rHQfsnUoE4o+fyC8BsjkCosfvtRW7j1Kj4tgB
X-Gm-Gg: ASbGncuMdse0TP5t5BxuxcmnbBE+xe6wQmMcCEy8W+naKIp3cA+Mr06WLKLY81lYCnR
	/wp5oMWRBbQtRYqSsZl4GRPrSWwg5tYZOAd+DolwgizVW5oA5FLg7xDrCBFBiuFhnGofpMhmPuM
	+pZmb9AsNTtlYd7H+QBVT5fqKNzx48sO21u0bLjLG8dgX2QNncEtoo83xAxE23PUjmznk5O29aY
	RrGqM49HmnFJrO5IaXOyRLoas4gFFvl3YX6ABsoG9lNudrytdSCrX0AOwMHVSAVswpPvtWm+S1l
	DEkkWq8DmR0UIGwAxvI=
X-Google-Smtp-Source: AGHT+IFh/38xtOnDXSxnSHxS0Vf37RqJLjOETl12HDi2Hz14nXUfDH/FUeDLCk7E7rFbZ3IaOP/JsQ==
X-Received: by 2002:ac2:4c56:0:b0:53e:fa8b:8227 with SMTP id 2adb3069b0e04-5439c27b239mr10309500e87.45.1737634842696;
        Thu, 23 Jan 2025 04:20:42 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78febsm2604588e87.248.2025.01.23.04.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:20:42 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 50NCKbA6006054;
	Thu, 23 Jan 2025 15:20:38 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 50NCKYtm006053;
	Thu, 23 Jan 2025 15:20:34 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
        Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds data
Date: Thu, 23 Jan 2025 15:20:02 +0300
Message-Id: <20250123122003.6010-1-fercerpav@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, Paul Fertser <fercerpav@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ivan Mikhaylov <fr0st61te@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When an Icelake or Sapphire Rapids CPU isn't providing the maximum and
critical thresholds for particular DIMM the driver should return an
error to the userspace instead of giving it stale (best case) or wrong
(the structure contains all zeros after kzalloc() call) data.

The issue can be reproduced by binding the peci driver while the host is
fully booted and idle, this makes PECI interaction unreliable enough.

Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
Fixes: 621995b6d795 ("hwmon: (peci/dimmtemp) Add Sapphire Rapids support")
Cc: stable@vger.kernel.org
Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/hwmon/peci/dimmtemp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index d6762259dd69..fbe82d9852e0 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -127,8 +127,6 @@ static int update_thresholds(struct peci_dimmtemp *priv, int dimm_no)
 		return 0;
 
 	ret = priv->gen_info->read_thresholds(priv, dimm_order, chan_rank, &data);
-	if (ret == -ENODATA) /* Use default or previous value */
-		return 0;
 	if (ret)
 		return ret;
 
@@ -509,11 +507,11 @@ read_thresholds_icx(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u
 
 	ret = peci_ep_pci_local_read(priv->peci_dev, 0, 13, 0, 2, 0xd4, &reg_val);
 	if (ret || !(reg_val & BIT(31)))
-		return -ENODATA; /* Use default or previous value */
+		return -ENODATA;
 
 	ret = peci_ep_pci_local_read(priv->peci_dev, 0, 13, 0, 2, 0xd0, &reg_val);
 	if (ret)
-		return -ENODATA; /* Use default or previous value */
+		return -ENODATA;
 
 	/*
 	 * Device 26, Offset 224e0: IMC 0 channel 0 -> rank 0
@@ -546,11 +544,11 @@ read_thresholds_spr(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u
 
 	ret = peci_ep_pci_local_read(priv->peci_dev, 0, 30, 0, 2, 0xd4, &reg_val);
 	if (ret || !(reg_val & BIT(31)))
-		return -ENODATA; /* Use default or previous value */
+		return -ENODATA;
 
 	ret = peci_ep_pci_local_read(priv->peci_dev, 0, 30, 0, 2, 0xd0, &reg_val);
 	if (ret)
-		return -ENODATA; /* Use default or previous value */
+		return -ENODATA;
 
 	/*
 	 * Device 26, Offset 219a8: IMC 0 channel 0 -> rank 0
-- 
2.34.1

