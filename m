Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC44E0117
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 11:48:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y7xN2BHwzDqDx
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 20:48:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gkfEni1u"; 
 dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y7wf4X7MzDqDs
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 20:48:00 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id 1so8273768iou.4
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 02:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xwOyR5GYVX3jqP3jKwaDH4E0/2q/QcfBxNR7osMdZLA=;
 b=gkfEni1ubvXEdJO0NUWbJEj2e6XU3ifvqZdlCMzt42jiL63BSNLP9I1PV74kE4vvQC
 cK4pfLTpAHpzoXNi86Y8hIfZelr4lcqSojl4ZF3wOwI6+47kQokBrCttIHABN4APGzll
 uAqrdYGnbkKzdsExCBgUeElXsvacFNePg6kJwTms49Tk+2zXnmKF3R84Kj1bWMz6Jvql
 Abt1XIA0Rr4wub3hJRXkbJkCNHchy6KZv2shs7ZYghjud0HdF1l/czm659VJyQQGC27C
 4Ry560RFYQ3eTFRdliZOev8O2StsOl7Je/9IkLJi4+1vtNsJHfndVbD3kuVx1sbYXGOM
 AUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xwOyR5GYVX3jqP3jKwaDH4E0/2q/QcfBxNR7osMdZLA=;
 b=qK7Az+U6l6dkTCNrWLXh2DgDirSFeuQKezFQFKnwAevbQaVhq9388/d+TGlhT0ntT5
 h6dyPlFULALF8qM2t9fu6E9lgNvGK6680VYM1Wz/knxD81e8yn8ejvcJpjH5E60QO41P
 yfPN3iQuFTEXQ8A2EJdo1FfBuvRd/p7Eu5/X59QvnyrkAwe6LGT8KytgoyAhIdg7wdb1
 OdVP+Ullp8jmlqeV53+JjNxE+h9HMxcCoLkpii8riKwgy+xqXG96exiqVgZ6xC70jfQU
 mDfPSJ9tOfhp36f1Jso9AzIRu2qvdMynyXSWjUzRQ5PkmCNEYE2NMDJLiSHiAoCjhEnh
 jfBQ==
X-Gm-Message-State: APjAAAUbSFVATKvHoxumPeuZHRuLSZNFTpLUCHXJKPVTP8GJANH289mB
 VNLIUmPXzjSdzvuSmtMRoC6X1oitBndovBA3NNy6hIaSDPoDJw==
X-Google-Smtp-Source: APXvYqwjjLO3UO0G9s1MibRovh7gp6tQMY6hCbnGUL91KxcwKVQkaIzsupgewdo8/0rjmEQKA4jcN/LMJf/uuEKQtQs=
X-Received: by 2002:a5e:9e07:: with SMTP id i7mr2942834ioq.42.1571737678143;
 Tue, 22 Oct 2019 02:47:58 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Tue, 22 Oct 2019 17:47:47 +0800
Message-ID: <CAARXrtmNsry0bq-5eTD5qo0LDq_zWag9s8kGqMq4yGxzpxXCeA@mail.gmail.com>
Subject: Updates and future changes on phosphor-power
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

This email is to introduce the current status and future changes of
phosphor-power.

## Background
Previously, [witherspoon-pfault-analysis][1] exists for Witherspoon to
provide functions like PSU monitor.
Later it's found that the code could be shared for other PSUs as long
as a property json config is provided.
So the repo is renamed to [phosphor-power][2]

## Status
Now the repo is renamed and I am adding the bitbake recipes into
meta-phosphor, see
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/26356

However, the repo still contains something that is not generic:
* There is repo specific error defined in org/open_power/Witherspoon/
* It has a dependency to openpower-dbus-interfaces to use interfaces
in org/open_power/Sensor/Aggregation/History

That is not ideal.

## TODO
The repo specific error and the interfaces in
org/open_power/Sensor/Aggregation/History are actual generic, so they
could be moved into phosphor-dbus-interfaces to become generic
interfaces.

So I am planning to "copy" the above interfaces into
phosphor-dbus-interfaces, and when it's done, update this repo to use
the interfaces in phosphor-dbus-interfaces.

Do you have any comments or suggestions?
Thanks!

[1]: https://github.com/openbmc/witherspoon-pfault-analysis
[2]: https://github.com/openbmc/phosphor-power
