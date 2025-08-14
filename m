Return-Path: <openbmc+bounces-450-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE14B25F44
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 10:43:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2dz92pJNz3bn8;
	Thu, 14 Aug 2025 18:42:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755160949;
	cv=none; b=mn5qAihiTSwVy2lqBjS+7AAUQISD/q8J8xbEgO2m6LmFpa1OLi3SAhUAcKrlUnYrjuc70jvJQN14MzT4Jy/XJOu1ni7GRr3qKrQSmncZ5okkR8DWEwlXCRNTO8Pd+kOALlttZFLzirn0tr+LJsdxXbBH/Wb+4meWIPJxztjOek4nb6lJBac73qcTNg4Lz4Xi4Czi75Y22/KorlBohX3YivyublzE5LwikkZ+hZCdEtjI9Pc9avoe27ym/Y1zRhlr9wD6XmxRvUki8QVsduHEzTnoo6YPzSy7Ark8YWloRzsRMHELbeXRsWA5zqWT2tzzCt2OK7QweE4Fb6p3awPq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755160949; c=relaxed/relaxed;
	bh=3MIDNnIwbSHuzGfQVuyM2agKWSWdZtsoAJRl1Qc3beg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ooFJlFYiBAmEHI+npCSyLr39JPzclVf74YMn5qPusxftQZP3w65pT0baQyzYH3vFYTCa4mFsh7IXC9gm5sGyZjZCNdr2TUlmqXMRl/AYkr4RDS7kPsBYI42V3nt6OtaKAF8Pfc0+j/LTeeUeBpg2A0iP0aBPSdqRO9N6yr2eo2xEtm816kv2WtU1EDr7jFSfWndoVfCKYjlnlbJ8kKVMzEr/+yH4UBL9f7Bn5MLAXyNdI8gY1dS3jC90G77FLg/oOPYeZ2WVbTFo0cUYHOJLbyXtUdS3GxheS1OPUE+pzQoDji1R0Jr7Em73OHpsgF2U/0luU99V4iwncrSB7bFTHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hHYdxmsH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hHYdxmsH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2dz83dzRz2yhD
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 18:42:28 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so4024645e9.1
        for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755160943; x=1755765743; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3MIDNnIwbSHuzGfQVuyM2agKWSWdZtsoAJRl1Qc3beg=;
        b=hHYdxmsHgiBwBfwqnVW6wmN9HyG+NcwQYxfL2oblEgvbNQb3eQHAxLWvxP7N6CqNpQ
         VlbR0OQKEvNSsYwBatcRYTnHFnlCv2uSdH+mHmYmTExuOtBAqvsjBvsY9EzjmhkRKbt8
         aNCXxTirfeD2Q9C6JFSj8hZQ99hijqpfjFHj9/i4wwNXLs9ObcMvTYEUYQjn0d0825pY
         wLfODpdhKYagXB/2cxqTbAi4ShTY3zNNMR1EETiNpqD8Zih1WgGbIIEv+FuUwbJyiz8P
         MpQG5L++FXGofsajzapoKt4R6n1LCU9lhOi6EnruY+8qLzSMviuTkkjLMgEBCGPtaC0q
         0Gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160943; x=1755765743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MIDNnIwbSHuzGfQVuyM2agKWSWdZtsoAJRl1Qc3beg=;
        b=C762g7aiJU2yyK5UOgt+4QXmQx7f7E8mXzsiqLP+XBCjfKSd5GU2j0+TzC5Gs88guM
         r9lKVPaPOPsovxl26e2W2c4ntHeEJl1IJDD/+V2hY1jvM8hJiV3vHn58tSEZEiRwxPa8
         CvzB/Ju7krjM74AUQFkY0Zh+v+kAg0VxDEBgUA23LcKeP2TvSCucWSYsUE04H+fPXQGS
         VTEZd3OWl7QrbEDGhSFa27qHHm0Hy5CfTC1i0mJpYevo85x5+8PRhpFF/O/rklUNgtWf
         ZwRRQpsGkc2Fec6vjdUsgEvWKbZ4C6oEacbfVjvFjYq0exAVIxKnWN720Txdfbelg9me
         B2Dg==
X-Gm-Message-State: AOJu0YzASb1DBlTB6iv3IPiu++uLb5+yoBuWhsURZVjjPKXox3Q69HYf
	0R1Fr2HddKWbvQt5qTrRp9AiiX0+h94K4TWtRxqhoRC09r94lGU71TOK
X-Gm-Gg: ASbGncviwgIvM6pXFD935Gx+sTjX1sUMGHvBnLFpHLciNe6ZgMzTnmfgp64uKSdbt2C
	EIpROGwNaWdSuN1aEHGpVGZY/a5SYO9qEiWf/HSwNKEWP5VNYAkw2oJhryOG/kmb34/0Y/MBC31
	NgKzzph4G4uQ8TQ/AKNIUVDeTv8tEMPTgT9rdygtdHmXz/2Gpq2m9L4TNse3v45j1BC8DG3nSi7
	hze39pzRavNrgFQsSq7k6UWrhZxD4tbZsD0lEtvP3yA036A8DslmU3Sc1+iZQQzaBojOa2EFNs4
	if+eb8xMXT8USZBQJBb+doojXLgWf3RDOYp+p5LDjW2lApNBOox5O56QpIe28EREmj4uBIG9Us2
	n5GllB2aJDucMstubnFBgIyuplhdK1MzAAw==
X-Google-Smtp-Source: AGHT+IEgtdyxJulbukB6J1T/XYYBOj7Oz9S7GIuzZlCe2tyon9JMR3MeOA8LItQkTqLR1PTkqWrZDQ==
X-Received: by 2002:a05:600c:3b1e:b0:456:1d93:4365 with SMTP id 5b1f17b1804b1-45a1b611565mr15680395e9.5.1755160943207;
        Thu, 14 Aug 2025 01:42:23 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6e336csm13114565e9.16.2025.08.14.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:42:22 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	joel@jms.id.au,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 0/2] NPCM845 reset and clock device tree updates
Date: Thu, 14 Aug 2025 11:42:16 +0300
Message-Id: <20250814084218.1171386-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series updates the NPCM845 device tree for the integrated reset and
clock controller using the auxiliary device framework.
Patch 1 combines the reset and clock nodes into nuvoton,npcm845-reset.
Patch 2 adds a 25 MHz refclk and updates peripherals to use it.

Tested on NPCM845 evaluation board.

Changes since version 1:
	- Tested in version 6.17.rc1.

Tomer Maimon (2):
  arm64: dts: nuvoton: combine NPCM845 reset and clk nodes
  arm64: dts: nuvoton: add refclk and update peripheral clocks for
    NPCM845

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 20 ++++++++-----------
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  |  6 ++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.34.1


