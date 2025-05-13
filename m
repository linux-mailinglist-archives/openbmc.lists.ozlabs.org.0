Return-Path: <openbmc+bounces-44-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10647AB5688
	for <lists+openbmc@lfdr.de>; Tue, 13 May 2025 15:53:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxdHJ4LVwz2xdL;
	Tue, 13 May 2025 23:53:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747144428;
	cv=none; b=cdlt+FHBnOafmWB0C6zQtGv7kLUJnMjtj0kOCryavLyhHH4+fAM5cBsIOKmJ6Gieigsuzc+pAQBZTvVq2SqaV2WfHyR8HDixwqFL3j2ZcVfBNj9H5xBc3Q65/z/eyBUu4XTmkKQeYfwFMuT2Pa0ytuJa/5yILVNwmYNgGr4dUrohv7EHoUGVaW4r9qcwG1/6NagRwTqGFgCm3Q8Y8jDNnNL1uKA6pElRwZXzknJeeyrlPVyWfnn16EuLadTpcYVcBLc6GrUGiqd4SH37SwLidhKMwsomilpXIsbVHbY8ZD36ag/Ou4sztrsc5DoNKx8fvhR0M48r9JDqA+Okfck6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747144428; c=relaxed/relaxed;
	bh=feHfFjzV5hdYclgn/8DBAPy7t03U5BNeW+7IhUZnohs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ee15EDn1Qv26APBT/1LnO475d2I/gFzt5vuO4+0Uv8SOfotPteeBgWCA6BUOHRL/S3JjFx+Dcx9BFBWstuB+/Igu+0BbMgU4dfJMbYaPhYbjY8kfdM3/5kl8OZ+dfylxt877v8sXbwr5G6o999zMxLI4d7VJECFXatl/xLAJkDESBADjM8ac2x6HhSgXUpvivckIlGe8+ZeFcOxJS8ei0d4K4w8loaeHK+u0n4iNdxw3dK95P47IEbAJkwPQRu7Iv/O/mfmLj707JDNG7cWKPXNaDlpfe9N9zTBH4WkVi/rCAOq5klculjG7hP6S31ud4uATDtAB8KewSGMJCE7UIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dzp7Q5rp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dzp7Q5rp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxdHH27myz2xCC
	for <openbmc@lists.ozlabs.org>; Tue, 13 May 2025 23:53:46 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30c54b40112so2660705a91.2
        for <openbmc@lists.ozlabs.org>; Tue, 13 May 2025 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747144424; x=1747749224; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=feHfFjzV5hdYclgn/8DBAPy7t03U5BNeW+7IhUZnohs=;
        b=dzp7Q5rp4XWGai3jac/J+2eicOGGeCGUGUhvxjTnnD3PZaCcZot5ybFUvaoQXwkLXV
         QC7Iq5H4DyJqg2hFLKfOFf2nspJHJm1ZdOjquuZrdjK/eULRLt0xp0bLOa20pmXI2z9K
         OZr62jRuKJ5L0cmAaYp+9trtXyAUVx4Ghem5/1sphrXRuaFvY7POLZdNWojWZYxaCo3H
         iOmnxAGs0S8ABmLHTI6mGQALC3ElkkCqgL+W2t28feOvpOMlj71MkGXCv0K0NNdhDyVx
         o4DjjgwpjOanlPoAvWpnRQoSoNBZc8QW/M070vW3exItt2SZhIuygvsLE4pdFx7D3riv
         YTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144424; x=1747749224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feHfFjzV5hdYclgn/8DBAPy7t03U5BNeW+7IhUZnohs=;
        b=YC7iOtpujdWe3fEgR2xWQV5D5YriPmwIl18OFGsCbUBXwTX2wO51OXDWieU1Wa+Mdt
         i+R11tjBKxn0zG6vQQg5DSL+ZDZYAGJU2ZpAFdTqfwF8vcIUNl2EOusCVvfAIXynzqcS
         CiYnVZOHuunEdm08nVtwiFvQShejphKABczetaxTkKrjuqDfaElxSiO5HlP+s3hzDBcs
         zXnLOGW84N3566D6E3oz49wbFIOq4DmnGHlR5OIY7iOP/3OvyQnZcWO6EI6m2L7c0bHR
         m6nHJaI4Li2PXO56tNm4fshLwWeXFIAJL6cffP3XNPqErkmyif/G5pQJB7+e0pI48kEI
         ZTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIs/U10DX6hriSrR46I50HC39frGtI0zSZrl+CdWaqS5oqzeb3ArphY6qK6hz9/7+h/27GEiZt@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFCMyLIrLEczsaQ4wua30aNMHY9chBfhGutJWTed/uhyDfT2Ax
	IN3OCcD6GNzP8A9Wvsd5W2Jumb5z2PkFAwXWA7b9h3pFWgQNxpUk
