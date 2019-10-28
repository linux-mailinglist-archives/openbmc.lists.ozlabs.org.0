Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926AE78C1
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 19:50:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4723gp1zM2zDrNG
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 05:50:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b43;
 helo=mail-yb1-xb43.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jsbTDvAy"; 
 dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4723fB4FZqzDrNG
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 05:49:02 +1100 (AEDT)
Received: by mail-yb1-xb43.google.com with SMTP id 206so4427272ybc.8
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YtDZE3JSBicuav7mf9Xj98ap2OXKCTrkNK+bPYIG4Po=;
 b=jsbTDvAy2PmI5BgaxuGmXen5jq5qJrqeoVipvEKSXTy6L87bA6OkT08V5OIdWKv2HL
 9QkXokcnFbsOYvooHn+TgaoI9v5GghAbuYIWxOrptM25GhFD/VYr83RVg0ypkVj/FJ5C
 8Bwb1v7pf5yrYEQdc44Q74rcN1g26cfEfHQLwYsCREiMRdS5M5fk1/dyItqXCtP/wj7N
 hIVBcrQiSl0DI/pJg6VG+jo4NU/e6nh+09V5hmp5wORNWLMiCGvc3Lq/x+AZZ/0EqItX
 gusn1pmxEu0M2fgnUgo+J2hskoWJlfYCq2m0ve3B+5EzELd+2lOUWKFLsDR71iLQyazo
 2vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YtDZE3JSBicuav7mf9Xj98ap2OXKCTrkNK+bPYIG4Po=;
 b=QObqkLkVUkl3vlVEBvWMrjJaHzN6hvNBzA2oaonDPmQ5tm6MJKbiaua5P6fix8Nf+G
 5JbHJ4Kjbuo75G4c9ojvkn1bMWx28Ixu8KbuTUEicy8DYJspI+RYU6gk4cR3VtoddGvh
 r45IKEJ9NRf3Xx5tGZJv1TZ0kh770NIVJqkF0X/r3PymPZpAquP2Ujvi9VWDLnmm2aAZ
 ysKxmsLJYopRrTDFsnEctjmOSw6XCUdg2eu7Of+6jjFA74rO/hkDHKZ4c8AJ0QBa4g+8
 aXqmPTDiRbv64m7p0TAuxjkSj9JtlmFjSFGP0q2G0Rra+TU7gMc50bBaIwAy36+lARyl
 g6kQ==
X-Gm-Message-State: APjAAAXPjcXlkl/LSAPGFvDk2jVznlfaNM5FY4rC+12qk/ZF1hOLD0io
 U7P8IToRudNwhIk5yHQPLaLxs1kexOAQFNipO8QECw==
X-Google-Smtp-Source: APXvYqzxGgAi/X+KoRwP4FcbVm5Kxl+LhjNjj3pKiytBFMC4rU7ZYlsVc9c8bfx/F47CcgLbOM9My6BNWPg9e6WdbmE=
X-Received: by 2002:a25:7207:: with SMTP id n7mr16430263ybc.406.1572288538642; 
 Mon, 28 Oct 2019 11:48:58 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Mon, 28 Oct 2019 13:48:47 -0500
Message-ID: <CAMTupoQThp=WRfdH+QHwmqP1ZqbgCKq81rS8Cp+0sYKQfNe4Sg@mail.gmail.com>
Subject: Collaborators? :: Enable/disable access to BMC through interfaces for
 security
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jrey@linux.ibm.com, 
 vernon.mauery@linux.intel.com
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

Hello all,

As part of the GUI design team, I am starting to look at requirements
for enabling and disabling network interfaces for which the BMC can be
accessed. For example, IPMI, SSH, Redfish, HTTP, and USB, to name a
few.

I know there has been some conversation on the topic before (see email
linked below) and want to reach out to see who is interested in this
topic. And I would love to get your thoughts on the following topics.

Some questions we want to tackle are:
1. Which interfaces need to be enabled/disabled and what is their
priority? (See full list in the redfish documentation)
2. What should be the default for the selected above (enabled/disabled)?
3. Do we need a staged plan for it?
4. When can we expect backend availability?


Redfish documentation:
https://redfish.dmtf.org/schemas/ManagerNetworkProtocol.v1_4_0.json

Related email discussion (on staged plans to address IPMI access):
https://lists.ozlabs.org/pipermail/openbmc/2019-September/018373.html



Regards,
Jandra Aranguren
