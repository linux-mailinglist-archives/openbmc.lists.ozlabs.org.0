Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B9E68FC92
	for <lists+openbmc@lfdr.de>; Thu,  9 Feb 2023 02:17:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBzVf0ymNz3cbV
	for <lists+openbmc@lfdr.de>; Thu,  9 Feb 2023 12:17:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bNYvWYkT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bNYvWYkT;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBzV24LKwz3bfs
	for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2023 12:16:42 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1522B421;
	Wed,  8 Feb 2023 17:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1675905399;
	bh=4fufzuT0XEbDZ7/n77MQbHSDfZq8tIFpOdmjNWCtVwQ=;
	h=From:To:Cc:Subject:Date:From;
	b=bNYvWYkTG2kGbLjCcdyN2z5G03oOqNy+AHJ19gIAfThi5LU04zPqeggpnoDZrSDUz
	 rQEK0g43zCkLA4INkrcHcMGM4WqQ1HZpaCSNl+g6Tgo553srH54WlYD1yvUX1UEDxS
	 IXKOBmmAxJS6TjHMW8C60M8yLGdYkA3A6iyCMWAQ=
From: Zev Weiss <zev@bewilderbeest.net>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [RFC PATCH] hwmon: (peci/cputemp) Number cores as seen by host system
Date: Wed,  8 Feb 2023 17:16:32 -0800
Message-Id: <20230209011632.32668-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.39.1
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

While porting OpenBMC to a new platform with a Xeon Gold 6314U CPU
(Ice Lake, 32 cores), I discovered that the core numbering used by the
PECI interface appears to correspond to the cores that are present in
the physical silicon, rather than those that are actually enabled and
usable by the host OS (i.e. it includes cores that the chip was
manufactured with but later had fused off).

Thus far the cputemp driver has transparently exposed that numbering
to userspace in its 'tempX_label' sysfs files, making the core numbers
it reported not align with the core numbering used by the host system,
which seems like an unfortunate source of confusion.

We can instead use a separate counter to label the cores in a
contiguous fashion (0 through numcores-1) so that the core numbering
reported by the PECI cputemp driver matches the numbering seen by the
host.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Offhand I can't think of any other examples of side effects of that
manufacturing detail (fused-off cores) leaking out in
externally-visible ways, so I'd think it's probably not something we
really want to propagate further.

I've verified that at least on the system I'm working on the numbering
provided by this patch aligns with the host's CPU numbering (loaded
each core individually one by one and saw a corresponding temperature
increase visible via PECI), but I'm not sure if that relationship is
guaranteed to hold on all parts -- Iwona, do you know if that's
something we can rely on?

This patch also leaves the driver's internal core tracking with the
"physical" numbering the PECI interface uses, and hence it's still
sort of visible to userspace in the form of the hwmon channel numbers
used in the names of the sysfs attribute files.  If desired we could
also change that to keep the tempX_* file numbers contiguous as well,
though it would necessitate a bit of additional remapping in the
driver to translate between the two.

 drivers/hwmon/peci/cputemp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index 30850a479f61..6b4010cbbfdf 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -400,14 +400,15 @@ static int init_core_mask(struct peci_cputemp *priv)
 static int create_temp_label(struct peci_cputemp *priv)
 {
 	unsigned long core_max = find_last_bit(priv->core_mask, CORE_NUMS_MAX);
-	int i;
+	int i, corenum = 0;
 
 	priv->coretemp_label = devm_kzalloc(priv->dev, (core_max + 1) * sizeof(char *), GFP_KERNEL);
 	if (!priv->coretemp_label)
 		return -ENOMEM;
 
 	for_each_set_bit(i, priv->core_mask, CORE_NUMS_MAX) {
-		priv->coretemp_label[i] = devm_kasprintf(priv->dev, GFP_KERNEL, "Core %d", i);
+		priv->coretemp_label[i] = devm_kasprintf(priv->dev, GFP_KERNEL,
+							 "Core %d", corenum++);
 		if (!priv->coretemp_label[i])
 			return -ENOMEM;
 	}
-- 
2.39.1.236.ga8a28b9eace8

