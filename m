Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980CB48A78F
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 07:04:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY0WL2wv7z30DX
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 17:03:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gxBRXLSd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gxBRXLSd; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY0Vw6kp8z2x9L
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 17:03:34 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id s1so30926774wra.6
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 22:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=CgucNPxZhxvHaYYIfkPesl+UVU0SP9r+5F46ucH+M5I=;
 b=gxBRXLSdHNsC78oA4NqO79a7luzjgxN6d9gDuqz7sI3pekfIpYNk6Q+bH1VmRfhhNn
 rgQSI7Ktyg4tPFRSLRiyyNjbwnD8hpZrT4wt/vc5s2b1BRLuksGpplzhzAL+L0TJkZof
 TplgdP8sqYgao/D4zD+bFzwTyMAEDe1w0YESrjyX1wrCA67KYJBJK+Fs9OnhXIc6BR5N
 iG7l/luViDod2stUhFwItpKGvmidiwNX74sh+/clAk3fF4MGe5+PWxfmhmKw5tZGtnIP
 rbt6HGYtbkqH4Eu+5zXak3cboTZ2Ek3wMcCNH4hXQRUQoKA+JMH6bRX7+GT1uNwK30uV
 ySTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CgucNPxZhxvHaYYIfkPesl+UVU0SP9r+5F46ucH+M5I=;
 b=FvcnTqsoOBUqMBQxQD3Xm/biHl3krBC0MLoLsPNo1PsRQ0h72bj3epY5bQdeXNeuuU
 ZmCcHK4Fu/zj4UdJ6dvnL/NvmWR7mvdSxoKv6s5AaDvdEGv0tDZCfQU8Sg3QuyWobsb8
 /xXFBc5a3BljZZkbugxdIu9CPFUacAdw34dqcIQugnZY8FATwIZUoS/cELbxgsMKB2FC
 xh/9s0I2KDuM/IdTxCLZflTFYwm/3FgejEAYomzvLG69Sx6OoTajxJxxrOq8ESHb1S3F
 144WvSmKYNdp5Sv4RFDMIr/0hJHmCKT0mgdVaAdRGMnsINK61XEnPrlc4OgFiOoM9Jyw
 JRxg==
X-Gm-Message-State: AOAM530Ajar7Su8rtOTQVjmAjxihp72T5DA36NUgSabI4TeUq2Wq4l2Y
 pDQ4/9/QrTgTstiEHUMrOWLoNY/ouRqyPGd3w/JxA8W1x64T1SXZ
X-Google-Smtp-Source: ABdhPJytkeAQn234lShAXBleQ1KOL6Tb82cR6Cqek5o2RAMbjlOnueFvzrwjETZSoxytBX55caZN6qDU9mYsaPawOfQ=
X-Received: by 2002:adf:eb87:: with SMTP id t7mr2416303wrn.147.1641881005188; 
 Mon, 10 Jan 2022 22:03:25 -0800 (PST)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 11 Jan 2022 14:03:13 +0800
Message-ID: <CAGm54UG8nesSRZyVN8MWE-HXgevOpvpzgGBFFY6kTNTGL0UDxA@mail.gmail.com>
Subject: BMC dual image support for static layout
To: openbmc <openbmc@lists.ozlabs.org>
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

The dual image support for static layout is implemented and submitted to gerrit:
https://gerrit.openbmc-project.xyz/q/topic:bmc-dual-image

The related doc is on gerrit as well:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/36407

The implementation basically adds:
1. A config option `bmc-static-dual-image` to define the
`BMC_STATIC_DUAL_IMAGE` macro.
2. The function to process the alt-bmc and create the related DBus objects.
3. The aspeed-specific code to tell which flash it is running.
4. A yaml interface is added to specify the code update target
5. The code-update support to flash the primary or secondary or both flashes.
6. The sync between two flashes.

Be noted that the images could be the same on the both flashes, so it
appends a salt to the version string to generate different version
IDs, and that change should impact the UBI layout.

@Adriana Kobylak please help to review the code and let's see how to
make it work for UBI/emmc case.

-- 
BRs,
Lei YU
