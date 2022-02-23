Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B94C0B8D
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 06:11:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3PKS2CLjz3bVt
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 16:11:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EsBc69u5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=EsBc69u5; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3PK42B3sz3089
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 16:11:36 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id z66so3252595qke.10
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 21:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHXTfCn+659X5YVOx08xOqJoz4dYu5HsByJjmSAU0ms=;
 b=EsBc69u5iPVjlCisjoJwpDc+MSAO8Lkbac1184QGCydWs0VGq8eArqn9Kl62wu1QOY
 sJl2jeCKLaNm49x/+SxXbWVz2bh2ZdbuMc2vymrlBGUKgc6fpHkzJFGcGRcz6YEbRF+W
 A7QvlqDkYOrZVvjzJ36JYnsHEqO9xLK4fRu3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHXTfCn+659X5YVOx08xOqJoz4dYu5HsByJjmSAU0ms=;
 b=VzCiyCoyk/OeDCei58kQcN7J7feWG4DhPLDbC/CJZ0ZDr+b2VD9P7bfNp724Mf0WqV
 3yWX2z9VSjTOV29jtHKhFB2dVWhKsYrD5YmAuT9G08NRUGW/yDbnFXcBxvLWN4eCj/cI
 mKC9bZH9RmhKmT3SUuR5Ku1OHOQnd6rv3c2Qb090wXacAoP83IHmq72G8sMozf+R6fqY
 LaSDZLbYSECrf+XMRAa3PY2btX7oN8B4Eko9/4UO5x1o+KKh+jEN15GFYeqbEMBPog3/
 P3SvKc42t13OveeDneuO0cA6rIBnMsrBZK2A1H/Xel5QVnwT52msU2+SIOUCfkb5BuwI
 xt6w==
X-Gm-Message-State: AOAM532WY29ZmCnPlcm6cVnyoYgAra3sfnsTu3mPZehQ7BFQx7IF+Ktd
 NRA/L3IdFSk/UUbRPcPtdlq/HTyEWK/o476Si0E=
X-Google-Smtp-Source: ABdhPJz0x8fNwDxk3yjegHy2mUU+VS0aBVhtUTdH6mapt5+mM1zn/ijXIKnVncaLyQhkCh46rFHVLD6hGdzOCY4a2rk=
X-Received: by 2002:a37:a4d1:0:b0:508:19df:7093 with SMTP id
 n200-20020a37a4d1000000b0050819df7093mr17109746qke.346.1645593093346; Tue, 22
 Feb 2022 21:11:33 -0800 (PST)
MIME-Version: 1.0
References: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
 <HK0PR06MB3779076AB5B2189822951A4C913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CAGm54UGNdAtX=zSuZdZwQ6k2FjPj-Cxd3AwVxyNLLhifEntHbw@mail.gmail.com>
 <HK0PR06MB37792404CAB772185CB386B0913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB37792404CAB772185CB386B0913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Feb 2022 05:11:21 +0000
Message-ID: <CACPK8Xdu2VzLBW0oMy_bGo=hoJUng25pffGEYXe9xjyqC4=7tQ@mail.gmail.com>
Subject: Re: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, openbmc <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 23 Feb 2022 at 04:38, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> > From: Lei Yu <yulei.sh@bytedance.com>
> > Sent: Wednesday, February 23, 2022 11:02 AM
> >
> > On Wed, Feb 23, 2022 at 10:38 AM ChiaWei Wang
> > <chiawei_wang@aspeedtech.com> wrote:
> > >
> > > > Lei Yu
> > > > Sent: Wednesday, February 23, 2022 10:15 AM
> > > >
> > > > On the latest master with u-boot-aspeed v00.04.09 SDK, an issue
> > > > occurs on g220a that it runs slower than before and gets wdt2 timeout.
> > > > We reverted the u-boot to a version before v00.04.09 SDK (b0fe8fd9d)
> > > > and the issue is gone.
> > > >
> > > > Below are some details:
> > > > * Before v00.04.09: u-boot works OK, and it takes about 9~10 seconds
> > > > to load and start the kernel including the 2 seconds timeout for
> > > > autoboot, the kernel starts OK and it kicks the watchdog as long as the
> > driver is loaded.
> > > > * With v00.04.09: u-boot runs slower than before, and it takes about
> > > > **16 seconds** to load and start the kernel (including 2s timeout
> > > > for autoboot), then the kernel does not have enough time to run and
> > > > loads the watchdog driver, and the wdt2 times out on about 22s.
> > >
> > > Could you share us the boot log with timestamps?
> > > It would be nice to know the time elapsed at each stage.
> >
> > Pasted to https://pastebin.com/emseqW6c
> > It contains two logs, the first one is good, and the second has the issue.

