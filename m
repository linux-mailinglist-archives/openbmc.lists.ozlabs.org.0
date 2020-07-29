Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED043231E49
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 14:11:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGspN6rrqzDr3p
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 22:11:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bRlZe9Hc; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGsPC2N7vzDqdP
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 21:53:03 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id p1so11694421pls.4
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 04:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=St/+7ayviEgbDLRj84Q1cvjlQL2oZHoqqklevGup+Ek=;
 b=bRlZe9HcKiiUD24qNFkc3iKEetyRovEYNUmvKbGUotPZOb4sRnH6QoD++oVYbZZlwP
 rjMYSGSx/GW4ad1tDu/jBvsaHUuvpM+t1b829AhspY4FepZn2dDdXcxJJqq8C8haWJu/
 kd3eNxiQAohbLALOMD/dfichl9oZJuyoy/rHCUvWuJd2nLTqimyklZ3lKQlPb+7kaSnd
 NQjbFOgCtq0r6P49lFDqjOo1JK1DuZiKdS37H30JfSZQ+sPANmXjmFbOzT8EqEirvtGG
 yKiQISi0+LIRWk7kT351ye8bdrYqf9OMTEvRzEyNeEeFrsCXaqwHW0+Rck1AluF0mvPP
 /VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=St/+7ayviEgbDLRj84Q1cvjlQL2oZHoqqklevGup+Ek=;
 b=nrGgyIwK2grEMuonIhTi7bvHC5KDDEwzc+dOu9I7YPZDZ4X6ppI1XPgWJuqnFDoN0g
 sjNjz2u5VEnlF4u3KoRdjBvvAncqClbSXWmxs1bmlmN1jAxcBv0cQeOJenFSzqED6GjT
 NauTbiGw47IUzFZISvYlZ3uIQWDM7kePwRGuYtwgaHAPs78mePcvUVwmAYzCtHt13qOM
 4JwIioJIkNykk7NqkTPUY4ygl0TtcBuarBbb2Sz3b4E/NoWXkiA9BQ18gjppwUVKUACE
 FHLhn1e0LnWhy+oIfWxj+swZKQK8lvDJcv6jXViK4XK3WBatrR7gB8HM/G/oVasMRn7X
 BAcA==
X-Gm-Message-State: AOAM530l3jM0rKQfunSj4YpByOBT73xxYJK68evctMaaTcIkI8MX2DmU
 TMMo3d27wovnW4L3/MFVEPZOBWXnMmc=
X-Google-Smtp-Source: ABdhPJwdJ8JoZ9Y+6DHWdpuK+OKbnbGKQNqA0D9GLrncgkimJv041XhRkbuDlitJjhTJ3hV4vBI9YA==
X-Received: by 2002:a17:90b:19cc:: with SMTP id
 nm12mr9225621pjb.144.1596023580254; 
 Wed, 29 Jul 2020 04:53:00 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 207sm2203292pfz.203.2020.07.29.04.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 04:52:59 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.7 2/2] fsi: scom: Handle FSI2PIB timeout
Date: Wed, 29 Jul 2020 21:22:44 +0930
Message-Id: <20200729115244.357600-3-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729115244.357600-1-joel@jms.id.au>
References: <20200729115244.357600-1-joel@jms.id.au>
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When the scom engine indicates a FSI2PIB timeout we can recover by
writing any value to the reset register.

On a machine capable of doing SCOMs, the 0x30000 address will fail and
cause subsequent accesses to fail:

 $ pdbg -p0 -b kernel getscom 0xf000f
 p0: 0x00000000000f000f = 0x120da04900800000 (/proc0/pib)
 $ pdbg -p0 -b kernel getscom 0x30000
 p0: 0x0000000000030000 failed (/proc0/pib)
 $ pdbg -p0 -b kernel getscom 0xf000f
 p0: 0x00000000000f000f failed (/proc0/pib)

After this patch, the kernel will detect and clear the error, allowing
subsequent accesses to succeed:

 $ pdbg -p0 -b kernel getscom 0xf000f
 p0: 0x00000000000f000f = 0x120da04900800000 (/proc0/pib)
 $ pdbg -p0 -b kernel getscom 0x30000
 p0: 0x0000000000030000 failed (/proc0/pib)
 $ pdbg -p0 -b kernel getscom 0xf000f
 p0: 0x00000000000f000f = 0x120da04900800000 (/proc0/pib)

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-scom.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 55f30abd20b2..dc6db25a6a8a 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -38,6 +38,15 @@
 #define SCOM_STATUS_PIB_RESP_MASK	0x00007000
 #define SCOM_STATUS_PIB_RESP_SHIFT	12
 
+/* Values the SCOM_STATUS_PIB_RESP_MASK can take */
+#define SCOM_PIB_ERR_XSCOM_BLOCKED	0x00004000
+#define SCOM_PIB_ERR_CHIPLET_OFFLINE	0x00002000
+#define SCOM_PIB_ERR_PARTIAL_GOOD	0x00006000
+#define SCOM_PIB_ERR_INVALID_ADDR	0x00001000
+#define SCOM_PIB_ERR_CLOCK		0x00005000
+#define SCOM_PIB_ERR_HANDSHAKE		0x00003000
+#define SCOM_PIB_ERR_TIMEOUT		0x00007000
+
 #define SCOM_STATUS_ANY_ERR		(SCOM_STATUS_PROTECTION | \
 					 SCOM_STATUS_PARITY |	  \
 					 SCOM_STATUS_PIB_ABORT | \
@@ -249,9 +258,19 @@ static int handle_fsi2pib_status(struct scom_device *scom, uint32_t status)
 				 sizeof(uint32_t));
 		return -EIO;
 	}
+
+	if (status & SCOM_PIB_ERR_TIMEOUT) {
+		dev_dbg(&scom->dev, "PIB timeout, recovering\n");
+		fsi_device_write(scom->fsi_dev, SCOM_FSI2PIB_RESET_REG,
+				 &dummy, sizeof(uint32_t));
+		/* Return -EBUSY to force a retry */
+		return -EBUSY;
+	}
+
 	/* Return -EBUSY on PIB abort to force a retry */
 	if (status & SCOM_STATUS_PIB_ABORT)
 		return -EBUSY;
+
 	return 0;
 }
 
-- 
2.27.0

