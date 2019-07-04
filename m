Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 338E15F9EB
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 16:18:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fg7l3QzSzDqNd
	for <lists+openbmc@lfdr.de>; Fri,  5 Jul 2019 00:18:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LMoD7yvZ"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fg6w6BtXzDq7F
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jul 2019 00:17:59 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id q10so3004019pff.9
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jul 2019 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yi/cvsjYGnADr2QySvdu9KjbtMxWXr4S2RSRp+LD54g=;
 b=LMoD7yvZ9nJ3zl44XQl4ljw2FpWnnGK5lYAwoMHZht146lCSrSi71pxb3X7taiPk42
 gQ9pOFlolUGBeEAIOVmDCk8dTzLdnVAUYD+yhmNr+ReRbE+sRAcmVgmsQdd7yECxPc42
 rRbG/4aC4Zbiij5pKLDvYE/ENfayHv0VUJ8Xtoj0X/4lx4f8D2HT97NzlWxOvLkOhdQr
 aSN9nx8QvWjxR0KEHpSJZaBMGAuyQFqrgBeM7cnuQ/29+LtCH0QeZuPWLdCNhupn0/LJ
 hV8N7xUy3yhvdOxEI9kLB6QwNdlyWN78loUj9QtLkKYin+DQUec623jfAzWspVV3UaWK
 yKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yi/cvsjYGnADr2QySvdu9KjbtMxWXr4S2RSRp+LD54g=;
 b=mr8PHascgJRc87oj8DK4qF8N23EOFd0Hj7q+RuJTFzkU1Sw8LZWXWQXlSSFmm88l5v
 XoIw0CXC4L2c58jZk1kneGK1MoCPPD1U6VhWGyJTP6FEDDXwsmNJ85odv/kW3RrLyZAz
 RWBv9SHX0AO5+aOj5WxnLYE8ACD0Dc9khpfeNxvj3Rc65HoNCwsz2F7QYziVFSe9XYZL
 /Y4lO+01XG9oD4kDmg24cNM3vX64R8VRZziiJAbVAobolnDCn3/LJqIOSlYu+Ovg8ok4
 UIqxwM2pLJfvkL63n3jVFFyi+xw3D1XdvSXzwvNVBT/thvm+PX8ExJj2n7E5CJPH8NTw
 U5EQ==
X-Gm-Message-State: APjAAAVDOFYOo9SkWFngBgpc0g4Y0vARiF52u9f0RddCrDpqvhe2QqOU
 1fto/LyovUNKO+4REmJwXF4+rKJ4hJ5pthgzGpOyNQ==
X-Google-Smtp-Source: APXvYqyx1CzxEMkJg98pTCkd8J1i01FIG4iupgZHsWaSZoA6ITPyJ4OF+paqYY25w9t5+zXDdTl5CQOIfyI2fxejFYk=
X-Received: by 2002:a17:90a:bf0e:: with SMTP id
 c14mr19092949pjs.55.1562249875771; 
 Thu, 04 Jul 2019 07:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzxbMtyjvW5Efo-Pp3c1-hZz93aFwPvQiumsp_fj2nuzw@mail.gmail.com>
 <CAARXrtknLpC0Ke+_Y7uCsL222kMPvXcj6E-qct5ppmwrzvCn4w@mail.gmail.com>
 <BYAPR21MB11918D32FD1F25D6616FE591C8FB0@BYAPR21MB1191.namprd21.prod.outlook.com>
 <CAO=notzs1+p2Di-zSsVH4Uh2RBg008YB7XvSweN676GAr_+wtQ@mail.gmail.com>
 <CAARXrtnfyKmejEkDZepoBVUDL=1N1GoLf2hBnzzGfXz8fHG8-g@mail.gmail.com>
In-Reply-To: <CAARXrtnfyKmejEkDZepoBVUDL=1N1GoLf2hBnzzGfXz8fHG8-g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 4 Jul 2019 07:17:44 -0700
Message-ID: <CAO=notx5paiRbxnMXdnxdHKycfrmCe3+i3YMaxuHZp1K2TBRuQ@mail.gmail.com>
Subject: Re: Future features of phosphor-ipmi-flash
To: Lei YU <mine260309@gmail.com>
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
 Adriana Kobylak <anoo@us.ibm.com>, Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 3, 2019 at 8:03 PM Lei YU <mine260309@gmail.com> wrote:
