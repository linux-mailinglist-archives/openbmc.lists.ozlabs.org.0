Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED5E72576
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 05:42:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45th465Hl1zDq9H
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 13:42:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IwyTqLyG"; 
 dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t8H05pdDzDqS3
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 16:49:48 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id s19so28520539lfb.9
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 23:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ah+G7qOTVZnjCZcKH29mGusV1elpx/eNMrRyk1dGRK0=;
 b=IwyTqLyGxRvcDJMzIgD5CLexovfH9iW8EV4s4XzMQw9WPHbb9h85kjrWydkqICUbvj
 BhiEIVjFXWdJnYDC1XhcOVBUAGg1MPqZZi7fyG36hEjg3inyE9v0F895Yn/vno7gkisN
 saHhKWr7+dsJqENWoi/8qdyJqCkpzuq6mUQS4lqMh+yVPhqRb7eZrjdA7jFq7+XIsOGo
 LmkOq+bm/xLZusAW5KfVhLFT3uP0ZuF0xaiNktGaVQXvB8oTd9WdkQnAV4DgY61+wIjN
 rF6pSlxRr05ZvYDbpE7aXtZ700FfzTLXgL7F2ZrF5Nd9P0K+LQF7wBmeb0QGFDooWNMW
 imIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ah+G7qOTVZnjCZcKH29mGusV1elpx/eNMrRyk1dGRK0=;
 b=lirQMUr8E9VYEJ8Zk4fs31BcIFjp+tYCUDnBm94kL2ZW9lfUFHtFXywErWLkRX15p/
 vwOayb5LBtq3aRFnECe43IGNO/hyiYAw4QWd22v5P4VEzlEN6J3rFdn82IPSJFqGRD+5
 kf4hNHhlacWKyFJ7Odwnod93E0jQLDhln5FhFHzcXJrRpdON6MizjqGjR0kBkQdtIPI/
 ghUpVZaaPeNhWta8NZQFohiu58ztE1l7hXXqe+9aAR/mjqPrdmyjtiNZLgepylKkKxSL
 18bV7lAvJXEs/FbzpBnxa8QMyfqhen36ZPc+J5nhkUAbPxmW1F+U1QSD0jav80xszXAD
 bsug==
X-Gm-Message-State: APjAAAVW5XxmLb3qMtnFostOQUM3sNscsevUI49MLOMiHJ0G3FWn0soZ
 snV03DJfCuQpz/j+dsDgbxmLnN1yf2/TdpRclVNR2Lf+
X-Google-Smtp-Source: APXvYqxUuPxyu9+5UOGar6FoDYByjSjBMctAvYqsRlzVDpPjL5IcPAaXaXFgHsnWzxRJikDYcc4x9k1lQcuZECbuqhQ=
X-Received: by 2002:ac2:4a78:: with SMTP id q24mr31821057lfp.59.1563864580620; 
 Mon, 22 Jul 2019 23:49:40 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzq.jn@gmail.com>
Date: Tue, 23 Jul 2019 14:49:29 +0800
Message-ID: <CAHkHK0-bVSeXMfr5EXpqkvi5TJAMXTkYqAuTGTUc2PEb6kOsPg@mail.gmail.com>
Subject: How to switch pcie/ocp Nics for ncsi
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,all

FP5280G2 BMC MAC0 is for NCSI, and there is a
separated GPIO to select the NCSI to connect to PCIe or OCP

                                        -->PCIE
mac0-->mux(TS3L501)
                      ^                 -->OCP
                      |
               GPIOH7

I want to switch pcie/ocp NICs and preserve the state bewteen
BMC reboots and AC cycles.

My solutions is:

use gpio-hog, and dynamically modify the dts file in userspace.
But maybe it is a bad choice.

are there any good suggestions?

Thanks.


John
