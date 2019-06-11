Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BE746F52
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 11:41:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QstC2j7qzDrfX
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 19:41:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=pokemonstone1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aTgUfm8v"; 
 dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NNFf49k9zDqMK
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 18:19:14 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id c66so1881499wmf.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=s0ojxcvSWPvsgHamp3oGj5jbihEeeBmVUMevUeBuWOk=;
 b=aTgUfm8vLZ/A1YhEp+NFRxCv7c/Se9a0QouFX6zmX63ZO87PZIAOm5OHGtNVkDP+jv
 gI5+8SGOM1laAW0usmE7BiSx0WE/KJEhkzrOpByovirar+9h3/cKBLdnps4mfteqCdap
 aGzV276krsX78v0EI4FBK28mhePMraq2Swnb/DtrAE7iZo/BwKwvq5Z+EvWeVzT6SkJz
 RmLhUm7fMQ+3WeLaE2V/2w5+abbOxrYLccQLCR8qIf4t547rJgjk0ag1xrOMzOObKDXL
 BP7tkjmgLwxYe0mTZwQHpe+RvaffVWocoz0up4LqLx6zkoCTzQNiLu0oCbYko2CoiLNM
 UFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=s0ojxcvSWPvsgHamp3oGj5jbihEeeBmVUMevUeBuWOk=;
 b=CACiOQBVtuFCmgQi4BBjx9OS9ZFILwy2wuxqsRggVnrP42Bt5tLibr7alGCmMRIaYj
 pJ7mGYulCjt820N0NcE4NbQoAXM9iSH2qyeyltv1tV2eUBMdjDf4sNZ/P4VTQSm4YSTe
 0r0F6a9JnM6c6m82nWwR3umvvNS5p4Dk+Ncf0NhXH3SPjHjcDjbepNXNQxoH/fH22LGV
 Dgkip3srx+ExMeo1Eyp4UgHjbUbmF7puHWEFQqoKLIGkWW5Ti8fsvNil55dPbvkTqey3
 9uY91w4ft7L/JDRJvdHq6IWKfQQgAJo8lpEnougzu2gGFhvXuLZaBtgRmyYmlz5TLKAU
 ygyw==
X-Gm-Message-State: APjAAAWWNwTm2pJxAayScLRbBJU6jev9RVHhKuCDXY+jTG416iE1hKk2
 nvzzjskx/Ji3NZkzoY8bR17u77YQazjR1V/gzu7xnNvU
X-Google-Smtp-Source: APXvYqwKMHSMipMt/nwu+JsLZxVCFtwv4hJInHmCNxvASAILg4jwNsdg+doIHxuKYCXTkhxcfqVVA4yK83gSgrTLUwE=
X-Received: by 2002:a1c:6545:: with SMTP id z66mr16344030wmb.77.1560241149873; 
 Tue, 11 Jun 2019 01:19:09 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?55+z5pm65by3?= <pokemonstone1@gmail.com>
Date: Tue, 11 Jun 2019 16:19:34 +0800
Message-ID: <CANAauDN7EGpxu=77HGZFXjCFmkoKU_8AJw0qohNEaXnDch_8HA@mail.gmail.com>
Subject: How to debug phosphor-dbus-monitor
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 15 Jun 2019 19:40:40 +1000
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

Hi
I had added yaml for sensor event. Does any method print message in
phosphor-dbus-monitor ?
