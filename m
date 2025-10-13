Return-Path: <openbmc+bounces-733-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A9EBD13F7
	for <lists+openbmc@lfdr.de>; Mon, 13 Oct 2025 04:48:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clMH7135Zz301G;
	Mon, 13 Oct 2025 13:48:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760323715;
	cv=none; b=jLccJ8PBKy5qXfGKY+m+7hjw0OLIa0gge7gA+nCFy98i4k4YHeqPxJTsl4z9JkQ2VgqJ/a6EXUU0+HBcAUhUanZHpL3lDKU8v4cYg9KPJtE+2h0HvZ54tw47iH1MKJcfFGrg1GdLr/UCcrfsdAeGq896aqObQba/dMuBex2O4cm9R/CGIZJohku7+Ic7aD2g9luGHgtTMNlHxuRQc1O1A/mu627D9Q5JoVV0aLTN+9QUxcBu/SNPDD2Gl3Qd/+pxUzwppR+HHxM03FIIv8WNiQ+V+wDGLYUtAqg3Xg8TTNwiCWsXjzLvNWTFAZODM7pcMIHzQ4FOYB+HMXQDvZEr5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760323715; c=relaxed/relaxed;
	bh=LYwrZODlGxExEtUnAKGfsrjALZ/f6UFbgI/19/EpgqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LlsKPzycRoM0fmJxOV4I+alxJEbeGMaaIkwPTKIlxpaek8Y8vukunENTb3DyMU8D5KgQdDpLQbVMi+awXAU8X3m8rW9dzQjKkAoMtdJccrkVAavaSM0e60qsFOviaZCZ75M9U7HyxSDFq3UaONj0mXrl4mqxZmOTv1LD15Cx5/LAFyfb8gxJgXtH10Ndn+OOt5P8rC0DosvvRyQ3ZfSVNdx+3pVdlrEdQSP4FrpxAbDf8Iz/EutW7OZrvsRffAJB0+EgA5lOSTkxFjsyUcfEhChgRdGpDmyxtP3qvAzzN3ECQ+8jboeS6hlaOBWRF+Sp3C6+dJOAWG9AIT6F9T42eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OaDhS55r; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OaDhS55r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clMH6060Zz2xQ0
	for <openbmc@lists.ozlabs.org>; Mon, 13 Oct 2025 13:48:33 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b67684e2904so1912910a12.2
        for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 19:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760323711; x=1760928511; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LYwrZODlGxExEtUnAKGfsrjALZ/f6UFbgI/19/EpgqQ=;
        b=OaDhS55rXhR2QpRb22sFPJXSr6bS4UPj7xZ+GYnKG21U5tSN9oJTqmJsgLerMtMfXL
         FgHAv1mZN5iQFqQxss2sdZQvC5zHsKXGMotmnDIf8KOu0EUUbTqWEVaUWkT2tgzpR1Ov
         lU43yfUxW9ex0rb4Kl8g/EIe9K6vBLpm5cVZSuFv6Mf2Zl1h1IG/4t/LZczmEbogsoB/
         ALqOLHdE0tavqno8EJQA0+x6gRWPb9638SF+SYaUgQ0NKVKadMAnFgz2mGYJXuNAotkS
         ZC2C7Yg30ywb/3NwK0ngLzael7DFhDsGtlRtmIjrtmHrxah14SFrVjUimdwmpHYeWaTs
         l+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760323711; x=1760928511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYwrZODlGxExEtUnAKGfsrjALZ/f6UFbgI/19/EpgqQ=;
        b=DSVrPYjEBvrjPHAHvOTqorsZ5LNAyJq2cGFMFi18PQad2JIQ5kTkY7c5fU2AxEWd7l
         jV9WMF3xRfmRmy+e4mP/tUGcX2CfcSHdKEPaIh5M+w5hzQAPf+SAAchF7kP9m0GuxOoB
         ksSoukXXrV49M/aDLiEMiD3Q1N+3XAPqSxZxN2C/Z+EZ4Ti0tPwgkz9j5K8t27lPN//d
         wAsfFdwtKfM9CCpBwwFldi1VKoOAGtOFF2hEjC70wgX7pqZIAyJvxaWr8ThDgjCZhYFj
         uhsz58BYuKl/E/HJgj/ybmxFjeFuXL5JuvjTeYUnIZN+8I7UYSejNB/3Q4h5yZ0Lmsez
         bTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHpltFGlLEk8ThuKXhc/CV5F79xuZN3aOShD3Go649fZq2gxrrKRMZzTOrblPqQP1HxX70CkVq@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywk1cDXm5pmfDz+zZf4P8tx+M2dmuqACYu2ZZPXjyCHIPuos8Mf
	XaiS8SJD61ZH0bKnfDXU9buM/ozXxzyRHLzu0H9ogzIns2Q80O2B9oM5
