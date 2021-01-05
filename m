Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 598EF2EA360
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 03:36:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8xSj4lZczDqWF
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 13:36:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=SnnIXSRP; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8xRj3M7vzDqQW
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 13:35:08 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id x13so27996381oto.8
 for <openbmc@lists.ozlabs.org>; Mon, 04 Jan 2021 18:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TPYxOq3bXP50aA9aofA2atz7QQs7PcbiFm8VnGRLR+E=;
 b=SnnIXSRPoTf+gy5U3qi5PtBM+xLRP8dJ4Gom4abvZi0fFFdl/XALJihLr2R4yeAzFR
 NC6IdVZFXKiQa9nTde37v52tfW+f0RTnyqtOYgCTh4/S8JTHxxiMScKi3aELpUQc2tOr
 6GzBZOo71bYQPLW4knlzxveYmwVq+cte47g7EDW2G+1o26oEQeys3Uny3RtbNrzWZywT
 mP6W95atlWtdvJ3F2LboEgYI88yoKTm6821xxNcPqdQZryHZGcBHOF53V/7uZFCn3rN8
 IwNfsoWOcIs79xT6yCkrkDBTxqa5Ip7uwX0yk0Wpb1HhvyA8R9vI0M1ibdw8m/9S4KuI
 YW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TPYxOq3bXP50aA9aofA2atz7QQs7PcbiFm8VnGRLR+E=;
 b=MwI37oaKfBsR9z+J1XfqpAKNyD3evTSZX0R7od2DCncXbX5YagXuo+Wxg3J/0xGGgP
 UP1JKJMNSY4vXL/+/nc0qxvsCRhaPjJQiPe/ZLID+tpALvn90UpkHECVanhQyh5HKqS/
 hR7RmKe7ReNdV8nsodwP4XWTJlohu9nzQ7i+yQAifDaAtigBEmnSLvesLXfV3K9+Yg/N
 a47buU2hsBrx9eCMXX8yE+AfPuWiVi+2ed8H+IY4D4MFzZIumHNjXc829m0D3oE+e9ux
 ftQTsvgqtu8kRQ/ivSFZ9KOHBg2C27TO5bPoyVFXLHCq/oy9D3M2QSWim9p2XD8iT6lb
 eySA==
X-Gm-Message-State: AOAM532t8U+AmdwNiso69y1kRUIwbPut4p+PxCsHNr5DZRXWvCNQYat/
 UBjdmEeUzjX60nSR8Cs56nhoKioDZXDU4Jx/byUDDw==
X-Google-Smtp-Source: ABdhPJysJBguwpQ7TdvfmIc4hl83oLguxeIhBpoy5jKiuv4TTB5S/lLebSdpS9sDAk3oYbiTkEGvesnthKrYnMcJcY4=
X-Received: by 2002:a9d:620f:: with SMTP id g15mr52311071otj.361.1609814105037; 
 Mon, 04 Jan 2021 18:35:05 -0800 (PST)
MIME-Version: 1.0
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
 <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
In-Reply-To: <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 5 Jan 2021 10:34:54 +0800
Message-ID: <CAGm54UFFJ5Rd=4v9X3LBP_Mp5LbkQrBFtT0-PeMGumzF8kdN0A@mail.gmail.com>
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemkalinux@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 5, 2021 at 6:58 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
> >     whose values must be defined in entity-manager.  Since exprtk
> >     expressions are not allowed in
> >     entity-manager, I cannot just port the PVS's JSON config into an
> >     entity-manager config.
> >
> > I missed this discussion but why can't we simply use virtual sensor as
> > expertk provides median function and we have threshold support for
> > each virtual sensor. Please help, if I am missing anything.

I did not notice the discussion as well.
From my understanding, the exprtk is defined in the json config
(/usr/share/phosphor-virtual-sensor/virtual_sensor_config.json), and
technically we could use any expression that exprtk supports.
e.g. we use max() in our system (see below example), which is not
upstreamed yet but it works well.
    "Expression": "max(T0, T1, T2)"

-- 
BRs,
Lei YU
