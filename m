Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5997B646
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 01:34:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ytDw6TFBzDqSf
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 09:34:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Mnz3XSrr"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ytDH3MlMzDqRn
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 09:33:51 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id az7so29488187plb.5
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 16:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5HjrWxriFXNSPy9XogOsKLBZFWpJrEYTZu+tev7uyec=;
 b=Mnz3XSrrHSbp3cuqHFCDb7YYze2KExOjTnMCO6h35ABgT7SuHVP5K1ZBQsbcpJ9MWO
 NxH2wAus7d94gaue/H893UrPV2oOS4z+Z9yynsC2MDHGo5ZV3wOEiHgOfiJQ5LDGYu8+
 ghMS87g1h9NIdMIqQU36DyGyvd+WsNy3l1DdJ+wAZ8MYaWmeUYaFtx1iwl8t3q8gF70Y
 w1b1m5N44Tx8YQYbyAtksCL3weHedsPyFdz9BMZIj93Mnc472KKC5fNjqmIrMB3uUMOT
 eYObnR0IxDgUJA7M+wrBUK1c1QnOTdBqC0t+3RaFYga5px3S9ltGYLVwy3luVz0776DO
 vZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5HjrWxriFXNSPy9XogOsKLBZFWpJrEYTZu+tev7uyec=;
 b=B36JdpD+2AjO/LYcaRqfIxT+UTZty4pHG8YJiTsodD8jQRIbXQ/KFsSvqsdpmsJJ9R
 6HWDgFl4N5dVTvcUqeLUsd2X6mwJamODL+jXZjE/XTNGtHd45lzww3watXDRaNTa43IQ
 unfjMcthXlr0b4Mwqs6RWEh7PagCopnqyq2tjb9Tw3ZAUDwRDdM1vDWtx1mujzIeizE0
 InJXnBzCS3B8Ge1D76VkCFT9uoJjAlKSCsUEh64RffQgZaYhN1gi4iYhFyKiI4EqK5eo
 XEsFKSdwZkI0yr0q3nPAk7TogGpdLpOURtMDt3S6ugT9yMvmyUZDaBjwe8v5VAJb4a2d
 MGJA==
X-Gm-Message-State: APjAAAVUF3CFgd93d0H7xvX2N/J5M3Uw8+DfkcCAmsS520k+eUHsGrMc
 W44Fqm3mdlsnTd2wXz1AX75POr7MKnqafrBVI3yUYQ==
X-Google-Smtp-Source: APXvYqxW9sDXQAa+6DcuQOMIf1FEq8LYtdxhYcRttLmtamn4cyt9rB6fS/c6S1L1wQCmCo1n+bhsi4hgJH42EHwzbT8=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr116660300plp.47.1564529627683; 
 Tue, 30 Jul 2019 16:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz0NB0+A6LivrKs7+i4nkWE_dWjBP8qV-q41FesZRsUeg@mail.gmail.com>
 <SN6PR2101MB0943F194BD7DF1868ADED4DDC8E40@SN6PR2101MB0943.namprd21.prod.outlook.com>
 <CAO=notwkfzqwYA2hatPP3StNUj7kZLgPbTuf=B2eE8PJsWCqXQ@mail.gmail.com>
 <BYAPR21MB1191D6BE0A9E08752FAC8A76C8DC0@BYAPR21MB1191.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB1191D6BE0A9E08752FAC8A76C8DC0@BYAPR21MB1191.namprd21.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 30 Jul 2019 16:33:36 -0700
Message-ID: <CAO=notwb7gE5=D1j2geodLati2oFCZ=ZYfz5-7tXnuS7c2dsig@mail.gmail.com>
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

On Tue, Jul 30, 2019 at 4:20 PM Neeraj Ladkani <neladk@microsoft.com> wrote=
:
>
> Do we support HPM ?

What is HPM?

>  how do we enable Windows based Inband firmware update?

I haven't tried compiling the host-side tool for windows.  I imagine
cygwin will work, either way, feel free to take a stab at it!

>
> Neeraj
>
>
> -----Original Message-----
> From: Patrick Venture <venture@google.com>
> Sent: Thursday, June 20, 2019 7:26 AM
> To: Neeraj Ladkani <neladk@microsoft.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: phosphor-ipmi-flash making progress!
>
> On Wed, Jun 19, 2019 at 11:23 PM Neeraj Ladkani <neladk@microsoft.com> wr=
ote:
> >
> > What are in-band update methods for OpenBMC? I see this(phosphor-ipmi-f=
lash) can take takes ~3 hours over IPMI. What is the solution for in-band u=
pdate?  what tools can be used?
>
> It supports the LPC memory region interface available with the Aspeed and=
 Nuvoton BMCs.  Then it doesn't take 3 hours.  It also supports using the a=
