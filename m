Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B467647CDD3
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 09:05:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJm8T4xFLz2yng
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 19:05:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JCtflhfE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JCtflhfE; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJm850qm4z2xF1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 19:04:50 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id r139so689051qke.9
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 00:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=MQf8tEabPx1DQCw5VxDJstmIG+XzfaoAzKCAWMSnwQs=;
 b=JCtflhfEHJiWRR0D2QHsB9fsFlgrpqUCt8Y+QOyqh91iNO3mtFqFJMzuOWMSYbWUkf
 boc+cMeoXIwDl6BnBMGJIimdvrAWUe+SDPbubbZie/M+oOgyAosKalH738H4bwrHdfyN
 tBYCUm3pjdD+4XhPTfYhOfgEHbKnQEoZT5bYx4IDn0m8NNHfhY05EU6C9ScBjdwM9nXn
 tvzd70qc8sFYKlrhC4FCTWbkfRPJsS/HSmQoHbia5ccFod5hfk3STGptb3/jOe8fhE0G
 CDen8h7qfPt9NvrBnpUhV3yQLBy4pYW5oA6bwIKKT7bpM3NlNKlBnZKobZJM009+Jn6+
 5ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MQf8tEabPx1DQCw5VxDJstmIG+XzfaoAzKCAWMSnwQs=;
 b=MNXa0mO6gzv87uQXKD2Z8W8gIDcwpHwUs1EMqPfxvBSD6RgH9Rtnzvr+ijJ2Lz4RB1
 Gr8+7pcWUoI0vQZBye4yQtXXQCoio2xH3mq42YegDjG6mrlmoSYfujIef+oIvdxxmsv7
 gVIJN9jpeqPzFKRFDJW2gBqTzghwQaZHgzE4CtZqeUJvqCDTRDY66LWtAqPVq7AQfcM8
 IVWg3OasdX7CPENGGR+jYzMl0ip14ziH/gh4s8iERDnHz1eNY0Qlpd6M03weXoTeD0Dy
 2dVsANnLV2X5FZRSBEbNxbqDdOViQDsdazdy1P6+BoigSYmqEI+Ju3HHuN5HakxVTZp0
 ztBw==
X-Gm-Message-State: AOAM532T05wH2RttamGs7tC2UFuKJdtUZeboVXTv3jX6LYHHO/i7cO+1
 MB9MQfa+iLz/Jg3klX9Ygy7XYY53bGkE0lnJq1p6FobsYlk=
X-Google-Smtp-Source: ABdhPJyTVBx9vh5UoNxpbNDSD1BmYBifP2FOn97z10UeyJ2xuFI+wH1utHU0ZqJR3PbAFAKbO+38tLY4nqu7blFnbtw=
X-Received: by 2002:a05:620a:4003:: with SMTP id
 h3mr1244039qko.153.1640160286012; 
 Wed, 22 Dec 2021 00:04:46 -0800 (PST)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Wed, 22 Dec 2021 16:04:34 +0800
Message-ID: <CANFuQ7AkTrtrogMj4YeAe0SWQFjG1Cd9WqFAktbvsOHmtd-Qpw@mail.gmail.com>
Subject: Solve the problem of bad CRC when using u-boot-aspeed-sdk
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

Hi, everyone:

The 64M flash used by Inspur's fp5280g2 machine has recently found
that it cannot be saved when setting the u-boot environment variable,
and then a warning message appears when rebooting:

```
Loading Environment from SPI Flash... SF: Detected mx66l51235l with
page size 256 Bytes, erase size 64 KiB, total 64 MiB
*** Warning-bad CRC, using default environment
```

Since fp5280g2 includes `openbmc-flash-layout-64.dtsi`, the initial problem is:
1. The value of CONFIG_ENV_SIZE and CONFIG_ENV_OFFSET[1] of u-boot is
inconsistent with the size of u-boot env of Kernel's
openbmc-flash-layout-64.dtsi[2].
2. The `Env. size` of the fw_env_ast2600_nor.config[3] file also needs
to be updated

After modifying the above problem and test by:
1. Use `setenv` to add a new environment variable in u-boot and reboot
BMC, and then use `fw_printenv` to see this value synchronously.
2. Use `fw_setenv` to add a new environment variable in BMC and reboot
BMC into u-boot, and then use `printenv` to see this value
synchronously.

We pushed a new patch to meta-inspur and it worked fine.
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49916

[1]: https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/configs/evb-ast2500_defconfig#L5-L6
[2]: https://github.com/openbmc/linux/blob/dev-5.15/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi#L16-L19
[3]: https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/files/fw_env_ast2600_nor.config#L2
