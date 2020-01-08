Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF0B133851
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 02:14:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47srr32lhczDqgb
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 12:14:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uHsD1OCt"; 
 dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47srqJ1B8MzDqPl
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 12:13:47 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id n16so1209148oie.12
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jan 2020 17:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6Nhg6yHalI82tBzdZA2+0eeBZLSnSRYkaRsB2ovJtsQ=;
 b=uHsD1OCtIX2cRAeSHD5Lwz2eJ6e+HY+IvbiSODn4PLhZ4b9jBcggKn9pTnc3LkgUsm
 PLoGSYgK5t3Q1XnXQvMjcjFKHKPc7x4AenMFVQFW5ZMgPyrE10G3unsjOM0dTTzjqHlM
 DR9L4ppvrmOSeFaxajzk8Yrn12Q/o9MEQOHtnoGGu0o/Oa8+R1DPI9sgE04eXWgooIT/
 m/O62rx70p/C2Ub5MO4L6if/lU2/+A7HnJ/8+fQ+jZuwPj/FHnP7gfulO2ol9L2LdAwx
 kc0SHTaZexoPq79ch4IIIXzHpiSpfJr72I7BmkzUaS4G2xOMHCBcoQ9RDUceDlM9n2Eh
 sH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6Nhg6yHalI82tBzdZA2+0eeBZLSnSRYkaRsB2ovJtsQ=;
 b=nXcHwK9lrYLrXZfSQdvwavrUhwfxmKTsvDh4Hdfbt8Xc30ckTcR4HmL5xTN+nWM2Zq
 0v149zOA6sRc1CJky2+WhkP6SfXQO4kVUXAAeGZydlwdUSH2WzO7IAhZPWvMwh9osUpd
 iW/V7MP3a/f1zz05PkA++aAs9ZdVOwI+OH78xdIW+fff7bvKkzBHP8lwh8PhgFUxj7fg
 iE+g/9yv9gjuQbW0ZmlYaqzNgyL5ZuEKlaqXzd+YglIInR15usJl62K475Yq8lQWH8Cz
 +/0M44g4mBCgopiacUnf1DATyYrVgbf5SAuPi010oMCf04TMivmNlZHAjd18mbPsCedk
 naXg==
X-Gm-Message-State: APjAAAXJXnCR/+VUBi9Rj0Jxc/c08Xgt/Y1NelkG7FCQ3rWa7BVTVbXD
 zpZTsb4pzvn9rzt4MrpmIsoP5/mEnrjc0nIwnF95g9/O3hyScA==
X-Google-Smtp-Source: APXvYqzW8OCMofMkrvhsRoxAeBBnP8vrxd9L7LuPKGvBMxq5ipuKD0C2Vo0pnP2H5llBHcUiZSl6ynufKyO3NZY/aAA=
X-Received: by 2002:aca:f555:: with SMTP id t82mr1129761oih.103.1578446024011; 
 Tue, 07 Jan 2020 17:13:44 -0800 (PST)
MIME-Version: 1.0
From: Alex Qiu <xqiu@google.com>
Date: Tue, 7 Jan 2020 17:13:33 -0800
Message-ID: <CAA_a9xKmRHHx=vXvwTaO+0PRtFjLWQUAL1WnJH8XGBBzvExt2A@mail.gmail.com>
Subject: Configuring device with I2C mux
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008f3b1d059b969a84"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008f3b1d059b969a84
Content-Type: text/plain; charset="UTF-8"

Hi folks,

We have a JSON file configuring I2C devices of a PCIe card which has an
8-channel I2C mux for entity-manager. After we properly configure the mux
of the card, we get 8 new I2C buses in sysfs; however, we don't find an
arithmetic way to describe the relationship between the new buses and their
parent buses.

For example, we have a mux on physical BMC I2C bus i2c-8 spawning a couple
of child buses including i2c-24 and i2c-26, which are the buses for each
PCIe card. The mux on i2c-24 PCIe card spawned 8 buses from i2c-70 to
i2c-77, and the mux on i2c-26 PCIe card spawned ones from i2c-62 to i2c-69.
We have I2C devices on i2c-76 and i2c-68 needs to be configured together
with the PCIe card on i2c-24 and i2c-26 separately.

How do we implement this in the JSON file? If that's not possible to do it
in JSON merely, what's the suggested approach to implement this feature?
Device tree? Implement code in entity-manager to walk through the I2C sysfs?

Thank you!

- Alex Qiu

--0000000000008f3b1d059b969a84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi folks,</div><div><br></div><div>We have a JSON fil=
e configuring I2C devices of a PCIe card which has an 8-channel I2C mux for=
 entity-manager. After we properly configure the mux of the card, we get 8 =
new I2C buses in sysfs; however, we don&#39;t find an arithmetic way to des=
cribe the relationship between the new buses and their parent buses.</div><=
div><br></div><div>For example, we have a mux on physical BMC I2C bus i2c-8=
 spawning a couple of child buses including i2c-24 and i2c-26, which are th=
e buses for each PCIe card. The mux on i2c-24 PCIe card spawned=C2=A08 buse=
s from i2c-70 to i2c-77, and the mux on i2c-26 PCIe card spawned ones from =
i2c-62 to i2c-69. We have I2C devices on i2c-76 and i2c-68 needs to be conf=
igured together with the PCIe card on i2c-24 and i2c-26 separately.</div><d=
iv><br></div><div>How do we implement this in the JSON file? If that&#39;s =
not=C2=A0possible to do it in JSON merely, what&#39;s the suggested approac=
h to implement this feature? Device tree? Implement code in entity-manager =
to walk through the I2C sysfs?</div><div><br></div><div>Thank you!</div><br=
 clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></div></div>

--0000000000008f3b1d059b969a84--
