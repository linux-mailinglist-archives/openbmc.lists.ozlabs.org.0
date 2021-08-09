Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4263E3F27
	for <lists+openbmc@lfdr.de>; Mon,  9 Aug 2021 06:56:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GjkNN6MCkz30CK
	for <lists+openbmc@lfdr.de>; Mon,  9 Aug 2021 14:57:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=agF8HiU+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2e;
 helo=mail-vs1-xe2e.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=agF8HiU+; dkim-atps=neutral
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GjkN11CWCz2ydJ
 for <openbmc@lists.ozlabs.org>; Mon,  9 Aug 2021 14:57:20 +1000 (AEST)
Received: by mail-vs1-xe2e.google.com with SMTP id a1so9289900vsd.12
 for <openbmc@lists.ozlabs.org>; Sun, 08 Aug 2021 21:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4SEQx+WDJ9A/y+dYuJxHfALBLw0lDSAhO94c7OnN/5E=;
 b=agF8HiU+UeaPOjdh8/cr/3qmx1v2yL1on6zl7j4U09T/AtjdBJ2h0XJOl/xUJ8IDR9
 h6I0UkurhKevhv9+G837qSXEwUDrdv/tO9YWyfbACIYWs2v3zsrnih6s9NxCiY7ogdKD
 VlNNsFjD3pqbjFfHMbMDLd+d5kdhCwU1U29mOzrkK2Sy2vmeSUOy7lF1URmyjaz0p7oz
 pNgv+R1AxxXluKr/pi0bt6AqdPeSJRZwFaAQ5imoMlv5oskZQkBfd+6wSizCSq7cOheW
 itB7Rz2PYC1pyxxjuzUXN9Y93Ldi9hpM4KsxEX+IndhbJHM5sba9sdLs/xlxCqk+dTtP
 Sr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4SEQx+WDJ9A/y+dYuJxHfALBLw0lDSAhO94c7OnN/5E=;
 b=nycYUY5ZBCTvVBWhFLMRrhakL+otCc2VzlN20zEvNMFiimm23+x1ozZw/5AZwUPW6W
 MVWnpwm7KGvCYoKg4/cH7XK8vQixvsk33gwBBdiKBwZPAhD8nPSrM8LuMGM6TukBKdO8
 hlyRja5dbhU/mIUJfHYPxPH2E8SqVXCQ1XOb1tvXkXUXqEwjDoi/55MJwX5sbjAoPrNO
 W4DbEMzcYP3YIHgIy7Db+UerOxiV8SrXdHnTuFqXjWQeKfBCi4PZGyRIrJu+DNAJXnqe
 fjHNEYJMeNsW7kTqnPklrziSFm6iSK1kDlEGzBsLBt3ZbgccuBf5MdZoZpNeN27LGA01
 jEFA==
X-Gm-Message-State: AOAM5331/48yTlWBL1LMcfnwIKu9UNulraoVhfFomDCPK9NmjJE8D2cL
 wAqUqymXhIFVwDgsNV40PtScYiTsehS10/l1sw2ePP93Daw=
X-Google-Smtp-Source: ABdhPJyD5Dq6onAg8WGvFAz7YtQckOPPmcDJwN5jwH5CC5U5Kjn7UrEpMSonZzQLoet67hh1khzWnZpZNkh1XGNv6cs=
X-Received: by 2002:a05:6102:2084:: with SMTP id
 h4mr6529554vsr.18.1628484967042; 
 Sun, 08 Aug 2021 21:56:07 -0700 (PDT)
MIME-Version: 1.0
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Mon, 9 Aug 2021 10:25:56 +0530
Message-ID: <CAM=TmwU57zhc_k7KAKc56wTf=mihD4uWxBd8qPS+-22ZKER94w@mail.gmail.com>
Subject: ast2600-evb qemu and usb-net
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, andrew@aj.id.au,
 joel@jms.id.au
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

Hi All,

I am trying to launch the ast2600-evb machine on QEMU by passing a a
usb-net device:
qemu-system-arm -machine ast2600-evb  -drive file=<bmc
image>,if=mtd,bus=0,unit=0,snapshot=on -nographic  -nic
user,hostname=qemu -device usb-net,netdev=net0 -netdev
socket,id=net0,listen=:1234

I downloaded the QEMU binary from
https://github.com/openbmc/docs/blob/master/development/dev-environment.md#download-and-start-qemu-session.
The intent is to have two such QEMU instances talking over emulated
usb-net (the other instance would do a connect on the netdev socket).
I get the following error when I run the command above:
qemu-system-arm: -device usb-net,netdev=net0: Warning: speed mismatch
trying to attach usb device "QEMU USB Network Interface" (full speed)
to bus "usb-bus.1", port "1" (high speed)

I'm guessing this is the lack of usb support/initialization in
hw/arm/aspeed* in the QEMU tree. Has anyone else tried this with
ast2600-evb?

Thanks,
Deepak
