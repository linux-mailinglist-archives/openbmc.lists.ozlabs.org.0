Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2EF4D57A
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 19:55:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V8c65CxXzDrJv
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 03:55:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ct+3Yyyp"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V8bY1f3gzDrCC
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 03:54:46 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id b7so1694983pls.6
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 10:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5Pe91UUzRN+xBrav++21sER9CyY7eCA7DQYfcewLn+g=;
 b=Ct+3YyypR0GElGA7R1XYHBbvfu6hlWuC8LjIUjDMKfDMz/9jHC9fyUinxPrKptDXYh
 mXo1IuUkGl22xss5WYZMXHOmRDSSOA9mS7flTW/DHD7yJ5dDYnNKD5nUAoTUTspkSom7
 2gWZRwaJ54kFPa2HJHGo3AqgWDJDOdt2UGuSA0Mst9C231G96NIG1byHxritakg7ESn3
 nTL6nmSTuG2MKZdinnnTlPP9B5EyV/pYFbagPF8KzWwpeyZlcxT7a4va9XPDjG0xzNHR
 WVQCeHqivpMvNZJkVCETToREe9jnW/Zr23HjG+XruTWsSGNQ1PpLOzr74ac/Bn36ZkTg
 Tn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5Pe91UUzRN+xBrav++21sER9CyY7eCA7DQYfcewLn+g=;
 b=MzegQz0aqUN6VrrNu5RHXdtOSLlyYvfmNnw5TxFwIdh75RraSVGFjhVIMVVjdUG7qD
 TS/5GIXAJSA7LYnNx1ghQZht7DPHZ1CJG4fNLBedBgkKsQHx/I8Q88/iE9JpXH4slcMI
 wyOdr7SA72gCexSp/0G7ugrGY7eCKI5iHY8/YAr82hoDfnIY98+nlZHmkPjkczst0HK0
 fTGKQeNQwDeL8ng8emtinDpaEeJWUcU2bcBwmYZ5e58AWRKVzmHrS0njO29+ZjYjtUo4
 fnn+hcBlGxrDY4UIpjJY5jXVgNWi5MXpPUWcA3PgiJw9c8V21RjP/l+cXJmxlvo3OLDM
 9V8Q==
X-Gm-Message-State: APjAAAUodtgJYYMtV3jSKssQUdSCQS7iCi7+1mJK9kLxVLLSHYPtLNjY
 xIeCDpSVZQUFEExVsqKEcbvFzpBmeEcJsSgrL1mtRj9JY1s=
X-Google-Smtp-Source: APXvYqz+AnPw8EwfKqhr8oC3rLi0PzyaWtO+ckGiSacpsRSeyaxeRc1MbfhL2gQnoKuCpD58u68aNtXAKbalLKygKhI=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr58710767plp.47.1561053282371; 
 Thu, 20 Jun 2019 10:54:42 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 20 Jun 2019 10:54:28 -0700
Message-ID: <CAO=notwO_0MNFY-70bGRwmQZGG4_Wm-=2zddmncKYkT-QkBx0g@mail.gmail.com>
Subject: reduced contributing availability
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

Hi fellow-openbmc'ers

I will have fewer cycles to contribute to OpenBMC moving forward.
It's unclear yet how it'll settle out, likely just a few hours per
week.  Enough to finish current things, and review incoming patches
(pid-control/hwmon/ipmi-blobs-stuff).  Unlikely to contribute to new
long-term efforts or long bug arcs (epics).

Watching this program grow as it has over the past couple years has
been excellent and I'm excited to see the community continue to
accelerate in growth and contributions.

I will also be on the mailing list a little less actively, just
by-the-way.  Where I am handing off maintainer-ship, there will be
patches and github changes but in addition I will likely shoot out an
email to assist in leading future questions to the right person.

Regards,
Patrick
