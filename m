Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C8616B53
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 18:56:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2ZMn4xQXz3cB4
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 04:56:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JOTpZb7i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JOTpZb7i;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2ZMC5d0yz2xfS
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 04:56:22 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so1795355wmq.4
        for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2022 10:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TfW+EAI7xQ1Zdf+yi1nwnvRLTqmLE1UTgV29okF5NYw=;
        b=JOTpZb7ig8NTiZbWKHTiUYeyJdWQ+AAbAUPnZrk4wKui5hmnyna6OPue1pg73+zZQP
         kUZ0K8N+wOwDwHBH6AXc22/0jRp/q4V88h13q7d7Wj9qAbA0Dyvob8tcZJtcIY1Fo7a4
         9mhY5/k6hArzqVXes35p569VvHAktxSXdpXlftyRF4UmDWwjnM6qehL3+s3WlyAvF6UW
         Ujgds39O3Mmd1tN2nVrYTuXZkMtgottwsvI3Cm1nNsFU1yBHKLzHo0EHze3pwaW+maxC
         Lh591LJiwsNpPbOfy6yVGeGcKppazORL9yW5JWOS0XS9zVasdsa54fkaIs7eikDwsW4I
         aDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfW+EAI7xQ1Zdf+yi1nwnvRLTqmLE1UTgV29okF5NYw=;
        b=VwMeDcrZMKvXqjIUXN+MbFLvVF0Rz5jw/O4YhEFcI40s8DdRNceMMHGRII2yi54A4Z
         M5uXrVVwd+dljI3KiwXTnV3MOG7avCairMamECN+eynr3cG9SP+wQNhIAbwxY2k56Yoy
         vCE+3fpbG++glGC3BMm4edYIJCPLc9VXhbQyY0GsCiF7LT5mMkMs0yc8HxD+mlLrU7uj
         fJxY10lIbfy63ZCkG/alVb4MhG3Oblv++tOZHk5LygmAwLD1aSt96dAOfPtNCRHDexDL
         M4VlsJkTXAVgbWOJtMcXMi0f4DQdBSuR7dhx7sn0H75Cy81iDJOX2qwd/yNZ1Pv7USiE
         Mi2A==
X-Gm-Message-State: ACrzQf1O/ACVdtHwl2I2o/a0jNHdhZGxG7aeIvluwVkswK8vkKs50g1p
	e4GIl30pi3OT7+mJWaETjRkwOV/uyPUTz81rZ20S6KMtTJUXXQ==
X-Google-Smtp-Source: AMsMyM7ltpj3gRXwksWLD++C+gEjTD9hw5eYchXDGikEk8FaZ34z2oJiwCH5R0SHnIzDJamt+o5oXv1iggj49KweCoo=
X-Received: by 2002:a1c:c90c:0:b0:3b4:adc7:9766 with SMTP id
 f12-20020a1cc90c000000b003b4adc79766mr16861934wmb.66.1667411778712; Wed, 02
 Nov 2022 10:56:18 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <edtanous@google.com>
Date: Wed, 2 Nov 2022 10:56:06 -0700
Message-ID: <CAH2-KxAsq8=+kYZHb9n_fxE80SuU29yT90Hb0k72bKfY8pnWEQ@mail.gmail.com>
Subject: dbus-sensors and EM maintainership
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
Cc: "Ren, Zhikui" <zhikui.ren@intel.com>, Andrew Jeffery <andrew@aj.id.au>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "Mauery, Vernon" <vernon.mauery@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

TL; DR I could use some help with reviewers and maintainers for
dbus-sensors and entity-manager.

I originally took on maintenance of these two repos after the previous
maintainer left on short notice, hoping that someone would step up to
take ownership of the reviews and maintenance.  Several years later,
and a few people have stepped up for portions of those codebases, for
which I'm personally very grateful, but reviews are still a
significant amount of time, and I'm struggling to keep up.

For EM, Vernon is still listed as a maintainer;  Is that something
you're still interested in?  Is anyone else interested in taking a
larger role there?  There's about a couple dozen systems supported
from the EM repo today, so I'm hoping that there's some folks that
have a vested interest in keeping it stable.

For DBus-sensors, there's already several maintainers that are fairly
active.  If you guys could take the lead on reviews, testing, and
merges going forward, I would appreciate it.  In the same question as
EM above, is anyone else interested in taking a more active role in
dbus-sensors?  I'm happy to help mentor folks if they don't feel like
they have the technical acumen for it yet, and I'm willing to bet that
the other maintainers would be willing to help as well.

If anyone relies on either of these repos and would like to officially
pitch in, please open a review to add yourself to the OWNERS files of
each.  Ideally I'd like to drop myself to only a reviewer and
submitter on those components.

I've done my best to set both these repos down a good path by
documenting as much as I could.  If anyone sees documentation that
would help someone else to maintain these, I'm happy to write it.  As
it stands, the repos have quite a bit more documentation than when I
started, and have static analysis and CI testing now, so reviews are
significantly easier than they once were.  Hopefully we can continue
this trend.

Thanks,

-Ed
