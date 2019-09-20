Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7C2B88E1
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 03:20:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZG9d1RNPzDqhC
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 11:20:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="swNZK2f6"; 
 dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZG8v4SFVzF58j
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 11:19:37 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id e17so5385516ljf.13
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 18:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4MNH8gJ8pPZY0kfbo74nU3ZlBGnxb/xShAuuOA5AVh0=;
 b=swNZK2f6L/8w5CCAPpIVTF/fQcKRnIde3ftt7c7bXUQVKj9b5HaSJkqnofqyyxxRbD
 ldleoJZZJlDN5lhEhlB5BWrvekI2fDNCSWDNzlE3Ja3+EQQUHjgBlxWpm1IC9nJSA3Lr
 j96zyG0gkRGM23rL2dZsEeZoE0A3Z15/xPOZhedqinUvyjctefEHgV+tWIQBQlXSop6k
 E1yyFeX/Y9ceuVOanTwNDF4EEHhxCuLVF2GRw/Sz2f4sXDFQ78JwHzWASIEMphTj3Ynt
 srffC3lcOHNUTMePVX9wBz7MPKORMDqS+ZVewc9Il+zikqCzOAW9eBKkhvYnUukNKwBa
 unzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4MNH8gJ8pPZY0kfbo74nU3ZlBGnxb/xShAuuOA5AVh0=;
 b=GZw9nrmrCzKr9GVniUN5zrlYMuh0h0KLFIdPUJtc1b/INY3DvdtTbhM16bTGSjRHqh
 9YPrUIWvI8jmM3XNvNHDlmCNMuR/+O3OWHno+SPZdie8w9dZqduzGDh+Suqk/hfrBZ4b
 5NieBy+MWye4yZFCHpPZK/6ogvuoeQy5Y0RgLPkhR2j0Jwte6WI7lpUA9YaaZZNTwgvv
 EV4U5OUt9EdW0UMb1pyPH+Y72Aerz6XytIwuadCjOJDU8ssGSkvk0HjVs9tMBDUVGcZ1
 067Mb0NWQ7dyOVXbJNNUtAnZ8E/deHqm0F5epw4HPBqlV/+E/kxyx0DLgD9mXzxZiGId
 mFFQ==
X-Gm-Message-State: APjAAAU5khb8UCJrNu2594h1dvyRfPBypUyewj17rRZcGk1fLrvSeNme
 z5a9XKGjsDu42JtsCR9d4UVryM9D3trfLBi99+MO7FUbfD08xg==
X-Google-Smtp-Source: APXvYqwPX3Nsrqkg0pw1dQ4Srq+z7SjpCtHtzAsfTDwSPP1VDYoir/su0trhJOZKOKjYGjMqgQiHLnEYfLQIcEdBRWk=
X-Received: by 2002:a2e:90d9:: with SMTP id o25mr132817ljg.94.1568942372579;
 Thu, 19 Sep 2019 18:19:32 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzhiqiang8906@gmail.com>
Date: Fri, 20 Sep 2019 09:19:21 +0800
Message-ID: <CAHkHK09V4Oq2Qe4+JrurQ=vfFXo1=T=P3SGULR0o9o=C_jUDoQ@mail.gmail.com>
Subject: Remove support for old assocations interfaces[org.openbmc.Association]
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

Hi, all

I am working on to resolve this issue:
[Move to new assocations interface and drop support for old interface]
(https://github.com/openbmc/openbmc/issues/3584)

support for the old interface is being removed:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-objmgr/+/25264
Removing old interfaces always cause troubles...
So, if someone is not happy about it, please leave your comments.


Repos using org.openbmc.Association:
https://github.com/search?q=org%3Aopenbmc+%22org.openbmc.Association%22&type=Code

- opnenbmc/phosphor-bmc-code-mgmt
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/25088
- openbmc/openpower-pnor-code-mgmt
https://gerrit.openbmc-project.xyz/c/openbmc/openpower-pnor-code-mgmt/+/25087
- openbmc/phosphor-logging
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/25089

- openbmc/pyphosphor
I ignored this repo, because we have removed python.
Maybe we can remove pyphosphor, if no one is using any of the applications that
use pyphosphor.

Application using pyphosphor:
$ grep -R pyphosphor meta-*
meta-phosphor/recipes-phosphor/flash/obmc-mgr-download_git.bb:
pyphospho-dbus \
meta-phosphor/recipes-phosphor/flash/obmc-flash-bmc_git.bb:
pyphosphor-dbus \
meta-phosphor/recipes-phosphor/interfaces/rest-dbus_git.bb:
pyphosphor-dbus \
meta-phosphor/recipes-phosphor/chassis/obmc-control-chassis_git.bb:
pyphosphor-dbus \


Thaks.

- John
