Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A17C742C0
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 03:06:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vDYw3xlQzDqMv
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 11:06:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nuKssDL0"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vDYG57r1zDq9y
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 11:05:53 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id z28so46382252ljn.4
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 18:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/+Uy9JPR9nS1F6Bo9Regny7IprTuv/oztolIWBmizjU=;
 b=nuKssDL0dJsaX5fCgY6QrcMxh0FfwxzNN8vHJcrsMOVdirczCBku87mtQ8iXbvEzVl
 rAYXKGIPRJJsjBlQkr6QLe8xA991BFInm0e/lkAe5K64dwO7UPGPRXH/U7CXJw+4vbyx
 zcXioxN7xVgvomBumKtwpjY1eECQdcMTgRh0OPg27RsBF7ZDNAnk5r2eWEklY4kgmNif
 JMyIIYE5osPNXYaaxlbvl4GNow+hneZsTZVBFa0pLVoyxI28GCte9MNb0WNJ+zqgCDNq
 sF2YcF+ZSGPMOCk1uop7dLxvOdjoXxVVePYIVpAxsaO/y963xGIZedJaZWoT+V5j9eIX
 wvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/+Uy9JPR9nS1F6Bo9Regny7IprTuv/oztolIWBmizjU=;
 b=qUprQzjeR1728USKrGSl+hONzwFrc5sONq5fIIRtTlnqYX1Xp30eTnkLNcDQZKi0+p
 YvDAAcarHr25bj3k60LViUAiweTAZne3JemAuDxMgBneT6i22Ty+3B8aCLEvOlqyRIxi
 5BptP65PHWepPavBeEb3YtR1M0LCQ4P/MqwmIsWlGXxsIOU6V5IVDrr21eS7dP2YNzO2
 /6Cj9uB8udbksC4R3oxS9KjOd6e/MjN9cvLGYTgvGMM8Ky4m4fUPBtXJ8lWtyF3YDulU
 P4Ncwoz4A6TpXalYbJHVIDxL3tosuXrDkG8V0cjzppnchz7hsahG/cOEP92aAkFEntU4
 4JWA==
X-Gm-Message-State: APjAAAVDgSiiPOHzV8+ZX02aL0sBZM7mfqLfDfVPJ9yy+EAkeeV4t7b0
 nip+xy9c/iBn/a2yr6TDjSACJOZ4Ub5A752WkmRK6ztw3EU=
X-Google-Smtp-Source: APXvYqwovIgSkJVbQsnwwnVYd6r0pu3Lh0E8xQLfMJR9SkvqRU9JFWfPt90piypP8RjpUa0Qpj88ktvbEIqqp0v2At4=
X-Received: by 2002:a2e:2b01:: with SMTP id q1mr43542321lje.27.1564016746984; 
 Wed, 24 Jul 2019 18:05:46 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzhiqiang8906@gmail.com>
Date: Thu, 25 Jul 2019 09:05:36 +0800
Message-ID: <CAHkHK0-dT2R6WUowZhaLgVurFPukL3tmJGneXCEijKew=1uRyA@mail.gmail.com>
Subject: How to ideally fix the log function
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Yu Lei <mine260309@gmail.com>,
 venture@google.com, 
 mspinler@linux.ibm.com, vishwa <vishwa@linux.vnet.ibm.com>
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

Hi all

I am just curious about how to ideally fix the log function

Currently,error log code location metadata is not useful, link:
https://github.com/openbmc/openbmc/issues/2297

That issue mentioned several solutions,But I am still confused.

The call stack of phsophor::logging:log<>() is like this:

func() -> log<>() -> helper_log() -> sd_journal_send

We need to pass arguments(CODE_LINE and CODE_FILE) from `func` to
`sd_journal_send`,right?

Ideally:

template <level L, typename Msg, typename... Entry>
void log(Msg msg, Entry... e,
  const source_location& location = source_location::current())

but packs must be last.

is there any suggestions ?
