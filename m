Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B48FAA1CA2
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 16:25:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K4dN0XpVzDqL5
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 00:25:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qDfoLkpT"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K4Xg6d03zDrWY
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 00:21:07 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d85so2173389pfd.2
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 07:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pYSn1POopJrxEd6xylTNDIZii0QJWueJlhsFmopvbT8=;
 b=qDfoLkpTYL7Vrwdpp+sDs9yoHzeYhtUoliZhvNbkc1DXY5NMy6EmHgCnHoz/wwrTLV
 cuQgXwQ8Joy0X2b3hypwYxngX/9WkAksJW644LOKV13xiYckTR9EgUctGaQTXWp8P9tn
 pemci5Hs1V4FBLKQM0v6prHUS/vgY0/xiOmWlJoMASrGzJrrARI9833aoE7z4/y35Tsm
 ERstb9ErITdS8xySqp64apBWI1p3u9nOP1ig5DH/ePG2kWVdBCw/4IVwuxm3zILSdIdC
 reNozHbEsMmX5osPZybYZNzycoC0zIhEvIKzZx5nA7rd6w1zoNHsUUOFJmdBRd7TW2cW
 0vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pYSn1POopJrxEd6xylTNDIZii0QJWueJlhsFmopvbT8=;
 b=YMQ5k78GiTILjbUDNDLmLZe6NG4lcqMZqPIhFGzzvmztcKy78ceT3D7mJPf/3FXkf+
 8dopC4W9GtbDK0Bd4kjmuLbPTsRMgiBnaHs2As0qJpNdZ39/HSYLcVv4fCtDlzkierUJ
 /+xL+9VM0UQV3CyRIEHHy9ao4tCDKWiDjv98JRTeo+x8SksTCcEooK7MJOkrKmZtqB9k
 +Tk0bLsuE8TMirbjCBWRcD2ka2t/dLMa1Unbdj9t2+uNMbkVxeUsVVEqp/wvlZVBoipP
 LO8zm4Qkk/l1agoXSVYcbwXYe1KcJjXOGNzXdpLEVJc6+vpktk4lqGA3zoYLHWlVmoB/
 cQmg==
X-Gm-Message-State: APjAAAWmH9nrtvqaN5rDO+FW5Yizbkf++9F2f67gs8PZbN30IiUiubcy
 dITmpusW7Y07cKiw09SkVaciqmW3zD1/RfI0u3TF5p5w5Hg=
X-Google-Smtp-Source: APXvYqzBQjtuKSpnDWKkbZyHnYmevFQkEuPYwDBBMSVp5/U6KjqBPUCap6UyZM1H5hIg+txCllXHAGTGvK8UqnftEEI=
X-Received: by 2002:a62:3145:: with SMTP id x66mr11896441pfx.186.1567088465197; 
 Thu, 29 Aug 2019 07:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR04MB666928CBD20DF6A0D894273FCDA20@MN2PR04MB6669.namprd04.prod.outlook.com>
 <CAO=notycWLR-DH=OxR7ssM+pwQttf6L=qVW42Q7Fko-WOgdetA@mail.gmail.com>
In-Reply-To: <CAO=notycWLR-DH=OxR7ssM+pwQttf6L=qVW42Q7Fko-WOgdetA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 29 Aug 2019 07:20:54 -0700
Message-ID: <CAO=notxEgQzM9MVPC-L3MXYNGXZzMeLuuu6f-Ji5tgsGzTXQPw@mail.gmail.com>
Subject: Re: phosphor-ipmi-kcs(kcsbridge) is not included in image.
To: Zheng Bao <fishbaoz@hotmail.com>
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

On Thu, Aug 29, 2019 at 7:20 AM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Aug 29, 2019 at 12:54 AM Zheng Bao <fishbaoz@hotmail.com> wrote:
> >
> > Hi, All,
> > I tried intel/s2600wf and faceboot/tiogapass, but neither of the final image has kcsbridge.
> >
> > I checked both machine/xxx.conf and found the line
> > PREFERRED_PROVIDER_virtual/obmc-host-ipmi-hw = "phosphor-ipmi-kcs".
> >
> > It seems that it should be built and included in the image.
> >
> > Anything wrong? Thanks.
>
> I ran into the same issue a while ago and didn't have the bandwidth at
> the time to debug it.
> I ended up explicitly adding the appropriate package to my images via:
>
>
> meta-MACHINENAME/recipes-phosphor/image/obmc-phosphor-image.bbappend
> OBMC_IMAGE_EXTRA_INSTALL_append_MACHINENAME = " phosphor-ipmi-kcs"

That was my workaround, but I'm replying mostly so that I make sure I
see the actual resolution to this :)
>
>
>
> >
> > Joe
