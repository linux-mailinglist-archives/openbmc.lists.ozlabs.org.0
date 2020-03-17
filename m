Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE40188B02
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 17:47:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hfGT37kGzDqPl
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 03:47:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=dhruvaraj@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gT42w4v5; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hdVq0sz3zDqkd
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 03:12:51 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id u68so12217480pfb.2
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AcC6ajpKR3eykCPlAJXKY/0mGHa60zri6/gEL2YtrlA=;
 b=gT42w4v5DmF3hDqjfi80xZjX7zzlOSbd4z7yXNEtLAV9KRlj5d4afL3TrYs927BgS4
 DypaZ2e3GCkxPaRC8BY7d6odHhCIoez0++7jxsuOQ1yf4T14WgsvR/MhapGuj511GrEF
 awnkFDfoirwSKQPXGk1vkWz2wFabYe7guAhwzlqQGodrEPgyt20sC6RkIodqq/nydwfK
 PfOW1TnezjXMYnJc2ZpnEspLbWjV264ExBd/NH1+BmH7ldvG4VnFWT1Jg4jI9t5Qajk0
 xNNrpm+syAvrZpSkbQccYgcU56QyDTl9J9vw39aFzjvSoAEQ31d++Y5+8gkLzPRZWb3U
 PrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AcC6ajpKR3eykCPlAJXKY/0mGHa60zri6/gEL2YtrlA=;
 b=WjoEI3A+/Sidu4HldWt0Jvfp0g17JqwaXso9yHjnMzP1egaNz64dqDI29vUlmjasPC
 0W1gHoaAshMCkG9sUhzFcJYJm7Gf8JouWm9hIeoI4S2k4t3hUQPdTCOTN3YYddVmoqE3
 0IQ5p9d0xX2LpkFDVsrv5Ps/PNQ80uKi78K/jRLqfZeVv0Yy0aF6Rk7XwO8Qpp5fUORL
 ii5Hf1SxtD4LlxH1krj+mzaCBcDDzSgL76CCA28Ktu2WxLAqcvhRcqHVP15YlcMgTJeR
 POFKOsZP/AUtYtcQEVrldh47HBifj847vIQTEfdSnx24hbjB7zHz6q1lWeObjei0l5xj
 q76w==
X-Gm-Message-State: ANhLgQ03zp3ofcCIgKsoleuv7GGtLtaRN/Qso/5JUr+apLwpjew/Q4gL
 +Qvp7bfFcs+ppdoiumZQf8hP1PvwvAaod+yPI4Dqk0+P
X-Google-Smtp-Source: ADFU+vuoCGv/xn48glxbag6Bwcs7vkASIeCC+TImJwMbcreEzDHUk4XylL3tiJLiFwR3dBuYbN149pKPVlVA3OYNa/M=
X-Received: by 2002:a67:7f58:: with SMTP id a85mr4469805vsd.28.1584461116875; 
 Tue, 17 Mar 2020 09:05:16 -0700 (PDT)
MIME-Version: 1.0
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Tue, 17 Mar 2020 21:35:05 +0530
Message-ID: <CAK7WosgjqxpsfP9FUV5oTYyf_dKYWOXC4FUVEd4Oci5ndz1Zvg@mail.gmail.com>
Subject: Updates for phosphor-debug-collector interfaces
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

Proposing these updates to the existing phosphor-debug-collector DBus
interfaces to support dumps that get created and stored in the host
but notified and offloaded through BMC. looking for inputs from the
team.

Design doc: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28260

Update dump entry and add Notify method :
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/28621

InitiateOffload method for the dump entry:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/28784/7

--------------
Dhruvaraj S
