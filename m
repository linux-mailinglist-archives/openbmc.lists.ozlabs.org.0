Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EB0792BC
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 20:00:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y6t21hcWzDqKM
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 04:00:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="k5C7415B"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y6sT3GZpzDqDc
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 03:59:55 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id x15so18291446pgg.8
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9KI+beeW69+z0bnOP08Z7dy7Dbv/KvX4Ye+4eLVny+0=;
 b=k5C7415BOHXzy5LQl3ecuJTXlRn6j4bdAbmPGQd76GZZTeKKzlu5SkirS0jwjRdTlX
 1lYtRyGhr9nTb5US+165sQSaYocel/roosxqV79rGpUnmWygICbxVVgMn7xAT/IozJaR
 FYjPRKe4MkC4ZvJZWNy83KlEAL0VhYZThb4Xdp+AFf3QzyzNnSxueA/naSFQtAS+LLjO
 QQyhmhlAirzv2v/FT1WHHLX+NfOvqwSPQQdsXoEIIJ/sgDenlEM7/Dx/TRGJGHq1UoRS
 xMD6kZJH1guL2IQKRb5WwpN0RseGyCkLUanZ0m6FBPfo+IkyVZ4WV4AZQKynGSr6Tz39
 QtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9KI+beeW69+z0bnOP08Z7dy7Dbv/KvX4Ye+4eLVny+0=;
 b=Ywj046EruvOeu+4Z6lxCRczQXTeCoIw1LKI8Wub6cbj2O5VzdXCeCItyA0zNH9eM6d
 qwS1hsxBaVsrkcTcK5QakBi42MV4dwRsQKyZ0z5l4XWBJLucBFALmga74wna4WIsYYcT
 PfINV4SodSU0NkmZzd0tHo+jR/P0F+msHW6eqbiEO21GlCAEa/L4ExAttxCgt2oI7Zga
 1AEC9C8vBY/Qfk8262/xd3/wRATXlN0g6sEFjeFOdlUYjWJkEHDJFyHKf0R/OtUgUx3O
 /HzLKOWkdher15KWdmhHrg8LKEjxOc3Uov/sMX0lcpWgXx7u8HvBdsnJ6SkfbyBjGbFP
 V8Zg==
X-Gm-Message-State: APjAAAUMP9PuW7v9N8vCpE5alYzNfipMtHU0pTYsFA3+OayCw1dKru+v
 5ZT3S7AjLGYIXgeSXGmqt2kB0RCxttTIgW6WUmJN/w==
X-Google-Smtp-Source: APXvYqyQDHHaBL3TgYmlmoGlVN564VTCOP2OPcNkHX553+6ueXzorcnYOb936B3/+uazhE25Bw00EAeBMvTZq5tF3ss=
X-Received: by 2002:a17:90a:bf0e:: with SMTP id
 c14mr108041779pjs.55.1564423192204; 
 Mon, 29 Jul 2019 10:59:52 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Jul 2019 10:59:41 -0700
Message-ID: <CAO=notzfZriPyq6tazS_0UxiZLPPbD_+z-YEDfFTvTT6utxcVg@mail.gmail.com>
Subject: exposing device-tree populated eeproms in FruDevice
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Per the previous email, some eeproms aren't supported by FruDevice.  I
was curious if it made sense to have it not only search for responding
i2c devices on a bus, but also look at ones that have the "eeprom"
sysfs file, and talk to those as well?  So that we can put things in
the device tree where the kernel will expose it with the known
driver/configuration, and then it can be read by FruDevice -- although
at that point, it may make sense to have a hybrid approach if possible
that uses ipmi-fru-parser (which uses the eeprom sysfs entry).

Patrick
