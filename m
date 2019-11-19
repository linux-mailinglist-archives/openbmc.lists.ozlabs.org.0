Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5584A101A50
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 08:29:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HHX34F0vzDqfK
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 18:29:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=tajudheenk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nl76YfKb"; 
 dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HHWJ0FmNzDqZm
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 18:28:56 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id t1so22499223wrv.4
 for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2019 23:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YppyGA79/UtMNX10gaqQvYhoycsIclmcf8lQaHwi9rA=;
 b=nl76YfKb83cxyWsHdM0zj/CHB62WbDj8CSYCHpMuDczqInPeNlAur3UOLK7FXuO45L
 FniEhu765hrFM2+znGDhfVNqL/pL6wslyhqqJLVlqqTDN+KL3Ge4tdldlOxox2ZvITHD
 b35WPNmkLddYrh+lfeoXur+WtWf3fAC1RY+zqiLwEh6DnR6zaUs44+C0CPdTmfz7/ggE
 gnGJybGcjT8qvdJud2gPFsaYXOQiFfBVmTTNG5cNgTjF6zwqQX9ijY6yt9KZXufTRzz9
 g3zRl4WQTTzeaUSHGxumjZL4SMeSmpd3VbC6JzR8U+04FzMIWvOkB+jRSFQgX+8zkhuX
 /ouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YppyGA79/UtMNX10gaqQvYhoycsIclmcf8lQaHwi9rA=;
 b=S/OAmOg6mTnWfNyM26/5XPcyvXH7vXETNPuaqsRVzqfpRqTAWXbLtf57Q6KMerFpY7
 IiAZ9nIT1CsZtDIgnq6zfUncf3UZGizLB9txA8iU1/UDQuutFbKsRxH6lnioh0Y+YSd4
 Q+xmcSPfKxTnrE84htduOcVPB0pICY/9WSzG4D/5VjEZ3Bzvy7z42Z8dvJiVXq50TExv
 RK/B3asAUGC6SVvTmSWpxa0xphTe2ZMHuF7c82/jXcZIROV3pnoS0VHwTHHXzs84G+ND
 DsvI6NUUeyRhQlyWFq8QTDnf4DLKIe3i5DL7TRaFQeHYoxE/jOkC4reYQNbcB4VhpS4H
 89YA==
X-Gm-Message-State: APjAAAUyTG0f4cThPXt74IM/NehLS3D6DHtCcsKCpPUbed0RvC3pMnuY
 t8StIifAPIvCjObPHzc90s95+L4mLy4agzxYAua7FQ==
X-Google-Smtp-Source: APXvYqwQ8YaMwMaNee42FgHuwWQH+bQII31c5gdGlvLSebgXqHaduqOunKS4E7JASwh4O2V3s7suxNZ1OIBStdYrUgM=
X-Received: by 2002:a5d:660b:: with SMTP id n11mr36630738wru.146.1574148532434; 
 Mon, 18 Nov 2019 23:28:52 -0800 (PST)
MIME-Version: 1.0
From: Thaj <tajudheenk@gmail.com>
Date: Tue, 19 Nov 2019 12:58:41 +0530
Message-ID: <CAH2KKeYUW5YCO98Ydp2XAKN5Wo0CoNquM7xz4VijVZ_oD=U09w@mail.gmail.com>
Subject: Support for "Signed firmware" update
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000197a600597ae046c"
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

--000000000000197a600597ae046c
Content-Type: text/plain; charset="UTF-8"

Is there a plan to support BMC/Host signed firmware update?

Regards,
Thaj

--000000000000197a600597ae046c
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Is there a plan to support BMC/Host signed firmware update?<div><br></div><div>Regards,</div><div>Thaj</div></div>

--000000000000197a600597ae046c--
