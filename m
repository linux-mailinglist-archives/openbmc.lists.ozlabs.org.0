Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2754620782
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 15:02:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454WmX1bfmzDqbp
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 23:02:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ncwKZLjW"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Wl40hrVzDqb1
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 23:01:19 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id a132so2446890oib.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZrLIkedvgLUtU0vOg22+UhwNBWCvMEOU3nBz4z4tkwA=;
 b=ncwKZLjWPczXCkmAqDahG5WpXxu2zXMVWivAZWSrCtkk2HjcV1hJHmBZ9iK5KxBlFv
 qtVOGsb7JF1aDQm+DmBEES4r2J9CKp7j9IN1rGvWJkKPofjd29oMWfolfgfVWxJY39Ys
 uWiKwiO6zHBYgdOv0tYxPd62lEpwU3pt4qfGJpNw9ijwnx8ebxK9FlDfYNDA/JbIIlsI
 y4nqBYq6ZqlvyB0V3I58soalccb7iJE/VE7dHwxLdg0ZXjMrQsfeQN86e5va/1hfflVg
 qPP7S+CElVgCy5DJ78JO2rA/wZQgyLe7XCdO0lusjgKVztHhwcJiOiIbVmjnXPa+QtKi
 mMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZrLIkedvgLUtU0vOg22+UhwNBWCvMEOU3nBz4z4tkwA=;
 b=IYt3kjIWeQHcaAmQkzg5B94LosM1BqqT/gb/Vw99R81RQsC/NFInYa3SkbV3cQ/re9
 9sNQOP6K7I+4I6RhKcTvF0X/WwPlWNVlmK4UCia0uO3ri431tfHDyVTxs0RP9O6sp0Kx
 jIzV58n0hyKriW+hPspZOpokwsbK2rOH1QmnZmpfopEr7JdUZ26fJBiCI+IbH+eIK7oT
 Gy89jn1yv7YrU6LwXeZVHHs8su7pv+6JX20wS54H3RhQr/ABn5O1RUD2sj3cJ64ur02Z
 r7whjwC8SqdTCAzu75UN+++blJxO1QgEIPaglb9oNoJE9cAaSftecpZFWz/c8JO+wYCh
 vMkA==
X-Gm-Message-State: APjAAAVyqcsRohETi6o00E92AhM0gxn4tvjqBlGPt0Hx+575WN1rmcUr
 6hkVYDwVDv8/2jQ3yP9pCQu0jL4kvohRXkNCmk8=
X-Google-Smtp-Source: APXvYqysOy9l3CSdy7nB8csdsdzXFlBOXok2x2boe51t4iFQZE6JDoccVc9FVyenvrldgUYlAj7ohZLVoayfscGcb5Q=
X-Received: by 2002:aca:3289:: with SMTP id y131mr2503434oiy.42.1558011676211; 
 Thu, 16 May 2019 06:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <CACkAXSqktuOVy02_R9q4iWcTL=_v7iOrxoBOOCMb5xTAXnxREg@mail.gmail.com>
 <c8826cab-42d1-85d7-4eb0-50e79857a205@linux.vnet.ibm.com>
In-Reply-To: <c8826cab-42d1-85d7-4eb0-50e79857a205@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 16 May 2019 08:01:00 -0500
Message-ID: <CALLMt=q+PHM09zDeM5hBGRm7sTmPF42QSo6fYB=CmL5DHP_rKg@mail.gmail.com>
Subject: Re: Add support to debug unresponsive host
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jayanth Othayoth <ojayanth@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 16, 2019 at 1:36 AM Deepak Kodihalli
<dkodihal@linux.vnet.ibm.com> wrote:
>
> On 15/05/19 6:09 PM, Jayanth Othayoth wrote:
> > ## Problem Description
> > Issue #457:  Add support to debug unresponsive host.
> >
> > Scope: High level design direction to solve this problem,
> >
> > ## Background and References
> > There are situation at customer places where OPAL/Linux goes
> > unresponsive causing a system hang. And there is no way to figure out
> > what went wrong with Linux kernel or OPAL. Looking for a way to trigger
> > a dump capture on Linux host so that we can capture the OS dump for pos=
t
> > analysis.
> >
> > ## Proposed Design for POWER processor based systems:
> > Get all Host CPUs in reset vector and Linux then has a mechanism to
> > patch it into panic-kdump path to trigger dump capture. This will enabl=
e
> > us to analyze and fix customer issue where we see Linux hang and
> > unresponsive system.
> >
> > ### Redfish Schema used:
> > * Reference: DSP2046 2018.3,
> > * ComputerSystem 1.6.0 schema provides an action called
> > #ComputerSystem.Reset=E2=80=9D, This action is used to reset the system=
.
> > ResetType parameter is used  for indicating type of reset need to be
> > performed. In this use case we can use =E2=80=9CNmi=E2=80=9D type
> >      * Nmi: Generate a Diagnostic Interrupt (usually an NMI on x86
> > systems) to cease normal operations, perform diagnostic actions and
> > typically halt the system.
> > * ### d-bus :
> >
> > Option 1:   Extending  the existing  d-bus interface  state.Host  name
> > space (
> > /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/State/Host.interf=
ace.yaml
> > ) to support new RequestedHostTransition property called  =E2=80=9CNmi=
=E2=80=9D.   d-bus
> > backend can internally invoke processor specific target to do Sreset(
> > equivalent to x86 NMI) and associated  actions.
>
> I don't prefer this option, because this would mean adding host specific
> code in phoshor-state-manager, which I think until now is host agnostic.

Yeah, this was my main concern with tying it into phosphor-state-manager.
The fact Redfish put it in with their other state related commands (which
are implemented by phosphor-state-manager) is the only reason I'm a little
wishy-washy here. We could just create a generic systemd target "host-nmi"
or something and phosphor-state-manager could just call that to abstract
any of the specifics, but it sill doesn't really feel like it fits to me.

I think I prefer option 2, and then we can just map bmcweb to that API when
the Redfish command comes in. Sounds like for ppc64 systems we can just
use pdbg to issue the NMI.

> So for that reason, Option 2 sounds better. There are some good
> questions from Neeraj as well, so I would suggest adding this as a
> design template on Gerrit to gather better feedback.
>
> Thanks,
> Deepak
>
> > Option 2: Introducing new d-bus interface in the control.state namespac=
e
> > (
> > /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/Control/Host/NMI.=
interface.yaml)
> > namespace and implement the new d-bus back-end for respective  processo=
r
> > specific targets.
>