>
> On Wed, Jul 3, 2019 at 10:43 PM Patrick Venture <venture@google.com> wrote:
> >
> > On Tue, Jul 2, 2019 at 11:00 PM Neeraj Ladkani <neladk@microsoft.com> wrote:
> > >
> > > This is great. In this case, we should be able to make use of this design for all BMC managed components ( FPGA, CPLD and PSU FW) by providing verification service, and an update service. Basically TFTP the image and then call the dbus methods
> >
> > Yes, with phosphor-ipmi-flash, you can send down effectively any
> > binary you wish and a signature (or without a signature) and then
> > trigger actions against it, to update anything.  If you do wish to use
> > it very generically, let me know what you have in mind for a timeline,
> > and I can plan out the changes.  To make the codebase very generic is
> > somewhat trivial at this point, it's just a matter of knowing what may
> > come in the future enough to provide a sufficiently flexible schema
> > for the json.
> >
>
> Assuming all BMC managed components' update manager will use the same API (at
> least PSU firmware updater will do), then if phosphor-ipmi-flash eventually
> invokes the DBus APIs defined in xyz.openbmc_proejct.Software, it should be
> trivial to support different kinds of components.

Currently, the code provides a mechanism for specifying dbus targets
or services (units) to start to cause verification, update, etc.  So,
it technically currently already supports all types.  It just requires
additional integration.  For instance, one could write a trivial
script that is installed by a target that then calls the dbus APIs.
However, I'd like to provider helper objects that know how to do it,
so save someone from having to write that script. :)

I'll take a look at the DBus APIs in xyz.openbmc_project.Software.

The only thing I will definitely assert here is that
phosphor-ipmi-flash is a transport control mechanism and triggering
mechanism and doesn't have any logic for parsing or versions or
anything of that regard.  It's mandate was simply to provide a fast
host-based way to send down a firmware payload and trigger
verification and update.  I mention this because I know in the PSU
design doc there is a lot of discussion around the versions of
components.  I'd prefer any business logic about whether the
components needs to be updated be handled either on the host or
elsewhere in the BMC.

>
>
> > >
> > > How do we specify if we want to update only kernel or rofs or rwfs?
> >
> > I imagine from reading the code that you can do this, by only dropping
> > those files into the tarball and leaving out the others.  Maybe the
> > MANIFEST file's contents specify what's in it in a formatted way?  I
> > assume so, I don't use bmc-code-mgmt, so I can't say without reading
> > more of the code, presumably Lei knows.
> >
>
> For now, the bmc-code-mgmt (for static layout) hard-code the partitions to be
> updated in
> https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/master/images.hpp#L14-L15,
> because typically a code update shall update all the partitions to
> avoid incompatibility.
>
> But the part could be changed to support separated partitions if we all agree
> there are such use cases.

Interesting, and that's definitely true.  You'd want all the
components.  We just use the one binary, image-bmc for ours, instead
of signing each component and tarring them up.  A lot of that though
has to do with available memory -- to which I'll further elaborate
below.

>
>
> > >
> > > Neeraj
> > >
> > > -----Original Message-----
> > > From: openbmc <openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org> On Behalf Of Lei YU
> > > Sent: Tuesday, July 2, 2019 8:18 PM
> > > To: Patrick Venture <venture@google.com>
> > > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Adriana Kobylak <anoo@us.ibm.com>
> > > Subject: Re: Future features of phosphor-ipmi-flash
> > >
> > > On Wed, Jul 3, 2019 at 11:06 AM Patrick Venture <venture@google.com> wrote:
> > > >
> > > > Uploading the BIOs via phosphor-ipmi-flash is available for review,
> > > > but it's not tied into another daemon.  One must provide a
> > > > verification service, and an update service.
> > > >
> > > > I'd like to provide the option to leverage phosphor-bmc-code-mgmt.  It
> > > > looks like in this codebase there is a notion of a signed image, but
> > > > the signature is attached.  It also looks like, there's some version
> > > > information that's meant to parsable and involved.  I haven't had a
> > > > chance to play with it.
> > > >
> > > > With phosphor-ipmi-flash the hash file portion is optional.  Because
> > > > phosphor-ipmi-flash doesn't define anything beyond the sequence of
> > > > calls, one could use burn_my_bmc and send the hash down separately and
> > > > then the verification target could trigger something that concatenates
> > > > and triggers the bmc code mgmt signature check.
> > > >
> > > > It should be somewhat straightforward to tie the two codebases
> > > > together (as an optional usage).
> > > >
> > > > If someone has experience with programming against
> > > > phosphor-bmc-code-mgmt and wants to help with this or at least point
> > > > me at what I need to know, I'd be more than happy.
> > > >
> > > > From reading the docs with the dbus interface definitions, I think I
> > > > have the general idea -- drop the file into the place it expects the
> > > > file (a configuration option) and then call the dbus methods.
> > >
> > > Exactly, the whole process of BMC code update is:
> > > 1. Put a tarball in /tmp/images/ (via REST API, TFTP, or scp) 2. An object will be generated on DBus to represent the image; 3. Invoke a DBus call to set RequestedActivation property to "Active"
> > > 4. Reboot.
> > >
> > > Be noted that the tarball consists of following files:
> > >
> > >  image-u-boot
> > >  image-kernel
> > >  image-rofs
> > >  image-rwfs
> > >  MANIFEST
> > >  publickey
> > >  image-u-boot.sig
> > >  image-kernel.sig
> > >  image-rofs.sig
> > >  image-rwfs.sig
> > >  MANIFEST.sig
> > >  publickey.sig
> >
> > Interesting, so it doesn't have to contain all those individual pieces
> > but could just contain an image-bmc  (which has all the pieces) and
> > then the signature file.
>
> As explained above, for now the code is hard-coded to require the tarball to
> contain all the partitions, and does not support image-bmc's tarball.
> It will get a Failure if any image-<partition> is missing.

