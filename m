Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF391E5C25
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 11:35:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XjGj3P35zDqWw
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 19:35:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::233;
 helo=mail-lj1-x233.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DkmuRLUG; dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XjFH1jKxzDqP5
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 19:33:54 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id e4so10059623ljn.4
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kxbUc37RXM7KgOkxZemn8vmSsQjGeRwNNFdD8FdnOAY=;
 b=DkmuRLUGLvkAyOFtHb1dqh14RjQGaX7bJgia33DyOQzWgvgTxmDr17y02XtRtqCK73
 Va0UNgKi/iBrPftEyWIVlxk8j8aLN7ETf20zQiGZWtQMG8NGRjPstDEBdP7SgwtBGuDf
 EJV89+dbXl7mMCSJk3qnczmq1e/0jqGravdVK+wzl1XbatcirEHI1k02sQb/HIT+SlRs
 DosuvcFr8dVg3SvCvH7FU6NzNNvFxxBTDHapYEunGQWVPkAv63MgtOrLQuWYFZuTwcLs
 QqlyRB3YuzypnBDYfCkQ9szcNl7BeFdzAFJiEiCdFar806ZIhjTAakVV9jkPPcXOKTGh
 r6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kxbUc37RXM7KgOkxZemn8vmSsQjGeRwNNFdD8FdnOAY=;
 b=D04ihvBft5EhxTHwwuz9jwBJCLJ+wBw1YmKHxL9Bb8dgVYvsLE5PlIhLkXlB9YURIk
 3KrjV2XKfIxtxGt5o26rI8juYYvMSOQ9gcCDmHwjf6bFGcfxbh2HBVNMvMAvTdsoH2J3
 3M0iGyfkEeDp59ZVao5GHKR14Qi7VWE7YYWP3mt7Oih2FfZ2aczh0Ty/y8iGBE0Cxl9G
 6I+hmoh1BRhcTmkrAsZFgSa5ogHPJNTtFO34lGygfsDD1RG/gBnocwiHG6twvSuf4RUT
 qS62HB39Paad+uF2JCgsRuCfVGrsJGDxvLnFDGs4F1t3E811kpY3uEauoqKqe/HhNizL
 piyQ==
X-Gm-Message-State: AOAM533/CNGr9XNcIZ/3NzBSkdJ2emoIQvS+BHFJzi1OPyzCCAjuO61T
 xubH65dx2CDJs2qppkVV0PmckXrYF4zLE0PLcwB66g==
X-Google-Smtp-Source: ABdhPJzfThF5+IVgGAuuv5+HiedYGf9LiG2TLp9s8FuraQFfbDRqQl1BSA2aUB4pQ7UR//R+CAD+znOKabKdH95U7qQ=
X-Received: by 2002:a2e:8310:: with SMTP id a16mr1141026ljh.194.1590658429440; 
 Thu, 28 May 2020 02:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <2ea02fe94323438fbc4cec4e62c242c4@intel.com>
 <CAGm54UEYbzqONDMDweanD_T9fsuWXQ9czFB0=1GjsmGANJ1wKA@mail.gmail.com>
 <c3ab98b048824b50859560d747d07f84@intel.com>
 <CAGm54UG4peETHnXjaGoAV2vCxxiKOKfTbhHmZUiinjMPf6wHGQ@mail.gmail.com>
 <HK2PR03MB4371B6DB3601AB751B32F9F0AE8E0@HK2PR03MB4371.apcprd03.prod.outlook.com>
In-Reply-To: <HK2PR03MB4371B6DB3601AB751B32F9F0AE8E0@HK2PR03MB4371.apcprd03.prod.outlook.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Thu, 28 May 2020 17:33:38 +0800
Message-ID: <CAGm54UG8feqtPFNZwB9MUVRO9hsYn4TNwPDQ4j4YKM8uofzQ6g@mail.gmail.com>
Subject: RE: Adding usb-ctrl from intel-bmc into phosphor-misc
To: CS20 KWLiu <KWLIU@nuvoton.com>
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
Cc: "Wang, Kuiying" <kuiying.wang@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 28, 2020 at 5:02 PM CS20 KWLiu <KWLIU@nuvoton.com> wrote:
>
> Hi,
>
> For in-band usb network communication, I recommend that you can use rndis.
> There is a usb network recipe locates in quanta's layer, you can take it as reference.
> https://github.com/openbmc/openbmc/tree/master/meta-quanta/meta-common/network
> https://github.com/openbmc/openbmc/blob/master/meta-quanta/meta-gsj/recipes-kernel/linux/linux-nuvoton/gsj.cfg#L40

Yup, it looks like both rndis and ecm work.
Could you kindly elaborate why you recommend rndis?

Btw, I see there are two different scripts in meta-quanta layer, one
uses rndis and the other uses ecm:
https://github.com/openbmc/openbmc/blob/master/meta-quanta/meta-gsj/recipes-gsj/usb-network/files/usb_network.sh
https://github.com/openbmc/openbmc/blob/master/meta-quanta/meta-common/network/usb-network/usb-network.sh

Would you mind if you could merge the scripts into
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-misc/+/32878?
