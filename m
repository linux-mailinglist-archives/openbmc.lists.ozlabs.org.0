Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A329D58E7C6
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 09:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2hFl4gJ6z2xrC
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 17:21:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=K2FGfe9V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--suichen.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3cvzzygckbxyeg4y3092aa270.ya8ab09x8y74efe.al7wxe.ad2@flex--suichen.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=K2FGfe9V;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2hFL67sgz2xHr
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 17:21:24 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id j130-20020a252388000000b0067c1f731317so3628768ybj.5
        for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=PV7OXYmXvOy3oOI40B0c/NrQt9YbIpwW5ysp1+4Kfk4=;
        b=K2FGfe9V4BWEOz04T3rNzNuwXWtZMfNdbP6DmrpQ84RwDIlwCdprOpZfia1FTadzEJ
         YcbL5Dg/9HC7x4f9nS5/HiVZtQhWb6l0BfRfQWpXI8vAFQFwR+jmPBr1indQTC1+YrFt
         Tx4ZFpy0lpbF/e0v+usbJ+cgckaEkf1NSRyfg5QvG83xWCPOL+U05N0qSdFWEn7O1F5D
         OV3bzcS09/Jrkt9FCrrTOHqQolYCINKhuNJj6x2+jOARifAUUdtMFRU5t209dikRvBqz
         U6YAL7iu0dwNuWOEM0ffe6vuSaC11VtfpeyOtqqMAIj/y32vbAjLi/4hXK89VqIUom4G
         fZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=PV7OXYmXvOy3oOI40B0c/NrQt9YbIpwW5ysp1+4Kfk4=;
        b=AMNvfEmYklfiH0maaoGlwFFPSQ0vmXro211dMBgmLj5JxaImCuVoaWGPVZ6jkjvV0r
         LyDMdUxc1ZG+TrGWGkHXIiFqc7IHOi3vBvsPIcozBkP4XIb0RzqaGgvX3PTiNoowkVvI
         qLxDkkdgaYfbd/oGbMziVxwyOXJQFlfQL3YnfmvkOs+7TzbWgGlCaJXy2yFyorvfeGqm
         nrGWMkmD/eZwjL8rgFset2PbdmFEph0sM7x6Sab1X1MRM1BrFnTODrwLHqM68GNAxCy/
         byqCWl4aLFob3lCRHevnQxT3tiAbaGf5j82fcDNWU4KmoQk26Tj2lK9+T79IHBZODn3B
         +thg==
X-Gm-Message-State: ACgBeo3aVNzDeNsALI0uKMDASmy/9W3g+ZH3zwu6aQmtg9Amr3H/JQKd
	XhPHRLx156jH509E7LPqg4LHGWjztmdm
X-Google-Smtp-Source: AA6agR4hmMW+Op22E/4cpCGBrHn7Z6qt/OcIhhC57rhdeFszcCqfUhtrpELfu3MWeftfhTZP2iucKvxNccus
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:820:de6:2fcc:8636])
 (user=suichen job=sendgmr) by 2002:a25:3b10:0:b0:671:80ee:6a8 with SMTP id
 i16-20020a253b10000000b0067180ee06a8mr23825802yba.114.1660116081386; Wed, 10
 Aug 2022 00:21:21 -0700 (PDT)
Date: Wed, 10 Aug 2022 00:20:40 -0700
Message-Id: <20220810072041.57055-1-suichen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
Subject: [RFC Patch v5 Resend 0/1] i2c counters as sysfs attributes
From: Sui Chen <suichen@google.com>
To: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, wsa@kernel.org, 
	openbmc@lists.ozlabs.org, tali.perry1@gmail.com
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
Cc: andrew@aj.id.au, krellan@google.com, Sui Chen <suichen@google.com>, joel@jms.id.au, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello, linux-i2c,

We would like to ping in a friendly way and see if there are any
comments on the i2c counters as sysfs attributes.

This change renames the I2C debug counters as previously, and makes them
available to i2c_adapter's and i2c_client's:

 - bus_errors
 - transfers (only applicable to i2c_adapter)
 - messages (only applicable to i2c_client)
 - nacks
 - timeouts
 - recovery_successes (only applicable to i2c_adapter)
 - recovery_failures (only applicable to i2c_adapter)

This patchset is the same as the last one, except that we are using a
new method to verify the results in the counter for i2c_adapters:

We use the Perfetto profiler+visualizer to grab the I2C kernel
tracing events on a BMC with many I2C devices, and compared
the I2C counters before and after the tracing process.

We needed to add a change for Perfetto in order to view the I2C
events in the UI. The Perfetto change is located in
https://android-review.googlesource.com/c/platform/external/perfetto/+/2145699
and it currently shows the outermost I2C ID that appears in an I2C
transaction.

We inspected the counts in the Perfetto trace by executing
the "SELECT count(name), name FROM slices WHERE name LIKE "%i2c%" GROUP
BY name;" SQLite query.

It turns out the increment in the counters in the counters in sysfs and in
the Perfetto trace very closely match each other; the differences were
caused by the time differences between the moments the tracing
started/ended and the I2C counters are obtained.

We would greatly appreciate any comments on this change.

Thanks!

Sui Chen (1):
  i2c debug counters as sysfs attributes

 drivers/i2c/i2c-core-base.c | 240 +++++++++++++++++++++++++++++++++++-
 drivers/i2c/i2c-dev.c       |  94 ++++++++++++++
 include/linux/i2c.h         |  41 ++++++
 3 files changed, 374 insertions(+), 1 deletion(-)

-- 
2.37.1.559.g78731f0fdb-goog

