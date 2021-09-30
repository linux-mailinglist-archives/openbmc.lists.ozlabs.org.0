Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395741D126
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 03:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKbn30MvMz2ypP
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 11:51:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zsNnJ3YG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=zsNnJ3YG; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKbmc75Slz2yZf
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 11:50:32 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso5323881otu.9
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 18:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=60TD8bgNIwj0W5iFpCWiw0MjDl0IqEJscIiQ5zBH4Us=;
 b=zsNnJ3YGtCdOkEohrr2AqA2aInRzQweZCdJYC+UaP9OxrjYvFC4skzRZf8IhkDQ74/
 7mLecXQCMKfmnvUUJWjKTaoyAbktgEaMp0X5A3I28fxIUjHQUzV04cfLOT26wsPCaMz/
 ZgtTT91Qn7EMnKqoJFOe+HwEJjCybELM/rNJ3QVaEG5lBn5+gHrdhzMAkDCU6aUUA2c5
 5nEscpH2l4HHOZiM0ZipEO8u6EtXy6aNkn0GXcwTGZFuKlKWWZCwyWur4G8mG7rnnWlb
 OwF5ZB/B3B3/5LwCdwmNt4HpOEe7oOR9Cx+tryY5FRkKHFDLEckgI0IZfb7loaiN0/4n
 +DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=60TD8bgNIwj0W5iFpCWiw0MjDl0IqEJscIiQ5zBH4Us=;
 b=jMFsav50tmPIQeYiGH+00fddR2yp38NvFv0rw288+OeOuaeOzswkNX3lDpPgGG4jgf
 fLiLNPLR+C0tVxv2XdnWidZ0x+1Gx0CRNXl75aVN713xW9Y75SY+70KjEIMrin3E2Y0g
 MF3XN3lfihlLY5zdG+2Gvb1+CThuLfPrhSMIusx0V7IrD8oN2GCW/ygpDE0Ul2pT7kSQ
 +PNiAKD6miNE/vjP1+1Raqw6JEI+KgdvmoJ0DrcymzftlaMjgSETsAhOl0dcXUlghosC
 Q7ImxQ52TRE8SFzPHT/B6IvSpATlXDaR1eEGKGowR5z0O3Ow3AyVWj368uPMSGmpv5RX
 nj+Q==
X-Gm-Message-State: AOAM530988zQEqFYrcAaB1NCZhRllvNN9sS0Ox64YH1neVPT3dH36IlP
 /WMexq+rshPfiPHumaqjrnF/1an0G9qMvLmhv9WuCA==
X-Google-Smtp-Source: ABdhPJyMqKTcSb0Qi1QyAHz+YjO3dLtpvw3XoZ0Z26rJfPovC1DofOVxU1wiBRXQSYU8ybYXF6GH/kONojxM1ol3IKk=
X-Received: by 2002:a9d:192c:: with SMTP id j44mr2758568ota.302.1632966628742; 
 Wed, 29 Sep 2021 18:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <PS2PR04MB3589B9346947C693802AE1F7FDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
 <PS2PR04MB3589C40CCE3B07C5A2B79A3AFDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
 <YVRSmInJszjpBTsY@heinlein>
In-Reply-To: <YVRSmInJszjpBTsY@heinlein>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 30 Sep 2021 09:50:18 +0800
Message-ID: <CAGm54UHTiiTYu6NYO-R-8iNMRUtvr1L2zWkvOt91iNhCBFtoBg@mail.gmail.com>
Subject: Re: [External] Re: EEPROM Validation issue in Fru Device.
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Amithash Prasad <amithash@fb.com>,
 Kumar Thangavel <thangavel.k@hcl.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021 at 7:59 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 29, 2021 at 05:53:33AM +0000, Kumar Thangavel wrote:
> >
> > 1.       How the function isDevice16Bit Validated for 16 bit device ?
>
> My understanding is that Vijay wrote this originally when he wrote the Tiogapass
> port.  You should be able to confirm if it works there.
>
> >
> > 2.       Is my validation and analysis is correct ?
>
> Other people have complained (on Discord) that this current code doesn't work
> for all eeproms.  If you have something that works better and doesn't break
> Tiogapass support, I would expect it to be accepted as a change in fru-device.

We do hit the issue on this. The FRU in our system is 16-bit and
stored with an offset.
We have internal patches to handle the 16-bit and offset issue, but
the change is tricky and not generic for upstream.
It would be very appreciated to get a generic solution to handle such issues.

-- 
BRs,
Lei YU
