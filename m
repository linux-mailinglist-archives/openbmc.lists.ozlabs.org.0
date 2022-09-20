Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82E5BE2B2
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 12:09:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWy1l1qDDz3bSS
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 20:08:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=GabAXFzp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=GabAXFzp;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWy1M1NGrz30Ly
	for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 20:08:36 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id q21so3039664edc.9
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 03:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=TgOL2IZr1szXVcdwA26QqZ1KFmgAO56F4GypKNOeRxw=;
        b=GabAXFzpxLXMdFnco3XY+azdOQG+0IRiAwVmNht731rkcIiC8LwG69Tr7VKOBx+E3C
         QG8mEdYqdtWnZyYDyuJtz2iJAUm0HpwZHaOXX9/qBfZejliu3uIT4oD9VRKtJ0rAiNTu
         3yuSzWrfqy7heDgPXXbjTjD1XKdJ2i7zSe5QF4YfPkR2CmNqeYoO4wfRSs0vJe6nBUUd
         CCqJ3ZZ1TI4CZr8gJNrIGITTtSyJGUM1dO9PE5On/XtjIi1hBbInV4YlG6m/8ACzw9Q4
         PthQnVSKmZhU49AUXlUnxlTtlvMCQ1lUNnrT6UxK0UqEquCeeybtVCQtVD35bHv4sXuf
         cUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=TgOL2IZr1szXVcdwA26QqZ1KFmgAO56F4GypKNOeRxw=;
        b=2BbhYtgt3L6+yP3uXUDnBgtBblTLPaYH6GqVzMumYvDC/O+CfCDINLiHPg8Y2htfT/
         XAsM+Pnfac02fWMp6IcObyGg2bCfLVtA1iN3vGP//S5hJcL69jhAY7pcCw342pWTJqmZ
         Wswadz8yWCyyTHpIkKkv5THZbet3b18fVqVbAq2J03/qMbh3O1ZDDaZoK94/RE6nd3n8
         n2WDk2dGlMwV0ZdtBDgDye52dchRbFYynggqXWePiEIsK0VbKeung4I7FY4JovVBMGl5
         072/um9s6k6yb9gzELWuPXCyV9ZUm0+xWV5Hj9FWKa2E0rmMhI8xYVI54kLgjVSg7opU
         MgdA==
X-Gm-Message-State: ACrzQf2VxjWqNTrNZDR5UItzae4+imlYkB2CW8KwJ3x4073IfJ6xZqYm
	O3etyblVNZG4QBwTEL7ML1AQfA==
X-Google-Smtp-Source: AMsMyM4keOON6GtacWri41bKspxRILcGSprdOKpzhtxYZVXvsL35mJtshrGVxYscePXgJPy9R1yvag==
X-Received: by 2002:a05:6402:401b:b0:453:f519:94ad with SMTP id d27-20020a056402401b00b00453f51994admr9474784eda.144.1663668512729;
        Tue, 20 Sep 2022 03:08:32 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-094-114-232-236.um31.pools.vodafone-ip.de. [94.114.232.236])
        by smtp.gmail.com with ESMTPSA id fi19-20020a056402551300b004545287d464sm993475edb.14.2022.09.20.03.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 03:08:32 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v6 0/2] Add support for IBM Genesis3
Date: Tue, 20 Sep 2022 12:08:17 +0200
Message-Id: <20220920100819.1198148-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.37.2
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
Cc: andrew@aj.id.au, christian.walter@9elements.com, takken@us.ibm.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v6:
  - Clarify UART5 rerouting only affects the console

v5:
  - Rename Kconfig and don't depend on ASPEED_ALLOW_DANGEROUS_BACKDOORS

v4:
  - Rebase on upstream
  - Drop defconfig and add it on openbmc instead
  - Rename Kconfig for debug uart

v3:
  - Drop FIRMWARE_2ND_BOOT patch
  - Include reference board DTS instead of copying it
  - Rename DTS to ast2500-<boardname>
  - Describe defconfig changes in commit message

v2:
  - Fix whitespace and compatible in DTS
  - Remove board stub
  - Improve commit message
  - Rewrite FIRMWARE_2ND_BOOT support
  - Update defconfig

Patrick Rudolph (2):
  arm/dts: Add IBM Genesis3 board
  arm/mach-aspeed: Add support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1

 arch/arm/dts/Makefile                   |  1 +
 arch/arm/dts/ast2500-genesis3.dts       | 28 +++++++++++++++++++++++++
 arch/arm/mach-aspeed/Kconfig            |  7 +++++++
 arch/arm/mach-aspeed/ast2500/platform.S |  2 +-
 4 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2500-genesis3.dts

-- 
2.37.1

