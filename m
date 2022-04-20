Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80E5092EA
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 00:37:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkFsm2v90z3bWt
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 08:37:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aXQw8P4V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=aXQw8P4V; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkFsL6yH0z2xSh
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 08:36:52 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id p21so3465720ioj.4
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KtOW4cPzMzwQbiOFRK9GzoQAUQMWX2QpflZ5f/qDnbk=;
 b=aXQw8P4V+eE54eXVybU8Yd8+aZS6kuHt+2HDV9iowZF7JYl5/lxn+TwVfoNKwajpJK
 hpobb3sAKUBFGUXyu1aw1C1UiO1LAGGG/DspGx712bOzftIvEC6N1YpF3IIdEJOhecyq
 oI6k9swdmFHr3aknmpNIpYUduLdz/yCCjuFmRlhgTkI62Ixvq+ySEH8E0GH2A/P9D04K
 UJL6PbxiGux7xgmVJ0uGKeJs+B2Jyat/w2iibB+uylNrXdzc9wey1+E+ZUW2C8lRAE2a
 2jlL0vPJIXcKjL+dIKUWQPC4QPBN+ikokNapgD4CJ/G9If9Rzy/gpY48qTpCxCub3f8Y
 I3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KtOW4cPzMzwQbiOFRK9GzoQAUQMWX2QpflZ5f/qDnbk=;
 b=uJkOzVh3/7qx86hYMkwNx54MBxmNK/b60xa/SWLbuvqeBp+eVk6fCLcINzrzrCmueP
 ko5IxYyd/HtszFjbDqXREIgYtrHIu94HSRjT056qmVgP+rVsdn9Qmhn79qNX/owUL8gz
 K5nXUik9EmwL9hwsvVUpu0Ssdj3s24LUvOy5RT1oTdv7Q+Mm88m6+em55/8ngM63/s+1
 ROmRmn+HeBpBfs+A9FY24+WC3INFQM1FkawoPsynJ8xiChxCmwH7qRgrfktNFUQyLAlp
 CpNLrV73uIjEU29kuQxBLZDTFxsIFE6uKeJ32bd35z0/FoxsZdzl+RnIOn4BDjztDYnd
 GhuA==
X-Gm-Message-State: AOAM530bzg7DHMjXOWCDDV7AXlZOKtn8DyZOfhCqkVT6qTCrldBs0eog
 ydoIWHSBHLyfsgL5rIZ7NNrYfOGf54P+lbAJq07SFYxRTjUmgw==
X-Google-Smtp-Source: ABdhPJzMqrRQANbaKGFvYB0Az1x/9BlypIhg2qrHCyU2bhSNYaoDCWOuDnNI2JDrDwWL8zrmk5fJjbvZMA8e90zBF/k=
X-Received: by 2002:a02:cb03:0:b0:328:8369:9023 with SMTP id
 j3-20020a02cb03000000b0032883699023mr8539419jap.247.1650494207895; Wed, 20
 Apr 2022 15:36:47 -0700 (PDT)
MIME-Version: 1.0
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 20 Apr 2022 15:36:37 -0700
Message-ID: <CALGRKGMgs4m=h6udakL_hcUugrPFyvTt+RefBjyVinE9ReGXyQ@mail.gmail.com>
Subject: Request to create 2 new repositories for "bios-bmc-smm-error-logger"
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
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
Cc: Ed Tanous <edtanous@google.com>, Kasun Athukorala <kasunath@google.com>,
 Willy Tu <wltu@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Following the design doc review here:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/52109/12

I would like to request 2 new repositories as listed in the new
"Organizational" section of the design template that I filled out
here: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/53169/2

bios-bmc-smm-error-logger
  - This repository will implement the daemon described in this document
  - Proposed maintainer: wltu@google.com , brandonkim@google.com

libbej
  - This repository will follow the PLDM RDE specification as much as possible
    for RDE BEJ decoding (initially, encoding may come in the future) and will
    host a library written in C
  - Proposed maintainer: wltu@google.com , brandonkim@google.com

Thank you,
Brandon
