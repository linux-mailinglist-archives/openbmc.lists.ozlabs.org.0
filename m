Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE659F02C
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 08:00:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tW9K2Cq5zDqRJ
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 16:00:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::135; helo=mail-it1-x135.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VPlcPaxr"; 
 dkim-atps=neutral
Received: from mail-it1-x135.google.com (mail-it1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tW8F3mHZzDqMP
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 15:59:57 +1000 (AEST)
Received: by mail-it1-x135.google.com with SMTP id q19so2852774itk.3
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 22:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xHAE1xK2bRFEQZi7THU7a0uEk7ZQNEYsojxm4QbV+QE=;
 b=VPlcPaxrXixT8mSUftlkzE0vBwEcsuFrprLwp7b6s6QQGfMTX4V3xjBnCLyqQ38SzW
 g8Whr7Y32C90v4i7kBwGie0+VTy9zM5AkzbTCTSxqQ/J4iRCw8Gjc9fv+XBJOrilQUnE
 Mk/AfJ5ZmFbKnMd6rwFELsCXnXx0Muw97beB6L4yUDIlK1kfIlGM7MpWNF6gA2TzJMrf
 Xn7+z1nTSTsL24lL/mJ4pHoKTJjp/qAEY6ifRC7iHZEac87JiqxXqlK8qFl99jZiscP6
 JhSUCfG/r8SEevrtJYbq7js/zFJbnjjsJeyrPiriZydSutcBDXG0cj2ktAJpRdu+eYFP
 uGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xHAE1xK2bRFEQZi7THU7a0uEk7ZQNEYsojxm4QbV+QE=;
 b=jEc/2goQZ2kF2BgIoPnOBfTH0MFMPz2UAiCve5fKkgux91QlUgyoMO+37ymHzU0zQi
 WFmOiJn4lEOE+81Xat4ZZOcAMNG79jqrRkWlBR7MB1Hqp46gg38Szhr57d2spygNQiDK
 66Ujn0HJz5nW6B2IFVamHJpQjzFJRuAliOmpamDGmIg6FB4/EYEnTZQh4whqGkYGKAqO
 nkvkgB1ksao/yA23YBPTgzJVzJ1eAdomih/QERVrW+oOMRQBWAFhG/npv+ywtV5D3/Ku
 izsaSTrc+iG/h/ANUCR/YX/RLAFBX/v5uXzWo/833fNgI3njJf75eI6FWUtyiiowcnc1
 OmWw==
X-Gm-Message-State: APjAAAXFMcS2XkNJbf8zcbfMcK5OnTS+lhF4gKUYi3vyQsu9N/H7cbmI
 ddRRrP3HFY9bTFsxNj5AHOZ6TtLyvVDUcms3KCFzPDzZ9FI=
X-Google-Smtp-Source: APXvYqz9QKEVNpqeA3O0XxK0GDrFZH32jnMWVyFUBsXLCh3uD4M6j1zFxQvq6QlPssmXxZmaL58RH6sA70OwYqdZ2T4=
X-Received: by 2002:a02:2b1d:: with SMTP id h29mr44173761jaa.76.1556603993706; 
 Mon, 29 Apr 2019 22:59:53 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Tue, 30 Apr 2019 13:59:42 +0800
Message-ID: <CAARXrtmfZhmxJK3m-eOmR4cz0m78EaN9xyQjqdR5=1mf+CvZzA@mail.gmail.com>
Subject: A question about bmcweb code
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

This email is to ask a question about the code in bmcweb.

When I started to review/read some code in bmcweb, some code concerns me.

1. There is a static systemBus in `include/dbus_singleton.hpp`, which is
   included by multiple header files;
   In case this is included by multiple cpp files, there will be different
   instances of `systemBus` in different compile units, which makes it not
   singleton at all.
2. There are static variables in multiple header files in `includes/`, e.g.
   `include/obmc_console.hpp`
   In case these are included by multiple cpp files, we got different instances,
   and some of the variables are large and thus consume memory.

Luckily, current bmcweb only includes all the header files
src/webserver_main.cpp, so it does not have issues mentioned above.

So my question is, is it a design to enforce all implementation in headers and
only included by `webserver_main.cpp`?
If yes, I would expect some description in README or some document;
If no, how do we avoid the issues described above?

Thanks!
