Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0DC285654
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 03:32:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5cJY6nPvzDqF0
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 12:32:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2e;
 helo=mail-oo1-xc2e.google.com; envelope-from=obmc.developers@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M3ZZIg6e; dkim-atps=neutral
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5cHr74g4zDq6k
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 12:31:33 +1100 (AEDT)
Received: by mail-oo1-xc2e.google.com with SMTP id h8so215618ooc.12
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wpIVPKaywEkqcyw0S/Y2jclBylDpBS6A9sqUCv4fucg=;
 b=M3ZZIg6efks5ErwsnKtNStA1IpXwb9XVeAfyivMRflL0lotjrmZAYwl7V06cC3Cy1F
 Y/KtmyhOaz7TumD0WGTwZJzzGPB3QCxbKV4BKF4V2Af8aokVO/kUee4/BEV4E9NDr36j
 Fom7N9lW+Dn5DVh3Oif13FS1Vtu+C0Sz3wSXjvQh/xaJMtNTHa6/dmdZOFcvxz+BNTmK
 8sbh7n2Kcik8Lep0+5F3fLkQVm2OI9zlDCtSY9IuvfidErpTmg/Tt06mtW39/JJv7TPV
 pDrgNqPsJNAZdvVVLozxMScRB8XD6/QtKp7uTbozdw5ynlmau9rUpd64w614aP/9Y5VI
 OAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wpIVPKaywEkqcyw0S/Y2jclBylDpBS6A9sqUCv4fucg=;
 b=bflksjSbCTX0Y4vf0SWalC4V6+nTLpPLw3I8YB+InbSGbATb2Hc2KhS5anKXkSMkCZ
 v4u8igmEAlIkP/x1GH/BrkqxcXZfU4HRKK0TdpPnRGFlIdkYRFTVR/4rcJEFR+Q4zzkX
 1xHaQCtbPY1SoV20XkHJRKRsB+FMnNyKScmvttgMQKK2XisIE4iMgM59T+BbTIFBZZIq
 7OQIrlD/m+vYjc8DkYTM/lro7p5V0Q/qVolxwB+DG8hU3UAqskQhiItPKZvseY+pR181
 WayyIDGJr5iWL6wJdCIcHgXetqN2PXL01+1nctDsxdRdn6oYEi0TIJJI4PpPDZvd3IbY
 HNlQ==
X-Gm-Message-State: AOAM531gPItx/i/D/DL4kmIfQZeVRbuBcZJeqyxVzynXXtCK2mLhP1Qq
 uTt8LXfXoupsofUxn+RvzeooySENqzfp1HFCyVGNaJxZ
X-Google-Smtp-Source: ABdhPJxe1pZSlvlCSrQJCuvCkXJ8hTMCmcWIr+o7Eez89Ig7AwcMdPfQ3dHdXfeAode4PLcdTioiFV4hYSkiqv2GAk8=
X-Received: by 2002:a4a:e544:: with SMTP id s4mr577216oot.74.1602034289606;
 Tue, 06 Oct 2020 18:31:29 -0700 (PDT)
MIME-Version: 1.0
From: Anony Mous <obmc.developers@gmail.com>
Date: Tue, 6 Oct 2020 18:31:19 -0700
Message-ID: <CABbLDjM5R6DaGz1PKtMHwTiA4z++8Vos6caTD_=Uumoys477uA@mail.gmail.com>
Subject: LTC2991 Driver request
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c0079a05b10aac3f"
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

--000000000000c0079a05b10aac3f
Content-Type: text/plain; charset="UTF-8"

Does anyone have a driver for the Linear Technology LTC2991 Octal monitor
chip?

Thank you!

--000000000000c0079a05b10aac3f
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Does anyone have a driver for the Linear Technology LTC2991 Octal monitor chip?</div><div><br></div><div>Thank you!</div><div><br></div></div>

--000000000000c0079a05b10aac3f--
