Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DACFD07C
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 22:42:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DZh03dxrzF3pp
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 08:42:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RpS9aRXo"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DZfc01byzF83W
 for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2019 08:40:55 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id l14so6216619oti.10
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 13:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WFSIwzeqnLwOlW8Ommlo/m29P0UAi7W8VKS+l3ncg6k=;
 b=RpS9aRXokwQQZRm6SmDEN5d1NLx/fc3SEsIF3HTLzjyW8rR4VKaQ+QON3kktliZ8nV
 QPptK/y4jadTQIgvUlzpX1eHD77R/KCwckU4TZxWKsoWAT2Lx8hjTc7qyZh4BXD+5JZs
 1u03RNp0DFhbhQE2auzl2c0v6I+n6EtA7Cq7DNx0vdggkPl0NEvmYks9RuGIduHTYmxB
 UuMdhuGQgcXBR49GXNhP/4OWTA6dONLQYfmRD5C6rwIDDjF9kIiZy/AJJAw29gxdwm81
 ZnEfF1SZN0DcDflvnpZnJNMSPTGTij0eN03ghmXu4JKYV7jJyLTdDW0IS2s1bidDLOjj
 d4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WFSIwzeqnLwOlW8Ommlo/m29P0UAi7W8VKS+l3ncg6k=;
 b=F6TjoRQh1E9sYumTWTf7wWkMiUeO4zJRXDs75SduwNrO/CfXUbVgSQayP4dKse8sjf
 3AEBJJyMydNDLn81Un27SFBpthh3MtS5p3auuj46GFdYQ7xLGtAgpELy56WnWEvSuZBn
 iQg98Djhai1xwagQdlOoIheyx4toFW5GxP+Ro2Nw7olicPp2EnzZN06rEK2+fT9nJatw
 Ssp49xHHewFfHd2Y1Uzuxa1qO5dxDDBBjiZHFVyN6xrLcnkY6ljqueevpKg7OFdNDDyq
 e2WEy9mZJq9bFpS0RAjAVwc9A9ETOyw/frE/QtWBaUvoA4+4UAzg3UoOMQfEWmiMg2WO
 NX8Q==
X-Gm-Message-State: APjAAAUDcXwFe59ceS5LCFRU6+J8h78aaW1P3AGM5FOvsmZP7wsovB02
 DnOOtysgUZEbMzNq0xdSiyx1A3FFQ2au61/IXvcUVCPQoUg=
X-Google-Smtp-Source: APXvYqxs/FUBSMpeavcjX2Mw1Lx045MwqlHrZ1jeB29GHA3dmqy4muvsrPsDyzuXpZPD9mVs407KTb740AZMoA/aQqg=
X-Received: by 2002:a9d:5cc7:: with SMTP id r7mr8071527oti.331.1573767652059; 
 Thu, 14 Nov 2019 13:40:52 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRJk09g_NbpCWOedcFpeqbcec=jptfiOerO8TPDKGChOgQ@mail.gmail.com>
 <DF4PR8401MB10846D55E37921FB321B0EC4D86B0@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <DF4PR8401MB10846D55E37921FB321B0EC4D86B0@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Thu, 14 Nov 2019 15:40:17 -0600
Message-ID: <CAK_vbW0gaG688W7F8HgnCvddCsLwKDOq0h7ZsJRMYiW9ijHFvQ@mail.gmail.com>
Subject: Re: There is no image generated while build ast2500 evb
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
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
 Deng Tyler <tyler.sabdon@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I found this a curiosity, so while catching up on some mailing list
e-mails, I decided to give this build a go.

While it was running, I stumbled upon a similar mailing list topic,
but there it apparently builds a binary file, but some questions on
missing executables:

AST2500 Evaluation Board build question   Dolaty, Mohsen
https://lists.ozlabs.org/pipermail/openbmc/2019-October/019227.html

When I checked back on the build attempt, it seemed to work, with some warn=
ings:
[build]$ cd /tmp/$USER
[build]$ ls
[build]$ mkdir evb
[build]$ cd evb
[build]$ export TEMPLATECONF=3Dmeta-evb/meta-evb-aspeed/meta-evb-ast2500/co=
nf
[build]$ source $BMCDIR/openbmc/openbmc/openbmc-env
[build]$ obmc_add_mirror
[build]$ umask 0002
[build]$ uptime; date; time nice -10 bitbake obmc-phosphor-image; date; upt=
ime

...
WARNING: python-pygobject-2.28.7-r0 do_patch: Fuzz detected:

Applying patch obsolete_automake_macros.patch
patching file configure.ac
Hunk #2 succeeded at 82 with fuzz 1.

The context lines in the patches can be updated with devtool:

    devtool modify python-pygobject
    devtool finish --force-patch-refresh python-pygobject <layer_path>

Don't forget to review changes done by devtool!

