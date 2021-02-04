Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5761F30EF90
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 10:25:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWY7J2vyTzDqRr
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 20:25:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::930;
 helo=mail-ua1-x930.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Axd1AbTP; dkim-atps=neutral
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWY645PpczDwtw
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 20:24:28 +1100 (AEDT)
Received: by mail-ua1-x930.google.com with SMTP id g5so705791uak.10
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 01:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=gHboaXHI/c6YZ/NfJomxZ+QZpKiTZsi+ib0OPrUnOus=;
 b=Axd1AbTPSpMjgg37lAlZEqY4I79EjHA6+dzO6WaVMtMWNYrBnvNcbmezOOYhB9ARx4
 qBnK9zpJUVi4vausmSULAEcsrwhdBkt75jU8D1yN8DHLqQ0Y55vUuySuklBBOhZTWX3F
 MXyRRGW6sEPzsncJ+ZHT16r+2HNUQN9VZPJknW4msxw98gHiJBUXqtVl1uNFcUVUcZWG
 p8PpOMvaBh0Q4Ke9AN/fLp1F8nDhpd1zYAY/bw9lMzMHFX4sx7OuA5hcPjAhMIgtwZlK
 lgby7G7eSwkDKA0Me4/SFLu/wCvc4J+WeNX1c6WKLgAP1I2KXBsxxO8EU0LdjvGLjTSP
 EjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=gHboaXHI/c6YZ/NfJomxZ+QZpKiTZsi+ib0OPrUnOus=;
 b=c7iYqUrTz88rhaJBkOC5xi9in3EifFYCFeEDQ/P2Rb4LuzLveLQdG0xrbqWro6urqp
 ddt6MUyS/sLR9yJ7x933Me5BzBmXumzTCUysQswLZ4F5NTPq7zzdRrLQMRllWW4+abj0
 qt7XMIUK+LMUc1b5srtkc1KrBvGnY66iij/TC2+HkRB0RC45cCKtnid3gC665TTgy78W
 6n9nRIi/fGbd4wOJrJ8yB06jREmtsDP7hxZNQhuj/+e3E1spaKh8m7p1vV7Go701wISY
 yBJFI7r1HF4RmDeCWAmPkh3ryOvmhLV1uvL4+F2mysbdvgrWTcGklqZPE1DFfyvz+43o
 Y/jA==
X-Gm-Message-State: AOAM530ZJ/oEZ1VQfjrpg7A7a5diuGm1/cEvOxAEWwkN9kREsKgEvHC5
 lVCxgwVw6Gid87QLzY5hzH53a/Rc1x+T9YZafmc=
X-Google-Smtp-Source: ABdhPJzoON/fnY3Vw0biWwKguYk2Cbanw2ZYzmEUglG8X81KDJ1mr+U4qomFyRb/YRw8Qf1mdFu1eRjXW5xI/RKZYlE=
X-Received: by 2002:ab0:3142:: with SMTP id e2mr576967uam.110.1612430664191;
 Thu, 04 Feb 2021 01:24:24 -0800 (PST)
MIME-Version: 1.0
References: <147C026D-F12B-4D9F-A926-6F2DAD5E1B69@gmail.com>
 <CAM=TmwVQBNpdt3y34egQTkxfaJRNiT4LX+U6O_yFnBXiUpM38w@mail.gmail.com>
In-Reply-To: <CAM=TmwVQBNpdt3y34egQTkxfaJRNiT4LX+U6O_yFnBXiUpM38w@mail.gmail.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Thu, 4 Feb 2021 14:54:13 +0530
Message-ID: <CAM=TmwV0ayipSQoiNeU8h66FjPtcp=ww6UVyVYWsvmgzRP0jTw@mail.gmail.com>
Subject: Re: Redfish BIOS vs. PLDM BIOS
To: Andrew Geissler <geissonator@gmail.com>, openbmc@lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Forgot to copy the list.

On Thu, Feb 4, 2021 at 1:16 PM Deepak Kodihalli
<deepak.kodihalli.83@gmail.com> wrote:
>
> Hi Andrew,
>
> On Wed, Feb 3, 2021 at 10:35 PM Andrew Geissler <geissonator@gmail.com> wrote:
> >
> > We at IBM ran into an issue recently around BIOS entries.
> >
> > We have a PLDM BIOS entry, pvm_stop_at_standby, which is used to tell the host
> > whether it should stop in a setup/standby state or continue to boot all the
> > way up to the operating systems.
> >
> > We had identified a Redfish API[1] that fit with this function and mapped that
> > API to a D-Bus property which was then used by PLDM to fill in this BIOS
> > attribute.
> >
> > Recently though we've been working on incorporating the bios-settings-mgr into
> > our code and into PLDM. That provides a generic Redfish API for setting these
> > BIOS values using key,value pairs.
> >
> > The issue is that we now have a BIOS value, pvm_stop_at_standby, defined within
> > this generic schema that should not be set via the Redfish BIOS interface but
> > instead set via the Systems/system BootSource API we've been using all along.
> >
> > We've found some other BIOS attributes like this as well, where PLDM has defined
> > something as a BIOS value but there is a non-BIOS interface in Redfish to
> > manipulate it. I believe this email thread from Ratan/Manoj is similar [2]
> >
> > We were brainstorming a bit and the best solution seems to be to break up
> > the PLDM BIOS values. Either put the one's backed by non-BIOS Redfish API's into
> > a separate file or name them in a way they can be easily filtered. PLDM then
> > only reports the real BIOS values to bios-settings-mgr and therefore Redfish
> > will only shows this as settable via the generic BIOS Redfish interface.
> > From a host perspective, they all look like BIOS values but how they are set
> > via Redfish would differ based on the the type of BIOS value noted above.
> >
> > PLDM would need to support both the generic bios-settings-mgr BIOS values as
> > well as these other D-Bus backed ones.
> >
> > Thoughts? Sampa is going to get a discord chat going but there's a lot of
> > background here so figured I'd send that out via email.
>
> As you've described, this is really a problem because there are
> multiple APIs within Redish to set these attributes, and to the host
> firmware these are all BIOS attributes. What's the issue if these
> attributes are also included in the Redfish generic BIOS model? The
> pldm daemon should be able to associate BIOS attributes to the
> bios-settings-mgr D-Bus model and/or other D-Bus models. However, I'm
> not sure if we really want to tackle the complexity of excluding
> certain attributes from the bios-settings-mgr D-Bus model.
>
> Thanks,
> Deepak
