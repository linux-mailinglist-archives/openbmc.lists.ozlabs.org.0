Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8926111A
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 14:10:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm3qx16TNzDqSF
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 22:10:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=knYbLpyR; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm3nS51RHzDqN9
 for <openbmc@lists.ozlabs.org>; Tue,  8 Sep 2020 22:07:56 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id w3so19679343ljo.5
 for <openbmc@lists.ozlabs.org>; Tue, 08 Sep 2020 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=InkcWcQgIvJZULYNN9+P8SKKsLB3tkJ7Hbaj+l9LqT4=;
 b=knYbLpyRfL2KRIjSvxjFlW5MMblG2qOaD7/xC++qfd1G2TN1dBV5q1CaDdiGBJ3ete
 HElRKYWj9Q4zM6t9jLb+jccoQaujgitmIoQlREse/LZmQoUuLOkCk84GdeD76hXC4l0o
 X60T7E+fl1TOnPExl697boGKZZBCrVj+CWsZItXCJjkWySdVh/CHmTW/D6pxMKbCUH89
 IcpZsnFURF976Gt5JDoijHRpNkApHW4poXZhtGrJf0prF6EJmUwFH0GwLZldu9Lf6+Mm
 QGj1VDHueDzx5FN2b666LMO1j8IcCJm0oPysMEik4uxpkQcYCRAH+mYrT05yXMnGVIac
 NcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=InkcWcQgIvJZULYNN9+P8SKKsLB3tkJ7Hbaj+l9LqT4=;
 b=LZyDjErg0bbMdZ4+60Qe12nsZUL/b58SpLdAN6YX3H40+uLpU8pe4KqIcWWlnmEJgD
 y9PKfHyc7n/NPNUE5VP+VF1whJxR4G9E3/YvPH553LFdsrapl230oZTaMrTdOQ6Rktcj
 QuxmBjemXgS4rUUXAFZjBBHk/XyTKBXRmnRQTy3UiJlDQFzEA9Q7LUIEmgLz6BYLltmB
 dRMB9UiVUibQ+8sGm+ZSipYNOC1LMWcb87cJ2+lAQNZSyWQwbrthCxWJYcvms9Q4KbNk
 5+sLshug1LHNOwvmBbOQYIccXvb9pwfUyWoHv00leEK1izyflCDBPK1nb95+Gla5HxUP
 e7HA==
X-Gm-Message-State: AOAM532odDageJHGV230osQgBe8pQm13u1N8PvmPEUBztInzxhWYsDkt
 XvxsWPk626LTTWrVVp/Etcwf8jSIvVtkVzdy/Smzn92UG2tZ26ax
X-Google-Smtp-Source: ABdhPJwX81EQgwYNQE0TmNTCTIzjWLTtDTM9Vr6UBl02HDJDWmfhgXcuAU3WMwZQoNrHQgLXvYOYRkGyEPanv9sKCkY=
X-Received: by 2002:a2e:9b09:: with SMTP id u9mr13426992lji.194.1599566870073; 
 Tue, 08 Sep 2020 05:07:50 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Tue, 8 Sep 2020 20:07:38 +0800
Message-ID: <CAGm54UGcLzLxucRpTZ+TUwNj_dtZ0YWTLwu1QA9owovNjL6xhg@mail.gmail.com>
Subject: An i2c issue found in intel-bmc/openbmc
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

This email is to introduce an issue related to i2c found on
intel-bmc/openbmc[1].

I am working on a machine that is based on intel-bmc/openbmc, and it
has a pca9555 GPIO expander on i2c-8.

The dts looks like below:

  &i2c8 {
    status = "okay";
    pca0:pca9555@24 {
      compatible = "nxp,pca9555";
      reg = <0x24>;
      #address-cells = <1>;
      #size-cells = <0>;
      gpio-controller;
      #gpio-cells = <2>;
    }
  }

If you have a similar setup, you may see the kernel gives below error:

    [    2.561952] pca953x 8-0024: failed writing register
    [    2.567061] pca953x: probe of 8-0024 failed with error -110

It turns out that the patch
0075-Refine-initialization-flow-in-I2C-driver.patch[2] caused the
issue. And if I revert the patch, the issue is gone.

A github issue is created at
https://github.com/Intel-BMC/openbmc/issues/48, hopefully Intel could
fix this issue :)

[1]: https://github.com/Intel-BMC/openbmc
[2]: https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0075-Refine-initialization-flow-in-I2C-driver.patch
