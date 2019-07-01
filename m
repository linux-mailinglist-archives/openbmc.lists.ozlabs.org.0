Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838C5C3F3
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 21:54:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cyl02RrrzDqXr
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 05:54:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oGl9pZrV"; 
 dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cyjv1y3RzDqXg
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 05:53:54 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id t76so11004784oih.4
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2019 12:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/xq38ui2xT63I95L1AJvL3ycEm3IcNpRbl2en3NKYI8=;
 b=oGl9pZrV1LL+QHazAao/XQBvWS4I6ftaD2Z2Vqm4yM5lachiZkseiOqxr90USO511n
 U5yOz/yEI3icn5f7qj3JxUe/XUmiMg+m+/vtfDrKaB522sbrTk61nooxVmkqrNZx8sQq
 seKkFwdt3G8yXWYemQ3Cf4yYB12aZSkCK6FOMO3FxWXyMDd4UxkjMTGZ76M5INjNu4dj
 GfUAWTGVQhESW491GPSHsynhVNcObbvy1/7wn7DlHkzmEVmID98QRro7e6jmUsygHxly
 3EDfVluXSVfrSCCwGPJ8zmu2lEURUx/T/Kntkdn3d69lZSfMc1+hlvpo5RD8or42Ugu1
 Nwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/xq38ui2xT63I95L1AJvL3ycEm3IcNpRbl2en3NKYI8=;
 b=V9IJUmKMh9FnrOlPP4q9Q4jRvhGtTK1z4IHu+60LR86T8KrEto6hJHHMm+A4ZoNFVF
 PzCxhb0pt/GvEHJFNzRFPQqIkkoo8jT+4zM3BIl/vwo03KQh1+rcjNtZslTKTSoA0ND+
 Ai5ccn+9VLlFAOonYOb1pAbsv2hY/tR4QAKwUuUrjp7pmHuTLXjT4qF5D7rr/wn8fuaE
 45fWOJPwRdGCvopOsGerP20MTCdfjjxvllivkckzzfJcJpE05I5BrZFZzB8j57qiduGi
 2nogQfzltPyBKTOMkkIeAGEynf8adMCYeKMCreooQwsJbTri3p9fLPdQG0/55F+Nw8Kc
 TA3g==
X-Gm-Message-State: APjAAAVVRkiKVPkUhgEy556i2MmOyglw7V0eHPiQSrhPmDrYExwXxDOF
 MQGMpqrkRPyW81rzKSA1z/C1u8RYML0oqoagadnH8sXu
X-Google-Smtp-Source: APXvYqx1h85ddxQZQGDd92R6yNk+gjsxQIsDg0NwcidDYvSN8O8Nv0L/bPkDaVHar34R9UYuxEtq8OXFo0UYRfh/ScM=
X-Received: by 2002:aca:811:: with SMTP id 17mr624050oii.161.1562010830652;
 Mon, 01 Jul 2019 12:53:50 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 1 Jul 2019 14:53:34 -0500
Message-ID: <CALLMt=ruYXdewq8xkU2UZQQRzqasYB26w+CDBwiWoUaGqnbx1g@mail.gmail.com>
Subject: Gerrit Upgrade Tomorrow 7-9am Central
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

This week, I'm doing our quarterly maintenance on the Jenkins nodes
(security patches, filesystem cleanup, docker rebuilds). I'll be doing
a Gerrit upgrade tomorrow. "Should" be a quick one.

We're on 2.16.7 and I'll be taking us up to 2.16.9

I'll update IRC with status.

Andrew
