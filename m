Return-Path: <openbmc+bounces-48-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A5AB9A90
	for <lists+openbmc@lfdr.de>; Fri, 16 May 2025 12:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzP7L1xR8z2y3b;
	Fri, 16 May 2025 20:53:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747392782;
	cv=none; b=gBVWcGL2xQOI3jCpC4Ohe8pjO2XnIgVvc3j0CoXj4cvksfPkDobnjqbr/B/lIUYeerSDntcvmx2PAJTXGOMO+6esNd9oA4FQXb2LPMFJTfncFB8utACnhEaVqM2oR5inLT7RS0NPb/fnFzN8JQRvpkkM8HgWAGULOh1TEl5jQz7y7ajWbtvzM9YQh4P5gs2KsYe0QnnYvP7s5AoPT+780ey4Vx7G88NSCmNzs+wq3BziUjQo9hzGg6xg5HZoKrpXmVbz9yn7jqG5BaHG67LV2ywrtES8X+9+M5qrGoiI+yYu0nq4WkAsCWWFf0rGkYMZyRnLJ25PP2JFqqL3UFsjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747392782; c=relaxed/relaxed;
	bh=RkY4qsdVBiY/6iFY1K8IbuLCpjqJAbyozvHL3ufa7ts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EP2Re5Wgh+Rqeuy38tlFfvX32ifGPuIn69lbpejzLu9FPoCPiEfLYIZpzmT3C+YY9p00PiLIm18c8SwLvKHhtUE7tO/9vEU8LeU7DLUr2dJvukOrcej5NZQcHKrfA6IbZbXuKLxmpB93etqWZzdO6i+dCn7cjGX/8W783Gm8PTbFnQdDEvl8zaYhR9iRcZ0VG7K8uJHWmxFJoOCqcLJ9KXwoS/fuio0Uw+PavWi9OSVHHu/MFE0HbrcslOaC7WBvZ+yC5T75zdu6yfWYn8tt52EyzPPYhRxcPto7RHNmm9cSP7QqcC7qzBUYVu+8eyKQAVvvz7cTN+jqBPx8HeRUiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y1TA+5TY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y1TA+5TY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZzP7F1Gz2z2xyD
	for <openbmc@lists.ozlabs.org>; Fri, 16 May 2025 20:52:55 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2301ac32320so21402135ad.1
        for <openbmc@lists.ozlabs.org>; Fri, 16 May 2025 03:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747392772; x=1747997572; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkY4qsdVBiY/6iFY1K8IbuLCpjqJAbyozvHL3ufa7ts=;
        b=Y1TA+5TYWGH6dY11487ixueGfAwhjz1lgh+3584TY48ZvnqcHM9UOq+MevH8+MtVdq
         dNQKzf9N+2/nnuQtG2DELYIdqlkJSifvS2NCkDX/mpP/+uZLZBkjs7qsK2uM0JM+FnRu
         GiVbDCfcxS3yNreG1dLFVSWy9eMZImerVGTPLtQr7kr3zZNhzY19JplMT1Q5M9SkULur
         HrJNn8PvqxfV8tylp6BcWDvSYbmQN3oGapUYQjkk/w9lQpXwjFOM4rT90Nq/tNrxSMwE
         t34o8N2zTo71IqoE1Nl0+KHlD+G+QNgF1RpLeC/Al01JYTxENY9Rm4HFw0RNZlb856Oj
         0QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747392772; x=1747997572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkY4qsdVBiY/6iFY1K8IbuLCpjqJAbyozvHL3ufa7ts=;
        b=vf30Cnh2C+V3e/j15WBD+GQ4VzewdU7kBftfIkyPlhhtFyTP81CGwVjd6MhtzQvw1u
         0ruVcHXcwVfyx0x7cE2p7xBM8JqQtw8YWSUfYlFwGM1gR7NQOxfyMKRBJT+RCTdliC73
         557TjOPDYniXWxB40Zc14M2Py1VjnhyKh9lna/O6m4f5WLsrGiOJbLkXfbFG4mho6Sdi
         xJW0rcUQ9/7xMbonfsIXxjFadjZ67KIcVlSD+WIPJEsu+sfC2YeEKlONTh6n9Mdt8ueh
         TNo4iYElrhUGSFys/lUF7q79lsGg+gjKUt9r5YOXFFaYHuO7cAS0i0Uw+XGZ6EzdVd0S
         Hlug==
