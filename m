Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B97A39801E
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 06:18:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fvwkx4SxGz305k
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 14:18:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gKsU4ELW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2b;
 helo=mail-vs1-xe2b.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gKsU4ELW; dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fvwkd6xThz2xfk
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 14:18:33 +1000 (AEST)
Received: by mail-vs1-xe2b.google.com with SMTP id z206so411403vsz.6
 for <openbmc@lists.ozlabs.org>; Tue, 01 Jun 2021 21:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yEpdrDR5+xKaZdd+vJLmTMeACE8TCGmYip/LHJinISk=;
 b=gKsU4ELWgZRvMS1B0hFOnjrfpUIJma0M1pu8MxhQwDoDPH0zCb8d8hyyKl60ZwoYT+
 H4FljVTe3rkiIDJSWzaJ7dTnywuQM0IaTYVvlUqbheTXshRzu4xHcQiKWLypao1tAS2w
 Jwp+fT1ffTivsaSugEtg3jBQE4WOIve1z4vL9A9vB6WURLjLPJC0cLJRKQ6ibxtp61oz
 I1uP9MVZUt63U2BvwwgxCK2VANELA1AhYYkwNFJz4SgGUc7QO2hSJ/mvD9Evc/6Tk/Cx
 YYRBrdJ7heyJov6uTwTMJOwS/4BqxyQ83XL4edNErMF1cZf3TKkMdYWIwZunAIOB48M/
 jQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yEpdrDR5+xKaZdd+vJLmTMeACE8TCGmYip/LHJinISk=;
 b=nJ7BYFFcebtikHGYLIUvLHfJicfoDzRmQ3vN9IQiteznBXIjt/UbqmBDovH/H6Hsav
 DWeykQX5DUNfkaodkjoHXuxNpeThoqur+W5Kd8I5Y5XZtPxb85G1N7lzaT/ZO06VxyEz
 MJPg8ZE3pMFnUQDfQXHSRSBnF7UlcTW8fXGWudAmiRWcZ/xjquar6J1r7VffjcJZWNKi
 D8mkU/SKANax6e+jz1IrKPm/KKk5FUlbzDyUJlML9dft6f9Jq+IiW+qZp1jN6FxBYq/P
 PnaDtvdaJBsBHmkWBoAl+OBbq71YWFOOV1/xuGB6rtCM9Bk+69TFzDqz5d59+KZRk7cf
 AimA==
X-Gm-Message-State: AOAM531QajHxVkjUtpr7tRGWuX0fEEnq93YYZO4Z/UPKijEXQTLLsYw6
 3WJE1uSihtf3nvsQdU5fKqgpt7T3JwuuTOf0b6fPoX2m
X-Google-Smtp-Source: ABdhPJznTdOluFKVqNBO8T1T8x753qlAzMu5dKfgHgA+s+M6eoCGGFISApntatrEdrks6N5W8UbJ4QEHLI/ih9ww0WM=
X-Received: by 2002:a67:eec3:: with SMTP id o3mr22817836vsp.33.1622607508843; 
 Tue, 01 Jun 2021 21:18:28 -0700 (PDT)
MIME-Version: 1.0
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Wed, 2 Jun 2021 09:48:18 +0530
Message-ID: <CAM=TmwX7VjvmaE0dMDvVfdOJ0dRCjXDu2-TcoUdGFSMsLWm81g@mail.gmail.com>
Subject: Standard FW update package structure - use PLDM?
To: openbmc@lists.ozlabs.org
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

Hi,

The PLDM FW update spec [1] defines a structure to package firmware
images - primarily to identify target devices and to associate them
with software versions. This is done via metadata in the package, and
the metadata itself is defined in terms of generic concepts (like
UUIDs, PCI vendor IDs, version strings etc). For devices that do
support PLDM, the 'UpdateAgent' (typically the BMC) uses this package
structure plus a set of standard PLDM commands to talk to the devices
to perform FW update.

For platforms that enable FW update of multiple entities through the
BMC (this could be a mix of the BMC itself and other PLDM/non-PLDM
devices), I think the current OpenBMC mechanism involves the use of a
VersionPurpose [2] interface in order to map FW images to devices. A
couple of problems with this approach:
- Can this enumeration cover all possible device types?
- How does this fit with PLDM?

Instead of the VersionPurpose based approach, how about using the PLDM
FW update package structure as the standard to target devices and to
associate devices with versions, even for non-PLDM devices? This means
FW images uploaded to the BMC will be packaged in the PLDM FW update
format. I don't think this is a violation of the PLDM FW update spec
(also checking with PMCI WG). For non-PLDM devices, this means using
just the package structure, not PLDM commands.

[1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0267_1.1.0.pdf
[2] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Version.interface.yaml#L19

Thanks,
Deepak
