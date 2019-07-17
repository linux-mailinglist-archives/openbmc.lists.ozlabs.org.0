Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988F6B4E5
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 05:11:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pMjr6Qf9zDqc4
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 13:11:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="EB8qdZkQ"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pMjJ4w8gzDqYp
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 13:10:58 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id 44so21816477qtg.11
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 20:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i3BWDgtEmDt3w9mL+ll7FrJTa6tpl8b5/pML6DqavRo=;
 b=EB8qdZkQWKyPDwieqc+lzAPNpB0T/KF9v+kVBpdavM8aI7kNTvP3Ih1pgxkseaOvuF
 o1ZKjC1l53ni7GlNAvHoIlq004dyzDhBsOyTNMWq2eqZ0j1XaP1pDn0+y7U63W4StH3M
 PBtVY46XxEYxoRsGa41RVlpfo/LuNdMk0A0DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i3BWDgtEmDt3w9mL+ll7FrJTa6tpl8b5/pML6DqavRo=;
 b=nnNL3lz/2K34OY0hh4doeCLk286QL/4vdeWTPaorlpZUGiP5UklbZzTS8SdpPo2gtz
 7+jF8jD10B/x+05A7jSMB6o1FG4hV/QxpawqREW0WYyqgcZM6I05et9tlbUzkLUjxCrf
 JxT1MgJU8du3HzPVrG+NPEPP9sARxCy70Cgj4Jli0R/FQhwf6GHnBJOy4hAIuSn28Nw/
 P2N2gzNgSmt6f+gMnJW/uoZFPSYPWLvRsTk8WF4cvwVjlhy54Yip/llQsXSaBMbCkYJZ
 JSsrKI0BySp5P7T2zgt5M/EfObdd+5G/rRL4YmCpQVhUW6XKPm2Sac0b9sTgCNUN5BRn
 vX7w==
X-Gm-Message-State: APjAAAVSeMcCRJNJCJHg8cS++fj+dHv+RoyjV6mf69MdSI1vmm7gJSKs
 QEJ3PLeXi32jaUxZmb+HwrSIh2H4uJo+JTQkjNQ=
X-Google-Smtp-Source: APXvYqzzORBlL9mOPveg/VmnBMj+LRfvYXsO1+Pfd+G/ElEx+EB52C9NV/9J5IffijvitVVgOipFv8nBYSxuU3MJ7CE=
X-Received: by 2002:ac8:1887:: with SMTP id s7mr25617076qtj.220.1563333055495; 
 Tue, 16 Jul 2019 20:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
In-Reply-To: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Jul 2019 03:10:42 +0000
Message-ID: <CACPK8XdkYbPB2+g9yjennzmOCq3Spe09HZVHxQaz0oP3JCZYjQ@mail.gmail.com>
Subject: Re: Out-of-band NIC management
To: Ben Wei <benwei@fb.com>, Sam Mendoza-Jonas <sam@mendozajonas.com>,
 Jeremy Kerr <jk@ozlabs.org>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jul 2019 at 21:46, Ben Wei <benwei@fb.com> wrote:
>
> Hi all,
>
> Would anyone be interested in collaborating on out-of-band NIC management and monitoring?
>
> DMTF has as a NCSI spec (https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.1.0.pdf), that defines a standard interface for BMCs to manage NICs.
> And in kernel 5.x , NC-SI driver supports Netlink interface for communicating with userspace processes.
>
> I'm thinking adding the following tools to OpenBMC as a starting point and build form there:
>
>       1. A command line utility (e.g. ncsi-util) to send raw NC-SI commands, useful for debugging and initial NIC bring up,
>       For example:
>           ncsi-util -eth0 -ch 0 <raw NC-SI command>

The NCSI kernel maintainer, Sam, has written a tool that fits this descirption:

 https://github.com/sammj/ncsi-netlink

>
>       We can further extend this command line tool to support other management interfaces, e.g sending MCTP or PLDM commands to NIC.

I have added Jeremy to cc, who has been doing some MCTP related work recently.

>
>       2. A daemon running on OpenBMC (e.g ncsid) monitoring NIC status,  for example:
>           a. Query and log NIC capability and current parameter setting
>           b. Periodically check NIC link status, re-initialize NC-SI link if NIC is unreachable, log the status
>           c. Enable and monitor NIC Asynchronous Event Notifications (AENs)
>                 i. such as  Link Status Change, Configuration required, Host driver status change
>                 ii. there are OEM-specific AENs that BMC may also enable and monitor
>                 iii. either log these events, and/or performs recovery and remediation as needed
>           d. Additional monitoring such as
>                 i.  temperature (not in standard NC-SI command yet),
>                 ii. firmware version, update event, network traffic statistics
>
> Both the CLI tool and the monitoring daemon can either communicate to kernel driver directly via Netlink independently, or we can have the ncsi daemon acting as command serializer to kernel and other user space processes.
> These are just some of my initial thoughts and I'd love to hear some feedback if these would be useful to OpenBMC.
>
> If anyone in interested in collaborate on these we can discuss more on features and design details.
>
> Regards,
> -Ben
