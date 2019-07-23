Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90209726A2
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:30:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tj7K2YghzDqJs
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:30:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Y9rAW03j"; 
 dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tVjh2p9FzDq9j
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 06:40:37 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id m30so19725056pff.8
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 13:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LMXwgv3IOr0nFG6O0+zMPK/bmUEufQAb7NHRZvLektk=;
 b=Y9rAW03jq7JzVDm4XlIr/BvjLIGoBiChGF7hIgTNSnkfhQE1m4JfRJGA7OhsfXQ1yv
 JLuOqH1YLYM+kC/iRjHzGEQcZ550XE2/w3hE5/CKObOG6bezCcaPjigqPbaJhjC6v1X7
 VgmLQ3nvg0+fgYRDQDeJBg2nxsdJKu/vTD3wrbmf5s1Ju1nfPWQxY+XT2lFt2Qs0L24B
 SSne1Mu/y3tlfXg0Mdq2uI0P3wkUdgxz7SnQ6Ghw2DGbEBh7x2io1DYBIe0oYV/H1mX4
 v6DASFfOZrI0/7UdXDYCvngIokLJjAJQd8Uwx3rDqx9yaecZSkCuXUAqdRwSzBae+lX5
 1duA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LMXwgv3IOr0nFG6O0+zMPK/bmUEufQAb7NHRZvLektk=;
 b=P6THufYG8YvaTbj4id6HlCWuymV1LIIj40/Gfe/h2lKrLtNW3LpSoKyVjmgmlFoKeS
 Qa9YQkLOqXwK8fq2CzxEict4eFTKqf1znW7eJCBMx/Z4e0QjNc+UYnZljpTFsZ30LQkK
 czGI7wi+n2x9G1yK1XmjhTS8EoZMU8kPnuuxnMw5LZ+ISH4QQcQIksZ2CZwlnLLLwNY/
 OBQLbInMiagSBX6bqges46KBLPkvIZqrzSXG3Y/7Byxlk1QkH3El5+ZjFDyAwqX+IV2U
 cuPHvmfF0X30WyitduMce3nL99OcUzO0KS8Bad865JR9/yOK0XFwdb5Yfr0C3THgJRs5
 NwKg==
X-Gm-Message-State: APjAAAWavpirMpGvJNA09xEuyAa6zgdv4OIWSzZOkhQEBiW5xmTom7WU
 kjPmryBiT/2NLPAVR0MWZXvE/REKY3Pvx2vUrDdhGxs/2Ok=
X-Google-Smtp-Source: APXvYqy1TPDvDT74AxhKaqcEy/z9D9ABs09vU/55IZ0Fpncga1M3ersxnouYw7P/w32egDQBl8zthg7dOdru1XEPOEw=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr77191924pgf.353.1563914431258; 
 Tue, 23 Jul 2019 13:40:31 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 23 Jul 2019 13:40:20 -0700
Message-ID: <CAO=notwC5_-wVBOONXrO9R0eoR0MDOjmt1ZAc_J9XJvvXd-G7g@mail.gmail.com>
Subject: phosphor-host-ipmid sensor SDRs on dbus
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, tomjoseph@in.ibm.com, 
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>, 
 James Feist <james.feist@linux.intel.com>, "Tanous, Ed" <ed.tanous@intel.com>, 
 Ofer Yehielli <ofery@google.com>, Kun Yi <kunyi@google.com>
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

I sent out an email indicating that we need to make sensors somewhat
dynamic in phosphor-host-ipmid, and either using json or dbus was a
reasonable approach.  I think json would be easier, but, for those
using entity-manager, perhaps having the SDR information supported in
some way associated with the dbus output might be useful.

Idea: Given a sensor, read the SDR from dbus.
Problem: association of a sensor id with a sensor on dbus -- maybe
some search step is run once that caches everything and listens for
change (similar to what James did with phosphor-pid-control)...

I'm just throwing out ideas without full design changes because I want
to get a sense of where the preferences lie before really digging into
what changes are required.

It would support both types (like dbus configuration in phosphor-pid-control).

Patrick
