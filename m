Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4FD5DCD0
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 05:18:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dmXp6n59zDqRr
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 13:18:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iuw8M0vk"; 
 dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dmXC1v23zDqLY
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 13:18:19 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id k8so1398282iot.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jul 2019 20:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LelwRu8kbqixZJ+5k3LGk6TvNufRU/BwiNbq/XpigiA=;
 b=Iuw8M0vkppGq7TMVVDWe4MspYoAo/r+6mZzdpRc65pAQZqc9eI74hVHm1C1OfDDUHk
 3+YCKHbjRk+IrKkhN44pvrkP2EVMfFrQ0R9UMBoHsyvRvmAr0TvXtqwUiG3z3yn4tghJ
 Dfvov8QINfZiG1mi5Zat/ZP//qkAhAJ3rFaoWmKe46L6lHeEvF7+mohP/Q3V+NSV490b
 Z+Mti+LLZm8KkbL2dyPiwn0nTF8DxLdlQnT4PMGHN8eCHzZvEi8wHxx4fH2OMrH7BL8t
 d2LVBXUbdr+S2427cxMdDZ7DBXenQY/bWRnNKpy8xFUtlrKwdoTfu3MAZC9skxId8lfZ
 WFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LelwRu8kbqixZJ+5k3LGk6TvNufRU/BwiNbq/XpigiA=;
 b=JrERR5OtMb6ycw7bnQQ7Kt0hcpElL6wFj1MuSkzA6JNYCzwuBo5wMCSVbzOmtcQuvN
 kGiMiupk3nN5Lhf1WMPtuv2LQUceUk315psYWfwUvEWZgpOYuFJVksy01VYQ+B70lHMK
 v+UeLFuiLRGnsAJmiY4VGH/H3+mIkemh/JXmIAdGnOd+5bKXhJjld9ktvZyCw/ry2w/G
 3U+oqaOVB4rECoRizJLrqLhBexUq1dRe00f13dX1fpX5PBwNzwPj9zzybWk7GPtVhfUY
 DaouN94DIBrazZj04dJcgE+WJiChWCYB/oTyNEnO498PdcCNhIKYl6lD9AlJHt699Gd1
 Th/g==
X-Gm-Message-State: APjAAAVS2eOutt2T8nfnKvK4qXHK+37uOiRkZn3d83BmA+BHa5HCsrXW
 x/WSo19Vet6jgWXXwQulI7gBKthP2j7GPBQZHQI=
X-Google-Smtp-Source: APXvYqxLfhiNtbq4X/YCiDLsLM/bOuVKx4NYiXuo8fZVBuTaGJYE9IiIMQ7ju2Eorx1HYBWzzoloD/9U48wry/aO5fM=
X-Received: by 2002:a6b:901:: with SMTP id t1mr30575770ioi.42.1562123895768;
 Tue, 02 Jul 2019 20:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzxbMtyjvW5Efo-Pp3c1-hZz93aFwPvQiumsp_fj2nuzw@mail.gmail.com>
In-Reply-To: <CAO=notzxbMtyjvW5Efo-Pp3c1-hZz93aFwPvQiumsp_fj2nuzw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 3 Jul 2019 11:18:04 +0800
Message-ID: <CAARXrtknLpC0Ke+_Y7uCsL222kMPvXcj6E-qct5ppmwrzvCn4w@mail.gmail.com>
Subject: Re: Future features of phosphor-ipmi-flash
To: Patrick Venture <venture@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 3, 2019 at 11:06 AM Patrick Venture <venture@google.com> wrote:
>
> Uploading the BIOs via phosphor-ipmi-flash is available for review,
> but it's not tied into another daemon.  One must provide a
> verification service, and an update service.
>
> I'd like to provide the option to leverage phosphor-bmc-code-mgmt.  It
> looks like in this codebase there is a notion of a signed image, but
> the signature is attached.  It also looks like, there's some version
> information that's meant to parsable and involved.  I haven't had a
> chance to play with it.
>
> With phosphor-ipmi-flash the hash file portion is optional.  Because
> phosphor-ipmi-flash doesn't define anything beyond the sequence of
> calls, one could use burn_my_bmc and send the hash down separately and
> then the verification target could trigger something that concatenates
> and triggers the bmc code mgmt signature check.
>
> It should be somewhat straightforward to tie the two codebases
> together (as an optional usage).
>
> If someone has experience with programming against
> phosphor-bmc-code-mgmt and wants to help with this or at least point
> me at what I need to know, I'd be more than happy.
>
> From reading the docs with the dbus interface definitions, I think I
> have the general idea -- drop the file into the place it expects the
> file (a configuration option) and then call the dbus methods.

Exactly, the whole process of BMC code update is:
1. Put a tarball in /tmp/images/ (via REST API, TFTP, or scp)
2. An object will be generated on DBus to represent the image;
3. Invoke a DBus call to set RequestedActivation property to "Active"
4. Reboot.

Be noted that the tarball consists of following files:

 image-u-boot
 image-kernel
 image-rofs
 image-rwfs
 MANIFEST
 publickey
 image-u-boot.sig
 image-kernel.sig
 image-rofs.sig
 image-rwfs.sig
 MANIFEST.sig
 publickey.sig
