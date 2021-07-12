Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480D3C5BAA
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 14:08:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNjGM0nL8z304L
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 22:08:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hQhaZgFb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2e;
 helo=mail-vk1-xa2e.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hQhaZgFb; dkim-atps=neutral
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNjG51KYHz2yNk
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 22:08:12 +1000 (AEST)
Received: by mail-vk1-xa2e.google.com with SMTP id i42so3927912vkr.11
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LfEdSsQw/h9NediJVc2lbR3t3W7KFS04BkEDU2a5sKs=;
 b=hQhaZgFbeL5YVu3s+dyJz/j4sviZBEyd0jm08qc0T49ypAP52AiOdZcGWE8X3UWfcU
 Qz/DA25lRhrouagyYLbxLZ3OIgtJ2GIU4hdxqu6c8RDrdC0m5bXJX+Dgvnd45xenp2wV
 2BsLKBPR4FD2P56JTLbSexAMhJKGpXENUrI0kG3Fnz50saEDaSJds7eJ7Mk9QnAJfFCd
 VIWiB467c5t+MNsCp1CsEq3TA5gTvsDyxvPNsA0opPVmxZM/8vEveGWeVzfqvUZZ+sxx
 loBxwGAy+qKC6t+3AqJdQGZBK67cqsQa+xhfLs2tLMx6JoN7LIwFK0t8LyZX6ZTbnqBf
 wemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LfEdSsQw/h9NediJVc2lbR3t3W7KFS04BkEDU2a5sKs=;
 b=ZgwqWOdugyzpmz8wltJlQ8Ob6YGpwnU5IiEi0615sCUtnLR/UehSVEHEhM3Gk3wM/Z
 zPmgj36XXZY/vvssZvzfdly2LItuZqZAds5uLtQyhzkyIt/oIkTgmrdv5Qn6zJNK9bnk
 feDWpDtKEqWjhqoCkeYfg4pVY28Y7kbWoncVrjAwVtwhFflSoTrRGByV2ZTsanFNoYxm
 DT4Jxvx2nU7SvkNtdvLrCI4Vbn3d5Ey2Xk3u30RvJ2Olcg0bHGVrRKNliv9w5dXbKUH1
 6QiBt9RJd3PBeqYmLN5KWMzHZJROqj3bVmdt5oO+SyzZDQvLpvMmFXVj1056mz4aPvbl
 2oig==
X-Gm-Message-State: AOAM530GfvFfHmBPbgFUJWs6vnHfZr38SuPnJvTKSBAlkPtMqzPyjOLY
 Pq+YVruwSHNxxUzPBI+3Hu/G4DSb+v22otZ+m68=
X-Google-Smtp-Source: ABdhPJxY7kqo/4c7jL7hx7Nx+JmDb0kH2pkn82L1GxXiw33UDtG+epCpqV0voXxG3UcwzFQ08MpMMnJB8rUcPytmXLQ=
X-Received: by 2002:a05:6122:786:: with SMTP id
 k6mr39630031vkr.19.1626091688572; 
 Mon, 12 Jul 2021 05:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAM=TmwX7VjvmaE0dMDvVfdOJ0dRCjXDu2-TcoUdGFSMsLWm81g@mail.gmail.com>
 <YObkiUGRFzvqRGkX@heinlein>
In-Reply-To: <YObkiUGRFzvqRGkX@heinlein>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Mon, 12 Jul 2021 17:37:57 +0530
Message-ID: <CAM=TmwWV_UpaV5Ui1ZNzAWpUHRyKhNfmrf6JuxUvom_Zi2ZuMQ@mail.gmail.com>
Subject: Re: Standard FW update package structure - use PLDM?
To: Patrick Williams <patrick@stwcx.xyz>
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

Hi Patrick,

On Thu, Jul 8, 2021 at 5:12 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> I haven't read this spec, but it sounds like the PLDM spec is similarly
> aligned with a Compatible concept in that PCIe IDs and/or IANA
> identifiers can be used.  On the surface it seems to me like we could
> create our existing Software.Version objects using a PLDM-format image
> and derive the new Compatible objects from these identifiers.

Right, I had something similar in mind.

> > - How does this fit with PLDM?
> >
> > Instead of the VersionPurpose based approach, how about using the PLDM
> > FW update package structure as the standard to target devices and to
> > associate devices with versions, even for non-PLDM devices? This means
> > FW images uploaded to the BMC will be packaged in the PLDM FW update
> > format. I don't think this is a violation of the PLDM FW update spec
> > (also checking with PMCI WG). For non-PLDM devices, this means using
> > just the package structure, not PLDM commands.
>
> I don't see anything wrong on the surface with enhancing our
> `ImageManager` concept[2] implementation to support PLDM-format also.
> Should this code go into phosphor-bmc-code-mgmt though rather than become
> intrinsic to PLDM?  It seems to me like the `ItemUpdater` for PLDM
> devices is the only part that needs to be in the PLDM codebase.

I envisioned the PLDM codebase to act both as ImageManager and
ItemUpdater. Phosphor-bmc-code-mgmt could still implement image
signature verification.

> I do have questions on how PLDM handles digital signatures and image
> verification.  I suspect that it would be insufficient for many users
> such that we wouldn't want it to be the primary image packaging method.
> Fundamentally, my feeling of insufficiency is around vendor-provided
> images:
>
>     If I have a FooCorp NIC installed in my system, which supports PLDM
>     update, and FooCorp releases a new image on their website, do I:
>
>         a. Want my user to be able to download FooCorp's image and
>            install it directly using their PLDM update file?
>         b. Want my user to only install an image that I've qualified
>            on in our configuration and additionally signed with *my* keys?
>
> For some vendors (a) is their designed answer and for some (b) is.
> Allowing the BMC to take a raw PLDM update image and directly send it
> to the NIC satisfies (a).  Using the OpenBMC signed tarball scheme
> satisfies (b), since the BMC will reject the tarball if it isn't signed
> with keys already trusted by the system and the NIC will reject the
> embedded PLDM image if it wasn't signed with FooCorp's keys trusted by
> the hardware.

The OpenBMC signed tarball scheme could still be used and it could
contain a PLDM format FW package? My intent with the PLDM format was
to solve the 'Compatible Devices' problem, and specifically for a case
where the device may actually not support PLDM messages for FW update.

Thanks,
Deepak
