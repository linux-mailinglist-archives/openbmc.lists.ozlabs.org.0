Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2485C86C
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 06:37:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dBLP21MlzDqX1
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 14:37:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p49ufNmq"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dBKp256WzDqR2;
 Tue,  2 Jul 2019 14:37:17 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bh12so8438806plb.4;
 Mon, 01 Jul 2019 21:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DC7T/1epSdwbqDWlhU77s7p6S8E3+rl5WhjQziUAp3Y=;
 b=p49ufNmqYf8JRR5G6e2SINTKVPTvV4SdImOKWOUQp+vXexeQ7fRafUiq5Poy0V8faU
 E/zc1Hz+LB3WE/ZeYL1gGnHssal6w69pUfEsCQs9S2NBzgYx71J08wHTa3RBBk3GkPhg
 sHfnlB12M0vzbcGXRBRifYiulW4GgmIcOVhdcttHxbBuTFj2zCBrX+v5J2XYixHEOg5G
 pZRMnz3STMwCz4B1tVcbthRgK97BjO6HP9qisr8Y/aTrUdhV7V2dVDyN6F2aCP6rFjRc
 AnXg2HLD15oh6JfPU3Y3ALXdTDCwkz2vYsWHu2JfBAiB6aGtrOZFGo+LbrZ8UVAbJigK
 +icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DC7T/1epSdwbqDWlhU77s7p6S8E3+rl5WhjQziUAp3Y=;
 b=dkuwHfp6fkGe1m7H+K88Hrl3ASlqRtOrD6bEZCcaue9Fb4R98zDydUL7EMF/j1CuQe
 PctwluisMFuXWc9ha/wO7eNDDOAl6vZbzIBkzQ+BtAQ41BlW2WHylEV5frkyv3roE4hI
 M5pxFtOYQBCJm94zPtSVTJFkp5j6sQ9609cIb2NCgMNNEkf0WVme/JplHFy+UBfrz8Ps
 rtZERhVkUxDS2PFKWcP+wc8Xx20PuxZu/T/YiCSoJgeS215z7uz326A1KH7/HUBAoggR
 qS1s1dO8lVdZyCur7UcKfqlyn2C053REPj3M4yi055LMygfjqwAddP1jtaQzwLu4n8VT
 xYWg==
X-Gm-Message-State: APjAAAXGUb/jUx1ncavysABvy2zBIINzQ2UePg3QXqz0+83nUndQ+7Ay
 sXTlvSVrYafuF13Ssal6weE=
X-Google-Smtp-Source: APXvYqyP+V1ZurARnQp09iaSwvmVd8yk1r5uiFEKPm0Rcd48E+ZKhTidU8KQ1RokPwypizlrDtRFSw==
X-Received: by 2002:a17:902:ac1:: with SMTP id
 59mr33525329plp.168.1562042234468; 
 Mon, 01 Jul 2019 21:37:14 -0700 (PDT)
Received: from voyager.au.ibm.com (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id 85sm16028873pfv.130.2019.07.01.21.37.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 21:37:13 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH] MAINTAINERS: Add FSI subsystem
Date: Tue,  2 Jul 2019 14:07:05 +0930
Message-Id: <20190702043706.15069-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The subsystem was merged some time ago but we did not have a maintainers
entry.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01a52fc964da..2a5df9c20ecb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6498,6 +6498,19 @@ F:	fs/crypto/
 F:	include/linux/fscrypt*.h
 F:	Documentation/filesystems/fscrypt.rst
 
+FSI SUBSYSTEM
+M:	Jeremy Kerr <jk@ozlabs.org>
+M:	Joel Stanley <joel@jms.id.au>
+R:	Alistar Popple <alistair@popple.id.au>
+R:	Eddie James <eajames@linux.ibm.com>
+L:	linux-fsi@lists.ozlabs.org
+T:	git git://git.kernel.org/pub/scm/joel/fsi.git
+Q:	http://patchwork.ozlabs.org/project/linux-fsi/list/
+S:	Supported
+F:	drivers/fsi/
+F:	include/linux/fsi*.h
+F:	include/trace/events/fsi*.h
+
 FSI-ATTACHED I2C DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.20.1

