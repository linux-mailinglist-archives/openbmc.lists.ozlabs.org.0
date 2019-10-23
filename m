Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4448E21EC
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 19:38:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yyKQ450vzDqRM
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 04:38:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MUXxkiB7"; 
 dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yyJh6q1hzDqPm
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 04:38:11 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id k7so10441716pll.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 10:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=QKUXBfltbigpWLiAExpkrcXLXU7EF6bu99puJV1P8bA=;
 b=MUXxkiB7I/mqaVLWIgaIM+5FWKhnd0ISj4PiV3SGs783ee6rzJSr0ZL6nxjb61YR17
 j6wNA4eYpUw42fRLXiQjySOtLd/Q5d78qMh9tjiMWBy8DpS6b48iV7b48TMx0zewIfJj
 9feus7Ko1iwbQTy6S19TVdhJPtI73xmKDHjKum4tdLBHgnzr12fDaKLUpATQJ8FGKIHN
 /HeA6jJIhd5jttP1E7wad703asq4FD51WDzkechCPR+ZURuze5V2dFDtdNxXalEE1D/n
 VN1MRCPcVZ1LU08eSDMQPN9rmqg/a8RamkjH3G6yVkSKDxBN9lL2sSUFo6zdFZxPe3Ha
 VeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=QKUXBfltbigpWLiAExpkrcXLXU7EF6bu99puJV1P8bA=;
 b=XEEBa09eIq6iKfhy0wGumumrvgX7U5jgMByGrxAEAapC1wnIjzexU/6U55uhJa0kQC
 RirWIMmZEjUJUSPXHRqjijvEgYITGlRvPPlOAN50HO/omXE1fpBNzCfIX688GhlyfH6e
 hfFiAR4xctwWQpxrnbwxpCl+BnAMeezFhnM49XIj0sPQo6zcGP1zJclybsyvQjXwjgFL
 1QK83G9BGqiOBNHHJeOLhHb5W/QvXCLy4oh+gh90DMv2SPvMF3QaPK3nIe+U1ngpFMWl
 ftrLMnf1BOBjt5BQIOsiDGbMp5hhY0bdL4XEn9yutmJUtioZd45O87CKUb4nwBn6B/du
 hCng==
X-Gm-Message-State: APjAAAUI4nctdypKpJPMQHz4qyUvRxjFIweKC5Tt3r1Iy2fyFdXTjhlc
 BFrHQiX8fw2R7nTZsze0jPeDoqona+jVNdehPhijJg==
X-Google-Smtp-Source: APXvYqyIA4S1udb8h6mwBgHj8I363uC7waNM/3XpZRJp3RtoI/0T30BtGY82rxhMv/ARi4H8VycMoxcjb+gpo6CXsvw=
X-Received: by 2002:a17:902:8d83:: with SMTP id
 v3mr10948835plo.47.1571852287462; 
 Wed, 23 Oct 2019 10:38:07 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 23 Oct 2019 10:37:56 -0700
Message-ID: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
Subject: PSU Sensors - Associations
To: James Feist <james.feist@linux.intel.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Peter Lundgren <peterlundgren@google.com>, Josh Lehan <krellan@google.com>
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

So, I flipped the association interface addition and the property
initialization to match other sensors, and then it started working.  I
was curious if you had any suggestions on how to find the matching
sensor given the paths, for instance:

busctl get-property xyz.openbmc_project.PSUSensor
/xyz/openbmc_project/sensors/temperature/alt2_Temperature
xyz.openbmc_project.Association.Definitions Associations
a(sss) 1 "chassis" "all_sensors"
"/xyz/openbmc_project/inventory/system/board/Altie"

busctl tree --no-pager xyz.openbmc_project.EntityManager|grep Altie
          |-/xyz/openbmc_project/inventory/system/board/Altie
          | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_0
          | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_1
          | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_2
          | `-/xyz/openbmc_project/inventory/system/board/Altie/alt1

No alt2 -- so how do I know this?  I can walk every subordinate object
to find the name match, but I was curious if you had a faster idea?

Thanks,
Patrick
