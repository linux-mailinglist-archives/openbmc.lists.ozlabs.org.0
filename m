Return-Path: <openbmc+bounces-604-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB2CB48E69
	for <lists+openbmc@lfdr.de>; Mon,  8 Sep 2025 14:59:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL6VX4PLfz2yb9;
	Mon,  8 Sep 2025 22:59:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757336388;
	cv=none; b=Bu/3ABdNAv1IhHaRx6xbVCjk34PqxmrJwW/N7t0SXJ/0W44LWFmYBbgAbt93b9Jyqi44qhPoFfrnOhPBG1vYo/uTw/TsOt6IS4wBwPmGIZmfi9BHdYjhNCoCKgyCTihkj5W2L0tweB17j7DO3gs4QtxAfLCCsmD5RDUfxLRpotBifg1FL7WyKrr0dJmY8DCKeBisrIsX+k34j43xsJRXM1taVQRIffX/J9LLfqRFjTwHcSy0Yw4jXgVTy5rwfaDBfhzGOmBwLv+zj3R7wAd+4OC659trpRDJXbX864A9kWoR81vFdaWPpo53QAH5EDT5pgtiN5cjcc7o1/dRRb5EVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757336388; c=relaxed/relaxed;
	bh=P9HAK++51pzatrkTcr67kHbvxEqiZA0dHLEsKJrNIuI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jSUD9NUThZ90PneNcNv+EZUk95tUIsUFfZpm27m5/9CL9Kwy2GCmPKBmVXOdb1F6IApzxwL2QNlOjooUoq1xZzMJ73VwuAHVaSqhVSCqnqWM0Vadx2idfO7XnKvHCDKh/BJ0Vb3YoblGz0CWwoEk1l3tSfdaxENw9T541qrHxExVT0HZ0tbOkQlJnMWnHa5VWxYLsG6Oe37zvlbV7U5pVprAjnzVRcfTvDmERONOsQkfN3Ose+iOL9RA2HnoTgzL9H7BiCx8MS9P+iNgFgCQ0q7MBpnqbB3MixwzCCgiMA9mNeWAFlfOThR20W2YjbH6dOP2PXgy6Uf/av4SQPSxRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OPX8nP9e; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OPX8nP9e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL6VV4bvfz2yPS
	for <openbmc@lists.ozlabs.org>; Mon,  8 Sep 2025 22:59:46 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3e4aeaa57b9so1990787f8f.1
        for <openbmc@lists.ozlabs.org>; Mon, 08 Sep 2025 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757336383; x=1757941183; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9HAK++51pzatrkTcr67kHbvxEqiZA0dHLEsKJrNIuI=;
        b=OPX8nP9e6HudFAElqM7kmbHtGPVXZyKCoNxD2kE3+CaHEIb3S96AXke2VNeAXcOKjh
         d1at6QF2VTzwUCmed2r4itkf98Od0UdN8uR2rxnyx+TcribFpDKlE+XY8gPQuG+j89GL
         zAMbopiKJQFaUZfE8r3rSXpooBQx0zYfF9wIwmdVIrg0sHCqn3vDYRQOm1d2oUqoSVof
         Nxdsqv0RL0RNXXJ9JrJ7HNE4vs47GyGpOtCMFzTN2eVTqhsk1iM4hHCARDQ/kMoGRXvm
         QDtNrM7s9qR+h/e74tT1IbfljLgACGEiOZd/ujNcLV7kclA8UOs37Uo3ViOstisL9i1M
         j9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336383; x=1757941183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9HAK++51pzatrkTcr67kHbvxEqiZA0dHLEsKJrNIuI=;
        b=McVmzdqh/gIs5zQPkv2TMKHu/RuN/+wIvNdw4aKpOJ33twNkR1AWi7kN1jBlbL00Rz
         eRIYUufsohZ7d9516Nym91tk01YXD96x1zjI0bAaBU5pF9GubgHzMvXFRZgG6oN9Ed30
         t335Mj8uv9j0w1pXE+JiHPsRGxbsUd9EONn3NtmeGQ6lnt6zqDkPQCNzVl1MkUxG1Bwm
         jMkRgSWxxhIySuxrHqE1V0Pu7Tn7F00Xn3dbS9ipZ8FlLu+yb4KY6nVNkKV12+HhrAJC
         ZGoF1dFhrnNiEXTQsFSug/vteLhY3GEjmKiZr/euJBdF45dujFBVpzp4B/ICxWv2P7G+
         gmPg==
X-Gm-Message-State: AOJu0YwzX4s2doKGxNG7mzOqdzoh8GvMkVtC1hcGrWK7H07a2iNttcP2
	2uB/xZiDjOH9mFiM8xAO0d2ASwkR6HrQ7UDfE8PFf1U5iKa4PVFBy6L4
X-Gm-Gg: ASbGnctIg3ipgMCkacqApthqSAEorxqKwxwmhR4yvrddDu/G9XLhWsQuRBGCI6V47/A
	uvbPj27hXS0MG/4LjXqeagcJUnCONI88rzOzQm6TsCP0gaaRFq0CeJqvZdkQFYUOZJ61/zSt4iz
	cfUwU2uvSJYMPwbuwwHZwKJi4p8hXo8d25xYJZzrBVGPZ21xRnDrGPhuMCrT2wPYaA0UN5TYfdl
	EGntGyRu9/J24cMKAjOZ9UEtLLDhc7fHUlUW4+M5E2RHmRotiASRnKkK6EJbJuPcvW5GpA3RGy4
	I27bRAKuOLp0sHx9fCFzkmw8f/I58CoV0ibugvjWLJ3ZyLIzJVaeeNwUzueix4OGUfipZm84xHs
	5nmsTaiDOy9KQqIsy2WyCq+Mx3dSgDI3d6w==
X-Google-Smtp-Source: AGHT+IH0t7fMV6CgMwj3Du7kf1S1PE57qtTFVRLfVYSND+U3dwSNX0b9nM0ZLF92ANClKZ2SLD0pQQ==
X-Received: by 2002:a05:6000:2087:b0:3de:c5b3:dda3 with SMTP id ffacd0b85a97d-3e645c9d0fbmr6697379f8f.44.1757336382785;
        Mon, 08 Sep 2025 05:59:42 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276d5816sm41260581f8f.25.2025.09.08.05.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:59:42 -0700 (PDT)
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
Subject: [PATCH v2 0/2] arm64: dts: nuvoton: Add NPCM845 SoC and EVB support
Date: Mon,  8 Sep 2025 15:59:36 +0300
Message-Id: <20250908125938.3584927-1-tmaimon77@gmail.com>
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

This series adds device tree support for peripherals on the Nuvoton NPCM845 
SoC and its Evaluation Board (EVB).
The first patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device tree.
The second patch enables these peripherals for the NPCM845-EVB, adding
MDIO nodes, reserved memory, aliases, and board-specific configurations
like PHY modes and SPI flash partitions.

The NPCM8XX device tree tested on NPCM845 evaluation board.

Addressed comments from:
	- Krzysztof Kozlowski: https://lkml.indiana.edu/2507.3/05464.html
						   https://lkml.indiana.edu/2507.3/05465.html
Changes since version 1:
	- Fix commit message
	- Fix dtbs_check warnings.

Tomer Maimon (2):
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 702 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 439 +++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
 3 files changed, 1147 insertions(+), 1 deletion(-)

-- 
2.34.1


