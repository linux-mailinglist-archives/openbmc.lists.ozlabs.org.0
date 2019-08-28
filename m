Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 998FDA0DC6
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 00:52:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jgwz1XDDzDqKv
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 08:52:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FNW6wn+X"; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jgw53bTfzDqKM
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 08:51:32 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id q12so2955038iog.4
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 15:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L4XC01sZMY3Yp9dj/XTkxx+JMXKNXFY1hoGFw34hlME=;
 b=FNW6wn+XQAII7MGY/MiH4FZRnSSHvBoil65HX645QFlq/2WQwcr/rolCAVq7ijeSuw
 lXErvGaoJto+8P+W8dmy7oi2OW1yKQTkkFboeil0HvGzm6gAHuF1CFXxEh2rupUyFsMR
 91AKqFy7AEsAV0vsgv9goOZaeECVsbYtnneSYv8gTa4Q8+8HD2S2Bc42L6FjMrqTC6A+
 bigoo5kl3dk+QIx8pCL0RqBFFgu/nX6NDyEZyTrg9+Q2Vpv086ppp4B1GB6L4G0toSNF
 OVKXG/H9mzq3lA94srx+nszhQQKXAhKTfS/FlLX1c/F6HuRBeJdyvKg33ItdJBbozwoq
 1A4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L4XC01sZMY3Yp9dj/XTkxx+JMXKNXFY1hoGFw34hlME=;
 b=AmcN0LHVbY/YMkccz63gDEEUzaIh5Y2G1vZAtkymeVuzDA9SRXT/rvhDRk8uQBMnuL
 C2UxsJT1eGAycTRCiouaPwiGqHVvedOdqtjgDpc1juXPJHmnN4rAbVBQgcLLQRPl2WjW
 XRCuHLQK1b1qw9t2/9VWiT+7M6ucJupLMfeqFWpCwoyq1Ydjd4p8NRaQJ0rZzB68hcJG
 s4D28rO+VapS8YN88F2JodB2mtIcYiFax7EPwg6ye/DpNm7gU0fV2iLoRNTdKyGaRdIB
 hxnZ7EbkTbPxN+2mj4vcWMEBFig+k4T4Clv25uqLqLBgg+YgXDPb2e3N8uNA/uY0r7oZ
 UL5w==
X-Gm-Message-State: APjAAAWSqmrtZvsXv5RtJY2oCxjlNKAPFunJ4kwOqnDBclW1CPN1/TUo
 mCRAkaIFOZ4zT05Rkfcw/fTX542YvdAHZ9blPio=
X-Google-Smtp-Source: APXvYqwfnUpdARYY8gBG46G8p6cIvqb+np0r14XLljJ+XhAjHY0MkzfDIPfEGlIsqoGNmAt8Qr2wHYxJSnssbxeiuZE=
X-Received: by 2002:a02:b609:: with SMTP id h9mr6889335jam.36.1567032688879;
 Wed, 28 Aug 2019 15:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoToAXGWaRmjv9fmFU+SFqL-788NvLGQXSY5SRTi9CAREA@mail.gmail.com>
In-Reply-To: <CAMTupoToAXGWaRmjv9fmFU+SFqL-788NvLGQXSY5SRTi9CAREA@mail.gmail.com>
From: Derick <derick.montague@gmail.com>
Date: Wed, 28 Aug 2019 17:51:18 -0500
Message-ID: <CAOUmYFTsNWDUeOQ3scvRLGXJn9g1ghQ2Hx19ShVWSpihnnhVsA@mail.gmail.com>
Subject: Re: GUI workgroup meeting - Wednesday 10:30 AM CST
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Notes from the GUI Design Workgroup for Wednesday, August 27th. -
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group#82819

Attendees
Yoshie Muranaka (IBM) , Jandra Aranguren (IBM) , Ryan Arnell (IBM) ,
Mira Murali (IBM), Dixsie Wolmers (IBM), Rahul Maheshwari (IBM),
Derick Montague (IBM),  Nicole Conser (IBM)

Dump Research

1. Research to indicate what dumps are disruptive
2. First user feedback session today
3. Unclear if the work IBM is doing has value to the rest of the community

Server Power Operations

1. Discussed IBM specific Power Operations needed to support IBM systems
2. Discovery is ongoing to determine how users will understand which
firmware image will be running
    - How important is it to know the Firmware version that will be
run on the next boot from the Power Server Operations page for single
image

Firmware Single / Double Image Upload

1. Demo of firmware redesign to support single image and incorporate
user feedback regarding confusion around the current active and
functional design.
2. Discussed how major versions will require updating both the running
and idle images when activated
    - Will the user be confused when the running and idle are the same versions?
    - Will the user be confused by the boot selection if both
selections are the same version?
3. Questions surfaced about new single image Firmware reboot
    - When rebooting from Firmware page, is it always orderly or will
the reboot respect any settings saved on the Power Server operations
page
4. Posted changes to the mail list on 8/9/19 with links and details.
No feedback from community.
    - Single file upload prototype:
https://ibm.invisionapp.com/share/4XNZ0JAMJ7B#/319207132_4-8-S-1_Home
    - Double file upload prototype:
https://ibm.invisionapp.com/share/4XNZ0JAMJ7B#/319212821_4-8-D-1_Home
    - Github story: https://github.com/openbmc/phosphor-webui/issues/92
