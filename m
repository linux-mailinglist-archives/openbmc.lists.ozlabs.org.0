Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2B9456EA9
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 13:01:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwZyp5n9tz3bjD
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 23:01:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=OOMGli98;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=OOMGli98; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwZyQ2pdQz2yw7
 for <openbmc@lists.ozlabs.org>; Fri, 19 Nov 2021 23:01:34 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 30EBF46189;
 Fri, 19 Nov 2021 12:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1637323288; x=1639137689; bh=xpAPkFwuTwMKtfWujH1iLL6MzSR/goTDDR4
 03Lp49+c=; b=OOMGli98o3ndwtloagET5lgwB/8S9Dq3YQis2+vQmj+Uf8yZ9Mw
 pMBryCN6FxfwjTTOz96QkfnvyfO2INuFos7jXJGWby3IYhK1MqYKARNxUb/vjskq
 9REAb7nxLXy7iAwAc3tnq0EjVtkyTolcPELGW2ojo6G9THmz6CxOy/Lk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnIMCTOOY1lk; Fri, 19 Nov 2021 15:01:28 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 66D7445E32;
 Fri, 19 Nov 2021 15:01:27 +0300 (MSK)
Received: from nb-511.yadro.com (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 19
 Nov 2021 15:01:26 +0300
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: vendor-prefixes: add YADRO
Date: Fri, 19 Nov 2021 15:00:56 +0300
Message-ID: <20211119120057.12118-2-a.kartashev@yadro.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119120057.12118-1-a.kartashev@yadro.com>
References: <20211119120057.12118-1-a.kartashev@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.10.105]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Add vendor prefix for YADRO (https://www.yadro.com/)

Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 983f5e4afbc5..e7d31da6ac7c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1348,6 +1348,8 @@ patternProperties:
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
     description: Xylon
+  "^yadro,.*":
+    description: YADRO
   "^yamaha,.*":
     description: Yamaha Corporation
   "^yes-optoelectronics,.*":
-- 
2.32.0

