Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE47C82D
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 18:08:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zJJD6p6LzDqnD
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 02:08:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cIOBfmCT"; 
 dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zJGZ55HjzDqkc
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 02:07:18 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id f4so137482274ioh.6
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yVhR8r6U2CIJzFX53iSi60Dr2diiX64vlo8RvI+HKA0=;
 b=cIOBfmCTq0DX20BXV15Z/07V+NuLtVW5yxEmUmnhOmFOccuqIGob9Dl+brAAJX71Sg
 zzLupdMK6NfpwjUAn647TmQlUSS/zY1CC2fCv1Mna7RWanBhGTdyv27pIoNxoNrmpU6N
 qUaUCHucY1cFZboGI9XnmWQ3aj3a2tnZRvsolo2EJD7ZrPbRn7Q/k7X3+C5WXPnN0BYs
 pHMP84Dxax9wX9ST8UZtWgYbMdRBdkroPQbwndrQ0spEy2HW00pc3HaT/Bx4l2AC49oA
 UkNYbfVZPxWVS58QoETkT9YEgDBcXZh19WQi7GGlcJW3Q2Urs6cp+IXXCFuKB1BpPH/t
 ci+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVhR8r6U2CIJzFX53iSi60Dr2diiX64vlo8RvI+HKA0=;
 b=LeG0j1tJjzUarQvX9lFUI1zuaGhavqBP049DuilLY0QF/uJrtE7axqL/6wJZrjRBF6
 OEIraUIYNxalTAAMBiZJ17ZH3QdQVBND9dSIV1PGX9/ME1+77+U/rUpUrKphRKHmhtnt
 RQytx04PiLDMY2hnhksn16en0vpOBe6TsOtpz83erVlZEM5sljBUf0sF3C+M6EUp3Zy0
 uCUa/L7Q6RzQFVVJv8RXQA0/m5eYQFBdFyHLs8atfONl77Ok4P40dZV2pYOmlsQMlVMV
 4/9GskTA7KRez68V8wmV9K+wlbt2Lvtop61XX+31MxSqYWP6CWDFPcJJyLAvE7Ky7iD0
 eT+A==
X-Gm-Message-State: APjAAAUud/QrzZ4ktoDfV5dm1f+IdAvDkWHJh1ha6d/mRBPLPCRZXki+
 loIEoY2O6H1Z3DEluq2Hnhu4phlX6KiC4KV0y8c=
X-Google-Smtp-Source: APXvYqyYQTf86wU6tUi1pzaTX+iJFHxv1VI0pH10m737ZYB7TFrv/Wi8uSVW0+UIP8Vv3YP7J24fZSCiWzXb6RnZzrE=
X-Received: by 2002:a6b:f906:: with SMTP id j6mr30133301iog.26.1564589234975; 
 Wed, 31 Jul 2019 09:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQti03V7MJmDQgpJP3coVeUbdXRxoPSYzfoow0j_YsMdA@mail.gmail.com>
In-Reply-To: <CAMTupoQti03V7MJmDQgpJP3coVeUbdXRxoPSYzfoow0j_YsMdA@mail.gmail.com>
From: Derick <derick.montague@gmail.com>
Date: Wed, 31 Jul 2019 11:07:04 -0500
Message-ID: <CAOUmYFR-KNDXO7hNtBhG2P+Xi55Jj4s+ES2bW6Rd5J_tBrA2ag@mail.gmail.com>
Subject: Re: GUI workgroup - this Wednesday Jul 31 at 10AM CST
To: Jandra A <jandraara@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wang,
 Kuiying" <kuiying.wang@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Here are the notes from today's GUI Workgroup. The next meeting is
scheduled for 10:00 AM CT on Wednesday, August 14th.

URL: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group#73119

Attendees
- Yoshie Muranaka (IBM)
- Jandra Aranguren (IBM)
- Ryan Arnell (IBM)
- Mira Murali (IBM)
- Dixsie Wolmers (IBM)
- Rahul Maheshwari (IBM)
- Derick Montague (IBM)

Notes
- Reviewed Boot Options and TPM Enable/Disable GUI (Design sign-off)
- Reviewed CPU/GPU Throttle prototype (Design review)
- Local User Management (Progress Status - FED)
- Firmware Update / Code Update (Design Review)

Derick Montague
* * * * * * * * * * * * * * * *
Mobile: 512-609-0760
http://www.derick-montague.me


On Tue, Jul 30, 2019 at 12:59 PM Jandra A <jandraara@gmail.com> wrote:
>
> Hello all,
>
> The GUI design workgroup will be meeting this Wednesday July 31 at 10:00AM CST.
>
> Tentative agenda:
>
> Review Firmware code update designs
> Review Local User Management development
> Review Server Power Operations designs
> Share CPU/GPU Throttling designs
> Review Event Logs designs
> Proposals to the navigation structure
> IF THERE IS INTEL REPRESENTATION - Updates on Intel-specific icon changes mentioned last meeting (Intel)
> IF THERE IS INTEL REPRESENTATION - Share research findings and updates on design layout (Intel)
>
> Please add any other agenda items here: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>
> As a note, attendance has been solely IBM community members. We would love
> to have others join.
>
> Meeting Link: https://ibm.webex.com/ibm/j.php?MTID=m49792ce33d5af28f2823638d351732f3
>
> Best,
> GUI Design Team
