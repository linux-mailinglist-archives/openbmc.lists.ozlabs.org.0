Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646397D0F
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 16:33:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D9BL6yYmzDrBy
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 00:33:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gNBJZn0q"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D99T0PLKzDqg7
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 00:32:27 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id i18so1408444pgl.11
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o6DB7pAkCUwFIso39Rf3hqxTTSfj8/a9OCvEMZgVbE4=;
 b=gNBJZn0qh4P6tk+1Alr71w5/yH9O2lmtFN5tIoHUEh5T8+xZ5W1RXfve8oSMHJWhG2
 WvNVVu4DiHrC/wZPBnrZSkMl/TsflgxjSxf4wnaeuGVblKCblJ1y0MXNHlvp4iBuivAO
 yoaRgO7j0rhBJsAxvkfIhRDbieSm3KokMHU6r5pFXTw5dms42gsm9i9G+NXRqUOPUgi/
 EhJmEA3xuu9Rt2qeHytn3JsaB7etJzPTnV6ed4nS9ERa/00v1sSqHfCtDa5q+ERxy9Za
 XJnr9O8g9nbRsIUzlXc/xnSFpi5D0RULZ3zBhao4X9OMlUoEaILM7/V2u6gUtmC4NGEL
 vGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o6DB7pAkCUwFIso39Rf3hqxTTSfj8/a9OCvEMZgVbE4=;
 b=PwFwvQCeEOnD4EzpKricXH5yK0Ia15SB/JW4u4z1htwYxO49su6EK/jE3s482XKEPb
 hP5iUPczA7j2L5mx3bPBxRV9NRHuapn9hbT5zGHsrZr9xS1LjE61eT/XjyBkI8N1DPse
 W6voc3TAJaUun4fvy1nQKmS6Jja98i7bPjX8DwrDazfw17Al0eTVDz+kZjOHQGYO+519
 l2qMTUB2VWb9+uTTr0LKBfQEEU2ZWjXYYJxvY3LSZcWIcOmz+59ZqQP/Zml8s3icC7ji
 gcwbn2jqu594Qs4fDUAe50EkldMCaOFcU/amZy4zOK4nIh+4IyzScdZLhvt+ItkdmIN1
 HW4w==
X-Gm-Message-State: APjAAAV2yutCzt30IQiwHfdCP5AJcIs3byT8al4JmSsf5jAIYPRcIh51
 aLUHvXsDV+Y3kAENuP4Vpa5nBIXGSfc8xrMWlr8YLg==
X-Google-Smtp-Source: APXvYqx7FqPdIfTOGcvyplDdefAELhUihoW8Q46/7R0KoMHc/xs8BCTXfDfZF0pLs0TS1EqcUE44z2FvsO6SmS4vz+c=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr35910628pfi.136.1566397944149; 
 Wed, 21 Aug 2019 07:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
In-Reply-To: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 21 Aug 2019 07:32:12 -0700
Message-ID: <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
Subject: Re: [phosphor-pid-control] scaling issue
To: =?UTF-8?B?SGFuayBMaW91ICjlionmmYnnv7Ap?= <Hank.Liou@quantatw.com>, 
 James Feist <james.feist@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 1:11 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Ha=
nk.Liou@quantatw.com> wrote:
>
> Hi All,
>
>
> After commit [1], I found my temp sensor reading would be re-scaled by mu=
ltiplying 1 over 255, making temperature into unfamiliar unit. Also the fan=
 rpm reading would lie in [0,1] interval, letting the fan input to be 0 (si=
nce the input value of fan is from an integer array [2]). Are these normal =
behaviors? Or do I miss something?

Are you using dbus configuration or json?  If json, can you attach
your config.  Since you're saying it was working and now isn't, I'm
assuming there's something about the config being treated differently
with the code changes in an unexpected way.

>
>
> [1] https://github.com/openbmc/phosphor-pid-control/commit/fc2e803f5d9256=
944e18c7c878a441606b1f121c
>
> [2] https://github.com/openbmc/phosphor-pid-control/blob/a7ec8350d17b7015=
3cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86
>
>
> Thanks,
>
>
> Hank Liou
>
> Quanta Computer Inc.
>
>
