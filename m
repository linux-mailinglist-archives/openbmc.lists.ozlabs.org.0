Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D73D725CB
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:17:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thrg0D0MzDqB5
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:17:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZBdqEJbS"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tQD03vvwzDqPM
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 03:18:08 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id i2so20880815plt.1
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 10:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ExFB0nxtjHAdlbigHaEis7x3gF9OdgCWRRHpPcPEIU=;
 b=ZBdqEJbSfEQaNulkRNW2gqtv1Tgnc+E6G/6QCmwwAf3UE7vv4XavckSTFBgSs97rWD
 o3JR36jm+cN0JuIUPzagFykc1X7zOE7dHePxk5ONfYU2yDZSFKUgyoeyHkHd5RMCiaA1
 n9wqIru/3Oezogkt+3+etHRup9crlffKn/c/qGEaBJWmOAEAoXoZH6wWEA2M6T/dg3fx
 jiAF8j8kdFTfZbXboPSlB51eF6rk6ifECG7fYgmlyEQqNRh0nCKHJnY0TlRuPTrzGg+N
 9hTFn2RWWsUs94+crTZ0f2qNFH3bWuBr72xVC33ETQSoiHzRxkimygHFWNurV4/cadEQ
 1/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ExFB0nxtjHAdlbigHaEis7x3gF9OdgCWRRHpPcPEIU=;
 b=KvHVVnWBfxGugTliFBGDywDWWccvbHs0qxrEP5QRyhv3MHbHzkiUlnN2BlQjMd6rze
 cTxTwQnkaeOVUPid1CPAuYYVQIFTW2MLwqj++worWK5MYg+wMf8hNTP9gWn2wxNe8Kdc
 u/5YtEZyhlXLFzpQ0gxTyt3aVtp2LbHic/1HEYvy2Nc/o6CmD7cQ+E+fVK0wYUU9wlyL
 MwlhwrBVF7hIhIMJbZpiw6vkHbJfnOK1GR4GXfci4s5UV14Bo9+mUKbt02d26znSapnv
 N9StHlwJGZj82S/Ash1IG6sP9Ak0r8F+NIT7ry1IiFP3EC1KI4TSYQ/nKP3pnEGISu5l
 jgIA==
X-Gm-Message-State: APjAAAXgM9Rc666Fb9IAHSxq6ReOXjituOBxEZJzEb4moi2PrP9rDwbQ
 ZBnNiN3TdR6oJ/pd9tYGt6xLZh89Sqmqn/qupgiu3Q==
X-Google-Smtp-Source: APXvYqy8pjLZ0FSBnKfO4PZtH1IHKxb0RbRz9LbnFmbkb6TUs76AFVZXI6jFU9sAOy2Y4X1sUTdFClrChw5kfmhVgB8=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr81028326plp.47.1563902284750; 
 Tue, 23 Jul 2019 10:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxxEHzBeCew3OaGs9E=vvzjf9q2XFD1E0S9aRqxzSSHzQ@mail.gmail.com>
 <b6210038-21fb-6e90-fb90-88d5602db81e@linux.intel.com>
In-Reply-To: <b6210038-21fb-6e90-fb90-88d5602db81e@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 23 Jul 2019 10:17:53 -0700
Message-ID: <CAO=notwynLKMA9=37BQTDfdbda1Stfu=kgHt2YO4EwhpT2DekA@mail.gmail.com>
Subject: Re: dbus-sensors + phosphor-hwmon
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>, Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 23, 2019 at 9:58 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 7/22/2019 3:26 PM, Patrick Venture wrote:
> > I haven't tested yet, but I have a device-tree with a lot of ~40
> > hard-coded sensors on it, and then the other sensors will be detected
> > with entity-manager (once that's set up).
>
> Entity-manager doesn't detect sensors, it detects removable components
> then expects certain sensors. For our baseboard here:
> https://github.com/openbmc/entity-manager/blob/master/configurations/WFT%20Baseboard.json
> at the bottom of the file there is a dbus-probe for an
> xyz.openbmc_project.FruDevice interface with some specific properties.
> If those match, then entity-manager through sysfs can add some sensors
> https://github.com/openbmc/entity-manager/blob/master/include/devices.hpp

Right, so entity-manager writes out a configuration to dbus and
dbus-sensors works from that exported configuration on dbus -- ?
That's my current understanding, the trick is, the dynamic versus
static, and how some sensors are already specified in the device-tree.

>
> You could also use device tree if you wanted, the export just wouldn't
> succeed. But you would need a json file with the sensors bus and address
> for dbus-sensors to work.
>
> -James
>
>
> >
> > In this case, will entity-manager populate the dbus configuration with
> > those in the device-tree initially making them available to
> > dbus-sensors? (or will we or should we, also configure phosphor-hwmon
> > for those sensors?)
> >
> > Patrick
> >
