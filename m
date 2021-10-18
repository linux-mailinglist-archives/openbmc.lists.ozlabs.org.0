Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E394328FB
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 23:19:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY8sB10G8z2yg1
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 08:19:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=f3MDwg+6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=f3MDwg+6; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY8rn4ZzZz2yNr
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 08:19:20 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id v17so43711330wrv.9
 for <openbmc@lists.ozlabs.org>; Mon, 18 Oct 2021 14:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1r0XaGlqSpGfma1WI4Ovyywzhj50UQIcEf14v++KT0M=;
 b=f3MDwg+6cAclk9a6cLWPrupByyrEY4l5h/rI2IB9AWPebwDR1fTsv/4g6wD2YJOLHf
 tqoi5/lpGWdST3lT80o0n+jTIYPZlTQiVkZAIMJY+X+uu7aMTEeJVPLGXLga++ktiom0
 EcAyiYcjrRpPGU4LcSTyvfOPshXQF2YrRLrTlUWIzRchcKkVen3YG+ZisbyfN4Y3jz+I
 NcQxszyx0KqJMOHhU5CDxgzWT5dzxdJpPrkhrJ90bSnblLMkads6/yggJm5KaEllkOD7
 LRMV8M9y+HTm8wqXkDA6Q426kQXSHqIUqVjlF886W05i7QbqfOJ54hN5JZJUEijEPN8+
 hRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1r0XaGlqSpGfma1WI4Ovyywzhj50UQIcEf14v++KT0M=;
 b=VIYz3NzQwOOpC7Ek3jpXdc0FvcqbD2jrGWQEjicPf0J4U6m+of55ERXfoT8TtnNbgX
 dIID+SX92yc+bgbKzUNxslVX8Q6DPBjVz823hUI092fBDKXVbIY54tZ/M8yp3MUPSwkK
 IygYFxe6je74FC15QA6yYd4g5SWHaZc3MhDCtBPLc8bprkdeKkCpLZnxY+rQ+dzsNoJF
 eMwuLOjxo4rBDrBFidd4ra2aIr3ed+yBzYz1YTri1Ag0gSZN0ZhS3Z6Kolkem9yWZXdg
 TKUenbz8mJRCprb3gAO291KYPx5b0AT/ue1YavyZE5jZx0EGgfQzMorUEBNvmPPihlQv
 OB7g==
X-Gm-Message-State: AOAM5310baOq+V3Q4COZZnBlJq5eaHFL/XdA/6wnbKwDBTUJP+5+199F
 oPdpwM8a8ecttgSDChzBbDn8w+VRrXcxZ4pk0hCRIw==
X-Google-Smtp-Source: ABdhPJz4IHbXuCdlGyVCx59ZzIFrXM5ZT1ivJMO2pUCSusBLJXwsZ67BNxTPQMNnbPs+Qmq6Cm7Et6J9u57li2tn6x8=
X-Received: by 2002:adf:a78a:: with SMTP id j10mr39409398wrc.105.1634591956429; 
 Mon, 18 Oct 2021 14:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <3d3276b0-6408-88bf-94b1-5060e0fbeee7@linux.vnet.ibm.com>
 <9424b5c3-729d-a9f2-353e-546de7700c5d@linux.vnet.ibm.com>
 <CAH2-KxCbH76ByDPD2sOjL1S_x-7pn1-dKn7S7-ukfUzcgNhMfA@mail.gmail.com>
 <d3f90413-f3e8-a5cf-4d3c-47c99d4cca4e@linux.vnet.ibm.com>
