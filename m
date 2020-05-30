Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2A11E947F
	for <lists+openbmc@lfdr.de>; Sun, 31 May 2020 01:21:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZHWN5fmqzDqll
	for <lists+openbmc@lfdr.de>; Sun, 31 May 2020 09:21:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fzu3Gtt6; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ZHVG14PVzDqkB
 for <openbmc@lists.ozlabs.org>; Sun, 31 May 2020 09:20:36 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id y1so4968722qtv.12
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4MhdqyzRzfIxZ8pz7Z/09IZTPGvqcNCWwO8b6ecZdBw=;
 b=fzu3Gtt6zJKF6ANJN6VUwbLr8qSGWTw9H4ivEwG64tBo9rPCzGhGYclzao/q3b3Uav
 lPQIvoNbUOtj8iatLo7H2o8WTRXB1fabX3agVcb7kz0G+7ut68mV1NaLEzaOCvDq8k2d
 MPPuowl02+Nujhc6VzTxf7U5J6Sj1IF1GsHfrFJ3qsNzRJeHhWNICEktKjbDkpJXeiXQ
 SbbOdQuMEtmqaGePAOeoTEFG5fFzpPkj/PUuL7yY9Y4z3YSXKNRzpVxS/LQ625SnD8Px
 RT1HAEwWdF8/b/GEY8Whf+yxXgvfCVXehVL79PUc1b6TI/m53G00Tp9qttn6wN7hu8Sq
 AjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4MhdqyzRzfIxZ8pz7Z/09IZTPGvqcNCWwO8b6ecZdBw=;
 b=INscpGL15Ldq9EIsT+3mI1tISOl9XCTrgN03uzNXYOO6YsSf0JIg+QZij4L1VgRi14
 LvYb+f6Oea8wuTW+qvJuKt2gUK2yaQ0B79rPksmKS3TojZv5ihgUlOwFS2W1/zDg8N0K
 MbYjH0CsA+1oK6uLTl8JH3szIrVdedHcwCKCR194Wx96F0g4OJNv1JdpwIXHWgxGJKDq
 2jDk3ZERwXsgo51l0SB107nuu00JKpvPod8/mHM5zx2CnrVHHqxc4GwANrns2e2DRM+1
 mxdrUCmA9PIB+TNzWEogM43KpFdOlLf/tGwYjhIcNFM/QWZWcgCIAmWRNYGdS/3aEguL
 Z3eA==
X-Gm-Message-State: AOAM533Ntu0UR5cvD2yoCjxinRoWkBpoOF+obt1r4nWkHtjXcRZqTJuH
 mS2iZSX4CbY6iK9pObAgzjSYXso/SlIpiXWvuvIO0fbfy2M=
X-Google-Smtp-Source: ABdhPJxFrHJSj2yDUs0JennqQLK+U7FzOKg1llZC9ruFvx1AGIjGmuY/N13FSlySI+sy3/+11TiywRDpluM6sjeM+wA=
X-Received: by 2002:ac8:3066:: with SMTP id g35mr8276592qte.193.1590880833871; 
 Sat, 30 May 2020 16:20:33 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Sat, 30 May 2020 16:20:22 -0700
Message-ID: <CAO=notz682nVvnxtuj=vzEMBKbHQm01fd+=-JC9pXu+jGioMSg@mail.gmail.com>
Subject: Looking at intel-ipmi-oem
To: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

James;

I'm looking at separating the sensor and storage commands in
intel-ipmi-oem from their interfaces, -- making them work without
dbus, so that they can be dropped into other environments.

Re-familiarizing myself with the codebase, I found the matches
https://github.com/openbmc/intel-ipmi-oem/blob/fcd2d3a943c4fb518d399d8a0addd1cc661e5628/include/sdrutils.hpp#L66
don't appear to be referenced, they are declared in two places and
then the symbol doesn't appear to be used.  Can you verify this or
point me to how they're used?

Patrick
