Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E0E92B8FA
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 14:03:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J4FEHh91;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJKQJ0XHsz3cXB
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 22:03:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J4FEHh91;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJKMW4xBqz3cBK
	for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2024 22:01:11 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fb0d7e4ee9so32329255ad.3
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2024 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720526465; x=1721131265; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0EO1i/NQIa1bCTgqCih3NwwPrnjbfPpnl2iOLhOk84=;
        b=J4FEHh91E3iNgLoTzzN4mp3/pHnKMSCUSS4kXsBTAeGrHSrouOk4U2vHET4/U5m4qX
         q5eNzg4Zj2SOQcvql2B+GvSkaz77O9MP+kB5v35FScEjWPS1VYrHe5xmTfGg3Z5IJ9bS
         YWq4oX1G4Q+fASjmy9khXi7ifM4qk/5woWovKGF13QLO3+W6zu4AK+uscIXWGUxCCa6H
         6yNS7aWmEM9mVsnx+7Yb7ZzI0afB1CozUr8iWGbtWrqBsjvht1gMImbLGNKyzBOO6GhC
         0BxVCJu48Hrw9EnOvVe99M508RHTqTrJOcMxXFXK5FsXclRMzwwNY6mw/l6/Zc3/IXvp
         ki0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720526465; x=1721131265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0EO1i/NQIa1bCTgqCih3NwwPrnjbfPpnl2iOLhOk84=;
        b=HE133vleuxmZvArpmL6jiYOeVsr7upUlC6c/xPRUCs0wxSKihsIfp0GhvVJOSX3ncg
         VNnNJgJHIzjdEcbNk6Xd9A1ReQ0lBR8/QDyybylgMxuiYMvIDSs854D7uqSf/YWjqgaA
         opUVjc7WT0DdMPsB/QETYfi7h8AhgWyDZdXPzYFPmUOOJoha0C2+I7RggjNQXDZfTAEM
         uA7wacy9I7DNN9r7aMprpCyrMP00EtIe0amx4PFPIsf1u9+vdTMbMMoePnFwqJxYZcNM
         s2Xp71hvHRWn2Y/pXbSqmmbFwCJANyNOpc+jFMxB/y4cgGBP3EAUtiJAqr1sOwahyC3E
         UwPw==
X-Gm-Message-State: AOJu0YybJHMum82TYqA749mb42qynfMLdCxJc4068iLHGKCpez5tfk7l
	1JZg8RoSWZnf7V2N4MXlRIWu0c3vtAeK52NsrZqQkb2TIb9IR4ek+wIReDsg
X-Google-Smtp-Source: AGHT+IGmhVlwMbGZLIzEKPb0Kz0zqZnu8nTB8LhVJ96AnGR1AuQ39/9SzfRNU9Rtbevl8CbTBpM2jg==
X-Received: by 2002:a17:902:dacb:b0:1fa:a03e:349a with SMTP id d9443c01a7336-1fbb6ee1e59mr17915165ad.52.1720526463028;
        Tue, 09 Jul 2024 05:01:03 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6acf780sm14495165ad.252.2024.07.09.05.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:01:02 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-6.6 0/2] Add ltc4286 and ltc4287 driver support
Date: Tue,  9 Jul 2024 19:58:53 +0800
Message-Id: <20240709115855.17623-1-potin.lai.pt@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Backport ltc4286 and ltc4287 driver support to openbmc linux.

LORE Link: https://lore.kernel.org/all/20231123015440.199822-1-Delphine_CC_Chiu@Wiwynn.com/

Delphine CC Chiu (2):
  dt-bindings: hwmon: Add lltc ltc4286 driver bindings
  hwmon: pmbus: Add ltc4286 driver

 .../bindings/hwmon/lltc,ltc4286.yaml          |  50 +++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/ltc4286.rst               |  95 ++++++++++
 MAINTAINERS                                   |  10 +
 drivers/hwmon/pmbus/Kconfig                   |  10 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ltc4286.c                 | 176 ++++++++++++++++++
 7 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

-- 
2.31.1

