Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7697F3E3F
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 07:36:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iXVm3RCQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZs2j1KGNz3dBt
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 17:36:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iXVm3RCQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZs135n4Vz3cCh
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 17:34:47 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cf52e5e07eso3986895ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2023 22:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700634879; x=1701239679; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2Hf0WGMDXuTlMd6ayziR5b897aMIPHYGGKJpai0lqY=;
        b=iXVm3RCQCuyvxaU6TPx92pa4aMbTS3C2hIf7sQMY0xTz+ztQ4f8dXf642NZMA3G3J0
         /Wo693pzh/zqVzO3OnUuzUcPtJVcCqcEeRQIdYvAMXkU4dNocoJDf7X3Kr7Jzcl2FQmT
         aCn8FfFg1akIZUEnxXJ8guVzSjBBvm99OBXrT2r4rV3b5x21khquuD6xCdDvYE9NqQKn
         ZenUk03SQOWLeaebmlX8I9DPZmZzbtJUbPDNo4ESt7qEK2uzAAwUagypc89z364sOejc
         EOol7QDwfbY/9R1DXe0Me+8rs/eMuv9WOiL4FpTlph77mEmFrYEL+MuLFm5YRycSFU1l
         ZZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700634879; x=1701239679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2Hf0WGMDXuTlMd6ayziR5b897aMIPHYGGKJpai0lqY=;
        b=DS6EUPP6SybS2laIYBYKnTWThS/qJOUkWr6bDGcCKg7F8Om/4lNTvTFd0isUd+Coqt
         duqJbSLQ6P9SYnldYGfZcDU3CTr2B9TyZJKTL+nTvgC4DKBbo6zcnQiXUVBL9UcllDdA
         BJHuLTFabc7i/S1K2RG4vKg2ljVND9xIs2VSoegmuQG2ivIIGbm/Sj1t3jCTok19UiJr
         +Jwr5M2ivb15yHTfFGr+4kBEHL4wG2zUlGSiw5vlaCDeZZyPnIDkmzkiFQaefu1VEQtF
         8kkfIi7kK4BGFWY2nCADDSQpiiGJqMlFr91Pdaj7G+tZb/fS482tcDmMIOOwO8aU9+ZP
         glPw==
X-Gm-Message-State: AOJu0YwqjeByjCfCqUcqiiqfWEetqmfGK4gM/wHRX3klxFMikmNAPWCW
	//X41jZmWxwwwQoXQmNUoTcdrVqq5+s=
X-Google-Smtp-Source: AGHT+IHvHgp2jEZOgcfGVQmlIS6XpvPXIrW4chOK/c05pxkAIuDWtF9o6dT1D+03RMPJ7JjTFQ0pxQ==
X-Received: by 2002:a17:903:188:b0:1ce:b83f:bd0c with SMTP id z8-20020a170903018800b001ceb83fbd0cmr7857473plg.7.1700634879337;
        Tue, 21 Nov 2023 22:34:39 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b001cf76664db6sm962714plg.309.2023.11.21.22.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 22:34:38 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.5 0/2] hwmon: (pmbus) MPS mp5990 hsc controller
Date: Wed, 22 Nov 2023 14:32:26 +0800
Message-Id: <20231122063228.4037027-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
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
Cc: peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add MPS mp5990 hot-swap controller.
Link: https://lore.kernel.org/all/20231113155008.2147090-1-peteryin.openbmc@gmail.com/

Peter Yin (2):
  dt-bindings: hwmon: Add mps mp5990 driver bindings
  hwmon: (pmbus) Add support for MPS Multi-phase mp5990

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp5990.rst                |  84 +++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp5990.c                  | 177 ++++++++++++++++++
 6 files changed, 274 insertions(+)
 create mode 100644 Documentation/hwmon/mp5990.rst
 create mode 100644 drivers/hwmon/pmbus/mp5990.c

-- 
2.31.1

