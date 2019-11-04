Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E66C7EF0DD
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 23:58:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Ss80XhszF4L4
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 09:58:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+UZ7Dbn"; 
 dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476SrS0yBvzF4L4
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 09:58:14 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id x14so3409267ybq.12
 for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2019 14:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p0KdfpO1cpfUB8GVEgdJXg6YwIy1VLLFR6ZETpwU76Y=;
 b=c+UZ7DbnCESNL29+ikm/kOEKIdNm+2Jwqf4YQ25il/AW4MLxHdfLY3i1Jr2gVrn0dN
 Ptlxzq1SlK8EYcOZ2EzGYuwKEvGLpAE3rt2VaqGH8O2NYzQIriWVJzkglOe/IWgop0j5
 wZlTSC3w1a3O+40kEBxds3T1ekjG793AvLzWUU7baa36JmRISioaABCdUL828GpDVWkM
 iD6PPmt3jCDlmaikGhaZKWXsDYvlhShCh16K6q3SB0PZckO89n9KGIlAQfa4oPIF0D0B
 SJQU6VrKnUyPM/edxPquQ9W96xEzE5KQqITu3F5JhzHbVI+OcOrXuf6lli9RzbjtTfC0
 6qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p0KdfpO1cpfUB8GVEgdJXg6YwIy1VLLFR6ZETpwU76Y=;
 b=HoxYCEyN3zXXR9t0tkGYkUWJopSSzvxivgZmkHmbmgAanvAuoWN81on7RsiaxIRQh9
 bemAM1rsEU9/jT1K97TW2WWDiQBissjo4vtvn0JOarfuAJ1/MqhtkGk6fEHgRz8zfQ3o
 574u4xGWY2pt4VGj0E62e+CUkMi0jny5j4fHhwxSHcgH1jUZf4O3dx/fkRKhTPtLFu0k
 pJEb6qxJ4qhT37PlYcsBPmHHV5JZRqE51uC4L9w/WCPWipLnn+C35iVaajXnrLu4aBBL
 Q8Vm59xPpN/vCG1duWHxNGeBKoCEuVSYx7phh9GaMF/U5fm3xsr28PUj/f9AYIvFKVZl
 QVCg==
X-Gm-Message-State: APjAAAWI1YGs90CjwfqdqbWEGKbX8uwXlMyn3pUM8oPlSQAu9YhYAawB
 Apl1ipmiBhMWQGSTWR9c49TwS4tYeqY1BOu1JHs=
X-Google-Smtp-Source: APXvYqx4QNF91ANgi4zXRFn9/w0xz2O8q84tSMnmksfQQayWtwf6wp0w4Z6GB86lkDGyE3gZywCpBadqK7i81L+ePlM=
X-Received: by 2002:a25:8046:: with SMTP id a6mr1554020ybn.296.1572908290653; 
 Mon, 04 Nov 2019 14:58:10 -0800 (PST)
MIME-Version: 1.0
References: <CAMTupoQThp=WRfdH+QHwmqP1ZqbgCKq81rS8Cp+0sYKQfNe4Sg@mail.gmail.com>
 <CAMTupoSxchLJuFUjpmVu=7jS=M1H0OTTnWkUP3SNkvs8=R3uTA@mail.gmail.com>
 <c4ba9973-6a6c-8ce9-f66d-553404b00340@linux.ibm.com>
 <4f21c5af-2697-07ab-b17b-084bcf131a2f@linux.vnet.ibm.com>
In-Reply-To: <4f21c5af-2697-07ab-b17b-084bcf131a2f@linux.vnet.ibm.com>
From: Jandra A <jandraara@gmail.com>
Date: Mon, 4 Nov 2019 16:57:59 -0600
Message-ID: <CAMTupoSKqqs3ZznfCu6T-R8ApqM2knaHpc5J+8Kj46SmmqpK1g@mail.gmail.com>
Subject: Re: Resend : Enable/disable access to BMC through interfaces for
 security
To: Justin Thaler <thalerj@linux.vnet.ibm.com>
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

Thank you Joseph and Justin. I am keeping track of all of these to
discuss in the Security Workgroup.

Another thing to think about is where we and customers would want this
type of functionality to live within the GUI. As of now, the proposal
is to create a new panel dedicated to Security within the Access
Control category of the navigation.

Regards,
Jandra

