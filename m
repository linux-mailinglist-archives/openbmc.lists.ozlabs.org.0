Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 476A823F39A
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 22:11:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNc2J5SCbzDqlw
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 06:11:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ZOhWKzEo; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNc0W369DzDqjx
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 06:10:01 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id a19so1336394qvy.3
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TviOiei7QWqigdMd37o7j3jJ7dONBQJLgt+1tmrOw+Y=;
 b=ZOhWKzEouYIPNme5POl8oLlNIKSzbkIxV6z0qIwu5LOI1Hv+wFfHOnJ467fkpcUbeG
 +Pg1Q+w00pYhK9uUmW8fxR3D7+1utpBAu+4GEY3iazGys80YJEzejbhHvLHY2sgmSJVZ
 h1nQUc3YKfzGRlqpOVPZ8MTFjOTezfhApEcquR+UHcU/3uvhCth5HnPJGal0nGE51O7j
 LadaKnMsJaswp6HFo17QsbgD7FgWzGAJBnjoqdNXQ8rmNYGrPWIzpfCH+QgdY9krAN4y
 Yq+rtokq9L2nT034wyFsHnqWbfxKL+mIDe/VsKLQZyiwCb4fQusxFIZV1GZjMAIJ/kyJ
 j+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TviOiei7QWqigdMd37o7j3jJ7dONBQJLgt+1tmrOw+Y=;
 b=AqAVIDqMi+YlM41OQ90FyUR5nh1FZRQ4J9FatwXt6cILCMBLDacjCh3XMZtZuztUEp
 Wdvz4kVS8l3KBoNECbL2W4m+W8W/dV0Y9XAABVxiOSGo7qFXadqmUa3w5Iz9qlDHe7Rj
 LvAcvWONTMs76Z/2TeBgsYwnhswVcXX1zXqCQBp5iep3y/KNo9EW+YHl2rqZaw7N4EWY
 u4Hi6Kz4p7xFsrZneheOXO3u5yGrRmFEk326PZeaK5Rj/GTuOV9ASUJ5IS7e17vVai1P
 ujLEj3ibI4GhSVn8C0btM5RBy3/SDLefRLMcdBWqXV25ZUV/rd27dT47e9DBkxpnpiU/
 2R0g==
X-Gm-Message-State: AOAM530IJGFWnF91JyjfrjggRnNZeSh97zf/d35Ng8YWXO29GGBB0LyM
 0GJoEPhqan9FJocm2n7bemh2/h4CEpIW1X3d2//nZA==
X-Google-Smtp-Source: ABdhPJxKuXPeR8eKwggk327xiUG9NyfPk4arGkFqqLUUZHrmP9KUksy6ATM+w4lksZJiJzc4BnfS5xwgtOc2DIRkCcY=
X-Received: by 2002:a0c:b312:: with SMTP id s18mr8880464qve.34.1596830995907; 
 Fri, 07 Aug 2020 13:09:55 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 7 Aug 2020 13:09:45 -0700
Message-ID: <CAO=notwjyJJk5wfPBJ_=7ffS_988YwR7OJ-WAYCvJ1rBCq6oBA@mail.gmail.com>
Subject: External Sensors - phosphor-pid-control
To: James Feist <james.feist@linux.intel.com>, Josh Lehan <krellan@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

James;

As you know, the json configuration of phosphor-pid-control supports
"external sensors" which are sensors that phosphor-pid-control creates
itself and publishes to dbus, expecting IPMI (or other) to set the
value.  This is used for cases where the host can read sensors or
information that the BMC cannot, and basically give it some missing
information.

From the query phosphor-pid-control does in dbusconfiguration, I don't
see a way for it to find these sensors that it must create.  i was
thinking, something in the profile that entity-manager publishes could
tell it this.  But, since it doesn't show up in the sensor query, I
think it'll be something more.

Thoughts?

Patrick
