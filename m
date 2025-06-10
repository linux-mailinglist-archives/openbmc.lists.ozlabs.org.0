Return-Path: <openbmc+bounces-151-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62383AD398D
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 15:41:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGqgJ29DGz3brB;
	Tue, 10 Jun 2025 23:40:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749562844;
	cv=none; b=Nu/zBBa0C7xSvEBoWHt6EpIKiYprHcqpJ3CCNyGaLb3PC/IdJ5FHUPZ4Nya7bgItC9cgktElrP62Hmirhy/iR0oS6cmgcbQSfr4pvvhtbUNdN9JaTaX75IHJ3WiANejksjBKwiQLGLitLysxlsaaqu+mslfOYX8mY6ERIwAoqtZhnCQ/QtMOwJlFtulNtsYdPMPhcxmlGvuhEGbhzzVHE0LXpJoWkNtmJyZe3oLbE5JYC3TF+0IeUjGr4HUx92La/sblg1OWT/wf8ymPwThcKtKYxKFOxJyfPWHgfj/xE+IFkfc8iangt504Ch5rhzxNQzMRtcm1MQB0LsPcgS4Ufg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749562844; c=relaxed/relaxed;
	bh=dzdiFYk5lmjTsuxcP+MaP9nhcEIg5vK5t8XbjygYNhY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tpp6GGGtMWCc4MR9b5fz0euBfv3u9cvnrOIMUnkXqMRm9H4b8EMaPpf8VCO1vWmHc/PK95sv2qrnLYMD7wxLTnH5mgCWLQCRnC6QpLw5C6XtinnRg7PlvLZja/JsgsIxc8V6CwWSs9zNOd8MOb0T4cxd0zf47M8P6e6CM1JoHZtgXf9Q3uXvFxn+O2BLbglTZ3nj2mqg2YZBl2nn2Jt38KjqsxrW1ZDbeBleLaywrINNXrjhOjAQOxPrWU20mUgwX065GV3BlTry/kJPcK6KJ7/RnZbQTuLyQ/nfGkJV2R2Un9jawOijWu+TxTGlRVJBPzFob9U/qMmAKT0ifi2DRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mZFlYan/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mZFlYan/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGqgH50Qkz3bpL
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:40:43 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7482377b086so2761147b3a.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562842; x=1750167642; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzdiFYk5lmjTsuxcP+MaP9nhcEIg5vK5t8XbjygYNhY=;
        b=mZFlYan/ndA14zk8uA7b9v9Xg5KN8TsChsyhyJsLMyLqCK9W8/Vh6KiG2PHENaNXcZ
         lQewnacm4h+wIbT6ROgrrRR+plidYcFw1/S9jPhA4mItxGwUx82j+oottEExlKDwO/Pc
         50BCPPJxa7fMtoCD2pLP8aOdJRF+tFtVRD4TzSFiBCnHye1lHUEFf8JWjzqDF2pfWzTr
         N1/+Bqdeoq5harbgrL2gBgxjKhFgaS+y/ImI9sK+mmDUSmgPRBC4h62ad8aJPP0Wx8nA
         XEITrN0MLQt3qZ4Fb+YUk5W3sgEFJFi3V3yeI2ZtgjRIBFShwXxp4Sjb1WugTHocajUg
         KRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562842; x=1750167642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzdiFYk5lmjTsuxcP+MaP9nhcEIg5vK5t8XbjygYNhY=;
        b=jItzVcdeh9EXbaf03THxSxu0KhS1vG2pyjwn+M1HGYGeJ+/8s3JZCcU7fjegdiK5oo
         qKTtnar6kx1B7ZXcKN+SHzmGZEGSoITN62F/FM7KR10M8Ki4e9uyd8ChAPyKpkcZlZTV
         qTRBu8LahnaqzNL6LVROb1vA2xqLKzC2luTiQrVYgfyJ5Fswg3ZUu0bhpqgkj0OIcFeA
         wDnWGR5eQ/77YsRjX3f/W0gyni7iEZrrHHb8BC1L8zAcFbG3MNygLFpSQXRYpPVWidnp
         YiDhdIfcj1IDIHMeBwjBPLWD3ySOBrLBjfBdBALY/Ia3QW7JasK2Q3BCly9gvN+N+gw8
         J2sA==
X-Forwarded-Encrypted: i=1; AJvYcCXcTcLy4ftIZzVA/FXQHXSOOWqcnooAFEQznpZEkV11K+N317syFwmydHNkAIQ4CScEpN5Ql3aG@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9SBZ6N1FpgOaRIyorQFeJ4j5NFvN8EZnp8As3MrxcAcvaIjwI
	DedPjbv6koIH8GhkIhfsXLm2SzcmMRQOz2QPyE5C+vVUl/REIPsS4bIY
X-Gm-Gg: ASbGncuzBDSlXW219mgZvBKTJET1Pnt9Nd0zM74M6qPB8SikHqItzOZVCKYSTomEWVt
	ndXyZLTlxj8dlYSF13SxC+qhdRLDCcvl22XacSCY40lhLTHVBm/8Vexhp6Q7rBzJ0ppmWtOZPam
	vBv+iSF5eldg5a3el/TI7oj+1b1bunAN66pJuQ8m+z/uq1jCBHE6ulOIfNmDR7We9SHXnN7j0k/
	f1+hOUowzxxwvhV8jPEyCbPN9X17vceZoJDQk8+qBM96xcOldXSg2KL3tQU36WczrZ+5q/Nkdi5
	YmW7LzozmYL2Wt/7hvJYilLB9LTyJgWQ+lBseI3Lq9sCgn4XrGeofpVKnBSXepTKX/dF5wWu7Cs
	65uvwXF05yfp307TrGKotnaOyk7lNw95Cwcy4hPswcWihFE6EXBt3luM=
X-Google-Smtp-Source: AGHT+IHhpUwTxnkYDh945r07Oj+PI5Pc/G0n9USxCSDdUJ5nprRD0A7/3oLayM4pGV7izpmOrfeiKg==
X-Received: by 2002:a05:6a21:33aa:b0:215:e3ca:eaaf with SMTP id adf61e73a8af0-21ee25003f2mr25709079637.15.1749562841703;
        Tue, 10 Jun 2025 06:40:41 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7401955b3a.73.2025.06.10.06.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:40:40 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [dev-6.6 v2 3/5] ARM: dts: aspeed: Harma: Add retimer device
Date: Tue, 10 Jun 2025 21:38:28 +0800
Message-Id: <20250610133830.2704829-4-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610133830.2704829-1-peteryin.openbmc@gmail.com>
References: <20250610133830.2704829-1-peteryin.openbmc@gmail.com>
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

Add pt5161l device in i2c bus12 and bus21.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Link: https://lore.kernel.org/r/20240412091600.2534693-12-peteryin.openbmc@gmail.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
(cherry picked from commit 287ba28a695a92072b8b659bf0ee1fc7136c8a2f)
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 4bf29290baab..7331b501c30a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -299,6 +299,10 @@ imux21: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			retimer@24 {
+				compatible = "asteralabs,pt5161l";
+				reg = <0x24>;
+			};
 		};
 	};
 };
@@ -429,6 +433,10 @@ eeprom@52 {
 
 &i2c12 {
 	status = "okay";
+	retimer@24 {
+		compatible = "asteralabs,pt5161l";
+		reg = <0x24>;
+	};
 };
 
 &i2c13 {
-- 
2.43.0


