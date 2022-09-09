Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155C5B5A6A
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:47:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5w22R04z3bZ2
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:47:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eMpXNUj3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinledford.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=36lyayw0kb98kvtujomfegpsehpphmf.dpnpqfocndmjtut.pambct.psh@flex--justinledford.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eMpXNUj3;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP22j4lNWz2xG4
	for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2022 13:45:47 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id s68-20020a632c47000000b00434e0e75076so303148pgs.7
        for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2022 20:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=f+1WSnk+SkrS7wZu2ZPOFDZTov7+ovAhI8qYUzTF9p8=;
        b=eMpXNUj3RkSHVCCUpJQj+gqcseuz4vy5lxMiZ0YspVOgdcQZ3pHzgDzhGYjpXsMprA
         sn1LHrBzZEQ0oZr6qWWdp6I/7F3iqzF5GbrtxxsIUOwoQBoSVAhQr2EOHYqjkOfGQ/8j
         spnJO9hxo3Dv/PDA6yzcWvPugNtIb1twwioewKSuEgbLYS6dsk0v/TfJPCJmpKgFnrpA
         mtj2143Lr8qHDu/jO/x7eUYofxvFgrF1t1udnMUkxVBF84s5gIwk7mFrVOvLJP62Mosq
         0czyHNGwJ6fzMki3CL0zIghNytB2x10MtbkOVuRdHJ3Br5vK9xrwsMZPj5lLFNdWv4cw
         +2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=f+1WSnk+SkrS7wZu2ZPOFDZTov7+ovAhI8qYUzTF9p8=;
        b=LFg2/CwKU8o9nXrPl8oIeKeMydhnZI5bwHYxNexfI8T+mP6kCYNoAFLTbXBmTqnXp9
         GtqShQhYcoM3ecNM5K2zz4qcXF4pdmG7tZLBkcXUXYx2ctGFUdLdk6aYZB4jSVluVorS
         /pK2UDZcYmz7V6pdI96zfuxPS1VEmtRAI5By15xVj5TB2u+uqACDu/KbT0mcAYCZy6AM
         lC2ytqbSko5pptvz2w8AGk7S7wEsCzT44f72KgzHp56lCtPYuzYU5fr04u6URe3JGxGw
         qLG11L2DGD5zqit3ttZYZrS6H6AYkYpMFJ3imb2lFmFVfeZsC44FaN/bG4lN9MbnTf1C
         x/Lw==
X-Gm-Message-State: ACgBeo3PdEImXSTuoPjlzTJ6ZujQZo/jH3SuTHLmetgC0T66Q5Cj+A1a
	4W8cVxTClup4oVHyXYWPRuFRjRB43W26KDVbtaP2Tls2SjDgpJy+R2STU59eWVozaDHlWDztyy8
	gqmRtP/zgvorg+alRMdkVJPr8AsauA2voV473UiUPfafdioWbqve++1nb0AeoFzA5QTBZHbiVc+
	cvasOEBh4=
X-Google-Smtp-Source: AA6agR798QTgk4FGXnmtCYzzWFhhSIn0pN4OjKpf5M6Q8+KkWcBM5RaHC9tB7tXuXUQXjAtJ+stmJRfOCnSWOP+SO21C
X-Received: from jsl.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cdb])
 (user=justinledford job=sendgmr) by 2002:a17:902:c410:b0:176:e093:1371 with
 SMTP id k16-20020a170902c41000b00176e0931371mr11954498plk.67.1662695144506;
 Thu, 08 Sep 2022 20:45:44 -0700 (PDT)
Date: Fri,  9 Sep 2022 03:45:40 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220909034540.2396070-1-justinledford@google.com>
Subject: [PATCH linux dev-5.10] hwmon: (max31790) add fanN_enable
From: Justin Ledford <justinledford@google.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 12 Sep 2022 22:41:37 +1000
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
Cc: Justin Ledford <justinledford@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The MAX31790 has a tach input enable bit in each fan's configuration
register. This is only enabled by the driver if RPM mode is selected,
but the driver doesn't provide a way to independently enable tachometer
input regardless of the regulator mode.

By adding the fanN_enable sysfs files, we can decouple the tach input
from the regulator mode. Also update the documentation.

Upstream (hwmon-next) commit: ca221abcb7ca95c9f36e3fb04ec19ab3fa865af0
Signed-off-by: Justin Ledford <justinledford@google.com>
---
 Documentation/hwmon/max31790.rst |  1 +
 drivers/hwmon/max31790.c         | 38 ++++++++++++++++++++++++++------
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index 7b097c3b9b90..33c5c7330efc 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -38,6 +38,7 @@ Sysfs entries
 fan[1-12]_input    RO  fan tachometer speed in RPM
 fan[1-12]_fault    RO  fan experienced fault
 fan[1-6]_target    RW  desired fan speed in RPM
+fan[1-6]_enable    RW  enable or disable the tachometer input
 pwm[1-6]_enable    RW  regulator mode, 0=disabled (duty cycle=0%), 1=manual mode, 2=rpm mode
 pwm[1-6]           RW  read: current pwm duty cycle,
                        write: target pwm duty cycle (0-255)
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 7e9362f6dc29..20bf5ffadefe 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -202,6 +202,9 @@ static int max31790_read_fan(struct device *dev, u32 attr, int channel,
 		}
 		mutex_unlock(&data->update_lock);
 		return 0;
+	case hwmon_fan_enable:
+		*val = !!(data->fan_config[channel] & MAX31790_FAN_CFG_TACH_INPUT_EN);
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -214,7 +217,7 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 	struct i2c_client *client = data->client;
 	int target_count;
 	int err = 0;
-	u8 bits;
+	u8 bits, fan_config;
 	int sr;
 
 	mutex_lock(&data->update_lock);
@@ -243,6 +246,23 @@ static int max31790_write_fan(struct device *dev, u32 attr, int channel,
 					MAX31790_REG_TARGET_COUNT(channel),
 					data->target_count[channel]);
 		break;
+	case hwmon_fan_enable:
+		fan_config = data->fan_config[channel];
+		if (val == 0) {
+			fan_config &= ~MAX31790_FAN_CFG_TACH_INPUT_EN;
+		} else if (val == 1) {
+			fan_config |= MAX31790_FAN_CFG_TACH_INPUT_EN;
+		} else {
+			err = -EINVAL;
+			break;
+		}
+		if (fan_config != data->fan_config[channel]) {
+			err = i2c_smbus_write_byte_data(client, MAX31790_REG_FAN_CONFIG(channel),
+							fan_config);
+			if (!err)
+				data->fan_config[channel] = fan_config;
+		}
+		break;
 	default:
 		err = -EOPNOTSUPP;
 		break;
@@ -270,6 +290,10 @@ static umode_t max31790_fan_is_visible(const void *_data, u32 attr, int channel)
 		    !(fan_config & MAX31790_FAN_CFG_TACH_INPUT))
 			return 0644;
 		return 0;
+	case hwmon_fan_enable:
+		if (channel < NR_CHANNEL)
+			return 0644;
+		return 0;
 	default:
 		return 0;
 	}
@@ -423,12 +447,12 @@ static umode_t max31790_is_visible(const void *data,
 
 static const struct hwmon_channel_info *max31790_info[] = {
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT | HWMON_F_ENABLE,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
-- 
2.37.2.789.g6183377224-goog

