Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEEA4716B3
	for <lists+openbmc@lfdr.de>; Sat, 11 Dec 2021 22:22:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBLMc30Hmz3cJ9
	for <lists+openbmc@lfdr.de>; Sun, 12 Dec 2021 08:22:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LtcXpV4c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=LtcXpV4c; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBLMF0FTpz2yQK
 for <openbmc@lists.ozlabs.org>; Sun, 12 Dec 2021 08:22:15 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 13so18410498ljj.11
 for <openbmc@lists.ozlabs.org>; Sat, 11 Dec 2021 13:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2fcV1qIWXlXpt4seJvia/lEuHpt4qtSOH7Qy9wkZwxY=;
 b=LtcXpV4cDkuEymEm6e51UrjNgXgEtPNKf7SjAT50Mc8UJ0zdAfZecgq6D6M+QMIPvu
 hF9okakXSp0YhRl1bkP6E5cFaMDF9yzpXiShfFX04XMKJTHpC7cBPG0htG4UxTBAQSxQ
 VLWb4hKQ63wjQRgkw88XYY66Lsi22blTg/ksoAiQWytljWcbbK0IB0wVnKz2WekWRoqG
 Icf3t3iz75cmPJRLLiT/JkOXk+dQjsi91BBsW7SrXbLu/qiwFuMKOLkaAhUAm30vw+LN
 GwxgmXRuHSu41WJfOhgOv3gRdQHvtvVzFRIGGfySA1flYaOHGhqyL/zD3UNjJPogO8P5
 jlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2fcV1qIWXlXpt4seJvia/lEuHpt4qtSOH7Qy9wkZwxY=;
 b=dO4Qt6ZASKhMNesk49DVnAyhdUGOTHI7IOkn8xhZplOPcFx0CPTvwlxU8rpnSIuK8w
 ClNK4FbOYLBsELLDsxJWx5ubNVHbxZRRKGktn8Ar3ESSKE59pywQrlXZqSHw+0rkUhiE
 Mg/TOx7rxbINGCR0Ay59XQA1AcCcKXQk9S61djO20+rbT6BmdBRjk+17HwQti9sSh2nJ
 eZKQM6spo1CxqSu578uLj0sOnDBRoFy1O/vD/IlJDK2r81ZIwtmidFVpUXhsb+ZCvUXH
 3IQ+EJl0MZcUHuTTTM704nC4nHHJOszuJKuah6CZvj7UmW6xNDSvoWFLZCD2Rq/V/YV5
 K3Ow==
X-Gm-Message-State: AOAM530v6Uahh6ticHQdhT7krfsuPzKpNgNbS/2oZ+OgXJ/VUgffG6Or
 TPBCFHJGCJM64odcy50yccg+IS68y9XV9o/5CPjoug==
X-Google-Smtp-Source: ABdhPJwfXqgra/z42JC536RuAuXGA3GzhzJedCtZ8HuwKeP6CBM5Vv1K+8L511XFoPBpvzbG5QJYha5Sy1x8+xbXt0c=
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr20076090ljj.275.1639257730455; 
 Sat, 11 Dec 2021 13:22:10 -0800 (PST)
MIME-Version: 1.0
References: <3d3276b0-6408-88bf-94b1-5060e0fbeee7@linux.vnet.ibm.com>
 <9424b5c3-729d-a9f2-353e-546de7700c5d@linux.vnet.ibm.com>
 <CAH2-KxCbH76ByDPD2sOjL1S_x-7pn1-dKn7S7-ukfUzcgNhMfA@mail.gmail.com>
 <8122cf87625adf94b9e2f4374e405aeb40c21460.camel@fuzziesquirrel.com>
In-Reply-To: <8122cf87625adf94b9e2f4374e405aeb40c21460.camel@fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Sat, 11 Dec 2021 13:21:59 -0800
Message-ID: <CACWQX82YarT4DXa+qLc+8dYaT8GU-L1rEui00==m=V2v1jmnmA@mail.gmail.com>
Subject: Re: Control and uses of USB for BMC's own internal uses
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 Ed Tanous <edtanous@google.com>, apparao.puli@linux.intel.com,
 richard.marian.thomaiyar@linux.intel.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 19, 2021 at 6:46 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Mon, 2021-10-18 at 13:32 -0700, Ed Tanous wrote:
> > On Mon, Oct 18, 2021 at 11:36 AM Bruce Mitchell
> > <bruce.mitchell@linux.vnet.ibm.com> wrote:
> > >
> > > On 10/17/2021 11:55, Bruce Mitchell wrote:
> > > >
> > > >
> >
> > Some clarifying questions:
> > There are physically available USB A ports connected directly to the
> > BMC on IBM platforms?  Or are these traces within the board?
> > What are these direct bmc usb ports used for normally?
> >
> > Considering that while the BMC use case is likely IBM specific,
>
> Just curious - what makes you say this?

I don't know of any BMCs that actually expose the BMC USB to a
physical port.  There are lots that expose the USB to the host via
internally routed lines.  Maybe there are more than just IBM boards
that I've not seen before?

>
> > but
> > the idea of disabling a generic USB port isn't IBM specific, it seems
> > like we need a model for a USB port on dbus and relate it to the
> > various resources.  If and when a host interface wanted to implement a
> > similar feature, we'd be able to reuse it.
>
> The goal isn't really to disable a USB port.  It is to disable the
> assorted bits of software that run when a USB device of a specific class
> (mass storage, serial, etc) is plugged into it.  What would it even mean
> to disable a USB port?  Would it need to be powered off?

I know there's use cases for disabling the USB ports entirely for
preventing things like USB booting.  Yes, ideally they wouldn't even
provide power to avoid things like shorting it out to take the server
down, but I don't know of any implementations that do that.

>
