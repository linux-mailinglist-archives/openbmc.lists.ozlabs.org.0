Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B4755DF7
	for <lists+openbmc@lfdr.de>; Mon, 17 Jul 2023 10:11:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=X1599FXg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4FCz4hnPz2yVr
	for <lists+openbmc@lfdr.de>; Mon, 17 Jul 2023 18:11:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=X1599FXg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m1D3909z3f0p
	for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2023 02:05:19 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3143798f542so6416783f8f.2
        for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689091513; x=1691683513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YGMbrwgBLKOnv+M8jwXMoAH8jG/gfbhQBZp4iiCWWRg=;
        b=X1599FXgOL00p8CKDohLXF9Zr3cMKIazjOaQ+wr9ok+tpfYrW3HSzeLD+mMpSJ0TaX
         mMnlzicef3CocM5gYd0StuU7RNfloN3Zl4ZqLrExv+rUuDepUtcTazZDAEgL8hd9ggbM
         VAorHcH+daZIPqCqK7nkF/upz8zdjMz1hOsUErmsnMGZfhv6CEp2rJuYo4aC9ftjwsPd
         Oo+YJl9PUJVZ8r2POSjKBvS8gc7kGaXAk6vCCUiDug0M7e2EBDE+EQpPpBFJnbQ4CO41
         qtV5jPobJP8hL7/CeIhm9jBl5tMCbfFUoHVkY6/pPvYgKPMafArs3B7iaqDo8WMzOw3c
         jZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689091513; x=1691683513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGMbrwgBLKOnv+M8jwXMoAH8jG/gfbhQBZp4iiCWWRg=;
        b=YsWeZCZmqxG4nFMqmaqv766bxdFUazlAn2ODWv2LHy5gNrOhqr7m4sDD4C4vhL/zKg
         jPKNmsSApdqjergZupcc8PGf8DIjHRgXlCkVK8z3k0GBTXKWw+gRuJnitKWlthHx/JWD
         jTRe5TPssI19U3L4LaWams475hhrm1Sd57D2/XrQiQvPTDT+YkIrEjph9HEkO83O0Qmd
         BcYLZAk7W/iLWY0NkQhy6WUzM839tjZCyH0XKxSMuOoA+rJokWeiPNhc7mHUCrBL+25v
         Eoj0+vo5ZjKf+9Y7/sOie7yIPlCGTl6XHTmYEoroPLMpNc8s0sLSK+12bS3B08QqX8t7
         HFxw==
X-Gm-Message-State: ABy/qLYy8h1O3+fweySPka7vKd1zQwtihdtQxTMyTyb3yzkfrtpGG5oi
	vrtj7ryue+Ald+aHPl+2xmvvKA==
X-Google-Smtp-Source: APBJJlHgLwp34UlDfRu8lFzyRofn21j1gWYc7T4ZYRT5xVced3YXYwegULEStCbhjNSRooP0I+B8Yw==
X-Received: by 2002:adf:de90:0:b0:313:fbd0:9813 with SMTP id w16-20020adfde90000000b00313fbd09813mr14916631wrl.28.1689091512709;
        Tue, 11 Jul 2023 09:05:12 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id f10-20020adff98a000000b003159d2dabbasm2590377wrr.94.2023.07.11.09.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 09:05:12 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	iwona.winiarska@intel.com,
	linux@roeck-us.net,
	jdelvare@suse.com
Subject: [PATCH 1/3] peci: Add Intel Sapphire Rapids support
Date: Tue, 11 Jul 2023 18:04:49 +0200
Message-ID: <20230711160452.818914-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:09:26 +1000
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
Cc: openbmc@lists.ozlabs.org, Patrick Rudolph <patrick.rudolph@9elements.com>, Naresh Solanki <Naresh.Solanki@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for detection of Intel Sapphire Rapids processor based on
CPU family & model.

Sapphire Rapids Xeon processors with the family set to 6 and the
model set to INTEL_FAM6_SAPPHIRERAPIDS_X. The data field for this entry
is "spr".

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/peci/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index de4a7b3e5966..3668a908d259 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.model	= INTEL_FAM6_ICELAKE_X,
 		.data	= "icx",
 	},
+	{ /* Sapphire Rapids Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_SAPPHIRERAPIDS_X,
+		.data	= "spr",
+	},
 	{ /* Icelake Xeon D */
 		.family	= 6,
 		.model	= INTEL_FAM6_ICELAKE_D,

base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
-- 
2.41.0

