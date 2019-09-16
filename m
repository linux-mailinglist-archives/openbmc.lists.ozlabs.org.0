Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41563B37D7
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 12:13:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X2Bl5MHjzDrg1
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 20:13:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="AjujogUn"; 
 dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X2BB1HkFzDqMW
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 20:13:05 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id i78so35671934qke.11
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 03:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=NmWRxk2vvHSyjFy6VdfkzaMtQ5NeJoJs6Th1fiUAnVg=;
 b=AjujogUn4vKEitd7E+19Iq3h59jJfs+bYHseqNJx4YD4iLqylCL2PNGMyTIYVuJ8dW
 kUGI+iBMVpnv8LqyF37/WdD3RIB1OYXr9UcIfQtFL7/mWXECAQEGhfZrn29QWKT03rrx
 xYYzkeTd/lpTbIllm1oyV+k3kpy38QL80KXpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NmWRxk2vvHSyjFy6VdfkzaMtQ5NeJoJs6Th1fiUAnVg=;
 b=O49XRtBfp/aqvXHLvWPBtojy9pvJ8wUeIHxre2KYv0xMl3/db01IEm6pkaL9es7Zej
 6SDSRU8XCWchrmckWTYkwBsUjhWDuofSedOaOPwVwLwn6cfprypa4tme8v9lz2syF5gy
 pw5B/QAz0WJYZnNwoiAJh3/z2lB5IhWCt39r7Mj2ff0LfEJMx/HTzdyoYIzg3wHSpbgn
 LMymTZurxh76u+0B2Q4nsE8iNIxJtJttzuFRUt8nPghKAKU+UYGIgXpTF1BXd2/FZvCz
 QVcojNjZHhH4fV4DOYsmhigz9MD80DSWkuahKKbpJhff2EidxhwLJcJMGCJ8LOoOJw88
 Rl6g==
X-Gm-Message-State: APjAAAXNmxajk3txLpoa1iR06cHo8M9WOfLFCBYVjmPXM8JeBHYC1yhg
 HSngRduFXTQ+MpVi1elrqK0lUaQwRwy0vdBnWXPV+fM1
X-Google-Smtp-Source: APXvYqwrGRhdfxvk8xiqrBqN+5VTcBLsfCWI0OoTFFKjumnfQQDRHJu6ssIge7UTOaD7/Yur2/d7TkUXZWBKeFdw0Sk=
X-Received: by 2002:a37:4a54:: with SMTP id x81mr60106326qka.292.1568628781742; 
 Mon, 16 Sep 2019 03:13:01 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Sep 2019 10:12:50 +0000
Message-ID: <CACPK8XcVoi7KmWaBz3KoEcv2mGJSmMGm2Rxu66jWU+BC8pOrqw@mail.gmail.com>
Subject: Moving kernel to Linux 5.3
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

With Linux v5.3 tagged today I've created an openbmc tree based on this release.

We have 120 patches in dev-5.3. Of these, 56 are backported from
upstream, leaving 64 out of tree patches. These out of tree patches
include long standing mtd and fan controller changes, the aging PECI
patch set, and a few Nuvoton drivers.

Most of the patches from dev-5.2 are carried over. One exception is
the aspeed i2c experiments, which I have asked Jae to post upstream
for review before we include them again.

This tree contains support for the ast2600 that was merged in 5.4.

I have tested on ast2400 (palmetto), ast2500 (romulus), ast2600
(palmetto), both hardware and qemu (aspeed-4.2 branch). Further
testing and a +1 of this review would be appreciated:

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/25213

Cheers,

Joel
