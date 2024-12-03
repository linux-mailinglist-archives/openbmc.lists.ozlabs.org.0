Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 969C59E1D74
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 14:23:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2hDL4Zh4z3c58
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 00:23:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733232191;
	cv=none; b=mXuoIg/h6ZC/wp6yfUPv2sLG1O+H341aVgltEbRQ+T1MztvAbdaY6+PhARdOCYwsG+yHHmmIQzwdXh/KVefsBkqFKrVeFNnr4evidvj76YZL/aO6+9moLwBdmDvn9lPstx0uukIkFoAVltflY1gtiuTj6/NJOo07UYQ4A/oEBhvw51l0XQuP2E1JCy1ARMhSZPoycCHvIR9h60JwrbaJ2YpotHyH4HPaMNxJUU9CkvipzTwIctqzkdh+3PcAFfIKWLCzJg/ok17nvwBJPrkqJ/Bjh56JXdtMM8fzBHhlZCVz9u+WBNextByh/0Ldu3c5Dgc+6/rKMqDEngmAPVWbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733232191; c=relaxed/relaxed;
	bh=GrYwoDBPdwhzaEj/TCIQ/EW68kwHvhqNPiInEOsyzDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ngUlIE4BTBFFx6oo3lc4bwqNXJjlOMPdthUa7rmp50hpZQ3Fsb9cgot6pEBMziBVzs97+2Pc7hyxNCEekbCPpO/JwoCKcUT86l+pKnXiOj3bt5OPEVvY5n3JVheeGxtmypr03tMEDd0kVIp9ZUqijpaZfGbNhyVEK18HQqHVy9E4le+askgv85OEXHkWVXPKPcFtXoN0kGlFTQH2rsMQOefee82BOxDOnIGjau+CtEcltxqJnJA8C14vKsn7NCnXt2xm+xoXmsbpBCyPKBkzcppFI7tzMyeH+Xsg03hRZpqrak1Xmicxml+aPTJ0PthENzd6V4VrYXngxawN6I0Bqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GG+N/WIf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+manojkiran.eda.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GG+N/WIf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+manojkiran.eda.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2hDG6Jyhz2yyR;
	Wed,  4 Dec 2024 00:23:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1E4F5C6D2A;
	Tue,  3 Dec 2024 13:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74229C4CED8;
	Tue,  3 Dec 2024 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733232186;
	bh=iZ4QmU3VYs0LDZ8lr0fIemo81foNLGPlwRopsTWq1P0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=GG+N/WIfnow38JRGkOfEUiqgEc8xibKWgESFJaJwR0/r5CeXFZfjHzUPdkXqIVXoZ
	 sSSEQ7mkh31hGjPyo1lXQ0JdWOf5gS/pK7+x21tsqZyBOGzK1xDwtBUEdzPjclGXMk
	 q67bDbgYt8PCuctS91TY55sFkMoZL/N3iXF4eAdedqqd0kCUlL6J7SnW4As8neP9M7
	 LYmT2SClZZbkYnk1DeHDGbkt2m4nuUW2CKjvUIxFjCDm0HvS+iPn1+mdONVT1mn2iP
	 siHZgH2lDRXJ8VBcdmW/odcujw3h1He5t1pFB2mj5ck3JKb6R8Ie0+Kh43UUc8aLDi
	 M79Lh9i6I1xSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A53BE64A93;
	Tue,  3 Dec 2024 13:23:06 +0000 (UTC)
From: Manojkiran Eda via B4 Relay <devnull+manojkiran.eda.gmail.com@kernel.org>
Date: Tue, 03 Dec 2024 18:52:45 +0530
Subject: [PATCH] ARM: dts: aspeed: Enable video engine for IBM System1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-dts-system1-video-v1-1-008e5e660106@gmail.com>
X-B4-Tracking: v=1; b=H4sIACQGT2cC/x3MMQqAMAxA0atIZgNNtSJeRRzERs1glUZEKd7d4
 viG/xMoR2GFrkgQ+RKVPWRQWcC0jmFhFJ8N1tiarKnQn4r66Mkb4SWedzSmJe/cSK5hyN0ReZb
 7f/bD+36t1tcFYwAAAA==
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733232165; l=1038;
 i=manojkiran.eda@gmail.com; s=20241203; h=from:subject:message-id;
 bh=ejXpM+ALtz0H3f+cLC7p2P7soAQAZRSfhVgLG/KNusk=;
 b=JjpeBLox0ewhPlPyR7prwy4gXMJDMjI5b0bU4tGW8YA3C9sw1giJi/yDs/0TpN8fL4ElkieUV
 1aQ6F65esdRAp5zDtx9n76PrAZNP1uwmNdM+yruTohVCsvcdrDKlH7S
X-Developer-Key: i=manojkiran.eda@gmail.com; a=ed25519;
 pk=54WqHEFtBzlAODOpTWKI2J1uhv/sAk3WQ+lDMxMyKTI=
X-Endpoint-Received: by B4 Relay for manojkiran.eda@gmail.com/20241203 with
 auth_id=292
X-Original-From: Manojkiran Eda <manojkiran.eda@gmail.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Reply-To: manojkiran.eda@gmail.com
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Manojkiran Eda <manojkiran.eda@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Manojkiran Eda <manojkiran.eda@gmail.com>

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
This patch enables the aspeed video engine support in ASPEED BMC for
IBM System1. It is crucial for facilitating the BMC's video capture
and redirection capabilities, which are integral to remote management
and KVM (Keyboard-Video-Mouse) over IP functionality.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index c8597dcded31..bea858b2eee6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -479,6 +479,10 @@ &lpc_snoop {
 	snoop-ports = <0x80>, <0x81>;
 };
 
+&video {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 

---
base-commit: f6d73b12ca9fd3b1c29a6a725cd751b972c740cf
change-id: 20241203-dts-system1-video-0081d55a156e

Best regards,
-- 
Manojkiran Eda <manojkiran.eda@gmail.com>