X-Forwarded-Encrypted: i=1; AJvYcCWDcwP7eiWpjymroqqm7nvZ4owGsIgvUqxDokBmVWLxPsUhCWB9UkuW1BHRs69li9Nig9h/qj97@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzldkUPujPTEn1G/YCdzp2RJKKxpfvti2RAh6UltmZgXhlUTPz3
	RIY3Lze3pU4Iqj3IgrRtAjNAMmCKcLca2vWlSEayTBB22TD4CjBgnQ5X
X-Gm-Gg: ASbGncuXzvyf15sCsHxlZB1EzVHU4VaoeBBnh28lWT7SlvnCmVSCC/W/663RUEVM83a
	lT3COdsubHgEJRwIyaHQPpE9S8uFw14tj4zUGn3ADQePp3JqolKhUQr3TUwioPtHYUyHGRLnRYq
	vdtRggPsr+rK+IdK2q2LGq876wTa9oP1Ds5Qg1uMAerkYdORtkSyz/9IXvU+KDjv6Nwc59FP3x7
	AQII+RATdxxAIr85gltZMA0QXDcSJ4zpzBjDKPiyyDF4hKZSExSsksL8NFGXVeY4jGCh2bMuxff
	bS2w/NN9Xhyakh2u3k62bLpUglRlakF6oDy8GzeMqAItfY7NNZl5O4Gk3l7u+QyC/hwmKznfzzI
	+r7vTC6zLiYcKj3TfugdaW4QwPsB31e4CRs2QfSfl6Ma9y40Ar7/S
X-Google-Smtp-Source: AGHT+IHg4UB9iifJ1/Fx3FInL71y/Eaakinjh5OvNrNhXnAgH9A5Ev4Vb5sYq6NodcDMrQpIUYPXtg==
X-Received: by 2002:a17:902:e842:b0:227:e980:919d with SMTP id d9443c01a7336-231d45afcccmr34271995ad.47.1747392772541;
        Fri, 16 May 2025 03:52:52 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97defsm11737785ad.118.2025.05.16.03.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:52:52 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: [PATCH linux dev-6.6 v2] usb: typec: tcpm: Add support for parsing pd-revision DT property
Date: Fri, 16 May 2025 18:52:22 +0800
Message-ID: <20250516105223.1804718-1-chou.cosmo@gmail.com>
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
index 790aadab72a3..bad2f002dfc8 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -296,6 +296,13 @@ struct pd_pps_data {
 	bool active;
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
 
@@ -492,6 +499,9 @@ struct tcpm_port {
 	 * transitions.
 	 */
 	bool potential_contaminant;
+
+	/* Indicates maximum (revision, version) supported */
+	struct pd_revision_info pd_rev;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dentry;
 	struct mutex logbuffer_lock;	/* log buffer access lock */
@@ -6098,7 +6108,9 @@ static void tcpm_port_unregister_pd(struct tcpm_port *port)
 
 static int tcpm_port_register_pd(struct tcpm_port *port)
 {
-	struct usb_power_delivery_desc desc = { port->typec_caps.pd_revision };
+	u16 pd_revision = port->typec_caps.pd_revision;
+	u16 pd_version = port->pd_rev.ver_major << 8 | port->pd_rev.ver_minor;
+	struct usb_power_delivery_desc desc = { pd_revision, pd_version };
 	struct usb_power_delivery_capabilities_desc caps = { };
 	struct usb_power_delivery_capabilities *cap;
 	int ret;
@@ -6270,6 +6282,29 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
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
@@ -6609,11 +6644,19 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	if (err < 0)
 		goto out_destroy_wq;
 
+	tcpm_fw_get_pd_revision(port, tcpc->fwnode);
+
 	port->try_role = port->typec_caps.prefer_role;
 
 	port->typec_caps.fwnode = tcpc->fwnode;
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


