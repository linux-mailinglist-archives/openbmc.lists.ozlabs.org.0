Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 250868F3CF
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 20:44:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468b3J0YbNzDrBm
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 04:44:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QuaXoLGP"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468b2X3d6DzDr5s
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 04:44:03 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id c34so7345470otb.7
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rj1NyvsMo30Uj7deIDp6RKFbtY619yWCOfz/cJLSqh8=;
 b=QuaXoLGP6npcPOljOqE8y8p1ufm/27pCxZOw2QRLuEyMf+2E4mRbUxbFhB0jX04+ad
 iecvHmcmm6lOjO5iI/Qq3Eo2OFlZ7vyfS52LI1GYJjUr8G2Qlu2JC8hkvuhXJesYmG8t
 Z73y821CUdaqyz500ZMD1tm2ylrfeyK0NgC18aoBO5x03PI0oIgcTfJTre2RAP4r28ne
 SYiSJsVksX4quqv16bl0KwaArucD5HPA6I5RzN1nrEYEnN786NIEVE1mvZPR9pn5pEmP
 8LS0xVRe+/l6LaxzQkqVATcMLvfBBdWqpRf266LDDuyg5c+5DQjPfsgTJrnX5zmXiXb9
 MRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rj1NyvsMo30Uj7deIDp6RKFbtY619yWCOfz/cJLSqh8=;
 b=OqvsYdNj0h5SQJ5MR5phmGASCOxojh6fvrf8ar1jNsPVuogr/CcsdJugnnlWdzqoeV
 CQ+4Vd8B6YzzggRRbTCrC1Zat26NgdNRybRc4VrQKsZ1/iEacPvA9GzubPVceBdh1V2b
 vpP2dSc/9Q+JzjYSsimZNw9SzyHncsso3d/sIU/Gzj6ggbCf3HhUYEfSUD6y3fp6l8j/
 Vg+/gRL/XH3bSdahKisKfW09d9sURH81MRA00g1noruHqZ9zpc6XnCnBkVB+HZxgP/6e
 Egwj2KFXEWAnsdZtGd3WbUOriwOUB5Gbxh6y3RQgR3hyexTyAv3M6DhUSpf1r4eU1xvo
 6HJw==
X-Gm-Message-State: APjAAAUeLO3mP8vPjSnEMI/CayBK8bYYoprLUfuMeQ6GqqVNAoY6qf/U
 g1fQhX5RSXceURcB+d8JQbzMrvGqaAiHYnZtYnk=
X-Google-Smtp-Source: APXvYqy7F5TR3BiPYv+iLkQWyJGnBI/g5n1tkAiPaAGFWIDVvnfdO3X34TgxIB3Xrw+FbzvBQ7si/7sdRScXQREEeZE=
X-Received: by 2002:a05:6830:15c5:: with SMTP id
 j5mr4686987otr.296.1565894638679; 
 Thu, 15 Aug 2019 11:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <efb47539225e57a0ab0138987287c230@linux.vnet.ibm.com>
In-Reply-To: <efb47539225e57a0ab0138987287c230@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 15 Aug 2019 13:43:42 -0500
Message-ID: <CALLMt=qcLV5drgsMAuYDo2ftmu2NAKgRRs59RVy9u45-rCBvBQ@mail.gmail.com>
Subject: Re: Alternative to the filesystem overlay
To: Adriana Kobylak <anoo@linux.ibm.com>
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

On Thu, Aug 15, 2019 at 12:38 PM Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> In OpenBMC we've been using an overlay to make the read-only filesystem
> (or part of it) writable. It hasn't come without its issues, like
> missing directories (openbmc/openbmc#3564) and various flavors of
> corruption (openbmc/openbmc#3578 and issues when adding files to /etc in
> the build causing files that had been previously modified on the bmc to
> become corrupted).

The overlay sounds ideal (when it works) because we don't need all of the
special code and logic you mention below. Any chance we can just fix
whatever is causing the corruption?

>
> An alternative would be to use a bind mount and manage the file merging
> by an OpenBMC app. Doing some experimentation, seems this solves the
> issues seen above. The way that it'd work would be:
> - The init script or initramfs would do an rsync from /etc to the bind
> mount destination directory in the read-write filesystem, skipping the
> contents of a list which would contain the files that have been modified
> in the BMC and should be preserved.
> - A new OpenBMC app would monitor /etc for changes via inotify for
> example, and if a file is modified, it'd add it to the "list".

We always have race condition here though? Someone updates the
BMC network info and before the app can detect it they reboot the
BMC and we lose the settings.

Any idea what other flash based distros do out there? Seems like
this would be a common problem for a lot of projects.

>
> Considerations:
> - The /etc dir mainly being a configuration destination does not get
> modified often so the app that is watching the directory would not be
> triggered often.
> - The bind mount would duplicate the contents of etc although it's not
> much. If space is a concern, some exploration could be done to have the
> bind mount be a tmpfs and have the monitor app copy the modified files
> to the read-write filesystem instead of adding them to a list.
>
> Thoughts?
>
