Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2C83C935F
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 23:49:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQB3G47dpz3bYg
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 07:48:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tzSBo0fT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=blisaac91@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tzSBo0fT; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQB2S2zLKz3064
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jul 2021 07:48:14 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 75-20020a9d08510000b02904acfe6bcccaso4025454oty.12
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dndl2nyQTadFAO64rFcOihD/pyVKnS4d3A/507WV3y8=;
 b=tzSBo0fT+ipxEg9uUSxlqPXABfWHXBzvRgB0l32Ky8dmeeFEEtR6SFbXlM+CCH4Snk
 kPk/t/gjDYx75ybofG9XaMp//YAnNODRzwNYsFEa8+tuBOoqZhN/SXd2sSPLfpORd+kT
 YC/H0yMnM/vgl0L7y4CXiQYzVst96ed8UD1L6nN6ighs8STRlFXaS7cnZU2bDhBXgriv
 FZDYsJwPExUSBUDLYjZdWzVIYMG4VPpoVvK09ZKoVXGYFikJTVgHJQ8jxud4V6PMEmjD
 /uW9u1XX8YvX+nBDkVZ5RXkirxGP4UZNcqqgSK5cKW5JPqlrTkdE05rtlEpscgT8n6bi
 0BvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dndl2nyQTadFAO64rFcOihD/pyVKnS4d3A/507WV3y8=;
 b=JkJir6nsMG/Q+rDt/59ub6an/tccVLtCVK8ZQO94iJDbRIFwwXsUc1l26pwBdI3fsX
 vrr+rynjUHzB4qUyRVodvEeomdCX24bw1uiuj4q/jwxvfbB7BvI7lDNdjqzPalik3T8G
 twi6j5tTufgtR0UcrWspWE7z9ww68b4BzXx7CKJ6jr61IU1kZa8+e6GNp2HpbHzeXhRn
 fWhzfQW7QekcoPZu61jms34vG3Qc4dHhn3LCD/Ngo0TJOhaTzjMCatimJHHJDRjylwa2
 62kKZ5aakfCqUqH5Od5LRlhc+uzA0qbv+4sUT10OjHetS38zodQklrCUiAOuPE+1nEUn
 1DKA==
X-Gm-Message-State: AOAM531cgzZ6wK981JbeKD+79SLSSool0BjE0dLu8RD/jh+Qi4fd0YDf
 YT4tNFIpAYPoBUOja0Zf9Ao=
X-Google-Smtp-Source: ABdhPJx/BCEvKY8ya9qr975EEn6uD46kkL1aJuGSBKj53YUXevm2GgxdvBtQ+6U8zlUa5Dv1lU4qew==
X-Received: by 2002:a9d:1911:: with SMTP id j17mr251735ota.70.1626299291235;
 Wed, 14 Jul 2021 14:48:11 -0700 (PDT)
Received: from fstone06p1.aus.stglabs.ibm.com ([129.41.86.6])
 by smtp.gmail.com with ESMTPSA id n6sm720899oia.58.2021.07.14.14.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 14:48:10 -0700 (PDT)
From: Isaac Kurth <blisaac91@gmail.com>
To: isaac.kurth@ibm.com, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10] ARM: dts: rainier: Add 'factory-reset-toggle'
 as GPIOF6
Date: Wed, 14 Jul 2021 16:47:41 -0500
Message-Id: <20210714214741.1547052-1-blisaac91@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Isaac Kurth <isaac.kurth@ibm.com>

The state of this GPIO determines whether a factory reset has been
requested. If a physical switch is used, it can be high or low. During boot,
the software checks and records the state of this switch. If it is different
than the previous recorded state, then the read-write portions of memory are
reformatted.

Signed-off-by: Isaac Kurth <isaac.kurth@ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 728855c5cb90..81be3a563e6a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -231,7 +231,7 @@ &gpio0 {
 	/*C0-C7*/	"","","","","","","","",
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
-	/*F0-F7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
 	/*I0-I7*/	"","","","","","","","",
-- 
2.25.1

