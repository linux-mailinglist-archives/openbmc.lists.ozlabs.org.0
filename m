Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4429AB6F
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 11:36:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FGW24c8szDr1x
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 19:36:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="HEKmcsxF"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FGTx2V2rzDr1x;
 Fri, 23 Aug 2019 19:35:33 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 51C2A42ECC;
 Fri, 23 Aug 2019 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1566552929;
 x=1568367330; bh=jKgtvGJmWgHFw9xTDALlI5FqM+Ek3B7dGReC44Js//M=; b=
 HEKmcsxFbGqsJTfERJLdbiKd+j709hWz/pTxYtYPH2TfmOg/JvFHgdIub9O20EtX
 9whE9XgUo0PN1XNGWO25rFCXIUsBSZ/Vf/K9WGVizipBvp0QFHtN/MJo9IBdlSVL
 vx1m/SNdoj9t7VViQ1wmxoh16E3W6W0g5qe15QqV5FA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7h2lt6dcs_4a; Fri, 23 Aug 2019 12:35:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1A51B411F9;
 Fri, 23 Aug 2019 12:35:29 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 23 Aug 2019 12:35:28 +0300
Message-ID: <fafd757238e204b2566f216f1d6a4bef4b4906c5.camel@yadro.com>
Subject: [PATCH v1 3/3] watchdog/aspeed: add support for dual boot
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>
Date: Fri, 23 Aug 2019 12:35:28 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Alexander
 Amelkin <a.amelkin@yadro.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
to clear out boot code source and re-enable access to the primary SPI flash
chip while booted via wdt2 from the alternate chip.

AST2400 datasheet says:
"In the 2nd flash booting mode, all the address mapping to CS0# would be
re-directed to CS1#. And CS0# is not accessable under this mode. To access
CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
register WDT30.bit[1]."

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 drivers/watchdog/aspeed_wdt.c | 44 ++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index cc71861e033a..62bf95cb741f 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -53,6 +53,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CTRL_ENABLE		BIT(0)
 #define WDT_TIMEOUT_STATUS	0x10
 #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
+#define WDT_CLEAR_TIMEOUT_STATUS	0x14
+#define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
 
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
@@ -165,6 +167,42 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	return 0;
 }
 
+/* access_cs0 shows if cs0 is accessible, hence the reverted bit */
+static ssize_t access_cs0_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
+
+	uint32_t status = readl(wdt->base + WDT_TIMEOUT_STATUS);
+
+	return sprintf(buf, "%u\n",
+			!(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
+}
+
+static ssize_t access_cs0_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
+	unsigned long val = 0;
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+
+	if (val)
+		writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
+			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
+
+	return size;
+}
+static DEVICE_ATTR_RW(access_cs0);
+
+static struct attribute *bswitch_attrs[] = {
+	&dev_attr_access_cs0.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(bswitch);
+
 static const struct watchdog_ops aspeed_wdt_ops = {
 	.start		= aspeed_wdt_start,
 	.stop		= aspeed_wdt_stop,
@@ -306,8 +344,12 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	}
 
 	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
-	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
+	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+		wdt->wdd.groups = bswitch_groups;
+	}
+
+	dev_set_drvdata(dev, wdt);
 
 	return devm_watchdog_register_device(dev, &wdt->wdd);
 }
-- 
2.20.1


