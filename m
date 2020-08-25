Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C71251D19
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 18:22:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbZ5L2xK5zDqXZ
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 02:22:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135;
 helo=mail-il1-x135.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nfTtimnU; dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbZ3z2GsFzDqXV
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 02:21:00 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id f75so10608751ilh.3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=s7ZGMLLAuvLR9fLcUnl7zreEouQU7qPa5wqBSM+721w=;
 b=nfTtimnUk2LynTy7U/tne1llAOcHA4XpBUJ/OJfeNC6cndBV7awe5yS+HnRKTKgghG
 ER0cRvNMND9GckVdJzcf4qYhg2eUw+KOiG9iMB3Zh7MVC5XcNGUmDTyLwOTdc14T+q2r
 gXpFjsG1jVXi3e9oG8J3z4VFnLykVmPXK8X8Gx65Htt5AVd4nUN9tdIhfY3oYoCuyMpi
 J/oNeFuJJ7HV6FDgUrwnZXRZkdjROKM4HY+02xoGPbTZEl+cSsw4cThlq2P089BqXaVt
 sgGaq+8HHUrwNopgzYxMyz3vE0aJrF5Mk3lvu7xEOcCDlGiSEPvXDF00PVVrF8/yYOGS
 GypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=s7ZGMLLAuvLR9fLcUnl7zreEouQU7qPa5wqBSM+721w=;
 b=molYGuzjqIf1v5GdSEWvSi0wBA1Bxq/szkQHpzw/4ohicwjG5tUxZslYMKSHoCXJPm
 hwWmouIc/UB+pOpmmXjWYdku4kOhkt0OPsKlEoErvHvFXHxutPCp/uwyvzEv8U+hsnjb
 n6Dw6Z9/Wfi9YLFJ/aVAcumFiD+EU3IMgOxfP5VVe4UZNXHojfWLX7YDJdcfWS2zLanm
 1xDr80TX/F82RlUQLo9Uw/VZOmW2nJZCPKN9aBVRHFt/TUN4bIndt26rQxwEYYhtcOHo
 cCHM3l6mMi1HnzIMn99LQ/5mcydyMS8DaeGAXx6yE5bLQC4iokcLExYbEbcqGYbuoL0h
 ufJw==
X-Gm-Message-State: AOAM5300jG+XQ9aiRrIA51y+YB3IYG7RJRpaJwrCqfOkjqBu/r07VdmR
 uQMO0tP5VtxVNLNT9v4fB4lXYPrgywE6AQ==
X-Google-Smtp-Source: ABdhPJyUiDo9u+ghSCwegomqHebpKzoLzNb6rvz5E+Y5Gp7kdzOOnM+d3r2eFeJxNUriIv1srsZoMA==
X-Received: by 2002:a92:4995:: with SMTP id k21mr9507598ilg.30.1598372455542; 
 Tue, 25 Aug 2020 09:20:55 -0700 (PDT)
Received: from [10.29.10.6] ([199.115.98.226])
 by smtp.gmail.com with ESMTPSA id q133sm5302750iod.38.2020.08.25.09.20.54
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Aug 2020 09:20:55 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: systemd clarification
Message-Id: <C255655B-FA25-4CC3-9982-211D71352F74@gmail.com>
Date: Tue, 25 Aug 2020 10:20:54 -0600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
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

I would like to clarify some systemd behavior.

Related to:

/etc/systemd/system
/lib/systemd/system

The lib path is not a search path in the systemd documentation, and the =
etc path has links into the lib path. So I assume services in the lib =
path are only run if they are linked into the etc path. Is this correct?

If there is a an After=3D that lists something found only in the lib =
path, I assume it will run because After is not strong enough to prevent =
start. But if it was Requires=3D, then I assume it cannot start unless =
it is linked into the etc path so that it is available. Is this correct?

I just want to be certain systemd was not modified or configured in a =
way to run things from lib directly.

Mike=
