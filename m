Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A6D609900
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 06:03:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwhJN3RTqz30F7
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 15:03:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VgBDkG+e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VgBDkG+e;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwhHm52H4z309f
	for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2022 15:02:59 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id bk15so14165035wrb.13
        for <openbmc@lists.ozlabs.org>; Sun, 23 Oct 2022 21:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2j61OUy8jOg8fi8avFHj4NE7WL9sGmY5rYHlcvZBOis=;
        b=VgBDkG+eIGYTpmKSo8qnjcQCcTZsm/wBOn0Md/Yr4kCW5aUUTHFG5sIIf/fGQ+5ipT
         vx3OYksMcQ+0vuW72QZj2kTjOC7eG2QoZclsrAC/eusj6oLaSpFcKAQar2pFz1g6RqLY
         HK43R+JZZkuRpdiUJtylgbiN31F5X7ptb8roM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2j61OUy8jOg8fi8avFHj4NE7WL9sGmY5rYHlcvZBOis=;
        b=ysDCG50j/qvERTPjdB3qirxMxSiAV1vpVUr42MhaNbEXFvwVVCjQHel5JWxUdbrLTb
         Y3mu1ceDPSqUz5mt0k2madYswa+SvN1Zf34FtF9A6rco3caIa/HbyX7bveNS4EZPh+1c
         liOglZK7SEvOy2CsH+HX/FZp2JxqgROq9Hkds3eKhpdLR5TqjMbr9b57rLyLhV5zeL0z
         f01V1bQUYWAAkff6kUEh8CaRJs5Mgc2nLX0c4kTUHOSi1GZ0lae9YW7RCc7O4Vm+qoOU
         RFwu1pvEm4xQCxWLyiNGh6prE7ywGYGMpntYiCUeZ9xeNIy0lBKzAYQYXJgI0vLwIDvg
         7mUQ==
X-Gm-Message-State: ACrzQf1rw03SfsO+6qX856me/ekazpFyVeMoPwIOftfE19DpvVOskEpn
	z9q8Mb9bD4xqd5NKiio3XdBQX66xzJUYt9bynxGSeG768mM=
X-Google-Smtp-Source: AMsMyM6q21okDOmrksSDsSv0ZnICHuekEt1XXI8Ra+q3S3m4nBeppJ5UN44uIxn8UG+KPXQpTv/OejicHOcPxR92Fok=
X-Received: by 2002:adf:df83:0:b0:236:6d5d:ff8b with SMTP id
 z3-20020adfdf83000000b002366d5dff8bmr3211889wrl.315.1666584171703; Sun, 23
 Oct 2022 21:02:51 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Oct 2022 04:02:40 +0000
Message-ID: <CACPK8Xd1mvUqk+=dP6UfQdNECBLXMfX=5-M_TCKW+mKMOh3MXA@mail.gmail.com>
Subject: ast2600 i2c irq error
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

With the 6.0 kernel I saw this on hardware:

[  205.644781] aspeed-i2c-bus 1e78a800.i2c-bus: irq handled != irq.
expected 0x00000021, but was 0x00000020
[  205.669842] aspeed-i2c-bus 1e78a800.i2c-bus: irq handled != irq.
expected 0x00000021, but was 0x00000020
[  205.694814] aspeed-i2c-bus 1e78a800.i2c-bus: irq handled != irq.
expected 0x00000021, but was 0x00000020
[  205.719805] aspeed-i2c-bus 1e78a800.i2c-bus: irq handled != irq.
expected 0x00000021, but was 0x00000020

$ bitfield G6I2CD10 0x00000021
decoding as AST2600 I2C interrupt status register
0x00000021 [33]
Slave Address Received Pending: 0x0
   Slave mode inactive timeout: 0x0
          SDA data-low timeout: 0x0
              Bus recover done: 0x0
            SMBus device alert: 0x0
                      Reserved: 0x0
                      Reserved: 0x0
                      Reserved: 0x0
                      Reserved: 0x0
  Slave address received match: 0x0
         SCL clock-low timeout: 0x0
           Abnormal start/stop: 0x1
                   Normal stop: 0x0
       Master arbitration loss: 0x0
                  Receive done: 0x0
       Transmit done with NACK: 0x0
        Transmit done with ACK: 0x1

I think it was happening at host boot time:

Oct 21 03:03:20 ever9bmc kernel: aspeed-i2c-bus 1e78a800.i2c-bus: irq
handled != irq. expected 0x00000021, but was 0x00000020
Oct 21 03:03:20 ever9bmc platform-fru-detect[587]: Failed to read
block data from device 0x6a on /dev/i2c-40: Protocol error
Oct 21 03:03:20 ever9bmc platform-fru-detect[587]: Unhandled error
condition in notifier callback, disabling sink: 71

There were no i2c patches in dev-5.15. Since v5.15, the following
patches have gone in:

$ git log --oneline v5.15..dev-6.0 -- drivers/i2c/busses/i2c-aspeed.c
drivers/irqchip/irq-aspeed-i2c-ic.c
5bd733a9928e i2c: aspeed: Assert NAK when slave is busy
ea1558ce149d i2c: move drivers from strlcpy to strscpy
50f0f26e7c86 irqchip/aspeed-i2c-ic: Fix irq_of_parse_and_map() return value
653becec6d56 i2c: aspeed: Remove unused includes

The only one of these that had signficiant changes is
https://github.com/torvalds/linux/commit/5bd733a9928e.
