Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A54F53592C
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 08:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8ZJN16KGz3bkl
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 16:14:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JUte5ROe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JUte5ROe;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8ZG36Cp3z3bn4
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 16:12:11 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id i1so3310520plg.7
        for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 23:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZAlldb2wH2bL38lLFGDzvhlgJH9fckgtEngrU/7mnKQ=;
        b=JUte5ROejFtPr4qcj9S5BngrYLpd98aiXliHpX+d4/ctRXhVkplCZ5C+ILFzDL+OeB
         StZwgR3GjGUh/ikekEYPkxByrC+khZUXMQ3aSqK60yGXDD/oZWEGGKVn9R9atD9z/PRp
         14JU7/fCj/sAHJqDdJ/gG9TUlWpdYkOSXMC2iNk6y+Afb5XDfLDlA5q4vS6b9fmn7GNW
         16rC9PBNdA4HXVKH682gwJu42pn7ac9hChjE4dTKjDO0lB6qOWNsEQwxDaOxjWMW27lI
         QOVz4ZZ59xFGbmXPF4qK79HbsHS7CFUuMQ6lpiqlyLQM43WjrksO2DMH/HDQSwcBeCDv
         JeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZAlldb2wH2bL38lLFGDzvhlgJH9fckgtEngrU/7mnKQ=;
        b=JDdcGo2wBbydAlarNLbe+niKuNH8o5GaggqytUInjd62MHPeaC73+8SU2U0BQjbGqG
         ctb5hPR90ofWyBeGw29DP4AMfHS34/3WjM/Npu5k4LMat39aN23oFUVs4fR1TyDw2nrh
         U+Ox+5b0n+rEMwt5TM/2dHKV7gYOQL57DEaSm87nJrBdGIAT2gb11PKGFb11h6CItdrK
         v2G9l2dI0/nP0+a5rZVg/J+sf4hSx7QKI+K7SAYooBVD/QpliFXSDRHEY/9JzWqmV5QN
         k9M9BxXE8jMhG8aauRoVtczGvbk/VP01J3Vda2d6ds9lUw6jSGiu3/rhgo/AVtB0dvEE
         5reQ==
X-Gm-Message-State: AOAM53157oUtB5+B3DBzcA1gx3vO/Sdh4v1/toT89bT7WhM00whOC50H
	+T0H9PFVnz9YxaeLqsMhnNo=
X-Google-Smtp-Source: ABdhPJxey0GCdTYlVG9dNz8UlMSy7COIPK6OHN3MZarfjSP3vxb/SqLZLCqan9vfGYZy4t/qM5kqXw==
X-Received: by 2002:a17:90b:3192:b0:1df:7b5a:2047 with SMTP id hc18-20020a17090b319200b001df7b5a2047mr6601246pjb.138.1653631931252;
        Thu, 26 May 2022 23:12:11 -0700 (PDT)
Received: from localhost.localdomain ([116.89.143.231])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709027e0a00b0015e8d4eb2c2sm2636306plm.268.2022.05.26.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 23:12:10 -0700 (PDT)
From: medadyoung@gmail.com
X-Google-Original-From: ctcchien@nuvoton.com
To: rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	KWLIU@nuvoton.com,
	YSCHU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFTING@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	ctcchien@nuvoton.com
Subject: [PATCH v11 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Date: Fri, 27 May 2022 14:11:48 +0800
Message-Id: <20220527061148.14948-4-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220527061148.14948-1-ctcchien@nuvoton.com>
References: <20220527061148.14948-1-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Medad CChien <ctcchien@nuvoton.com>

Add memory controller support for Nuvoton NPCM SoC.

Note:
    you can force an ecc event by writing a string to edac sysfs node
    and remember to define CONFIG_EDAC_DEBUG to enable this feature
    example: force a correctable event on checkcode bit 0
    echo "CE checkcode 0" to below path
    /sys/devices/system/edac/mc/mc0/forced_ecc_error

Datasheet:
    Cadence DDR Controller Register Reference Manual For DDR4 Memories
    Chapter 2: Detailed Register Map

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f832e6ed4e5..8919fb83f485 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2372,9 +2372,9 @@ F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
 F:	drivers/*/*npcm*
 F:	drivers/*/*/*npcm*
+F:	drivers/edac/npcm_edac.c b/drivers/edac/npcm_edac.c
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 
-
 ARM/NUVOTON WPCM450 ARCHITECTURE
 M:	Jonathan Neuschäfer <j.neuschaefer@gmx.net>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
-- 
2.17.1

