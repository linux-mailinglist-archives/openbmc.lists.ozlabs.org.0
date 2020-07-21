Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F620228C4B
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 00:57:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBDWv417xzDqcy
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 08:57:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fCLhj1FX; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBDWD0crTzDqPb
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 08:57:09 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id h28so256302edz.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2020 15:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=fQfOhJbr/hjpUmIkyW10JfG9CkXzO+ve9E6zpsgALhk=;
 b=fCLhj1FXpHtdFXgdjz8JpZW+P+uA7ROMa+l7o3mB50aV34emC+S48/6ZTP7hxUyGiZ
 IUyUbaRZP4tCEwTLxZ76o1aKxBUPTP+oa4mj006z4WYSJIe55FXfQOgC9aRXmPKSjyy5
 4t+e50Vc9j6W4NGPW9h6lsGpVFV3qyJoQuHsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fQfOhJbr/hjpUmIkyW10JfG9CkXzO+ve9E6zpsgALhk=;
 b=PkAw2uL9TIIjxixNf+hUaOcUkR/t+qOEMCy810qTBZqqr4CnTEonI5IaJffsZU6Rp/
 ujUZXZc4O8OWwDifbf0C1oAW8BWQYXw/Nc8tGvUi1KOptPUiSuvIVYpCHaCnNokMfhQN
 bQFFWM9Xj5ZA9xaNIhaiqapWnHn4CZHoqjZdelt/FNcneXsBdiaE/Yr7oraLLiUB46R7
 q7XJD4qaoxbnMlTLy7LpDPNrfyKWzGV5O2c4vs4JAjBrtXlh9RGVriDm7twHmgg7y1n3
 u+7h+MUFZ3rj8JQmXC5hYzWEO5+v6MUF/DTRDhvAfRwBIA2pec++yHrlWxBk4eG2NJdl
 3utw==
X-Gm-Message-State: AOAM533q11N4rM0JKkkWg53McFa1iXTdP4LFoX6VB3DThDl0uQ042Nkt
 Vurrc48BKMuNBIdVvg/Qg9HDUkQgdMeXMadv1zkcgrcRy4I=
X-Google-Smtp-Source: ABdhPJzSLMbkMvsZoz4WEtYmY90s8lOLXBXB4i47DAp8DJ0b7+scWGEmWosanqNO7kuHvNR7J7lRsaZpNzKPNU/HS6I=
X-Received: by 2002:a50:ee8a:: with SMTP id f10mr27522741edr.383.1595372223013; 
 Tue, 21 Jul 2020 15:57:03 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Jul 2020 22:56:50 +0000
Message-ID: <CACPK8XdZWCV9VAYdsQso4i-yf-T9wyyToPz3N2O0CBxnnB25tg@mail.gmail.com>
Subject: Kernel updated to Linux v5.7
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

The openbmc kernel has moved to a Linux v5.7 based tree for Aspeed machines.

Quoting the commit message:

 This updates the OpenBMC kernel tree to a 5.7 base. It has been three releases
 since the kernel was updated, making it over 9 months of development time. The
 stable releses up to v5.7.9 are integrated in this bump.

 There are 106 out of tree kernel patches carried in the OpenBMC tree.

Nuvoton is lagging as no one has reviewed the commit:

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/34465

Please base future patches on the dev-5.7 tree.

Cheers,

Joel
