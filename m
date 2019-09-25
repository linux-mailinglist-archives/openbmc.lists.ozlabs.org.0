Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA52BD6B5
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:28:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dNnQ2gVDzDqbc
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 13:28:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M1S2zYxI"; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dNlZ1G5lzDqc1
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 13:27:05 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id b136so9919917iof.3
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UtFDnkrnypmS6h6QFK6ErYGNS8v4i78ifDOyGBKcZz0=;
 b=M1S2zYxIdjWlf2LJMvpxkJnh+6WjuxwEuER/zpoionqBgRFzuisFBWvmC2yEJpswZh
 0aD0VyUaP0jR92t8DYvoErs/ryJu6J/Ar77WVJiv3TKbrXwHRgunkc3UArFDbzwupV+5
 1eTTAyGdjLgbe3dMIAIXjU05ESZSwEboRzjolJ1T0qn0zp9W+lBykktRZKWPdxC/HVfg
 oaH7Gj/1vA/tSsc+Li/f5pwfaAg6wjaWMd5ifzEyMx8c7zjoBBDc1o/hAWQtCgTZTyBN
 qF9gc0wan62rqrW/ehOYImiLf5nKUXdgS92UwE+nSCnNaRQyiJrk89vPGLZuVseEye/F
 jWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UtFDnkrnypmS6h6QFK6ErYGNS8v4i78ifDOyGBKcZz0=;
 b=M1SzOfjc2ponx4edcs2TgVtdwQoyRBG77rQ8JofEKR+En4KC+Atvl8MjB8t+TMJYAR
 f/AldtUkeQlxvo/IJZk2mFNzIaDBnlA0ByEIjz+6CmRc77kGRm5doVxSVgWfTVvtfGrC
 qvJDAPlizQnMclLcCsLQFKQi03IPBcgE6UZ9cSwZi/Rrvrt2D9Cj4NWrqzH6/zQr3a4/
 O9AVg7d9UFmd8s7SGt/qz0DAOJ6D/w6SBEDO7v4jaipPg9+ouQvFflD9BfnxwQoMgB2r
 WkeJoztMkviDBePDnBbtZCyJeMykviTecUNvjMIWh9pr5un5qo9R+ci4k9xp6SJGlddH
 DZsQ==
X-Gm-Message-State: APjAAAUH9hFEnQaqTt9E6kj+vYord/t6Of9xYM+QpN+S40r1/9lNanBA
 CjFCM5BNJDia72Y9DFLlK4BMypx6lNsJKOTVh00lq//T4S4=
X-Google-Smtp-Source: APXvYqyAF5SnReXy3PG+XWSURptkZSrSUAgTmNtHTSsqqtxfSnhqkYj0zTxqih5uDj1PrTw9CkUBZfKtjS5NDcN0gCU=
X-Received: by 2002:a6b:9308:: with SMTP id v8mr7438921iod.221.1569382021786; 
 Tue, 24 Sep 2019 20:27:01 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Wed, 25 Sep 2019 11:26:51 +0800
Message-ID: <CAARXrtkNtyWi=_FTWbwtq_sDOGNaAbcptFnYftPzVJY__Td7=g@mail.gmail.com>
Subject: Adding a new function to sdbusplus::server::object
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

This email is to introduce a "problem" and an RFC "fix" for sdbusplus at
https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/25486

# The problem

With sdbusplus, when you have an existing dbus object, and you want to add a
new interface, usually you would like to create a
sdbusplus::server::object::object<interface>, and that's it.

However, that it not working correctly!

A demo is put at
https://gist.github.com/mine260309/aff3c3c2d2cc94edc9d09d59256b61b7

In short, with the code snippet like this:

using MyInterface = sdbusplus::server::object::object<
    sdbusplus::xyz::openbmc_project::Software::server::
        ActivationBlocksTransition>;

std::unique_ptr<MyInterface> block;

void signal_handler(int signal_num) {
   if(signal_num == SIGUSR2)
   {
       block.reset();
   }
}
int main(int, char**) {
    signal(SIGUSR2, signal_handler);
    auto bus = sdbusplus::bus::new_default();
    sdbusplus::server::manager::manager objManager(bus, objPath);
    bus.request_name(myService);
    block = std::make_unique<MyInterface>(bus, objPath);
    while(true)
    {
        bus.process_discard();
        bus.wait();
    }
    return 0;
}

When a DBus object is created, it shall implement at least 4 interfaces:
* org.freedesktop.DBus.Introspectable
* org.freedesktop.DBus.ObjectManager
* org.freedesktop.DBus.Peer
* org.freedesktop.DBus.Properties
And in the above example, an additioanl `ActivationBlocksTransition` is added:
* xyz.openbmc_project.Software.ActivationBlocksTransition

When block is destructed by sending a USR2 signal to the process, the expected
behavior is that the `ActivationBlocksTransition` interface is removed, and
other interfaces remain.
However, the result is, only `org.freedesktop.DBus.ObjectManager` remains, all
other interfaces are removed as well!

The workaround is to defer object added signal, and manually call
`emit_interfaces_added/removed()`, see example in
https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/85c356f76fe07db3c1253c48f5b35c5811a15c07/activation.hpp#L137-L174

That looks *ugly*.

# The RFC fix

It is possible to let sdbusplus::server::object::object<> do the
`emit_interfaces_added/removed()` work, then the user will only pass an extra
parameter to object's constructor, that's it.

The changes to sdbusplus is pushed to
https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/25486

With that change, in the above example, simply change the line

    block = std::make_unique<MyInterface>(bus, objPath);

to

    block = std::make_unique<MyInterface>(bus, objPath,
MyInterface::action::EMIT_INTERFACE_ADDED);

Then everything works expected.

So could you kindly review the sdbusplus patch, and provide comments?
Thanks!
