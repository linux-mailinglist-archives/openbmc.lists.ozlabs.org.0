Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB380296626
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 22:48:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHKFM2vdkzDqKT
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 07:48:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b42; helo=mail-yb1-xb42.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ywfhZKu/; dkim-atps=neutral
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHKC04vSpzDqZ9
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 07:46:04 +1100 (AEDT)
Received: by mail-yb1-xb42.google.com with SMTP id a4so2740326ybq.13
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AvLoZrD8n5o5C8Hzve5Fkw34SquOlYB2WslM74vKfXY=;
 b=ywfhZKu/bEfTWdtMgmn6DIbPbsT1IypFW7NRDKEaZPczZRTNmZ5XWaR0eI98OtpCgb
 T0wO/Ibb0Qi/23Xi95VRPxxuAvybW3hN4t2Xa/5mZVtG/t/CBrVwh1gyKUVZnfNRXT1L
 +Car5jhkAeUVqB2dQ1RbdEm7ISIbI5Uug3mLEJLsRL4dAaqm3vVYcX4X14wJIzGrWOJM
 HOR8xlqDGFTwUu6LNhBHffvdTEahgL3lrtnhNLRTqZWtst/DVfaPkEceAnhicUR3afao
 gX6WPuugW5yFdCbFKUg2Ar0koUkmsh0dIF6m1Ph4HL5ZucLLoYT8FIq5NSyKscZuc/R4
 OAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AvLoZrD8n5o5C8Hzve5Fkw34SquOlYB2WslM74vKfXY=;
 b=DOBn3p+8syZV4gpIpciMo6mv85sLxrJ5pXN+lzADeU9rDyFXMFMFbhd8KInaRiNcIy
 3Zhm2cdX7NDu2BXDPOT1KCWv8/lRhcyhPuWoTk/ip7ET1wJS5chqKvFRvTEEwgcasCZI
 6DhzDYCMXrkrFr7XfUh75uV5osdvdhOoNcKqxelS0KuUraGJtDcEJp3j/RzoyZmuRIHi
 9zuaqsl8vkYQqLSaxHt43hMJP/2mrWxOl5Nrn17XgOQyHv+w21lC0Yk50xV9vXbjfIlC
 hb/qd4FXAAIQIO72gN7qFPmqtvN/KDhGyGDWe9w04C4+2bJozwqEU8iXlGeSg/SmAJkp
 cBqw==
X-Gm-Message-State: AOAM533wd2CwF11qd9Tof7OIhkH8Wmu6JM/802HjsoS+MajTvbCzxjHn
 dBkfGI5QYlwPFNNPijF6s6hKpSHFOBZ1dXykxFmIkg==
X-Google-Smtp-Source: ABdhPJzHautwuZ0Cni7cg217+3NSgy87ohSfPnuP1UG6PKMyMV9CYhIuvoschLqVG1sLmOCRfwYSjuwpV+wRrc3uroI=
X-Received: by 2002:a25:cf4e:: with SMTP id f75mr6383650ybg.449.1603399559641; 
 Thu, 22 Oct 2020 13:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
 <20201016202542.GB3614@heinlein>
 <CADVsX8_Z1GHkw0Z8-2jFGrFVVkMnMkK_rVdLJy8TQ=RiK13-dQ@mail.gmail.com>
 <CADVsX89sYGv6fKdDNTX7ER7hhSwJSidmQP9wWEqExs-K0CT7eg@mail.gmail.com>
 <CADVsX8_M4qcgYoVq1AC5WgMO598mWT6gfeyqrzScQQrt==uwoA@mail.gmail.com>
 <CAH2-KxA9cX49Kfp4SbRPdY1wRt3u8T7o-hUfkBORZNZ9yUXoSg@mail.gmail.com>
 <CADVsX88EajC-xZuO2CwW_0B4x92u5ppYUG2pOr0RMEn8-EeduA@mail.gmail.com>
In-Reply-To: <CADVsX88EajC-xZuO2CwW_0B4x92u5ppYUG2pOr0RMEn8-EeduA@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 22 Oct 2020 13:45:48 -0700
Message-ID: <CACWQX816fVwGuyAHbFSW_MseqJo7thxtZDe=f-7v91jMmbWHjw@mail.gmail.com>
Subject: Re: [gbmc-team] Re: /etc/migration.d
To: Anton Kachalov <rnouse@google.com>
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
Cc: Ed Tanous <edtanous@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 1:41 PM Anton Kachalov <rnouse@google.com> wrote:
>
>
>
> On Thu, 22 Oct 2020 at 21:35, Ed Tanous <edtanous@google.com> wrote:
>>
>> On Thu, Oct 22, 2020 at 9:19 AM Anton Kachalov <rnouse@google.com> wrote=
:
>> >
>> > Hello,
>> >
>> > any objections about distro feature flag to cover root Vs. non-root co=
nfigs & code?
>> >
>>
>> My only concern is whether or not it's needed.  If a particular daemon
>> runs and functions as non-root, is there a reason why anyone would opt
>> out of that?  Presumably as an intermediate step we could make it a
>> distro flag, but in the long term, ideally, that would just be the
>> default.
>
>
> Sorry, I might not be clear. The flag is required while converting / test=
ing other platforms (that I've stated as "then iteratively enabled across o=
ther platforms once they are ready"). Once everything is set, we can just r=
emove the flag and make behaviour default.

+1

>
>>
>>
>> Are there use cases where certain builds need daemons to run as root?
>
>
> Only a fast way to switch back to root env if something would be broken f=
or a specific target running unprivileged users.

+1
