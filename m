Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 136AD3BC1A
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 20:53:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N2MW4L4VzDqQq
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 04:53:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CHBSzbjn"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N2Lj3ZJQzDqPk
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 04:52:29 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id w79so7013899oif.10
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=EZ3clZipg05SveXe5atZVFAabVtgmRlY3YehXQ5Beeg=;
 b=CHBSzbjnSaw91/EoIKcVENwl3uVpuUOgbHwbywEmsbbBcVCZnpo434xY1ob8TdD/Xa
 FsVjS1HMa7/Zen24BSiArSDISr3L3uDVGed7Go3gJm1rhMSh5V2tJsFtu9V4Z7oQFUZe
 ARJLHXlwX/Ta2ZNAHRC/DNXwQUDFpupw8nBIeiOZPP9wJ1AAAit4c/5b/my4Vr1/9vgN
 uiLTobMEcnfc+brmW6U4j3TC7hJDPG5dI1hf/KZJamYxhLVZ2yyIMz1GSDCLhyerGOwx
 0HWYHXCEyqmCY5ebX/QqqUSH3nZ6LLLW22rVGtRFxWyN+2zpMWTzBh4g6aIiMrysQAd7
 eBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EZ3clZipg05SveXe5atZVFAabVtgmRlY3YehXQ5Beeg=;
 b=kubaYIux1HGe7IzrQ1mycnD3dh5u7/UHYG3DTWpRQ5FabsuGmsciV+1bcyD9KMiEcj
 6Ujnwy4XCXoAwAl4h6HryXfuqz0Dzf1RoypxTstwP+SR3czcmHMjDitHNw9cRApFRp8y
 sQiWXNANmFE6j4y2Ul/bM02YtRPblNpSLTklyeonLPzfvbc7QQH9aMefGG5YLHf8jaAh
 c5iMFDZkr69H7/Q3Pxn3gB3hO4vwAnVKRWKNZu47oGt6GPDMxhN14lBPlM/SqAS5e+Be
 zdkQPHH1j+hD45um/b1PHeedN3y/yLonfI1xmv2qiUN8vf0q+szwEUoHW3Vl6lR/3kL/
 Jqkw==
X-Gm-Message-State: APjAAAV96Ew6zpfiKBBrtmdV2k6AMucWB3M8lcmT+Wll+7msEyjynMqs
 TQB5X4sd1Xbs7J3BnZP3xfp2fohPmDk5fLYuUZPq+7ojNIg=
X-Google-Smtp-Source: APXvYqxZTpCSEfYAp6l4H93h8MMuh+ygbZnsj7LB7jbwltSNuS7fSyuylPha6Da46HMlg32dY/vi4RgsiZyY4wKdhNU=
X-Received: by 2002:aca:aad3:: with SMTP id
 t202mr13464549oie.158.1560192746117; 
 Mon, 10 Jun 2019 11:52:26 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 10 Jun 2019 13:52:10 -0500
Message-ID: <CALLMt=r7F5G8fvwXuCsi2Z6hXW3fp-3ccHqAgNM6TytggbR=gA@mail.gmail.com>
Subject: static analysis of openbmc systemd targets
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

I'm looking for an easy way to visualize OpenBMC's systemd target
dependencies. This will help with reviewing changes to these targets
and services and help visualize future features[1].

I know there is systemd-analyze but this is a runtime tool (i.e. must
be run within an executing OpenBMC based system) and it doesn't handle
some of the nuances of OpenBMC (like our mapper stuff)[2]. I'd like a
tool I could run against the rootfs after a bitbake of a system that
would list out all targets, their OnError targets, and their dependent
services and targets (requires and wants).

I'm thinking of writing up a python tool to do this. Thoughts or
alternatives out there?

Andrew

[1] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22395
[2] https://ozlabs.org/~arj/openbmc/systemd.svg
