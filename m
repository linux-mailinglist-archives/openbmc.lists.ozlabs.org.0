Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E9526C530
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 18:33:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs5Hm2GL1zDqY0
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 02:33:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=uV3DTAzk; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs55v54gvzDqXb
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 02:24:34 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id v60so5813378ybi.10
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OkH4QazKgC1+vDgW3tBILUDKYRhnm4Y16ZYYWytbwG8=;
 b=uV3DTAzkvRp6yHvbpcmJFIK2GiD6iHO1y0nyTesw4+IG9rKgXuIGLWsau3GGxr+N9F
 DdWUcclbtABaZg1+0aVWn9gI6zwwnv/InkF7g+4Vp4ZSnSq5I3bCS4j2TNCfP1QoJlQS
 rFBvyrGVDdbzI6krfy2LaVoRz4x2TNkiZk1F0sp3ahnJrXQe0D0TQnFLGnYSinQ325pr
 VcfA/5iwOOMw6f+OkfcY4X3CmJfGnBWJr8iAwVLbeLd12kTooEHxmr0HVKRxtdRiWrEl
 tDlBpHZg0JwOEDg5mUOESRazXQICjpcJnj2RLYz2KFJOhdWNQ5ZOnNL/VoGAzuepuMhh
 z2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OkH4QazKgC1+vDgW3tBILUDKYRhnm4Y16ZYYWytbwG8=;
 b=bQJ+RNUfSKYraLkrBpaQuHU57y6j6CqGXEYLUxNxgYDKny6a6nk5IRnUJmSDr9chMv
 oLERK4M3PrZL/9kQKYQ4IRELzEvjyqCSeyoEptGdEWOJVzmpSftUGZBVUH3SZ4px2WwW
 o8rWbuHXoWoB8ViVpBdaz+CUuuu++9RZiU6Ctu6tUY7ARD8lXD6SZx3KxtnE2DN4cRl7
 a1x1T/yQyxdMUmf1ifLexBv57v9eRxE+VhKGamX0xHGGBJZpGoQkrNO41dtUYaTwC1bF
 X5N7shsl/hrMURH2HHWtg4FrpneM4o3KTEhDsP+TRNIVtE2PRkzoiuVkE/lbb33NexNh
 m+jA==
X-Gm-Message-State: AOAM5303jqNe3ipVp9m2Co95USb2/WJskSASFEoCEUgpKZBuUA0QdH0P
 YYhmSwnekJLkyQlMfTi2MSwmtcncYdwjm439Wty5Bg==
X-Google-Smtp-Source: ABdhPJyBNlT10Fo07vlXuUN0YAvwOc+Rjc/P6eCmRsdRdy00bufgGzySPsaOV+1RGk+k/HZcjktGZkf7Lw+BbVwyNLw=
X-Received: by 2002:a25:14c4:: with SMTP id 187mr38384904ybu.449.1600273470075; 
 Wed, 16 Sep 2020 09:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
 <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
In-Reply-To: <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 16 Sep 2020 09:24:19 -0700
Message-ID: <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
Subject: Re: dbus-sensors: Unit property for xyz.openbmc_project.Sensor.Value
 interface
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Andrei Kartashev <a.kartashev@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 8:23 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 9/16/2020 6:28 AM, Andrei Kartashev wrote:
> > Hi,
> >
> > We noticed that dbus-sensors doesn't fully implement
> > xyz.openbmc_project.Sensor.Value interface: there is no Unit property
> > for all the sensors, defined by dbus-sensors.
> > I believe it was intentionally, but I still wondering what was the
> > reason?
>
> It was originally as the information seemed redundant. If the
> information is needed I'm fine with someone adding it, it just hasn't
> seemed to be a high priority.

Considering we've gone this long with no impact (considering the path
can be used to lookup the unit) I wonder if we should consider
removing unit from the sensor Value API?  It doesn't seem used.

>
> > I noticed that in intel-ipmi-oem units are determined based on object
> > paths, but that looks ugly since there is well-defined natural
> > interface for units in dbus.
> > Lack of the "Unit" property in the interface breaks some existing
> > logic.
> >

Technically the way the interfaces define it, both are valid to use to
determine the Units, and both would need to be lookup tables.  Is
using the path any more ugly than using the property?
