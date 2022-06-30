Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 445275618B7
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 13:08:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYbCy1Vsrz3bYd
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 21:08:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=UhCSl9Lr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=UhCSl9Lr;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYbCX44mGz2ywV
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2022 21:07:51 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id ay16so38302042ejb.6
        for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2022 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hdBXC8xZnYJ6R+JztCH/OwQPymxeb4yJg01zGc7n6bM=;
        b=UhCSl9LrxyVdxWe6Mc5FUF9y/mhIdaGZil4hNyiOHjNE2mGC4rYT83I7p1b1fLVBi6
         gDgLMOXFtkYrLDCixbm4X/pB9jc/Bj7KIR2fQ6jQOszbBbovQ92+aHoxBiNWVik3l+Fw
         0vf0SSlrKc71pVAYyMQxqeJnodKvj6T4CqXM+X/1hsPm/uW1LGostuGHOc4Q25Rqwmom
         +nBCBuA5ktKRveVw2OIUh86t+/NXZanGG2tyCrOK8DFO9MajGr2oge0wiHTgGPKCamr8
         BvQx8mrn1CDu+6wszGUkLsLpgVUYITi2BWMmvxx0TUbTJrlpP7jddc94km0v6nV8sN6/
         ViQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hdBXC8xZnYJ6R+JztCH/OwQPymxeb4yJg01zGc7n6bM=;
        b=K0AQirk+OZRLhqe8dIv1f7+OAdoXX6A/auXH4v1FSzeXhaNMLzrnuPUsvYCjNIJ8t+
         L0cHhYzsbF28D811CS6ELFW8XmLD1Zx2g0wlZeRcrsS72fIRstPMCaMIKamSEOnzpNDc
         m6J2exokZzwpY5UJr854OnEluUofSH7DNE2jmmAfQO3zglnm5M3P0LS0k6xVwMUrwoHJ
         cHrdEOv9s/O3m5WanRn/kRNUelJ00L5fUuMlrREGtL649FqYRzKiI/IuOLQ3lGiDTbK1
         eYOvRaZ54LJw8nkQDOC05B57W93Yhr9xtayG9eULr9llD28MjLob+3KpjF4Hbr8EdMNU
         3XEA==
X-Gm-Message-State: AJIora+fZUc9NP0h91Qv2tF/+5b+JVgEpJIvNxqQdG1x3QM5Sxxyscoq
	U72qPaJOvaH91WbqGEcQVig5FQ==
X-Google-Smtp-Source: AGRyM1ukjKWmNTv+XT93hQd10M5E5JRukH8T81P0JcOJxbjpsVspudKRLmYxCPykFqU55GDpowJy6A==
X-Received: by 2002:a17:906:9451:b0:726:93a8:bcc with SMTP id z17-20020a170906945100b0072693a80bccmr7994574ejx.361.1656587268773;
        Thu, 30 Jun 2022 04:07:48 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
        by smtp.gmail.com with ESMTPSA id j20-20020a056402239400b00439645915a4sm174594eda.49.2022.06.30.04.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 04:07:48 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 0/2] Add support for IBM Genesis3
Date: Thu, 30 Jun 2022 13:07:43 +0200
Message-Id: <20220630110745.345705-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
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
Cc: christian.walter@9elements.com, takken@us.ibm.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

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
 arch/arm/mach-aspeed/Kconfig            |  6 ++++++
 arch/arm/mach-aspeed/ast2500/platform.S |  2 +-
 4 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2500-genesis3.dts

-- 
2.35.3