X-Gm-Gg: ASbGncstyt0AERiUxHyFmB/D24beUXud/OieQCfONNVERPNu5/rtEsOnCPDfnm/JkUm
	eKt/gKZ1TCSZI+siZ+GRmRqfAnxcAIpulTr9NC1sxeb3BGjEohRrGwPPd34ipeWxqufK4WgnMCw
	5NNJJrpVgZo9HdpOUCmjIG+iAdPkyUEwBJuL1iSINQpHZneyGezXFdiZGlaVRoYmv4Ce5dcgKlV
	6Xwrl5qunnPLcV/VZYJYQk8QSfFPlTNjDoUAKT5DOYbvqiEmkVX2izUA8B6cnoyvdgDhwuBJw9f
	urLG7GsbRCtemZ17RgWDUnFCbvH/EEUy3ttZ3Dsi7xOl2p2m/FMxlp8gse9NpAFFPTPOYcKwRh9
	eQqBICAkI2TZAiEHcxks1HFOGCFagrHZWjPNZ0iHUQdrmoDt1EtF2
X-Google-Smtp-Source: AGHT+IGKZG5PS0dGjTyybRjrqYrwA7/uH3H+7nqxaW7Mjm3xfW9/1mUV4UhsAKkGSsctkRSPDMKdeg==
X-Received: by 2002:a17:90b:3ec6:b0:2ff:7b28:a519 with SMTP id 98e67ed59e1d1-30c3d650519mr25787659a91.30.1747144423957;
        Tue, 13 May 2025 06:53:43 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4ffb4a0sm10773737a91.46.2025.05.13.06.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:53:43 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: [PATCH linux dev-6.6] usb: typec: tcpm: Add support for parsing pd-revision DT property
Date: Tue, 13 May 2025 21:53:24 +0800
Message-ID: <20250513135324.1616086-1-chou.cosmo@gmail.com>
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
---
 drivers/usb/typec/tcpm/tcpm.c | 46 +++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6021eeb903fe..59621cfaee3d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -310,6 +310,13 @@ struct pd_data {
 	unsigned int operating_snk_mw;
 };
 
+struct pd_revision_info {
+	u8 rev_major;
+	u8 rev_minor;
+	u8 ver_major;
+	u8 ver_minor;
+};
+
 /*
  * @sink_wait_cap_time: Deadline (in ms) for tTypeCSinkWaitCap timer
  * @ps_src_wait_off_time: Deadline (in ms) for tPSSourceOff timer
@@ -567,6 +574,9 @@ struct tcpm_port {
 
 	/* Timer deadline values configured at runtime */
 	struct pd_timings timings;
+
+	/* Indicates maximum (revision, version) supported */
+	struct pd_revision_info pd_rev;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *dentry;
 	struct mutex logbuffer_lock;	/* log buffer access lock */
@@ -7036,7 +7046,9 @@ static void tcpm_port_unregister_pd(struct tcpm_port *port)
 
 static int tcpm_port_register_pd(struct tcpm_port *port)
 {
-	struct usb_power_delivery_desc desc = { port->typec_caps.pd_revision };
+	u16 pd_revision = port->typec_caps.pd_revision;
+	u16 pd_version = port->pd_rev.ver_major << 8 | port->pd_rev.ver_minor;
+	struct usb_power_delivery_desc desc = { pd_revision, pd_version };
 	struct usb_power_delivery_capabilities *cap;
 	int ret, i;
 
@@ -7331,6 +7343,29 @@ static int tcpm_fw_get_snk_vdos(struct tcpm_port *port, struct fwnode_handle *fw
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
@@ -7669,11 +7704,18 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 		goto out_destroy_wq;
 
 	tcpm_fw_get_timings(port, tcpc->fwnode);
+	tcpm_fw_get_pd_revision(port, tcpc->fwnode);
 
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


