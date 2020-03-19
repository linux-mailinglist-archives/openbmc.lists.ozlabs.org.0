Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E418C344
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 23:49:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k2CR6ZhwzDr9w
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 09:49:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3sfzzxgukb2gqateomuumrk.iusuvkthsiroyzy.ufrghy.uxm@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=oVefZhPG; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k2BQ12JnzDqwl
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 09:48:21 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id p13so3201992pgk.18
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 15:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=5WtAORZ7SLKlJMzImdvIvZ4TLDWK4cV3hlxUTvVcgm0=;
 b=oVefZhPGfE8C2nh3FoVLrMo+ZnJ4ufUSS+wfUmo2CPPOaVotexymf6xloK75yv6miQ
 T4QDN5TI+S6L45Bsr3doVIDDkFHoZr1TyywiKeJhQceW2OFgaISr/5lCc1SCfl5v1qQ2
 D4VjKzNlH5R0GZ6ze/p9xLyPfFMlw80MGZM+AJvj3LR6rymVoBCQ/hUlDN3sPlnmyTmU
 39P3y/KWjYRGBhCbyBegy236FPg92GUMGeBJgUM+xiuOwyotD8oJpv8Hc2oqCLLuGfsi
 vY44qdg+EtEfEWyD09+I/GrtP2eMc5xgFcObEsAG8/w/fJuePiys41jnWqOJScvaAOmy
 r1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=5WtAORZ7SLKlJMzImdvIvZ4TLDWK4cV3hlxUTvVcgm0=;
 b=QccE/Q5AWlmmm7BSgUYy98teNuSxyACsAbvCF7887BKzz7JZtnw941+/U3CrwDkuM8
 AXKpIKZxEes8mPFDdSqyF1qq17//j7GA7ISg4yazwHFX1m9HvJ2Q4B1XBXkhDVH9RQ4F
 wKzaqAtS9TYxqpcolBYxeDtEVNkjPquiDDp4Y2kNX/UqszpWR0d/AKMj3o6vy7i9a07G
 drARVUXH1+8Vm6yG4yZw21DS9imzdyT0xNOff3fgxEIMvmZxsR8bEE/t6vUd1CmbwVXd
 sfEdObk6JoAYlNff9icfIMEWscpp/n7hKd3Z24EKne5Ci8UTr3tLQb7jsoX6436DNHG4
 stQA==
X-Gm-Message-State: ANhLgQ0oqWauNy41tGtAnIJua6tFJjxOj23dxmyj85AiqgwIhhzQ1ejP
 5GBaiZbfa1NN05ueGvm0Uw0HTD+YDg==
X-Google-Smtp-Source: ADFU+vv4ppWOXgl7BA5LMYVaLuMmRS7QvvyfGGP9o9MIRW+9mrUpZ7dEgMdw+2umUBVT1P11GBDgo7Qq/Q==
X-Received: by 2002:a17:90b:19ca:: with SMTP id
 nm10mr5930332pjb.161.1584658097568; 
 Thu, 19 Mar 2020 15:48:17 -0700 (PDT)
Date: Thu, 19 Mar 2020 15:48:09 -0700
Message-Id: <20200319224812.202013-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v1 0/3] Add SB-TSI hwmon driver
From: Kun Yi <kunyi@google.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, 
 mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

*** BLURB HERE ***
This patchset adds hwmon support for AMD SoC SB-TSI emulated temperature
sensor and related documentation.

Kun Yi (3):
  hwmon: (sbtsi) Add basic support for SB-TSI sensors
  hwmon: (sbtsi) Add documentation
  dt-bindings: (hwmon/sbtsi_tmep) Add SB-TSI hwmon driver bindings

 .../devicetree/bindings/hwmon/sbtsi_temp.txt  |  14 ++
 Documentation/hwmon/sbtsi_temp.rst            |  33 +++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sbtsi_temp.c                    | 218 ++++++++++++++++++
 5 files changed, 276 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst
 create mode 100644 drivers/hwmon/sbtsi_temp.c

-- 
2.25.1.696.g5e7596f4ac-goog

