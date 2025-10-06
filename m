Return-Path: <openbmc+bounces-718-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D253BBF9C0
	for <lists+openbmc@lfdr.de>; Mon, 06 Oct 2025 23:54:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgY2L21Lkz2yMh;
	Tue,  7 Oct 2025 08:54:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::734"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759787658;
	cv=none; b=YZ6n5PACz/0pWwqHEMcXX+9I6DzkBRmCkPuOh9d1/jymHU/yZEPUb4fxqKl1Fr1tO867gBdHJhD2HrHGQvF+/23cvlIr1zlMJEJmswII/d4QrMtFs+YJsZyeIFH8ZXGC7DWGWcUzqf5Z+GXiBPuRf3TPOUquExuKSRDK2hw+5HqPLA/zt7Hx0qASPB/IMGUGgPezM6RV/6t/Q0ouOknjvyE2WwPJfUDIpWhV3YocESgFNzG8Wer/WRPbh/pDtuTZ7E2V32UTrBLPBaQOHs7AVebFda0a1hpzH1httQ85qw9PrchWyXx4DsT31Cm8y/j7sTMgw8HVLofAZT0ez51pHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759787658; c=relaxed/relaxed;
	bh=/2sIp4WFShfr4eCKdCALf03P/N949F7OBVMFA66z5UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvN4/vBMp5uRz5IUZ9esRSC4imY+ogWaQBy15Rpzgu9c6p/wyzEhZpdHZmeEmRlWcMet1WadnmiKStJ3xqZHWH/NX56DUEi6r1CkMVeUEvnkiICka0cb/DvmmPx/OkFQkvF4ZR8IXArELQyWeD/KxAMxlmg74hTw+TW8CpekFhvxxGA4z5rciGqK4UVBB2sb5wa4AE/r/XfF6veGgxgyQJ1WoNrIyLomXDCKWgIFOeH2O+inQxXuXUnKXfR6EDWCDR2VcsL/wBkJeOpJ6Q0+j0jeeUQqovwH4B1mo0jeVnM2pWQtNpVGaD+Jj3LH4mQtuc1zJdEtNdM6zfgGYBXiHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NBxkIinY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NBxkIinY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgY2K3tp7z2xgp
	for <openbmc@lists.ozlabs.org>; Tue,  7 Oct 2025 08:54:17 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-869ecba3bd2so566729085a.0
        for <openbmc@lists.ozlabs.org>; Mon, 06 Oct 2025 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759787655; x=1760392455; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2sIp4WFShfr4eCKdCALf03P/N949F7OBVMFA66z5UM=;
        b=NBxkIinYzpc5Nk8Q+2PkLkG7PL1lCIIqlKhyt40hA/FJRrawn3wusgJbs9RUP0RWOp
         ndtC6BCxD8r7z463mP1IJ9T6vl1eyLudPItjToSt0I+8dbKOyeK5Lw5WmBKSC9e9jTxm
         5VGxZ+g3Rqcugn3im+E8tmx+KCNzdkxf72hDjmmuOl/4d/KmAwBbO4QXlr/xsAvW6xrs
         2CnQCyrQ6QV6ylabdAz+Y+J0Ru67RHLyOJOc/mM82Hgvim0XV4P/UfRm4qSoJm7QAKdf
         +QcId+dXbEq5UFD+QI9U7DF9w+va9B5VPqxs1NFo1UdxNE9hWRL8Y3lxB37Q2g8R5EIJ
         eSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759787655; x=1760392455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2sIp4WFShfr4eCKdCALf03P/N949F7OBVMFA66z5UM=;
        b=awwqb0M6jq3ZNd+eL3shRrvg1o5i+Dm02l92kP8lGtU6OXSYEXOuO8IuY/IASZJgML
         o9YvnZ/a+eGJ3a4BzL0UMXtcAnZ8RBMYl91ucupy/40QYAO9sy00tR/tAugKEcjLVAs3
         k8NfjmF9VruO/FmDUSMSTMKjfvQXTizuQce+XLx3jchx2kjlFgMDQ+Fs8c7d46qkT/AG
         to41dnrrhvH3w1I27VYUwvWSHm0fKYz/G8QejqHtxnbBd1Zl7Dz4I0CB7F1rA9gymPZ+
         sge9pXWokV/qWJjmTHvri4ZVPZl0l0PaVsGxxRJGvOVb3yzcIyf+33Cz8oEjC9C4n2/F
         0zYg==
X-Forwarded-Encrypted: i=1; AJvYcCV9YcJeEUMaEyjmXmImBpwOs3ijFstyCbW6BEXKs7irNubM4QZIvfll+ta414rPiwPV6b7mRzUO@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5oYOYLN2p6TnpSSAHShHKHZYgv9V4+LX3L9p9E31D66MllZYL
	/nDUJC4wGbcNwYSvxMusSENl0j6LGJZHfCfce0FBT0UjDFUIkkyq5yxKkTFbaAgsvJ4=
X-Gm-Gg: ASbGnctt9FrAxsivnezdPZmGQCpR8mk4TxEZaxoBGDRIo4jQ6xUJS3ph/qzcY8o8NuC
	AYDzHWbWPCflRHsazWWd3q6cfPaBR/Gq928s9Za47gLtju7SlGMUccleiIXGPPjbXSzI8Fg00N4
	STBZ3ne5t/OOPFU8hWSTbw9VNqKIx90TB/7+zfcCJsty4lv9RAz0Oazt4dy1jO4B/N2LA5w87wq
	PXataXlqCw160+nhRJi0N4zd+EW33jV1ekUkNM9INoK0E+Xjhya5SUCnaECo9ENHdYOr938ubqH
	3P/jBFPjP7TGJNLPxj21NEWQef20qEiHBlkeeWH0vDAjKxpToNIyvCmOTOgR4rsVdqlCJFXsCfl
	47f9PGt2pT/BVbPxfYYpbyRSG0vnQr7TP5EXVBXIn3Hb4pAg7
X-Google-Smtp-Source: AGHT+IFqsWVnCpjYKU1itjoK+0G07oo7F31f4A0dLj7qpRKOEEW3bL5j0OvrFQf9Ro4ztA0Q1cj6GQ==
X-Received: by 2002:a05:620a:40d1:b0:85e:adef:a774 with SMTP id af79cd13be357-87a390f16b8mr1404131885a.82.1759787654780;
        Mon, 06 Oct 2025 14:54:14 -0700 (PDT)
Received: from fr.lan ([81.200.23.195])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-87771129478sm1314168585a.1.2025.10.06.14.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 14:54:14 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: [PATCH 1/3] peci: cpu: add Intel Emerald Rapids support
Date: Tue,  7 Oct 2025 00:53:19 +0300
Message-ID: <20251006215321.5036-2-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006215321.5036-1-fr0st61te@gmail.com>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
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

Add support for detection of Intel Emerald Rapids processor based on
CPU model.

Emerald Rapids Xeon processors with the model set to
INTEL_EMERALDRAPIDS_X. The data field for this entry is "emr".

Tested the patch series with AST2600 BMC with 5S Intel Emerald Rapids
processors & verified by reading cpu & dimm temperature which matches
host sensor values from lmsensors.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 drivers/peci/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index 2dac8ba82787..fbccc1d1b637 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -321,6 +321,10 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.x86_vfm = INTEL_SAPPHIRERAPIDS_X,
 		.data	= "spr",
 	},
+	{ /* Emerald Rapids Xeon */
+		.x86_vfm  = INTEL_EMERALDRAPIDS_X,
+		.data  = "emr",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);
-- 
2.49.0


