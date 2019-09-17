Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0025DB47B5
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 08:53:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XYjR2n7VzF145
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 16:53:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U6tF+OVF"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XYhl2X53zF46s
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 16:52:53 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id q10so5073219iop.2
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 23:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Uu9cmWbk/d2V5VEaCLuZcNBV0M0K5DIf+jMzwzRYd3A=;
 b=U6tF+OVFMbNl1vjuZvFsHKMiUR2f/f1LoUaU71NXtdRuWqtLXFaw5Mg+gm0XeWg3Gb
 7dg9pFtV5bLEHCpGb57c68bH6YNfmHYRcCKePrgbFU63zZQYw3qKp/2TIU0PLzP+n9C8
 6QygvG+0fx5kVTeRWVkzllR0U72V4M1H9/4m64JUAvRz2KLp7DDRMtbvAfbZDe7cFua1
 HkP3kgNn2uSHSksDU2obqUhAUodX57PtF1cJsKlaZt5kw4IfYq++oB0NZRUWKBhn28Or
 6sJyaP8QQbLQuhVvh2973TH8WQ3es2vLJUdBIvquYT+HqQowdlaDLrX9fJC2qy0yiT5K
 LMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Uu9cmWbk/d2V5VEaCLuZcNBV0M0K5DIf+jMzwzRYd3A=;
 b=WLn5hhud6jBb8447831AV0rh1fSM3XHZ2RCs1SynRehUIYVigLq3za+r2NUpLUnK3Q
 5MfzYSeoXfh7QqiY7/t4ykd17uyyMU3Dd/2Cisl+yRisbIPjt/i/og5BnLNgRVTjfPXK
 EgOTU2e9vEXnbIPImzswYYdiuLP5Zai3txe1QUot+7HokceHHTR/UqqRnuUVVGmdm0oG
 tuaL2w/oiUVHnKHQslEJv9ENkfhsOQJeFBrQYJY/88iJ0U147KM/8TVmCzXw1GbpwRsK
 D4DPGKy/0V6ofCQfoBQzxZbLU35tkgqIUKUoXYEeM7OIHKoxfqMl+aldnMU0shlcVcZ5
 4ajg==
X-Gm-Message-State: APjAAAU8MG4mDXstJ5prgs03NQZm4IMmqCz74MnvMxxg2jbG50Gap2zF
 cBibiCooWpQwVpOc6aVX7HPagtYeW0/iv+L2pqHr2e7+
X-Google-Smtp-Source: APXvYqw1RVJywy4K3b1yl7vemkCf2sjgPgHWuYK1FzmeG5p2rRaGnoz/w2Prm6XKeRkkgu+IHLDqIKuiVfvsJFmTF1s=
X-Received: by 2002:a5d:8b47:: with SMTP id c7mr2117796iot.42.1568703169757;
 Mon, 16 Sep 2019 23:52:49 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Tue, 17 Sep 2019 14:52:39 +0800
Message-ID: <CAARXrtm7YpjsWYJTXU6NsZJVBPDyZ1sLK_3bj6aYnXvYWQ5+gQ@mail.gmail.com>
Subject: sdbusplus: use virtual destructor or not
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

This email is to discuss the destructors in sdbusplus.

In current sdbusplus, some classes are meant to be inherited, but they have
non-virtual destructor.
For example, `sdbusplus::server::object::object` is usually used to composite
interfaces and let an implementation to inherit the object.

In most cases, this is fine because we usually do not write code to delete the
base class.
But in case some code is written to delete polymorphically demostrated as
below, it is undefined behavior:

```
using SomeInterfacesInherit = sdbusplus::server::object::object<SomeInterfaces>;
class Implement : public SomeInterfacesInherit
{
  ...
};

// We have undefined behavior with this!!
std::unique_ptr<SomeInterfacesInherit> foo = std::make_unique<Implement>();
```

So the question I would like to bring up is, should we make such destructors
virtual?

Reference from Herb Sutter:
> Guideline #4: A base class destructor should be either public and virtual,
> or protected and nonvirtual.

http://www.gotw.ca/publications/mill18.htm
