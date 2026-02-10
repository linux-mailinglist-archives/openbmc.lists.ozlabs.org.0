Return-Path: <openbmc+bounces-1346-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFCCA/s0i2myRgAAu9opvQ
	(envelope-from <openbmc+bounces-1346-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 14:39:07 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8A611B4A3
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 14:39:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9N2D17YDz2xN5;
	Wed, 11 Feb 2026 00:39:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770730740;
	cv=none; b=Iv4jjpRN7oooeplhN74MTiGyxD+GfK63Bfba2qYQTUz4qVtetb3A6GtD0r3rtvnXdY3rcjukoc4zdlXYHrjXCGjnuqT1hWectqfGopexNB2P94z51ZcizGGU06aIzFgul9GioEoP9JQzmVgaEdJdSBbCttbkXLQH8kCfYui+ClseZcaEkFxyp83AESFVigfTKkV8fg4ENFHKzTfeXbVbYxHe+J70HzYIah2N0X5DA68IB1TBA1lAA4qygO5jxGdUnWa3SAb1biaA6Kh9G2VZN1WtJTYDGV4fiaGtDtUMj4oES7eJVESuUPn3nxMl8wZNkWMcNhVNyqkPp5IXgsCoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770730740; c=relaxed/relaxed;
	bh=3C+qeBfFCnkgIVyeJUvVd06s8dBHvEo1iIcon3aaEiM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K0dIgKtNstrMtYCHyOTwWe6fi2c5keLB5v41wZ+gZ5juZSWsDDJGe7ZHkSkJHH2nUzUV8/G6sIyD561Qmjrb3Af/L7CnUXib7xbP6hhxdhUnhj1zu6DmMr8uiI/e1Sq3htT8NVN1zPDXquSMmS6RDvH31VqPLmVqhtYOEvLKJf1c8Uc4eeoLDhe4ENdOyVWnWT4/qD4PZ1R9LYCuMBXhRUOGNKn9Nbff5pCWU8Hc8cQBY6Vx/j7de4G3fUZgk69FEvlbaWw7L2WOtbbjxQz0/JFEL8LQnSMJdCh8X5DFy4P9Cjw0N5OqlZxxSiq8UH7c0xJ2vh73i2KA/smGKwWvkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XsXUvE48; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XsXUvE48;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9N2B4P1Nz2xKx
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 00:38:58 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-482f454be5bso56162085e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 05:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770730734; x=1771335534; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3C+qeBfFCnkgIVyeJUvVd06s8dBHvEo1iIcon3aaEiM=;
        b=XsXUvE48Mfe8psMOzJ666klHVJbV933XJowj6ze2+WvPjF5Jwtts4I1D57uZcaDGtw
         DoFz5Jz2et38+bn8aTh91ROpcJbjFa+Spv/v7zLG7z2hDfpF3KmAeJvMOS5dTf21l5a7
         z20QoqWqyEpr83ZC5sLaY6gMy/kYBtTY2YWJ2oCNZgUav/z6hwpcYIhKub5UE8BTlLZy
         474G5Eh9xCo4jm+TOP6/AJCatImfgW9dACl3+8bhlh+lRuMWmzBCY6H5uvSxAQxlsADF
         knoETuBiD1YgiEaGk0NpaWVx6wPDDnVvOs4LS+nM+ldm03b3YL9XJNifT+H0bA74ZCJ+
         U+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730734; x=1771335534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C+qeBfFCnkgIVyeJUvVd06s8dBHvEo1iIcon3aaEiM=;
        b=cvl/LMBTdOCMe3vb0ymwNVt4if3Q8BDYpVNIATueorfuT4RGRpwS+53VR1ys1yfIFx
         7X7ri2nON4hTeAbgWIIJ8g7GGCySZEkss78l7bYLLf30gGJjuXgBiFDSzaKcjW6R+69j
         uk5zAy8rZ0urM+bqJAgSDIq/uYXI8LVjhRCpbeW44n2rTE6EofuleFgWAR8xb/U/ErEo
         mMnXXhg7ZSfeehF37qVKSesJtYkem40hoZFyxZejWOpFr4ih7rsBe9DDqgNZnROMR1AN
         0H55khybYbfHoYfPue9roAqW98PkKHKaL7ilr8m/bqXR+17Iu77C6R57xEylYjNSQdJa
         GDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgfLe1FeY7r7z1TDnlD9JDKMhZJTLsZyBwqVbBbgmbeJm7TH8WPS81B29pvcLYbuJDqzY3X6B5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJkw34HaROrSgxQm1xfNqelCltK05hqkS/fRUp79A8O/F7cJSy
	7KpzdYGQOKg8c/Ly6wCwywOkTs7e/Qp8xFJBdeyxGz1QAqJ+Q/wmVp/z
X-Gm-Gg: AZuq6aJ5ZxrkaQ7Wfb5s94+sRT1giEipfHj0p/KKklKhVB8UPoEtT2PY0+cfnADN3ly
	k71qjsG8Y4Z4P9Zx6eyL7X1qE0AndtavJpnMGBVzFFf6Kza6Mb9fT6ZLjx1L1waYBhyhLDtmvrY
	LYG6LYoMQXzB+cHdKiHPnwCqfYWoutBu38hNL0+uoCuPXrcLXknm2j61DTg805PxwDA7OmrISxg
	vgFKL7q4VrnTJYwGfMIlxi4n86hWANkOQQ9KWigg6KYsyBHjf098HeFMYXwzLf127UhIMboJLVN
	iwqBoYuMnUBuuiaGKzD+VBPV4FLu1HpkoFOkyFfnyzOvD46SX/9/uMTwDzGwJb0kSHo7/PlDCS6
	CT6ZSwpRQ/brT9dvqnwWSf6VVPpHUVuzv3IycWaoeqdRP21XYL6DqprFIlwuRqkBuKBRARvnd/u
	Re8etsXsaNttLHxeArw8iA0dsAT8h7C8zOuDqlPeNbvFLw
X-Received: by 2002:a05:600c:16d6:b0:47e:e0b3:2437 with SMTP id 5b1f17b1804b1-4834f6cf029mr24422505e9.5.1770730734144;
        Tue, 10 Feb 2026 05:38:54 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8df8sm66773415e9.3.2026.02.10.05.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:38:53 -0800 (PST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] watchdog: npcm: Add reset status detection support
Date: Tue, 10 Feb 2026 15:38:41 +0200
Message-Id: <20260210133843.1078463-1-tmaimon77@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tmaimon77@gmail.com,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,roeck-us.net,kernel.org];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-1346-lists,openbmc=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CE8A611B4A3
X-Rspamd-Action: no action

This series adds reset status detection support to the NPCM watchdog
driver for both NPCM7XX (Poleg) and NPCM8XX (Arbel) platforms.

Patch 1 updates the device-tree bindings to support reset status
detection on NPCM750 and NPCM8XX platforms. It introduces the
`nuvoton,card-reset-type`, `nuvoton,ext1-reset-type`, and
`nuvoton,ext2-reset-type` properties, and integrates the syscon
interface required for accessing the reset status registers.

Patch 2 implements the watchdog driver changes, including the reset
status detection infrastructure and platform restart support for both
NPCM7XX and NPCM8XX.

Tomer Maimon (2):
  dt-bindings: watchdog: Add NPCM reset status support
  watchdog: npcm: Add reset status support

 .../watchdog/nuvoton,npcm750-wdt.yaml         |  51 +++++++-
 drivers/watchdog/npcm_wdt.c                   | 110 ++++++++++++++++++
 2 files changed, 159 insertions(+), 2 deletions(-)

-- 
2.34.1


