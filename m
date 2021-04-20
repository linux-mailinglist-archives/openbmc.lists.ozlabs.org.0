Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDBC36553A
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 11:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPdb91qggz2yyF
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 19:25:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nh3Nwjca;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e35;
 helo=mail-vs1-xe35.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nh3Nwjca; dkim-atps=neutral
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPdZw6rbpz2xxw
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 19:25:43 +1000 (AEST)
Received: by mail-vs1-xe35.google.com with SMTP id 2so19023056vsh.4
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xDs/Gk/zt/LG7QmkJXynZ80jTJ7gZkJ4jQqtM8IqRLg=;
 b=nh3NwjcaEAIjHnhf3Cf6SbYhPqPrfE8iAhPcBdctdr3wwbzfmm6mfU9EkWqpJ+5YcB
 Hu/2tHa8XP1sZtCK0agbYUANUA5H7dCaPbpfFg3Xux28jeAN/Tjk4wOD8rGdDPSoUJjr
 7/iFuWTQxKyewzDpG0G4cYFLhhy3vYVOPFXWlQjAwf1hgIrwj1OVHg/bct0BbqCljsZm
 aTCaluO5pVwaXKH0/JqrwxXgCjxJYh6nqeCT73UIhz9R4Q0qB6NCMHukWMYfc7U35O0r
 QV9Bcu38iWoAE+jMpX6qwYNf4hi2k9i5PaqVS8QmfYvP70WjRzXTG5EwjjbGigc82UWj
 klKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xDs/Gk/zt/LG7QmkJXynZ80jTJ7gZkJ4jQqtM8IqRLg=;
 b=pxgVl2Gc2RbxHy13SMK7IWL1lQAzvGmlroe03TZZk8lj7X01FH9fFnQtLnWCZAgnPS
 rXKX8Upi5Y/Px5SR54XLp9yatXUvHLp1JtN6gAPAlWhuNYiFhMNyH8vkADQUxHCN8qZG
 S2WIdvTuwshuFPiwh8pYtJYvsZ56bVEcFDnpbMMcakL6PyfJ6kv7eb5DURufd7v+kJX1
 ClitnWMgHqgle79D5h54MomMUULsTFBnUEyEYasby3NrtkH51NMM2l5+H776p2df153O
 l9RNm6yba8kcDEKdw0wuJGKRy+8KPsD7QcsFQFoDLr3pCnGL877f39qbJrZO8u4tDAlA
 y67A==
X-Gm-Message-State: AOAM530bZvVvYjpwHQcQBScztd/iIIAtvUEQbgaXQgR7ucHosT0uhkz2
 9Wo8aFZhXIBFxPUnrqOzWi4hNo1Ok0/ru19N07LWn4qDYYo=
X-Google-Smtp-Source: ABdhPJwUAVgrxN7qcNg6wwlhfATSfSjOR0puCC6Q30grewtRd7hJ1vSFb+thMEsJfrcckbqMef3iKJq7onjW4k1Jxi4=
X-Received: by 2002:a67:f452:: with SMTP id r18mr2764614vsn.43.1618910739306; 
 Tue, 20 Apr 2021 02:25:39 -0700 (PDT)
MIME-Version: 1.0
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Tue, 20 Apr 2021 14:55:28 +0530
Message-ID: <CAM=TmwV6oM5jgzfUw9g7JCTDc_quLSCaKmZSj9kfRsHbnC_K4A@mail.gmail.com>
Subject: Tool to create a PLDM FW update package
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

I haven't come across an open-source tool/code that can create a PLDM
FW update package (based on DSP0267). We're looking at using PLDM FW
update on Nvidia's platforms, and we've written a script [1] that can
create a PLDM FW update package (this is a first cut implementation
and there is scope for enhancements). We'd like to contribute the same
to the OpenBMC pldm repository - any feedback would be appreciated.

[1] https://gerrit.openbmc-project.xyz/c/openbmc/pldm/+/42454

Thanks,
Deepak
