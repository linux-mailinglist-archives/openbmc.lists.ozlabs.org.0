Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A00DB231E14
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 14:08:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGslR6sSwzDqFm
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 22:08:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gqXqlLEn; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGsP90K43zDqLB
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 21:53:00 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id a9so1764100pjd.3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jBwyH16q8ID5M7mEXLpDARx1ZsyJ+Y5NumjRCWriK0M=;
 b=gqXqlLEnAtX50TurZkPgwf87jszNzH7J2I4f9xeZQQTjk6/TqebphkQtutHme+2rR7
 vmhZPjcUH68pia8sRLYORu/R/R9CItX3rLTnM52ZjGkJ2eF3d9kBtswU/E2iVUH40dic
 4X3LiCVPlR5EApQueUPaNOINYkN4aHEcmrFBekapRDlC0bE4xQ2i2lkaET1MczUpDxHb
 IR3IC4cMCW7FDlcCQmpobQRNsMf7/yZltXxBAj6eBTslUNEqKsNQmWZ/P8XHW+o++Q/h
 aVox19co3ziV5bxf4FUejSueGzicD9x9daKkBP47YdD1sw6sKAPLLTNVnmxDxM2KH3jO
 DOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jBwyH16q8ID5M7mEXLpDARx1ZsyJ+Y5NumjRCWriK0M=;
 b=IddqyOimIyPBkb9QnHjm391k9qXgsrOlV8nSNljT1//rDdHAp7rhSHPQnONCjOrjBJ
 ls59BiP+HyOAsgFfVmYcVXf/crKs6tLuRSk+vSrpnznGQeXgMd4ni5Oy71lBCyrFMg4U
 ZLn5JZCVSSKfHaVNeix14sNI1mB9VjcpUsZ/iYL8ITNYdzR0U3kKV7+UKU6raOhPm/L4
 Xf3Hy4KYAOF10idMLfCCWJYYp3b2aU+zPei09GG3WvQJ9vfNF9kn/G8m+FzNSIAkS02v
 PeEUuUNwbNFcbFiGxKm0Ig0LSFB/bLac7C6SqvsoOCPJ4hpMBd4D8nWmkPLGqPzKYtYP
 T9ag==
X-Gm-Message-State: AOAM533sLgO/CAehBymJx5nKBntvl58IkKZZ5ZY3rxSH5lrHyG3z84Ex
 Sod+9LInwNd55PrqBYvPp4k3KAcZhg0=
X-Google-Smtp-Source: ABdhPJyjcVh7ahCnDPffTwLAcfcCtm+8zIpTf5XkfCa61XIsPsigb9/i7t9k0kz1VFhD4bxsmis1GQ==
X-Received: by 2002:a17:902:a40f:: with SMTP id
 p15mr26743663plq.221.1596023577117; 
 Wed, 29 Jul 2020 04:52:57 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 207sm2203292pfz.203.2020.07.29.04.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 04:52:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.7 1/2] fsi: scom: Add dev_dbg in put_scom and
 get_scom paths
Date: Wed, 29 Jul 2020 21:22:43 +0930
Message-Id: <20200729115244.357600-2-joel@jms.id.au>
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

This helps understand scom failures by producing more information about
the state of the slave.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-scom.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 004dc03ccf09..55f30abd20b2 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -240,6 +240,8 @@ static int handle_fsi2pib_status(struct scom_device *scom, uint32_t status)
 {
 	uint32_t dummy = -1;
 
+	dev_dbg(&scom->dev, "handle_fsi2pib_status %08x\n", status);
+
 	if (status & SCOM_STATUS_PROTECTION)
 		return -EPERM;
 	if (status & SCOM_STATUS_PARITY) {
@@ -288,8 +290,12 @@ static int put_scom(struct scom_device *scom, uint64_t value,
 	int rc, retries;
 
 	for (retries = 0; retries < SCOM_MAX_RETRIES; retries++) {
+		dev_dbg(&scom->dev, "put_scom retry %d\n", retries);
+
 		rc = raw_put_scom(scom, value, addr, &status);
 		if (rc) {
+			dev_dbg(&scom->dev, "raw_put_scom failed rc = %d\n", rc);
+
 			/* Try resetting the bridge if FSI fails */
 			if (rc != -ENODEV && retries == 0) {
 				fsi_device_write(scom->fsi_dev, SCOM_FSI2PIB_RESET_REG,
@@ -322,9 +328,13 @@ static int get_scom(struct scom_device *scom, uint64_t *value,
 	int rc, retries;
 
 	for (retries = 0; retries < SCOM_MAX_RETRIES; retries++) {
+		dev_dbg(&scom->dev, "get_scom retry %d\n", retries);
+
 		rc = raw_get_scom(scom, value, addr, &status);
 		if (rc) {
 			/* Try resetting the bridge if FSI fails */
+			dev_dbg(&scom->dev, "raw_get_scom failed rc = %d\n", rc);
+
 			if (rc != -ENODEV && retries == 0) {
 				fsi_device_write(scom->fsi_dev, SCOM_FSI2PIB_RESET_REG,
 						 &dummy, sizeof(uint32_t));
-- 
2.27.0

