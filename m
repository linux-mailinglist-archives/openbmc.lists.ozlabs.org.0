Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83312337292
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 13:30:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx7Z83rrtz3cZh
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 23:30:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=epGaIwAA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2e;
 helo=mail-vs1-xe2e.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=epGaIwAA; dkim-atps=neutral
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx7Ys182xz3cKK
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 23:29:51 +1100 (AEDT)
Received: by mail-vs1-xe2e.google.com with SMTP id p24so10552778vsj.13
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 04:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dkfrdjFNGxQXc8+BXhKnScqIbqRrz8taQsHWkKuh744=;
 b=epGaIwAA4LG5mJ+2CAfLYNDqyrEcoY2nYg/kbtR09lfJ6em8V7LSzXuTS+TmzH48Uj
 R9HZwi0N6ffnTVqlv95jYlBItUUmudNo4b3RQIKbmWWj+L2KxZVn1PvrTPoFPqxmtcMY
 GsWJKgTts+eQzFSf+4OCMtFiUzhXH75wgfNVEV2u/mVaucmRSAh/MR+bA75WpgC3ca+h
 Lvg6VqJruHtPeI3kq6+molviiG0XlI/jijYTeirCtoAzRymRHPoEdQti0oTzFsMgeyX8
 9v0tg9kYPjMNb7GSHBTwVCwobL1qx0dYRrrhqnK7ffrTU5OqMzvGr7aiA0lHlMa23gW1
 BFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dkfrdjFNGxQXc8+BXhKnScqIbqRrz8taQsHWkKuh744=;
 b=WdbgdqhM+YA1LK6OqzRv6biFY3Skg7e0gxXPDnW3OSVeCsc4zrCCMHUMTuNwZxOQVI
 8mfujEHbJuzUhAadAJMFdokOWkKkQmmKevhMK62afmy1OjRPsYqRm7Mrv1718lszPXkg
 F3j+RdwvjfMGlAGzmmnlEnvf5MxpQkYRYNjzsLak5U+Zrepex7ln1iZxWBH/qRWYPW5i
 cupHwVjcK9jeU0frWNo5C5/4JYBJxzFRCUjEJfz+c76pyoszCtazvsUeP13IEcgo6kHL
 r115m1rL3TWquis3OmLoNwpd3gX5WYGQoXopYtBBj/U11soMdXCiHKxiGiW96kZZi45a
 1Gtw==
X-Gm-Message-State: AOAM533l1y0qmlDet5qaC63qbQkm+M7D/UnXcMCdtiGGbiCimKE5FQdw
 bgbiN7tirkdgKxRAmMoF4S5sn4Gjv5TljWWpAvA=
X-Google-Smtp-Source: ABdhPJxJJTbgV3VYZ7Y8U5YgabXh8nYe6FMjVU9dCipvxiLMtyNOYQr1tjpvRWEHYzqDuX81PxZtiMohPiv9fccJmH8=
X-Received: by 2002:a05:6102:a0c:: with SMTP id
 t12mr4863222vsa.33.1615465787324; 
 Thu, 11 Mar 2021 04:29:47 -0800 (PST)
MIME-Version: 1.0
References: <CAM=TmwUdmv-sBwCtqp=j05pqsSuM-8QZ1p2+=9h+jMLf8VSQHg@mail.gmail.com>
In-Reply-To: <CAM=TmwUdmv-sBwCtqp=j05pqsSuM-8QZ1p2+=9h+jMLf8VSQHg@mail.gmail.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Thu, 11 Mar 2021 17:59:36 +0530
Message-ID: <CAM=TmwUY3uSpYmA_yDrWXd86L7oYR3kiT5MRm9tEhz9A4nfGUg@mail.gmail.com>
Subject: Re: Redfish Aggregation between BMCs
To: yuenn@google.com, rhanley@google.com, neladk@microsoft.com
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 5, 2021 at 1:56 PM Deepak Kodihalli
<deepak.kodihalli.83@gmail.com> wrote:
>
> Hi All,
>
> I've seen several email threads (apologize for yet another) regarding
> the multi-BMC/Redfish aggregation problem. The specific problem I'm
> interested in solving is BMC A wanting to aggregate BMC B's Redfish
> resources into its own Redfish model. BMC A and BMC B manage separate
> parts of the system and BMC A is the point of contact for external
> management clients. Seems like there are multiple options that have
> been discussed:
> - BMC A talks Redfish (as a Redfish client) to BMC B over a network
> and then aggregates responses into its own Redfish model
> - BMC A and BMC B rely on some in-band protocol (RDE/PLDM over MCTP,
> IPMI, something else)
> - Use the Redfish AggregationService schema (this sort of moves
> aggregation responsibilities to the Redfish client of BMC A)?
> - Others?
>
> Is there a preferred approach, or is it determined based on how the
> BMCs are connected?

Nancy/Richard/Neeraj - any thoughts on this topic (asking you since
I've read through emails from you on this topic in the past)?

Thanks,
Deepak
