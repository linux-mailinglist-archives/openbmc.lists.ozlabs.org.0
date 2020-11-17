Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B84362B55F7
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 02:11:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZnvV1Y66zDqQ9
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 12:11:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cZQhG663; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZnsx42rFzDqPC
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 12:09:56 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id h16so10749016pgb.7
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 17:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oVVsJ4ZcPDpOyiQ8ZJmU7y3GOevoZVV/7qfIzZhlNec=;
 b=cZQhG663NVXtfswxBZmD6bsFWhlEnFkFp6roHU7TltyxEsSukSfZ+OaAUsxs7j8qw3
 y9dVk4/aJBi8Yyw9AGGa3jLuGCtKi6aKolF7lNcct7EpMSIh3yp6ujxXH49snqsGyvEa
 KzXITfujXYFCKFDm7DQ+mRTnkmcGEPa8u7wpFCZr5pI+5mGWyMGKELqWZqMPXFzW0tyw
 D/ymLaP4VJ1/McXmIZM+I2tOPDfU4BSMVpyLTo90oLtIxU5gMqtMLGUZerTg/4DLDAyt
 zan89AB87YLNSk8M9cekh6BKR+obCdVHt2qm5ol1YSbw47WRJPvoJEQh4nVrdvNGJJ9R
 WgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oVVsJ4ZcPDpOyiQ8ZJmU7y3GOevoZVV/7qfIzZhlNec=;
 b=jXJUyECc963aVmZm1T0+hWbOH7GPQ/B/aMcQk6EcnCt9lhL0OG87CFJkNahxyPUFpE
 K8ri3DWWQ4Sya9Ge9yj9zXtzjat5R+Ubi/wsePdIVz1PAsrjSAxjqtXpsCEdO5sXrx7W
 9Nk5HBKJipb2WHMqrRY8Q3HfxiouRM+sq7iL5ya/L5Xscp7CEJJ7qaIkgXNEhyAjetbR
 F7bOfWtI2fccXVoUp5rH6cnvO7sd4Z6vBxe1it52MxyhUILzP9g8jETfPckKdhD5XeAR
 19WkIOGAfsun+T4BTGl2YEdJcuImvUhm7jkQ85SfjLTGoFb8LIguMCUrHZkGsLfwOy51
 vsvA==
X-Gm-Message-State: AOAM531jb0PxkaTAGd/lWn2HqeT5Va8sCuVodM7NW0EKHdaIlOEIdaQb
 4sU0Bhd7v3n/ZL19fQ4R4B4=
X-Google-Smtp-Source: ABdhPJzneLrbjZvjhpVdFZvkb40oDtTKDeGBP0v5WNLfeFQ/ltLwx12cUz3nTH8fKh7sGHHNE8OdjQ==
X-Received: by 2002:a17:90a:ab89:: with SMTP id
 n9mr1811610pjq.104.1605575394601; 
 Mon, 16 Nov 2020 17:09:54 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id m23sm7362091pfo.136.2020.11.16.17.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 17:09:53 -0800 (PST)
From: rentao.bupt@gmail.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, openbmc@lists.ozlabs.org,
 taoren@fb.com, mikechoi@fb.com
Subject: [PATCH 0/2] hwmon: (max127) Add Maxim MAX127 hardware monitoring
Date: Mon, 16 Nov 2020 17:09:42 -0800
Message-Id: <20201117010944.28457-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

The patch series adds hardware monitoring driver for the Maxim MAX127
chip.

Patch #1 adds the max127 hardware monitoring driver, and patch #2 adds
documentation for the driver.

Tao Ren (2):
  hwmon: (max127) Add Maxim MAX127 hardware monitoring driver
  docs: hwmon: Document max127 driver

 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/max127.rst |  43 +++++
 drivers/hwmon/Kconfig          |   9 ++
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/max127.c         | 286 +++++++++++++++++++++++++++++++++
 5 files changed, 340 insertions(+)
 create mode 100644 Documentation/hwmon/max127.rst
 create mode 100644 drivers/hwmon/max127.c

-- 
2.17.1

