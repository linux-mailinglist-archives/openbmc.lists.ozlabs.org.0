Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DE53053F7
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 08:09:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQZV10FrbzDqt3
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:09:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B8le7lRp; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQZJm1chhzDqlg
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 18:01:28 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id y205so594475pfc.5
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 23:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G1wNjzwP5xa5yI8on2PGu06TCQVFNty14BvfZid0RU8=;
 b=B8le7lRpQIvg1fteHXBUUOA8SqMT1lrDycNF2Jhg6bsenaNJTrLo4W6vPHMUrKJ5Ie
 x84+CRA6KnMRkmaXKbgPauvypuBTSLj/kmOs5pDg9q9H0iRWzcVCYBoUCYGvhE9hpiFH
 xyQOG6Uqv39Cnefq7oC12heazPZMCScSOEz8eQCk++SQjkbCUZAy2jEvkdJG+VfzVA1x
 T2AM2gqYVZvyUXmL9R7VAJ9oklkno+q62bTvmHwYMrkKjienY3jdW2ASCYLPRORfec4g
 qXRKMaq5R0LiDuZjAMXOJMFpKNLK4B9z/i/fmSzZPHwb7IKybX5UKsLFuU8++IfluNOv
 dcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G1wNjzwP5xa5yI8on2PGu06TCQVFNty14BvfZid0RU8=;
 b=joqVrUzpCieN0Q6weBPWT69UAINEEHI2t4mmDItAV4+Z9ZtbB1n3Glai0yoUxPqBYA
 GUe2FqOTG3/s7E2wTEZtmEvskFqEJzEz7zeoPab/kt1hcfbBZVFR0wfGV7FIP+xTdqWi
 xqmILCpjjnQlXwQkv0bWT5iPSGfM6Wzsl0qgj3S2BfrAQYFXDXehIyvz13p59NewwsRT
 XK3/6YUX4PqJ+02LaC50i/AJFFLkymKvC8MICfF6MbMeNteI1aL+4g6VK8pVlUfbGS70
 P+txg/OX1QpjKBFmDXamvypsM9EhmcrjBh8zUO9nv25XG4wjYC2FhzPJJnXwSfP1s0Dl
 idGA==
X-Gm-Message-State: AOAM5321T8azJjzqLFAYfKxGA1wYUBgl9zzXrtqy+Rrihh2zR19fT1pu
 nU6zCIZHAtvxPypeYk+gGct+D2Lt2m4=
X-Google-Smtp-Source: ABdhPJxsdbPevS1fVi5tn2V/kMOd+ZkfIM00r9OL3qX4ckwm91IhJJ3wlsf3/L5T0Xhu48wCDdmyHA==
X-Received: by 2002:a62:6d06:0:b029:1a8:4d3f:947a with SMTP id
 i6-20020a626d060000b02901a84d3f947amr9216518pfc.6.1611730885306; 
 Tue, 26 Jan 2021 23:01:25 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i1sm1258315pfb.54.2021.01.26.23.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:01:24 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 5/6] config: ast2600:
 Disable SPL ymodem support
Date: Wed, 27 Jan 2021 17:30:53 +1030
Message-Id: <20210127070054.81719-6-joel@jms.id.au>
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

This feature consumes 3656 bytes. Without it systems will need to load a
new SPL over the UART with the AST2600's recovery feature if they flash
a bad u-boot proper.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 3f2de64e077d..c55a70c5c1c9 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -55,7 +55,6 @@ CONFIG_SPL_DM_RESET=y
 CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_RAM_DEVICE=y
 CONFIG_SPL_WATCHDOG_SUPPORT=y
-CONFIG_SPL_YMODEM_SUPPORT=y
 CONFIG_HUSH_PARSER=y
 # CONFIG_AUTO_COMPLETE is not set
 CONFIG_SYS_PROMPT="ast# "
-- 
2.29.2

