Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 114D35720F
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 21:55:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Yv075gFpzDqXT
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 05:55:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Z/idsLfM"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YtzS1zdYzDqMC
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 05:54:59 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id y15so40745pfn.5
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 12:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Sk2Xdmuce6UCeEHkSrGuOEyg86WWC0xKZVRtCou/9Ro=;
 b=Z/idsLfMXMVJs3spJgwXtBu5fYwpozWYrh9A5jbkSJOUUirb8Nz4/1lzSffFJpbtaF
 iFsCeK1LzcrBClX8RUhozXKOoqaQDa4u+pwU14opDpPCuCM01LhoIxBTPWSBa2DtwhG/
 YZYo4kuT27tCpGfWVR+L8Arbn53soAwxURSFeXWNmgkuU9Llwbq7GMXKo93rFb184lB5
 WMUZVSbxqzh/y/VTF174rJjwCOiA9pu2kpKol7AOyC0tI59DwxNwm2u9Td78veAAT33k
 vVEvd32ECmmpoA9yS+RrhZi2Yf+jxPqVR9+Uv0gV3QhtbUocfqOZ0CJRnqPCWQOMtKgh
 2brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Sk2Xdmuce6UCeEHkSrGuOEyg86WWC0xKZVRtCou/9Ro=;
 b=HeZx0GvPwjUDwNfKTAezSDgMQ6tDumLrrqEwbgKkix57fsTScVQxRTODMCb3kzrp1C
 Z0Ydsu0aE1mXVXY7uZqM64WzkGS2kgXEvzwZh5ae65UKPohzn+ANIbtYymiQ4efCCZyN
 5jwPFd4Yjbp3xkg4VA0RirXXyEega8reNo+casfMK+Ix6X76SZyAACM5UAWmDHeJQLKK
 BkRNbed54WIlkin9X9TJZuw0Ct4UvQ3H0rSL/B3YemaZVK8QuYjpV/AE6ul48Y1AXwGC
 rhK4TPrRjPXMrlIlDcxKrYfSuh2cxyb8D9o+8y7upFnLzse8NaU1JnsU22deKjtVvmQU
 BxtQ==
X-Gm-Message-State: APjAAAVOGIw4RqzjRFe9yqipCwhNRtOAPkKvQnjBhC2WGr/AFv+rjm5Z
 CaiMp2pIB22L56/VBN95DpgdRG9P0kk2vvDZtU9rpIYU0aA=
X-Google-Smtp-Source: APXvYqz6haNSjGHLZlyj7h1Ile38kxbBBg/XF96e1C046BoCuJten2a2+8grePXtPdcEoMOP+0mgXNlL9/UBVhSgIfo=
X-Received: by 2002:a17:90a:2228:: with SMTP id
 c37mr1019500pje.9.1561578895969; 
 Wed, 26 Jun 2019 12:54:55 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 26 Jun 2019 12:54:44 -0700
Message-ID: <CAO=notyXP_Cdrn_9GMgw+OvPYM7Ge9r_BbMiqgSJqS5EdrsumA@mail.gmail.com>
Subject: phosphor-ipmi-flash: Aspeed LPC Tested
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>
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

The following three out-of-band data mechanisms are tested and
supported by phosphor-ipmi-flash:
 aspeed-p2a-ctl (PCI-to-AHB)
 aspeed-lpc-ctl
 nuvoton LPC

Tested configurations:

All the configurations have the cleanup blob enabled via the default
PACKAGECONFIG in the recipe.

Configuration A:
This uses a static layout image, the lpc bridge, and aspeed.  Because
it's using the static layout, we enable the reboot-update*

EXTRA_OECONF_append_a = " --enable-static-layout"
EXTRA_OECONF_append_a = " --enable-lpc-bridge"
EXTRA_OECONF_append_a = " --enable-aspeed-lpc"
EXTRA_OECONF_append_a = " --enable-reboot-update"
EXTRA_OECONF_append_a = " MAPPED_ADDRESS=0x98000000"

The MAPPED_ADDRESS above is the region for lpc_ctrl in the device-tree.

Host-tool command**:
/tmp/phosphor_ipmi_flash_tool  \
  --command update \
  --interface ipmilpc \
  --image image-bmc \
  --sig image-bmc.sig \
  --type static \
  --address 0xfedc1000 \
  --length 0x1000
Sending over the firmware image.
sending writeMeta
writemeta sent
Sending over the hash file.
sending writeMeta
writemeta sent
Opening the verification file
Committing to /flash/verify to trigger service
Calling stat on /flash/verify session to check status
other
running
success
Returned success
succeeded
Opening the update file
Committing to /flash/update to trigger service
Calling stat on /flash/update session to check status
running
Opening the cleanup blob
Exception received: blob exception received: Received IPMI_CC: busy

Configuration B:
This uses a static layout image, the lpc bridge, and nuvoton.  Because
it's using the static layout, we enable the reboot-update*

EXTRA_OECONF_append_b = " --enable-static-layout"
EXTRA_OECONF_append_b = " --enable-lpc-bridge"
EXTRA_OECONF_append_b = " --enable-nuvoton-lpc"
EXTRA_OECONF_append_b = " --enable-reboot-update"
EXTRA_OECONF_append_b = " MAPPED_ADDRESS=0xc0008000"

Host-tool command**:

/tmp/phosphor_ipmi_flash_tool  \
  --command update \
  --interface ipmilpc \
  --image image-bmc \
  --sig image-bmc.sig \
  --type static \
  --address 0xfedc1000 \
  --length 0x1000
Sending over the firmware image.
sending writeMeta
writemeta sent
Sending over the hash file.
sending writeMeta
writemeta sent
Opening the verification file
Committing to /flash/verify to trigger service
Calling stat on /flash/verify session to check status
other
running
success
Returned success
succeeded
Opening the update file
Committing to /flash/update to trigger service
Calling stat on /flash/update session to check status
running
Opening the cleanup blob
Exception received: blob exception received: Received IPMI_CC: busy

Configuration C:
This uses a static layout image, the pci bridge, and aspeed.  Because
it's using the static layout, we enable the reboot-update*

EXTRA_OECONF_append_c = " --enable-static-layout"
EXTRA_OECONF_append_c = " --enable-pci-bridge"
EXTRA_OECONF_append_c = " --enable-aspeed-p2a"
EXTRA_OECONF_append_c = " --enable-reboot-update"
EXTRA_OECONF_append_c = " MAPPED_ADDRESS=0x47FF0000"

/tmp/phosphor_ipmi_flash_tool  \
  --command update \
  --interface ipmipci \
  --image image-bmc \
  --sig image-bmc.sig \
  --type static
Sending over the firmware image.
sending writeMeta
writemeta sent
Sending over the hash file.
sending writeMeta
writemeta sent
Opening the verification file
Committing to /flash/verify to trigger service
Calling stat on /flash/verify session to check status
other
running
success
Returned success
succeeded
Opening the update file
Committing to /flash/update to trigger service
Calling stat on /flash/update session to check status
running
Opening the cleanup blob
Exception received: blob exception received: Received IPMI_CC: busy

*I'm going to move this to a PACKAGECONFIG.
**Compiled to run in our environment and not the default autotools method.

I haven't tested the ipmibt interface in awhile, but I will give it a
run later.  I'm looking at extending the design to support sending
down the host BIOS image.

Patrick
