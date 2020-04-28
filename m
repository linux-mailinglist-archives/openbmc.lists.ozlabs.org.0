Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A331BCC23
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 21:11:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BWTk54BLzDqrn
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 05:11:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ukX3wrFe; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BWLQ0JWmzDqLy
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 05:05:17 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id m13so34573250otf.6
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 12:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=hIZpqsvysDEl2Lwmr50Y+IBRVoqjbLXO3V73xUEc64o=;
 b=ukX3wrFehq7ThqtQtJNrs7LYJZBV4mID9Yn28otCbB+ir1Qakpl99V7aH69aC5JLz1
 mKaQtHNrENhu114PlciWM9eyEyOxvXP0bT8ikOYC442uuiu/pq+KvXtXM2lUzlFh6nVN
 NAb27J+w6Si3aNkuyWlVIyNB3zRiouu0zdhWUrVHl+pEUk7KyoTt/gaCzVz0hIIi3yas
 iWokdOiLgbz8u5j3IOCD5XvnWgc8lB9hqmrOt5CFNWILWMlr6ylT3Hp8ozDT5CBIvbPR
 mldLHKZ+a8DD8SJwszShtLxs4cLavmz8YphS2yjZcmxsaLSehxnRAVyjNaY++ojk2bnT
 cN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=hIZpqsvysDEl2Lwmr50Y+IBRVoqjbLXO3V73xUEc64o=;
 b=Y/hv+d0+V1Ov9Qoz4RWI0DJbrsDcZA0YDWFuSqd/uVpyLz88IaT5K2X8hHOaUBcO7s
 dCOeGSP19NSSNp4WdG4WgebpscfhjRS2arWVRclIbLHxBDLVRuYaL9XUcWEEJYNcwsTq
 gWv6DTU5MoFr1A5kLeBlcNsBRoJIIHzIGs7LIYi6hB5unQwfO7OmEF6h4H7vcaffGye0
 CEOrVIPAjF/CM+9leOaWD5JC33hTvOX1XPYnDyIblYzN/GCigL4tCfUCydU7aNdWiLeU
 IIly+VBy7h02OFOUFO9MZ21nQ/a2X8ruEs56aydkd94hUqrxwKcynj+E3W12+8Hf38Lu
 P8nQ==
X-Gm-Message-State: AGi0PuZCjeZvh5xHl3PLJWzLwINo/pOIn64YInIFnJ/t6QNlE7Q/LNnb
 TeNIhH71XLkNt8isJJ5j2U9iTq/pCmo=
X-Google-Smtp-Source: APiQypIYYfymjNWADFiEGUYuzExAy37n8NtivweFsxYTdmwLsV3fGx3roLIrgFlznpvNXteAF9T3vw==
X-Received: by 2002:a9d:509:: with SMTP id 9mr25056009otw.17.1588100713243;
 Tue, 28 Apr 2020 12:05:13 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:3c1d:3c82:a2bb:790a])
 by smtp.gmail.com with ESMTPSA id 60sm5021395ott.17.2020.04.28.12.05.12
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 12:05:12 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Dunfell Update Status
Message-Id: <41CB9FEC-1892-489A-8CD8-A50F5E744C4D@gmail.com>
Date: Tue, 28 Apr 2020 14:05:11 -0500
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

A fairly quick update on where we are with getting back onto upstream =
yocto.

For those that don=E2=80=99t know, dunfell is the name of the next yocto =
release. As
Brad pointed out in a previous email, if you want your meta layers to
keep working, you=E2=80=99ll need to update your layer.conf with it.

The move from python2 to python3 is mostly behind us, thanks everyone,
especially Patrick (stwcx) for all the help there.

All of the CI system layers have been updated to now support dunfell.

We ran into a phosphor-webui issue that Gunnar has a fix for:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/31736

IBM systems pull in an external tool, cronus, which needs python3 =
updates:
https://github.com/open-power/eCMD/issues/350

The two unknown issues I'm currently stuck on are these:
https://github.com/openbmc/u-boot/issues/24 (u-boot compile fail)
https://github.com/openbmc/openbmc/issues/3657 (weird sed issue)

The u-boot one I just don't understand and am hoping to get things in a =
state
where others can recreate and take a look.

The sed issue isn't related to dunfell, I've been seeing it without the =
upstream
bumps. I think the upstream bumps just make us recompile gcc which seems =
to
aggravate the issue.

Here are the yocto bumps for anyone interested in pulling them down:
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/31715
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/31716

It would be great to get over this hump and back on upstream yocto/OE so =
any
help or ideas appreciated with the remaining issues.

Some other issues that we ran into but are now fixed in upstream:
https://patchwork.openembedded.org/patch/172082/ (boost)
https://github.com/openembedded/meta-openembedded/pull/213 (new recipe)
=
https://github.com/openembedded/openembedded-core/commit/7bae99cd6c82fff6f=
a56bbddeb936e27b28e79ff

Thanks,
Andrew=
