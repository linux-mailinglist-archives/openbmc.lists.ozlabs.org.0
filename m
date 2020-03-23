Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC041901F5
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 00:35:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mW2R06xXzDqt3
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 10:35:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com;
 envelope-from=3aud5xgukb9ycmfqa8gg8d6.4gegh6f3e4daklk.grd23k.gj8@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=O4lRwQYf; dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mW1J1D42zDqJS
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 10:34:04 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id f94so1090923pjg.6
 for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2020 16:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=/RImki6aeT4q5vb9Y/WQiMvUYzgD9NDtY/Eh1UmZ8iA=;
 b=O4lRwQYfbO/ukCbwvjFzGUN4nuu1mInpQKXV5eRdJ5SDplvgn9LcJWm6RfdBFN6F9b
 /yKLvHw0uGBfbxttjiFdwHqZ9w0OJcJOYGxMtH1Ddf2OZXEpdxcwqYAkVGUAGntg/z62
 6EfOjsNJF0y5J2g8blj8p9nWe90nvI/wioQwcpoOr+sNNEMJorrCx/iEQYfeGMq0Bstw
 dYhXRL/U9y8ZQqLZ0JHUfoQGREPiJkV2hm4Q8Qpt9B6l1TcOeI5/TZXT0QpqUyw735Qd
 085QzqfH59RWraXUzemmYVcmKB6yxKyAxfm6cEJxkqalP7XX8QriSOcSsOEUFip1GJVY
 Zq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=/RImki6aeT4q5vb9Y/WQiMvUYzgD9NDtY/Eh1UmZ8iA=;
 b=uNn+Jo7N8zifzCna8wRT21V5HdeOKWcLcStF34DXm3QRdCnoiu8ZSdTs+9NWXg6Oud
 rmP4y6dy5UT51ZEWRKtMsO0fFrNDnorKlFQIPW/qm7dbqP7RtWSh5uxeSt++57fbGB1a
 ttYwesBacragrppID9xy3TVJjH4kG1Os+KGnBUB0f+bUPIOGJqSyr01seC97sD1IvXLF
 CBUY7myjHF4KT7sTMdpN4c0312V+fxTjjgDmWyBSa6m7rlUDiL3sttZQu3siejFYaRza
 xqpKQddoOuqdHJk33EpvFVNVHmgBC3PKmCRv3wgn7QwhgKjBEOL16Y3oT02K8XozNsA/
 xYMA==
X-Gm-Message-State: ANhLgQ1LE3pJbw9FsNJoYu9GmvcObPnOiOHIH4M6ViwN8GXZkPiz2Znj
 Lsx0nGwAknes8dzfUOimrZUaOGhfug==
X-Google-Smtp-Source: ADFU+vuekTP9i4w42Re9frhofj1tKIgwBJ7sai5hL7P0rtEiV2boFrt/rT5lNWcxnH3CEeV3UiBI89FLHA==
X-Received: by 2002:a63:da45:: with SMTP id l5mr23139967pgj.273.1585006441709; 
 Mon, 23 Mar 2020 16:34:01 -0700 (PDT)
Date: Mon, 23 Mar 2020 16:33:51 -0700
Message-Id: <20200323233354.239365-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v2 0/3] SB-TSI hwmon driver v2
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

This patchset adds hwmon support for AMD SoC SB-TSI emulated temperature
sensor and related documentation.

v2: rewrote using devm_hwmon_device_register_with_info() API and addressed
    comments received in v1
v1: first version

Kun Yi (3):
  hwmon: (sbtsi) Add basic support for SB-TSI sensors
  hwmon: (sbtsi) Add documentation
  dt-bindings: (hwmon/sbtsi_tmep) Add SB-TSI hwmon driver bindings

 .../devicetree/bindings/hwmon/sbtsi_temp.txt  |  14 +
 Documentation/hwmon/sbtsi_temp.rst            |  40 +++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sbtsi_temp.c                    | 261 ++++++++++++++++++
 5 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst
 create mode 100644 drivers/hwmon/sbtsi_temp.c

-- 
2.25.1.696.g5e7596f4ac-goog

