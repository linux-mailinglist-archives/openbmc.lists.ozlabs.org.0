Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8B98BE04
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 18:11:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Hkn74r8zDqkG
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 02:10:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="piIPEwzm"; 
 dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Hjt03f4zDqX2
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 02:10:09 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id x15so41153415pgg.8
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=G+L1J8bUKJIfMHWn8pfh3ofP0pqEyANCXRHlLYeJTTI=;
 b=piIPEwzm11FHHakfsQHW3FVYM9dcwW6T0HnwI1+5rCRJKCX+ZGHTaY/e5ML793+oi2
 A0nab2lL+ijteu1s1nOnQy4Ihz4f+4jzpseOKHd2Ljk+hBZte69QNw93Kw9T7cvb9yfY
 OEgXvxCfKyjls4SChnyOidTEygmFL/g0FXIZVaRC05FiOu3R+D3X4wOaG0/AZSjtXIxz
 Z1n6kehkIllDMYIehJUaa2GGY4DJhg6HQemfpyUuX0MEgdKAYDHrqbhA+8VozLXRii/b
 mSwHNkqa1shSlIVfcpr8Gy0ybmqpFt7DfTykQRubxlZxUovwVLaPto3tvkL1LEMDloTC
 Cq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=G+L1J8bUKJIfMHWn8pfh3ofP0pqEyANCXRHlLYeJTTI=;
 b=XH6NI3B0wa+IISIiJHAhHigAUHFsm20t3E/ubrNKR5jwbAJo5n1P2psoC8LUB2vE33
 cDfFV6E+zTncrm4ZuN6RyFwZpZ6m7rdB8wdzKG7EWKJNeyrqTVJgL19yjLPb8H0wi5vw
 WsgYszJI8lpqOfk+Aepzcuu+WryN/1qLmETPoHaIkYfJbWx77wGQ23G95oxFN6bLo7lM
 01fUUR4ajmP2UVMVmPy0maVF8H7iVEaYAtNzPloG8mCXRepQh9LhChEwIFKBFoKRrtNc
 6TyB5U9rBF4GLSXdJR3nmZHe/VeWdXQGi4U8ylvmmEJJrawv4UYKPiVOtiNAtl7QfsyY
 i0dA==
X-Gm-Message-State: APjAAAVS7nfDLuC0tpxc3M43BTnJ7Zd41Zzmz41fw7WUg+2OZPuN1Eda
 ksf7IqhA48W4ROyDjjgUATmjcDqGSu4yt9aMNami5Q==
X-Google-Smtp-Source: APXvYqy8KzLKn6v/WIZYu/OIYl32eCdpCTt1lBw2WtgvaWtL9iN6ThLGnym/ViTEko9v2lb4NntL3XhLfBxPQM10q/I=
X-Received: by 2002:a62:1515:: with SMTP id 21mr24903479pfv.81.1565712605855; 
 Tue, 13 Aug 2019 09:10:05 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Aug 2019 09:09:54 -0700
Message-ID: <CAO=notxCMZBE7+osFBTmTjg_zyC=BLZ3QZhxsnUrKXwE2JqChA@mail.gmail.com>
Subject: Adding BuildDate field to entity-manager output
To: James Feist <james.feist@linux.intel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

So, with entity-manager you can specify and interface, some properties
and how the values should be presented.  For the BuildDate field
however, the output from FruDevice for that interface doesn't match
the Asset interface's date property format.

I merged patch into phosphor-host-ipmid that makes it support parsing
multiple formats, however, that dbus interface defines the format "by
description."

I was curious if it would be worth trying to reinterpret the value
when publishing it to that dbus interface?  Converting from "%a %b %e
%H:%M:%S %Y" to "%Y-%m-%d - %H:%M:%S"

Honestly, I'd be perfectly fine just adding it as-is to the Asset
interface description since phosphor-host-ipmid knows how to parse it
(pending: https://gerrit.openbmc-project.xyz/24384).

Thoughts?

Patrick