Ok.  That's good to know.  It won't impact integration with the
current plan, but it'll be good to note that if someone is using
bmc-code-mgmt, this is the case.

>
> >
> > So in the case of the quanta-q71l we can't use a tarball approach
> > because there isn't enough memory free to hold the tarball, and the
> > untarred contents at the same time, and I can't use the /tmp/images
> > folder because the "mv" command will create a copy before moving and I
> > also then run out of memory.  The /tmp/images is a configuration
> > variable in the code-mgmt application, so that part I can get around.
> > Others aspects, not so much.
>
> I saw some discussion in mailing list before, I did not know if someone worked
> this out.
> Could you share how the bmc code update works on systems with limited RAM?
> Does it like "streaming", that fetches a few blocks, erase a few, and write a
> few?

Nope, we write down the 32MiB image-bmc file and a signature and drop
the file with an invalid name into the update path.  The file is
renamed upon successful verification (by the verification mechanism).
This prevents an OOM from moving the file from /tmp/, which would
happen otherwise.  There's enough memory freed because the preparation
target of phosphor-ipmi-flash (and its predecessor) will flush the
caches, freeing up about 45MiB of memory.  Then the 32MiB file is
dropped into place, verified, and then a reboot is triggered.
Interestingly, when you move within a folder the inode is updated
instead of the contents copied into new blocks and then the old ones
deleted afterwards -- that's how we get away with it.

Because of this different approach we can't use bmc-code-mgmt -- but
we can use phosphor-ipmi-flash/burn_my_bmc.

>
> >
> > However, I want people who are using bmc-code-mgmt already to be able
> > to use phosphor-ipmi-flash/burn_my_bmc to send down their payloads.
> > In this case, it can be done very trivially -->
> >
> > Note: this isn't a ubi tarball update, but that is also supported by
> > bmc-code-mgmt (I think).
>
> Yes, the same DBus APIs support UBI tarball and static tarball.

Cool, that's convenient.  What I'll end up writing is a verifier that
works for either by just calling the DBus API, and on status it'll
read that property you mention below!

>
> >
> > Lei, to use phosphor-ipmi-flash for this, you'd have the verify object
> > in phosphor-ipmi-flash trigger the "apply" property (and check on the
> > result somehow) -- I think I saw there's a property for the result.
> > And you'd have to configure the temporary location variable to be
> > /tmp/images/ -- you could then send the tarball down to something
> > like, blob:/flash/statictar and it would know to trigger the things.
> > -- It will only take one patchset to let burn_my_bmc take any "type"
> > field that then gets translated directly into the blob.  So today it
> > doesn't check for a /flash/statictar blob, but it could easily check
> > for any blob specified. --
> >
> > phosphor-ipmi-flash expects an image handler, where the bytes are
> > written, a verification object, and an update object.
> >  - where the bytes are written, there is a file handler object that
> > will blindly write bytes, could be used trivially for this just set
> > destination to whatever.
> >  - the verification object could trigger the dbus call, it just needs
> > to be able to report success/failure
> >  - there is a reboot update object provided that's just "available"
> > already because we use static image updating presently.
> >
>
> I did not read the phosphor-ipmi-flash code, but the idea here should work.
> * The file handler object writes the tarball bytes into a file;
> * The verification object triggers a DBus call to activate the image;
> * Then the BMC needs a reboot for the image to be written to the flash. I
>   expect the "reboot update object" here is to reboot the BMC.
>
> > Lei, if I were to provide you some patches in a couple weeks are you
> > in a position to test?  I'll help you configure your system.  I'll be
> > busy for the next week, but after that I would like to roll this out
> > for those already using bmc-code-mgmt.
>
> Yes, I would like to test this, in-band code update is good to have :)
>
> >
> > ***Provided the bmc-code-mgmt can report whether it successfully
> > verified the image against the signature(s).  I think it does, and if
> > not, I bet it would be easy to add such a property and enum in
> > phosphor-dbus-interfaces to support this extension.
>
> For now, if the verification of the signature fails, the BMC:
> 1. Report an event log;
> 2. Checks `FieldModeEnabled` property in `/xyz/openbmc_project/software`
>    * If it's true, set the "Activation" property to `Failed` state, and do not
>      update the code.
>    * If it's false, continue the code update.

That's definitely something that can be checked.
