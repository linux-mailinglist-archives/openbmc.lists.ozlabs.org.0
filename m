Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E860D508
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 21:55:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxjNH0pHJz3blw
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 06:55:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ob+x0whb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ob+x0whb;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxjMg1818z2xbK
	for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 06:54:54 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 7943D32E;
	Tue, 25 Oct 2022 12:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1666727692;
	bh=TGhIfUGkzBmtqXVEpitCC+EUA3tub66znO2P6Rt+Umc=;
	h=Date:From:To:Cc:Subject:From;
	b=ob+x0whbf5AHR7micohWFTac23u0tWYvFK46eD0oZJbXZD5VaZSQNDUd4CgHKlRWp
	 EHdlYQLKJhjmdUmL4L6XqjU2dVPBHtfD9kJr7Hi3JXeuIAf/BO0haV7CgcCHRRi+Pw
	 pQ6vx/5RBM9cxb4PzOfFlAt1NGcajHYih+AbBB14=
Date: Tue, 25 Oct 2022 12:54:51 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: libc-alpha@sourceware.org
Subject: nscd time_t size mismatch problem
Message-ID: <Y1g/C4pinQ1tutC4@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Cc: openbmc@lists.ozlabs.org, Wayne Tung <wayne.tung@ui.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello glibc devs,

We've recently been seeing some misbehavior from nscd in OpenBMC.  It
manifests as lots of log messages like:

     disabled inotify-based monitoring for file /passwd': No such file or directory
     stat failed for file /passwd'; will try again later: No such file or directory
     disabled inotify-based monitoring for file /group': No such file or directory
     stat failed for file /group'; will try again later: No such file or directory
     disabled inotify-based monitoring for file /hosts': No such file or directory
     stat failed for file /hosts'; will try again later: No such file or directory
     disabled inotify-based monitoring for file /resolv.conf': No such file or directory
     stat failed for file /resolv.conf'; will try again later: No such file or directory

and so forth.  I initially assumed it was a configure-time --sysconfdir 
mixup, but after digging into it I found that it actually stems from a 
time_t size mismatch (this is a 32-bit ARM gnueabi target):

     $ gdb -batch -ex 'pt time_t' -ex 'p sizeof(time_t)' time/time.o
     type = long
     $1 = 4
     $ gdb -batch -ex 'pt time_t' -ex 'p sizeof(time_t)' nscd/nscd.o
     type = long long
     $1 = 8

The confusing log messages are thus just the result of the coincidence 
that sizeof(long long) - sizeof(long) == strlen("/etc"), which causes 
the disagreement in the layout of struct traced_file to make it look 
like the 'fname' member just had its directory prefix chopped off.

In the discussion of the bug in the OpenBMC issue tracker [0], Wayne 
Tung (CCed) came up with the patch below, which does seem to solve the 
immediate problem, but if I'm understanding things right does so by just 
reverting nscd to a 32-bit time_t, and so I'd expect probably wouldn't 
be considered the "right" fix -- however I don't presently know enough 
about the 32/64-bit time_t transition and ensuing compatibility concerns 
to know what the right fix really is.  Should nscd perhaps be using 
__time64_t or something instead of time_t?


Thanks,
Zev Weiss

[0] https://github.com/openbmc/openbmc/issues/3881

 From 0fda9faf757abd4f5469e6d9207499e97f79a663 Mon Sep 17 00:00:00 2001
From: Wayne Tung <wayne.tung@ui.com>
Date: Thu, 13 Oct 2022 13:10:21 +0800
Subject: [PATCH] Use 32 bits time_t for ncsd

---
  Makeconfig | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makeconfig b/Makeconfig
index 47db08d6ae..f78f7cc74a 100644
--- a/Makeconfig
+++ b/Makeconfig
@@ -869,7 +869,7 @@ endif
  +extra-math-flags = $(if $(filter libm,$(in-module)),-fno-math-errno,-fmath-errno)

  # Use 64 bit time_t support for installed programs
-installed-modules = nonlib nscd lddlibc4 ldconfig locale_programs \
+installed-modules = nonlib lddlibc4 ldconfig locale_programs \
             iconvprogs libnss_files libnss_compat libnss_db libnss_hesiod \
             libutil libpcprofile libSegFault
  +extra-time-flags = $(if $(filter $(installed-modules),\
--

