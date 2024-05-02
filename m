Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11288B92CF
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 02:29:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=LOGwYftx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVFFF3Bn7z3btX
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 10:29:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=LOGwYftx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVFDc3g61z3brZ;
	Thu,  2 May 2024 10:29:20 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id A4EFB42E7;
	Wed,  1 May 2024 17:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1714609759;
	bh=pdhGoauaP3u5/TiAgvJi449opSxHErH1PG6XaVzDukQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LOGwYftxmZ5ApJHD7cyCl0ldBta9IffsoxjIIYDpquuxcjzkUyixPIUiZYPCW6ccq
	 iXAEqCKrpIdtFYKJH2ZmpQNuwLz+UkDUDA11G+oaO0Wnv2kiHu34orJeOL9QMB+7+v
	 vnOo+/DMGsBx7DBsucR+4r2UzF5kTXCpHK5CY+UA=
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: trivial-devices: add isil,isl69269
Date: Wed,  1 May 2024 17:28:31 -0700
Message-ID: <20240502002836.17862-6-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502002836.17862-5-zev@bewilderbeest.net>
References: <20240502002836.17862-5-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The ISL69269 is a PMBus voltage regulator with no configurable
parameters.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index e07be7bf8395..98ad7f3a7853 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -160,6 +160,8 @@ properties:
           - isil,isl29030
             # Intersil ISL68137 Digital Output Configurable PWM Controller
           - isil,isl68137
+            # Intersil ISL69269 PMBus Voltage Regulator
+          - isil,isl69269
             # Intersil ISL76682 Ambient Light Sensor
           - isil,isl76682
             # Linear Technology LTC2488
-- 
2.44.0

