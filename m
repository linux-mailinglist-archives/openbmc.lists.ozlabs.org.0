Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB5659CDA5
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 03:14:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBWTN6ytHz3bvl
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 11:14:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bcjGrSC5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bcjGrSC5;
	dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBWSz3L6nz2xD3
	for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 11:13:38 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso8740616wmc.0
        for <openbmc@lists.ozlabs.org>; Mon, 22 Aug 2022 18:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=MyRHEmbHTku94B63Fopvu2NzjuGD/P93ThC8RW4DOOg=;
        b=bcjGrSC59kcD9AixkpNyh9ckaZWlyaYj2zi2F4k3M3rAnBW2NoIHB61EWpVJjfya2y
         k0o5len9dgwKLkJSptMdJfLOnSi5wXTg1iL2711b2YqTqRjtiP6unXrBsxK9KLyMdHQ4
         ceCfYF2eLRETQMs76codV0oMBudCFhEYw07Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=MyRHEmbHTku94B63Fopvu2NzjuGD/P93ThC8RW4DOOg=;
        b=DF4HWQALG9c4IlBE9yaxFJecxfuhl1tIsfhmnQF1yYDTw22qRt8I5pp7Ub8aiWPIJE
         VNm0AYk6GuWZ8QxHkxLKoNlL4LE/vkqG5Tow3AaWmaDfv4gtJV7NmSw4BT/JK0HuIx0a
         j7D3eB31MPczgNlNMVubWkkpJ69zqL7Af+orwx+I7ERtKPC7Mbiq+7+cUPanOfxPx6SV
         XAcfzZgHiEzgvsm4BQ9z8Ugtw/VQoQUzFtEdOOuWDAhSOu+JKf0Y0Mex5iq+mxc9oBix
         1BW8FLg08rkl4CKRA+eWM1RttVK2qLJ62S1gTf6kbe7vCy9N2/IecTjQ1kcw0owRjjxd
         gtvQ==
X-Gm-Message-State: ACgBeo2ROlatwRpAytegR/TQ/u/Op1f1iTzJ/AS4mwKZKFVbFZP5aQqx
	HMWJPpCS9NqYRBgROqnArT6uLuW+xqQpRGPXnsnWt7q0+Ck=
X-Google-Smtp-Source: AA6agR7HQAwWmnF4dqepeON1t4eEby22zpdCVZ88e9z08cEN0YTMhu2vZeRUDPCVHvOsB44JhjX+8pMxqJVgVHQgPtQ=
X-Received: by 2002:a05:600c:5010:b0:3a6:804:5b08 with SMTP id
 n16-20020a05600c501000b003a608045b08mr499768wmr.10.1661217211399; Mon, 22 Aug
 2022 18:13:31 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Aug 2022 01:13:19 +0000
Message-ID: <CACPK8Xe4ijKWnURT4T9em2pUqifNdkZUfg0dd5osATYnqqutSw@mail.gmail.com>
Subject: Removing machines using old u-boot tree
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
Cc: Jason M Biils <jason.m.bills@linux.intel.com>, Ryan Sie <ryans@supermicro.com.tw>, =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <fran.hsu@quantatw.com>, Benjamin Fair <benjaminfair@google.com>, Zev Weiss <zev@bewilderbeest.net>, Vernon Mauery <vernon.mauery@linux.intel.com>, Alexander Amelkin <a.amelkin@yadro.com>, Brandon Kim <brandonkim@google.com>, Oskar Senft <osk@google.com>, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, Andrew Geissler <geisonator@yahoo.com>, Ali El-Haj-Mahmoud <aaelhaj@google.com>, =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>, "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello machine maintainers,

The following (see end of email) OpenBMC machines are using the old
v2016.07 u-boot fork. I would like to see machines updated to use the
new fork so we can reduce the maintenance burden of u-boot.

We have two options: move to the newer u-boot fork, or retiring
(removing) systems that lack the maintenance effort to stay up to
date.

The v2019.04 u-boot fork supports both NCSI and direct-PHY network
configurations. For most systems the steps required to update are:

- Select an existing defconfig to use. evb-ast2500_config should suit
most boards

- Select a device tree machine to use. For direct-PHY boards, the
ast2500-evb should be appropriate. For NCSI boards the
ast2500-romulus.dts machine should closely match most boards. If this
meets requirements for most systems, we could add a
ast2500-openbmc.dts to be used instead of adding a device tree for
each machine.

-  Adjusting the bitbake metadata to use the v2019.04 branch. An
example is in this patch:

https://gerrit.openbmc.org/c/openbmc/openbmc/+/56133/5/meta-ibm/meta-romulus/conf/machine/romulus.conf

I propose removing systems that have not been updated to the new tree
by a set deadline. The exact date is up for discussion, but I think a
reasonable target is the end of this year.

NCSI AST2400:

meta-quanta/meta-q71l/conf/machine/quanta-q71l.conf

NCSI AST2500:

meta-ibm/conf/machine/mihawk.conf
meta-ibm/conf/machine/witherspoon.conf
meta-ingrasys/meta-zaius/conf/machine/zaius.conf
meta-yadro/meta-nicole/conf/machine/nicole.conf
joel@voyager ~/dev/openbmc/openbmc :master

PHY AST2500:

meta-amd/meta-ethanolx/conf/machine/ethanolx.conf
meta-asrock/meta-e3c246d4i/conf/machine/e3c246d4i.conf
meta-inspur/meta-on5263m5/conf/machine/on5263m5.conf
meta-intel-openbmc/meta-s2600wf/conf/machine/s2600wf.conf
meta-quanta/meta-f0b/conf/machine/f0b.conf
meta-supermicro/meta-x11spi/conf/machine/x11spi.conf
meta-tyan/meta-s7106/conf/machine/s7106.conf
meta-tyan/meta-s8036/conf/machine/s8036.conf

Cheers,

Joel
