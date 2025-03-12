Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4EAA5DA42
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 11:13:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCRKY59YWz3fn5
	for <lists+openbmc@lfdr.de>; Wed, 12 Mar 2025 21:13:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741774397;
	cv=none; b=hlp+YFDZ0Bs3GbEOW4ghSnCh/6O5Q4UkSExxDlGXxLnhhtAXza15TSQU6c4CY6LOLdEvJD9U1d3+zy9RSbFirMMZMupy1guRAaWl5rsXlNeBXpDQQJE94Oe7/FNpsanv8FnJUg4rTcHZg/FXozZXNZzngiwKHOTg6euToerGOIqmMk2pLwatHSYFgnCxPZBxhDITT9Tg5g902i3jU9uA3KEHM8bmSfHMv1tiob7I+IsuX4TA2UgOqlbdkB9Uh/LTm0AREZpSxTrYJ6Ja8HohGraLIWlNpeWloi1xD/lQcr4CYJ5M/EhwE57pGFwQhAxeO9wstuqfNjj3DAxxl52bFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741774397; c=relaxed/relaxed;
	bh=X3n1w25dfyf8bnyBFKUJ8m4aJTH7BoRQ2VyxxsLBvO0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PP6n4Drx3JCKgspyvUx73fzt+ExhvO/DTOvcmbDuto9omeBisBRWYJqsKu3WtKEJw1jWfe4QQMw9Ww++GVt03uRa368TlrYx4bq5dkS076gL0gdOQsD1I9gr5y6c8pEVqs3PwkqoCG3GiwgXFg2NVq+NaxN0doobkmWeScQLJ97HOyE/80L7ZAk9KOKbiszgCrWJ/BPyJa1c7/HqSyKeB8hmLQiX8wchngKZD40Lp5AnE+NFBr36+ILsgZGY92Ooiw+qr2Ymt3k3bjHuKdj4Vy5pV02Uj+02dnvo/cCUENGWxMXQ2vLhmzeR9ICLCrVnCbjEWws0nc2sZr9L3HXwIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X9DZThXI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X9DZThXI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCRKR21L5z3dLY
	for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 21:13:15 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-223f4c06e9fso11739715ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741774393; x=1742379193; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3n1w25dfyf8bnyBFKUJ8m4aJTH7BoRQ2VyxxsLBvO0=;
        b=X9DZThXIe7vGlJfUdcP4uv/uhSohD0f2+drFtWYY8J2K5pl6V8CR601X55Yof56cXT
         4tXDAFlcxDMlX12KgctZxMgBbum2xs6VzjCDPtb7tKyVQhaqGAeuPD8vrqj5clp0SHrU
         RQPqg8nRn3orHH8qkuqtMKkR3leqz5AekakDa84xOrH7VJNoLnjMKe8B3fKvoUTbOq22
         cygLCCh8KsilcIxiRZ1U0Q0Sda/qEbhJmgatZY6aZ+npFNQiJn2HfwZfDwfiqrOQc8xZ
         FUPUryN20FmAHo4JrDGOEzHQixlzizpShes8EH9CZ7sX2HQFV1ugDG/qYI5ujSW2AV3I
         xoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741774393; x=1742379193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3n1w25dfyf8bnyBFKUJ8m4aJTH7BoRQ2VyxxsLBvO0=;
        b=xA5ksKLoRX7LD2xaE7DZOLA8WFTZWpneqL4B0I82vXNDC0w8O4SFLKanDNVWz2dSMg
         0Vdz6tsdDxfKwohQB5E5VpB4Ptk1F1tbVbGDe81wp80loTDhgM4Xo8cbCmb3K+pSn8ZD
         W9smSrCScA9WyztDC2dg/425FuNP5OD5LF6yt1BMWaf4roSyt4PJ4N1Piym6X66OGB5m
         XT2R4jeZ0GYWkUgiUuJKYy7m3puwFFOZfW3MNqhOxSV26zrSVLq2zEJ3iN2kalZuxffO
         oNuzC0AFxmVQNxyaUxfSGqICo+WZD4Dr1o0VYjODQflPM88/4UG75icVwvSddE5nB8cD
         qKYA==
X-Gm-Message-State: AOJu0YyMGUa8NGI9OJeHrSJSxMYmuGAasNnfBiYepEmQH3rQ75ENGv1h
	PLWm65kDRdV0TGWvRgaopVZ0OM7k2GB9VOUVMzi7BXnQGjA/HHa9teyOcg==
X-Gm-Gg: ASbGncsyTEUHcNntDoxHzdlKTpKQ4hztBjkk2RRJyoJpe2s5ptIX7W5T4VUdmlwow/c
	whxiuDGAHIVKxfrtN1f5B034qrRFzdHbFsQKgW/X5MV39hykA4KIm99+/UnR0zFfrNerl3p6ZXq
	zmKkHEGSN0ZAaXi0iWjl4V1GtOuQJgXCCHc4uL6m+KPrSZc6FzggsRu3k4B0fe9aOzudICU0BgD
	Sfh5WmIMlam7kllmhxvd6HzP45XBeOMIuUwFmRzrxZPSWfwFXiqbdga5xIqIQcCWcU9o6n+ABCb
	1kFMVumn56HuEiwNH64U1tUL7+IZdDEjRXWqNAUBOXiOEfVgGMd5Q2KsZO29c7POuefHhCj96ho
	Y7vNUdo1xP7UXC6itSAyBjiZ6DgdvTJd63Dk1rB3xXZbWIff0guyqW+7SqAsZjp1E
X-Google-Smtp-Source: AGHT+IFNo7DGnpMMdl6nZ5t1mzDDcmbVhYsvM6hG4dsSeNjGY7pg6qNv7WKjpbIfp4ZyY8bu6fCEBw==
X-Received: by 2002:a17:902:ce09:b0:223:3eed:f680 with SMTP id d9443c01a7336-22593dc509amr96603305ad.18.1741774392999;
        Wed, 12 Mar 2025 03:13:12 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e35c-4352-93e5-842e-726b-dd46.emome-ip6.hinet.net. [2001:b400:e35c:4352:93e5:842e:726b:dd46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd5edsm112595815ad.37.2025.03.12.03.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:13:12 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [linux,dev-6.6 2/4] ARM: dts: aspeed: Harma: Add retimer device
Date: Wed, 12 Mar 2025 18:12:48 +0800
Message-Id: <20250312101250.3238182-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
References: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add pt5161l device in i2c bus12 and bus21.
link lore:https://lore.kernel.org/all/20240412091600.2534693-12-peteryin.openbmc@gmail.com/

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
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
2.25.1

