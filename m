Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0537C29FBC1
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 03:51:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMmyz1lzjzDqjT
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 13:51:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=isQLUZv2; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMmxH2v15zDqhY
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 13:49:37 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id l2so3775157qkf.0
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 19:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=pwYwVRUnP8K3avYNvJ7nnvGpkawmOcEFIaoMhu3E2I4=;
 b=isQLUZv2dVHDhF34a+Pyfd8BKQu6cguoqpSYAG4k/P39PrsAMl9mqlmMvR5LT5a+9z
 qqqvR+bvOnLStDq/oLjC20IIihTkHzruz8HAvFR49EbXmX2eCi9zKiH0JHqjhpliz1gq
 ziUHR1qxHAMIVpnUFQnpfBclhgO6i296tBoeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pwYwVRUnP8K3avYNvJ7nnvGpkawmOcEFIaoMhu3E2I4=;
 b=sXz5bymgWVXTRxijOh7fQVnYc+dpOTIhlIt7Isti0Hq5ETN8zCuBWvlmbQuX/CYYLs
 pdogW01Yc+lUc3gpiQ2UzyXklt6GkHCqZJHd6r55oFlzwlLa/tAkJJSkWo5I8jdL06s+
 MuduapZkrscIh1mhkxZcycknUZdqq62MSlp50vajIlU1E8Qm7G5bzjQtZYS3kKinCLZw
 kDrhaWhFG1jiezn/Mnffi4saXoRTAs5/cNEuNvEFleXVSbTFpaPK4das6jfakARA/fMS
 CyL8vFk8PQVkO+h3lvD2cSJJJozhDFv9ajXE2pprhQbDs65QgxJybPi6vxL2kAFz6Nqp
 /BSQ==
X-Gm-Message-State: AOAM531O3+FE6NNb18UlY5fhlEE9UrZ61NvK9lSdRQWh4i9v/0QsMZDj
 6kVwqCAqTYlR6KVo0rNCVVa+yDd6Y22iW/++Mlg=
X-Google-Smtp-Source: ABdhPJw6eWdvlTMjbDyIhCCPU3ZgU/ehDdUdPSGC9/QoHs8olsJqrxvW2qdDJh07TP37uODRzJ3imKyXttgW4TjEZQ8=
X-Received: by 2002:a05:620a:16aa:: with SMTP id
 s10mr236280qkj.273.1604026173033; 
 Thu, 29 Oct 2020 19:49:33 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 30 Oct 2020 02:49:20 +0000
Message-ID: <CACPK8XdR_Qb1Na5j7tN2ej6qZrLHNzU5dXP-XEYEH+Z7V4NADw@mail.gmail.com>
Subject: fsi2spi bindings
To: Eddie James <eajames@linux.ibm.com>
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

Hey Eddie,

The upstream version of your FSI SPI patches have landed the dev-5.8.
It looks like you changed the way you did the restricted property in
those.

Can you make sure the dt-bindings are in sync with this, and any
downstream device trees are also updated?

Cheers,

Joel
