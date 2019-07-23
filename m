Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FDA725C9
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:16:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thql6XkVzDqPn
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:16:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VZgrQqcD"; 
 dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tQBK26phzDqPM
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 03:16:40 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id x15so9398112pgg.8
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4RO+eXzEkeeGmJxtzHR5qXnZFf3xvSwOJO4Uagjs1v8=;
 b=VZgrQqcDmGql2+qPt5w95c0Q9yyPSlo6ZchctAUKZqAfySAIM6j8VGCSW/Jxl2n9J3
 +5v0F+EsMH0/9J9FT+PJb3dmnwKWqNBseHmwr2CVXo33d0KzrKQr0ZUSpSp1N8YygoUs
 JBVhSTfXcT/Fa4V2Z/4VrVsvYKfbOP1LvHzRuIh3z8SseB0OgarIa7RnpAJvpHtzyO7E
 L1Xudd+UMqo23fHR3qDcvWygBI+JqSsZJ44XsunISCborb8IEWIn+fU4KSNwCKheS2I4
 h76N0XdgENn03CkQjnDCiBSODtukq4vn1Q2FDFIqFj6pPb7Ns0zYUWZWzRWEt/VQATJy
 mqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4RO+eXzEkeeGmJxtzHR5qXnZFf3xvSwOJO4Uagjs1v8=;
 b=d6+rNbjvN4mndfS1Nfw0IeDs0dyUI0Ewjv62M+wwXRRDMgi+rvskQzHsmiYYx9ceGV
 8Y7ZdMiicPkC/5SaasrWOeBM53UFEQzpzUPt0LabAhjn/zoZv9IkTwn8H5zsXj+Nal3A
 tLVuUmVYLqR4NeQXwxmfzYnAcL9Lg33wl3ooKwp5hZJ+2cZf4X5Q2KxIqO+yIPMFYwMs
 ZxZ4+dOhO6JOdiVEuc88U1ULouJ8gc8+eORKa04EUzMCGm8hgIAlAFq4jtCG8dNAqrGn
 sRQVgrfw10HpZQ8i6gn5MOOkdH4KJL+D2hGhD2IEdsySda+P3jXpIskcorxr1qpKhUKh
 GofA==
X-Gm-Message-State: APjAAAVRDiO1TQ5rxz8GS0MqGpJblQUzVnG5S4caW4mAOe3hx8ojniV5
 xZkpPmvL6sOBULYpWdlRwsEQWccttAkqOxxqlvIvBQ==
X-Google-Smtp-Source: APXvYqz2ZvxXdS437RBmZGQdtvT5HCPNXcUeEaXkrV9uM+6X4ShfWUGmW7/+gvuRJ5WlbztlczC2ngKTXEsM8w/h7pY=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr6823825pfi.136.1563902196594; 
 Tue, 23 Jul 2019 10:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwpKm8KLiXbL_+02DLUsvjjZqAPBCujnTLCd8GnheQQvA@mail.gmail.com>
 <CADKL2t4DztiWaWDFpYK_iHqyJxxk2+dgOhGTgayT2uUPVqGcKg@mail.gmail.com>
 <CAO=notz0U8o-29JAy2_bJYCO4Sp_8ii3KZ4r88Y=QFwWTZd6-A@mail.gmail.com>
 <06aa38d3-a0b0-fea9-21ae-6b0eb126aadd@linux.intel.com>
In-Reply-To: <06aa38d3-a0b0-fea9-21ae-6b0eb126aadd@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 23 Jul 2019 10:16:25 -0700
Message-ID: <CAO=notxFitXiE=bHWCkz+R3fPkkEzu8GQidWiQET4ok+R8rEBA@mail.gmail.com>
Subject: Re: ipmi-fru-parser + entity-manager
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
Cc: Ofer Yehielli <ofery@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>, "Tanous, Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 23, 2019 at 9:42 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 7/23/2019 7:20 AM, Patrick Venture wrote:
> > On Mon, Jul 22, 2019 at 6:34 PM Benjamin Fair <benjaminfair@google.com> wrote:
> >>
> >> On Mon, Jul 22, 2019 at 3:25 PM Patrick Venture <venture@google.com> wrote:
> >>>
> >>> Does entity-manager manage the FRU eeprom devices?  Or does one still
> >>> need to configure ipmi-fru-parser, etc?
> >>>
> >>> Patrick
> >>
> >> There is a FRU parser shipped with entity-manager which searches for
> >> FRU EEPROMs and attempts to read them:
> >> https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp
> >
> > I saw that, but is that a replacement for the support provided by
> > ipmi-fru-parser?  I'm assuming yes, I just want an authoritative,
> > "yes, you get this and don't worry about ipmi-fru-parser when using
> > entity-manager."
> >
> I haven't used ipmi-fru-parser, so I'm not sure. Basically fru-device
> scans all i2c channels, looks for things that 'look like a fru' and
> populates them on d-bus. It doesn't do much more than that.
> Entity-manager can then "probe" it's properties and load configurations.
> If that is what ipmi-fru-parser does then it might be a replacement.

Thanks.  ipmi-fru-parser parses a configuration file and if it knows
about the FRU via hard-coded information, it'll populate it on dbus.
So, it sounds like the same effect in the end.

>
> -James
