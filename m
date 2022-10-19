Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AF36038AE
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 05:41:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Msc2m2l86z3c69
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 14:41:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jJ43N8Vs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jJ43N8Vs;
	dkim-atps=neutral
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Msc2B5Y00z2yQl
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 14:40:32 +1100 (AEDT)
Received: by mail-vs1-xe2a.google.com with SMTP id 1so12348923vsx.1
        for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 20:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tqXNCBvN/ISC6rrBtpQ3jEs3jO7zrc2uZ2CYn5WAuoE=;
        b=jJ43N8VsGHA+3YCHD7zkJZ0xPdjPTOi2jvlQhAEKKCjWuCdh8B44AlXjcN38id9VZ2
         yonqrWtmspWP7uU9Dg26cy56B9cD/Ayvcv7Li4B71sw20EBsHpcWl8GhrApW7Y7GfgXp
         w9nCwOd9CxoHQB7ZKRg1qtgO5NiSx9d0Mw5Drq/mDyYXW/BRx2xgdGq6ED+kJzGcmJJv
         MtNfI4LTe2pX38T3dwSMIxMFMryX/iIXTy1gVxJvXm+YbRmphbdVEQh+WP/sjDoH/dwu
         KeIQGzciyywVh54W57FrkEvURFcE7SD/tdOHWjP++LBiIVBZKOoKqu2vbD4TrTjxunTH
         01Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tqXNCBvN/ISC6rrBtpQ3jEs3jO7zrc2uZ2CYn5WAuoE=;
        b=u6PGkkpOMVbXZENb1ReyYensOkMBsh+G5DXebNYWBXscLvTUVdt1ybzkOOIN3+/haK
         5y4hSeQQvyxJr4i4/Ky4vv23gvQsySBmCRNGnrClhl0AOFAOOalNM03gZf8xnYpJj7bQ
         ik2oF1qBy+H2uVosGAFsDZh6lirvFTJwvLK92/+xIujQMzL3K0uS8IHEw2EV2ScdGjzo
         mC8zKAsznd+Jw2lw5Tn3MpuKbzhy+n+SRosNQc8zy7dV7Ssv4e7YoSypt8YVvK4UXoVL
         BFXME6VuULCh6J5GXtB8z5M+VMESpdfwF8LM6agSaVOC+r3X4mGJnKbL5uSkAvWu2bL5
         hGZQ==
X-Gm-Message-State: ACrzQf33lVd0E2/pKxz7N5t4DetIY/XD9TP806NAAkjjJqaOJT2mZ3qO
	OZyKKTwncFgkujzdg5OMBYLCfSktTcGN34Yx/oV6+qP7icxgngfMu4Q=
X-Google-Smtp-Source: AMsMyM6rLMcXkefYnAdZB6dx4XU+nYLKJ59cwRzyvGbReYwcSf7qrix6um7yxiqw+oB43v8mlZ4XqiNRgf2Od0Qhtmw=
X-Received: by 2002:a05:6102:22f8:b0:3a7:c4a6:e626 with SMTP id
 b24-20020a05610222f800b003a7c4a6e626mr2906138vsh.35.1666150828450; Tue, 18
 Oct 2022 20:40:28 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 19 Oct 2022 11:40:17 +0800
Message-ID: <CAGm54UF_XeQivcVozvjMjWbc4J68E+PJSbyVRFdScoyfKh9oEQ@mail.gmail.com>
Subject: Blocking call in phosphor-networkd
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

During network testing, we identified an issue in phosphor-networkd
that the service is blocked for a few seconds in refreshObjects().

In future investigation, the blocking happens in
`getHostNameFromSystem()` that tries to get the hostname from
`systemd-hostnamed` service.
`systemd-hostnamed` is a service that will exit on idle (30s), and
start on request.
So as long as the `systemd-hostnamed` service is inactive, the call in
`getHostNameFromSystem()` will be blocked, waiting for
`systemd-hostnamed` to be started and the hostname is returned. It
takes more than 1s on AST2500 if the BMC is idle, and took more if the
BMC is busy.
When it is blocked, the services making DBus calls to networkd will be
blocked as well, this typically happens when BMC in DHCP refreshes
it's IP address and we notice that ipmid is blocked during this
period.

How about changing the code to read the `/etc/hostname` file directly?
It is much faster than making DBus call to `systemd-hostnamed`.

An alternative is to make async calls, but phosphor-networkd is
written in "sync" way so it may require more effort to change it
async.

Comments are welcome.

-- 
BRs,
Lei YU
