Return-Path: <openbmc+bounces-1303-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPizBDIVfGkNKgIAu9opvQ
	(envelope-from <openbmc+bounces-1303-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 30 Jan 2026 03:19:30 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13377B65DA
	for <lists+openbmc@lfdr.de>; Fri, 30 Jan 2026 03:19:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2KT84s5hz2xpg;
	Fri, 30 Jan 2026 13:19:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769739564;
	cv=none; b=l8Yz+UggZpZBt//zVwVtbXg51fpFDbNzoXVB+kU+B3yj3hehoXQO8WwF/kypjHi82Qgt2TmnqQbjuy46oJlU6xTK1mv/eNI3VcPfMk6R2Eg7Fzn4D16vBUp66RLGiEedxpjbeXulX1O/Zcfofllmh3zDKo6o94P300xXAm4j9s0F4rYGrw1FkSgtImA7st7joVVsrX1B52EGAS77d/r6Cl5vki3uXSqrqb7aUy0xvXiAyvYICmxpk2SCy2Mi+J6xesqwE6MeRsA5PbKohCrNePu1AK919mYFosyDI42T9O59rKZBLbtqKjE6UbIsUHRBoLVpVs6LC/qE+eP5FQvnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769739564; c=relaxed/relaxed;
	bh=7YDIrTHn8QceeoWgvEQkI/gRY9K9cFBiYFZtx0hOpm0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZP+skFzJ4Hso+oP6Xgw1xheAT5atBGyNZIBcgHsCaG6iIDRAAyaRvrJ8JleAMPBrW0wINzN3xppsM/NHecxI5VDlqwdm0zPX/uLbV6EfXEO+YZawTpW0wg0Ghv51nmb+evtxdHo2fhwblyjZFcGhuG1px6LcnDSEt/iB7sKOjDkqTSjagyf/BuMvdPZEi/pZwi9R0BVM0RHFGEdySXOA59jDV5NX61AHTACc6Gx05koApAVsDnb8/m3vY7C9tRsZPPylRcljchZKIkaX7Nx1hMhuQ4Vp0TFhnf2Z9rtFEAzZG3H2UjiEWAGBMWCcPxz93XXWUryDlcZ4WxIirRHKCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=No2KT9tX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=No2KT9tX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2KT746ltz2xKx
	for <openbmc@lists.ozlabs.org>; Fri, 30 Jan 2026 13:19:22 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so892133a12.2
        for <openbmc@lists.ozlabs.org>; Thu, 29 Jan 2026 18:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769739560; x=1770344360; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YDIrTHn8QceeoWgvEQkI/gRY9K9cFBiYFZtx0hOpm0=;
        b=No2KT9tXuBHKSu5qhje1eSJXl0TQVLjo3/ehJmeNPYXKVJ5/7KWCi1CzJdMkn/ReCv
         iCLj5U8NE4bHMUuo4nvh6FkkQ560eL04yqifLtbyl5OkSGU8XnV8tKrh3dgHXGjyJA9c
         j2aXp3G0Aqgm5tZbdzU33WcD9PwGGG9Zk/HLAyxApH9Y/Dj4kT0Cx0TtxuP2OIN1CXGe
         Ga0RzDGwecIgQAF77rp4H5G8F6CZRxnIfk8DO2v8QGwN/xzIzxjFvW5xUDnKxu/c79lU
         oToPhwMRmo4AWoftJvVfiaNEYMiK2SAuB7BFcSd3KBoKYkUqEfzYdYJ3e2uWe0yT9K9K
         JujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769739560; x=1770344360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7YDIrTHn8QceeoWgvEQkI/gRY9K9cFBiYFZtx0hOpm0=;
        b=Bgi3bPKEnkgZTNjCmEPaTLDBt9B+bQ+Jz4O1z8nqdKnZrGGlbcQb2CoDFttfF6Gvqy
         /ZfSGq+aHQrWD/ptEkZinGV5j2+w7lqmwYMXiAOFXOah9jtlczx838RVDtD4/9hRpJR5
         FiA5SDdzg25c7nyRtnMAGe0UDVR1YJ36VRtlHjJonZAob7TsWkVn5BNVQMCKL6h0T8fQ
         xYrqFPFJDLWpA6Nzfe7BK97K84VCWF7i2ZEdDU+KctjGrlgHMjhd6SbnATPm9Q4LyDXU
         xJBWxt0JjAvG5hxfJkM5QLgC4v2nTdSJcRqRlbkClG6/H8w2G3Hoi8ExYFFqgJz6LxyF
         jweQ==
X-Gm-Message-State: AOJu0YyVx+SFUqqG0pl62rxRb5RNKRzYU+qLzVemlFTFrta7FS9gvS6H
	6r8/0dU90sLGqTrw7k4eqmj+1qm3jdG8a2GcAgY4OvwclM542f4NNIA0KGTZZQ==
X-Gm-Gg: AZuq6aKL+u0XNnspONBNTB7q3AJOmBzBxLaox4QiTOAbP4fRovGqQ09TkHuc3OnRxkn
	InGqt12Dm437sHbOnB61jpgSDHg5rMuuOCv409a0LAbAUURsh01XjVLzuvy5hliyAulb2XYqj2D
	3pI+oBs20ZMKtTYp6tiuzofIW5kq3pGEo1aPtYTuFVd5pqmj2mRrwitIol4UOsydjvMe2WUHrrf
	3NDa6ASb905KP1Jp0dBhmWQb94rkqMHGGM7Z8L/OjhwckETW1J8ZpdBM0KSbMneVzhEw3yIl799
	MAwc5YiVrGGe4H+uFgo0+VKIhRGR40kwIWB5WdzvpOHo5NvLw7QYMR1HXg6GmzgnAvvDA7YRX6H
	HOtu9pRLJsWucTLCDekPUMgdeQ6DvXbJ4YNbmDeAIBkoiK6+ypF59uwZeoGW3XNRy5wqIZN46wX
	7Ei3b4oa0FgSgQ3XAfQADKCGvtJgJQATEBa4kJlM7q2ZpRsCpPOWxBL1hNnY30ruU=
X-Received: by 2002:a05:6a21:6b11:b0:366:19fd:dbe4 with SMTP id adf61e73a8af0-392dfff6b08mr1178450637.4.1769739559912;
        Thu, 29 Jan 2026 18:19:19 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642afbeaf3sm6018082a12.33.2026.01.29.18.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:19:19 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.18 1/2] dt-bindings: hwmon: Add mps mp5926 driver bindings
Date: Fri, 30 Jan 2026 10:17:00 +0800
Message-Id: <20260130021701.2357288-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20260130021701.2357288-1-potin.lai.pt@gmail.com>
References: <20260130021701.2357288-1-potin.lai.pt@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.70 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1303-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_NEQ_ENVFROM(0.00)[potinlaipt@gmail.com,openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 13377B65DA
X-Rspamd-Action: no action

From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

Add a device tree bindings for mp5926 device.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index c286f180d52c..4aaec3a6d461 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -315,6 +315,8 @@ properties:
           - mps,mp5023
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
           - mps,mp5920
+            # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5926
+          - mps,mp5926
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5998
-- 
2.31.1


