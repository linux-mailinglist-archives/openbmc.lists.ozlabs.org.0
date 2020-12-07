Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E702D0B29
	for <lists+openbmc@lfdr.de>; Mon,  7 Dec 2020 08:36:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqFVv3ryqzDqW9
	for <lists+openbmc@lfdr.de>; Mon,  7 Dec 2020 18:36:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ychAnRc5; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqFTs0VFgzDqWF
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2020 18:35:41 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id 11so11645710oty.9
 for <openbmc@lists.ozlabs.org>; Sun, 06 Dec 2020 23:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=MMRdymor46b7h+Rev8DIyF2RrUilXr1N1xRuLTSBipY=;
 b=ychAnRc5qRfdhq6aV+gNHzegtTi0n1bTSRCoQ9/s98ebNVNZ+4Tf7SvloFQ1k7X/6A
 FTgIF9GCEXs4EJtBSLvQEfk1SAfd5RMYu0YI9xcvnXF+F03xw7I1OGaP3YsS/0aGuQ5W
 6URazovpOiLUw8cenM6rnrhZ/VTsEQd1d1qc0EIyih+pKTPf4a5hrLewLJF6UV7kcPuJ
 qxVHh06uTnAzBDydxDNxX3Ro8tNvOgVCo0HHsm/YzYBCvR/XFrBABS2pbxKkZynbwMAn
 IfffU3rRc881sfaV/TzsWe9pE0id8+G0CuzttJc7xo6LeYVXL2ao1WVtBZ/J/yeB5cUQ
 O3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MMRdymor46b7h+Rev8DIyF2RrUilXr1N1xRuLTSBipY=;
 b=JZ7w7O3DqDY6MaDHPUWe1cEX1yUgb/BaLQC/WGFIxqEugUNEQwf4UBJCwtuJOmfOSQ
 NUzjyAWzkuDX8ai4mmdQymHjArd3MH/xtaVZTRK4GulBmCQVa1gNej+6FRTM6wnenTCD
 yo1PjyntruOoy7gxEmb1Cn7JUJ6O6yPN+9ZxGkcRCmnjMSWUrwWInGMsUt7JQub8e2kc
 46+fvwJpdgpuHA1A4itcPijk8zHN5Ern4WR4Aww6fKDn0pLoXTTQP2isUbAXMYdjjdsc
 RKSQZixYuU2kqOvh8C0LClmVByce7YdZ2Gd+//JAzE1228m3BXzOFwOpm4zpNGMe2rtX
 i0/g==
X-Gm-Message-State: AOAM532P04bJkROcNLwSRpfEXWmb+Qt6QlQN0e9wmauOwtE0WA9Js+T3
 eiIhUuVUu4tr6nVz7OX9Bsa0HcsG5Jvee8LS8SbaHwmr2kw42Q==
X-Google-Smtp-Source: ABdhPJw6i3BHSYjUzHYXLPB4gc3X9sZTNYZK5qaNzfV/nFSmoJcdFVsoQiyXdq97JQ+eq3P3f9mL61Zt30YLWMPt5Dc=
X-Received: by 2002:a9d:620f:: with SMTP id g15mr11084227otj.361.1607326538451; 
 Sun, 06 Dec 2020 23:35:38 -0800 (PST)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 7 Dec 2020 15:35:27 +0800
Message-ID: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
Subject: Adding support for custom SEL records
To: openbmc <openbmc@lists.ozlabs.org>
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

This mail is to propose some changes in openbmc to support custom SEL records.

* Background
The phosphor-sel-logger is the service to provide methods (IpmiSelAdd,
IpmiSelAddOem) to add custom SEL records.
However:
1. It only sends the log into the journal;
2. It depends on
meta-intel/meta-common/recipes-extended/rsyslog/rsyslog/rsyslog.conf
to filter the journal log and write to "/var/log/ipmi_sel"
3. It depends on intel-ipmi-oem to parse the "/var/log/ipmi_sel" to
provide the SEL entries.

In short, phosphor-sel-logger only works with the meta-intel layer and
intel-ipmi-oem.

To make it support general usage, several changes are submitted to gerrit:
https://gerrit.openbmc-project.xyz/q/topic:%22dev-add-custom-sel%22+(status:open%20OR%20status:merged)

Some details:
1. It adds SEL.errors.yaml in PDI.
2. With SEL_LOGGER_SEND_TO_LOGGING_SERVICE option, phosphor-sel-logger
creates entries in the logging service without callout path, instead
of sending to the journal.
3.  In phosphor-host-ipmid, it adds extra logic to parse the logging
entries and convert to SEL entries.

Comments are welcome.

-- 
BRs,
Lei YU
