Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D062D64495
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 11:46:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kDqD1KtxzDqcn
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 19:46:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="AXzujGXA"; 
 dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kDpj2TcMzDqPb
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 19:46:20 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id h21so1663420qtn.13
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 02:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=zf0Y8+z1ZYCm4V8OxG5S/sFvVsAF7QOkvlShho0Xllo=;
 b=AXzujGXAc0P5RhzMKxJ6zWt6jmNGuUViVRDzcTrBvQZHsOYTYICGj9IXCNb3lK9VL/
 eAwegIfSBt9V3ZJsCfU+tYMYH8KRaWT9OgYl4zluyJ6No8b7KzBcxDEJMEJbUcit8ETV
 UptOP+NzKHZqf5t8HXM6+9faf8K0/KMN5WgiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zf0Y8+z1ZYCm4V8OxG5S/sFvVsAF7QOkvlShho0Xllo=;
 b=ug6t/7gP4fc+vufTU66dQzo5//6nAqcz305xHHaosgT7DzG+B8bGt5t/1/5P6cXiwq
 PiqKp4ABLc+N5LUa1IIG/1YmBOmGAEkTI3HELAIfVjHYLh72RlI4fn5dt5RMVif8t5EL
 A8q6DRGdg4zLV4nrWKIhpUlr3FQAKk4zBixuS2MK8oInFVVkw/wUUBayPf7AT75K+ir1
 TWPl/c8g3wphhj7WvMfRcfLOfgILHZS26DrzhDSeusey1n0fmkdO/LunWaG1gtZEpyoa
 cFOYYQ1KlnGay1dkU+tOBrfV2jtZ8QXy/ilqAZ7tJwiYkzxbzu2KaSxvrFMQq2MToCAD
 c5NQ==
X-Gm-Message-State: APjAAAWk4YYU7gmBT+bKZcO62qVq+g/YvCv528qPZsfD7cUIDPNsbHnK
 Zm1oDM/reOV8LvC15xkt15zvVJJ3PLCHZcNne7p9aiH3
X-Google-Smtp-Source: APXvYqw4v1OP2PExTAFW2oprAXq7Rkh7HGq7cLhZaqj01Q3aKNrGfJ5KhfQRKbCEmmcwDgZwVsjD19Lc/UCPdvBbO8o=
X-Received: by 2002:ac8:2fc8:: with SMTP id m8mr23027308qta.269.1562751976767; 
 Wed, 10 Jul 2019 02:46:16 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Jul 2019 09:46:04 +0000
Message-ID: <CACPK8XfLruW7RN+6G=eAjuY_pKPRbTVBs8aueJs==6QzmhDY2w@mail.gmail.com>
Subject: Moving kernel to Linux 5.2
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

It's that time again. I've pushed a dev-5.2 branch to openbmc/linux
that contains the patches from dev-5.1 rebased on top of v5.2.

The bump is in this commit:

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/23344

Note that there's a systemd-network bug exposed by this change so you
will need this commit to do any testing (or work around the issue by
manually bringing up the device):

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/23412

Please test, +1 and report your results.

Where possible I've cherry picked the patches that will land in 5.3.
This includes the device tree patches, dps310, aspeed-video, and fsi
fixes.

We have 100 out of tree patches at this point in time. Of these, 58
are staged in 5.3, leaving 42 out of tree patches. The out of tree
patches include:

 - aspeed spi-nor
 - npcm clk, bpc, mailbox, ethernet, flash
 - npcm device trees
 - peci framework, associated various drivers
 - misc other patches

If you have code in the tree then please keep working on getting it upstream.

Cheers,

Joel
