Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD8D1296A5
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 14:49:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hLM72Lc1zDqH5
	for <lists+openbmc@lfdr.de>; Tue, 24 Dec 2019 00:49:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NL+svlQu"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hLJl1Vk4zDqFB
 for <openbmc@lists.ozlabs.org>; Tue, 24 Dec 2019 00:47:50 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id b9so8843581pgk.12
 for <openbmc@lists.ozlabs.org>; Mon, 23 Dec 2019 05:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZBhlggSyQtmTSr8CqNKTo81IynygsKuIbsXqnXdEc8=;
 b=NL+svlQuAkwL3O8kOzsN/vH3XbCYrH0/ZbUiQB90F2IbWujZN4fU2HF+vDJa8P0XeH
 jCTfsM1O+WQR6qgrJI14WdDqk+ip+EFI0C86mqtVOOxvEwYFLC+kJ0Q1qUZmw1VOQwtw
 D9ry9fc4+h8xBNiAZTPXcQpanqUeD3qpic5NBYHLZf24ejBMlUu/0/Z5MbJgf6xGnLvj
 YqX/g7PTYiUHxrfuPXcmovHf0EFOok44xVGTd3MRmmtkOO6YP+RZegbdB44KNDfBy3wh
 SQGxdfx32A/BEDNYSZd3v02kf8Z9Co7dSQYghVkhOqAaV7tAMf1nb20lnkpHr+I6Ge+x
 Xfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eZBhlggSyQtmTSr8CqNKTo81IynygsKuIbsXqnXdEc8=;
 b=naJ+DctPeV6jz/sk2Gut1ckgkIJ8lcCBGfKsE8udegXoqChlBnSYqs/bH7JK7qAq89
 4ZJpTIIWWo333VHz+RZj42P6eIbYJMbYlYvWK748a50hA7HrlPQezwaEFM6Dvpmi8N3x
 Wi3+fKJ397Kdo8AjXAVI07j/kqtYjreYrgNxJPQUHJONmw66CBq2RCvj3pJzCBSEpR85
 NDsxMldQQbLYupNZgk3b62uZIHGdv7S5k95H1I4yCAKJGvGy/FKL2Z9l03KMF1cGqBVS
 d64ROyLS7hg1R0NNTptTU+6UM4H24jl4sYs8IWQt2Wn9e1cHcajYgQimsOdfmace6ADD
 CcvQ==
X-Gm-Message-State: APjAAAUtTCUYycjWft6aTMAkKrWQyXWbYshBNOVXI+l5LGLzP0DKvHRd
 QkwS5Za5JRChBg6HUM4Ygv9uLCmY
X-Google-Smtp-Source: APXvYqzoQ7qGOkEyEyDnCLwWAcXrw+OTX9sDsLupvo/2qJgjvTn2NDzKQocSwFBaxGhJbe+J6eQ3oQ==
X-Received: by 2002:a63:d62:: with SMTP id 34mr32581681pgn.268.1577108868449; 
 Mon, 23 Dec 2019 05:47:48 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id b65sm22988588pgc.18.2019.12.23.05.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 05:47:48 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 1/4] ARM: dts: aspeed: tacoma: Fix fsi master
 node
Date: Tue, 24 Dec 2019 00:47:32 +1100
Message-Id: <20191223134735.559200-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191223134735.559200-1-joel@jms.id.au>
References: <20191223134735.559200-1-joel@jms.id.au>
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

This was broken when applying "ARM: dts: aspeed: tacoma: Add
host FSI description".

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index f02de4ab058c..5dfd597110f9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -165,6 +165,11 @@
 
 &emmc {
 	status = "okay";
+};
+
+&fsim0 {
+	status = "okay";
+
 	#address-cells = <2>;
 	#size-cells = <0>;
 
-- 
2.24.0

