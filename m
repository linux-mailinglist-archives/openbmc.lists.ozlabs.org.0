Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A88CED60
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 22:23:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nBkp2rKzzDqMT
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 07:23:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="s9OKghsd"; 
 dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nBkD0WwyzDqLN
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 07:22:59 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id q10so31664811iop.2
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 13:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xpRtcItye3u6RGpN6w1JdyANSTs/2ZvGEqFugOw/cqY=;
 b=s9OKghsdtkD6p2dWINqSfURMlbE+E5KJYFny7Nr+KvPVkGMGMbS0khdKNGKOSWYDpZ
 HWBgk8iw14X4RONvM7KbAruOlee6DsJtEjstJFHzi0bgwZ0OuF5osdkARR9licKe+Eaa
 J+o0eMuQ20Zr11e4UCaCLmxBYaqc9oIXWe02IfUj91wsr9TonY64Mk0PHfa8ZYc3IBXb
 4HvC+kxEu7TG1mUiKPactNsr2uovv+gq/3M57QHFXET59fDqOg1goRvf2WC3/tSPmhhK
 A7NSsGrGYBb8zpn339TwmrYs8o+Xoo2bKavdPZrfdI50wWC3zPPXpFyqEVBbQmySIFQ2
 iO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xpRtcItye3u6RGpN6w1JdyANSTs/2ZvGEqFugOw/cqY=;
 b=j+Pl3dFDoLTnPG2yq5lzmh6V4dXzoze82yRNvM3zKSeYs9b0lKC0G3UlLrClVNLbMM
 nRTAQDM5k0lWDq51Ye1yNvgJNbI8ukFj+GmYLNrLkFdpu8bA9pvfmCNJWFTs647fNtMt
 hVh4JjyrhUCcCRJk1WsjrswkCJ6+k+Fae976KnAxfJ5xtG/D7oJIuqq69PcOVKp/iFvl
 DAUuSDCqBUhayoUdttuHG0speqPGJ2Brrwl2kz7UQIFyam4VXurRfRoX1W+K+gGC8IWq
 d07E437sxqMvwRAzw0AgU+ks5WVSnLqNgOl70lyUauoQVmqjldp4xBjWQ3cyoHWfACgJ
 GM/w==
X-Gm-Message-State: APjAAAWQzlE7RQxxMq9hXNnQ+Cxs4INIBp/yu1rDtmfeRif12kDV6L3l
 J/fDrpwOb29P4vCvWfoy5496Do4MWopag6nAMn4d6w==
X-Google-Smtp-Source: APXvYqwiWA0nNN91sECvBmt1oGOUv1ulf0cltyMACzeJf2LoduEAVf59L4lvLeaCh/1mkq+YDCYjWsjYKnVF8yqRoM0=
X-Received: by 2002:a6b:e016:: with SMTP id z22mr12427615iog.59.1570479775869; 
 Mon, 07 Oct 2019 13:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <7050D8BB-A7B0-4CA5-AA56-8AB61D762AEB@fuzziesquirrel.com>
 <CAPnigK=c+rpWLtB7XbaPPM3s2V8TAbgRgqKChUTKkNpUtC836Q@mail.gmail.com>
In-Reply-To: <CAPnigK=c+rpWLtB7XbaPPM3s2V8TAbgRgqKChUTKkNpUtC836Q@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 7 Oct 2019 13:22:29 -0700
Message-ID: <CAGMNF6VCJxS_ewJkpvGAUwtiJrgVUSp2ajeVeN+k7hZoiXj8gg@mail.gmail.com>
Subject: Re: unit test build failure in phosphor-hwmon
To: William Kennington <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, wangkair@cn.ibm.com,
 Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

What's the test build error message with meson?

On Mon, Oct 7, 2019 at 1:05 PM William Kennington <wak@google.com> wrote:
>
> Well, the unit test environment is using gcc 9.x.x for what that's worth.
>
> On Mon, Oct 7, 2019 at 1:02 PM Brad Bishop <bradleyb@fuzziesquirrel.com> =
wrote:
> >
> > I was trying to get meson going in phosphor-hwmon today and I stumbled =
on a
> > unit test that doesn=E2=80=99t build under gcc 9.1.0.  The failing test=
 is the
> > average test.
> >
> > I just thought I=E2=80=99d quick throw this out there in case anyone fe=
els like
> > having a look.  Also, I think this means our repository CI environment =
has
> > gotten out of sync with upstream Yocto?
> >
> > I realize =E2=80=9Cpatches welcome=E2=80=9D applies here for both issue=
s :-) but I just
> > wanted to broadcast them.
> >
> > thx -brad



--=20
Regards,
Kun