X-Gm-Gg: ASbGncsHYS7mGCoRY4NXdQZDTWMBvJV0/yZX6TPaA+7gr3FTTjxVBMbu9GjmqTyRQkB
	GL6vnSVOBjZ+mrVSulvIQE2u/Vxgk4QhBb9O4+FPkMOoVog8IKcwl3R4An8EBuXDRnvRssuwjy4
	tyhxh9ve+T74YQBxQ6BrR7TA5nt/xZ8d5kfyotY44dBNoWiKfXrDgZXfYisCcEPrshSGSWijrlL
	HNQiHPGUL7/mV7hFR92grSCd/6pZPbCqKp7pIdlttTMuSv2DFIpbCpaX6R12cj6urtOyWeC7+Mw
	ADXHO7Fk21ONaM2Y6ZCL5uRcsfUSI4b7dlshF3F60rP0jdgeitjeOrHosx9U94W5HgDMDmAxlgh
	EdgBfQW0s3g3JcMnxSB/2D63IrRdcdc/ILSINfSOM9vzpC1/B0iqhnEg9BMOyAYxyJM8dYXgh6S
	b9oR9mr6z9z3rFMkKkmxH/bMurz7V7ZyNeFTgHgVSIVQ+vMnY8A/qJ
X-Google-Smtp-Source: AGHT+IEPSr4af3AzsQ7DiUd+QGCYCUKlGw0mG7ZrvwcRpwWZsEDK3o6Je6Pxp5/3NZ5DNmxZzOKhtw==
X-Received: by 2002:a17:903:37d0:b0:24d:1f99:713a with SMTP id d9443c01a7336-290273ef0a6mr248868405ad.31.1760323710724;
        Sun, 12 Oct 2025 19:48:30 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36408sm117760535ad.91.2025.10.12.19.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:48:30 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: [PATCH linux dev-6.12] usb: typec: tcpm: Add support for parsing pd-revision DT property
Date: Mon, 13 Oct 2025 10:46:22 +0800
Message-ID: <20251013024622.558056-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Amit Sunil Dhamne <amitsd@google.com>

Add support for parsing "pd-revision" DT property in TCPM and store PD
revision and version supported by the Type-C connnector.

It should be noted that the PD revision is the maximum possible revision
supported by the port. This is different from the 2 bit revision set in
PD msg headers. The purpose of the 2 bit revision value is to negotiate
between Rev 2.X & 3.X spec rev as part of contract negotiation, while
this is used for Get_Revision AMS after a contract is in place.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Link: https://lore.kernel.org/r/20241210-get_rev_upstream-v2-2-d0094e52d48f@google.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Cosmo: Resolved merge conflicts for backport]
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 47 +++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 92ce01b7d049..4fdf5b229b1d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -311,6 +311,13 @@ struct pd_data {
 	unsigned int operating_snk_mw;
 };
 
+struct pd_revision_info {
+	u8 rev_major;
+	u8 rev_minor;
+	u8 ver_major;
+	u8 ver_minor;
+};
+
 struct tcpm_port {
 	struct device *dev;
 
@@ -553,6 +560,9 @@ struct tcpm_port {
 	 */
 	unsigned int message_id_prime;
 	unsigned int rx_msgid_prime;
+
+	/* Indicates maximum (revision, version) supported */
+	struct pd_revision_info pd_rev;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dentry;
 	struct mutex logbuffer_lock;	/* log buffer access lock */
@@ -7081,7 +7091,9 @@ static void tcpm_port_unregister_pd(struct tcpm_port *port)
 
 static int tcpm_port_register_pd(struct tcpm_port *port)
 {
-	struct usb_power_delivery_desc desc = { port->typec_caps.pd_revision };
+	u16 pd_revision = port->typec_caps.pd_revision;
+	u16 pd_version = port->pd_rev.ver_major << 8 | port->pd_rev.ver_minor;
+	struct usb_power_delivery_desc desc = { pd_revision, pd_version };
 	struct usb_power_delivery_capabilities *cap;
 	int ret, i;
 
@@ -7348,6 +7360,29 @@ static int tcpm_fw_get_snk_vdos(struct tcpm_port *port, struct fwnode_handle *fw
 	return 0;
 }
 
+static void tcpm_fw_get_pd_revision(struct tcpm_port *port, struct fwnode_handle *fwnode)
+{
+	int ret;
+	u8 val[4];
+
+	ret = fwnode_property_count_u8(fwnode, "pd-revision");
+	if (!ret || ret != 4) {
+		tcpm_log(port, "Unable to find pd-revision property or incorrect array size");
+		return;
+	}
+
+	ret = fwnode_property_read_u8_array(fwnode, "pd-revision", val, 4);
+	if (ret) {
+		tcpm_log(port, "Failed to parse pd-revision, ret:(%d)", ret);
+		return;
+	}
+
+	port->pd_rev.rev_major = val[0];
+	port->pd_rev.rev_minor = val[1];
+	port->pd_rev.ver_major = val[2];
+	port->pd_rev.ver_minor = val[3];
+}
+
 /* Power Supply access to expose source power information */
 enum tcpm_psy_online_states {
 	TCPM_PSY_OFFLINE = 0,
@@ -7685,10 +7720,18 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	if (err < 0)
 		goto out_destroy_wq;
 
+	tcpm_fw_get_pd_revision(port, tcpc->fwnode);
+
 	port->try_role = port->typec_caps.prefer_role;
 
 	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
-	port->typec_caps.pd_revision = 0x0300;	/* USB-PD spec release 3.0 */
+
+	if (port->pd_rev.rev_major)
+		port->typec_caps.pd_revision = port->pd_rev.rev_major << 8 |
+					       port->pd_rev.rev_minor;
+	else
+		port->typec_caps.pd_revision = 0x0300;	/* USB-PD spec release 3.0 */
+
 	port->typec_caps.svdm_version = SVDM_VER_2_0;
 	port->typec_caps.driver_data = port;
 	port->typec_caps.ops = &tcpm_ops;
-- 
2.43.0


