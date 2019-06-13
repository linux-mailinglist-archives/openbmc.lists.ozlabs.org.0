Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE34320F
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 03:04:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PQWS4X6mzDr7f
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 11:04:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gstokYEd"; 
 dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PQVv6vWjzDqlJ
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 11:04:15 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id m30so10165250pff.8
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 18:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YcY24ADdjB8MVXXWVdKPect4oe7EicUa6DXgs4vvUkg=;
 b=gstokYEd0Hb/DhWv2iKMW1QVx0NNy1LctnDAvkWVoPBwTdFOfXBAeRAk5+0RAHXpgA
 jbP7Mn4O4MZ8rRyY3L1p+VSJunqcNUk5KIKBVQ4+VPFDwL1paY0yVo1WQYabvGIKKcse
 yJNuQpHOY139KWeTQl0pfTpie/IKodR30KbRgidUWFiUfc1RptvajGDUPXfSjWqvoukM
 2ow09/KFc9NlFgxoKtQexLnucQb2dWh2/U0slH1p2WnVNS4NUb1qzsOn5eGEHP27MyM2
 OLERgLUH9cltkoZ2YcrqPgHjw+dzoUcknEajOqtbNbcp9SrDgMUrxVJl29m5EXBFEUDV
 YFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YcY24ADdjB8MVXXWVdKPect4oe7EicUa6DXgs4vvUkg=;
 b=RKL7jyNejrMU86zXtnOSbeNJI8muu+/Mcgv4tG4j4E5Mw8jhwKreot7jwgXuiOMsUx
 iaHA9sPdqii/DVSKdDOIDnt4xtsjuhnHHr5Gb83JuVlHr74LXHz+1AQ6I+ZAhL+jE5RW
 NhYVPSZ6UL/sk8VxajUJHG7B7cn0wJ2DSuYVmDxKAcEZKtG7UXCOwmiRSAzbXQLaXg9o
 39UPJ5wOlkDC9fUlB1vxB521mBu5GC7FPhk6l59FfEvXPax4gTO/TYjRE48imsJDGLUq
 914Jzr2A14zjiDKYB4QnPjJPiByOJmdAdFzT0bFIqxXFLgFYwcxkG8bCKo807/CbUOFe
 ayRQ==
X-Gm-Message-State: APjAAAWhtW9ykJint09c4x9dPpjr89HaOjJub5aEia2R4/pPGSE79uHa
 QM6Eyg4cV9/hbH6Bw5P6gsJT0yiVabfmD4M0eA0ZzlUQGso=
X-Google-Smtp-Source: APXvYqz90p12lphXFfgb53uHPE1XuiAqL/vWgKlLfIlnzMkVt6ECP5ZegTGXcEjggP6f1xnBtvwhJW4T6ZDRw27h8Sg=
X-Received: by 2002:a17:90a:aa81:: with SMTP id
 l1mr1904135pjq.55.1560387851661; 
 Wed, 12 Jun 2019 18:04:11 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 12 Jun 2019 18:04:00 -0700
Message-ID: <CAO=notz0NB0+A6LivrKs7+i4nkWE_dWjBP8qV-q41FesZRsUeg@mail.gmail.com>
Subject: phosphor-ipmi-flash making progress!
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

For those interested parties, phosphor-ipmi-flash which provides a
variety of out-of-band mechanisms for updating the BMC in a
fully-configurable manner is nearly ready for wide distribution.

Currently supported: aspeed-p2a-ctrl (ipmipci), and inband (ipmibt)*
Shortly supported: aspeed-lpc-ctrl (ipmilpc)

*There is a bug in the transmit buffer size depending on whether it's
over KCS versus actually BT since BT has a smaller buffer requirement.

UBI Tarball updates aren't yet supported, but that's only a matter of
someone writing an update handler.  The firmware handler on the BMC
can be extended easily to support a variety of verification and update
mechanisms.  The default behavior is to leverage a service for each of
these things.  One can implement whatever they really want for each
service.

The file sent to the BMC isn't required to have a signature file.  One
could simply skip sending the hash file and have a verification step
that doesn't do anything special.  So, it's very flexible.

Here's some output:

$ ./phosphor_ipmi_flash_tool --command update --interface ipmipci
--image image-bmc --sig image-bmc.sig

Sending over the firmware image.
[0x1a03 0x2000]
The bridge is enabled!
Received address: 0x47ff0000
Sending over the hash file.
[0x1a03 0x2000]
The bridge is enabled!
Received address: 0x47ff0000

Opening the verification file
Committing to /flash/verify file to trigger service
Calling stat on /flash/verify session to check status
other
running
running
success
Returned success
succeeded

Opening the update file
Committing to /flash/update file to trigger service
Calling stat on /flash/update session to check status
running
Exception received: blob exception received: Received IPMI_CC: busy

On the BMC:
shutdown: reboot --timeout 90000000us --log-level 6 --log-target kmsg
--log-color
+ awk '/oldroot|mnt/ { print $2 }'
+ sort -r
+ umount /oldroot/sys/kernel/debug
+ umount /oldroot/sys/fs/cgroup/unified
+ umount /oldroot/sys/fs/cgroup/systemd
+ umount /oldroot/sys/fs/cgroup
+ umount /oldroot/sys/fs/bpf
+ umount /oldroot/sys
+ umount /oldroot/proc
+ umount /oldroot/dev/shm
+ umount /oldroot/dev/pts
+ umount /oldroot/dev
+ umount /oldroot
+ umount /mnt/initramfs/rw
+ umount /mnt/initramfs/ro
+ umount /mnt
+ set +x
Pinging watchdog with args -t 1 -T 5
update: --clean-saved-files
[ 8240.817801] jffs2: notice: (1171) jffs2_build_xattr_subsystem:
complete building xattr subsystem, 17 of xdatum (15 unchecked, 1
orphan) and 30 of xref (1 dead, 0 orphan) found.
Updating bmc...
Erasing block: 69/512 (13%)

Given a BMC configuration:
EXTRA_OECONF_append_quanta-q71l = " --enable-static-layout"
EXTRA_OECONF_append_quanta-q71l = " --enable-pci-bridge"
EXTRA_OECONF_append_quanta-q71l = " --enable-aspeed-p2a"
EXTRA_OECONF_append_quanta-q71l = " --enable-reboot-update"
EXTRA_OECONF_append_quanta-q71l = " MAPPED_ADDRESS=0x47FF0000"


Patrick