speed pci-to-ahb bridge on Aspeed.  It will probably support Nuvoton's vari=
ation of that, but that's beyond my current scoping.  As far as tools, i do=
n't entirely know what you mean.  There is a tool in phosphor-ipmi-flash fo=
r the host.
>
> >
> > Neeraj
> >
> > -----Original Message-----
> > From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org>
> > On Behalf Of Patrick Venture
> > Sent: Wednesday, June 12, 2019 6:04 PM
> > To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Subject: phosphor-ipmi-flash making progress!
> >
> > For those interested parties, phosphor-ipmi-flash which provides a vari=
ety of out-of-band mechanisms for updating the BMC in a fully-configurable =
manner is nearly ready for wide distribution.
> >
> > Currently supported: aspeed-p2a-ctrl (ipmipci), and inband (ipmibt)*
> > Shortly supported: aspeed-lpc-ctrl (ipmilpc)
> >
> > *There is a bug in the transmit buffer size depending on whether it's o=
ver KCS versus actually BT since BT has a smaller buffer requirement.
> >
> > UBI Tarball updates aren't yet supported, but that's only a matter of s=
omeone writing an update handler.  The firmware handler on the BMC can be e=
xtended easily to support a variety of verification and update mechanisms. =
 The default behavior is to leverage a service for each of these things.  O=
ne can implement whatever they really want for each service.
> >
> > The file sent to the BMC isn't required to have a signature file.  One =
could simply skip sending the hash file and have a verification step that d=
oesn't do anything special.  So, it's very flexible.
> >
> > Here's some output:
> >
> > $ ./phosphor_ipmi_flash_tool --command update --interface ipmipci
> > --image image-bmc --sig image-bmc.sig
> >
> > Sending over the firmware image.
> > [0x1a03 0x2000]
> > The bridge is enabled!
> > Received address: 0x47ff0000
> > Sending over the hash file.
> > [0x1a03 0x2000]
> > The bridge is enabled!
> > Received address: 0x47ff0000
> >
> > Opening the verification file
> > Committing to /flash/verify file to trigger service Calling stat on
> > /flash/verify session to check status other running running success
> > Returned success succeeded
> >
> > Opening the update file
> > Committing to /flash/update file to trigger service Calling stat on
> > /flash/update session to check status running Exception received: blob
> > exception received: Received IPMI_CC: busy
> >
> > On the BMC:
> > shutdown: reboot --timeout 90000000us --log-level 6 --log-target kmsg
> > --log-color
> > + awk '/oldroot|mnt/ { print $2 }'
> > + sort -r
> > + umount /oldroot/sys/kernel/debug
> > + umount /oldroot/sys/fs/cgroup/unified umount
> > + /oldroot/sys/fs/cgroup/systemd umount /oldroot/sys/fs/cgroup umount
> > + /oldroot/sys/fs/bpf umount /oldroot/sys umount /oldroot/proc umount
> > + /oldroot/dev/shm umount /oldroot/dev/pts umount /oldroot/dev umount
> > + /oldroot umount /mnt/initramfs/rw umount /mnt/initramfs/ro umount
> > + /mnt set +x
> > Pinging watchdog with args -t 1 -T 5
> > update: --clean-saved-files
> > [ 8240.817801] jffs2: notice: (1171) jffs2_build_xattr_subsystem:
> > complete building xattr subsystem, 17 of xdatum (15 unchecked, 1
> > orphan) and 30 of xref (1 dead, 0 orphan) found.
> > Updating bmc...
> > Erasing block: 69/512 (13%)
> >
> > Given a BMC configuration:
> > EXTRA_OECONF_append_quanta-q71l =3D " --enable-static-layout"
> > EXTRA_OECONF_append_quanta-q71l =3D " --enable-pci-bridge"
> > EXTRA_OECONF_append_quanta-q71l =3D " --enable-aspeed-p2a"
> > EXTRA_OECONF_append_quanta-q71l =3D " --enable-reboot-update"
> > EXTRA_OECONF_append_quanta-q71l =3D " MAPPED_ADDRESS=3D0x47FF0000"
> >
> >
> > Patrick
