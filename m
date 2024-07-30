Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6970894237A
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2024 01:38:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fJ5DoPor;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYWrk2hWLz3cmp
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2024 09:38:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fJ5DoPor;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=stanley.chuys@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY4tD6Mbbz3cLL
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2024 16:23:31 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2cd46049d2bso721644a91.3
        for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2024 23:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722320609; x=1722925409; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=th98G71UmuIDtb5AqWWYfoRL34Fv/S3Ju5bvLZX+AwA=;
        b=fJ5DoPorK6QSvDZNCGL6w7xgfOzRgAGH9YcpI10V24tXDhhCVNNSH7TDoRsyHQAY74
         RMW2Cx8vIS4Qn89sXBW56qPWNaQl9D0SpBqrxunAg23Rs76IOferLzgRHY14FFRly/p/
         kR+a/2E00bBjwmmm8BZv8blJQ4APPODlTtdfk2LJ9nlacpSzl/AzurCIWbwvBUwT9A/A
         cgeeY9CAs3rJdZOBH4z9pW6Y8esPvLntS4K7qDASiQpqnXYfXhDkejzv/Fo5CJKow2S4
         /8V1aZPinuL/xFznttRJR98JBUOWtwnDwVO5GPXf0llQGsfA7vo6nz6uhkA4Kps4PY1P
         xb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722320609; x=1722925409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th98G71UmuIDtb5AqWWYfoRL34Fv/S3Ju5bvLZX+AwA=;
        b=JpKXv8YA+I27kad1q+e54qMXx5DrYI66kHTtVjTNH0c3ZIknOwbcipgo2XMCcvlhBr
         W/HI7s6KGFiED2J7BFmp0tU7F3RIwGuubEah/hGqeW7MkFRqZnDxIicMNKmZTkJunuKp
         Dx7rfQfdz4jvH05l24UeEsVyzcw0RUFLnrt3N5JSt44sW4+9YW4C+XnYmYPFFDCOn5hC
         BoX3HveO1AFfaetUX+cVovAPTUf/IPz8I8uIkXOMnLlZsQeY2pOZq3DMjEvddADYd7U4
         QmMsJ4mV4ZVlqC2kvsjMQ28FwJqN+rHN6bwdyTY05zJUbVPMd1WYW/vsUD1zctbbsMgM
         06rg==
X-Gm-Message-State: AOJu0YxlxExy/mM/HsSFlUpCM4rnChYUUa2onZ5QiizieknkmAeZYU3b
	60jufdLdONCeTJeKr7ZyZKRT/FUKpzr0orbtuQdDMJkszql+BnNKz/ULLA==
X-Google-Smtp-Source: AGHT+IG9oljW/Gbv5E5xNKF/xAILIM1rhA8vs0U6UP/+9NznVnpQ0QTMtPbptwAin6iljsNuTfH15Q==
X-Received: by 2002:a17:90a:a587:b0:2ca:7cc3:994b with SMTP id 98e67ed59e1d1-2cf2575a7eamr10696173a91.2.1722320608656;
        Mon, 29 Jul 2024 23:23:28 -0700 (PDT)
Received: from cs20-buildserver.. ([1.200.155.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb74e8957sm11643019a91.39.2024.07.29.23.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 23:23:28 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: openbmc@lists.ozlabs.org
Subject: [linux dev-6.6 v1 0/2] Add Nuvoton NPCM845 i3c master driver
Date: Tue, 30 Jul 2024 14:21:20 +0800
Message-Id: <20240730062122.3781121-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 31 Jul 2024 09:38:20 +1000
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, cpchiang1@nuvoton.com, joel@jms.id.au, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patchset adds i3c master support for the Nuvoton
Arbel NPCM8XX Board Management controller (BMC) SoC family.

The Nuvoton npcm845 i3c controller implements I3C master functionality
as defined in the MIPI Alliance Specification for I3C, Version 1.0.

The npcm845 i3c master driver is based on svc i3c master driver and
add platform specific support for the npcm845 hardware.

This patchset was tested on the Arbel NPCM8XX evaluation board.

We will contribute this patchset to torvalds upstream soon.

James Chiang (2):
  dt-bindings: i3c: Add NPCM845 i3c controller
  i3c: master: Add Nuvoton npcm845 i3c master driver

 .../bindings/i3c/nuvoton,i3c-master.yaml      |  113 +
 MAINTAINERS                                   |    7 +
 drivers/i3c/master/Kconfig                    |   14 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/npcm845-i3c-master.c       | 2372 +++++++++++++++++
 5 files changed, 2507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
 create mode 100644 drivers/i3c/master/npcm845-i3c-master.c

-- 
2.34.1

