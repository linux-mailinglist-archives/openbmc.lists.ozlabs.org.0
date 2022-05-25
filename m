Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7845953347A
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 02:52:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7CFg22l6z3blp
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 10:52:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UrGeW9rl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=UrGeW9rl; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7CFD726Xz2yn2
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 10:51:43 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so2410632wms.3
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 17:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=RX0lwd53tx5JrjzJI5gh2bS5NfJF9yk8xLekvSgEPFs=;
 b=UrGeW9rl+EozytofHvqnkeFLWjn/4flEP+VGm+UMqQ5C9vwsJOjelRcGocAFMOMoaI
 J+ilUfZQY0pXJkAmiz+m7sIvcpQzPcSyIeZOp8sz23E2p4mgH7fps6vy9JtZN0JTjOP3
 vfqg76gtszGYw70cPswjkv+bSCUzvPYb9LQ20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=RX0lwd53tx5JrjzJI5gh2bS5NfJF9yk8xLekvSgEPFs=;
 b=SwD7Fa/zkiJWEYYLj/czKaKPcM0hky1t5RlotL8P2WIpth9ITxefO25hSn//N4F295
 Khzbu6nFLqFObVDPIurOOq5U7Jp/ViTXCfNWgpYOQFa8MvoJp46Dr/pVVXyHmYqcx50O
 F7bev9pjkWziAGJ8IUdjncz5XwZWH8+RSW7Lzsyn6brmrmIUDV6tGMR1FYRG7rOHK0tg
 HRZzHE9O7R3wHjjZtF8aZ+EPKbk0rcCb/Icsvvh6NCKM1xAiHQrBcoGRLqJZLBm/9k6g
 7mzH+DK00NVLXe1ZdnaG9ax/Yneib2AaB0whqmRSwfUXuif/ok2r/NzRHm4VoerFR4IO
 SJPA==
X-Gm-Message-State: AOAM532jAAYwsmg1dnGRouV7LVsVIRh9nxCiNZnE7rv6To+8Gi3BkcKf
 6lLfU+5vhnkDVslNq7URmJtUwpYXfHWBBk+LOO2X0yiREN4=
X-Google-Smtp-Source: ABdhPJzI+//lLTX5mloWb72AF+fniMTDj8KFM9ufXDlHFJi21lx64ZpBvi82MBjUw2JiBPMMCSkTrBFbs2ziJ+N/oAM=
X-Received: by 2002:a7b:c001:0:b0:394:87bc:ad70 with SMTP id
 c1-20020a7bc001000000b0039487bcad70mr5979545wmb.147.1653439897953; Tue, 24
 May 2022 17:51:37 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 May 2022 00:51:25 +0000
Message-ID: <CACPK8Xe2131fjX-uidz9bBo3Luy789Twjpz9pMiCnu-=f01Hig@mail.gmail.com>
Subject: eMMC ABR behavior
To: Ryan Chen <ryan_chen@aspeedtech.com>
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

Hello Ryan,

We are testing eMMC ABR by corrupting the u-boot image. When the eMMC
ABR mode kicks in, we then boot as expected from the boot1 image. We
then restore the working boot0 image, and reboot the system, which
still boots into boot1. In order to boot from boot0 again we must
power cycle the system.

I see two scenarios:

1. This is expected. The BMC software is expected to recognise that
the ABR mode switch has occurred, and based on policy, configure the
ABR to go back to boot0 or raise an error.

2. This is unexpected. The BMC should always try that boot0 image on
each boot, from both a software reset or a power on reset. We should
add code to the kernel watchdog driver to ensure the ABR mode is reset
before system reboots.

Cheers,

Joel
