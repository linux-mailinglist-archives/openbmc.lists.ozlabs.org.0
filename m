Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F4DA53B
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 07:58:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tz3l5ht9zDrBm
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 16:58:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="K6lBq1N4"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tz314Z7tzDqc9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 16:57:32 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id e5so576728pls.9
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 22:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4RmRvyjxhCVD6dFVMTT4ucw0sQv7VynFNd+3ILN3Hgg=;
 b=K6lBq1N4o6/EQ0nL+sZ5bVU2zhEuwypX6X4NprgUr4AeeFBzQnS4adWwGPlgDCc6uI
 w5ZHe6ZSgVuAYp2Uj4OauXUSmgi3JXO8MwIGp7Xjo5Nhj4oL/YRipPUCzss9xYZ6WJcm
 fV9yDGrZGhNBQdAhwKIUB/hTsOxbTj2g0e+14JpXpAUAL4QNjeBHRQVV+ZSw+AF/tj0a
 KWfzA5jz6GJD7NW1PxpzYYLxYADuby4iybCeqGyVQoDt+X/ofdFVY672+qRqtZvIF3yB
 PwgSr2/4tKuJ2Un/BeC44tdO2we8IagxL4JF7KjuqnJEer7tjtYogrZeIJ3PN0nc/Jn6
 VY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4RmRvyjxhCVD6dFVMTT4ucw0sQv7VynFNd+3ILN3Hgg=;
 b=OV7sq7tQsGLfWB+zrDjkVHt6x7Wp/NeNhdy8Hr3mNgE3TLAeSAajR82s726eiRYm/L
 3gRgql4ABGCaaYWfFePiVkPIdd8F9qtLx0M6pJ1rXtbYLuzcBJGqlHOqpLwZB7K70oHd
 Ah6CgrQhq/BPwJPXZiDuOC527aZgGGZ8R6IR1+R66nD+r4CDn6oGbrqXrHmJWbnxfAg6
 NxZAuN4+RgitnS5bNwv5MUCE90b3G3eyTBKwfTPaeBVIHOaijEs1zo0uwv9i20bwVniG
 Ewct3EMfhVZ+buavONYt32E6/R1kDRTXC9NoaCXsOKNYQgRVLMahT/fIDTCJ5GlTTQYG
 GJmw==
X-Gm-Message-State: APjAAAVfZs4UWk8moK3a8XXdg34JL8dxkRYBu2MCnsk5GCMDA4hbWDFs
 CxwRjIJW7Rvo9xNiG6M5Ye0NKfVeta0zKUYKhXxBXQ==
X-Google-Smtp-Source: APXvYqyqBo1o9IRAlX95eg7+8Fwn5Bw8XvOy866ZpVneDragh/K8jPjNwnE+AgsEuZgcFME/59mmjYs44qoYW8Gw+fg=
X-Received: by 2002:a17:902:9b83:: with SMTP id
 y3mr2108443plp.179.1571291848464; 
 Wed, 16 Oct 2019 22:57:28 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 16 Oct 2019 22:57:17 -0700
Message-ID: <CAO=notzVe07GjrKj5ZLLVBA=mbx66aEWmYYfGhiTKpNoAmrEqw@mail.gmail.com>
Subject: FRU device entityId and entityInstance
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Because there's no association between an entity-manager board and the
fru device entry, I added a new interface to the entity-manager
hardware profile:

"xyz.openbmc_project.Inventory.Decorator.FruDevice": {
    "Bus": "$bus",
    "Address": "$address"
}

I'm making the properties uppercase like they are with the FruDevice
interface so that they match  -- BUS == BUS, but they are different
types.  I haven't dug into the code, but interestingly these are
uint64_t while the FruDevice Interface's BUS is 32-bit.

This lets me, in intel-ipmi-oem go from a FruDevice entry to an
EntityManager board entry.  From there, I added another interface:

"xyz.openbmc_project.Inventory.Decorator.Ipmi": {
    "EntityId": "0x07",
    "EntityInstance": 1
}

If this interface is present, and those properties set, they are used
in intel-ipmi-oem.  I have a patch for this that has been tested and
works.  I haven't updated the schema yet, as I wanted to get a second
opinion on it.

The sensors also need the Ipmi Decorators, but I just added the
EntityId property to the "Exposes" entries that need it, and then it's
in the Configuration interface.  However, I haven't yet pushed that
into a sensor.  I see there's an association interface on a Sensor and
that points back to the parent board, but it isn't immediately clear
to me how to then travel to the sensor from there -- by first thought
was path swapping, but that won't work in cases like tmp441 where one
sensor configuration feeds two sensors.  Anyways, I was thinking, what
if the Sensor creation added another interface for decoration (if
configured), so that intel-ipmi-oem can get the entityId and so on by
just grabbing the sensor object -- it'd be yet another decoration
interface?

Patrick
