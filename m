Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D09C1965
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 10:42:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlDW55d66z3cQm
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 20:42:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731058943;
	cv=none; b=HDZ8lVsP4BhEGNklnh3NMSqBlJrMg3+wCvNCKvNap0uShWVFeSDhCo84NArRlSkQB+Q++4Fv/Ay2w0z7JsC3XbbgueXw1dnSIM0YLnZcuu8ixEDmUXvul+NroWe2tGHy+6PxOxp5GG4PsUGhnfohoywyvKIQ3fwdFqrVqynrkQ7ZNP0eT7nkzakkAwYyUJnNPUCudlrtU6w8SLRRyd1CUWk8FwCQVuZi+Gs6jqztV95AMYO/DH4CHrKh8u2okimLv1KtfMjZS5umIB7gjVHEgQU9VMdSUcXi8Bqhpw1j5FEIqziP7Xuwj+/mm8uSVAHDcyeX2d6DMVMwFLvB1dRR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731058943; c=relaxed/relaxed;
	bh=Ca2TdIiKwWZF1eqEUaePHRgoBLNi1vfBOb48mxhddGY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BMK4mIe0qJI3C93GZFV+efu/UoMU0rESw15N56UrBT9d8wPPI/p59YK/mltX8Vt7yTYlQf/V5es++/gyy2BAvshZ9ppimvQmE2NQCO1q/IKcLVJVkSpbyXMwrwhuNJb5JAE84DNCqMlpq4fnddaEjj2g59TDSOxtqPnfWZpTP9wi7ax+ro+EgDhRq6oOG81QmkcoW5ilwaGEBN9/iWRIvPkt5FaImZvswVfSXOEIF1loemnFMIWAhCjZuL/CVYAVz+8m2ZsaWkDS0JvCO+CB9f2BTJ9utEMDTHgopotXwPdpkQBV/0YINMTd9JYykpUZQoUyWe8QPJCGwJcHkgrcxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=JfmtYZ8Q; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=JfmtYZ8Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlDW11nZRz2xnS
	for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2024 20:42:19 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20cdb889222so20724595ad.3
        for <openbmc@lists.ozlabs.org>; Fri, 08 Nov 2024 01:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1731058933; x=1731663733; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca2TdIiKwWZF1eqEUaePHRgoBLNi1vfBOb48mxhddGY=;
        b=JfmtYZ8QNFhIP1bnwWvPDIw38MW4vuAbiA3IBQaIB/Zsp+WoXQYXgsmcYOdTMN3SfJ
         BP1YQbyM+AlWajg1H1lnhPv3XInFXB/S35L/K5cqYcHSv/IjqnW/5+PSYBx9PEDPR6e4
         3ev5i+N2thvIEt85QNaRQ9QR2FG8vYlQ5aZ0oDgQNW7O4hHKXEeef0ytCZmHgUn5exnT
         5dE9DN7OP291O86Ziw0M1jYRzjRi4GVCwJOm9MWznzGj6QANfjpADbKT+m6RDWApsOE9
         5ys0U+5T8i6HgAQiwTw7jJUG3jw5STRPx1QB38lgEePgIQqzhYBcKFU7bcrDmlRI3gRF
         TSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731058933; x=1731663733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ca2TdIiKwWZF1eqEUaePHRgoBLNi1vfBOb48mxhddGY=;
        b=NK1lD8YnStEXey4ZRxk18aWQ/YGQ1qjdRJkvbPGghOBACR7BFk1OLyco0FaO1TdBJX
         q7L2CJJ8WKYVKBHWRQvRWt3Ar5InDzTj7Efc8Wi3R94YHO4UkXa5bLKhVpcgDvNNQWL5
         KSH+n0Bydqhy80zioMpaHudQ4A+rfIL2yDI2qNNEfTAixlG75aOdhMIjTZ0NrkxK0GdF
         hNWJbBJw0G+S9z9ddYAajEYRBlUBDhUxd/M8foXALGYiep2zNNM1IbC6gft0AF3qUWG0
         uNimxqGGhKitqrwr4idTfvCc8eoLuTsoHVzlGNIimDqrZB9+LRaXFJPMIZMxr5ULIlgD
         5Grg==
X-Gm-Message-State: AOJu0YwfERowlHG6C54BqIjGLLJ30gCwLZ6CUgIxDl+KL6TWUpPEUTOD
	waTgX5QlfYKTqzPeqhqKl/mIHV97QqN6HyElOexaT6QbnJ+YG7jJgCYmZsP3OM4=
X-Google-Smtp-Source: AGHT+IHJaqY7CpnOjmx21Vtn/dox+6VYyb5PPSRH/wKo8sslUsDpZCDMWRowhL4+E2s/DAq8UCWDeQ==
X-Received: by 2002:a17:903:1d1:b0:20c:f261:2516 with SMTP id d9443c01a7336-211834f3842mr26435005ad.8.1731058933057;
        Fri, 08 Nov 2024 01:42:13 -0800 (PST)
Received: from localhost ([106.38.221.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177de041dsm26255915ad.103.2024.11.08.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 01:42:12 -0800 (PST)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next] mctp i2c: notify user space on TX failure
Date: Fri,  8 Nov 2024 17:42:06 +0800
Message-Id: <20241108094206.2808293-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Currently, there is no error handling mechanism for TX failures, causing
user space to remain unaware of these failures until a timeout occurs.
This leads to unnecessary waiting and delays.

This update sends an immediate error notification to user space upon TX
failure, reducing wait times and improving response handling for failed
tx.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/net/mctp/mctp-i2c.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/mctp/mctp-i2c.c b/drivers/net/mctp/mctp-i2c.c
index 4dc057c121f5..e9a835606dfc 100644
--- a/drivers/net/mctp/mctp-i2c.c
+++ b/drivers/net/mctp/mctp-i2c.c
@@ -485,6 +485,7 @@ static void mctp_i2c_xmit(struct mctp_i2c_dev *midev, struct sk_buff *skb)
 	struct mctp_i2c_hdr *hdr;
 	struct i2c_msg msg = {0};
 	u8 *pecp;
+	struct sock *sk;
 	int rc;
 
 	fs = mctp_i2c_get_tx_flow_state(midev, skb);
@@ -551,6 +552,14 @@ static void mctp_i2c_xmit(struct mctp_i2c_dev *midev, struct sk_buff *skb)
 		dev_warn_ratelimited(&midev->adapter->dev,
 				     "__i2c_transfer failed %d\n", rc);
 		stats->tx_errors++;
+
+		sk = skb->sk;
+		if (sk) {
+			sk->sk_err = -rc;
+			if (!sock_flag(sk, SOCK_DEAD))
+				sk_error_report(sk);
+		}
+
 	} else {
 		stats->tx_bytes += skb->len;
 		stats->tx_packets++;
-- 
2.30.2

