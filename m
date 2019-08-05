Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C38118E
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 07:25:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4625p00cVxzDqVd
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 15:25:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dkL0gTu8"; 
 dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4625nP0sXCzDqQd
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 15:25:11 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 62so52029226lfa.8
 for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2019 22:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tm+RiRf+QIE20ADxaB9H9H6FVZy2rNkqzOayDuYsXlg=;
 b=dkL0gTu8UJ2xFrz4UX+fEx3II2kD1v5+Oorfu6HQp/gyJhaSN4bchsG5/pkqjHCMaH
 ToUuGmau0abQRU9ZDZTl7yG5Pk/jAMlqG1IgqWt+icLlT4JGw6H/8n2rrghupCoyl4Bx
 tNQhq0FUCrqgN/qpa9a8I/GTHg5ld7A/tZ/oc0ruuEJz6GzhfPPwKBQnbB7fI/h/xZNq
 8ncNWCAY682qvX8ixrh1eh6Kd2uIM/Z/Spp4tl1YHqavv3oOzZj1FaP0nf2+lrAUEhIY
 Zn6hxRvehIsl+KrYkqaEx3jmkIQL4fEQEsiugocDS+eEp0n/fj//l/3FJajl7bRtpUA8
 9U3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tm+RiRf+QIE20ADxaB9H9H6FVZy2rNkqzOayDuYsXlg=;
 b=BI16lbw7lIMCWC8OYkkXsydP1cj3PJmdOuWGAn9qtj4xrcNzmV4B/nF4tU/BaCMYRU
 UzLw58c6QEfDDilRtPWdwbAsNvgyXTnvyXaD8/D/D8GgcVh9Kp0KtVdLg8ngcGQwEKBY
 B0pDNdqkkWF5Lhyl2/P7CzKHzBO4S21K8YDpLIPrwsUkSKcN/3um2FcuJRniNqBzdCDu
 WoU978blyBfpZWGslocmNsWWKoab67rfQ5sWDDPpa+DfF0eNvVYfLtWyKpQ9MbBgDuiX
 7w18IYKsG0nYDQ61T8NnCWx3TPAMc9GBF5yym0mUaAmdG3HvhXKl4fz4VksdQ3Bsx/0o
 LQzA==
X-Gm-Message-State: APjAAAXmi8P3vl26xtP1zvJEik9zoOzQjQGGUqnYmGD4SEgQuABySzJo
 DdzPaIAl6gIK5WfnfW4X9JazO+WIY2OZnoM/TPJoCA==
X-Google-Smtp-Source: APXvYqyP6YdH3V6GQ7B5XZqwTQW9EsJdc/oOODy7TmU2I9+JLSloy5653Igc/l91LBrk/k8/Ios7vmXWkuSgSmINZRc=
X-Received: by 2002:ac2:5dc3:: with SMTP id x3mr30913571lfq.168.1564982707545; 
 Sun, 04 Aug 2019 22:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <2819fa0b-82a2-0103-1451-6a41a9410339@fb.com>
 <CACPK8XcVdNMoksCc0OucgLw2-b7MWTNMyWwww-1=o7anC230sw@mail.gmail.com>
 <4f6cb0a1c1fdc3aec683b31aeb9e53b4a54266b2.camel@mendozajonas.com>
In-Reply-To: <4f6cb0a1c1fdc3aec683b31aeb9e53b4a54266b2.camel@mendozajonas.com>
From: William Kennington <wak@google.com>
Date: Sun, 4 Aug 2019 22:24:55 -0700
Message-ID: <CAPnigKn8mVnSXsCY+k+cQuEO2QKSDD3Ju7zfT_a0RyJQ0W_ZYw@mail.gmail.com>
Subject: Re: Calculate BMC MAC address from NCSI NIC's base MAC
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
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
Cc: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Something along these lines would be really nice for us since we
actually share the same MAC address with the BMC and the Host. So just
being able to configure an offset of 0 would be perfect for our
usecase if the rest of the state machine works the way we want.

On Sun, Aug 4, 2019 at 10:23 PM Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
>
> On Mon, 2019-08-05 at 04:29 +0000, Joel Stanley wrote:
> > Hi Tao,
> >
> > On Thu, 1 Aug 2019 at 21:15, Tao Ren <taoren@fb.com> wrote:
> > > Hi,
> > >
> > > I'm running Facebook Yamp AST2500 BMC and its MAC is connected to
> > > Broadcom NCSI-NIC. When CONFIG_NCSI_OEM_CMD_GET_MAC is enabled,
> > > BMC's MAC address is calculated by adding 1 to NCSI-NIC's base MAC.
> >
> > This would be a good question for the NCSI maintainers. I've added
> > Sam
> > and Jeremy to cc.
> >
> > > This adding-one logic doesn't work for Yamp because Host-BMC MAC
> > > offset needs to be 2. What would be the preferred way to fix it?
> > > For example:
> > >
> > > 1) adding a device tree node (such as "ncsi-bmc-mac-offset") and
> > > send it to ncsi stack when calling ncsi_register_dev?
> > >
> > > 2) adding a device tree node to be parsed in ncsi stack directly?
> > >
> > > 3) adding a KCONFIG option so it can be parsed in ncsi-rsp.c
> > > directly?
> > >
>
> Hi Tao,
>
> My first thought is that since this is an OEM-only extension enabled
> just by that config option, that perhaps a Kconfig option is the least
> obtrusive method to customise the increment.
> Any thoughts from other users?
>
> Sam
>
