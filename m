Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81B5E734
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 16:55:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f40v54njzDq77
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 00:55:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MtBJo07o"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f3kd30xYzDqGJ
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2019 00:43:20 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id ay6so1355041plb.9
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2019 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqG4kxiAT4PnUvZ82cl71qp58/laWBy8TShrHZNDI0s=;
 b=MtBJo07oYaiO7zHTLqSzP8ccaSTFTLkfzO0IwVhx1kJKs1sWcPju99sgKjns6goe31
 5/PVWpjzsNb0gsAct5eJjkf08Yw885Vq6nkEr1oWRJUfs38Fzb6CxvqamlLZjhMWDtM6
 X3Cs0wqc/CrmQx813wNZcKg4YQWnzJmMiz+tttNqM6k+mMxhVKG8MZG6BD/gYgq3sI+5
 53XCWASb+EYJaDCspjQUgxYXmxRtte747p8TJcmToqhptlgQaWLW4C/p8ksJNX6s7QXm
 jyzTqRzAyAXZbK0wZNefLyuPupEX31Y83sfYUJWyvp3rULylXPBWwp8kmQczU8Is3iim
 J6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqG4kxiAT4PnUvZ82cl71qp58/laWBy8TShrHZNDI0s=;
 b=VuOaKvCTpVSU9h5Mn1pBO+0FOYuQ5d6wkKxc4Uy0nKBgRUqCxXRe2pqB47RfZKlTZg
 hjvezJ52Z62ZYyXdi7aj03oqcwMI298VH2vZGs5WkKFodEnQmZdIEwo0Gtz4ZZBE6AtN
 itkgu6fb7AlPo1TYRrmnzjfzMYtZIB/YA8thEuyjrqxJ3g4qwnrWL9aItoe8Br9b3QuN
 h2ZbQl2tJvAvPpQXTxBuT+DVmO92y8wj8MxIP78Qw5irDQo5tkg/d5v1RDWkKHo5/fRY
 Qb6RhrqbiscnljDyMGkyAtTkdHY3rHFL0qZMFM6u4kZJB/dTzIRhxKgzpztVX0saJs9q
 QtiQ==
X-Gm-Message-State: APjAAAW2S5AvexIN8zK+oC7djf7XQm/8ozWO6QoAG13XRWUhNXeWJ/PU
 w0N8aESV1w0/LhpqYQO9/p7milfef1xsM2ZU3JclZw==
X-Google-Smtp-Source: APXvYqx8H3wMLUwS+RctHUGLy6tJp5jyPMRzC5XxrJYS/A/zJYoACMp7Tja/Oo9cMcLUF3CqYgS9MO0d+ChBy2pBGVY=
X-Received: by 2002:a17:902:b944:: with SMTP id
 h4mr34145076pls.179.1562164995595; 
 Wed, 03 Jul 2019 07:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzxbMtyjvW5Efo-Pp3c1-hZz93aFwPvQiumsp_fj2nuzw@mail.gmail.com>
 <CAARXrtknLpC0Ke+_Y7uCsL222kMPvXcj6E-qct5ppmwrzvCn4w@mail.gmail.com>
 <BYAPR21MB11918D32FD1F25D6616FE591C8FB0@BYAPR21MB1191.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB11918D32FD1F25D6616FE591C8FB0@BYAPR21MB1191.namprd21.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 3 Jul 2019 07:43:04 -0700
Message-ID: <CAO=notzs1+p2Di-zSsVH4Uh2RBg008YB7XvSweN676GAr_+wtQ@mail.gmail.com>
Subject: Re: Future features of phosphor-ipmi-flash
To: Neeraj Ladkani <neladk@microsoft.com>
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

On Tue, Jul 2, 2019 at 11:00 PM Neeraj Ladkani <neladk@microsoft.com> wrote:
>
> This is great. In this case, we should be able to make use of this design for all BMC managed components ( FPGA, CPLD and PSU FW) by providing verification service, and an update service. Basically TFTP the image and then call the dbus methods

Yes, with phosphor-ipmi-flash, you can send down effectively any
binary you wish and a signature (or without a signature) and then
trigger actions against it, to update anything.  If you do wish to use
it very generically, let me know what you have in mind for a timeline,
and I can plan out the changes.  To make the codebase very generic is
somewhat trivial at this point, it's just a matter of knowing what may
come in the future enough to provide a sufficiently flexible schema
for the json.

>
> How do we specify if we want to update only kernel or rofs or rwfs?

