Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AA74D05F
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 16:27:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V40g5KzqzDrHg
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 00:27:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CCY8ZKW/"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V3zT2FhJzDrCS
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 00:26:44 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id 19so1779578pfa.4
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 07:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NQ5+3VVNc/XMZGp4KFM02MSTkqdqr5qZZLra75dbLvw=;
 b=CCY8ZKW/YTfNn9iBdF4ps69Aoylbi4VoI/In2RlkWEll0mtYY7jQggl0Ui9THWnW2H
 O9/v/M1onHRIUtu1Vn5pWcG4qsuB+S/8QTKC5xHlNRxN/uCjJDaSZ93d1X4GgYIPXtwM
 ckaC3f9MryAyItCQb1TrebFXLkDCLHXXq+pHf+bX4t9cad6oUByiAMeoaSddgcxEoSnF
 B5fxdzObL9GL82+uzPhM0sE/pOk6SfQfF5wI3lr9oB1MAbiSuY3Jjx4i3dqE7JnJxdUr
 Pcfn/yuL8IxCWTIUtSfvjCfUQusuWVxofgkO9VOqXpdMizS8t9HDpbNYKdwU+V3ufXmq
 7GLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NQ5+3VVNc/XMZGp4KFM02MSTkqdqr5qZZLra75dbLvw=;
 b=lXPCxXWRy8dQU8o0qdoVPTA4lDt14KCCxPiR8XTcs8Zb5G6znr8m190np/8mr6WVws
 C2BDa/qaXfGWHko8ooE96IrJTQqaf78OnTVguRd5jKI2r9LD2N4aGQ2jcmTtWLeEBEt+
 pNukqb3JfCCaE3QAOXDeKRFzizZ35RriDtLgWJsKRGSPJyt5u5QnLQw11F3NGcps8FaI
 1v9bVC8m0dlW1EtXOPXYg1Zn+hEHj7zJPu+OqZgGbDbQk3BmhMCqS+YqfMUnJaS71aIv
 I1MaO4crUq3iFXY/JOGd9+ixchSGrR5ZlbAD5I3n+bEvkFU8i2J/fW8sYjBYdXe73to5
 clVg==
X-Gm-Message-State: APjAAAWxh78CN6HVXoGmPaPOaBRgf8+JCu3e8IFZvLBBG9jG+Wg2mcSG
 4ABk+UUL8v2KDCsvyrM0ZOwMVatMR+i12bxyF1PlsA==
X-Google-Smtp-Source: APXvYqw/af5PfEjul7PTWxplP1r1RPh4UJgWYkkSXRaVLIz8hVTpQwjkRzQugOIPQ+6wj/+uknaON4GZNfSOCRajvNM=
X-Received: by 2002:a17:90a:23a4:: with SMTP id
 g33mr3465251pje.115.1561040800990; 
 Thu, 20 Jun 2019 07:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz0NB0+A6LivrKs7+i4nkWE_dWjBP8qV-q41FesZRsUeg@mail.gmail.com>
 <SN6PR2101MB0943F194BD7DF1868ADED4DDC8E40@SN6PR2101MB0943.namprd21.prod.outlook.com>
In-Reply-To: <SN6PR2101MB0943F194BD7DF1868ADED4DDC8E40@SN6PR2101MB0943.namprd21.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 20 Jun 2019 07:26:29 -0700
Message-ID: <CAO=notwkfzqwYA2hatPP3StNUj7kZLgPbTuf=B2eE8PJsWCqXQ@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash making progress!
To: Neeraj Ladkani <neladk@microsoft.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 19, 2019 at 11:23 PM Neeraj Ladkani <neladk@microsoft.com> wrot=
e:
>
> What are in-band update methods for OpenBMC? I see this(phosphor-ipmi-fla=
sh) can take takes ~3 hours over IPMI. What is the solution for in-band upd=
ate?  what tools can be used?

