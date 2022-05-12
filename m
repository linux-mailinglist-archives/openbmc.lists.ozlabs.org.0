Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C016752582C
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 01:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KznnD4XTnz3c9w
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 09:20:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KXo7F11D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KXo7F11D; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kznms6kWpz30Dp
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 09:19:57 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id q76so5896025pgq.10
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 16:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GbPvhZkWXt3QY9qEZgwTEjoyNuMBfGa+oZ63rvVL6pU=;
 b=KXo7F11DTbJvlXDBd9SjPMuEcgSvLN0+t9Z42Gnld89u3gv3d13it8R4mvdpD4Aj+A
 iX0ixvDywrk4zVp46MwFLGsn706vY+iYKx/Wopote1ECb78df+H+ykwo+SXk+kq8kKr6
 dKBUr+5AFsvbM2g2emjRGCteNR1c6oyj+Ckz4U3FAEyTulGbHnW9N6ENPcYVUI3kPYWy
 LApJXwuVMqeGxWjH49SbdfduZ+0u/VsJYIwqRI6qCnmstjBy4q6oijGZ4V/gFMDu8/fS
 0lcibXZXSJXqWQXWtSRZNEVTA3xK1eHsA2O/EOoaQsvNaUhp90DRWN/Cvk7cflzreJuQ
 ytQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GbPvhZkWXt3QY9qEZgwTEjoyNuMBfGa+oZ63rvVL6pU=;
 b=fb6gIBaIwjmX6xKRFUhRYBkzvwFqCnsn9S09KyPBZy5J7hqYf+jxn5bRCTc7HYesnU
 wTXuvZAaO55nA3isuJ2sj8R6y7BiXoUT8pc/0abtFgSy8Hp9xec17GymjbrNteNLVa9F
 xks9jGIozIEPMBlmitR5sXEiNn+sPIefkNRkQxWbkSEwOboNnJq6ZPBxyg1i43IbxqUa
 2uUEi2CRM1Kb0+MRNdJta7EukZB0Hk7Ki14sG8U0hMIgsVXQOHE+87yW1w6Y5ENebd6L
 TpKHbWvRZkm8UqZofW1s38jqzph++5PgGhl6Yf5T4zDEsbyHTxBwf1oS5oD5vYQ+G9pt
 ZkRw==
X-Gm-Message-State: AOAM533YKHNOer2AgIuWpWE+urBxh1GOft+IXUUa9qVT/YuQWNAiZcWA
 zxY/88AC6XRY9P3ECMLqd8w=
X-Google-Smtp-Source: ABdhPJyjZh9c6o2fHHw3TEt65QCqWYK5MnJjNiUnAYFi/lE+ZXQ7XfTmNu97r4JGi8v3BR2xEP6rxw==
X-Received: by 2002:a65:6250:0:b0:3c6:8a09:249 with SMTP id
 q16-20020a656250000000b003c68a090249mr1524507pgv.389.1652397592333; 
 Thu, 12 May 2022 16:19:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a63b554000000b003c6445e2aa8sm267814pgo.4.2022.05.12.16.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:19:50 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, David Wilder <dwilder@us.ibm.com>
Subject: [PATCH net v2] net: ftgmac100: Disable hardware checksum on AST2600
Date: Fri, 13 May 2022 08:49:38 +0930
Message-Id: <20220512231938.228651-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 David Wilder <wilder@us.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2600 when using the i210 NIC over NC-SI has been observed to
produce incorrect checksum results with specific MTU values. This was
first observed when sending data across a long distance set of networks.

On a local network, the following test was performed using a 1MB file of
random data.

On the receiver run this script:

 #!/bin/bash
 while [ 1 ]; do
        # Zero the stats
        nstat -r  > /dev/null
        nc -l 9899 > test-file
        # Check for checksum errors
        TcpInCsumErrors=$(nstat | grep TcpInCsumErrors)
        if [ -z "$TcpInCsumErrors" ]; then
                echo No TcpInCsumErrors
        else
                echo TcpInCsumErrors = $TcpInCsumErrors
        fi
 done

On an AST2600 system:

 # nc <IP of  receiver host> 9899 < test-file

The test was repeated with various MTU values:

 # ip link set mtu 1410 dev eth0

The observed results:

 1500 - good
 1434 - bad
 1400 - good
 1410 - bad
 1420 - good

The test was repeated after disabling tx checksumming:

 # ethtool -K eth0 tx-checksumming off

And all MTU values tested resulted in transfers without error.

An issue with the driver cannot be ruled out, however there has been no
bug discovered so far.

David has done the work to take the original bug report of slow data
transfer between long distance connections and triaged it down to this
test case.

The vendor suspects this this is a hardware issue when using NC-SI. The fixes line refers
to the patch that introduced AST2600 support.

Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle property")
Reported-by: David Wilder <wilder@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2 updates the commit message with confirmation form the vendor that
this is a hardware issue, and clarifes why the commit used in the fixes
tag was chosen.

 drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index caf48023f8ea..5231818943c6 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1928,6 +1928,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	/* AST2400  doesn't have working HW checksum generation */
 	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
 		netdev->hw_features &= ~NETIF_F_HW_CSUM;
+
+	/* AST2600 tx checksum with NC-SI is broken */
+	if (priv->use_ncsi && of_device_is_compatible(np, "aspeed,ast2600-mac"))
+		netdev->hw_features &= ~NETIF_F_HW_CSUM;
+
 	if (np && of_get_property(np, "no-hw-checksum", NULL))
 		netdev->hw_features &= ~(NETIF_F_HW_CSUM | NETIF_F_RXCSUM);
 	netdev->features |= netdev->hw_features;
-- 
2.35.1

