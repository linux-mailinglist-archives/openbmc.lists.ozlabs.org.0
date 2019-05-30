Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A632E9E4
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 02:55:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dpz140y6zDqKb
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 10:55:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::130; helo=mail-it1-x130.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="m57En7Vp"; 
 dkim-atps=neutral
Received: from mail-it1-x130.google.com (mail-it1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DpyV10tbzDqGS
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 10:54:57 +1000 (AEST)
Received: by mail-it1-x130.google.com with SMTP id j204so1380610ite.4
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 17:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7WUIPfWEexXqVwRkDk86OoyQxPOI5vkBL9avUmnrrEo=;
 b=m57En7VpEOPfUTJmQ2pVdTSF9Bg797UMybX6tjARYr/c029q5eDb8ZKTlMDutWPCtS
 e9PujINvBLCeQQXU0Eo41fewWjtPwuqoM/eqNnb72WKLhtlOyXiKowH533i6EkJfhHcq
 8AagRLZRk8FclmSTMqCN/66B/T374dRLOSmKllXbtjNH5k+rwjwHMMaxI9Yu34x7n1hs
 BBE8A3H080PHQNMBGIpsmcl/pw1LHd0nWvGFkggYYkerOtS9U0IW3vauELRqn07KAojs
 gEpCxX4ZTS2ZLdpG6VDt/recxHRkJn/HeGpOYVjjtxPS6Jp4DGSfp5oO/mBxvabKt4uz
 Smag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7WUIPfWEexXqVwRkDk86OoyQxPOI5vkBL9avUmnrrEo=;
 b=YqZRfoHllofer+TIt+CESsntlZ2lt/3Fn7Dyk7MaumAINJ4Mui0/kNb816VOXqN8iC
 gmovr8qFhLZh9K+EXT2XzqZtO/apaG6vy7+onVTzZBpZaV2np5YbG/V2M2T1AOO6s8sL
 4F54c3PVbdOgcc4mSCyPx3b/U/w62dsCXpUAUs9JyiH/X5Cv3KE9wzHawT5GEBLmktXG
 V/V+BgtKnYe90W5b1XefYXENFG41B3wNNLWsTm+Bocz4tCypqaNyOoMXxTsl3Ic13FrU
 t4r5byy3RVq9IjtToIRPiY7Iqrr6GGcwzyHTgTyjyC7v/i6z03Gdj+nl/DD3OC0Qh2fX
 Z73A==
X-Gm-Message-State: APjAAAU8wjmZfyVMqrqqWz2P/pcH3sRz92S7qhNNHh0rZjCFWA9+/sud
 6yL0NMdaOSdEHN9/tpq/agDRsno14uAN764CPgbiwDVOpec=
X-Google-Smtp-Source: APXvYqw/ipRUBIq8qaDcfh+kK581GGTN8m9csa5EGdHMEWxskpwbDfnsMWWTZWavneY8ipHdGydhkF1nmsia3FJ9aCU=
X-Received: by 2002:a24:3014:: with SMTP id q20mr987760itq.4.1559177693811;
 Wed, 29 May 2019 17:54:53 -0700 (PDT)
MIME-Version: 1.0
From: Benjamin Fair <benjaminfair@google.com>
Date: Wed, 29 May 2019 17:54:17 -0700
Message-ID: <CADKL2t4950qyjasc+MDH6ET+ndswPvOsNwgtx30rVMV3jhA-0w@mail.gmail.com>
Subject: meta-lenovo subtree in openbmc repo
To: bradleyb@fuzziesquirrel.com
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

Hi Brad,

Now that the meta-lenovo repository has been created and contains
initial configuration, what's the process to add it as a subtree to
the main openbmc/openbmc repository?

Thanks,
Benjamin
