Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254C2F2220
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 22:47:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF6kx19xFzDqWW
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 08:47:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dXgQ5LXe; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF6jr6htLzDqW1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 08:46:48 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id u26so101461iof.3
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 13:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=dM4Fneyp8dYmWJwnzFqeg6JlQz0HVkcpCRFXs6LQbKk=;
 b=dXgQ5LXeE+ZgCXB7R7buljjbJWUFE81nklwFaLIz+VVjG4UNUwfcNXBdNxNqoulZJZ
 gwvusMQSr9+fzStXcyzSjI9wjdflWwfu30SnQpjJ41EpzNJ10xIJh/FTOODL++0EY4qP
 UxdhPD28ax7/fJ7EsJ9ZHQw4QU25UPTp8ZmLX9szXGqG+URNAE44SdwUqYu3KuyHbuZy
 a+ZGyOE8eJekSynBT1Fe70fEI7nYVsP8jwQqYviuMr+g13tFvU6ZMug3pCFoKL0nAq4P
 DFMAfUlWkIzLpuDkYD98XUXwLVxbDciSqAidjVx/d2zWqPLgf8jVTbhK9pReTY4ONiha
 fOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=dM4Fneyp8dYmWJwnzFqeg6JlQz0HVkcpCRFXs6LQbKk=;
 b=CoCyzdDOXJ/nAMI1AYEacAwa84AHOlYn7nDTnj9Qd0yFdsZEXtWRxRMw2ZCAqjCVrS
 9Ugsh+7z2NiuytUTQ2lCvLPuF0/ghqvv7tMb76Pvy1DJ7C5n4mFIHiNcoGxY/YgTUCSg
 YFxHnPpXpVJKCx61qFnOs/WeacXAev76WvhG4EmLn6sXMUilMB6i+jzKJku/nSzSjEbC
 5f6Ubpkykhy2xs33kjm/X1Y0KroifRZ4EMzS19YcA4IO9fGN1TKWfrVpBR8HzRbKZyfc
 hCbbdKBqnP+8GvoVrBeeO1ilaHd0n63MKQQZuVTIuA7PYoiAkRre1qLmfamKVWSnEHb7
 tPDg==
X-Gm-Message-State: AOAM533chKN5oKvVFs4EVPs4+haDIK847ujxqLS6bE4lKangRPZG22Ur
 0J6tWMjtvn0IBo9zOcDmXo2wCD2Dai0=
X-Google-Smtp-Source: ABdhPJzLkAEmMrktz7Rtnmx6BQ8dJAhchHKiucUu3IVjNqiNMb8yM6/j3PGytNAIOGf/ebfnRd2cTQ==
X-Received: by 2002:a6b:ce12:: with SMTP id p18mr957507iob.181.1610401604820; 
 Mon, 11 Jan 2021 13:46:44 -0800 (PST)
Received: from [10.42.18.7] ([70.39.113.236])
 by smtp.gmail.com with ESMTPSA id b22sm524684ioa.10.2021.01.11.13.46.44
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 13:46:44 -0800 (PST)
From: Mike Jones <proclivis@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Use of ADM1275/78 Drivers
Message-Id: <21FAC5F4-0116-4DAF-AD99-DE4BFA0D5809@gmail.com>
Date: Mon, 11 Jan 2021 14:46:43 -0700
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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

I have a question about how ADM1275/ADM1278 drivers are used in OBMC =
designs.

The driver is called out in meta-quanta/meta-olympus-nuvoton and a few =
other layers, and is setup for hwmon.

The driver itself has logic such that probing reads two PMBus =
configuration commands and then adjusts the nodes in hwmon according to =
what is enabled. However, I don=E2=80=99t see code in the driver that =
would allow devicetree to configure those commands, and these devices do =
not have EEPROM. Therefore, configuration has to happen elsewhere.

Question:

- Is there some way these devices are getting configured at boot?
- Such as private code, something I did not find in searching, etc.=