I imagine from reading the code that you can do this, by only dropping
those files into the tarball and leaving out the others.  Maybe the
MANIFEST file's contents specify what's in it in a formatted way?  I
assume so, I don't use bmc-code-mgmt, so I can't say without reading
more of the code, presumably Lei knows.

>
> Neeraj
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org> On Behalf Of Lei YU
> Sent: Tuesday, July 2, 2019 8:18 PM
> To: Patrick Venture <venture@google.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Adriana Kobylak <anoo@us.ibm.com>
> Subject: Re: Future features of phosphor-ipmi-flash
>
> On Wed, Jul 3, 2019 at 11:06 AM Patrick Venture <venture@google.com> wrote:
> >
> > Uploading the BIOs via phosphor-ipmi-flash is available for review,
> > but it's not tied into another daemon.  One must provide a
> > verification service, and an update service.
> >
> > I'd like to provide the option to leverage phosphor-bmc-code-mgmt.  It
> > looks like in this codebase there is a notion of a signed image, but
> > the signature is attached.  It also looks like, there's some version
> > information that's meant to parsable and involved.  I haven't had a
> > chance to play with it.
> >
> > With phosphor-ipmi-flash the hash file portion is optional.  Because
> > phosphor-ipmi-flash doesn't define anything beyond the sequence of
> > calls, one could use burn_my_bmc and send the hash down separately and
> > then the verification target could trigger something that concatenates
> > and triggers the bmc code mgmt signature check.
> >
> > It should be somewhat straightforward to tie the two codebases
> > together (as an optional usage).
> >
> > If someone has experience with programming against
> > phosphor-bmc-code-mgmt and wants to help with this or at least point
> > me at what I need to know, I'd be more than happy.
> >
> > From reading the docs with the dbus interface definitions, I think I
> > have the general idea -- drop the file into the place it expects the
> > file (a configuration option) and then call the dbus methods.
>
> Exactly, the whole process of BMC code update is:
> 1. Put a tarball in /tmp/images/ (via REST API, TFTP, or scp) 2. An object will be generated on DBus to represent the image; 3. Invoke a DBus call to set RequestedActivation property to "Active"
> 4. Reboot.
>
> Be noted that the tarball consists of following files:
>
>  image-u-boot
>  image-kernel
>  image-rofs
>  image-rwfs
>  MANIFEST
>  publickey
>  image-u-boot.sig
>  image-kernel.sig
>  image-rofs.sig
>  image-rwfs.sig
>  MANIFEST.sig
>  publickey.sig

Interesting, so it doesn't have to contain all those individual pieces
but could just contain an image-bmc  (which has all the pieces) and
then the signature file.

So in the case of the quanta-q71l we can't use a tarball approach
because there isn't enough memory free to hold the tarball, and the
untarred contents at the same time, and I can't use the /tmp/images
folder because the "mv" command will create a copy before moving and I
also then run out of memory.  The /tmp/images is a configuration
variable in the code-mgmt application, so that part I can get around.
Others aspects, not so much.

However, I want people who are using bmc-code-mgmt already to be able
to use phosphor-ipmi-flash/burn_my_bmc to send down their payloads.
In this case, it can be done very trivially -->

Note: this isn't a ubi tarball update, but that is also supported by
bmc-code-mgmt (I think).

Lei, to use phosphor-ipmi-flash for this, you'd have the verify object
in phosphor-ipmi-flash trigger the "apply" property (and check on the
result somehow) -- I think I saw there's a property for the result.
And you'd have to configure the temporary location variable to be
/tmp/images/ -- you could then send the tarball down to something
like, blob:/flash/statictar and it would know to trigger the things.
-- It will only take one patchset to let burn_my_bmc take any "type"
field that then gets translated directly into the blob.  So today it
doesn't check for a /flash/statictar blob, but it could easily check
for any blob specified. --

phosphor-ipmi-flash expects an image handler, where the bytes are
written, a verification object, and an update object.
 - where the bytes are written, there is a file handler object that
will blindly write bytes, could be used trivially for this just set
destination to whatever.
 - the verification object could trigger the dbus call, it just needs
to be able to report success/failure
 - there is a reboot update object provided that's just "available"
already because we use static image updating presently.

Lei, if I were to provide you some patches in a couple weeks are you
in a position to test?  I'll help you configure your system.  I'll be
busy for the next week, but after that I would like to roll this out
for those already using bmc-code-mgmt.

***Provided the bmc-code-mgmt can report whether it successfully
verified the image against the signature(s).  I think it does, and if
not, I bet it would be easy to add such a property and enum in
phosphor-dbus-interfaces to support this extension.