Working:
[2022-02-23 02:47:03] U-Boot 2019.04 (Jan 24 2022 - 10:18:18 +0000)
[2022-02-23 02:47:06] ## Loading kernel from FIT Image at 20100000 ...
[2022-02-23 02:47:12] Starting kernel ...

3 + 6 seconds.

broken:
[2022-02-23 02:58:07] U-Boot 2019.04 (Feb 15 2022 - 07:22:14 +0000)
[2022-02-23 02:58:12] ## Loading kernel from FIT Image at 20100000 ...
[2022-02-23 02:58:22] Starting kernel ...

5 + 10 seconds.

Interesting that the pre-hashing part is also slower.

The old branch was based on v00.04.03. The new branch is based on v00.04.09.

I wonder if this is the cause:

$ git diff  v00.04.03..v00.04.09 -- configs/evb-ast2500_defconfig
diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 9fcf55b05ebb..000ed3f90bdd 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -1,4 +1,5 @@
 CONFIG_ARM=y
+CONFIG_SYS_DCACHE_OFF=y
 CONFIG_ARCH_ASPEED=y
 CONFIG_SYS_TEXT_BASE=0x0
 CONFIG_SYS_MALLOC_F_LEN=0x2000

Lei, can you re-test with CONFIG_SYS_DCACHE_OFF=n ?

>
> Thanks for the information provided.
> It appears that the Hash operation and DRAM initialization takes more time in newer U-Boot.
> Could you help to provide the commit hash of the two U-Boot used in the experiment?
> We will try to identity the root cause among the patch diffs.

Regardless of the dcache issue, we should be patting the watchdog as
we do the hashing. It seems this is not happening.

You can see the sha library code does the hashing with the
WATCHDOG_RESET() macro:

$ git grep WATCHDOG lib/sha*
lib/sha1.c:#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
lib/sha1.c:#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
lib/sha1.c:             WATCHDOG_RESET ();
lib/sha256.c:#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
lib/sha256.c:#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
lib/sha256.c:           WATCHDOG_RESET();
lib/sha512.c:#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
lib/sha512.c:#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
lib/sha512.c:           WATCHDOG_RESET();
lib/sha512.c:#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
lib/sha512.c:#if defined(CONFIG_HW_WATCHDOG) || defined(CONFIG_WATCHDOG)
lib/sha512.c:           WATCHDOG_RESET();

This relies on CONFIG_WATCHDOG (or CONFIG_HW_WATCHDOG) being enabled:

$ grep CONFIG_WATCHDOG ast2500-obj/.config
# CONFIG_WATCHDOG is not set

which it is not.

In the old branch, we had this:

#if defined(CONFIG_HW_WATCHDOG)
void hw_watchdog_reset(void)
{
        /* Restart WD2 timer */
        writel(0x4755, AST_WDT2_BASE + 0x08);
}
#endif /* CONFIG_WATCHDOG */

We could add that back, or we could backport something like this from upstream:

https://github.com/u-boot/u-boot/commit/06985289d452ad2423145cfed8cece61a7f8cec6

That commit adds support for patting the first registered wdt class
driver. More recently they added
492ee6b8d0e780a2ded5d9df7efc916eb4913734, which supports patting all
of the registered watchdogs. This would be useful for AST2600 systems
to pat both the normal watchdog and the ABR watchdog.

If anyone wants to handle the backporting and testing, I would be
happy to review patches.

Cheers,

Joel
