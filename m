Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BE359E71
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 17:09:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b0YK0fGDzDqv5
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 01:09:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IoRCUS3H"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b0Xh2YFwzDqbq
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2019 01:09:07 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id g15so816985pgi.4
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=u6V4nPnPOdQ/uGLCy6mE/DVIniRjcIY27f0ohl0X1Jk=;
 b=IoRCUS3HXC85NlP3DnS551EhmsOkAhn4EFgHVgOFoElQSNxQRTukLYQKwY+11+Omwd
 EzuGHfzY6l4WIyMB1ItgP2WfxmFnBpWkBE+TC0oBb4eT0L8+KdJhJ8kkxFAZI3rNon0B
 q9d9HxZtnJHbp+mfD1P92Hwpv5aWj/3bhgzz32Jnm8TnQiBmAA9knMYYz1bcNlseDgUI
 +eIxTejvpsU9rDwDy05U1lhoAZlDMcouxgS4hc6tcao3YZcXw+CnuL4hVVrVpfHMjSMC
 I5h1xoWRpuqyJMEYrCcPK0oyh3RUBOUf+1G0aAIgWcHvbXcA46/jisDjY3v1cUojbwUt
 tJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=u6V4nPnPOdQ/uGLCy6mE/DVIniRjcIY27f0ohl0X1Jk=;
 b=RbcJlFHIoVvvPRLVHeEaU+/GHyaMpllpkNDuL4zgyXw96HC9I+8np8ZMqumrRb51Pp
 AC2X41yJv+r/YCAh09T9dmoNybssugEKNXVYN4FTwCtk82p6IREHB+lvkQai6yR4/eOC
 g/ZdM51HnIMdV57zT1kRBbEcC7SWvjCQzllQtNPC6zwaEpDraxZ0fNvcpZopvgCgfkXH
 dpPxM/MqWBVw8qN1wFlwY86FnAjF7+PcI7jKYOwwsOu5c9ixu8ie+ECCAPjMsPo0leKN
 B+xEWAH7H9oKgedL1hnQxwVVd8Qqm6YKR8nSHvh1uLmobI92IXSuL3GMviHW1Ob9x288
 d+rQ==
X-Gm-Message-State: APjAAAW4X6h1fz64u1Iu7Krz/xhbfUrHzUV6zysWNvMfhujwGgnst7UV
 yLWwlfpbD9D70gWPJLjVSsmgZRo7lSSM2L9zDEbyDkvwa+M=
X-Google-Smtp-Source: APXvYqy3znBqPw9TaMMq2GEGxPQxzEJ5g26/2fg2li0wVH5dJ2qe9UqCifN2z5ZACXWNCkdCJCj4ZvjKZYys2pHOdC0=
X-Received: by 2002:a17:90a:23a4:: with SMTP id
 g33mr14190743pje.115.1561734543646; 
 Fri, 28 Jun 2019 08:09:03 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 28 Jun 2019 08:08:52 -0700
Message-ID: <CAO=notxpz2X-38J-UNjLZWh9RjyunjaXVDhZ_VGK587zFVg_Vw@mail.gmail.com>
Subject: phosphor-ipmi-flash v1.0 -> v1.1
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all;

phosphor-ipmi-flash v1.0 is rolling out in the next couple of days.
It supports sending a BMC firmware image (static or ubi-tarball) to
the BMC and verifying and updating with that image.  You must provide
your own verification service -- because presumably each company has
their own verification scheme.  We're using a service that checks that
it was signed with a private key, we have the public on the BMC --
pretty straight forward use-case as an example.  The update service
provides a default:no option you can enable that will just reboot the
BMC, otherwise you'll need to provide an update service
implementation.  You can do whatever you want.  I'm likely going to
work with Adriana to come up with a default UBI tarball one -- for
those using that, then it can provide that option if you have that
distro_feature enabled.

The burn_my_bmc tool build and usage will be detailed in the README
file, should be landing this week or next.

v1.1:  I've received a request to extend this to support the host
BIOS.  I'm working on the design changes to support either a BMC, a
BIOS, or other firmware image.  To avoid adding another link in the
dynamic loader chain from ipmid though, I'm looking at this as a case
of pre-canned options you can compile-in versus searching for
additional support in libraries (although it's somewhat trivial to
transition from one approach to the other).  At least for now, that's
the design direction.  But we'll see once it's more fleshed out.

Patrick
