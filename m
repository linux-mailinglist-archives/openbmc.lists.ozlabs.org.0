Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C6B512E70
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 10:29:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpph66769z3bdY
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 18:29:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QAg/+pe8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QAg/+pe8; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kppgf4ns2z2xXV
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 18:29:16 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id y14so3642881pfe.10
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 01:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fVM62GyHltSE0ionm6SdLetw0VDoqMgiKzSssxmigAY=;
 b=QAg/+pe8G9Sc1mDs8zVzp2hV9mfGq78LAOAd66G/6sLc/MF0CQzJ+bcaT+w90Jh2Av
 8HNDkJ3nqfhlCnkcwEmEpxoPBuZYl+bg4oAGMUv+lHlqdU5B+7U81PP648+Yp3LFWan2
 P21d/yeqp3wWUW9qrIholko+vTlpsdc7JFWCIaMc+X3Xk+llOP1UjzKEB7ABeH5PVukb
 zUycFoHjS6PqN+FO/soY2wkuuvzG/vccsNhDQpW4zC5sE+dNYAIVpYjZXDbv5gluvKxw
 VOWM6/HpQ+dl+L0G7Al0ETAMQAnC35i/vMB48RkbhXVKP5rD+rw3fvMiNiO2hqNyyy0w
 IY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fVM62GyHltSE0ionm6SdLetw0VDoqMgiKzSssxmigAY=;
 b=HnX1qgehjO2duo8hLemugg6mCu1ZzLL8UKuWDHaNuUc8YLYkQFXtX/gNoOkX5ctCf6
 cpybMgVY6a/VBnzkTiLgw3U5QYwDoucCcngTURH4Gqd8Ywix6CpY+3JYH0hK3UuJItdE
 fhN+TtA/hxT+gs71w9mOQ5UPB0LY2kBukerEsaAa/a3ZnzArI6RHJtBp5GwI1xq99Ft2
 PapoQBoNiEU6JKPd2mY7lueHJS6xublgvK296OwUaWGKHEIHKlr6VZwTl7K50LJjtn09
 SV2pZTJDDL3jNbrPdmhuLtojl5brfk2jhGI3jVJ5/PGIHdQ1ygohfyXqy5XfsbEFRSeG
 kkkQ==
X-Gm-Message-State: AOAM533wDOaoqp8yqE2GKJig/+KqFOP2zGrMbelvBTxdGGgdeGJyproe
 2q3MSnwqpWPxK1HkRTJX+6k=
X-Google-Smtp-Source: ABdhPJyTwDWftDHCcw6uVgNjozxu/y8Z4nCvbradyfoQcJDA2hYLwD/0AaZAp85aHF8Lo+WyhP0sgg==
X-Received: by 2002:a63:42:0:b0:3a8:47f7:bf0d with SMTP id
 63-20020a630042000000b003a847f7bf0dmr27515113pga.276.1651134552242; 
 Thu, 28 Apr 2022 01:29:12 -0700 (PDT)
Received: from voyager.ozlabs.ibm.com (pa49-178-80-133.pa.nsw.optusnet.com.au.
 [49.178.80.133]) by smtp.gmail.com with ESMTPSA id
 i62-20020a639d41000000b003c14af50627sm1827176pgd.63.2022.04.28.01.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 01:29:11 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, David Wilder <dwilder@us.ibm.com>
Subject: [PATCH net] net: ftgmac100: Disable hardware checksum on AST2600
Date: Thu, 28 Apr 2022 17:58:58 +0930
Message-Id: <20220428082858.545176-1-joel@jms.id.au>
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

Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle property")
Reported-by: David Wilder <wilder@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Net maintainers, if no one has a counter proposal I would like this
merged as a fix. Please give Dylan from Aspeed a chance to reply before
applying the patch.

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
+	/* AST2600 tx checksum with NCSI is broken */
+	if (priv->use_ncsi && of_device_is_compatible(np, "aspeed,ast2600-mac"))
+		netdev->hw_features &= ~NETIF_F_HW_CSUM;
+
 	if (np && of_get_property(np, "no-hw-checksum", NULL))
 		netdev->hw_features &= ~(NETIF_F_HW_CSUM | NETIF_F_RXCSUM);
 	netdev->features |= netdev->hw_features;
-- 
2.35.1