It supports the LPC memory region interface available with the Aspeed
and Nuvoton BMCs.  Then it doesn't take 3 hours.  It also supports
using the aspeed pci-to-ahb bridge on Aspeed.  It will probably
support Nuvoton's variation of that, but that's beyond my current
scoping.  As far as tools, i don't entirely know what you mean.  There
is a tool in phosphor-ipmi-flash for the host.

>
> Neeraj
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org> O=
n Behalf Of Patrick Venture
> Sent: Wednesday, June 12, 2019 6:04 PM
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: phosphor-ipmi-flash making progress!
>
> For those interested parties, phosphor-ipmi-flash which provides a variet=
y of out-of-band mechanisms for updating the BMC in a fully-configurable ma=
nner is nearly ready for wide distribution.
>
> Currently supported: aspeed-p2a-ctrl (ipmipci), and inband (ipmibt)* Shor=
tly supported: aspeed-lpc-ctrl (ipmilpc)
>
> *There is a bug in the transmit buffer size depending on whether it's ove=
r KCS versus actually BT since BT has a smaller buffer requirement.
>
> UBI Tarball updates aren't yet supported, but that's only a matter of som=
eone writing an update handler.  The firmware handler on the BMC can be ext=
ended easily to support a variety of verification and update mechanisms.  T=
he default behavior is to leverage a service for each of these things.  One=
 can implement whatever they really want for each service.
>
> The file sent to the BMC isn't required to have a signature file.  One co=
uld simply skip sending the hash file and have a verification step that doe=
sn't do anything special.  So, it's very flexible.
>
> Here's some output:
>
> $ ./phosphor_ipmi_flash_tool --command update --interface ipmipci --image=
 image-bmc --sig image-bmc.sig
>
> Sending over the firmware image.
> [0x1a03 0x2000]
> The bridge is enabled!
> Received address: 0x47ff0000
> Sending over the hash file.
> [0x1a03 0x2000]
> The bridge is enabled!
> Received address: 0x47ff0000
>
> Opening the verification file
> Committing to /flash/verify file to trigger service Calling stat on /flas=
h/verify session to check status other running running success Returned suc=
cess succeeded
>
> Opening the update file
> Committing to /flash/update file to trigger service Calling stat on /flas=
h/update session to check status running Exception received: blob exception=
 received: Received IPMI_CC: busy
>
> On the BMC:
> shutdown: reboot --timeout 90000000us --log-level 6 --log-target kmsg --l=
og-color
> + awk '/oldroot|mnt/ { print $2 }'
> + sort -r
> + umount /oldroot/sys/kernel/debug
> + umount /oldroot/sys/fs/cgroup/unified
> + umount /oldroot/sys/fs/cgroup/systemd
> + umount /oldroot/sys/fs/cgroup
> + umount /oldroot/sys/fs/bpf
> + umount /oldroot/sys
> + umount /oldroot/proc
> + umount /oldroot/dev/shm
> + umount /oldroot/dev/pts
> + umount /oldroot/dev
> + umount /oldroot
> + umount /mnt/initramfs/rw
> + umount /mnt/initramfs/ro
> + umount /mnt
> + set +x
> Pinging watchdog with args -t 1 -T 5
> update: --clean-saved-files
> [ 8240.817801] jffs2: notice: (1171) jffs2_build_xattr_subsystem:
> complete building xattr subsystem, 17 of xdatum (15 unchecked, 1
> orphan) and 30 of xref (1 dead, 0 orphan) found.
> Updating bmc...
> Erasing block: 69/512 (13%)
>
> Given a BMC configuration:
> EXTRA_OECONF_append_quanta-q71l =3D " --enable-static-layout"
> EXTRA_OECONF_append_quanta-q71l =3D " --enable-pci-bridge"
> EXTRA_OECONF_append_quanta-q71l =3D " --enable-aspeed-p2a"
> EXTRA_OECONF_append_quanta-q71l =3D " --enable-reboot-update"
> EXTRA_OECONF_append_quanta-q71l =3D " MAPPED_ADDRESS=3D0x47FF0000"
>
>
> Patrick
