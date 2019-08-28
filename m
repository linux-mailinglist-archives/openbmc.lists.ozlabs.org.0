Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF4A0532
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 16:41:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JT2226wXzDrBx
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 00:40:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E8Wg7HOw"; 
 dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JSkM66qrzDr7Z
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 00:27:22 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id 196so1837990pfz.8
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mnLh2/5Dk+RZm39CB5jqi27FL3CpLQ7ZI7mv84X5qSs=;
 b=E8Wg7HOwj6YINF6CJgkAX+bEJIP9IPk9we7RTbIdUG27KuaztGy5cpDDdUg4FU9N74
 pyhC0LSYYv/4nVoPEHv6UqZPRollfVtI92sAVTioSd03ojMDgCgEXlJHUSuZrQRBcJ2L
 VsQVZ25OJBqgvRZMmGP/V07sn+kd6wALNYBEbap1bPWjuBrZFGq8ioOgm+qgmUezvYfH
 JZit2jAOQFIqiGN2OPcOE07abHLwG3rhrw4SG1NC7RCCqh1NgylnybE2KYcCM9t9c4zF
 Ewoa392qqvZzicE+jI+N1YfMH++JCjCONkQRj/JLEfpLZXLMINJq/DKiZFwNM7ruXTPC
 fnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mnLh2/5Dk+RZm39CB5jqi27FL3CpLQ7ZI7mv84X5qSs=;
 b=BNk9++eDdjx3QPW8E/sr1BchG4Wrbi/eoOPnL0l+0SfKhmG5OHO4QXMYwSyyCBzSYy
 qxM54Qzh3zKTu9OzV9xj0xoGPVbeEr7TjDgxgqvCXPoMdfLh7yuPWvo3kR7hTR9lCJ0N
 u0pWuC1xlzazZt6TH+7MEg7kVQLpFe2wvK8iSzyWm24OaMbg8TVJX0XtQkHylx7RiYqk
 Rp9exfjVANXLgEwqQQHazTxYLkuExuM3pszgDbxCRhbs468w2WVWMlSjDkxLut1fcI7R
 XD5klTcL5sVKSFn9X8c+YigfiFZkv/O3gDT48Xi3ptkyNY1XqWNZPK5SJbYbjpVcCys2
 tgPw==
X-Gm-Message-State: APjAAAVkny0IKCTL8CR5iQTWSbcO2yWRAD1VflXxNETmdb90OKeaQ6iY
 hNDMq3wjyzHoBgG6cmu2lpBT9KVqTg7zrpg74inTAA==
X-Google-Smtp-Source: APXvYqwQ6n/0AockkfiSJouTdjScwyzQ1ZLRRAs+bUejRo1mKhhiwOT3odsfr1mFOqioNfeGx1MvNaB30vENeebfbco=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr1393277pgf.353.1567002437500; 
 Wed, 28 Aug 2019 07:27:17 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Aug 2019 07:27:06 -0700
Message-ID: <CAO=notzA5GNeAbNxvrDs3gwORnjx36d5oPa5R=D-oajCxBC2Ow@mail.gmail.com>
Subject: Entity-Manager's Configuration Generation leaves address as string
To: James Feist <james.feist@linux.intel.com>,
 Peter Lundgren <peterlundgren@google.com>, Kun Yi <kunyi@google.com>
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

I think I've figured out what's happening.

If a configuration has no fields that are changed by the template code
(or possibly even in that case), nothing happens to the values.  So,
the property Address is left "0x54" if that's what it is.  And the
code is templated, so it just adds that property of type string to the
dbus sensor configuration.  As this is definitely what I'm seeing.
Json doesn't support ints that are written raw as hex, so wrapping
them as strings is what's required to make the json parse.  I've
worked around this problem by just using decimal everywhere, but
that's harder to read when comparing to schematics.

Would it make sense to make the add property code less field agnostic
so that if the field is Address and the Interface for
configuration.XXX that it checks to see if it's a hex string?  Or,
maybe the templateChar replace -- if that supports converting the hex
string to a raw integer value type should always get hit?

Thanks,
Patrick
