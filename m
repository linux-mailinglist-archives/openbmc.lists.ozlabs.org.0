Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B25A437
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 20:38:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b5B1161WzDqwF
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 04:38:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ijj7It0G"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b59R3Q6szDqvn
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2019 04:37:45 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id c85so3424707pfc.1
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 11:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9y6CfB3GGH4i/RPl0froCfvtny6FInwjBKrMVQcOank=;
 b=ijj7It0Gx+lyLO5GgPBPA/h04XAUm3xp+E1RggT1NGPohECXlliRQv+THPCQqvH4W6
 0ybwrDQCz6rKRXmO7uPlpm3PJAyGrc4e2myxLySL8VIacx5PFic/9AT0ikZCFeE2CTSw
 VsNehOcaQmGPZs/UQTQPiGgFE1CRAvFTxIdQH/tzwPhRlGC2tFSaf/z16gnTtoShycUH
 CnIbQlXWuo8CWpwZ5nMb+zBnZj37KuHlYjaP3LdLrdcrbwtAL3gyMPkQ38gLQmULKGP1
 8wvEbtldbE57NJymLyOSAg6UU9hlOOma5tJu+55uqK73kmX+vUGNeu1qQjryuGcxEEsX
 haog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9y6CfB3GGH4i/RPl0froCfvtny6FInwjBKrMVQcOank=;
 b=X/E0UQcSSHx2i1yFpWqpgq26YSqGehRL+TFCBqv5hG0GuA5XrYxAGIKk4oz4/l8UhD
 9ht0rnbEeSO7VBqPLpInkr/5Kh5FDIWHK59pb7QBmCUrToa5hl6/YT10yYRhUUmj285+
 nu3L/VYpAOvG1LfQGkEDlsMKb9goxr4Jwr+P3XENF+0IRrmvKCB+52yM57dzzDNHD9ol
 bgWiQbUAD7c9dRFSBAUk+Q7e9JsKLVovKb/slI6vpHc6Pr0O+LJHkWCTTU3nlmzE0qZI
 zz21sUv3+YN70iR57zIC/+jVCHmzLQgPYlubnr8JMrt81eYQilr8eHWwai/GkwVzPkWV
 OCiA==
X-Gm-Message-State: APjAAAV3BuSgcW2gLqYs/WL/tkmV5H8IZnwDlmC0Wp2ioHwbd+DRizJu
 4vkkFUS1e5nW7EHhwm8cgu7CVWd7jejgktSZAnrjKw==
X-Google-Smtp-Source: APXvYqweTa0Ok5aJ9NSDs6WCGWT5C7JJ3dG5ZMEPbSNt7K3Jv1MxOaSFzLplX6bcRMu38NVRMXYEc1sOChF+tqGZJl8=
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr10464840pgb.353.1561747062089; 
 Fri, 28 Jun 2019 11:37:42 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 28 Jun 2019 11:37:30 -0700
Message-ID: <CAO=notwFhvnF8PEJRAa06PaFc_6Ge4U=Q2eKzdSk26bjatRdfw@mail.gmail.com>
Subject: phosphor-ipmi-flash: Next Iteration of Control
To: Adriana Kobylak <anoo@us.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I was thinking, since I'm going to extend phosphor-ipmi-flash to
support updating a BIOS -- it might make sense to make it more general
further.  I was thinking about how right now, there are default
services you can implement for each thing, prepare, verify, update,
and currently we don't install them (although I was going to implement
a default prepare service).

I was thinking that possibly adoption would be easier if they were
targets instead of service files directly and then we'd always install
the targets:

- phosphor-ipmi-flash-prepare-update.target (always called when
starting up a process each time a new process is started)
- phosphor-ipmi-flash-verify-bmc.target
- phosphor-ipmi-flash-update-bmc.target

Then a user can just install their services into the targets and not
have to really worry about doing anything more.  I think it's equally
as usable as before, but ... I don't know.  This way, it always
installs the targets.

I was thinking about this further and was thinking about how
everything is compiled into the application, dynamically/configurable,
but compiled in.

If it's going to start supporting BIOS, and then later other firmware,
perhaps the list of Blobs and their associated actions should be
configured via json.  There is a limitation to this though that if
that's the case, then the ActionInterface used for different things
would really just become a SystemdActionInterface and we'd use
services to control everything.  In theory, the json could specify the
ActionInterfaceType from a list and the parameters after that point
would be per type..., but I think that's getting a bit easy-to-break.

Those are just some thoughts I had today.

Regards,
Patrick
