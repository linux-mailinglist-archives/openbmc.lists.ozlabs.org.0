Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A12489F107
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 19:00:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hw9z5wzQzDqNF
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 03:00:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="gMdBm7HV"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hw350xB6zDqWq;
 Wed, 28 Aug 2019 02:54:57 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3774F41209;
 Tue, 27 Aug 2019 16:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1566924893; x=1568739294; bh=87VA5h5waSDTUF2CVQN/4Wwh9JYi5VNM4bl
 aFGLhSMY=; b=gMdBm7HVXlGC8jRakgwY2WAmkhPtPeYsZxpqkbunuWfvgC23B86
 B6SKzMVsvtgEgU8t7dTVDIU71OEUnd34+SzHiHqNMDwJJVbxdyoVSDttK8S7y803
 dv+JmJcjATJuvoLmntstZDQFdUu00tZPXMju/cdk4igODmobcHHGY6eQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DE_cOhyTE2_a; Tue, 27 Aug 2019 19:54:53 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0C98E42ECA;
 Tue, 27 Aug 2019 19:54:53 +0300 (MSK)
Received: from localhost.dev.yadro.com (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 27 Aug 2019 19:54:52 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>
Subject: [PATCH v3 4/4] aspeed/watchdog: Add access_cs0 option for alt-boot
Date: Tue, 27 Aug 2019 19:54:26 +0300
Message-ID: <20190827165426.17037-5-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190827165426.17037-1-i.mikhaylov@yadro.com>
References: <20190827165426.17037-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Alexander Amelkin <a.amelkin@yadro.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The option for the ast2400/2500 to get access to CS0 at runtime.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 .../ABI/testing/sysfs-class-watchdog          | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-watchdog b/Documentation/ABI/testing/sysfs-class-watchdog
index 6317ade5ad19..675f9b537661 100644
--- a/Documentation/ABI/testing/sysfs-class-watchdog
+++ b/Documentation/ABI/testing/sysfs-class-watchdog
@@ -72,3 +72,37 @@ Description:
 		It is a read/write file. When read, the currently assigned
 		pretimeout governor is returned.  When written, it sets
 		the pretimeout governor.
+
+What:		/sys/class/watchdog/watchdog1/access_cs0
+Date:		August 2019
+Contact:	Ivan Mikhaylov <i.mikhaylov@yadro.com>,
+		Alexander Amelkin <a.amelkin@yadro.com>
+Description:
+		It is a read/write file. This attribute exists only if the
+		system has booted from the alternate flash chip due to
+		expiration of a watchdog timer of AST2400/AST2500 when
+		alternate boot function was enabled with 'aspeed,alt-boot'
+		devicetree option for that watchdog or with an appropriate
+		h/w strapping (for WDT2 only).
+
+		At alternate flash the 'access_cs0' sysfs node provides:
+			ast2400: a way to get access to the primary SPI flash
+				chip at CS0 after booting from the alternate
+				chip at CS1.
+			ast2500: a way to restore the normal address mapping
+				from (CS0->CS1, CS1->CS0) to (CS0->CS0,
+				CS1->CS1).
+
+		Clearing the boot code selection and timeout counter also
+		resets to the initial state the chip select line mapping. When
+		the SoC is in normal mapping state (i.e. booted from CS0),
+		clearing those bits does nothing for both versions of the SoC.
+		For alternate boot mode (booted from CS1 due to wdt2
+		expiration) the behavior differs as described above.
+
+		This option can be used with wdt2 (watchdog1) only.
+
+		When read, the current status of the boot code selection is
+		shown. When written with any non-zero value, it clears
+		the boot code selection and the timeout counter, which results
+		in chipselect reset for AST2400/AST2500.
-- 
2.20.1

