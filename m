Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE8EC0C4D
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 21:58:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g2fM45f8zDr0t
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 05:58:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KasBjtRE"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g2dW3tNyzDqfC
 for <openbmc@lists.ozlabs.org>; Sat, 28 Sep 2019 05:57:35 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id i16so6234610oie.4
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rtgQ224aBw61k0QXA+2JTPpQ+IjcpCcemaXfL3NM4Ek=;
 b=KasBjtRE2ttTl1nbhRf33LF+3tykxxD8uVwF95aFaP0GU+/G6W/CXa56ZUCJGz3ifj
 urzVO8P7F/3BzKZLg5EA9WRr0n4A9Op6lF50XRaVsGYyYDZVs/oMXv9e6FSzvegPqzb0
 p5A6MUdNyM2egf+CPnyum3iQ/W0YCXSdBqkK/WNJWiZbaTAMd+xW9z3bVBsjUYYIjmPG
 l29bxQq0hIMSwT5xtdiJFGJ2e8Uy+taV5lAf5GXt5xsaE0rj9c62sMBw+09BoLT9lAP8
 7DaJ51j1ea58xndGqeEPIaRRxo5BgXjw+W/ulLiZUP2u2MbBHyFY7QzA5OjZ879QEGwn
 1SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rtgQ224aBw61k0QXA+2JTPpQ+IjcpCcemaXfL3NM4Ek=;
 b=qpQUoqcnliuhQqt5HYDGOdMEUhmj1Wc+5kwUo00vfC191pFaJaES05WacXRg3mryve
 5Oqb4lnMK9m1ojvR12O7kSs6JB0YHOiEJZdE0Ng8YRTrW8HDUdP7Em2HJ7nN1YgIjCfd
 HTIBwbPG+EYvV1ldAKr5JlRWnkKWjVI026Pht11Q6S6AO5FabGSrDBm0g5e1BPaG28iu
 i8hfBVIeSIVYhnE1+9i3VXWh/sX1c8ziCawWGONby+Wlk69tCFdxw5A0bjov/ZJgTwxl
 hQyyZWNcDpVQjzrfHygY8aOJmV5KhYIQGCohFg1pfE/91cl4zT09R0zIgT1s7i68BH0Z
 bZEQ==
X-Gm-Message-State: APjAAAWcLy48GCy9L9cFcWuex7o1HY0n8NX87IlcJqB2C2hColyaF0hv
 6CVLGihUcNiM//AjgCqKWyxpESN6daK1K84a27V5wW91k5E=
X-Google-Smtp-Source: APXvYqzYJ5e5wtxLTeZsUclP69WTxpLpWXvVgkW7cNEMkfQueliorieuoCOmHiUlNYSWg85WbZF/fFpJl6B+XwZ3ob0=
X-Received: by 2002:aca:4e97:: with SMTP id c145mr8167733oib.145.1569614252822; 
 Fri, 27 Sep 2019 12:57:32 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 27 Sep 2019 14:57:16 -0500
Message-ID: <CALLMt=q+NmXAdA26Vm+wMjZX9UODTeN1GHgw-dxM4xYGr9+taw@mail.gmail.com>
Subject: Expired Password Service
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 richard.marian.thomaiyar@linux.intel.com, ratagupt@linux.vnet.ibm.com
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
Cc: Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As a part of the expired password design[1], I created a new service under
phospher-user-manager that can be optionally included in your builds. This
service will expire the root password and then disable itself. The idea being
it runs on a factory reset or in a situation where a flash chip has been
completely rewritten. It does not run when just doing a firmware update.

https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/25615

We're still working through the IMAGE feature aspect but any feedback would
be appreciated.

Ratan/Richard are you ok with this as a feature in phosphor-user-manager?

Does anyone know of a better way then what I did to ensure we don't run this
service in a code update scenario? Keying off of a dropbear file seems a bit
hacky but ensuring we don't run this service when a user is just updating
from an image that didn't have this feature to one that does seems critical.

Andrew

[1]: https://github.com/openbmc/docs/blob/master/designs/expired-password.md
