Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D39466996D
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 18:58:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nV8Y5qjwzDqSZ
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 02:58:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HznXhQcV"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nV7t3GPqzDqRm
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 02:57:28 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id q10so7686547pff.9
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 09:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L8JaYs7KFVndmY8AoKzf7M7pu3WcZ9PataY8FXMAzJc=;
 b=HznXhQcVwJAEpbYoLTa+SV4f/M4IXJwFatYUZNFbqDNe+u36HMZpYc+4u8kwAQue5Y
 2NYdTXVfnY9PmtLR5tvU9UXeQ9mqJe9I4SOzQiCIxxMkxYqtBST1Ctu2QqxG4o8e+VWE
 qXanN2MiKmcvlAGfD+RbcOHQYVL98q5/jS3JjgutbGRHbfCG5drBmZqKP3vFsam/ah5g
 McdBJ9o8eB0WUBbD2io79XT3zGChEZHYqqUsrK9Hk37zfiUcjsjd1jNlkbmiRfUIEv7p
 micmavu2vwrIrM2MANHt7vrU8+23r+Y4HRVhsZfUU0NF6E4Gf8AzQXVhOeoxklwjzLWE
 n/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L8JaYs7KFVndmY8AoKzf7M7pu3WcZ9PataY8FXMAzJc=;
 b=kh4mg/2knA+M9rJ7LWb6j27avMotDuzFuT6pKgMIaSaLBJU1GUoRb6hpPkxsokQNp0
 AmfMvLOO8xWTu+R1JvBjE0x7tCg1U1U6KCh52NiiTUOivIKfa0bqQbmOIlodQ86IULcI
 OVElM1hhKUY0U370n/FFtyAUC//zqC/TusNIz5jTavGfv7IzGBLBJJXub4HHSJHjl2a9
 3bpbEiBZq/XNrUxs2HOh9dRsjJr3jxPec6V64S5bD5WpamUTGwA5pDaXgpfUTrRdoYAG
 lo9EXVmlIZuZsDG8t75RhOdJLcZuPHubWgZUNyUt9Y+luJ5Z/wnQ7kgt5004fqQ4ij8E
 kI+w==
X-Gm-Message-State: APjAAAU1XJwpwLp9MEGxhqxniKd0E3RBwQQxP7SZeyHbXnqgsiJFxnQ6
 O1DA7suYAhTZzSYk6YWXEG3pGOWfDEZaD7ptJBINT03TVozmYQ==
X-Google-Smtp-Source: APXvYqwN+sMLapVdZvdaLuGfQtl81tAgE0Pk0uMhdNy+VLek81b1JbDWqwPpWH3DOOSwOl3tOTeLD5suOuBqjm140o0=
X-Received: by 2002:a17:90a:bf0e:: with SMTP id
 c14mr29017157pjs.55.1563209844753; 
 Mon, 15 Jul 2019 09:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <aca67083725a43149c4571df9f13e9f1@quantatw.com>
In-Reply-To: <aca67083725a43149c4571df9f13e9f1@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 15 Jul 2019 09:57:13 -0700
Message-ID: <CAO=notxTxvukUUQq6WNJF7Ya5g=809VzsYcKRbpid=b5Db6xfg@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash in-band update question
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
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
Cc: "OpenBMC Maillist \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 10, 2019 at 2:00 AM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> Hi Patrick,
>
>
>
> We=E2=80=99d like to do in-band firmware update by phosphor-ipmi-flash, b=
ut it must provide the signature file otherwise it exited directly.

You must provide a verification mechanism, this can just be a script
that writes "success" to the output file.

That can be in a script that's called by a service installed to the
verification target listed on the README.

IMAGE_FILE=3D/run/initramfs/bmc-image
VERIFIED_FILE=3D/run/initramfs/image-bmc
STATUS_FILE=3D/tmp/bmc.verify
mv ${IMAGE_FILE} ${VERIFIED_FILE}
echo "success" > ${STATUS_FILE}

>
>
>
> How do we make the appropriate signature file for phosphor-ipmi-flash and=
 also verify it successfully ?

You can do whatever signature you wish, could just be md5sum.  In
which case, on the host you can md5sum the image-bmc file, and then
write the md5sum to a file, that's sent down as the signature file.
Then the script above could compare the md5s before writing success.

Are you using static layout, or ubi?
If you're using static layout, it currently writes the bytes to
IMAGE_FILE above by default.  So you'd need something like the above
script to move it into a usable update name.

Again, this is if you're using this type of update mechanism.  If
you're using phosphor-bmc-code-mgmt, then there is something more to
be done, and it's not yet supported.  Hopefully it will be in a couple
weeks.

>
>
>
> Or is there a way to do FW update without a signature file?

Yes, see above.  Although I do recommend trying to check against
something to validate the bytes are what you expect.
>
>
>
> Besides, since we use Nuvoton BMC to update by LPC bridge, it needs to co=
nfigure the MAPPED_ADDRESS as the reserved memory region.
>
>
>
> Does it have to add the similar configuration to device tree like Aspeed =
?

Yes.  The MAPPED_ADDRESS for the Aspeed is the memory-region you've
set aside in your device-tree for the BMC.

>
>
>
>
>
> Thanks.
