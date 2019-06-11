Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A243C734
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 11:30:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NPqC1vmPzDqXN
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 19:29:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::132; helo=mail-it1-x132.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qzOC3kOr"; 
 dkim-atps=neutral
Received: from mail-it1-x132.google.com (mail-it1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NPpW62nHzDqMW
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 19:29:20 +1000 (AEST)
Received: by mail-it1-x132.google.com with SMTP id r135so3646833ith.1
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=j7rQqpEN4L9+87c5pf4WdPfRT+VSELnGyUu9+7y/Ak0=;
 b=qzOC3kOrXlL9K7v3Y8tulr1iivF8gwjycli5cUPPt6GnP8daybR6mosTUKZwY/viRh
 /u/g44v79Ig+7V4c4qr9GSzByNWwRWunoCw8MaFD2jR4gy2wqPoxkN9NyLbqcnOLQxR+
 oDoWRhwTEq4awVR0cVdsjwHR0oqNPlElHWrv/bvYcX4nsoI4lGN3uQ4UfSywDB0AMnzi
 u9HCMS7pLBoS/8fh295B9mD9mfRibos2mZy0Ds/j+SS8wPOq7neEAt0/Ef52cjuf11RI
 XDYOsbhTmyNdAlxWXrfgnE/vMYSYMt7bkv1U1kbukw3AFTqYQ8WmM4JoJqgPwcXP6XP1
 koQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j7rQqpEN4L9+87c5pf4WdPfRT+VSELnGyUu9+7y/Ak0=;
 b=lT1cYxVKzb2YLZC0r5L8tHUTwLBXg5lLJ6xKIhmQrN6OXoN8t/0nNbq5nBWnktcBVt
 0YstrcvFPkidxd9ki1S/aKzi0DdQ3OxnJCe03AFPyIUivapcWC30GoMhrsgY0JIzsvfB
 1VQEv98c7PjG89vhveXPBFnmzG8MqkO9TAiwQhB/azjYi50huPEEhDe6FdVamNd3DGX5
 ztDX4Hg4GyMBpScQa8bpe1azmAtZyZlpKBUXMxRnkSu+Q0l97VlcxoASq5ei910HAtd9
 cNYGU4ZnLDphhlRhu44ONO4cqFClTIBRNvb0+6sOjGnhNbRCnm0kW6i2s/4SEul5sHOp
 Qcsw==
X-Gm-Message-State: APjAAAXFpX6uD4SAJnpBLc6EWSsPOY3UxGK+ZSZ13zd5xZibCHNUorcL
 I0q8Vv6prv1mN1aZeP6jqyHdHgoGElS0RsugJ2NGH4J2qME1nQ==
X-Google-Smtp-Source: APXvYqx7R0XWTVlLCfKzQtNqj/bXjGtYrvhM+IUPaqBZUVSbL0aZMqqxpZx9KX+QMiYxwr7i0TrD8EOCrmsoBeNGWaY=
X-Received: by 2002:a24:b106:: with SMTP id o6mr840056itf.97.1560245356940;
 Tue, 11 Jun 2019 02:29:16 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Tue, 11 Jun 2019 17:29:07 +0800
Message-ID: <CAARXrtkeMTts2GXpqjwNM6danj0jZoZVnkvJLKgo=416LheqRQ@mail.gmail.com>
Subject: About the external project of sdbusplus in bmcweb
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

While I was adding some new function in sdbusplus, it's found that bmcweb is
not working correctly, that it always gives errors like below.

    Jun 11 09:14:26 romulus bmcweb[1501]: terminate called after
throwing an instance of 'sdbusplus::exception::SdBusError'
    Jun 11 09:14:26 romulus bmcweb[1501]:   what():  sd_bus_process
discard: org.freedesktop.DBus.Error.AccessDenied: Operation not
permitted

Then it's noticed that bmcweb is using its own revision of sdbusplus during
build, as external project in "CMakeLists.txt.in"

It's worrying that one should expect that the whole build of OpenBMC should
use a single sdbusplus lib defined in
meta-phosphor/recipes-extended/sdbusplus/sdbusplus_git.bb, but apparently
it's not for bmcweb, and that results in the weird behavior.

When I change the "CMakeLists.txt.in" to use the same revision as the one in
sdbusplus_git.bb, the issue is gone and bmcweb behaves normally.

So the question is, why bmcweb uses sdbusplus this way? Is it possible to make
it just link against sdbusplus like other repos?

Thanks!
