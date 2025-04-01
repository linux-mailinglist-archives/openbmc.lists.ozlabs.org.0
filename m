Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4FA7846E
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 00:09:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS2GF5wS9z3c8D
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 09:09:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743545346;
	cv=none; b=iNyhkfpnt/BtR90F1STiRffQvKH8IQqPrt8b+V2bblzrzxeriVWt9UHEayZ5wLFnQ6WnaBjrUaD5EjGXRZ6JZ7okZKGWy1shdL47VTOo1RtMSCOyGb1KWm258BPBXmfvgtvK1GQuJ4OkFCEtkYnE0Mxz8FRDkbUd9MpyibXZfmYE7ovpE9W32mwTSfrX1KnNEGO97+VduAuA9f+kvDReTn3FCo4Cb3RcAO2wF7R2MjikK50aYkiW1WO/IiHNBFrXhDoQTx4qYcKvNq7JleMZNwdNfwnNCw4J5g3sBgsU1vykACWQ73MNOpnCXxqeMdS78u89j/5i5nK8nhw0i+LZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743545346; c=relaxed/relaxed;
	bh=IC5zcpvAJCNs+Bt0DZadLm9NNkS1wOhanMDfhuUEzNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnOYR/f+pQnsYkmUti+x3BqllsifDKvmhtROIwDQ7NO3AGmSRQDeJDySq9b2wNZ4WKtK56ZqWjBgoN541onNVd/DE4JmVhmplEl3Y1BRNqySmeNE91n9QarlPsJWUAsDRGQaZcOU+I62G9yAXk1PgySwl+uAzl7wPVrSRD0NTPZNgNq6Oan322AYgaJp0Xc9htDUAeEkIxofRdRmKCcb9i8es8gFWbV4T5Um5Y0y+7gg6ebkVrh7kYBloJ6qtf/r9S8qVvEEG2cFO7iW7EBihUKGe44fm2K1KU/OKY+SjpeguB4QH1EOZEKKeoFI/W4injPWT6tqnB/89HXqLFjgRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xvLyIPP/; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xvLyIPP/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZS2G84xMXz2yRx
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 09:09:03 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2243803b776so50618055ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 01 Apr 2025 15:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743545340; x=1744150140; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IC5zcpvAJCNs+Bt0DZadLm9NNkS1wOhanMDfhuUEzNc=;
        b=xvLyIPP/ry+RpJhFzdl6ifZeZoILK6EMYCfOt2pNgLCxenbEodzHcJaKjzP1Qmfnza
         UvrHNACuPAKwsJSRI2QOcfRiX3Gs+C9+ZuEcEhz6XQCExV7lrvbZ3kxsg6V0LA/q2DeD
         BAlaKk6W/pVlOqWDhzvKnZRehFwGcI8riMQKojIOqnrBkfLUQllerZ5rz550B65RuhT7
         SmMRRgsiiaN0vSznQkOjZHc70/wTSyo5akMdqyhPCBvCXrN+/+qMEdt6JHYvYYvph7fK
         SmY2vrpbKJfX1Vnx3z57WQ81vj+4ohXj6OoY4s7G2p1PZgtNwH2wIbVqyyfGiNlS3fNl
         FTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743545340; x=1744150140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IC5zcpvAJCNs+Bt0DZadLm9NNkS1wOhanMDfhuUEzNc=;
        b=VWRh8YLvxNWhDJRhGh8sKRVpiMjg78gatw9j5JMhdXQhByh2dr7tWCsRy84SKAkRzB
         L5w68ynUU/Z9aZz6hMFH1phTl5GEybfylA+moE1DW+fodnIGMsvJ/0TXlqekSWrk/3Zn
         SdIfnxAiutzOYTnttcmquZjTxgAZSoO9bp5H12gZDanWAqYKWB5Lbq283Z+VFQ+gnvf3
         U3Oh0rbba5FduZOVw9gHpBL3/OCaUI34xD6INaGG9BfA0zh513NQ2KzdUK1KjrFMlae1
         MTO85m9axC5j/CbA9cGlYaEvzBgFxK/ewfHLA2iFVYyQ2USIuXfbe6Y0DwdTl+DzHVSp
         XoDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ekxEosfB1EorKPo9uiLBYPf2W0dew8VAc+gyiB6om04YAwm6c2lSOyhzbNDwHi+pvNYboq2s@lists.ozlabs.org
X-Gm-Message-State: AOJu0YziY/P40Hb9DMHmxLisNfx8NB+FJ+WrEd/SDZRFyxmI+5XavW53
	oHi9H1vJ0RfkWn0P8WmrAecf/Bn/LN403HaN8QeFO+KPWNSzADjZwU4DSjDk68A=
X-Gm-Gg: ASbGncs06ZlfYOGQuAuGkoIoZRlI7QO6ENeSBQU10ah41RJfT8aTcGcEbMgL1vcudee
	P9rZVxUR9wqH5mBwfL8OxFe4xcOnBfyixspWzGbDWFl6EVsstKA/9Go6hdkye2SOp0kpcQSYXtp
	IZqNW+oz+qJ3yyV4FUj27B+bkemzuNV98UK+j9AZJL2hcyCzpzYGbcow3GDyvECtLdwlHM6KHX0
	0wUQlbDGYqwVZylcJDNqfFVoShRDaU08oV2NWKSs3Bkb9NGX0CZzqdYEQM0LfGYClZK9xQdExfE
	yqqR4mTuWCyGUyd1TJggsoRqVbdxzKU5pNlMVFw5N4FjqdIfPS6bG47570V8ecwWM9DsAQdX14K
	L3J03XsoG6dl9PrBqFcoZLYb9GTFyuEE=
X-Google-Smtp-Source: AGHT+IEsKGFq8XosoR42ePJJZp885KNvK/OZl4LnVRUa6xNPORGUuQA4QQaQDHkKMxhvZjroNhQaFQ==
X-Received: by 2002:a17:902:ce8e:b0:224:1074:63a0 with SMTP id d9443c01a7336-2296c85f3c5mr1434595ad.34.1743545340470;
        Tue, 01 Apr 2025 15:09:00 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:895:611e:1a61:85c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cfec1sm94080475ad.118.2025.04.01.15.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:09:00 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: max34451: Workaround for lost page
Date: Tue,  1 Apr 2025 15:08:50 -0700
Message-ID: <20250401220850.3189582-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When requesting new pages from the max34451 we sometimes see that the
firmware doesn't update the page on the max34451 side fast enough. This
results in the kernel receiving data for a different page than what it
expects.

To remedy this, the manufacturer recommends we wait 50-100us until
the firmware should be ready with the new page.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/hwmon/pmbus/max34440.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index c9dda33831ff..ac3a26f7cff3 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/delay.h>
 #include "pmbus.h"
 
 enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
@@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 		if (rv < 0)
 			return rv;
 
+		/* Firmware is sometimes not ready if we try and read the
+		 * data from the page immediately after setting. Maxim
+		 * recommends 50-100us delay.
+		 */
+		fsleep(50);
+
 		rv = i2c_smbus_read_word_data(client,
 					      MAX34451_MFR_CHANNEL_CONFIG);
 		if (rv < 0)
-- 
2.49.0.472.ge94155a9ec-goog

