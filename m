Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB732315C7
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 00:53:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGX5x1HhmzDqxM
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 08:53:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134;
 helo=mail-il1-x134.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jWSEONFC; dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGX542X9MzDqx5
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 08:52:55 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id r12so17707268ilh.4
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 15:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=8YZwhzCnFYZYU3LxCRfkzeo6dJD070x/jybVKTVwvMY=;
 b=jWSEONFC7ltRZLMPc81J75URUli6pNt3SjdrF8iI2Mn6jZdU+LOrsTwYb+Zr8hvj4x
 k5cUiNwhFNLC9ugZ9e1tNIfMo/THSflwzdEDHm8TiR3TLp1pvk3hDmRxd+UKj4O/E4Ld
 zZyXt2agQe1D6/NJ38zlooWWxb/GopwvUiX4u6YFvA9BoDV+BfY+8qeJkK5TdnFqyKfD
 fIqkTRspuoDah3eUc1CPuIm6Gmw7x8JLzPfLbio3dYB3oWhxrZCtGVSxn3juCMZ3E5fW
 zvZ+9n+o4hHPvBwILd/gIPQfDsLypvf+l1z3z5NEaEupjGgMZVWJ+Ge1zzgZFGPNCBmB
 XuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=8YZwhzCnFYZYU3LxCRfkzeo6dJD070x/jybVKTVwvMY=;
 b=OKw/mUXKt+C4HC0ERRAO8L9LBnPupHqsJySYPWVdmU7+dhhvX7GJV6QXH7sKj17EEv
 k8SzcaOal4Na5ImfeofBfmNbB1PbW4RmLH1hyrC11npIvO2e8iO7BBVThjdSpSHKAY9l
 PjlkDUgCvYaGyrWtLkTgS+7IOTiLO2muJNbM5Ke0Lb/wR9AAPjbGXSehI5Rk0FUdL6cB
 YdkyJnZ76mN91bRjyDlMPp9CIMjoND0D9TxnAjPBJM44e4kaybIccB3RQMtvxWwfoB32
 A0ocVhjSEeCGp1ykpGQW0QOwHinSlhjMt/hUk3Xo0s/w8M6OqOshyNg/7pE5mDao8Vjo
 pTzw==
X-Gm-Message-State: AOAM533Z4M5Znks7nxAFKJWK7d0jDRzwuSmeOZk4OXn7iF/oJLDIJFld
 NssnKFMXv7k6oTDYJRiVuAtjruh4KBU=
X-Google-Smtp-Source: ABdhPJz2EqSliR4ltNiAquWA93PU3lSmRznQMwS3lOoE7R2WB1HsYe//uNbHp/aX7eq9OrlqwHrzsA==
X-Received: by 2002:a92:4414:: with SMTP id r20mr28583992ila.299.1595976772442; 
 Tue, 28 Jul 2020 15:52:52 -0700 (PDT)
Received: from [10.73.10.10] ([174.128.242.234])
 by smtp.gmail.com with ESMTPSA id j19sm127060ile.36.2020.07.28.15.52.51
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 15:52:52 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: How do I add a PMBus sensor that will show up in webui Sensors?
Message-Id: <5F352E7C-5A22-4921-889B-D2C7B8995E84@gmail.com>
Date: Tue, 28 Jul 2020 16:52:51 -0600
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I need help configuring a sensor. The goal is for a PMBus Voltage =
Regulator to display sensor information, like load current, in the webui =
under Health/Sensors.

Some background:

- Rasp Pi 4
- meta-phosphor=20
- bmcweb/webui working and can log in
- pmbus/ltc2978.c driver working
- hwmon working

In this case, we have this path:

/sys/bus/i2c/devices/i2c-1

Which has a new_device file. I can add my sensor with:

echo ltc3880 0x30 > new_device

This populates all the files with telemetry data here:

/sys/bus/i2c/devices/i2c01/1-0030/hwmon/hwmon1

Such as in1_input, in2_input, in3_input, which are VIN, VOUT0, VOUT1.

I assume there has to be a file that maps the path to inN_input to a =
d-bus object, some way to register the sensor with the chassis or =
similar concept, and some file with the label and warns, and other =
things you can do with it.

=46rom a yocto recipe point of view, it would also have to do the =
equivalent of the =E2=80=9Cecho=E2=80=9D into the new_device so that =
/sys/=E2=80=A6 gets populated. Perhaps part of some systemd based =
service.

I have looked at meta-ibm and see a tree under omjc/hwmon/ahb=E2=80=A6 =
i2c-bus@200=E2=80=A6

I do not know what these numbers are referring to. Perhaps these are =
paths in the sys tree for an ahb type architecture? And what is the =
number before .conf?

Then I see phosphor-hwmon_%.bbappend with more configuration in there.

Can someone explain how this recipe system works? The architecture doc =
was more than confusing. Perhaps just sketch out what I need to do for =
this case, and what files it will generate, so I can build and go look =
at the generated files, etc.

Or perhaps there is a completely different approach?

Mike


