Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC455E560F
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 00:09:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXsyL582nz3c2j
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 08:09:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U1enjqI2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U1enjqI2;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXsxv704pz2xZV
	for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2022 08:08:50 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso4293548pjq.1
        for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=E2CNlSFLA0zwggDwr29u6+GLBcpiTg5yerCM9i1vjXM=;
        b=U1enjqI2vKm2pSS57jBB6kJlbD5aIk41B0NUZzWhrT3OEH7OJKg7CznBqBbs9yZ1w0
         U7aRPowCGfhAGUlXeZunWC/Yb9pHbAVCVVKYOV3xlIe9H7lGypGOhjf3PLcGRMI1v2kd
         txAcLeVToI8JjMQQdjf9vy8vPic/tahYX5ntLqKsGvjednLA8XuFji70n6q9WfhzAk6k
         Z8035EKJr33JkVE4K0M7hmO1vEh00rLsdjTuGtZj2dJEjkF1KRwcweFdfABVz138XYPN
         0nGf2AO6hH7yOJ9OD1Na0AUkgjaUPrH3vjmmq2Wwr/gN3Oh+VctNs3vdbjIXeoECkM4K
         P/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=E2CNlSFLA0zwggDwr29u6+GLBcpiTg5yerCM9i1vjXM=;
        b=Yu93onQapXgvQUA8T0B4mEZWPnCOyQ07MRegG4uoeT3zsjxqVz9+rdbNKeqqzHpjPn
         u+lCDxloTqELQZOs+xz/rbJu3zK+nTcrFlYSW/XUBrivzM1A8esEiE37zflK7RCzvVOb
         //5X1Yj2GzUp2SHVnhn7ub6pMCnEtSFR3LwWpBB6zR7mgVSRo+MAVckvIstQa6lmZhsO
         /SEQz954rb0Uvl+IydwqfJ+bCJOHsb6UsNnr9B5vinhY+pHHqg0TICwMNIx6z4IRHcZM
         lTJE8scclNSmNBTtJqRJQ1Wx0paWUjGZW591m1e7TEJpWlM1qKHFy7MPU50qAWc6Hum2
         yG0w==
X-Gm-Message-State: ACrzQf1JQSdqerTPEtigepDoUPOt87FDIsz2mOAJgU3TtDBv0/CWmRcW
	STjk5T3xl+AhmB8KO673uAYtCZxAwFM=
X-Google-Smtp-Source: AMsMyM7W/8v0nYyMeqzFnNH0OHUFSZTMIO13aoCvgS952NseqfC3X6fvqJKb8GhRqYZuM0WtEZdFgg==
X-Received: by 2002:a17:902:7883:b0:178:9faa:627f with SMTP id q3-20020a170902788300b001789faa627fmr306124pll.65.1663798127516;
        Wed, 21 Sep 2022 15:08:47 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4 ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id z16-20020aa79e50000000b00537d7cc774bsm2634497pfq.139.2022.09.21.15.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 15:08:47 -0700 (PDT)
Date: Wed, 21 Sep 2022 15:08:42 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: Wedge400 (AST2520) OpenBMC stuck at reboot
Message-ID: <YyuLaigEAyiYpl+B@taoren-fedora-PC23YAB4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: taoren@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi there,

Recently I noticed a few Wedge400 (AST2520A2) units stuck after "reboot"
command. It's hard to reproduce (affecting ~1 out of 1,000 units), but
once it happens, I have to power cycle the chassis to recover OpenBMC.

I checked aspeed_wdt.c and manually played with watchdog registers, but
everything looks normal to me. Did anyone hit the similar error before?
Any suggestions which area I should look into?

Below are the last few lines of logs before OpenBMC hangs:

bmc-oob login:
INIT: Sending processes configured via /etc/inittab the TERM signal
Stopping OpenBSD Secure Shell server: sshdstopped /usr/sbin/sshd (pid 7397 1189)
Stopping ntpd: done
stopping rsyslogd ... done
Stopping random number generator daemon.
Deconfiguring network interfaces... done.
Sending all processes the TERM signal...
rackmond[1747]: Got request exit[  528.383133] watchdog: watchdog0: watchdog did not stop!
Sending all processes the KILL signal...
Unmounting remote filesystems...
Deactivating swap...
Unmounting local filesystems...
Rebooting... [  529.725009] reboot: Restarting system


Cheers,

Tao
