Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D003CCBBE
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 02:18:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSjBK35t5z309w
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 10:18:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=n0nCZnpf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n0nCZnpf; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSj925w7Kz2yN0;
 Mon, 19 Jul 2021 10:17:41 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id e14so5934371plh.8;
 Sun, 18 Jul 2021 17:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NLsPKVoeMVht4+P1ydgwHccldQwBFO5L3840AETJle0=;
 b=n0nCZnpfvgqgzMa21iGDJM/Gef7+doJaZYBNoaTnXm4Nlz+DKppzwWMvCkf/v2Yetx
 lyMhMWmGZeo1U9tuMDAnOpXSlvjPVQ+IWwQ9NdTqmztvMAwrdblduUiJC5itGh6j/xcx
 GP6hkxGvtNK+QmtHQWp+P/OAga8jTaKAMe0T8TkzGKnwy3Fx15ufJ40774CWCCs5xki2
 LvXRGI995nNEgKUJMMLP/5rCVwDKczSednfe7wwLSqF1KSO4ViutbORfpxN9Dk4ODgwk
 QzLoLC4klCMIxJf1ViyqnKhvHnwq+y7ATLju+gw4NakXhzx6Q//yjq3s7C3FSSsJlXH5
 lyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NLsPKVoeMVht4+P1ydgwHccldQwBFO5L3840AETJle0=;
 b=QfxAqJgxnsgLRDIx7j+EYrj/QxKMhQqSAV5RgXlE/aoiBYDiMTdy5ZwqDWzCj3Un0j
 9Mmr7CqoRyZspsk45IHt0YLKlPiQlPxgIR2CB6oTYDCyAWJfQvY94RQ1G8F3JsndQQW9
 AdyFjL7Fj3yFDxZGbj4k636VmXLyeEYwadY/ifK/JQQy93vzeHO5cDR+8R6H6WwM4yh4
 ldgDQqhOnaqz4+8FsFWyAA5Pm8VZDXCTVh/g6a9ML52bmxr5ENRQMXC041ElRFs/weqm
 uDPA15vC3ZSOS0vOY6MirmsCJ4hEr0+SaHsrOgPJyuZKlQIKQQUrjsZqI0HBxoH2HKHp
 h+cg==
X-Gm-Message-State: AOAM531zZh+4Nk8vsjbeF8id/MewDbWY2uz3usG6w+DkJSZLLWeL6qZu
 LvwBfB2Y+upOC9W/KmCPQd4=
X-Google-Smtp-Source: ABdhPJzSjcJ0Rgpfe24Eqls4CvRbdMZEACfvAqHQ9W1NWTo2cKRo5xMviWJLQGoF/2rkwHg/2fugeA==
X-Received: by 2002:a17:90a:4404:: with SMTP id
 s4mr27841136pjg.218.1626653857861; 
 Sun, 18 Jul 2021 17:17:37 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id x7sm1059847pfn.70.2021.07.18.17.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 17:17:37 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 1/4] ARM: dts: aspeed: Enable ADC in Facebook AST2400 common
 dtsi
Date: Sun, 18 Jul 2021 17:17:21 -0700
Message-Id: <20210719001724.6410-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719001724.6410-1-rentao.bupt@gmail.com>
References: <20210719001724.6410-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Enable ADC controller in "ast2400-facebook-netbmc-common.dtsi" because
the device is used on all the Facebook AST2400 BMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi
index 73a5503be78c..4e5e786e18b7 100644
--- a/arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi
@@ -115,3 +115,7 @@
 &vhub {
 	status = "okay";
 };
+
+&adc {
+	status = "okay";
+};
-- 
2.17.1

