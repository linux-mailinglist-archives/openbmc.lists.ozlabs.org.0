Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5F23D3ED
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 00:29:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMR9r4CTyzDqhD
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 08:29:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AiHnKBE1; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMR913HnLzDqft
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 08:28:21 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id h3so17490304oie.11
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=6qAsP8o+Ierwj41VBrFFvEQU8zoiCsdnFB5kgrYyDu0=;
 b=AiHnKBE1QQnI8yg4xxYwjFxHt4solrbrlItMhz47S+dS6KlDAni86CmmLGp60Pw5ra
 VAC6wYT3wJpxuPHsJzBYtL9Wg7yXfQFUoGkrpKqYuW0fNqWq5WGnXLvROYRl+ov/Nvlr
 qoAomzH8CqUS+/pzK8HQMDLjyeLsSUUWFN45y+RJe8+E4/sftQzoZgPZQevcv5hBWjpn
 F9wN1FVNmH9VykJHVJ59TSCh8NWlRL6ITgThkMkBztS56c2gITcE1nsGHafnkgUK3OUj
 8G2R4sDERyYEf4Wb6Niy6uCGfQxsy/Ql+mcP+zQqTEIa23WkVX3DIc/zVj2Br9H7lui8
 8KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=6qAsP8o+Ierwj41VBrFFvEQU8zoiCsdnFB5kgrYyDu0=;
 b=pZ2OX8XQPMbFJXlBehd3m+gL9hJ1zIjVuXZLYV/IANo1aED9XSXNRJ/9GPjMs+CT0/
 S2LEKbckw1b7b0b1PL5QCDQJN8u994hVjbSVBjmkUpF+R02+0z3uhkBUxZ6z3p3TejHX
 ZQmzxpiHoxOIuvPIk/0ukr1ZVNPrk4hkVf99hjgcE+8axcY8mPsKfMl+QeTdT9g5Ygc5
 6uHPy4ss2WrTJZzBgyWXwYdm/m+pZ0+yYg2lGicf9AgkKHggqtx7tBVzaIlUt4IY41Mb
 OSRqM5DrJE4HV8NRkzMx5JPeAZOpYQhPMRcEjZSOtzUjGwBbkojrO4FYkqY8ROCRkUEG
 ufzg==
X-Gm-Message-State: AOAM531nRBQRmz1HiQFzGMajdGfWevQJMWwf1uBXSS7xyueQW31nq2wE
 /grt8D46NP8zCHcjEamijU6YNdMM5wQ=
X-Google-Smtp-Source: ABdhPJx2EZn5n4gV8GbJU9enApIPhAKYPbpFFOlMgcSieFR0FiCQecJJ76j5inE656EsiWf7GYnkOg==
X-Received: by 2002:a54:480c:: with SMTP id j12mr4785416oij.85.1596666497706; 
 Wed, 05 Aug 2020 15:28:17 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:31c8:a5f7:f522:9334?
 ([2601:281:c001:2359:31c8:a5f7:f522:9334])
 by smtp.gmail.com with ESMTPSA id 22sm721496oin.26.2020.08.05.15.28.16
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Aug 2020 15:28:16 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Power Supplies are Turned off after boot
Message-Id: <F6868B82-B239-44DE-B90A-BD808FEA4C5B@gmail.com>
Date: Wed, 5 Aug 2020 16:28:16 -0600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Now that I have webui displaying telemetry for multiple PMBus devices, I =
want to solve a power supply problem.

After boot, all PMBus devices have their power turned off via an =
OPERATION command. This happens about 10-20 seconds after boot =
completes. There is a message printed saying it is disabling them, and =
one line per action. Like:

VOUT 1: disabling

Where VOUT 1 does not match the name of the rails in the config files =
with the name and limits. It seems like a more generic term indicating =
voltage.

These devices are in the device tree and have hwmon running.

What service would be capable of shutting off the supplies? It would =
have to be able to discover them, perhaps by device tree, then issue =
standard PMBus commands.

Note: the Phosphor System Manager service fails at start up. I don=E2=80=99=
t know if this matters, I was going to figure out what it does later.

Mike=