WARNING: python-pygobject-2.28.7-r0 do_patch: QA Issue: Patch log
indicates that patches do not apply cleanly. [patch-fuzz]
WARNING: obmc-phosphor-sysd-1.0-r1 do_package_qa: QA Issue:
obmc-phosphor-sysd: SRC_URI uses PN not BPN [src-uri-bad]
NOTE: Tasks Summary: Attempted 4146 tasks of which 2542 didn't need to
be rerun and all succeeded.

Summary: There were 12 WARNING messages shown.

real    13m43.299s
user    0m7.645s
sys     0m1.221s
Thu Nov 14 14:17:07 CST 2019
...
[build]$ ls tmp
abi_version  cache   hosttools  pkgdata  saved_tmpdir    stamps
sysroots-components  work-shared
buildstats   deploy  log        qa.log   sstate-control  sysroots  work
[build]$ ls tmp/deploy/
images  licenses  rpm
[build]$ ls tmp/deploy/images
evb-ast2500
[build]$ ls tmp/deploy/images/evb-ast2500/
aspeed-ast2500-evb--5.3.11+git0+d41fa1fda1-r0-evb-ast2500-20191114200346.dt=
b
aspeed-ast2500-evb.dtb
aspeed-ast2500-evb-evb-ast2500.dtb
aspeed-image-initramfs-evb-ast2500-20191114200346.rootfs.cpio.xz
aspeed-image-initramfs-evb-ast2500-20191114200346.rootfs.manifest
aspeed-image-initramfs-evb-ast2500-20191114200346.testdata.json
aspeed-image-initramfs-evb-ast2500.cpio.xz
aspeed-image-initramfs-evb-ast2500.manifest
aspeed-image-initramfs-evb-ast2500.testdata.json
fitImage
fitImage--5.3.11+git0+d41fa1fda1-r0-evb-ast2500-20191114200346.bin
fitImage-aspeed-image-initramfs-evb-ast2500--5.3.11+git0+d41fa1fda1-r0-evb-=
ast2500-20191114200346.bin
fitImage-aspeed-image-initramfs-evb-ast2500-evb-ast2500
fitImage-evb-ast2500.bin
fitImage-its--5.3.11+git0+d41fa1fda1-r0-evb-ast2500-20191114200346.its
fitImage-its-aspeed-image-initramfs-evb-ast2500--5.3.11+git0+d41fa1fda1-r0-=
evb-ast2500-20191114200346.its
fitImage-its-aspeed-image-initramfs-evb-ast2500-evb-ast2500
fitImage-its-evb-ast2500
fitImage-linux.bin--5.3.11+git0+d41fa1fda1-r0-evb-ast2500-20191114200346.bi=
n
fitImage-linux.bin-evb-ast2500
obmc-phosphor-image-evb-ast2500-20191114200346.rootfs.manifest
obmc-phosphor-image-evb-ast2500-20191114200346.rootfs.tar.gz
obmc-phosphor-image-evb-ast2500-20191114200346.testdata.json
obmc-phosphor-image-evb-ast2500.manifest
obmc-phosphor-image-evb-ast2500.tar.gz
obmc-phosphor-image-evb-ast2500.testdata.json
[build]$

Not that there is NOT an mtd file, but the bin file mentioned in the
other post is there. I am not certain what the differing extensions
mean right now though.

On Mon, Oct 28, 2019 at 12:37 AM Muggeridge, Matt
<matt.muggeridge2@hpe.com> wrote:
>
> Tyler,
>
>
>
> I have encountered the same issue, and also found that it had been raised=
 as Issue #3610, for which there is currently no response.
>
>
>
> FWIW, for me, I was only trying to gain experience with the OpenBMC dev e=
nvironment and create something to emulate in QEMU.  This initial hurdle wa=
s very frustrating and time-wasting, as there are several components that d=
on=E2=80=99t build using the supplied instructions, and the =E2=80=9CIssues=
=E2=80=9D raised on github are unanswered.  I ended up targeting a machine =
name that is supported by the =E2=80=9C./setup=E2=80=9D script (for a list =
of machines, execute =E2=80=9C. ./setup=E2=80=9D), as described in the Open=
BMC Wiki.
>
>
>
> Matt.
>
>
>
> From: Deng Tyler <tyler.sabdon@gmail.com>
> Sent: Tuesday, 22 October 2019 6:28 PM
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: There is no image generated while build ast2500 evb
>
>
>
> Hi All:
>
>     I build openbmc latest version, just clone openbmc master branch, and=
 do following command:
>
> export TEMPLATECONF=3D./meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf
>
> . openbmc-env
>
> bitbake obmc-phosphor-image.
>
> After build successfully, there is no file "flash-evb-ast2500" and any *.=
mtd file in /openbmc/build/tmp/deploy/images/evb-ast2500. Could someone hel=
p to build ast2500 evb image? thanks.
>
>
>
> Tyler
>
>
