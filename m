Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D6755E04
	for <lists+openbmc@lfdr.de>; Mon, 17 Jul 2023 10:13:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=MJy37K5w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4FG31YtVz2yVJ
	for <lists+openbmc@lfdr.de>; Mon, 17 Jul 2023 18:13:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=MJy37K5w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1Bps4kVdz3bTC
	for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2023 19:12:51 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso69362765e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2023 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689153167; x=1691745167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Keu0rY+gipqgw/+O2XoBbwO35AHep9g015KVBZdfX8=;
        b=MJy37K5wDhGWmO6tjYwl9vzsSW5TSHMgShH8aXlIfweopgEqSnLn3zLT1hZp00jfjv
         Z2r64qVP2V+bc7gIVWoIOyk0w/e8RKkFqk32JkI/5iWc+9kkHjHm9ln2DEMM1enmtba8
         xBUQKEjqXJlZSJtzhA8n+4VBz43UrWa6zsMdWETlgP+Y/CQgzYLaCrv9C/1wZkbtd+Ol
         b0gSzGNi259Bi29csxFk2gxcU+OhPl6oY/ag/rwDyRP2GFddK1ma+Fz0lzYT4vdxa3qW
         7ffWwssze8CPQzpkNpQTJL6QBq9mG9tRPp4StV1KHsaG90lJnbhG33IUvU10hpfzQFfl
         IV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689153167; x=1691745167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Keu0rY+gipqgw/+O2XoBbwO35AHep9g015KVBZdfX8=;
        b=KWaR4A+j0GuWdKs4lQ1L6L6nMUQjonfDBF7vUAbscMCFWZOJKWPWR4EQUHRTS7H0lP
         swFt/s9LCDMwDk9kfHKnEmwoDq6ns1Tr2f3C1EqLJH32BzHBVLQerAnm5WpRwJQ+mvbl
         yupi6KFsOxEewdOSdltfbqG3W/RXehgvgoHa6ol4ui9LjMJqmVj1yr8NltNVe4oqc3ZE
         N2fDtGrYaohsglDrg9aTKHWWM5BJguoGQYC1iKe5It3oXrNPQRC+y073pEnwWqgNYQaC
         q81OLnVI1EKxqdzcI3/qR3e733R+7x5d0vCYzbZigkc3C4IDp09N9KOPpgRAz81H3pfZ
         XhIw==
X-Gm-Message-State: ABy/qLbQ3WY9oa/rM44YJ4zx3wAsIoSjFbyz8TRjXZh9PAITzb8639kD
	S3AuMg/N32oqGvEUhHLAdbi7bg==
X-Google-Smtp-Source: APBJJlECUZpjCW7O6OJjt0u6XvJkX1VCPr/IOpCGswvLci1VXws3fwowtCSHBG395+nqVy7KjDv4AA==
X-Received: by 2002:a7b:c457:0:b0:3fb:739d:27b2 with SMTP id l23-20020a7bc457000000b003fb739d27b2mr16764374wmi.8.1689153167573;
        Wed, 12 Jul 2023 02:12:47 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id y11-20020a05600c364b00b003f90b9b2c31sm15013711wmq.28.2023.07.12.02.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 02:12:47 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	iwona.winiarska@intel.com,
	linux@roeck-us.net,
	jdelvare@suse.com
Subject: [PATCH v2 1/3] peci: cpu: Add Intel Sapphire Rapids support
Date: Wed, 12 Jul 2023 11:12:38 +0200
Message-ID: <20230712091241.3668454-1-Naresh.Solanki@9elements.com>
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
Changes in V2:
- Refactored from previous patchset as seperate patch based on subsystem.
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

