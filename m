Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938308050BC
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:40:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cpNCIxAm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxrG0czmz3d9g
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:40:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cpNCIxAm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxld54cBz3c3g
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:12 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so31466061fa.3
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772564; x=1702377364; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4aEtBuTh0UC9CrFmY+V3IFx8owY/yY3vgzi9PmzSa0=;
        b=cpNCIxAmMA+Lgj0na+lH9VnFlawvWf8Jv21wxxS/kOy6tdCdO1K1kstG+kP4loQGWU
         ra/1TBZ1xBJ0YdQScaZjP+m9EEBAhCQBO0V5Q3Z7HlFVBa2TGn7QqzuQ/A45pSD40ziJ
         jjq7ltTzCFqaxUddycZHbKyWEdayXat9rJB3OgHP3ceB4cSf2CBT7Iqcuud9N2Si+D/S
         BwNAc+Z2YQ8GEvsT10R6v8+Je/aItHvCxb+NPxd4G/Jhy0YSokgtn2W3GUO7LftecxLi
         /UgAmbAu7VmUhQRrzFx/uIQEcd56p3HoUD8SiLeaa94NNyNdD2z65QpxtybkNh6eAzZ6
         quYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772564; x=1702377364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4aEtBuTh0UC9CrFmY+V3IFx8owY/yY3vgzi9PmzSa0=;
        b=Egl6xxLqEaS0fwlF/MLAqNBga2TOZy9J7ob5DQd2Dl4IL8aE51KHcigqQsfzjUmZrh
         j1f227DV5SbEbMvfvo8rZ/nz30C9d3Zjq1JXbjzMkK/geYdBX8/DLwPcvYRC7UrMcoqB
         Ybba2XRh9EK0+XERK3vTMzQ3ik9kHSpWM0mGCBXW+MSKA/KsFsvNewOqeYmOvQfnXipu
         IVTKKb8mXZ6LdQHPH0s+5cQqqMRBlC+STjSRoYkmOnOjwOpYRyOQjKi/F1umtDI3X7+r
         vlRZ8FMYBk9Q0giik7cK2Ywl+3JfFNdEp3Hp/YoBvVqOAdcnD3ncnEsUUI5GbfZBNDtI
         +2EA==
X-Gm-Message-State: AOJu0Yx3zdYdyNRX0yM5ru0onKO8S+L5bsvePFYbA7ugMlpz+cgu0fB9
	rU25UdFR+yS3lIkRjT6Uo2g=
X-Google-Smtp-Source: AGHT+IFZKr4mte8mEyBn5TUCZn71LfadvBGTszjO/emPzCHL8qpyDtiAvPGC3HEYzGHAFjI4CXkWeA==
X-Received: by 2002:a2e:b24d:0:b0:2c0:17bc:124e with SMTP id n13-20020a2eb24d000000b002c017bc124emr2510299ljm.38.1701772563975;
        Tue, 05 Dec 2023 02:36:03 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id h20-20020a2e5314000000b002c9bb53ee68sm849784ljb.136.2023.12.05.02.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:03 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 01/16] net: pcs: xpcs: Drop sentinel entry from 2500basex ifaces list
Date: Tue,  5 Dec 2023 13:35:22 +0300
Message-ID: <20231205103559.9605-2-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There are currently two methods (xpcs_find_compat() and
xpcs_get_interfaces()) defined in the driver which loop over the available
interfaces. All of them rely on the xpcs_compat.num_interfaces field value
to get the number of interfaces. That field is initialized with the
ARRAY_SIZE(xpcs_*_interfaces) macro function call. Thus the interface
arrays are supposed to be filled with actual interface IDs and there is no
need in the dummy terminating ID placed at the end of the arrays. Let's
drop the redundant PHY_INTERFACE_MODE_MAX entry from the
xpcs_2500basex_interfaces list and the redundant
PHY_INTERFACE_MODE_MAX-based conditional statement from the
xpcs_get_interfaces() method then.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 31f0beba638a..dc7c374da495 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -130,7 +130,6 @@ static const phy_interface_t xpcs_1000basex_interfaces[] = {
 
 static const phy_interface_t xpcs_2500basex_interfaces[] = {
 	PHY_INTERFACE_MODE_2500BASEX,
-	PHY_INTERFACE_MODE_MAX,
 };
 
 enum {
@@ -636,8 +635,7 @@ void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		const struct xpcs_compat *compat = &xpcs->id->compat[i];
 
 		for (j = 0; j < compat->num_interfaces; j++)
-			if (compat->interface[j] < PHY_INTERFACE_MODE_MAX)
-				__set_bit(compat->interface[j], interfaces);
+			__set_bit(compat->interface[j], interfaces);
 	}
 }
 EXPORT_SYMBOL_GPL(xpcs_get_interfaces);
-- 
2.42.1

