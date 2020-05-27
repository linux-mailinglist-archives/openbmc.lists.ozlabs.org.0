Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 291431E363B
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 05:09:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wwlh2ZzmzDqLc
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 13:09:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=tC0JWZ/J; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WwkX6l8tzDqJ2
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 13:08:03 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id c11so24927450ljn.2
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 20:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=gYMNrmosZabcjCcTSPjeA5+s2epsCz+orSABs654C6Y=;
 b=tC0JWZ/Ji3Ky8XT07Uv3o7WlGwK0u53RtJRf+yIEiRZ+GfWRYTNcQq1rdaZ9ndxIXV
 x6mZQJEctvvYSqao2ZZOQlFH6ShC+oLSISxxkf2e13QOpcoHn/5vsi1CfggNX2nPJYbh
 UnVKi7mWvQC+HEEoMBDoCHsTVREkqzRYzAz8xuTOy+HFYORDEIzp7EakLZR8eqlbSa3x
 WN+6bt4ibhgw99b6+nQWSnZ3WeP1ZDsSqias8hxCIFqAeyhm4BBVMJ1r/NAwLWavjpWF
 QUvHdkUsM8TR68Z3myA4sVbEQArrOM8MaQfSjPaG2fzKHd+yeApIA7kEtA5Af/l+0yqz
 v04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gYMNrmosZabcjCcTSPjeA5+s2epsCz+orSABs654C6Y=;
 b=MJaBL7hxJuKaZKqEVF5Uyuhz1kvFmUJlaQKzh/yNI7h3T4clV2/gNJsHQ2J6MBXTy7
 vg0nLCh9QobQDTxT6s2VaJ+BKJnMVN7eNgypEOnBjRfaF3TyZ0tlkSSYKSAW4bUH0gBA
 NpTDDztI7Np2/Chfp7HPvr00RmGbtuXGdvkOeTQBoL9MlWouruGVRLqJ7K0HXobUWhVo
 G85PUhU7YSpd1orH+ITYeMNFfHsxMmMw9UNkaaUj6BWQtLMAozGZp9KQ15h1HoXqtkKL
 Z7By8ktQfXHbHgIqh03vleBKQFBaC6At21xKvoc+v3cKhV4OcwibT74GOxxkHSLKx8Vh
 aRMw==
X-Gm-Message-State: AOAM532KgW2fTs4a3IpwH6MfdFJiR2cNKgIoifjKJBF67cshNZJQ1WuY
 n4MTvI5x228Y9BA+LWDJLRfFLSD/3lYM4CPBV3+Zvr1ZgVGqdg==
X-Google-Smtp-Source: ABdhPJx+YD1ZN36+NhffoCyxErwjidW/DgEzrOzN+ttj9oVxDj9EWn4m0lLXNx+1VebwQe9jIHIXlGDHYkkn5xGjcPk=
X-Received: by 2002:a2e:3609:: with SMTP id d9mr1794178lja.409.1590548878711; 
 Tue, 26 May 2020 20:07:58 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Wed, 27 May 2020 11:07:45 +0800
Message-ID: <CAGm54UEDRmEQVQ-WaRiUa+fpxL0UUe-OZ4rwRZHVLTUJBZZb=A@mail.gmail.com>
Subject: Adding usb-ctrl from intel-bmc into phosphor-misc
To: openbmc@lists.ozlabs.org
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

There is a script [usb-ctrl][1] hosted in intel-bmc.
It supports the VirtualMedia feature by insert/eject files to the host
as a USB mass-storage device.
Comparing to the existing [state_hook][2] in jsnbd, it supports
multiple UDCs, so it supports mount multiple files.

In addition, I have some updates on the usb-ctrl script to make it
support the USB ECM device, which creates a USB ethernet device
between BMC and the host.

So my proposal is to add the `usb-ctrl` script into the phosphor-misc
repo so that it gets reviewed and could be used by upstream.

Any ideas?

[1]: https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-core/fw-update/files/usb-ctrl
[2]: https://github.com/openbmc/openbmc/blob/master/meta-phosphor/aspeed-layer/recipes-connectivity/jsnbd/jsnbd/state_hook

-- 
BRs,
Lei YU
