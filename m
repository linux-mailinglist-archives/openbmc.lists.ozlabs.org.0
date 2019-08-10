Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F088BC9
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 16:54:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465QBP52mNzDr99
	for <lists+openbmc@lfdr.de>; Sun, 11 Aug 2019 00:54:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oUIY1+os"; 
 dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465Q9c5RhrzDqv3
 for <openbmc@lists.ozlabs.org>; Sun, 11 Aug 2019 00:54:10 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id 196so382055pfz.8
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=y57K0dtTDcHLPN9VzxGYyZTrs8gmLGx/XhuFD6XdXy8=;
 b=oUIY1+os6RC+I3UPpBxLlnTOn62pijGo0kDHA7TlhnfwusfZcoMx9cofU7EEqGVWNy
 YOjeqa359qRHWSBjv1di9s8yYi5mg6XQ1fTZlwlR/+eS1UDfIYO34k42+MXzlZX3lXWc
 yMtvxwX0ltUo0yV+vS0ddxZZ0i0I1gpI9oeATaptIbr2/WQG7YTr6wYLSKTa84QPMWG+
 fjC0gHQDG+xM/5I0V0A6AaCXH5GJxBg4WMAvpYw0/NqT8FhkQNYaAVS+q7c1RrkMX1ea
 ePKyCQZNdklZwfo301nhmgsih4oaIsuHJt60+xgkPE0374NejMyazzmbGW7bh5+ZF3US
 egOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=y57K0dtTDcHLPN9VzxGYyZTrs8gmLGx/XhuFD6XdXy8=;
 b=m3WhPtgv4+IZGBB5bC/Nis+eSZ0tDQxzgMOgVkpekEsZczdrcyMeZ0qUsPkBV5qlEk
 SjWgWIBHelVQi+v4MR6tt+zxfZMTEOGHPnAVevAT/tDv+ivAUWlqmN634+wacq0bDN3M
 QyHEZcDwum8NyJVU4U/+KyfEG5kHS2sg+ChhXA+BE0dxYzI9fPpR7byCEDq1ESWpsno2
 EUbuFc8t4LZSpeEP/7Zq6R+gF4sPGFrzhxR6M3PPbegf8D3j5o2OSrBJyDT85iZKPjd/
 RYvHxe8mB8yFUX9oWJvmd8+2iNZzzwLbLW0SsSqjXFQ6Th8YqFvDWwk8Ch9qYOcF6E8R
 yR6A==
X-Gm-Message-State: APjAAAV0AJtXJE5O8i9NC9hbykaSxvkjT1+j9rQD4fXxRCL912WVeuaV
 awByTBcIkUe8GQXGFPUdipkYKqw9pFgtuWg7MnhnSw==
X-Google-Smtp-Source: APXvYqxpOe0KNdb8AXU5KlO4Wg2MoujqQiLtPonT44Q7AgGCfZanFtOxlswJZystxsZJdiUErTeXkFR/DpA7X13xikA=
X-Received: by 2002:a17:90a:2228:: with SMTP id
 c37mr15160167pje.9.1565448846230; 
 Sat, 10 Aug 2019 07:54:06 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Sat, 10 Aug 2019 07:53:55 -0700
Message-ID: <CAO=notw5RG7f2QxiccqE9xrKY2ERxYG-Lba_uJc8N5E=wu6TVQ@mail.gmail.com>
Subject: adding notion of "hints" to FruDevice
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

One difficulty we've run into is the 16-bit address detection can be
flaky.  It's not known yet whether there's some underlying i2c issue
on the board or with the i2c driver that could be leading to the
flakiness, but to get around it I've been forced to add hints to
FruDevice locally.  Effectively, it's a lookup that says, if this is
the bus and address, it's 16-bit.  Sort of a way to say, if something
is in the PE slot (which we know the buses for) then we know it's
16-bit.  It's just an idea of been playing with to get a couple things
working, and I was curious if the notion had larger appeal?

the production-ized idea would be, optional hint json configuration
that does a priority search:
devices
addresses
buses

So it'd search if there was a device match, then search for an address
match, then a bus match, otherwise fall back without a hint to the
dynamic attempt.

It's certainly not a perfect solution.  It requires the system
programmer to enforce that certain cards are only placed in certain
slots -- but it is _optional_...

Patrick