In-Reply-To: <d3f90413-f3e8-a5cf-4d3c-47c99d4cca4e@linux.vnet.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 18 Oct 2021 14:19:05 -0700
Message-ID: <CAH2-KxDyAU_ziv9rD0o28KoowWe8H7fYMFCd3YnvnYShm8OCkg@mail.gmail.com>
Subject: Re: Control and uses of USB for BMC's own internal uses
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 richard.marian.thomaiyar@linux.intel.com, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 18, 2021 at 2:15 PM Bruce Mitchell
<bruce.mitchell@linux.vnet.ibm.com> wrote:
>
> On 10/18/2021 13:32, Ed Tanous wrote:
> > On Mon, Oct 18, 2021 at 11:36 AM Bruce Mitchell
> > <bruce.mitchell@linux.vnet.ibm.com> wrote:
> >>
> >> On 10/17/2021 11:55, Bruce Mitchell wrote:
> >>> This thread BMC's USB means for the BMC's own uses
> >>> not for Host's uses nor to provide services to the
> >>> Host.  Thus, if I said "Disable the BMC's USB" that
> >>> would not impact the Host in any fashion.
> >>>
> >>> I need to be able to control the BMC's USB ports
> >>> to prevent BMC uses of USB Pen Drive updates and
> >>> independently prevent the BMC uses of USB serial
> >>> cable for UPS.  As well as re-enable those usages.
> >>>
> >>> Clearly in this Gerrit review the term Disabled was
> >>> not defined.  47180: bmc-usb: property to track usb state
> >>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47180
> >>>
> >>>
> >>> Also, since this is related to security of the BMC
> >>> my intent was to offer the users a clear way to
> >>> achieve the control of the BMC's USB ports without
> >>> the users needing to know any of the Servers' USB
> >>> topology.  I personally find complicated user options
> >>> for features adds risk to the system security.
> >>>
> >>> A recommendation I have receive is to use phosphor-state-manager.
> >>>
> >
> > Some clarifying questions:
> > There are physically available USB A ports connected directly to the
> > BMC on IBM platforms?  Or are these traces within the board?
> > What are these direct bmc usb ports used for normally?
> >
> > Considering that while the BMC use case is likely IBM specific, but
> > the idea of disabling a generic USB port isn't IBM specific, it seems
> > like we need a model for a USB port on dbus and relate it to the
> > various resources.  If and when a host interface wanted to implement a
> > similar feature, we'd be able to reuse it.
> >
>
> Yes, theses are physically available USB A ports directly connected
> to the BMC on IBM platforms.
> No, these are not traces within the board; "anyone can walk up and
> plugin a USB stick".
> USB Flash drive for firmware update of the BMC is the first uses case
> the second uses case is to talk to a UPS via a USB to Serial port.
>
> Please clarify "generic USB port".  From my perspective there are
> USB Ports to be used "owned" by the BMC's firmware and there are
> USB Ports to be used "owned" by the Host.  I know of no USB Ports that
> are shared by the BMC and the Host (I know that the physical BMC
> provides SIO and thus some USB ports as well to the Host in many
> situations, I see them as Host owned USB Ports).

There are platforms that have USB ports connected between the host and
BMC.  The point is, regardless of the owner, we should have a common
interface for it such that when and if "out of band host USB port
disabling" comes, we can simply implement the same interface and have
the code be very similar.  This is the same pattern we follow for
almost all other interfaces, so it should be pretty straightforward to
represent.

>
> >>> Also, from what I have observed this control of the
> >>> BMC's USB ports may be unique to my company (IBM).
> >>> And thus, an OEM solution may be best.
> >
> > Keep in mind, you'll need a new schema and collection for these
> > things;  I'd recommend starting up a thread with DMTF about getting
> > those added.  Keep in mind, they already have the "port" schema, which
> > might fulfill the need, although it doesn't have a USB enumeration, so
> > it's possible that's an intentional omission.
> >
> > https://github.com/openbmc/bmcweb/blob/master/OEM_SCHEMAS.md
> >
>
> I am going to let Brad address this one.
>
> >>>
> >>> Does anyone else have a need or desire to control the
> >>> BMC's USB ports?
> >>
> >> Also suggested utilize https://github.com/openbmc/service-config-manager
> >> to disable/enable the service and make it like enable/disable SSH
> >> via Redfish via bmcweb
>
