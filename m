Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27B94455F
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 09:22:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h0yQJN+9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZL5V0kkWz3dFB
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 17:22:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h0yQJN+9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=stanley.chuys@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZL4x2shKz30Vy
	for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2024 17:22:09 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fc5bc8d23cso3213925ad.1
        for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2024 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722496926; x=1723101726; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5saQIelnl5OO8WPHKquus0jHfZjg65IIuO1MIHrvlo=;
        b=h0yQJN+9S1W7BY5vPNL5iJmL1A5/ErjxFSuPhAcIp6voMcfEWkKKU6oo+zkDeasOje
         BbgWEApsiVLbTkZh2sQp9y7YNfud99SXQ05/HreeQ58MjFDkB8ze4xf0t1BYDA4n3wjp
         b5OQakbk/5xo31ZLJYbqUuohqVLVScU3Bta0CgUjhnN9sdXGmvo0SJrnOcje8Odkp41c
         Nh7x7WLlh5BdbuKthVRwgW16SHmR63THoaSv35MkrmU2mPP/J+Puxgsi4nbZYVdge4+k
         DuNt8TmYFs20PL7MVHTogRjTatc5Xm6rpLq8m/ScKaJaHlm8PmDj2zCCgJFicglnO1lG
         HoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722496926; x=1723101726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5saQIelnl5OO8WPHKquus0jHfZjg65IIuO1MIHrvlo=;
        b=sHEalgPg7FRF1KwX1fx05g4X6EpsICW9OO0+uIRQh4+hPBQuw/35fWVks/nIqVnYtS
         598omUYjIei6u+3XBzo0Ac7co/JJhigtm9KV7b8dh8go/8/MYz8Sf3nI4zublp1oFiKI
         bbJxh4Ci5uQwUa1tYl5Rsrte2YyW2ENNOwTFu/TCeb+DoB5qVLrtxaqrHkSY3wz0dhQQ
         hF7eyf+l4sGL8R+z6HUsdeKn8YnA28qWEE1F6Hf4Ln5YlO+wbDU0IXu+BXj8i2Vr3Uo9
         Hy/wQosEqNIMCRVs6ICEla9RXryksxC83l9+k0nU+hMFS4AUBHfVCVJmulMdZhujQEdV
         2o0A==
X-Forwarded-Encrypted: i=1; AJvYcCXW7gBmbObQztWYiFDfeeGzB7m15XImLlUvuQjwriJgGmwn6I9QEmM5hQCYgt2ECglLAyUj40Ji56NWwpnwmZBYgWZelTJCkZc=
X-Gm-Message-State: AOJu0Yw4djr+wEjPxlzJtcYj0uupQEr7djFYyV1QMFYSRyDGw7xtY2oR
	3jG7402X6VsqEdK8w1NhT9n2lwbQUmqNQi9F4zjni/+IY2QoIftN
X-Google-Smtp-Source: AGHT+IHUHvtIh/kWhOh8dQWKVm3MpKjD4RBmZA1KbW6roshsKEQC5OBsJe+hhqYENADb+J2mP+wZzg==
X-Received: by 2002:a17:903:2292:b0:1fd:a428:a021 with SMTP id d9443c01a7336-1ff4d2ee5e9mr12437505ad.11.1722496925777;
        Thu, 01 Aug 2024 00:22:05 -0700 (PDT)
Received: from cs20-buildserver.. ([180.217.140.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff4619793bsm22117425ad.120.2024.08.01.00.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 00:22:05 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH v1 0/2] Add Nuvoton NPCM845 i3c master driver
Date: Thu,  1 Aug 2024 15:19:44 +0800
Message-Id: <20240801071946.43266-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, yschu@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, cpchiang1@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patchset adds i3c master support for the Nuvoton
Arbel NPCM8XX Board Management controller (BMC) SoC family.

The Nuvoton npcm845 i3c controller implements I3C master functionality
as defined in the MIPI Alliance Specification for I3C, Version 1.0.

This patchset was tested on the Arbel NPCM8XX evaluation board.

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

