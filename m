Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2260D8AC
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 03:05:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxrG53v8vz3c7G
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 12:05:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=nnku+8Ma;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=nnku+8Ma;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxrFV6ZK8z2xGB
	for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 12:05:02 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8D62032E;
	Tue, 25 Oct 2022 18:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1666746299;
	bh=vtp17aUF8LdIoUEQfR62LHc7ML4NH1ShKUNw4GxOY2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nnku+8MavcbHy1yXdi4SwvSa71N2f2fzs4HwO6M7BJrEeWXviuj2oJltZyTaFOiy0
	 rSrmJZrDzAc5G7BH4zhCttC0VqmTrr0lHhpwxl8TaR1ZonqJke16fzdkbmngyn/P+o
	 DzNAuGNCQwxmNq0+dxbifBHwntuj3BF4wgJbl0uw=
Date: Tue, 25 Oct 2022 18:04:58 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Subject: Re: nscd time_t size mismatch problem
Message-ID: <Y1iHuqCmD8k1X2+w@hatter.bewilderbeest.net>
References: <Y1g/C4pinQ1tutC4@hatter.bewilderbeest.net>
 <72f37987-5f8a-99c5-bd36-5153343dcf75@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72f37987-5f8a-99c5-bd36-5153343dcf75@linaro.org>
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
Cc: openbmc@lists.ozlabs.org, libc-alpha@sourceware.org, Wayne Tung <wayne.tung@ui.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 25, 2022 at 02:13:23PM PDT, Adhemerval Zanella Netto wrote:
>
>
>On 25/10/22 16:54, Zev Weiss via Libc-alpha wrote:
>> Hello glibc devs,
>>
>> We've recently been seeing some misbehavior from nscd in OpenBMC.  It
>> manifests as lots of log messages like:
>>
>>     disabled inotify-based monitoring for file /passwd': No such file or directory
>>     stat failed for file /passwd'; will try again later: No such file or directory
>>     disabled inotify-based monitoring for file /group': No such file or directory
>>     stat failed for file /group'; will try again later: No such file or directory
>>     disabled inotify-based monitoring for file /hosts': No such file or directory
>>     stat failed for file /hosts'; will try again later: No such file or directory
>>     disabled inotify-based monitoring for file /resolv.conf': No such file or directory
>>     stat failed for file /resolv.conf'; will try again later: No such file or directory
>>
>> and so forth.  I initially assumed it was a configure-time --sysconfdir mixup, but after digging into it I found that it actually stems from a time_t size mismatch (this is a 32-bit ARM gnueabi target):
>>
>>     $ gdb -batch -ex 'pt time_t' -ex 'p sizeof(time_t)' time/time.o
>>     type = long
>>     $1 = 4
>>     $ gdb -batch -ex 'pt time_t' -ex 'p sizeof(time_t)' nscd/nscd.o
>>     type = long long
>>     $1 = 8
>>
>> The confusing log messages are thus just the result of the coincidence that sizeof(long long) - sizeof(long) == strlen("/etc"), which causes the disagreement in the layout of struct traced_file to make it look like the 'fname' member just had its directory prefix chopped off.
>>
>> In the discussion of the bug in the OpenBMC issue tracker [0], Wayne Tung (CCed) came up with the patch below, which does seem to solve the immediate problem, but if I'm understanding things right does so by just reverting nscd to a 32-bit time_t, and so I'd expect probably wouldn't be considered the "right" fix -- however I don't presently know enough about the 32/64-bit time_t transition and ensuing compatibility concerns to know what the right fix really is.  Should nscd perhaps be using __time64_t or something instead of time_t?
>
>Reverting to 32 bits time_t only means that we are postponing some potential
>failure to y2038, we really move everything to 64 bit time_t.  Could you check
>if the following patch fix it?
>
>The issue is we do build nss modules with 64 time_t, however some features
>are built on libc.so itself and in such cases we need to explicit use the
>internal __time64_t type.
>
>diff --git a/nscd/nscd.h b/nscd/nscd.h
>index 368091aef8..f15321585b 100644
>--- a/nscd/nscd.h
>+++ b/nscd/nscd.h
>@@ -65,7 +65,7 @@ typedef enum
> struct traced_file
> {
>   /* Tracks the last modified time of the traced file.  */
>-  time_t mtime;
>+  __time64_t mtime;
>   /* Support multiple registered files per database.  */
>   struct traced_file *next;
>   int call_res_init;
>

Ah, great -- after testing that out I can confirm that it appears to fix 
the problem.  Thanks!

Also, after sending that email I discovered that there's an existing 
bugzilla issue for this same problem 
(https://sourceware.org/bugzilla/show_bug.cgi?id=29402), so that can 
presumably be closed once a fix is committed.


Zev