On Fri, Nov 1, 2019 at 12:46 PM Justin Thaler
<thalerj@linux.vnet.ibm.com> wrote:
>
> Hi Jandra, I'm interested in the subject blow. Joseph, I've added a few
> more options to your list as well.
>
>  > On 11/1/19 11:55 AM, Joseph Reynolds wrote:
> > On 11/1/19 9:40 AM, Jandra A wrote:
> >> I am resending this message to who has thoughts on which BMC
> >> interfaces need to be disabled for security purposes and what the best
> >> way to do that would be. I would love to collaborate with all parties
> >> interested.
> >
> > Thanks Jandra.  I've added this to the OpenBMC Security Working Group
> > agenda.
> > https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
> >
> >
> >> ------- begin message:
> >>
> >> Hello all,
> >>
> >> As part of the GUI design team, I am starting to look at requirements
> >> for enabling and disabling network interfaces for which the BMC can be
> >> accessed. For example, IPMI, SSH, Redfish, HTTP, and USB, to name a
> >> few.
> >>
> >> I know there has been some conversation on the topic before (see email
> >> linked below) and want to reach out to see who is interested in this
> >> topic. And I would love to get your thoughts on the following topics.
> >>
> >> Some questions we want to tackle are:
> >> 1. Which interfaces need to be enabled/disabled and what is their
> >> priority? (See full list in the redfish documentation)
> >> 2. What should be the default for the selected above (enabled/disabled)?
> >> 3. Do we need a staged plan for it?
> >> 4. When can we expect backend availability?
> >
> > I am interested in the list of the BMC's external interfaces from a
> > security perspective.  The [network security considerations][] talks
> > about many of the network interfaces.  We should encourage users to
> > disable interfaces they don't need and are not using.  Having such
> > interfaces active opens up the BMC's attack surface and represents
> > security risks.  For example, newly discovered security vulnerabilities
> > might place BMCs at risk, and shutting off the interface will likely
> > make the BMC safe.
> >
> > The BMC also has physical interfaces which users may wish to disable
> > (for the same reasons as above).  The BMC's network interface and and
> > USB ports are examples.  Some users may wish to disable the BMC's access
> > to the network and control it solely via its host. However, I am not an
> > exert in this area, so I need help here.  TODO: Get one of the kernel
> > hackers to go over this list.  I understand because OpenBMC is used on
> > different hardware models (such as AST2500's hosted in the AC922
> > "Witherspoon"), it will have different interfaces present.  I think the
> > folks who wirj with the machines, and who bind device drivers can help
> > us if we know what questions to ask them (better questions than: what
> > interfaces does the BMC have)?  <-- Once again, I am no expert here, so
> > we need to work together to understand this.
> >
> > Here's my starter kit of BMC's external interfaces:
> > network:
> >   - SSH to the BMC shell (port 22)
> >   - HTTP (for either [BMCWEB_INSECURE_DISABLE_SSL][] users or the
> > nascent [HTTP redirect design][])
> >   - HTTPS
>      - Secure Websockets
> >   - (network, aka out of band) IPMI
>      - Extend REST APIs
>      - Redfish
> >   - KVMIP
> >   - Virtual media
> >   - SoL (SSH via port 2200) to the host console
> >   - mDNS discovery
> >   - Avahi discovery service
> >   - virtual USB (USB-over-IP)
> > physical:
> >   - network
>      - USB External
>      - USB to Host
> >   - more? Help needed: would anyone want to give the BMC admin control
> > to shut down pathways between the BMC and host?
> >
> > There will be more interfaces as the project goes forward.  For example,
> > the OpenPOWER work is proposing a communication channel between a
> > Hardware Management Console (HMC) and the host's hypervisor (PHYP) which
> > would use the BMC to set up the channel. Users who don't need this a
> > capability might want to have a way to disable it (I don't know) so they
> > can avoid giving unnecessary network access to their hypervisor.  The
> > point is, I think tending this list will be ongoing work.
> >
> > The short list of interfaces I personally care about includes:
> >    SSH, IPMI, Avahi, and USB (physical and USB-over-IP)
> >
> > I hope this partially addresses item 1 above.  :)
> >
> > - Joseph
> >
> > References:
> > [network security considerations]:
> > https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md
> >
> > [BMCWEB_INSECURE_DISABLE_SSL]:
> > https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt
> > [HTTP redirect design]:
> > https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173
> >
> >>
> >> Redfish documentation:
> >> https://redfish.dmtf.org/schemas/ManagerNetworkProtocol.v1_4_0.json
> >>
> >> Related email discussion (on staged plans to address IPMI access):
> >> https://lists.ozlabs.org/pipermail/openbmc/2019-September/018373.html
> >>
> >>
> >>
> >> Regards,
> >> Jandra Aranguren
> >
