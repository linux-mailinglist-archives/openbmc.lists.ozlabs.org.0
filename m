Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42257EA292
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 18:29:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Fmy30wzzF4cP
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 04:29:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HTOR1Jit"; 
 dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473FVw5mvzzF3rv
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 04:16:56 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id e4so1917062pgs.1
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=eHh8KtCjdbDDT2lQyA5R6TN/QMZuD2hUU3FdMQn+ZSM=;
 b=HTOR1Jit9V2FYd67TEj4ylHQYbTKjOcqLtUFPUcs/VUU5a3IP3LoVKZU13GsQ5+z42
 VKk2/vOrazLkqL7Ab+t3ap5qJYPiDeLPepfhHGfxwmhV7Wcqkhn4yQ1WTf2GAf/q30Ep
 gf50AaH5PmskePF1aUfU4YwDqEVMrGBX1bOdABJSO0z+gSoislO57AhfyiyW3Ll77OUQ
 mBg4apG9K0Zy7suYHZBmKOnvfZGiK4MA/JYzABvc9RF/lKfabDOsMLfNM+U+6qwdS5kX
 KDhaM00GwA6D+m9HFWDGGORjlsChdtQt9PjkeIDMjod0JYoRUJPsjcfC9GEm7wHYZLV5
 cAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=eHh8KtCjdbDDT2lQyA5R6TN/QMZuD2hUU3FdMQn+ZSM=;
 b=SF6ZV0a5onqYXsNloJ0NgTWeAnQ7+6dpKA/XipoYUkAhMngGHfNKq0B/nLKMur/dwk
 RjOnJ0w/7U+18ofTl9hXr+2Sb4xlXZidvRzNHNpeZKptCfzPI38OfpPs1uC6WuJjEPea
 27LPVc+zh/kMZQgwMe5UA2AQlCRCv7Ez+Vw3cFjkYEdnStANzPI7V/NSM4cq82UZsvCK
 xkAypEhaak2nd04e1OhoiXKB32b15cCzSxY9UCsK1ZHCewwVenxTH+oGcTfXcLqjZI8Z
 Y1AQVyB9YilRypPWUu06Tqp6GquNrxVem+qsHVsmYEPogQm68bJg44AyBslCx86H1bVV
 RYEQ==
X-Gm-Message-State: APjAAAXcLYTjUEtdKKGr2yUspIi5wbry7wK9sovP4qD5zeCE1QDWoJW5
 2WThu5JUkAsmG/dFAxFYhRQucIwfy3L10AGjYBSbWw==
X-Google-Smtp-Source: APXvYqzukw9xg9T/+UtuGdimw55XwdUhMmLb6FpQCtR3W2qHvO2lHhgK460ILJ48W+Fm3YNIslOBUxjXeuWBJ01ljqQ=
X-Received: by 2002:a63:6f47:: with SMTP id k68mr572686pgc.92.1572455812484;
 Wed, 30 Oct 2019 10:16:52 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 30 Oct 2019 10:16:41 -0700
Message-ID: <CAO=notzWsPTty_3imuC2ChNWpEnkfGfpc0jZ_NMoL-sS3LnihQ@mail.gmail.com>
Subject: huntergate not included in intel-ipmi-oem
To: James Feist <james.feist@linux.intel.com>
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

James;

It looks ilke huntergate has a cmake file in intel-ipmi-oem but it's
not actually explicitly included.  Is this an oversight?  Or is it
implicitly included?

We ran into an issue with non-bitbake dependencies a while back
(leading to: https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24581)
and I wondered if this was needed here or if huntergate was just
present but not actually downloaded/built.

Cmake is not all magic, but maybe this is magic.

Patrick
