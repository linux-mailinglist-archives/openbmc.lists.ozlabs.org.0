Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 147CC70AC0
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 22:36:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45stfl2m7FzDqW3
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 06:35:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=bjwyman@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hinnasQQ"; 
 dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45stdt3d5XzDqVZ
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 06:35:10 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id u15so30630849oiv.0
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 13:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Obvs+pdx3LMIqRWIcWOj+67kGq+v9Qey/EWAuHqAhg0=;
 b=hinnasQQIkq56nn9NWlahF841e4qQpGb5SPr4aAtPgHg8VkDS7p/1xMFFD21pZbWjX
 Mvl5szF/p9bVJ2Pba3jTQEtKJpkBTpHJZVb72J/Tvu+PupAkob5hkkI3vSP+xZcPfx5S
 Ug06kM6qId2gUJsh79U2eedYCWWnVd3mu2wWNwT/tUy3H0zkys0Hn9jAG/Hn+93SSJHR
 H1jyjDYnbRx1RS1cjQfyOaHjuCUHwA7xHUytImSZpYmOx+yYb7/T0d7k3iMmO2BJFg2b
 xmjaMuFD+rtxmJj7s3cSHCVyTUc61smzxOptpCLGb9Bona7b7OiRnb3fjZnAZK/pcrVU
 fdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Obvs+pdx3LMIqRWIcWOj+67kGq+v9Qey/EWAuHqAhg0=;
 b=njTxWC1S3DHQXL2+ajx2FtUT/wLWGNgucNX88jkFaJTmUSugo/ZpWsqZwA9Qfyrkrq
 NzmvIf6gb4tw9mFgrLbvgY5fBFRmm7fYelAb0bJ6M8z6U/2D4QPLWFCYO6YAvp1UhLkD
 t8Shtj5uCb5zOuZCGGFuANhOjyW5jRd7Bbj+lKlCCda8Bpb7Y8lE+Ovh4iC3ua6g2irv
 siPkItuE9r0n4FVPO9qwarkBB8UZJTFFO7x1DQPKt8ted3MRML09ZWic4NG3sTLsEsfb
 n4p5goHwhksob+SotqASkSVtsw7BCGdws1Glkk4bPXCruiqV4/PO4X7ghJOuMQ4oGsN2
 m0dQ==
X-Gm-Message-State: APjAAAUPXYtYesw/FhP31TnvtydSbq5BygHFRzRzOBlJCDcHZzujQkTy
 efHGM6NgsckXtl0dYHF6cOgpMH/T1tSOHfF54ePpETW+rV0=
X-Google-Smtp-Source: APXvYqyoY8htb8KXfWlxWO9Km0QGZ+l2E8TtVx4/gUVXSlD5mptKQNh7ImZ3DCHAXpKWnfvEBrjZ9heZdEOJBCSNG1k=
X-Received: by 2002:a05:6808:98:: with SMTP id
 s24mr34094587oic.127.1563827707134; 
 Mon, 22 Jul 2019 13:35:07 -0700 (PDT)
MIME-Version: 1.0
From: Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 22 Jul 2019 15:34:55 -0500
Message-ID: <CAK_vbW26LXVT93yPqaV7OZT3r7yO30xsTm8vP1jB373ZO+Sh=Q@mail.gmail.com>
Subject: New repo request: phosphor-power-monitor
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Hello Brad,

Could you please create a new repository called phosphor-power-monitor?

I am proposing that this new repository be used for the single power
supply monitoring application, design under review here:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23038

This repository may get used for some other future applications
related to power monitoring.
